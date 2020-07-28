Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAB6230CD0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 16:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E026E114;
	Tue, 28 Jul 2020 14:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7966E114
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 14:57:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a14so18622611wra.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7qDejTgdQJPnpQcdqB4JyZv5kja/nbfO94rs4bcB9lY=;
 b=T+KBCkLZuAaJ01uiCexsujrpochsGpmLQ1GqWPpt2bdlSJSaKE4zPHN6YySwjwTqn1
 u5tDBoa2pZqK/KsP8RiThqvI9BDpSRjBdeZKqxbRf8wKjAHyL1BsonEbQgzmdibq6VdY
 vC/dTJ6WEO6X0RhmLmEQ4b3WtVPYOm+ncM6/9orXDlB37X/4sCRWTUmtFMM/y2+cQtO5
 zFWUAIrzdE7kNl4JKXTJWFvA3idxq0mD61A0SFGX6Gm5HGG/2zJDgf1vPon6VZNPJ/8V
 2ttX2ldLx0E8Fm/QbAI3l/DtuNxBxndsDYBfcSNAXasiPMVqc+F0RIp8LcvVHNIbdF65
 TPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7qDejTgdQJPnpQcdqB4JyZv5kja/nbfO94rs4bcB9lY=;
 b=PTPu1Nc3yAE5QipuvQwym73QCMEZ8KARl2GjAtBHriZeZONgelRo44KEp00Vn4YX2H
 gto/Oxq0SYROFFWO7ahsuM3kCQ6ilIuQWDJ3VXXUS32345Ozb9YMVqtYpgPd97nsqBxa
 gLr3n5MZlCXWKjO/fPUCWyuZTH06L+vJOgxoJSYCYMgag7UoUBcI6gGdhwyA9UxZuH5T
 4ETqF0t8sfAKny0EJFE7eyQ2up4EgzO6+H7zxuc90/yaciMOY3yzVaCKGX5825rFMoS9
 o5w10wXCTBnJyuQMLnZqKG4Zqc8OdrXaUtI2iSCtpLPpDiJOFlk0PjrpRPcfLZu+x+X8
 ekrg==
X-Gm-Message-State: AOAM530nkck/wgW5R5TuwR9OEfBsBN2okJZCp9PHtu1b4Ihq2j1pYj5N
 Ybv21A3sJ2aJOJ/NqpjK3+CgylsihGccG6IGgLHIow==
X-Google-Smtp-Source: ABdhPJyz4niSjUB9Yt22jUMO5TjPQucPwrvpw7nvnKlhXU4tsTSf9vfV1nXysoYyZ8RP0N7eE0Fd5eeDqqBRePmholc=
X-Received: by 2002:adf:fe50:: with SMTP id m16mr7964656wrs.27.1595948230084; 
 Tue, 28 Jul 2020 07:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <5919dccdd4a792936e6cb7eb55983c530c9a468d.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <5919dccdd4a792936e6cb7eb55983c530c9a468d.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 15:56:53 +0100
