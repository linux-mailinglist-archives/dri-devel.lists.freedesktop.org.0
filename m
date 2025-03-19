Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9088BA69481
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 17:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E340A10E546;
	Wed, 19 Mar 2025 16:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QKSki44T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA4510E544;
 Wed, 19 Mar 2025 16:15:48 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2240b4de10eso19951085ad.1; 
 Wed, 19 Mar 2025 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742400948; x=1743005748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tpcB9t6A6KxaND4R+weRblu7REH8HLN/jg/pD41KDJ0=;
 b=QKSki44T0cifz0WM0R7OM9CiYXZTLX7XuqdgIyr4c10a7aLfjaCeEg0CY5beTVjr44
 AcP+zUNHnjtaFTWKhRq6iiYCW5bWfOOH0Vugf6FWQolxjq03l10x1OG9PP4MLNFJk40l
 5kOeNAzg8JBCRpd1A7xcja21BSPbfvR1HIvkwHDp7U31DvkfsKy04dxQAoJTHUqG1YO+
 8WYsOn74SzvGy9qWKMhi9ENsJsBKfuqnaXLiT2CyA+hcM2fWhob1vhTvw+MB0luce3ZP
 Ilo4CGyBG9BoW1ULue0lr0vh5apoNGZzhH/abOfbfhBQfLFQr84LQcMnsY+IORlZdLss
 RXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742400948; x=1743005748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tpcB9t6A6KxaND4R+weRblu7REH8HLN/jg/pD41KDJ0=;
 b=Oq8ktNzXG1T7jmJk3bOF9Oa1HZi9K68YIEAWyJGPzi4sUNiTB5go9j4W3b/NRPmbuu
 oIjQhHTErVVQoOAMKQ50u0z0e1txAR9VjCbm4w/upeG7c/ucD7qBFO5X3tgbdF39pDg1
 sJ4BnsaM7A8ITNb4OwlWkhCkoACpgSdCRTHMYLx1drzHVWzU/oNA9FNpU8N4LZdKZyQu
 lZyFFSiLXq55nkBmObhJL9wBP8iOd2RNakxIkc1dyONE8pI7/u8lrsJ6y8HNrvYXkq9u
 +Q9emmttgI2McPovCwfhiS1+KD7P3r9fqhQyOFdlaHfu0lsxfjD6XOaFwSVHmTk6UPWI
 Y8Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvUbdcnfWCUKnbDNIsj6YdcfYQ9ScgEoQKgXmAs5M/nlDNuHZdEktEVNV2kMnhlZyNbrOZ95/bUJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjT80XngnGYsIylgg2dD4EfVDKr8MGnuTO6cfAhGabGryN+pzc
 a+Ym7vuisoGVJU5hI2dvexex90X5e69Nhg5nnXAWKk6fDnjMk9V291c4tGVGBzh6GNOm/Hd7RVV
 G4mnGTq0Q499CukDmq7tPGicivrU=
X-Gm-Gg: ASbGnctFZfwgoLLdLZRN0TT6tHlZ2luMAYxb0Nxt7mYs0dDcrZYw4HYrr4E+AMCbwN7
 lOXqI01oeHV4AE4Kww0bhhJLnXswaKEojIwkh21KWcguO2/ZxX8SS/t10OAsthilYU+WEryU1f7
 4igfP0YB8NuOd01lnWHip6xgScew==
X-Google-Smtp-Source: AGHT+IHWf/Je75FDADPOS0gdYyM/GsQweQ6GrhMRjO/NYZMBlz6LRlFzJmEWomdQ90VHrVYogY6aTxo+mtD5MpEKp0A=
X-Received: by 2002:a17:902:f686:b0:215:a96d:ec36 with SMTP id
 d9443c01a7336-2264c5e1a84mr15053705ad.5.1742400947817; Wed, 19 Mar 2025
 09:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-17-robdclark@gmail.com>
In-Reply-To: <20250319145425.51935-17-robdclark@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 12:15:36 -0400
X-Gm-Features: AQ5f1JrFZ7qplWix08QqXWgrDRrXseMvNo6DIRzsT4jHmQ6Da3MfyWiADCs7_mc
Message-ID: <CACu1E7FduhsXY22BKpjt5WcnAcVtGu01eUiLc9T47OUR+yp_0Q@mail.gmail.com>
Subject: Re: [PATCH v2 16/34] drm/msm: Mark VM as unusable on faults
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Wed, Mar 19, 2025 at 10:55=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If userspace has opted-in to VM_BIND, then GPU faults and VM_BIND errors
> will mark the VM as unusable.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
>  drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
>  3 files changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.=
h
> index acb976722580..7cb720137548 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -82,6 +82,23 @@ struct msm_gem_vm {
>
>         /** @managed: is this a kernel managed VM? */
>         bool managed;
> +
> +       /**
> +        * @unusable: True if the VM has turned unusable because somethin=
g
> +        * bad happened during an asynchronous request.
> +        *
> +        * We don't try to recover from such failures, because this impli=
es
> +        * informing userspace about the specific operation that failed, =
and
> +        * hoping the userspace driver can replay things from there. This=
 all
> +        * sounds very complicated for little gain.
> +        *
> +        * Instead, we should just flag the VM as unusable, and fail any
> +        * further request targeting this VM.
> +        *
> +        * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
> +        * situation, where the logical device needs to be re-created.
> +        */
> +       bool unusable;
>  };
>  #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 9731ad7993cf..9cef308a0ad1 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -668,6 +668,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void=
 *data,
>         if (args->pad)
>                 return -EINVAL;
>
> +       if (to_msm_vm(ctx->vm)->unusable)
> +               return UERR(EPIPE, dev, "context is unusable");
> +
>         /* for now, we just have 3d pipe.. eventually this would need to
>          * be more clever to dispatch to appropriate gpu module:
>          */
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index 503e4dcc5a6f..4831f4e42fd9 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work=
)
>
>         /* Increment the fault counts */
>         submit->queue->faults++;
> -       if (submit->vm)
> -               to_msm_vm(submit->vm)->faults++;
> +       if (submit->vm) {
> +               struct msm_gem_vm *vm =3D to_msm_vm(submit->vm);
> +
> +               vm->faults++;
> +
> +               /*
> +                * If userspace has opted-in to VM_BIND (and therefore us=
erspace
> +                * management of the VM), faults mark the VM as unusuable=
.  This
> +                * matches vulkan expectations (vulkan is the main target=
 for
> +                * VM_BIND)

The bit about this matching Vulkan expectations isn't exactly true.
Some Vulkan implementations do do this, but many will also just ignore
the fault and try to continue going, and the spec allows either. It's
a choice that we're making.

Connor

> +                */
> +               if (!vm->managed)
> +                       vm->unusable =3D true;
> +       }
>
>         get_comm_cmdline(submit, &comm, &cmd);
>
> --
> 2.48.1
>
