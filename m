Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEBA232066
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 16:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3686E558;
	Wed, 29 Jul 2020 14:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958266E588
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:32:01 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a14so21884876wra.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o1do84mkd41FAJkaWs03udljBsFkmzluYvmmkuZMJSQ=;
 b=UQtcvzjBcrrZpX+yoM9PL/aPymg+claUZjHwyLIwqDVVVlhl1Q+WPSxdax2m5cUSiG
 WXZY2lUqvcCVE+BcuGsqi+74VN4gxMoPE9SJvFODh6rk4dL8qRhEu9jj0bLKSwI+hMWx
 wgq3ipJEdcEvSljtmQrSqTXZ3iHImntfU6fmbdF+IaM7Ds+DGTi3IytJqvW20EEcWcco
 C9w1T4/9MT9ip+Qo4ODT/S9Eh4CMHG1WGeK2+bxWZrHVyedAWz1wTf/4/Udsz3NnD78L
 ZfHkl6XFeJqT9zM1kwE00N5KeiY3zfzZZFpCx9O6GDPiEFMG8uU+XKdbzrFmmY1cksDy
 DZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o1do84mkd41FAJkaWs03udljBsFkmzluYvmmkuZMJSQ=;
 b=gOypu52kiOp83NKAHbsJPDUxEyxd/ra75m0/JSdobaayH0w6NJbLHNO4q56AC9sY4K
 Yd2y7SEzB/56vSqTv5E1JSuQ1yaCi5WLnigNHTudGklsDBv5bKQAmiPsttYMSc3pPOcA
 dkGcZUkusEChBy2Z8Bo2OgWUYnNg8PXnGkOONDpuPwNqQaSQRBDGYXjLUpsNnFrvnKVB
 ajVXPrsuYjdc/ItbTAQUuVb1T63rzqu0BAyY9v7FyhEEgAmyBR22K+FKusTduiZumOW2
 oGPKT2CK+PaGMVIhGIiLEEHF2Xqp1HCBhl9knVI8TP8HJEGT4EhwjH3WBMrGXUnaw05x
 dgug==
X-Gm-Message-State: AOAM530IoCRLQtky2kF7+aSVOqFgvC7ay3mIsNaYtKX3AOaFmQH5VVjE
 KRD2ChoHiv1s6qd2USALLyBKnVoUcO06M9r0LZUAFw==
X-Google-Smtp-Source: ABdhPJy4ZRSBhZjS0WJzhCxD+aIrYbDHioRCbF/lmJpG+FHIuZaGqPq0RnKTaTni/ONMGoGsodAfhiQEIA/MKdRJIS0=
X-Received: by 2002:a5d:5383:: with SMTP id d3mr22909988wrv.42.1596033119855; 
 Wed, 29 Jul 2020 07:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <ce9cf1d060c727c6d95bab6d43d258036e503dfc.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <ce9cf1d060c727c6d95bab6d43d258036e503dfc.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jul 2020 15:31:41 +0100
Message-ID: <CAPY8ntDF8=9mhRYwOYJOZ4pm8qwYdu+ktU8r0tCB3nH25KBrvw@mail.gmail.com>
Subject: Re: [PATCH v4 14/78] drm/vc4: crtc: Assign output to channel
 automatically
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

