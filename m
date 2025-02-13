Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF09A339CB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 09:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B18A10EA1F;
	Thu, 13 Feb 2025 08:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FTx4ahml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A5810EA20
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:19:34 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-2b8481ce420so221814fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 00:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739434773; x=1740039573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Az9dQ23bPGQCJsqk2rNARA3D3DTwQa8JOi+/AGn2MB0=;
 b=FTx4ahmlNac5gUB0ZEHajzNxZRb1CDlR/eSP3dwTJT+7faX6D2+DHwA7KzxmDbblUY
 8wYKvE1qMEJJWy6s5GLb2NhWq5i9EVFHDZRJHRaz4wzCZGuWvV6jL2iV2Xnuq7mR+iRZ
 2drsFMWSPzur8eRdAPorMSdcTkh/BlYmQ4wO7CWhqtS7YkPagrDY049oka40YMecszDe
 yyX2xw0eV/D7vr/yNFUnd7GD4Cy/lRu4Ck9oc9s2NX+AuFRwDKfXwiKn7ljA7e4djv5g
 beP1yD/bJ7vgCfCLuz5+lCCFiYtpmyOZhyQYQ83askKyrrSCGD6KRLMbPW5QdaSFL2eC
 xKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739434773; x=1740039573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Az9dQ23bPGQCJsqk2rNARA3D3DTwQa8JOi+/AGn2MB0=;
 b=NFNVOkMRZ1VEbLMHnYejfIIbkl3QrJrGbSgsl+nJW6kQ0F/veq+E9sYICSvNywTtxw
 sYTYVvltsP2F64EfDwPJ6l6pPvt7hbMOV3qJKW0hU7pwpkjWevhJtMlk+9w+FKAmLyTi
 7QOK37hfGx/M/SVQn+ZqdSynQ/38Vm/4PvmIsI10FgQvDWvmdPB2+YaWvyP8PSfnn5NS
 GVA+SO3zGsfoY7HJSy9MPCgsP43+0p6YaxMNWuJEjleDd+4eN1BqxJIde4rFdgEIMV/K
 AcbQIP8RMvL3aTiHGAn4TI38/WITzOZibg74A6j243/2p8xW4FqKYMoTGbn6t83aOcQ4
 qRhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVxIyNhiWp+N59TTeLMVoHjYD6uM3fZ+OD9knZ0v9k5BwdLv25Jf/u1zU0kSjaEJzCz0ymLt0H+mI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhDoZitPCodtA7IhFkFvn+SzrTI2wDj46pwwqfRsCCLwLCYeV7
 ZSM+yZjFFb86PdUvdJN2Q0E6oDrUTcSR/gZiHmb+KQtvXs1V+qIWOmmq1xrByYhKx+wuyVCRsOn
 ki/RyPReOoYiYCUJHlorU4SC9Y40pPyyTSS9OSw==
X-Gm-Gg: ASbGncuFkEL5gjWnTovxOHQ+7h/PxnjCEM0nlc8H1Cd8astfzYSZhN1MVEeSpnEzzmF
 +LVxYUoW4P/zASLeLqS8yGG3y0ke2zvAc9M6uaOovqjgTdqIZzfCs8lCUlScV0YODSILv6z5aig
 ==
X-Google-Smtp-Source: AGHT+IEYwaXtzSb6L2iPNq96UiAe3ghkX0HNZgeRMU3vnnuVEV+oTgkHvrSkTnrpbFNibYdT1xw/IZq62i2DSoq0Et4=
X-Received: by 2002:a05:6870:3c13:b0:29e:20c4:2217 with SMTP id
 586e51a60fabf-2b8f8e8f47emr1365637fac.33.1739434773165; Thu, 13 Feb 2025
 00:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com>
 <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
In-Reply-To: <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Feb 2025 09:19:21 +0100
X-Gm-Features: AWEUYZmAZ7muu4Y0CkS4aHUGrjFZdjBtSwN3vjBgPnCfnhs0YPXrZruLf1ATUM8
Message-ID: <CAHUa44FtXA8bOS1-BAGSrCFLxu_FRd2TaEtxGNdkzKua_-wNUQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
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

Hi,

On Thu, Feb 13, 2025 at 7:42=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> Hi Boris,
>
> On Thu, 13 Feb 2025 at 01:26, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > +Florent, who's working on protected-mode support in Panthor.
> >
> > Hi Jens,
> >
> > On Tue, 17 Dec 2024 11:07:36 +0100
> > Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > > Hi,
> > >
> > > This patch set allocates the restricted DMA-bufs via the TEE subsyste=
m.
> >
> > We're currently working on protected-mode support for Panthor [1] and i=
t
> > looks like your series (and the OP-TEE implementation that goes with
> > it) would allow us to have a fully upstream/open solution for the
> > protected content use case we're trying to support. I need a bit more
> > time to play with the implementation but this looks very promising
> > (especially the lend rstmem feature, which might help us allocate our
> > FW sections that are supposed to execute code accessing protected
> > content).
>
> Glad to hear that, if you can demonstrate an open source use case
> based on this series then it will help to land it. We really would
> love to see support for restricted DMA-buf consumers be it GPU, crypto
> accelerator, media pipeline etc.

I'm preparing a demo based on GStreamer to share. It helps with more
real-world examples to see that APIs etc work.

>
> >
> > >
> > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up =
the
> > > restrictions for the memory used for the DMA-bufs.
> > >
> > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restric=
ted
> > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to c=
hoose
> > > how to allocate the restricted physical memory.
> >
> > I'll probably have more questions soon, but here's one to start: any
> > particular reason you didn't go for a dma-heap to expose restricted
> > buffer allocation to userspace? I see you already have a cdev you can
> > take ioctl()s from, but my understanding was that dma-heap was the
> > standard solution for these device-agnostic/central allocators.
>
> This series started with the DMA heap approach only here [1] but later
> discussions [2] lead us here. To point out specifically:
>
> - DMA heaps require reliance on DT to discover static restricted
> regions carve-outs whereas via the TEE implementation driver (eg.
> OP-TEE) those can be discovered dynamically.
> - Dynamic allocation of buffers and making them restricted requires
> vendor specific driver hooks with DMA heaps whereas the TEE subsystem
> abstracts that out with underlying TEE implementation (eg. OP-TEE)
> managing the dynamic buffer restriction.
> - TEE subsystem already has a well defined user-space interface for
> managing shared memory buffers with TEE and restricted DMA buffers
> will be yet another interface managed along similar lines.
>
> [1] https://lore.kernel.org/lkml/mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5=
dfsqiehaxk@u67fcarhm6ge/T/
> [2] https://lore.kernel.org/lkml/CAFA6WYPtp3H5JhxzgH9=3Dz2EvNL7Kdku3EmG1a=
DkTS-gjFtNZZA@mail.gmail.com/

Thanks for the good summary. :-)

Cheers,
Jens

>
> -Sumit
>
> >
> > Regards,
> >
> > Boris
> >
> > [1]https://lwn.net/ml/all/cover.1738228114.git.florent.tomasin@arm.com/=
#t
