Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1237230B2D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 15:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882FA6E291;
	Tue, 28 Jul 2020 13:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7436E291
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:13:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x5so16714981wmi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hn73ZeTsbvvZEe6zF6c1TcaGJ3Kb+2Neo3dKxuwxqwI=;
 b=O64uoCHVwK8OV2TsHjId6t4SCQ2EwLv1Nlbsa5qLH4EFhek7Lxuf5K7I0Xcqsyb3cx
 rOlCF+Jc36Z/OfuQAcZSE3GN7mOqwk4cttMNEgd3z5LtE3xV5nFeQlUXgyG3NmUw7kAQ
 BfXzolvhIsne8zHf11w+A8GPIeWx5gFDlN/yCVSCEnq+rFtoH3yncRfVbhoc/g8sq9Hd
 W4slxdlT4/o8bF7am460uU1vP1GFDqiSF36DLpk7XPx0qr/+rU81W36sbYRJgVDOuK+D
 fiMpF50F3dpH8xLjIzu3OWdGc86R7wJprr9KtIjffdmiCAdcnYNXmHvuimvajdw1VcL2
 CjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hn73ZeTsbvvZEe6zF6c1TcaGJ3Kb+2Neo3dKxuwxqwI=;
 b=DGNQT1k/IRuUiwzankWmGexJMdyI4d11vUUurc8ydXrp0orINDJipf6zdXxoJ67Lrs
 9niFhN3lxVQDjjBpQprDP1VAJkAxLIiOwrDB008LGMxB6bbKmuMNzst7NHfyLsruNSFm
 7Haq5HePHbVQZEUkRB/b/YJsgBzSmxfQF0I4wfZGnQCtd103Ntvrgx4pLLaXmFeXnbji
 BeVweaKJVeXM/2Md9iX0v3xMIRzj9ATMepAKiC2svBCXRxxJxwdsQYdrX+QX2M43D1Mj
 q5Jdvt/ADjJNz4selSe3CseFeeo6ko0RpEHVamBl5JyqOg0gahECnDCPFleaGElU4+fW
 ymhw==
X-Gm-Message-State: AOAM531P1zg7it3ZhDDsb2uFt9z8ZB1obwqUUXIVeMDgpvbr7cVqtSrJ
 IK6pyHuQX5IYOHpGFIHJR9TC/CabvRlcpU4RqxnjPw==
X-Google-Smtp-Source: ABdhPJy7HYS0aEVl26WsJfxCdOzW1mGb++9Zn0Ks4CZMROjIWrmhXci1tkPBKLKRq4FcZnC+6t+dbpas6DIaFQMdUso=
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr1526380wmd.82.1595941991293; 
 Tue, 28 Jul 2020 06:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <7e00240a06b54e2ee7175a892310914d7f565426.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <7e00240a06b54e2ee7175a892310914d7f565426.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 14:12:55 +0100
Message-ID: <CAPY8ntBbYCupu8LNqYZO=cnJsx=5tpPs2ripTAtM5R=Nsk5=xg@mail.gmail.com>
Subject: Re: [PATCH v4 55/78] drm/vc4: hdmi: Add a CSC setup callback
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
> Similarly to the previous patches, the CSC setup is slightly different in
> the BCM2711 than in the previous generations. Let's add a callback for it.

We've gained the set_timings callback in this patch as well as
csc_setup. Was that an accidental squash as we had them as independent
commits in v1.

  Dave

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 142 +++++++++++++++++++---------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |   7 ++-
>  2 files changed, 89 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 19897d6525ac..a50220bfd5dd 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -334,12 +334,44 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
>                 DRM_ERROR("Failed to release power domain: %d\n", ret);
>  }
>
> -static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
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
> @@ -357,7 +389,41 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>                                         mode->crtc_vsync_end -
>                                         interlaced,
>                                         VC4_HDMI_VERTB_VBP));
> -       u32 csc_ctl;
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
> @@ -401,68 +467,22 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
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
> -       csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
> -                               VC4_HD_CSC_CTL_ORDER);
> +       if (vc4_hdmi->variant->set_timings)
> +               vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
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
> @@ -1431,7 +1451,9 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
>         .num_registers          = ARRAY_SIZE(vc4_hdmi_fields),
>
>         .init_resources         = vc4_hdmi_init_resources,
> +       .csc_setup              = vc4_hdmi_csc_setup,
>         .reset                  = vc4_hdmi_reset,
> +       .set_timings            = vc4_hdmi_set_timings,
>         .phy_init               = vc4_hdmi_phy_init,
>         .phy_disable            = vc4_hdmi_phy_disable,
>         .phy_rng_enable         = vc4_hdmi_phy_rng_enable,
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 950accbc44e4..0c32dc46d289 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -41,6 +41,13 @@ struct vc4_hdmi_variant {
>         /* Callback to reset the HDMI block */
>         void (*reset)(struct vc4_hdmi *vc4_hdmi);
>
> +       /* Callback to enable / disable the CSC */
> +       void (*csc_setup)(struct vc4_hdmi *vc4_hdmi, bool enable);
> +
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
