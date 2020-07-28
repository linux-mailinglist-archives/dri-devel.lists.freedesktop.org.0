Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0635E230DD3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 17:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F796E34D;
	Tue, 28 Jul 2020 15:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2516E348
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:30:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f1so18172293wro.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+/MweqE4fo3ies98OuOCD9mQ9+9iVlg+rECmf+irmFA=;
 b=I5twUgwrgMu2P8NRQJTFMtovKxG8fbPMYuB45pLfXPR7g2n7UiK4QtthPVAUUXZgtT
 wzn4Cu+VNxVUsHmEFFmnvhwMUkbOkuhJcV5CCdQatVLfpxfrwMYweN6X9bzcTILiBrml
 qbpHHZAWYMp3qvfAkx+9YIEokB/xeHr8RZYuNpP9VHT1EtNctMi0CToCwKER1KiyjowS
 BFjUYBfcEZwZW+wG0tQwiDr9dHVdzfoVYGFPyw8iKwee3z5W2/xpSkKZi2OgqVu3+APs
 lh8Mhiax7CC2akub6VPEWAXc5S2yarchllUfHvyTBswnsW7eD0nozMyGkGqwkwst+Rjh
 F67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+/MweqE4fo3ies98OuOCD9mQ9+9iVlg+rECmf+irmFA=;
 b=rolgDaqw2TGF3hoiz7ahS9QeJKgUuAGKtukKvPZ8a6FdOVGypSx7KJRq+qQ4zarrgv
 TQ/SAHjRq7lO37HwjbUM53U32MuBivRyTWna+uWQEguVIP9kAj3At39iwkeWeyLW0ivs
 SGoruL8mUpuia5G6c8/zKraTFiNIL7pFJt4tGwYpCU9/AxIHOvx4OUbL10Vg0nuqB26L
 8SEwW4SjUuFEO+M39s1Eo+WIBiFVcTV/2PSnSslcR5GRRL5uVMpkeDZnIyex54+fskJA
 hoP7EMu7Gybv97VLR70BqZWmJLimdt58KzO3oMRgbsS6/7dQ5OAQr9OS5MqZSZ6s9lQS
 58zw==
X-Gm-Message-State: AOAM5317kLJ/LfZUMTNeR5PF02GyQ923xtfvMnnhLvMraA9IxegLlER+
 jqZFcHXLSzEluuebFJ8s/UPY9b7LQGw3R853RtrA4w==
X-Google-Smtp-Source: ABdhPJxvvieBfVuOSjh3FV/8raIvobRVmuPFlSewQwflYLjB304mWmC3gwGeRCiiEq8XJ6CMCONtTG7tM35J4cczRdE=
X-Received: by 2002:a5d:5383:: with SMTP id d3mr18473386wrv.42.1595950232724; 
 Tue, 28 Jul 2020 08:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <90c53367b289e9c0f9eeb97794a8d3b08d813884.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <90c53367b289e9c0f9eeb97794a8d3b08d813884.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 16:30:16 +0100
Message-ID: <CAPY8ntB3eeqqz0hPSfHiJpKs9sJpU5uN5GzLsqmhtxrD0i6TJg@mail.gmail.com>
Subject: Re: [PATCH v4 77/78] drm/vc4: drv: Support BCM2711
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:44, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BCM2711 has a reworked display pipeline, and the load tracker needs
> some adjustement to operate properly. Let's add a compatible for BCM2711

s/adjustement/adjustment