Message-ID: <CAPY8ntAuc4ySQBH7Q8MMhY3a0LkVp01nuWf-bCja53PMQ=0KVA@mail.gmail.com>
Subject: Re: [PATCH v4 62/78] drm/vc4: hdmi: Adjust HSM clock rate depending
 on pixel rate
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
> The HSM clock needs to be setup at around 101% of the pixel rate. This
> was done previously by setting the clock rate to 163.7MHz at probe time and
> only check in mode_valid whether the mode pixel clock was under the pixel
> clock +1% or not.
>
> However, with 4k we need to change that frequency to a higher frequency
> than 163.7MHz, and yet want to have the lowest clock as possible to have a
> decent power saving.
>
> Let's change that logic a bit by setting the clock rate of the HSM clock
> to the pixel rate at encoder_enable time. This would work for the
> BCM2711 that support 4k resolutions and has a clock that can provide it,
> but we still have to take care of a 4k panel plugged on a BCM283x SoCs
> that wouldn't be able to use those modes, so let's define the limit in
> the variant.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 79 ++++++++++++++++-------------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +-
>  2 files changed, 41 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 17797b14cde4..9f30fab744f2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -53,7 +53,6 @@
>  #include "vc4_hdmi_regs.h"
>  #include "vc4_regs.h"
>
> -#define HSM_CLOCK_FREQ 163682864
>  #define CEC_CLOCK_FREQ 40000
>
>  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
> @@ -326,6 +325,7 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
>         HDMI_WRITE(HDMI_VID_CTL,
>                    HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
>
> +       clk_disable_unprepare(vc4_hdmi->hsm_clock);
>         clk_disable_unprepare(vc4_hdmi->pixel_clock);
>
>         ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
> @@ -423,6 +423,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>         struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
>         bool debug_dump_regs = false;
> +       unsigned long pixel_rate, hsm_rate;
>         int ret;
>
>         ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
> @@ -431,9 +432,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>                 return;
>         }
>
> -       ret = clk_set_rate(vc4_hdmi->pixel_clock,
> -                          mode->clock * 1000 *
> -                          ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1));
> +       pixel_rate = mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1);
> +       ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
>         if (ret) {
>                 DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
>                 return;
> @@ -445,6 +445,36 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>                 return;
>         }
>
> +       /*
> +        * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
> +        * be faster than pixel clock, infinitesimally faster, tested in
> +        * simulation. Otherwise, exact value is unimportant for HDMI
> +        * operation." This conflicts with bcm2835's vc4 documentation, which
> +        * states HSM's clock has to be at least 108% of the pixel clock.
> +        *
> +        * Real life tests reveal that vc4's firmware statement holds up, and
> +        * users are able to use pixel clocks closer to HSM's, namely for
> +        * 1920x1200@60Hz. So it was decided to have leave a 1% margin between
> +        * both clocks. Which, for RPi0-3 implies a maximum pixel clock of
> +        * 162MHz.
> +        *
> +        * Additionally, the AXI clock needs to be at least 25% of
> +        * pixel clock, but HSM ends up being the limiting factor.
> +        */
> +       hsm_rate = max_t(unsigned long, 120000000, (pixel_rate / 100) * 101);
> +       ret = clk_set_rate(vc4_hdmi->hsm_clock, hsm_rate);
> +       if (ret) {
> +               DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
> +               return;
> +       }
> +
> +       ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
> +       if (ret) {
> +               DRM_ERROR("Failed to turn on HSM clock: %d\n", ret);
> +               clk_disable_unprepare(vc4_hdmi->pixel_clock);
> +               return;
> +       }
> +
>         if (vc4_hdmi->variant->reset)
>                 vc4_hdmi->variant->reset(vc4_hdmi);
>
> @@ -559,23 +589,9 @@ static enum drm_mode_status
>  vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>                             const struct drm_display_mode *mode)
>  {
> -       /*
> -        * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
> -        * be faster than pixel clock, infinitesimally faster, tested in
> -        * simulation. Otherwise, exact value is unimportant for HDMI
> -        * operation." This conflicts with bcm2835's vc4 documentation, which
> -        * states HSM's clock has to be at least 108% of the pixel clock.
> -        *
> -        * Real life tests reveal that vc4's firmware statement holds up, and
> -        * users are able to use pixel clocks closer to HSM's, namely for
> -        * 1920x1200@60Hz. So it was decided to have leave a 1% margin between
> -        * both clocks. Which, for RPi0-3 implies a maximum pixel clock of
> -        * 162MHz.
> -        *
> -        * Additionally, the AXI clock needs to be at least 25% of
> -        * pixel clock, but HSM ends up being the limiting factor.
> -        */
> -       if (mode->clock > HSM_CLOCK_FREQ / (1000 * 101 / 100))
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +
> +       if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
>                 return MODE_CLOCK_HIGH;
>
>         return MODE_OK;
> @@ -1349,23 +1365,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>                 return -EPROBE_DEFER;
>         }
>
> -       /* This is the rate that is set by the firmware.  The number
> -        * needs to be a bit higher than the pixel clock rate
> -        * (generally 148.5Mhz).
> -        */
> -       ret = clk_set_rate(vc4_hdmi->hsm_clock, HSM_CLOCK_FREQ);
> -       if (ret) {
> -               DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
> -               goto err_put_i2c;
> -       }
> -
> -       ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
> -       if (ret) {
> -               DRM_ERROR("Failed to turn on HDMI state machine clock: %d\n",
> -                         ret);
> -               goto err_put_i2c;
> -       }
> -
>         /* Only use the GPIO HPD pin if present in the DT, otherwise
>          * we'll use the HDMI core's register.
>          */
> @@ -1413,9 +1412,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  err_destroy_encoder:
>         drm_encoder_cleanup(encoder);
>  err_unprepare_hsm:
> -       clk_disable_unprepare(vc4_hdmi->hsm_clock);
>         pm_runtime_disable(dev);
> -err_put_i2c:
>         put_device(&vc4_hdmi->ddc->dev);
>
>         return ret;
> @@ -1454,7 +1451,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
>         vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
>         drm_encoder_cleanup(&vc4_hdmi->encoder.base.base);
>
> -       clk_disable_unprepare(vc4_hdmi->hsm_clock);
>         pm_runtime_disable(dev);
>
>         put_device(&vc4_hdmi->ddc->dev);
> @@ -1479,6 +1475,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
>  static const struct vc4_hdmi_variant bcm2835_variant = {
>         .encoder_type           = VC4_ENCODER_TYPE_HDMI0,
>         .debugfs_name           = "hdmi_regs",
> +       .max_pixel_clock        = 162000000,
>         .cec_available          = true,
>         .registers              = vc4_hdmi_fields,
>         .num_registers          = ARRAY_SIZE(vc4_hdmi_fields),
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 3f07aebe89f1..342f6e0227a2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -36,6 +36,9 @@ struct vc4_hdmi_variant {
>         /* Set to true when the CEC support is available */
>         bool cec_available;
>
> +       /* Maximum pixel clock supported by the controller (in Hz) */
> +       unsigned long long max_pixel_clock;
> +
>         /* List of the registers available on that variant */
>         const struct vc4_hdmi_register *registers;
>
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
