Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F1A5A372
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 19:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5712010E4C2;
	Mon, 10 Mar 2025 18:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ar0jJ3Ws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C781F10E4C1;
 Mon, 10 Mar 2025 18:54:27 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2ff6b9a7f91so1190885a91.3; 
 Mon, 10 Mar 2025 11:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741632867; x=1742237667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxGVCl+Faues7cvxc95q/41RjYYvmImGBSS+GmyZKh0=;
 b=Ar0jJ3Wsu7QSyT58Yy3B+jcqKEHIPVYdEYBFL90cQKEM159DVAN5axJX3JNJh08Wbl
 1bpfTKARU453VQJyx/CmGizJzH84SLw5M9J2zJ5UBOu9vPogPyWv4hVaaDSbOvAVTOhG
 fVbDb2uI73Mf75I+n2sJKVpo7HOOpCLLk8zhoZAViRO2vlG6wfVlXS0UKYwyMr+5oZpW
 B7bHUbq+anIQIoK03cPuAatJATCvvbXBs1vHoCUedqmno/vf1b/YSOIM0M1cH8cC0fyV
 e/pxc7O7LrOFSYOSEltIRHsEtR/Xog5pu0T8I+JlkkZuFeuPAmPrC2FA29UBsjkX7WsU
 0UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741632867; x=1742237667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kxGVCl+Faues7cvxc95q/41RjYYvmImGBSS+GmyZKh0=;
 b=eOXH0AC7AH3CEgsCroeVz7Zlc44nklu5hHnT4v44McsIqr1GOXONp413sUlpWaenaa
 gOstuBIfr4Rk6Mz/z3jxM6qez6gVNCwUMl49T0VUq0CoOsTbYqPlH3ESAneGWjEli21N
 PLNRlFKMpC50UJv9DTNdm8Se4mdh0kZmHKzEdAqfXL8hLw2jPrrN/1pOCIKUl80SvrEQ
 Kkk3Jr0csqVW2j61qWFimNotY8yza+L1rRqbq0F0Q4Zhf4hmK+Ws8CBwuTo11sexUU37
 1hifzsciDWK09n/gmK4k2rrEexprd8/knqe0JqLqODd/OBZfEnbiZss+xhY4khjIYoIa
 5iOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsY6y+q87PXbb2ARdnwCZo4U1v2rM3YzMJTXfyNGiEbNs8SM+oUhrh5Nav9B0ph7K/HAId+9Gm@lists.freedesktop.org,
 AJvYcCXZnvhWRSCbbXZesoWVPqf8p2Tx00nNhqixE8Mn2xMuKrC88ngdbD9OoHUoEGzVZ6DmNPUV/K/TKfGF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHEAgjdoa1mU4x0xGzG+5e/Ir/rllmKGasJayu3J4m7zrMsgLo
 EgF5A9hUU9yJaiwfH3y1W4crcCKUTnWzOuJDIT6NjZnWhs89t30DwvI4VKKoOBgn2IsM6dOvIq9
 CpR2HxkfuaxIazatdIAfYh7LiWVc=
X-Gm-Gg: ASbGncvfG8qKVg+oZEqyeRKmbtn+s7lhK3zN07MMmR//3yH1xqjUdWnOY0bNk7OyhWX
 lJq9H5PhatNbPO0JtggQ4xfC806ogNuU1FWo93sacFH00PSpH+iAA0MWUtxjkW6pAOCPb8wnyJO
 S8Nh8eqbUPqwn3qGh7QMotpwVgmQ==
X-Google-Smtp-Source: AGHT+IGMG6tNffXX/ec7iRvcQJXp2a6gFwyUvHgDcQJa2LTBWDElhXw8oi+8O7IN2mjhGprkF5y7dERbY0ZX3zUBdgA=
X-Received: by 2002:a17:90b:1d84:b0:2ff:4be6:c5bd with SMTP id
 98e67ed59e1d1-300a57a7d5emr5888384a91.8.1741632866983; Mon, 10 Mar 2025
 11:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250225010221.537059-1-andrealmeid@igalia.com>
 <334ebbe1-6897-4946-b64c-d7d85cae765f@amd.com>
In-Reply-To: <334ebbe1-6897-4946-b64c-d7d85cae765f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Mar 2025 14:54:14 -0400
X-Gm-Features: AQ5f1JoPVqOBfA9hLjv2sfz1bgOjEfAMoGJVkI3NKzv8T93iZQ1Y115X0mIXh4Q
Message-ID: <CADnq5_OVg50R6fSMNPWf=8OT7fsiZDQZcwkiwcmJ36v0nZ6yBw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: Trigger a wedged event for ring reset
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, siqueira@igalia.com
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

Applied.  Thanks


On Tue, Mar 4, 2025 at 4:29=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 25.02.25 um 02:02 schrieb Andr=C3=A9 Almeida:
> > Instead of only triggering a wedged event for complete GPU resets,
> > trigger for ring resets. Regardless of the reset, it's useful for
> > userspace to know that it happened because the kernel will reject
> > further submissions from that app.
> >
> > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Sorry for the delay, have been on sick leave for nearly two weeks.
>
> Regards,
> Christian.
>
> > ---
> > v3: do only for ring resets, no soft recoveries
> > v2: Keep the wedge event in amdgpu_device_gpu_recover() and add and
> >     extra check to avoid triggering two events.
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_job.c
> > index 698e5799e542..760a720c842e 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > @@ -150,6 +150,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(=
struct drm_sched_job *s_job)
> >                       if (amdgpu_ring_sched_ready(ring))
> >                               drm_sched_start(&ring->sched, 0);
> >                       dev_err(adev->dev, "Ring %s reset succeeded\n", r=
ing->sched.name);
> > +                     drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE=
_RECOVERY_NONE);
> >                       goto exit;
> >               }
> >               dev_err(adev->dev, "Ring %s reset failure\n", ring->sched=
.name);
>