On Wed, 8 Jul 2020 at 18:42, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HVS found in the BCM2711 has 6 outputs and 3 FIFOs, with each output
> being connected to a pixelvalve, and some muxing between the FIFOs and
> outputs.
>
> Any output cannot feed from any FIFO though, and they all have a bunch of
> constraints.
>
> In order to support this, let's store the possible FIFOs each output can be
> assigned to in the vc4_crtc_data, and use that information at atomic_check
> time to iterate over all the CRTCs enabled and assign them FIFOs.
>
> The channel assigned is then set in the vc4_crtc_state so that the rest of
> the driver can use it.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c |  12 +-
>  drivers/gpu/drm/vc4/vc4_drv.h  |   7 +-
>  drivers/gpu/drm/vc4/vc4_hvs.c  |  28 ++----
>  drivers/gpu/drm/vc4/vc4_kms.c  | 167 +++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_regs.h |  10 ++-
>  drivers/gpu/drm/vc4/vc4_txp.c  |   1 +-
>  6 files changed, 199 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index fe2e5675aed4..b7e47ce1476c 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -88,6 +88,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
>         struct drm_device *dev = crtc->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> +       struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
>         unsigned int cob_size;
>         u32 val;
>         int fifo_lines;
> @@ -104,7 +105,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
>          * Read vertical scanline which is currently composed for our
>          * pixelvalve by the HVS, and also the scaler status.
>          */
> -       val = HVS_READ(SCALER_DISPSTATX(vc4_crtc->channel));
> +       val = HVS_READ(SCALER_DISPSTATX(vc4_crtc_state->assigned_channel));
>
>         /* Get optional system timestamp after query. */
>         if (etime)
> @@ -124,7 +125,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
>                         *hpos += mode->crtc_htotal / 2;
>         }
>
> -       cob_size = vc4_crtc_get_cob_allocation(vc4, vc4_crtc->channel);
> +       cob_size = vc4_crtc_get_cob_allocation(vc4, vc4_crtc_state->assigned_channel);
>         /* This is the offset we need for translating hvs -> pv scanout pos. */
>         fifo_lines = cob_size / mode->crtc_hdisplay;
>
> @@ -520,7 +521,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
>         struct drm_device *dev = crtc->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
>         struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
> -       u32 chan = vc4_crtc->channel;
> +       u32 chan = vc4_state->assigned_channel;
>         unsigned long flags;
>
>         spin_lock_irqsave(&dev->event_lock, flags);
> @@ -719,6 +720,7 @@ struct drm_crtc_state *vc4_crtc_duplicate_state(struct drm_crtc *crtc)
>         old_vc4_state = to_vc4_crtc_state(crtc->state);
>         vc4_state->feed_txp = old_vc4_state->feed_txp;
>         vc4_state->margins = old_vc4_state->margins;
> +       vc4_state->assigned_channel = old_vc4_state->assigned_channel;
>
>         __drm_atomic_helper_crtc_duplicate_state(crtc, &vc4_state->base);
>         return &vc4_state->base;
> @@ -779,6 +781,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
>
>  static const struct vc4_pv_data bcm2835_pv0_data = {
>         .base = {
> +               .hvs_available_channels = BIT(0),
>                 .hvs_output = 0,
>         },
>         .debugfs_name = "crtc0_regs",
> @@ -791,6 +794,7 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
>
>  static const struct vc4_pv_data bcm2835_pv1_data = {
>         .base = {
> +               .hvs_available_channels = BIT(2),
>                 .hvs_output = 2,
>         },
>         .debugfs_name = "crtc1_regs",
> @@ -803,6 +807,7 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
>
>  static const struct vc4_pv_data bcm2835_pv2_data = {
>         .base = {
> +               .hvs_available_channels = BIT(1),
>                 .hvs_output = 1,
>         },
>         .debugfs_name = "crtc2_regs",
> @@ -866,7 +871,6 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
>         drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
>                                   crtc_funcs, NULL);
>         drm_crtc_helper_add(crtc, crtc_helper_funcs);
> -       vc4_crtc->channel = vc4_crtc->data->hvs_output;
>         drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
>         drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index d1cf4c038180..9e81ad8331f1 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -447,6 +447,9 @@ to_vc4_encoder(struct drm_encoder *encoder)
>  }
>
>  struct vc4_crtc_data {
> +       /* Bitmask of channels (FIFOs) of the HVS that the output can source from */
> +       unsigned int hvs_available_channels;
> +
>         /* Which output of the HVS this pixelvalve sources from. */
>         int hvs_output;
>  };
> @@ -471,9 +474,6 @@ struct vc4_crtc {
>         /* Timestamp at start of vblank irq - unaffected by lock delays. */
>         ktime_t t_vblank;
>
> -       /* Which HVS channel we're using for our CRTC. */
> -       int channel;
> -
>         u8 lut_r[256];
>         u8 lut_g[256];
>         u8 lut_b[256];
> @@ -509,6 +509,7 @@ struct vc4_crtc_state {
>         struct drm_mm_node mm;
>         bool feed_txp;
>         bool txp_armed;
> +       unsigned int assigned_channel;
>
>         struct {
>                 unsigned int left;
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 6fd9de1dc65a..50e88f634799 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -161,6 +161,7 @@ static void vc4_hvs_lut_load(struct drm_crtc *crtc)
>         struct drm_device *dev = crtc->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> +       struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
>         u32 i;
>
>         /* The LUT memory is laid out with each HVS channel in order,
> @@ -169,7 +170,7 @@ static void vc4_hvs_lut_load(struct drm_crtc *crtc)
>          */
>         HVS_WRITE(SCALER_GAMADDR,
>                   SCALER_GAMADDR_AUTOINC |
> -                 (vc4_crtc->channel * 3 * crtc->gamma_size));
> +                 (vc4_state->assigned_channel * 3 * crtc->gamma_size));
>
>         for (i = 0; i < crtc->gamma_size; i++)
>                 HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_r[i]);
> @@ -249,12 +250,12 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
>                         crtc->state->event = NULL;
>                 }
>
> -               HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
> +               HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
>                           vc4_state->mm.start);
>
>                 spin_unlock_irqrestore(&dev->event_lock, flags);
>         } else {
> -               HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
> +               HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
>                           vc4_state->mm.start);
>         }
>  }
> @@ -264,7 +265,6 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
>  {
>         struct drm_device *dev = crtc->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
> -       struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>         struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
>         struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>         bool oneshot = vc4_state->feed_txp;
> @@ -292,7 +292,7 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
>                                           SCALER5_DISPCTRLX_HEIGHT) |
>                             (oneshot ? SCALER5_DISPCTRLX_ONESHOT : 0);
>
> -       HVS_WRITE(SCALER_DISPCTRLX(vc4_crtc->channel), dispctrl);
> +       HVS_WRITE(SCALER_DISPCTRLX(vc4_state->assigned_channel), dispctrl);
>  }
>
>  void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
> @@ -300,8 +300,8 @@ void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
>  {
>         struct drm_device *dev = crtc->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
> -       struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> -       u32 chan = vc4_crtc->channel;
> +       struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(old_state);
> +       unsigned int chan = vc4_state->assigned_channel;
>
>         if (HVS_READ(SCALER_DISPCTRLX(chan)) &
>             SCALER_DISPCTRLX_ENABLE) {
> @@ -332,7 +332,6 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
>  {
>         struct drm_device *dev = crtc->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
> -       struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>         struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
>         struct drm_plane *plane;
>         struct vc4_plane_state *vc4_plane_state;
> @@ -374,8 +373,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
>                 /* This sets a black background color fill, as is the case
>                  * with other DRM drivers.
>                  */
> -               HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel),
> -                         HVS_READ(SCALER_DISPBKGNDX(vc4_crtc->channel)) |
> +               HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
> +                         HVS_READ(SCALER_DISPBKGNDX(vc4_state->assigned_channel)) |
>                           SCALER_DISPBKGND_FILL);
>
>         /* Only update DISPLIST if the CRTC was already running and is not
> @@ -389,7 +388,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
>                 vc4_hvs_update_dlist(crtc);
>
>         if (crtc->state->color_mgmt_changed) {
> -               u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(vc4_crtc->channel));
> +               u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(vc4_state->assigned_channel));
>
>                 if (crtc->state->gamma_lut) {
>                         vc4_hvs_update_gamma_lut(crtc);
> @@ -401,7 +400,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
>                          */
>                         dispbkgndx &= ~SCALER_DISPBKGND_GAMMA;
>                 }
> -               HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel), dispbkgndx);
> +               HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel), dispbkgndx);
>         }
>
>         if (debug_dump_regs) {
> @@ -414,12 +413,11 @@ void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc)
>  {
>         struct drm_device *dev = crtc->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
> -       struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>         struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
>         struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>         bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
>
> -       if (vc4_crtc->data->hvs_output == 2) {
> +       if (vc4_state->assigned_channel == 2) {
>                 u32 dispctrl;
>                 u32 dsp3_mux;
>
> @@ -443,7 +441,7 @@ void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc)
>                 HVS_WRITE(SCALER_DISPCTRL, dispctrl | dsp3_mux);
>         }
>
> -       HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel),
> +       HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
>                   SCALER_DISPBKGND_AUTOHS |
>                   SCALER_DISPBKGND_GAMMA |
>                   (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 717673b18132..7c8a87339959 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -146,6 +146,107 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
>                   VC4_SET_FIELD(ctm_state->fifo, SCALER_OLEDOFFS_DISPFIFO));
>  }
>
> +static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
> +                                    struct drm_atomic_state *state)
> +{
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_crtc *crtc;
> +       unsigned int i;
> +
> +       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +               struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
> +               u32 dispctrl;
> +               u32 dsp3_mux;
> +
> +               if (!crtc_state->active)
> +                       continue;
> +
> +               if (vc4_state->assigned_channel != 2)
> +                       continue;
> +
> +               /*
> +                * SCALER_DISPCTRL_DSP3 = X, where X < 2 means 'connect DSP3 to
> +                * FIFO X'.
> +                * SCALER_DISPCTRL_DSP3 = 3 means 'disable DSP 3'.
> +                *
> +                * DSP3 is connected to FIFO2 unless the transposer is
> +                * enabled. In this case, FIFO 2 is directly accessed by the
> +                * TXP IP, and we need to disable the FIFO2 -> pixelvalve1
> +                * route.
> +                */
> +               if (vc4_state->feed_txp)
> +                       dsp3_mux = VC4_SET_FIELD(3, SCALER_DISPCTRL_DSP3_MUX);
> +               else
> +                       dsp3_mux = VC4_SET_FIELD(2, SCALER_DISPCTRL_DSP3_MUX);
> +
> +               dispctrl = HVS_READ(SCALER_DISPCTRL) &
> +                          ~SCALER_DISPCTRL_DSP3_MUX_MASK;
> +               HVS_WRITE(SCALER_DISPCTRL, dispctrl | dsp3_mux);
> +       }
> +}
> +
> +static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
> +                                    struct drm_atomic_state *state)
> +{
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_crtc *crtc;
> +       unsigned char dsp2_mux = 0;
> +       unsigned char dsp3_mux = 3;
> +       unsigned char dsp4_mux = 3;
> +       unsigned char dsp5_mux = 3;
> +       unsigned int i;
> +       u32 reg;
> +
> +       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +               struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
> +               struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> +
> +               if (!crtc_state->active)
> +                       continue;
> +
> +               switch (vc4_crtc->data->hvs_output) {
> +               case 2:
> +                       dsp2_mux = (vc4_state->assigned_channel == 2) ? 0 : 1;
> +                       break;
> +
> +               case 3:
> +                       dsp3_mux = vc4_state->assigned_channel;
> +                       break;
> +
> +               case 4:
> +                       dsp4_mux = vc4_state->assigned_channel;
> +                       break;
> +
> +               case 5:
> +                       dsp5_mux = vc4_state->assigned_channel;
> +                       break;
> +
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       reg = HVS_READ(SCALER_DISPECTRL);
> +       HVS_WRITE(SCALER_DISPECTRL,
> +                 (reg & ~SCALER_DISPECTRL_DSP2_MUX_MASK) |
> +                 VC4_SET_FIELD(dsp2_mux, SCALER_DISPECTRL_DSP2_MUX));
> +
> +       reg = HVS_READ(SCALER_DISPCTRL);
> +       HVS_WRITE(SCALER_DISPCTRL,
> +                 (reg & ~SCALER_DISPCTRL_DSP3_MUX_MASK) |
> +                 VC4_SET_FIELD(dsp3_mux, SCALER_DISPCTRL_DSP3_MUX));
> +
> +       reg = HVS_READ(SCALER_DISPEOLN);
> +       HVS_WRITE(SCALER_DISPEOLN,
> +                 (reg & ~SCALER_DISPEOLN_DSP4_MUX_MASK) |
> +                 VC4_SET_FIELD(dsp4_mux, SCALER_DISPEOLN_DSP4_MUX));
> +
> +       reg = HVS_READ(SCALER_DISPDITHER);
> +       HVS_WRITE(SCALER_DISPDITHER,
> +                 (reg & ~SCALER_DISPDITHER_DSP5_MUX_MASK) |
> +                 VC4_SET_FIELD(dsp5_mux, SCALER_DISPDITHER_DSP5_MUX));
> +}
> +
>  static void
>  vc4_atomic_complete_commit(struct drm_atomic_state *state)
>  {
> @@ -157,9 +258,9 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>         int i;
>
>         for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> -               struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> +               struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(new_crtc_state);
>
> -               vc4_hvs_mask_underrun(dev, vc4_crtc->channel);
> +               vc4_hvs_mask_underrun(dev, vc4_crtc_state->assigned_channel);
>         }
>
>         if (vc4->hvs->hvs5)
> @@ -173,6 +274,11 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>
>         vc4_ctm_commit(vc4, state);
>
> +       if (vc4->hvs->hvs5)
> +               vc5_hvs_pv_muxing_commit(vc4, state);
> +       else
> +               vc4_hvs_pv_muxing_commit(vc4, state);
> +
>         drm_atomic_helper_commit_planes(dev, state, 0);
>
>         drm_atomic_helper_commit_modeset_enables(dev, state);
> @@ -382,8 +488,11 @@ vc4_ctm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>
>                 /* CTM is being enabled or the matrix changed. */
>                 if (new_crtc_state->ctm) {
> +                       struct vc4_crtc_state *vc4_crtc_state =
> +                               to_vc4_crtc_state(new_crtc_state);
> +
>                         /* fifo is 1-based since 0 disables CTM. */
> -                       int fifo = to_vc4_crtc(crtc)->channel + 1;
> +                       int fifo = vc4_crtc_state->assigned_channel + 1;
>
>                         /* Check userland isn't trying to turn on CTM for more
>                          * than one CRTC at a time.
> @@ -493,10 +602,60 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
>         .atomic_destroy_state = vc4_load_tracker_destroy_state,
>  };
>
> +#define NUM_OUTPUTS  6
> +#define NUM_CHANNELS 3
> +
>  static int
>  vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>  {
> -       int ret;
> +       unsigned long unassigned_channels = GENMASK(NUM_CHANNELS - 1, 0);
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_crtc *crtc;
> +       int i, ret;
> +
> +       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +               struct vc4_crtc_state *vc4_crtc_state =
> +                       to_vc4_crtc_state(crtc_state);
> +               struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> +               unsigned int matching_channels;
> +
> +               if (!crtc_state->active)
> +                       continue;
> +
> +               /*
> +                * The problem we have to solve here is that we have
> +                * up to 7 encoders, connected to up to 6 CRTCs.
> +                *
> +                * Those CRTCs, depending on the instance, can be
> +                * routed to 1, 2 or 3 HVS FIFOs, and we need to set
> +                * the change the muxing between FIFOs and outputs in
> +                * the HVS accordingly.
> +                *
> +                * It would be pretty hard to come up with an
> +                * algorithm that would generically solve
> +                * this. However, the current routing trees we support
> +                * allow us to simplify a bit the problem.
> +                *
> +                * Indeed, with the current supported layouts, if we
> +                * try to assign in the ascending crtc index order the
> +                * FIFOs, we can't fall into the situation where an
> +                * earlier CRTC that had multiple routes is assigned
> +                * one that was the only option for a later CRTC.
> +                *
> +                * If the layout changes and doesn't give us that in
> +                * the future, we will need to have something smarter,
> +                * but it works so far.
> +                */
> +               matching_channels = unassigned_channels & vc4_crtc->data->hvs_available_channels;
> +               if (matching_channels) {
> +                       unsigned int channel = ffs(matching_channels) - 1;
> +
> +                       vc4_crtc_state->assigned_channel = channel;
> +                       unassigned_channels &= ~BIT(channel);
> +               } else {
> +                       return -EINVAL;
> +               }
> +       }
>
>         ret = vc4_ctm_atomic_check(dev, state);
>         if (ret < 0)
> diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
> index 91b785725555..7fbac68b6fe1 100644
> --- a/drivers/gpu/drm/vc4/vc4_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_regs.h
> @@ -286,9 +286,19 @@
>
>  #define SCALER_DISPID                           0x00000008
>  #define SCALER_DISPECTRL                        0x0000000c
> +# define SCALER_DISPECTRL_DSP2_MUX_SHIFT       31
> +# define SCALER_DISPECTRL_DSP2_MUX_MASK                VC4_MASK(31, 31)
> +
>  #define SCALER_DISPPROF                         0x00000010
> +
>  #define SCALER_DISPDITHER                       0x00000014
> +# define SCALER_DISPDITHER_DSP5_MUX_SHIFT      30
> +# define SCALER_DISPDITHER_DSP5_MUX_MASK       VC4_MASK(31, 30)
> +
>  #define SCALER_DISPEOLN                         0x00000018
> +# define SCALER_DISPEOLN_DSP4_MUX_SHIFT                30
> +# define SCALER_DISPEOLN_DSP4_MUX_MASK         VC4_MASK(31, 30)
> +
>  #define SCALER_DISPLIST0                        0x00000020
>  #define SCALER_DISPLIST1                        0x00000024
>  #define SCALER_DISPLIST2                        0x00000028
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index f39d9900d027..a2380d856000 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -452,6 +452,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
>  }
>
>  static const struct vc4_crtc_data vc4_txp_crtc_data = {
> +       .hvs_available_channels = BIT(2),
>         .hvs_output = 2,
>  };
>
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
