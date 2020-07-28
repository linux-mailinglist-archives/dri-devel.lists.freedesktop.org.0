Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0447E230CF0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 17:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53246E0A2;
	Tue, 28 Jul 2020 15:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649886E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:05:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f18so18549393wml.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QxDxVmK0BEhYtrvSw5SuThDITVSJ95nih7WzyiY6TNg=;
 b=VDauPB6qRa6EVmiLT86Ab8sjixBlVTgYVNP2bABJh0xjtT82MKXtQJK3Z5h7KqZ3d4
 uSpRCjnz0Yg9q9x1ZbVj153pUmP+mCTVPXtxJ6IP5eOAdGIJSU4nKxLS+8cSaHnoiQao
 CB2BD8pizBCd9Ha4rSekIKmR2fhY7FnWKT7XJW57jUuZZwCYEtR7u14Ru7AGMPBh0OTO
 Q6g33s+bCkq3Q0zZV7yRzeQMhJMXu4Ca2zbTHYwozgqWmdKaAj4Bum6EWT5HPEStgfXL
 sXMe0jfVI1jninOuMAHb+YTlPnO1lhcuEC3qr0TZsH41UeiOAghvZZCJsStR8CIjV4sU
 HJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QxDxVmK0BEhYtrvSw5SuThDITVSJ95nih7WzyiY6TNg=;
 b=EwyYDRp0gdt96FN6INj5Qka/IJ5gFap+5w6FkKj4ZNrz17fN2rsR2ToV70kxN7IbWW
 IyiWHuDdiG+m2hZVh9TaZHXXghKaKfb2R9PbbiSOuvyQXUq0RiajlZy82C+GU1jzjKrw
 7k+skLaTTBZ5v1TmnDgWMxXIa1/3RHSOM3/HIOD7Nj/GN+F2XHUzzHY/8sO6W2+l9Sfk
 og7PHLzWsomKLZ/eBWn/gsmrms5Z1vlgbqz3OqpSV2NMQQ9SnSfgs6Pi19SL+/8hgo5M
 HkiniTAZpgNLHQCzaQQSSwmF8eRQg9nVVBzu9QOHtYUps4K5kmCxbdAmr56iRhDr0v10
 da0g==
X-Gm-Message-State: AOAM533nmeW+oA1M/gjLiS45EoCFikFM553e74LYTpolxAByfpAjEqfR
 BIDY8IYmMMg2IOQD/7bzZ20B/EOA6SMfhBoyKa+jqA==
X-Google-Smtp-Source: ABdhPJxHDPQtTTZrTbY1UZTbWSdu5PQ3WiVqQT+/t87lD4d4Ysa2XPJ/+sSgBPjyp+BLtkMVXpvAwGoDl0RydJrSoIw=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr4400512wmg.116.1595948713057; 
 Tue, 28 Jul 2020 08:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <496aecbe04aa460572d4ff02a64e77ca01368316.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <496aecbe04aa460572d4ff02a64e77ca01368316.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 16:04:55 +0100
Message-ID: <CAPY8ntDwJfBFLmJA8cHpkKXu5EicsZWoa8f7Pvh8jPuXYQ_ScQ@mail.gmail.com>
Subject: Re: [PATCH v4 71/78] drm/vc4: hdmi: Implement finer-grained hooks
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
> In order to prevent some pixels getting stuck in an unflushable FIFO on
> bcm2711, we need to enable the HVS, the pixelvalve (the CRTC) and the HDMI
> controller (the encoder) in an intertwined way, and with tight delays.
>
> However, the atomic callbacks don't really provide a way to work with
> either constraints, so we need to roll our own callbacks so that we can
> provide those guarantees.
>
> Since those callbacks have been implemented and called in the CRTC code, we
> can just implement them in the HDMI driver now.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 39 +++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 00592c1ada73..bbe521ab000b 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -320,12 +320,17 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
>                 vc4_hdmi_set_audio_infoframe(encoder);
>  }
>
> -static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
> +static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder)
>  {
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> -       int ret;
>
>         HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
> +}
> +
> +static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
> +{
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +       int ret;
>
>         if (vc4_hdmi->variant->phy_disable)
>                 vc4_hdmi->variant->phy_disable(vc4_hdmi);
> @@ -341,6 +346,10 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
>                 DRM_ERROR("Failed to release power domain: %d\n", ret);
>  }
>
> +static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
> +{
> +}
> +
>  static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
>  {
>         u32 csc_ctl;
> @@ -449,11 +458,10 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
>                   "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
>  }
>
> -static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
> +static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
>  {
>         struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> -       struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
>         unsigned long pixel_rate, hsm_rate;
>         int ret;
>
> @@ -521,6 +529,13 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>
>         if (vc4_hdmi->variant->set_timings)
>                 vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
> +}
> +
> +static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder)
> +{
> +       struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> +       struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>
>         if (vc4_encoder->hdmi_monitor &&
>             drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
> @@ -536,6 +551,13 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>         }
>
>         HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
> +}
> +
> +static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
> +{
> +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +       struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
> +       int ret;
>
>         HDMI_WRITE(HDMI_VID_CTL,
>                    HDMI_READ(HDMI_VID_CTL) |
> @@ -582,6 +604,10 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>         vc4_hdmi_recenter_fifo(vc4_hdmi);
>  }
>
> +static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
> +{
> +}
> +
>  static enum drm_mode_status
>  vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>                             const struct drm_display_mode *mode)
> @@ -1362,6 +1388,11 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         dev_set_drvdata(dev, vc4_hdmi);
>         encoder = &vc4_hdmi->encoder.base.base;
>         vc4_hdmi->encoder.base.type = variant->encoder_type;
> +       vc4_hdmi->encoder.base.pre_crtc_configure = vc4_hdmi_encoder_pre_crtc_configure;
> +       vc4_hdmi->encoder.base.pre_crtc_enable = vc4_hdmi_encoder_pre_crtc_enable;
> +       vc4_hdmi->encoder.base.post_crtc_enable = vc4_hdmi_encoder_post_crtc_enable;
> +       vc4_hdmi->encoder.base.post_crtc_disable = vc4_hdmi_encoder_post_crtc_disable;
> +       vc4_hdmi->encoder.base.post_crtc_powerdown = vc4_hdmi_encoder_post_crtc_powerdown;
>         vc4_hdmi->pdev = pdev;
>         vc4_hdmi->variant = variant;
>
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