> and disable the load tracker until properly supported.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_drv.c   |  1 +-
>  drivers/gpu/drm/vc4/vc4_drv.h   |  3 ++-
>  drivers/gpu/drm/vc4/vc4_kms.c   | 42 +++++++++++++++++++++++-----------
>  drivers/gpu/drm/vc4/vc4_plane.c |  5 ++++-
>  4 files changed, 38 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 9567d1019212..f1a5fd5dab6f 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -372,6 +372,7 @@ static int vc4_platform_drm_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id vc4_of_match[] = {
> +       { .compatible = "brcm,bcm2711-vc5", },
>         { .compatible = "brcm,bcm2835-vc4", },
>         { .compatible = "brcm,cygnus-vc4", },
>         {},
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 501a48a714d3..8c8d96b6289f 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -200,6 +200,9 @@ struct vc4_dev {
>
>         int power_refcount;
>
> +       /* Set to true when the load tracker is supported. */
> +       bool load_tracker_available;
> +
>         /* Set to true when the load tracker is active. */
>         bool load_tracker_enabled;
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 7c8a87339959..ae479f988666 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -532,6 +532,9 @@ static int vc4_load_tracker_atomic_check(struct drm_atomic_state *state)
>         struct drm_plane *plane;
>         int i;
>
> +       if (!vc4->load_tracker_available)
> +               return 0;
> +
>         priv_state = drm_atomic_get_private_obj_state(state,
>                                                       &vc4->load_tracker);
>         if (IS_ERR(priv_state))
> @@ -681,10 +684,14 @@ int vc4_kms_load(struct drm_device *dev)
>         struct vc4_load_tracker_state *load_state;
>         int ret;
>
> -       /* Start with the load tracker enabled. Can be disabled through the
> -        * debugfs load_tracker file.
> -        */
> -       vc4->load_tracker_enabled = true;
> +       if (!of_device_is_compatible(dev->dev->of_node, "brcm,bcm2711-vc5")) {

Is it better to look up the compatible string, or pass something via
the .data element of the of_device_id table? Probably down to personal
preference?

> +               vc4->load_tracker_available = true;
> +
> +               /* Start with the load tracker enabled. Can be
> +                * disabled through the debugfs load_tracker file.
> +                */
> +               vc4->load_tracker_enabled = true;
> +       }
>
>         sema_init(&vc4->async_modeset, 1);
>
> @@ -698,8 +705,14 @@ int vc4_kms_load(struct drm_device *dev)
>                 return ret;
>         }
>
> -       dev->mode_config.max_width = 2048;
> -       dev->mode_config.max_height = 2048;
> +       if (of_device_is_compatible(dev->dev->of_node, "brcm,bcm2711-vc5")) {

We're making the same of_device_is_compatible call twice within
vc4_kms_load. Set a flag based on it and check that instead?

  Dave

> +               dev->mode_config.max_width = 7680;
> +               dev->mode_config.max_height = 7680;
> +       } else {
> +               dev->mode_config.max_width = 2048;
> +               dev->mode_config.max_height = 2048;
> +       }
> +
>         dev->mode_config.funcs = &vc4_mode_funcs;
>         dev->mode_config.preferred_depth = 24;
>         dev->mode_config.async_page_flip = true;
> @@ -714,14 +727,17 @@ int vc4_kms_load(struct drm_device *dev)
>         drm_atomic_private_obj_init(dev, &vc4->ctm_manager, &ctm_state->base,
>                                     &vc4_ctm_state_funcs);
>
> -       load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
> -       if (!load_state) {
> -               drm_atomic_private_obj_fini(&vc4->ctm_manager);
> -               return -ENOMEM;
> -       }
> +       if (vc4->load_tracker_available) {
> +               load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
> +               if (!load_state) {
> +                       drm_atomic_private_obj_fini(&vc4->ctm_manager);
> +                       return -ENOMEM;
> +               }
>
> -       drm_atomic_private_obj_init(dev, &vc4->load_tracker, &load_state->base,
> -                                   &vc4_load_tracker_state_funcs);
> +               drm_atomic_private_obj_init(dev, &vc4->load_tracker,
> +                                           &load_state->base,
> +                                           &vc4_load_tracker_state_funcs);
> +       }
>
>         drm_mode_config_reset(dev);
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 1e38e603f83b..24d7e6db6fdd 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -516,6 +516,11 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
>         struct vc4_plane_state *vc4_state;
>         struct drm_crtc_state *crtc_state;
>         unsigned int vscale_factor;
> +       struct vc4_dev *vc4;
> +
> +       vc4 = to_vc4_dev(state->plane->dev);
> +       if (!vc4->load_tracker_available)
> +               return;
>
>         vc4_state = to_vc4_plane_state(state);
>         crtc_state = drm_atomic_get_existing_crtc_state(state->state,
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
