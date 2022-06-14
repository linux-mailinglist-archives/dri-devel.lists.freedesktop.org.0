Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF68054B58B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFF610F91F;
	Tue, 14 Jun 2022 16:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C4C112099
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:13:52 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id gl15so18169401ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CbyEd2+4O9VqxGG2bl3jFyL4gOGrqRGXaQNOu/wWVzA=;
 b=gf0FmV+wqpI3sn9odUoM/IFnN8spFbB94CfAvcBTLoSK2wGsN4f5GXSgPM+s+rXFu3
 ZBApkvh8vHXqVUSyRwM2KHsIUzdp+Ac4rpTrA2pvCH2j6bMl+K28Zmk8gUpnRdYEgjk1
 nppcC4p3ub3WRmJui55KH3LUopmJrnAuSTbvrDDwOLX9/9XLIbD251pfQAw2+b44EJBz
 ZKBvC76GWOxomUNIEcid7V5cP7/kcCpHNRGZCvXNI4qqX9BCNi2TZwHq0kQw8VmAQFwp
 Z75q38J+ULq5f6bnAo0GkZBxf+Wsh/CT55CCzC8ojsB21DWianO5qonpu2y3nb1K/Q3Z
 wxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CbyEd2+4O9VqxGG2bl3jFyL4gOGrqRGXaQNOu/wWVzA=;
 b=tDWWYaAajOwiw97VvaN4CglX65qNp+Ornr8BF0fl6ag6qFK5gCejYk31sv6aNuJxFf
 A+4hpYz1bOOx/SBZpaVw/YtX0ncG7meJ9t4fGVJsn4ABhfsD6iwKziBPY103o8I7JziX
 7qbDtSJJwDY3V+UHAPQVWM5i25L8x2odxC6NfatmiI7+41BEYbudzEgsbB3vcVdXwd/h
 C6kllQvwwqlqqm0cPgefpFzTIMXsTF43bPXSBFRcwkcfzDKf0MAYrkJNYPM8yKPSxm3P
 QrIEkAdHlMSMRiSf2Ygyl+ckTenAgfTK5BzIWCg9ibDA9Ljoy/crO5ocPDtYf7ziIRvi
 NS2g==
X-Gm-Message-State: AJIora9tbSlLjae1qPKZn2OZd8+6L9qt2TMiBuSiMpoNUXTvNeDaZLVP
 2XYW7dW8NO1TyEmNUlsYShv0sy5TZGtJ3IG/bIjtOg==
X-Google-Smtp-Source: ABdhPJyo+c6mtGwTEeLK5oBam1RetY4+mNrbMaNLe4cnvMEZvHbzw1tDzSkkH+ZqnaCyYEDxhQZ9i/+6lW/kNfp4uFE=
X-Received: by 2002:a17:907:2d87:b0:711:dd41:1e72 with SMTP id
 gt7-20020a1709072d8700b00711dd411e72mr4845306ejc.742.1655223231260; Tue, 14
 Jun 2022 09:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-20-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-20-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:13:35 +0100
Message-ID: <CAPY8ntBHDVbBCmyDr9XbnDaV7Sqt0Up5PN3UCe3Ghqe83nTJ0A@mail.gmail.com>
Subject: Re: [PATCH 19/64] drm/vc4: crtc: Switch to DRM-managed CRTC
 initialization
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The current code will call drm_crtc_cleanup() when the device is
> unbound. However, by then, there might still be some references held to
> that CRTC, including by the userspace that might still have the DRM
> device open.
>
> Let's switch to a DRM-managed initialization to clean up after ourselves
> only once the DRM device has been last closed.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 18 +++++++-----------
>  drivers/gpu/drm/vc4/vc4_drv.h  |  1 -
>  drivers/gpu/drm/vc4/vc4_txp.c  |  1 -
>  3 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index c74fa3d07561..24de4706b61a 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -205,11 +205,6 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
>         return ret;
>  }
>
> -void vc4_crtc_destroy(struct drm_crtc *crtc)
> -{
> -       drm_crtc_cleanup(crtc);
> -}
> -
>  static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
>  {
>         const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
> @@ -953,7 +948,6 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
>
>  static const struct drm_crtc_funcs vc4_crtc_funcs = {
>         .set_config = drm_atomic_helper_set_config,
> -       .destroy = vc4_crtc_destroy,
>         .page_flip = vc4_page_flip,
>         .set_property = NULL,
>         .cursor_set = NULL, /* handled by drm_mode_cursor_universal */
> @@ -1131,6 +1125,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
>         struct drm_crtc *crtc = &vc4_crtc->base;
>         struct drm_plane *primary_plane;
>         unsigned int i;
> +       int ret;
>
>         /* For now, we create just the primary and the legacy cursor
>          * planes.  We should be able to stack more planes on easily,
> @@ -1144,10 +1139,13 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
>                 return PTR_ERR(primary_plane);
>         }
>
> -       spin_lock_init(&vc4_crtc->irq_lock);
> -       drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
> -                                 crtc_funcs, NULL);
> +       ret = drmm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
> +                                        crtc_funcs, NULL);
> +       if (ret)
> +               return ret;
> +
>         drm_crtc_helper_add(crtc, crtc_helper_funcs);
> +       spin_lock_init(&vc4_crtc->irq_lock);

Moving the spin_lock_init appears to be cosmetic and unrelated, but otherwise:

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>
>         if (!vc4->hvs->hvs5) {
>                 drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
> @@ -1226,8 +1224,6 @@ static void vc4_crtc_unbind(struct device *dev, struct device *master,
>         struct platform_device *pdev = to_platform_device(dev);
>         struct vc4_crtc *vc4_crtc = dev_get_drvdata(dev);
>
> -       vc4_crtc_destroy(&vc4_crtc->base);
> -
>         CRTC_WRITE(PV_INTEN, 0);
>
>         platform_set_drvdata(pdev, NULL);
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 9a53ace85d95..fff3772be2d4 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -845,7 +845,6 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc);
>  int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
>                   const struct drm_crtc_funcs *crtc_funcs,
>                   const struct drm_crtc_helper_funcs *crtc_helper_funcs);
> -void vc4_crtc_destroy(struct drm_crtc *crtc);
>  int vc4_page_flip(struct drm_crtc *crtc,
>                   struct drm_framebuffer *fb,
>                   struct drm_pending_vblank_event *event,
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index e983ff7c5e13..f306e05ac5b2 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -383,7 +383,6 @@ static void vc4_txp_disable_vblank(struct drm_crtc *crtc) {}
>
>  static const struct drm_crtc_funcs vc4_txp_crtc_funcs = {
>         .set_config             = drm_atomic_helper_set_config,
> -       .destroy                = vc4_crtc_destroy,
>         .page_flip              = vc4_page_flip,
>         .reset                  = vc4_crtc_reset,
>         .atomic_duplicate_state = vc4_crtc_duplicate_state,
> --
> 2.36.1
>
