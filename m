Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F87C2A0D4D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 19:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A566E9E2;
	Fri, 30 Oct 2020 18:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5E76E9E0;
 Fri, 30 Oct 2020 18:22:53 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k125so3110262wmf.0;
 Fri, 30 Oct 2020 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ARdrcVUHrBt9DKbmDVSiYepaN26XrrkfqlfwcIXRf5U=;
 b=qDLvgSxe8L0r4WCsuVTvoVNVfisqE2lXIAI4V94ph4uVgopHzy/0Jxdl2W/zcG1t/M
 QHMqnJJpWSYC4bKo8/vjEoVVSmrdU1ioKkiWnrv9FIS93pNF1dFBfh/oYU9Xi6ipMSFh
 60hc4h+tTMpPXvAnE5k9OWquqyS5cYG35L9Wtl52VpSEsyRxsEI+WxNwhnPqjnywiS91
 gxMKzH38Sr5FvcZVnug+xGSadMna36h1tyOAwinohkC4+9C7F9zJYr9lYy70z6L9wsN0
 LYAxkwYMPVDRDpqjuAu8cMBr0ZCz5HkouKJJ9W6AuLEVRq5EmsSwLNvcrulzwl9b8WYJ
 /jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ARdrcVUHrBt9DKbmDVSiYepaN26XrrkfqlfwcIXRf5U=;
 b=B03wtGNyUhT5mc0mWe/DEEeK/6czITCGPn1SDoW7/i7nh1XPwEddmvsFPEgxftvZqZ
 hxBoLa7vtEul76BxjA224ZYHmk5jK0DfmT+lSo6IO7h9tludWqg5EmXNXRi2gEROOfqo
 gqnwVi7bXCvtjxhFjnoLS7UtFgpAlJylz86bZGaP8xWuRxgCC+9y1x5DYwVo+Z9yAmxA
 ir61CPBuLyrRqH6aPKPOYmQnbufDb4XzZifvH+wB1zWT5z5f233LPoFQzxHWbT2rm6Zb
 50pbl3OtQFbSFC/PlD6P2pXM+S3IemHQeMaMc2jFVjrrSO8vkF/DVBWhxQeURtPPGQhB
 AOZw==
X-Gm-Message-State: AOAM530slHAHXQwPrdTbdokSc17Ci3utKq1hLoYmVrBpbTulGTDK4ZP8
 t9Dbkc9R6aQezd06GiSSCET9ulXa4MbftK26wRY=
X-Google-Smtp-Source: ABdhPJwguv1RXDsjEa4BvdNfyM3qokNeORAvRVgZud04Do6Tvl7nNFqVw9CNtObtSnFlWd+ey+9rOM+5hOvWbMBxdaE=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr4207763wmb.56.1604082171856;
 Fri, 30 Oct 2020 11:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201030101104.2503-1-daniel.vetter@ffwll.ch>
 <20201030101104.2503-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20201030101104.2503-2-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Oct 2020 14:22:40 -0400
Message-ID: <CADnq5_OpZKuWr7qNdvSLHc3dc4+x=N3-0MwKYXca7QGnxoJKoA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm: Compile out legacy chunks from struct drm_device
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 6:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> This means some very few #ifdef in code, but it allows us to
> enlist the compiler to make sure this stuff isn't used anymore.
>
> More important, only legacy drivers change drm_device (for the
> legacy_dev_list shadow attach management), therefore this is
> prep to allow modern drivers to have a const driver struct. Which
> is nice, because there's a ton of function pointers in there.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Review-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_file.c   |  2 ++
>  drivers/gpu/drm/drm_vblank.c | 15 ++++++++++++---
>  include/drm/drm_drv.h        |  2 ++
>  3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 0ac4566ae3f4..b50380fa80ce 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -258,9 +258,11 @@ void drm_file_free(struct drm_file *file)
>                   (long)old_encode_dev(file->minor->kdev->devt),
>                   atomic_read(&dev->open_count));
>
> +#ifdef CONFIG_DRM_LEGACY
>         if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
>             dev->driver->preclose)
>                 dev->driver->preclose(dev, file);
> +#endif
>
>         if (drm_core_check_feature(dev, DRIVER_LEGACY))
>                 drm_legacy_lock_release(dev, file->filp);
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index ba7e741764aa..15e5ea436434 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -210,9 +210,12 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
>
>                 if (crtc->funcs->get_vblank_counter)
>                         return crtc->funcs->get_vblank_counter(crtc);
> -       } else if (dev->driver->get_vblank_counter) {
> +       }
> +#ifdef CONFIG_DRM_LEGACY
> +       else if (dev->driver->get_vblank_counter) {
>                 return dev->driver->get_vblank_counter(dev, pipe);
>         }
> +#endif
>
>         return drm_vblank_no_hw_counter(dev, pipe);
>  }
> @@ -430,9 +433,12 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
>
>                 if (crtc->funcs->disable_vblank)
>                         crtc->funcs->disable_vblank(crtc);
> -       } else {
> +       }
> +#ifdef CONFIG_DRM_LEGACY
> +       else {
>                 dev->driver->disable_vblank(dev, pipe);
>         }
> +#endif
>  }
>
>  /*
> @@ -1097,9 +1103,12 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
>
>                 if (crtc->funcs->enable_vblank)
>                         return crtc->funcs->enable_vblank(crtc);
> -       } else if (dev->driver->enable_vblank) {
> +       }
> +#ifdef CONFIG_DRM_LEGACY
> +       else if (dev->driver->enable_vblank) {
>                 return dev->driver->enable_vblank(dev, pipe);
>         }
> +#endif
>
>         return -EINVAL;
>  }
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index c6d17550efc9..7af220226a25 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -498,6 +498,7 @@ struct drm_driver {
>          */
>         const struct file_operations *fops;
>
> +#ifdef CONFIG_DRM_LEGACY
>         /* Everything below here is for legacy driver, never use! */
>         /* private: */
>
> @@ -512,6 +513,7 @@ struct drm_driver {
>         int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
>         void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
>         int dev_priv_size;
> +#endif
>  };
>
>  void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> --
> 2.28.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
