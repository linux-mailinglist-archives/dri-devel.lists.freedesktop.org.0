Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AD0230AE0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 15:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B93897D0;
	Tue, 28 Jul 2020 13:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32388892C1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:03:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p14so16892084wmg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wv84ulHBLNw4Uf5oxYsoMX+Mv7LdyizqK6mgHY/q9Lg=;
 b=Cw/Vz4YG3V+q9BXCM+dRF8Bf1+qaTvaVBLZtNXFHMhI+iwRPIr1VMt0h31PKFR1K3w
 +KsWrczwug5KX/BqsyIEzuvdM1keRi8mGc/8LbBrbfWJjGGSKN5PfJggpJOFmzc8L5CB
 PSQILgbHeYV22T6xLuO7xDwIpu4iOT7pgifyK3xBoLmvUkLYykrw4ZAbjQ7OAUlogwDz
 PkOelni0f1GB8DCgyZuITXzIjke8GqIjkEAvSBOA/3TYq2ry+qxyvO1jQMvO1wqn8q6L
 BewuijkFBtR61aW6Z/VxiNfUu9+tu9kfUHbqz2RTBcFiF6m4HQB8aLRJVGjY9a/o1Udw
 J0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wv84ulHBLNw4Uf5oxYsoMX+Mv7LdyizqK6mgHY/q9Lg=;
 b=WQeXGqTULwO6iLrk2C8Cdtd+rreD+i+EVTj3QPYpQEKM49soPiLlPjJUwcoi96zvJ9
 mpN7r6bzz4JlZyxSFRT0ns/lyxmgXyy/ccI9AemRYONO1jNP5NGyyOer4OqrwH/VA390
 9RnGHxLV3F2hxCiGdxJxmVh7H+BgoUjNNlJJJbrbuvcUFzPiy3nakg5gaXgsmzM3iABP
 S5gJmmTYEHliWQmH446YaYDi5y40D79SQFdiEdRQwZRLRnmP3p4jjcolujRSyl3GAreG
 VvUoxU6PBc2GDvQFt1+cKgGW6aQLoRQav+GlVDzJkdb4xCcMxeIpyfi+OXc3If2xPZmX
 WxrA==
X-Gm-Message-State: AOAM532mALDjH/xn6c6gBaG7qX3fHRA1hv2X5Gz31li4x7UhRMHdkKwS
 9aYmcOVpcborn3qhjwRZEeSu1Tz1mMpwmAqgZb4yDQ==
X-Google-Smtp-Source: ABdhPJwdB7oDA/Uqj1bSF0wZ3zvwcMHPhTJTdpSbPzhoZ35h4LBovlO0Tm+FCn284QnywH5X/aUMaAJcxfFfhuNcVeE=
X-Received: by 2002:a1c:e382:: with SMTP id a124mr3687596wmh.96.1595941396813; 
 Tue, 28 Jul 2020 06:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <9ac309938e18a55c1c48d3520fe51a61f3c09b1f.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <9ac309938e18a55c1c48d3520fe51a61f3c09b1f.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 14:03:00 +0100
Message-ID: <CAPY8ntDiLWkfYwXUyTf-v51z6t3tE7qnsBpC9wN_AMcW=CyWiQ@mail.gmail.com>
Subject: Re: [PATCH v4 53/78] drm/vc4: hdmi: Add PHY init and disable function
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

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI PHY in the BCM2711 HDMI controller is significantly more
> complicated to setup than in the older BCM283x SoCs.
>
> Let's add hooks to enable and disable the PHY.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/Makefile       |  1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c     | 14 +++++++-------
>  drivers/gpu/drm/vc4/vc4_hdmi.h     | 13 +++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 25 +++++++++++++++++++++++++
>  4 files changed, 46 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_phy.c
>
> diff --git a/drivers/gpu/drm/vc4/Makefile b/drivers/gpu/drm/vc4/Makefile
> index b303703bc7f3..d0163e18e9ca 100644
> --- a/drivers/gpu/drm/vc4/Makefile
> +++ b/drivers/gpu/drm/vc4/Makefile
> @@ -12,6 +12,7 @@ vc4-y := \
>         vc4_kms.o \
>         vc4_gem.o \
>         vc4_hdmi.o \
> +       vc4_hdmi_phy.o \
>         vc4_vec.o \
>         vc4_hvs.o \
>         vc4_irq.o \
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 80bc3dd9d4a8..068041145d1c 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -321,7 +321,9 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
>
>         HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
>
> -       HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
> +       if (vc4_hdmi->variant->phy_disable)
> +               vc4_hdmi->variant->phy_disable(vc4_hdmi);
> +
>         HDMI_WRITE(HDMI_VID_CTL,
>                    HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
>
> @@ -381,12 +383,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>         if (vc4_hdmi->variant->reset)
>                 vc4_hdmi->variant->reset(vc4_hdmi);
>
> -       /* PHY should be in reset, like
> -        * vc4_hdmi_encoder_disable() does.
> -        */
> -       HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
> -
> -       HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0);
> +       if (vc4_hdmi->variant->phy_init)
> +               vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
>
>         if (debug_dump_regs) {
>                 struct drm_printer p = drm_info_printer(&vc4_hdmi->pdev->dev);
> @@ -1433,6 +1431,8 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
>
>         .init_resources         = vc4_hdmi_init_resources,
>         .reset                  = vc4_hdmi_reset,
> +       .phy_init               = vc4_hdmi_phy_init,
> +       .phy_disable            = vc4_hdmi_phy_disable,
>  };
>
>  static const struct of_device_id vc4_hdmi_dt_match[] = {
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 17a30589f39c..32c80161c786 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -21,6 +21,8 @@ to_vc4_hdmi_encoder(struct drm_encoder *encoder)
>         return container_of(encoder, struct vc4_hdmi_encoder, base.base);
>  }
>
> +struct drm_display_mode;
> +
>  struct vc4_hdmi;
>  struct vc4_hdmi_register;
>
> @@ -38,6 +40,13 @@ struct vc4_hdmi_variant {
>
>         /* Callback to reset the HDMI block */
>         void (*reset)(struct vc4_hdmi *vc4_hdmi);
> +
> +       /* Callback to initialize the PHY according to the mode */
> +       void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
> +                        struct drm_display_mode *mode);
> +
> +       /* Callback to disable the PHY */
> +       void (*phy_disable)(struct vc4_hdmi *vc4_hdmi);
>  };
>
>  /* HDMI audio information */
> @@ -95,4 +104,8 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
>         return container_of(_encoder, struct vc4_hdmi, encoder);
>  }
>
> +void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
> +                      struct drm_display_mode *mode);
> +void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
> +
>  #endif /* _VC4_HDMI_H_ */
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> new file mode 100644
> index 000000000000..5a1746877bb5
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2015 Broadcom
> + * Copyright (c) 2014 The Linux Foundation. All rights reserved.
> + * Copyright (C) 2013 Red Hat
> + * Author: Rob Clark <robdclark@gmail.com>
> + */
> +
> +#include "vc4_hdmi.h"
> +#include "vc4_hdmi_regs.h"
> +
> +void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi, struct drm_display_mode *mode)
> +{
> +       /* PHY should be in reset, like
> +        * vc4_hdmi_encoder_disable() does.
> +        */
> +
> +       HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
> +       HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0);
> +}
> +
> +void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi)
> +{
> +       HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
> +}
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
