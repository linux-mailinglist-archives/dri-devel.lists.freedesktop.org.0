Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A9054B52E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 17:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E71A10FD99;
	Tue, 14 Jun 2022 15:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697F610FD99
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 15:58:02 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v19so12300483edd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GU/0EQBmbwKnTns1dPXhnF0C+JYkk/aNhuhWWa6xo5o=;
 b=OXqBUpsWD7mV2+H5GAFmfZe6cR8fayD63ppFyO/yzDMdA8P+SLHgK98D4bD4bT3hPT
 PTgAOo8Q6FI3bwaGwwo4Li/Fka73v8KZw/qmGVbE2C1JMbiuzctMo0QCuzwHiGKhjkVo
 8hKlHhtVKWpQwXPKYBsYOg5E7w/CX5sslLtv5/ZJsO6c7G7H3BYll7+CDUT3/N9qeQ1p
 BMPJl8GPQKN0Wrcb94JN9hKhAyxiOeZTn3p9EueWxdAirS/fjQq+j3s2zsC0aFqHqzyR
 7InuMRZd3IcAvc7fDWxj3FjGF7MYxubHyHVHuqJ+qCSQFBJFjnjcIGUH7mac7aYVw69W
 DyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GU/0EQBmbwKnTns1dPXhnF0C+JYkk/aNhuhWWa6xo5o=;
 b=vuVT4J5xNh0FH5ssMw8lyt1pr1JIkG0K6jjVQz0iRWeYrhVscqZt7+vPnSkLPiYl8b
 2AuOUwHrJSPzvmlQswpMKTvTKKSkRXdey+ff8I+YoQW80rC+uuh+gbPCbJR01vmHqvOA
 D0aJVgL7tQLZvPrc2VQfgxM22wQwWbGhCzkb9pb4vLoVFzw1nJWyBpmSMBXkwTjgEHC+
 8gHG6h2zGMAW0bAaE/BrujrRMz8hlcST6IxBqV1hVNvw88Q/anoLVV/WUtO6c+mJoTcE
 3YP1eGCJKa4WDJKirzIwNsIrFda/v4Vj3nicTGc2c7d0VXAxraru6wsVDLALm6vMa+Mf
 2zJg==
X-Gm-Message-State: AOAM532RL91fsHnjZ8GDscDRnPROeuptYQzYvZ3aFBjUYWfN2ibt9eXk
 QEImkdD2HrcNjAKWVFOoGrizDvoz/ck39RpagIMW4g==
X-Google-Smtp-Source: ABdhPJxbE9QzxH0npGOg4jpqYsKZeVSvQ62Bl8yKSYJquy/M3PgdYkzONi3K+MlB9WK5YNo/EzUsAPyYuFXQ3p7hxfg=
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id
 i20-20020a05640242d400b004165caca9a0mr6946915edc.86.1655222280891; Tue, 14
 Jun 2022 08:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-18-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-18-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 16:57:45 +0100
