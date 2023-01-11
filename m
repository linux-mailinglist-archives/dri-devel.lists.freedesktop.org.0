Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD589666199
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2667910E7AC;
	Wed, 11 Jan 2023 17:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFC410E7BB;
 Wed, 11 Jan 2023 17:19:32 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-150b06cb1aeso16205040fac.11; 
 Wed, 11 Jan 2023 09:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nFU0BXnZfKrxnD8rhqEiuLHvEK2Kft/6no/g40oIuX8=;
 b=LmIoTPM6KymniFaLl4yB2kNLq4BRFFGL8YN4oUXrXG3kUsOli0oH/n6dC18AcVLkEe
 gfaqer9mpvKqN4jjg8dkHHZAbDnFTXfZVY/v1MT+y7GFAPOaA0ZZIV7KMH4VYX6YfKHD
 B2U1byBqU5T9u+T0tJumzKs3/Tcg19g0Jpg+1LL1s8clUKASElD+l4uBG1Eyv6stOpf7
 k8aLwdiIwnJ9pSzhhw8S14z49UTBnIQ7nSsmdYChqDxYSlbstOS2WJo610JKjHtz+Ym/
 OW40Bp+l2u6RK2IoKpRgaDvWVyAHHLoAb73ZkKi4SCieeg+IuPZ8Vu2EqvWqCFdjUqeO
 9+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFU0BXnZfKrxnD8rhqEiuLHvEK2Kft/6no/g40oIuX8=;
 b=ho5JJUNy3hguSwHCzizxO98/R61I/eVIKsb9DdIZ9O1mn1K9D29OOq/RWmPkh4wLYM
 rZXAsDBHSlyQgdHz5Q39W6Mvz56/1UeIsQ+t6d6S8CfDUtzjMDMAfE/P3SrO/s4lYzkY
 Ed7blEh2MDaKKuICFFCSjDy77izkHFQBHk2LC8TfjGkLZk0oNvT2EhcspKlLjw4rjXNQ
 PpukJaVdfzPyeqFF4IXTZlrbR+i5tABKZNezsERgj3IacwI9jWbqA8+qxs3j+QrW67wC
 LZnllo6o0z/ubIkkHmKQAq6KmamDTA12XKUJp4yfdpUKynBf7pFxJ77CZIDqqUsjNFYV
 bQMA==
X-Gm-Message-State: AFqh2kqXs4IbP/5NYocZuye66/nhShS5jio40jhAGkt+soFUddyC754i
 /AgyzDOWwYCLij/We/nG1VyhOGG+kofHDgRGCt3Jf7CV
X-Google-Smtp-Source: AMrXdXtvWsIpuTHVsKnOuIEiifXTzeqbxtg2d5hP0bhoNnwH7og/nMmNoDdfovFO9rBBco/XcJURLTN622pIY+6Jo6I=
X-Received: by 2002:a05:6870:970e:b0:148:3c8f:15ab with SMTP id
 n14-20020a056870970e00b001483c8f15abmr6225360oaq.46.1673457571714; Wed, 11
 Jan 2023 09:19:31 -0800 (PST)
MIME-Version: 1.0
References: <20230111153813.16051-1-tzimmermann@suse.de>
In-Reply-To: <20230111153813.16051-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Jan 2023 12:19:20 -0500
Message-ID: <CADnq5_Pkdwx7nBRdv0LrRmdeey0gziG22T2HDN-xHXOKOaTK_w@mail.gmail.com>
Subject: Re: [PATCH] drm/fb-helper: Set framebuffer for vga-switcheroo clients
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 10:38 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Set the framebuffer info for drivers that support VGA switcheroo. Only
> affects the amdgpu driver, which uses VGA switcheroo and generic fbdev
> emulation. For other drivers, this does nothing.
>
> Amdgpu's lastclose helper called vga_switcheroo_process_delayed_switch().
> But as amdgpu uses generic fbdev emulation, it's better to call the helper
> from drm_lastclose(), after the kernel client's screen has been restored.
> So all drivers and clients can benefit. Radeon and nouveau with modernized
> fbdev code are possible candidates.
>
> There was an earlier patchset to do something similar. [1]
>
> Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/amd-gfx/20221020143603.563929-1-alexander.deucher@amd.com/ # 1

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 12 ------------
>  drivers/gpu/drm/drm_fb_helper.c         |  8 ++++++++
>  drivers/gpu/drm/drm_file.c              |  3 +++
>  5 files changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 63c921c55fb9..7120b9b6e580 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1330,7 +1330,6 @@ extern const int amdgpu_max_kms_ioctl;
>
>  int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
>  void amdgpu_driver_unload_kms(struct drm_device *dev);
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>  int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>  void amdgpu_driver_postclose_kms(struct drm_device *dev,
>                                  struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index ebc6e6cbe2ab..02d636f781a2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2784,7 +2784,6 @@ static const struct drm_driver amdgpu_kms_driver = {
>             DRIVER_SYNCOBJ_TIMELINE,
>         .open = amdgpu_driver_open_kms,
>         .postclose = amdgpu_driver_postclose_kms,
> -       .lastclose = amdgpu_driver_lastclose_kms,
>         .ioctls = amdgpu_ioctls_kms,
>         .num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>         .dumb_create = amdgpu_mode_dumb_create,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 7aa7e52ca784..886739576d3d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1104,18 +1104,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>  /*
>   * Outdated mess for old drm with Xorg being in charge (void function now).
>   */
> -/**
> - * amdgpu_driver_lastclose_kms - drm callback for last close
> - *
> - * @dev: drm dev pointer
> - *
> - * Switch vga_switcheroo state after last close (all asics).
> - */
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev)
> -{
> -       drm_fb_helper_lastclose(dev);
> -       vga_switcheroo_process_delayed_switch();
> -}
>
>  /**
>   * amdgpu_driver_open_kms - drm callback for open
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 427631706128..5e445c61252d 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -30,7 +30,9 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
>  #include <linux/console.h>
> +#include <linux/pci.h>
>  #include <linux/sysrq.h>
> +#include <linux/vga_switcheroo.h>
>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_drv.h>
> @@ -1940,6 +1942,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>                                          int preferred_bpp)
>  {
>         struct drm_client_dev *client = &fb_helper->client;
> +       struct drm_device *dev = fb_helper->dev;
>         struct drm_fb_helper_surface_size sizes;
>         int ret;
>
> @@ -1961,6 +1964,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>                 return ret;
>
>         strcpy(fb_helper->fb->comm, "[fbcon]");
> +
> +       /* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
> +       if (dev_is_pci(dev->dev))
> +               vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index a51ff8cee049..314c309db9a3 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -38,6 +38,7 @@
>  #include <linux/pci.h>
>  #include <linux/poll.h>
>  #include <linux/slab.h>
> +#include <linux/vga_switcheroo.h>
>
>  #include <drm/drm_client.h>
>  #include <drm/drm_drv.h>
> @@ -460,6 +461,8 @@ void drm_lastclose(struct drm_device * dev)
>                 drm_legacy_dev_reinit(dev);
>
>         drm_client_dev_restore(dev);
> +
> +       vga_switcheroo_process_delayed_switch();
>  }
>
>  /**
> --
> 2.39.0
>
