Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8453F25DE14
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 17:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBDB6EC3F;
	Fri,  4 Sep 2020 15:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45876EC41
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 15:45:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z9so6520593wmk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWAhN7a+4874hzvxevYBZLVV3qk181dMhkmwcopVXuI=;
 b=oFrwyne8UjE4GXeuhjjOpVE9dYZzB2GlQAZCkFaOP1wA0cXqKCn7uoJJwGDObMHxPc
 dFLnAam23p6BBsCONYgBCS8Y3VSJ7EySoY4Fq5UoZy/F8Fn2lbfkkqBi1OjU/s5JCuEQ
 +UHKUniKfnrVglb99KDPOYVPapsE5nuHsbwWDUXY5kMUq5FTRJ89pfRug0hq4ZLwqTag
 kxJjyxhTh7qRPvOCRVNb+dWojAmEJ2ch1rJknyxyZUNQd2ZIZPR2hKHtF5EnNzeGSe5W
 3LkwSplCw1X7pDUYAp/rmsDgjRmrze7FYppzpfhj7RhzMpSAeo+cHJAmHAAMamm/Yicg
 alXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWAhN7a+4874hzvxevYBZLVV3qk181dMhkmwcopVXuI=;
 b=kI8+qIZJduHeGyqgBgxFdlgd/GVIXu0Cw9nLFGtHeJ+tSxJCjh1iJXnhllCHokUAfc
 gc1bf12fbg3fHCV0kqDSDTBq6Z8ip8urdtPC3dtqhPvULpRuoGXMdJyLly4IvK5VpndQ
 ooR3gcD1Tb0jhuhTQtkjV2MzgknjZ0ew8YmTuflZ6pSg7h4kd2PrN4Is7t7a4dcC5BWD
 dZCIhnQLMO3QzBG5L5cRjInYLIKBTognLfWB1UPu62dv7GZXnOrerQCyH/XSoej7pLK5
 24viMDNag0375RTjq/igifN5l1hkoAqhaDQ3B6pcDOtB4kyfMyIkHgSu0E6MV0SGfccr
 TN+A==
X-Gm-Message-State: AOAM5322UyU8AV/4OEqtiMZhBOx8VM9y2ymMGtgm9SUgQ90E/VdFwXUy
 Tw2amIRBavRR8eswOEoHykcdyjXWsJ06vZq/P/RUsA==
X-Google-Smtp-Source: ABdhPJzfjtKP7vZTuEflczNVPJm8Afz2ShaotHKRilLa7ZLCMiX8evx3ILz6Mx8pA1RbRMbqOuiZ+w5nytdpOD6GqG0=
X-Received: by 2002:a1c:4303:: with SMTP id q3mr8102774wma.158.1599234351549; 
 Fri, 04 Sep 2020 08:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <5c19bbf10153cb42ca0fb67e08606c8295c17236.1599120059.git-series.maxime@cerno.tech>
