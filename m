Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951997FAC34
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CFC10E310;
	Mon, 27 Nov 2023 21:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1167C10E310
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:05:13 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1f9e0e44fecso2322866fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701119112; x=1701723912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o2e77o6BsTb6aIyv2kRvbLtFuZyDoiv9/85RH1OGCOQ=;
 b=RKbU4RDVTGSjyEUK+gbxAFGZmtUK1FLKu89xjKvu9wHq2wIY9NTUKsHf8jsRKB78PC
 8ResAFakAJ5CffJVadhe9OYixDJ4oTvWG+AC6YmJoQxboXI5tgaBKP8oiWUozREXTw8U
 3GcLzKgHAlMI039+Iz1azWemQLMHF+mN7BcBvjZo7xkM4qtNhYt1QI861r1AtxkdOa3x
 odeHfl61JT1wLRNSgjyfmMGq4NlBx3tLWwfm/I/CfMRTe1+qR/b+7LI8mfirX0MnfyRU
 J1r22njRRowpVtdmEMmU+XGuOHWwrSL+ZTAw8EBg1WMMy4nB6UNJ2dmxXOlk12GyM3+b
 uwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701119112; x=1701723912;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o2e77o6BsTb6aIyv2kRvbLtFuZyDoiv9/85RH1OGCOQ=;
 b=uKF3an8Y/PXjUkeMbI+y2lhBWxo1kbZyzst9ItBW4A1g0hY2VIl5FZY0dk95YrL/6t
 tdhq1ikxenh4bHeoduLNC/InrEpZ36Do9lO4lq/lYiqsLFuf9FWx2QIFOpYpXpKEVeNb
 zISS7Mgs3kOuQ2uaEHLbOb4OJJOnqtb13ZGjIiB1LIhK9coO6kSk0U/OshDu/2fqFahG
 iUlpxy0cAcoWxGaRYJyqVI+/VZ+zkvOYmdlYSUMHrd+aYeVsfgpGMr9hDA1vw8c0eJXQ
 5x6Pn3NEwZ5HVnJqxY+g367SwXX+IC4jV2HJkkRMwj7RYsav6haflmKwc/C6AFCFQP3R
 QaLQ==
X-Gm-Message-State: AOJu0YyGW/Z2hQVRn/nfTTG81As+ZPEhDtugnw6JE78D/CzJKXPfIoqk
 HKBH6kxs03uHMj1PK+9QhwcJXksMcysGA+7RkhQ=
X-Google-Smtp-Source: AGHT+IFI9RIbHQ8dmcGup71lD6MBeaTVTRa4yE9RRBAktae8HyXniZIJz0sV4Rh4/3+OzNfXNm+DGfU+dEY7NRoJBok=
X-Received: by 2002:a05:6870:5587:b0:1fa:3699:3bbc with SMTP id
 qj7-20020a056870558700b001fa36993bbcmr9009338oac.41.1701119112157; Mon, 27
 Nov 2023 13:05:12 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-10-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-10-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:05:01 -0500
