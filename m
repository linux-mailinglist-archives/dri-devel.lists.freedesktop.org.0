Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF425DE20
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 17:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154016EC65;
	Fri,  4 Sep 2020 15:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616A06EC65
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 15:47:09 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o21so6539012wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bm29TR0zDyfJHRh/JsSqrgRAa80WtO8xmYwnn8tQ1oI=;
 b=Cxmaouoqp1ey3OvqLyNR86kTWhAMP/leb1Iv1DcCt0h9uEs0PL5jx9+1TCId6dQ6HS
 OuRqLqcThUlu/BzJpdYt6CxeZgf+7FDaTdU7VMYALZnGQFd8WOY6iJLvDSKvMkWuQ6oE
 HNR1fsb6YNGzLkuCC4AUAn167nz7Blzms3jTH1n/UUrdBuwX+qM05BZg5TYFyC7pZCl7
 yVp0+8Buu+eRjB6/593xtEIhqrb3j4k1XkuWfrV1ej6wdngOwGhzUBYE5WQmmmT3VwX2
 vCk0FiFrMKl5eINxeXMkavSkFEHQsDMgbakDPxSd1NUodEyfl2kjXwNQEnwse35Tbkhj
 35rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bm29TR0zDyfJHRh/JsSqrgRAa80WtO8xmYwnn8tQ1oI=;
 b=E2ZJeBgj3PRWJwzd2B1Cv9InptstFQm3v+WuHV9D+A+RIatQSREFU2mjHQkg05F4a4
 K/78gFMVShcJvh977wFJ8PX01A6/4lop43vo1vkvk7uqdd5jUE6E4wSyc4iNA0xuPkO0
 PIW0sLmyjtcfyrBZSE5aaJUTIf1QujrzQ05dw7djslOoONP0be2jqR10beRy8FbA+Ug4
 a3MBfIZSf3XvMyyGeDliKoqWx0EY5YxWZQgU1SR0h4/qgGOnUYd1XRpbEnRbhsGm6yRQ
 Rt5DpifIq7Ln/3dPJtIoNDlpg/bqTbttZthe4Xg/qCHZeDsNHWAHi67v044aMHSPFgdI
 S5GQ==
X-Gm-Message-State: AOAM533TcU8kE8mKYDfPHOfPwhHDVjK1q4N+4RAGFonquitxaQ2HS4GV
 /PHrUi+e0sJ8SsB7YChRai6Zl8OJyLt/bN+ylIfgHA==
X-Google-Smtp-Source: ABdhPJxpU9rr5tU8lUD2ZqpqMTLkDLYORH4WjLVHnLFfcCbVfshaLZPgZXO3/BS7nFSaOY2UdhC36Wu6GDOCIM8JuQU=
X-Received: by 2002:a1c:415:: with SMTP id 21mr7849921wme.183.1599234427998;
 Fri, 04 Sep 2020 08:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <0cfcbb379212f90b4abc76c0ccf3b90d1d7c0268.1599120059.git-series.maxime@cerno.tech>