In-Reply-To: <5c19bbf10153cb42ca0fb67e08606c8295c17236.1599120059.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 4 Sep 2020 16:45:36 +0100
Message-ID: <CAPY8ntAPzQ2BWRivzmfSbX03WZiQ0UDRCDBFgWA2-ZtrqO10nA@mail.gmail.com>
Subject: Re: [PATCH v5 55/80] drm/vc4: hdmi: Add a CSC setup callback
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
> Similarly to the previous patches, the CSC setup is slightly different in
> the BCM2711 than in the previous generations. Let's add a callback for it.
>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 70 +++++++++++++++++++++--------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ++-
>  2 files changed, 45 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index c29376c3fd8a..532618e02399 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -334,6 +334,41 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
>                 DRM_ERROR("Failed to release power domain: %d\n", ret);
>  }
>
> +static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
> +{
> +       u32 csc_ctl;
> +
> +       csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
> +                               VC4_HD_CSC_CTL_ORDER);
> +
> +       if (enable) {
> +               /* CEA VICs other than #1 requre limited range RGB
> +                * output unless overridden by an AVI infoframe.
> +                * Apply a colorspace conversion to squash 0-255 down
> +                * to 16-235.  The matrix here is:
> +                *
> +                * [ 0      0      0.8594 16]
> +                * [ 0      0.8594 0      16]
> +                * [ 0.8594 0      0      16]
> +                * [ 0      0      0       1]
> +                */
> +               csc_ctl |= VC4_HD_CSC_CTL_ENABLE;
> +               csc_ctl |= VC4_HD_CSC_CTL_RGB2YCC;
> +               csc_ctl |= VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
> +                                        VC4_HD_CSC_CTL_MODE);
> +
> +               HDMI_WRITE(HDMI_CSC_12_11, (0x000 << 16) | 0x000);
> +               HDMI_WRITE(HDMI_CSC_14_13, (0x100 << 16) | 0x6e0);
> +               HDMI_WRITE(HDMI_CSC_22_21, (0x6e0 << 16) | 0x000);
> +               HDMI_WRITE(HDMI_CSC_24_23, (0x100 << 16) | 0x000);
> +               HDMI_WRITE(HDMI_CSC_32_31, (0x000 << 16) | 0x6e0);
> +               HDMI_WRITE(HDMI_CSC_34_33, (0x100 << 16) | 0x000);
> +       }
> +
> +       /* The RGB order applies even when CSC is disabled. */
> +       HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
> +}
> +
>  static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>  {
>         struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> @@ -357,7 +392,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>                                         mode->crtc_vsync_end -
>                                         interlaced,
>                                         VC4_HDMI_VERTB_VBP));
> -       u32 csc_ctl;
>         int ret;
>
>         ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
> @@ -428,41 +462,20 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>                    (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
>                    (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
>
> -       csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
> -                               VC4_HD_CSC_CTL_ORDER);
>
>         if (vc4_encoder->hdmi_monitor &&
> -           drm_default_rgb_quant_range(mode) ==
> -           HDMI_QUANTIZATION_RANGE_LIMITED) {
> -               /* CEA VICs other than #1 requre limited range RGB
> -                * output unless overridden by an AVI infoframe.
> -                * Apply a colorspace conversion to squash 0-255 down
> -                * to 16-235.  The matrix here is:
> -                *
> -                * [ 0      0      0.8594 16]
> -                * [ 0      0.8594 0      16]
> -                * [ 0.8594 0      0      16]
> -                * [ 0      0      0       1]
> -                */
> -               csc_ctl |= VC4_HD_CSC_CTL_ENABLE;
> -               csc_ctl |= VC4_HD_CSC_CTL_RGB2YCC;
> -               csc_ctl |= VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
> -                                        VC4_HD_CSC_CTL_MODE);
> +           drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
> +               if (vc4_hdmi->variant->csc_setup)
> +                       vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
>
> -               HDMI_WRITE(HDMI_CSC_12_11, (0x000 << 16) | 0x000);
> -               HDMI_WRITE(HDMI_CSC_14_13, (0x100 << 16) | 0x6e0);
> -               HDMI_WRITE(HDMI_CSC_22_21, (0x6e0 << 16) | 0x000);
> -               HDMI_WRITE(HDMI_CSC_24_23, (0x100 << 16) | 0x000);
> -               HDMI_WRITE(HDMI_CSC_32_31, (0x000 << 16) | 0x6e0);
> -               HDMI_WRITE(HDMI_CSC_34_33, (0x100 << 16) | 0x000);
>                 vc4_encoder->limited_rgb_range = true;
>         } else {
> +               if (vc4_hdmi->variant->csc_setup)
> +                       vc4_hdmi->variant->csc_setup(vc4_hdmi, false);
> +
>                 vc4_encoder->limited_rgb_range = false;
>         }
>
> -       /* The RGB order applies even when CSC is disabled. */
> -       HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
> -
>         HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
>
>         if (debug_dump_regs) {
> @@ -1430,6 +1443,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
>         .num_registers          = ARRAY_SIZE(vc4_hdmi_fields),
>
>         .init_resources         = vc4_hdmi_init_resources,
> +       .csc_setup              = vc4_hdmi_csc_setup,
>         .reset                  = vc4_hdmi_reset,
>         .phy_init               = vc4_hdmi_phy_init,
>         .phy_disable            = vc4_hdmi_phy_disable,
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 950accbc44e4..c8fd58548ea2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -41,6 +41,9 @@ struct vc4_hdmi_variant {
>         /* Callback to reset the HDMI block */
>         void (*reset)(struct vc4_hdmi *vc4_hdmi);
>
> +       /* Callback to enable / disable the CSC */
> +       void (*csc_setup)(struct vc4_hdmi *vc4_hdmi, bool enable);
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