Message-ID: <CADnq5_Oce7bBLkL7mJgcuiMvoPCs9qgT84cT1DoqOG2tw8pMeg@mail.gmail.com>
Subject: Re: [PATCH 09/14] drm: Remove the legacy DRM_IOCTL_MODESET_CTL ioctl
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, cai.huoqing@linux.dev, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> DRM drivers with user-space mode setting have been removed in Linux
> v6.3. [1] Now remove the ioctl entry points for these drivers. Invoking
> any of the ioctl ops will unconditionally return -EINVAL to user space.
>
> Invoking DRM_IOCTL_MODESET_CTL is different from the other legacy
> ioctl ops as it returns 0 even without CONFIG_DRM_LEGACY set. From the
> original commit 29935554b384 ("drm: Disallow DRM_IOCTL_MODESET_CTL for
> KMS drivers") it is not apparent how or why the operation differs from
> the others. It is likely just an oversight in commit 61ae227032e7
> ("drm: allow removal of legacy codepaths (v4.1)"), which allowed
> disabling leagacy ioctls in the first place. Still keep this removal
> separate from the other ioctls to allow an easy revert, if necessary.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.freedesktop.org/series/111602/ # [1]

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_internal.h |  2 -
>  drivers/gpu/drm/drm_ioctl.c    |  2 -
>  drivers/gpu/drm/drm_vblank.c   | 82 ----------------------------------
>  3 files changed, 86 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index b12c463bc4605..a538a48c7d952 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -117,8 +117,6 @@ void drm_handle_vblank_works(struct drm_vblank_crtc *=
vblank);
>  /* IOCTLS */
>  int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>                           struct drm_file *filp);
> -int drm_legacy_modeset_ctl_ioctl(struct drm_device *dev, void *data,
> -                                struct drm_file *file_priv);
>
>  /* drm_irq.c */
>
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index e6c32f76c7452..9c6326b908e74 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -585,8 +585,6 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
>
>         DRM_IOCTL_DEF(DRM_IOCTL_WAIT_VBLANK, drm_wait_vblank_ioctl, DRM_U=
NLOCKED),
>
> -       DRM_IOCTL_DEF(DRM_IOCTL_MODESET_CTL, drm_legacy_modeset_ctl_ioctl=
, 0),
> -
>         DRM_IOCTL_DEF(DRM_IOCTL_UPDATE_DRAW, drm_noop, DRM_AUTH|DRM_MASTE=
R|DRM_ROOT_ONLY),
>
>         DRM_IOCTL_DEF(DRM_IOCTL_GEM_CLOSE, drm_gem_close_ioctl, DRM_RENDE=
R_ALLOW),
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 877e2067534fa..a11f164b2384f 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1574,88 +1574,6 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc=
)
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_restore);
>
> -static void drm_legacy_vblank_pre_modeset(struct drm_device *dev,
> -                                         unsigned int pipe)
> -{
> -       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> -
> -       /* vblank is not initialized (IRQ not installed ?), or has been f=
reed */
> -       if (!drm_dev_has_vblank(dev))
> -               return;
> -
> -       if (drm_WARN_ON(dev, pipe >=3D dev->num_crtcs))
> -               return;
> -
> -       /*
> -        * To avoid all the problems that might happen if interrupts
> -        * were enabled/disabled around or between these calls, we just
> -        * have the kernel take a reference on the CRTC (just once though
> -        * to avoid corrupting the count if multiple, mismatch calls occu=
r),
> -        * so that interrupts remain enabled in the interim.
> -        */
> -       if (!vblank->inmodeset) {
> -               vblank->inmodeset =3D 0x1;
> -               if (drm_vblank_get(dev, pipe) =3D=3D 0)
> -                       vblank->inmodeset |=3D 0x2;
> -       }
> -}
> -
> -static void drm_legacy_vblank_post_modeset(struct drm_device *dev,
> -                                          unsigned int pipe)
> -{
> -       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> -
> -       /* vblank is not initialized (IRQ not installed ?), or has been f=
reed */
> -       if (!drm_dev_has_vblank(dev))
> -               return;
> -
> -       if (drm_WARN_ON(dev, pipe >=3D dev->num_crtcs))
> -               return;
> -
> -       if (vblank->inmodeset) {
> -               spin_lock_irq(&dev->vbl_lock);
> -               drm_reset_vblank_timestamp(dev, pipe);
> -               spin_unlock_irq(&dev->vbl_lock);
> -
> -               if (vblank->inmodeset & 0x2)
> -                       drm_vblank_put(dev, pipe);
> -
> -               vblank->inmodeset =3D 0;
> -       }
> -}
> -
> -int drm_legacy_modeset_ctl_ioctl(struct drm_device *dev, void *data,
> -                                struct drm_file *file_priv)
> -{
> -       struct drm_modeset_ctl *modeset =3D data;
> -       unsigned int pipe;
> -
> -       /* If drm_vblank_init() hasn't been called yet, just no-op */
> -       if (!drm_dev_has_vblank(dev))
> -               return 0;
> -
> -       /* KMS drivers handle this internally */
> -       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
> -               return 0;
> -
> -       pipe =3D modeset->crtc;
> -       if (pipe >=3D dev->num_crtcs)
> -               return -EINVAL;
> -
> -       switch (modeset->cmd) {
> -       case _DRM_PRE_MODESET:
> -               drm_legacy_vblank_pre_modeset(dev, pipe);
> -               break;
> -       case _DRM_POST_MODESET:
> -               drm_legacy_vblank_post_modeset(dev, pipe);
> -               break;
> -       default:
> -               return -EINVAL;
> -       }
> -
> -       return 0;
> -}
> -
>  static int drm_queue_vblank_event(struct drm_device *dev, unsigned int p=
ipe,
>                                   u64 req_seq,
>                                   union drm_wait_vblank *vblwait,
> --
> 2.42.1
>