In-Reply-To: <0cfcbb379212f90b4abc76c0ccf3b90d1d7c0268.1599120059.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 4 Sep 2020 16:46:53 +0100
Message-ID: <CAPY8ntBCbEo_xj0J_PonSdcfb7P=UFsPMPZe1dHtbh6pkxvHnA@mail.gmail.com>
Subject: Re: [PATCH v5 56/80] drm/vc4: hdmi: Add a set_timings callback
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 3 Sep 2020 at 09:03, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Similarly to the previous patches, the timings setup in the HDMI controller
> of the BCM2711 is slightly different, mostly because it supports higher
> resolutions and thus needed more spaces for the various timings, resulting
> in the register layout changing.
>
> Let's add a callback for that as well.
>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 72 +++++++++++++++++++----------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  4 ++-
>  2 files changed, 44 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 532618e02399..9e2bc6cb690e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -369,12 +369,9 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
>         HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
>  }
>
> -static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
> +static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
> +                                struct drm_display_mode *mode)
>  {
> -       struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> -       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> -       struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
> -       bool debug_dump_regs = false;
>         bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
>         bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
>         bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
> @@ -392,6 +389,41 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>                                         mode->crtc_vsync_end -
>                                         interlaced,
>                                         VC4_HDMI_VERTB_VBP));
> +
> +       HDMI_WRITE(HDMI_HORZA,
> +                  (vsync_pos ? VC4_HDMI_HORZA_VPOS : 0) |
> +                  (hsync_pos ? VC4_HDMI_HORZA_HPOS : 0) |
> +                  VC4_SET_FIELD(mode->hdisplay * pixel_rep,
> +                                VC4_HDMI_HORZA_HAP));
> +
> +       HDMI_WRITE(HDMI_HORZB,
> +                  VC4_SET_FIELD((mode->htotal -
> +                                 mode->hsync_end) * pixel_rep,
> +                                VC4_HDMI_HORZB_HBP) |
> +                  VC4_SET_FIELD((mode->hsync_end -
> +                                 mode->hsync_start) * pixel_rep,
> +                                VC4_HDMI_HORZB_HSP) |
> +                  VC4_SET_FIELD((mode->hsync_start -
> +                                 mode->hdisplay) * pixel_rep,
> +                                VC4_HDMI_HORZB_HFP));
> +
> +       HDMI_WRITE(HDMI_VERTA0, verta);
> +       HDMI_WRITE(HDMI_VERTA1, verta);
> +
> +       HDMI_WRITE(HDMI_VERTB0, vertb_even);
> +       HDMI_WRITE(HDMI_VERTB1, vertb);
> +
> +       HDMI_WRITE(HDMI_VID_CTL,
> +                  (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
> +                  (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
> +}
> +
> +static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
> +{
> +       struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +       struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
> +       bool debug_dump_regs = false;
>         int ret;
>
>         ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
> @@ -435,33 +467,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>                    VC4_HDMI_SCHEDULER_CONTROL_MANUAL_FORMAT |
>                    VC4_HDMI_SCHEDULER_CONTROL_IGNORE_VSYNC_PREDICTS);
>
> -       HDMI_WRITE(HDMI_HORZA,
> -                  (vsync_pos ? VC4_HDMI_HORZA_VPOS : 0) |
> -                  (hsync_pos ? VC4_HDMI_HORZA_HPOS : 0) |
> -                  VC4_SET_FIELD(mode->hdisplay * pixel_rep,
> -                                VC4_HDMI_HORZA_HAP));
> -
> -       HDMI_WRITE(HDMI_HORZB,
> -                  VC4_SET_FIELD((mode->htotal -
> -                                 mode->hsync_end) * pixel_rep,
> -                                VC4_HDMI_HORZB_HBP) |
> -                  VC4_SET_FIELD((mode->hsync_end -
> -                                 mode->hsync_start) * pixel_rep,
> -                                VC4_HDMI_HORZB_HSP) |
> -                  VC4_SET_FIELD((mode->hsync_start -
> -                                 mode->hdisplay) * pixel_rep,
> -                                VC4_HDMI_HORZB_HFP));
> -
> -       HDMI_WRITE(HDMI_VERTA0, verta);
> -       HDMI_WRITE(HDMI_VERTA1, verta);
> -
> -       HDMI_WRITE(HDMI_VERTB0, vertb_even);
> -       HDMI_WRITE(HDMI_VERTB1, vertb);
> -
> -       HDMI_WRITE(HDMI_VID_CTL,
> -                  (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
> -                  (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
> -
> +       if (vc4_hdmi->variant->set_timings)
> +               vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
>
>         if (vc4_encoder->hdmi_monitor &&
>             drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
> @@ -1445,6 +1452,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
>         .init_resources         = vc4_hdmi_init_resources,
>         .csc_setup              = vc4_hdmi_csc_setup,
>         .reset                  = vc4_hdmi_reset,
> +       .set_timings            = vc4_hdmi_set_timings,
>         .phy_init               = vc4_hdmi_phy_init,
>         .phy_disable            = vc4_hdmi_phy_disable,
>         .phy_rng_enable         = vc4_hdmi_phy_rng_enable,
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index c8fd58548ea2..0c32dc46d289 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -44,6 +44,10 @@ struct vc4_hdmi_variant {
>         /* Callback to enable / disable the CSC */
>         void (*csc_setup)(struct vc4_hdmi *vc4_hdmi, bool enable);
>
> +       /* Callback to configure the video timings in the HDMI block */
> +       void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
> +                           struct drm_display_mode *mode);
> +
>         /* Callback to initialize the PHY according to the mode */
>         void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
>                          struct drm_display_mode *mode);
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