Message-ID: <CAPY8ntCHiO7QrhOw7doE7PtzuTJEp4-u20rT_RDRBCmZ8fnQRw@mail.gmail.com>
Subject: Re: [PATCH 17/64] drm/vc4: crtc: Move debugfs_name to crtc_data
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
> All the CRTCs, including the TXP, have a debugfs file and name so we can
> consolidate it into vc4_crtc_data.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I was sort of expecting the vc4_debugfs_add_regset32 call to move to
vc4_crtc_init so that it would be a common call for crtcs and txp, but
that doesn't appear to happen in this set. The debugfs_name for the
txp is therefore actually unused.

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 18 +++++++++---------
>  drivers/gpu/drm/vc4/vc4_drv.h  |  4 ++--
>  drivers/gpu/drm/vc4/vc4_txp.c  |  1 +
>  3 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 7163f924b48b..1f7e987e68aa 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -978,10 +978,10 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
>
>  static const struct vc4_pv_data bcm2835_pv0_data = {
>         .base = {
> +               .debugfs_name = "crtc0_regs",
>                 .hvs_available_channels = BIT(0),
>                 .hvs_output = 0,
>         },
> -       .debugfs_name = "crtc0_regs",
>         .fifo_depth = 64,
>         .pixels_per_clock = 1,
>         .encoder_types = {
> @@ -992,10 +992,10 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
>
>  static const struct vc4_pv_data bcm2835_pv1_data = {
>         .base = {
> +               .debugfs_name = "crtc1_regs",
>                 .hvs_available_channels = BIT(2),
>                 .hvs_output = 2,
>         },
> -       .debugfs_name = "crtc1_regs",
>         .fifo_depth = 64,
>         .pixels_per_clock = 1,
>         .encoder_types = {
> @@ -1006,10 +1006,10 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
>
>  static const struct vc4_pv_data bcm2835_pv2_data = {
>         .base = {
> +               .debugfs_name = "crtc2_regs",
>                 .hvs_available_channels = BIT(1),
>                 .hvs_output = 1,
>         },
> -       .debugfs_name = "crtc2_regs",
>         .fifo_depth = 64,
>         .pixels_per_clock = 1,
>         .encoder_types = {
> @@ -1020,10 +1020,10 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
>
>  static const struct vc4_pv_data bcm2711_pv0_data = {
>         .base = {
> +               .debugfs_name = "crtc0_regs",
>                 .hvs_available_channels = BIT(0),
>                 .hvs_output = 0,
>         },
> -       .debugfs_name = "crtc0_regs",
>         .fifo_depth = 64,
>         .pixels_per_clock = 1,
>         .encoder_types = {
> @@ -1034,10 +1034,10 @@ static const struct vc4_pv_data bcm2711_pv0_data = {
>
>  static const struct vc4_pv_data bcm2711_pv1_data = {
>         .base = {
> +               .debugfs_name = "crtc1_regs",
>                 .hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
>                 .hvs_output = 3,
>         },
> -       .debugfs_name = "crtc1_regs",
>         .fifo_depth = 64,
>         .pixels_per_clock = 1,
>         .encoder_types = {
> @@ -1048,10 +1048,10 @@ static const struct vc4_pv_data bcm2711_pv1_data = {
>
>  static const struct vc4_pv_data bcm2711_pv2_data = {
>         .base = {
> +               .debugfs_name = "crtc2_regs",
>                 .hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
>                 .hvs_output = 4,
>         },
> -       .debugfs_name = "crtc2_regs",
>         .fifo_depth = 256,
>         .pixels_per_clock = 2,
>         .encoder_types = {
> @@ -1061,10 +1061,10 @@ static const struct vc4_pv_data bcm2711_pv2_data = {
>
>  static const struct vc4_pv_data bcm2711_pv3_data = {
>         .base = {
> +               .debugfs_name = "crtc3_regs",
>                 .hvs_available_channels = BIT(1),
>                 .hvs_output = 1,
>         },
> -       .debugfs_name = "crtc3_regs",
>         .fifo_depth = 64,
>         .pixels_per_clock = 1,
>         .encoder_types = {
> @@ -1074,10 +1074,10 @@ static const struct vc4_pv_data bcm2711_pv3_data = {
>
>  static const struct vc4_pv_data bcm2711_pv4_data = {
>         .base = {
> +               .debugfs_name = "crtc4_regs",
>                 .hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
>                 .hvs_output = 5,
>         },
> -       .debugfs_name = "crtc4_regs",
>         .fifo_depth = 64,
>         .pixels_per_clock = 2,
>         .encoder_types = {
> @@ -1214,7 +1214,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
>
>         platform_set_drvdata(pdev, vc4_crtc);
>
> -       vc4_debugfs_add_regset32(drm, pv_data->debugfs_name,
> +       vc4_debugfs_add_regset32(drm, pv_data->base.debugfs_name,
>                                  &vc4_crtc->regset);
>
>         return 0;
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 5125ca1a8158..9a53ace85d95 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -457,6 +457,8 @@ to_vc4_encoder(struct drm_encoder *encoder)
>  }
>
>  struct vc4_crtc_data {
> +       const char *debugfs_name;
> +
>         /* Bitmask of channels (FIFOs) of the HVS that the output can source from */
>         unsigned int hvs_available_channels;
>
> @@ -474,8 +476,6 @@ struct vc4_pv_data {
>         u8 pixels_per_clock;
>
>         enum vc4_encoder_type encoder_types[4];
> -       const char *debugfs_name;
> -
>  };
>
>  struct vc4_crtc {
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 82beb8c159f2..e983ff7c5e13 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -460,6 +460,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
>  }
>
>  static const struct vc4_crtc_data vc4_txp_crtc_data = {
> +       .debugfs_name = "txp_regs",
>         .hvs_available_channels = BIT(2),
>         .hvs_output = 2,
>  };
> --
> 2.36.1
>
