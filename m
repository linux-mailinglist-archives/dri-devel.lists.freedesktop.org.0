Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230C7270389
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 19:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CB06ED5C;
	Fri, 18 Sep 2020 17:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E746ED57;
 Fri, 18 Sep 2020 17:50:36 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id 77so2138393uaj.2;
 Fri, 18 Sep 2020 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j6MQMOCfJyVDiQhR67zLDrwoBhYX2gu7M0QOxH0SCkQ=;
 b=XEZ1i3HNCzKzChGpw8Ey9A7AXAcnUMMQ95M3lWnY1zALpjYp5Akb0Lrs+Tov9W/6T5
 7egxzautNbtdMfkOVQuTm9zRAEnalHSrupE1SG/FS4N+Cn3U1atjmOXx7M1NA0JKk2m+
 jkR9//2o0L4z98CeYiPVtmtNs02xM80xzgXY1zupXC+6FK6xExp6Q3XN6XDrVFcvwc50
 R6YLj6oCbwLR+3GWZ8QTxVPLlwKL9S3/nOHzPL+TROBSgcPyHlS6DCktmVXxXH+UMfyI
 P0yufi+dcNPSHXAbuGPWP2i/aZDvBG9szi05ZUPj/2In/4pFA8Sgwv90sZaKM56Asap5
 QrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6MQMOCfJyVDiQhR67zLDrwoBhYX2gu7M0QOxH0SCkQ=;
 b=psiXwjsI8QJ3CPyR0u/VWlmV4cLsX7ll0/0+ysjmidgRiNQQ0LdZNyUcLRnz+/gvw8
 6CelI69hu/j0/aS1NGiQQj3lKflSPnlG2t12p3mdJ5h51rUpnb6s0oX2NoKj7qoaObJz
 ko4gnMvZ278hWhl3yxZQPmOG+ebo6XJ0pau803SN5UbE4zCfMrC3PTCQFWJjESLPDF1u
 uaa6Ws2wHuQWXSBJF7UumWgmZHwEXOAeGbroqVTv3jwoP5jwcD8LnMNZ/WYNG6PCauDd
 UxM6568J7baIJhKGQuo83YcmBXaP4XRZTBQGWyp/qURpROhOfQQetrGSxWEKdkOnV8d1
 rC6Q==
X-Gm-Message-State: AOAM5331EfAALiiPIoCe4R+SvO33YRTFKDKsBgNnmKezBFApj+xTTEw1
 nDY7KYzc5eLwUWmhbYEImMaJxxQu9UTVgVGAUZo=
X-Google-Smtp-Source: ABdhPJxIyhD3alkrYYRrXaag3/UwXNoEE0f58CoHzVUSHT5nxmXCt6hrB6ECxvoJZ7YwhkbsaZ803DmYr6JkGv4vjbk=
X-Received: by 2002:a9f:2237:: with SMTP id 52mr18335667uad.141.1600451435724; 
 Fri, 18 Sep 2020 10:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
 <20200918132505.2316382-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20200918132505.2316382-3-daniel.vetter@ffwll.ch>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 18 Sep 2020 18:50:09 +0100
Message-ID: <CAM0jSHOsowOK2Vytfv4MWVTToFs-6pShMyoZy1Or90zZysH_gg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/i915/selftests: align more to real device
 lifetimes
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Sep 2020 at 14:25, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> The big change is device_add so that device_del can auto-cleanup
> devres resources. This allows us to use devm_drm_dev_alloc, which
> removes the last user of drm_dev_init.
>
> v2: Rebased
>
> v3: use devres_open/release_group so we can use devm without real
> hacks in the driver core or having to create an entire fake bus for
> testing drivers. Might want to extract this into helpers eventually,
> maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.
>
> v4:
> - Fix IS_ERR handling (Matt)
> - Delete surplus put_device() in mock_device_release (intel-gfx-ci)
>
> Cc: Matthew Auld <matthew.william.auld@gmail.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (v3)
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  .../gpu/drm/i915/selftests/mock_gem_device.c  | 44 +++++++++++--------
>  1 file changed, 25 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index ac600d395c8f..816f9af15fb3 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -79,8 +79,6 @@ static void mock_device_release(struct drm_device *dev)
>
>  out:
>         i915_params_free(&i915->params);
> -       put_device(&i915->drm.pdev->dev);
> -       i915->drm.pdev = NULL;
>  }
>
>  static struct drm_driver mock_driver = {
> @@ -128,12 +126,6 @@ struct drm_i915_private *mock_gem_device(void)
>         pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
>         if (!pdev)
>                 return NULL;
> -       i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
> -       if (!i915) {
> -               kfree(pdev);
> -               return NULL;
> -       }
> -
>         device_initialize(&pdev->dev);
>         pdev->class = PCI_BASE_CLASS_DISPLAY << 16;
>         pdev->dev.release = release_dev;
> @@ -144,8 +136,29 @@ struct drm_i915_private *mock_gem_device(void)
>         /* HACK to disable iommu for the fake device; force identity mapping */
>         pdev->dev.iommu = &fake_iommu;
>  #endif
> +       err = device_add(&pdev->dev);
> +       if (err) {
> +               kfree(pdev);
> +               return NULL;
> +       }
> +
> +       if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> +               device_del(&pdev->dev);
> +               return NULL;
> +       }
> +
> +       i915 = devm_drm_dev_alloc(&pdev->dev, &mock_driver,
> +                                 struct drm_i915_private, drm);
> +       if (IS_ERR(i915)) {
> +               pr_err("Failed to allocate mock GEM device: err=%d\n", err);

err = PTR_ERR(i915)

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
