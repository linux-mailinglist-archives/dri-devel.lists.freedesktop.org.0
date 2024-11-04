Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F5A9BC021
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 22:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAF910E4D6;
	Mon,  4 Nov 2024 21:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e8HoC5ul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1AE10E4D6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 21:32:59 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-290d8d5332cso2248198fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 13:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730755979; x=1731360779; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1UdXh3QGrojvYn/PvZkSJCGhffD6yP8+nq2lAoMAY4=;
 b=e8HoC5ulFXexqnZQ230YqGRrpWOiA7quHw/5NRAYqC/M+k/AYSPBSUAn4iXbT7K8XG
 rzHdb+60K+O6yDBsuQmpLLqew3UmxRnYR8dl8a5UwnEjOBXIrn3mOkLAIxEyEE9l/wa1
 SBDHgF8Yj5jqxQ0rsq0N9V9rBbrXD9kgh9wa9H/4L6WnCuTN4dxYnIpFiWwn+3NOu6wS
 MOhfLgSgNxLtByAk2KJzeZphqlIFe6ZEkYUghivv422aCWVNVagagezbFML4gyduJxM/
 trzZuwjmTd24ntvvsrSocElPMJfySURbnj0hXb62FxYVTpzG+Vm/7q5RWmBoDzImzb68
 A+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730755979; x=1731360779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1UdXh3QGrojvYn/PvZkSJCGhffD6yP8+nq2lAoMAY4=;
 b=jFh97dIHblM4nIWOtNCYOLsNmUzf/De/whwkKSXdAXUezDokeBjOhRpHKWlc1Sss2f
 62cOXKZvsIhXKo9/WzxjGgCMeqMSCDVYpv1ygI3Z/N9QjsgOnVGJk7Ih2nCguhv1YwHC
 fpSJaHtN2iKj0TV+yqSbGFKhaPcUtaNsJkI5jY+tNSzRvelKQHqH6HuBluvrhMIiqytQ
 mKvgAyX+54g6nRFcNosxUVNXs/JuXEdIW653I/evdEnFPDhtI6oGog1B/uZ7AZsc4uuN
 ugj7B/Ttldxy6o8vySqY6h8gdVQ8xJ5HMcehayAKEkjyb16lP3AiL0c10I9SxHvVlqE5
 Vo9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXJc9ISHpbM8N8+QWmFPugJBICYbuIqkSaStn+K4PilGHW8exbhGLINDHaXgKoxw65RS0DSlXgoG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYLHS1HQdj5YVIdqLbIWmHLPT5RRH1b5vRxR0MDnEcpnNvTM2O
 vCDfcxL5aiM3a00wYBLcxvxsBsq6ab8ikVY5zzLTXKsd6J7rsLpVFv2yQYTKMnDxUZnr1i8Isqp
 HTuwVdWnWGPabsqcsY+cK2nzqw1Q=
X-Google-Smtp-Source: AGHT+IFK3CeAWVIObRVA9l5d+IhjTKCdC4i+suueNNsZrr3AEAGUzBUGQaXAmz9pLenBA2PkfLrnM6NH5LAkwESnAgA=
X-Received: by 2002:a05:6871:50c2:b0:27b:4f51:d73a with SMTP id
 586e51a60fabf-2949ee2f1d0mr11760913fac.21.1730755978600; Mon, 04 Nov 2024
 13:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20241022161825.228278-1-olvaffe@gmail.com>
 <900f8658-726c-4034-90ff-398e6c57ec47@amd.com>
 <CAPaKu7QwSq7a-ipSOdETFEBGMu4J4ud1SqxDfPp8bNMjCMM5RQ@mail.gmail.com>
In-Reply-To: <CAPaKu7QwSq7a-ipSOdETFEBGMu4J4ud1SqxDfPp8bNMjCMM5RQ@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 4 Nov 2024 13:32:47 -0800
Message-ID: <CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/syncobj: ensure progress for syncobj queries
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: boris.brezillon@collabora.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Chunming Zhou <david1.zhou@amd.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 faith.ekstrand@collabora.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 22, 2024 at 10:24=E2=80=AFAM Chia-I Wu <olvaffe@gmail.com> wrot=
e:
>
> On Tue, Oct 22, 2024 at 9:53=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 22.10.24 um 18:18 schrieb Chia-I Wu:
> > > Userspace might poll a syncobj with the query ioctl.  Call
> > > dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
> > > true in finite time.
> >
> > Wait a second, just querying the fence status is absolutely not
> > guaranteed to return true in finite time. That is well documented on th=
e
> > dma_fence() object.
> >
> > When you want to poll on signaling from userspace you really need to
> > call poll or the wait IOCTL with a zero timeout. That will also return
> > immediately but should enable signaling while doing that.
> >
> > So just querying the status should absolutely *not* enable signaling.
> > That's an intentional separation.
> I think it depends on what semantics DRM_IOCTL_SYNCOBJ_QUERY should have.
>
> If DRM_IOCTL_SYNCOBJ_QUERY is mainly for vulkan timeline semaphores,
> it is a bit heavy if userspace has to do a
> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT before a query.

I filed a Mesa issue,
https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094, and Faith
suggested a kernel-side fix as well.  Should we reconsider this?
