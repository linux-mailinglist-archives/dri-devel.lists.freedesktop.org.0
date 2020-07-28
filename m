Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E132306E7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312E789E32;
	Tue, 28 Jul 2020 09:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CDE89E32
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:49:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l2so7076810wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wQ1i30iYSbM1E0tY0uz5+ptChSg4d1LMooSt7pYAIp4=;
 b=A4OpHyoVRkvCtCk/WeGVm4r6+vfXfmRD/RTAzMlpa7itoM/Lw1OkUcHnqNAL/XFv14
 Uv9aobxx3J9cGNv9Lx2IjlobDb54qEf9A9xwV5Ur4XI5VmOc0e6SfAG/R3YzvvYKQTPO
 fK/+QbgKXPkMIKD/c8s4nP6Stgb+NOE+dNwDqVqLd2/AsVyTYjkaYrMbuq1uIlJ9kNjk
 UMMzUvyqWVaCUpcWHajcI7OHUr/y8Pq8/N51Iv9evSWYev2JqfJWszVop9XSxnv3MASs
 3a2DQcijWC6JuqssV7uNZtEoZyF4XnN/q5CmZKnhdKr7oNuwErIYHfrzLwiDh9D9whCo
 YEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wQ1i30iYSbM1E0tY0uz5+ptChSg4d1LMooSt7pYAIp4=;
 b=oPH3JWi2O5pV7WgfoSuinnossKEL3m0FCg+QdItHYdEh8TyMjaNj9DS5pCYJ7szx4v
 4ou2cmRrh3O8qgqvVFJNM6KtBzYW5Qp9VdutD7LM/g3CMjMmAM0EpVhlpmCdpiuS+7qp
 EWBYrD4TsYTY5OPRaBlyRCbH4sdkYP/KNKNBDDIApD4onIwA06pgmGzMCtWg8WzJ8PLQ
 I1NB5UAW66/29+vEexJPAUD8oL0LiENCLBMLVWz9a3ShypQyofq5Dhy+YLBjcJtjjzE4
 CFG6pixcuxU9xihMK+yktkO8AMaFlrN9MIHHFSLHtsQvXtc1c8UeBu0g+2gSpp4+ZOD7
 nZ8Q==
X-Gm-Message-State: AOAM530ZhZ7zJw6gsnB4u7Cj+1ibyMwZ4q1FyU848y1OvaeGgGsSy0HL
 FuCMP25LJ/GpPABEyIzmpMzaq59iNqml5Ygkj58egg==
X-Google-Smtp-Source: ABdhPJzCYKb8DvqERDkL3H9QJlkZgbf25hBn8OO3QFDLQ5DXsMbFlosEaM1m9TBf31uEuGk9GMa/XzF8p9sCGXVxoRI=
X-Received: by 2002:adf:fdce:: with SMTP id i14mr18888180wrs.273.1595929747173; 
 Tue, 28 Jul 2020 02:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <4c3be351dac862a07c30bc32d13de495f1674045.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <4c3be351dac862a07c30bc32d13de495f1674045.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 10:48:52 +0100
Message-ID: <CAPY8ntA_SKfamtwEYQ7Ti+2Kj_x1gTNP7A9OZecOyBOXvc=_AA@mail.gmail.com>
Subject: Re: [PATCH v4 10/78] drm/vc4: crtc: Rename HVS channel to output
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
> In vc5, the HVS has 6 outputs and 3 FIFOs (or channels), with
> pixelvalves each being assigned to a given output, but each output can
> then be muxed to feed from multiple FIFOs.
>
> Since vc4 had that entirely static, both were probably equivalent, but
> since that changes, let's rename hvs_channel to hvs_output in the
> vc4_crtc_data, since a pixelvalve is really connected to an output, and
> not to a FIFO.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 8 ++++----
>  drivers/gpu/drm/vc4/vc4_drv.h  | 4 ++--
>  drivers/gpu/drm/vc4/vc4_hvs.c  | 2 +-
>  drivers/gpu/drm/vc4/vc4_txp.c  | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index fdecaba77836..d3126fe04d9a 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -775,7 +775,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
>
>  static const struct vc4_pv_data bcm2835_pv0_data = {
>         .base = {
> -               .hvs_channel = 0,
> +               .hvs_output = 0,
>         },
>         .debugfs_name = "crtc0_regs",
>         .pixels_per_clock = 1,
> @@ -787,7 +787,7 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
>
>  static const struct vc4_pv_data bcm2835_pv1_data = {
>         .base = {
> -               .hvs_channel = 2,
> +               .hvs_output = 2,
>         },
>         .debugfs_name = "crtc1_regs",
>         .pixels_per_clock = 1,
> @@ -799,7 +799,7 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
>
>  static const struct vc4_pv_data bcm2835_pv2_data = {
>         .base = {
> -               .hvs_channel = 1,
> +               .hvs_output = 1,
>         },
>         .debugfs_name = "crtc2_regs",
>         .pixels_per_clock = 1,
> @@ -862,7 +862,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
>         drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
>                                   crtc_funcs, NULL);
>         drm_crtc_helper_add(crtc, crtc_helper_funcs);
> -       vc4_crtc->channel = vc4_crtc->data->hvs_channel;
> +       vc4_crtc->channel = vc4_crtc->data->hvs_output;
>         drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
>         drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index d80fc3bbb450..d1cf4c038180 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -447,8 +447,8 @@ to_vc4_encoder(struct drm_encoder *encoder)
>  }
>
>  struct vc4_crtc_data {
> -       /* Which channel of the HVS this pixelvalve sources from. */
> -       int hvs_channel;
> +       /* Which output of the HVS this pixelvalve sources from. */
> +       int hvs_output;
>  };
>
>  struct vc4_pv_data {
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 091fdf4908aa..6fd9de1dc65a 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -419,7 +419,7 @@ void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc)
>         struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>         bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
>
> -       if (vc4_crtc->data->hvs_channel == 2) {
> +       if (vc4_crtc->data->hvs_output == 2) {
>                 u32 dispctrl;
>                 u32 dsp3_mux;
>
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index a7c3af0005a0..f39d9900d027 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -452,7 +452,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
>  }
>
>  static const struct vc4_crtc_data vc4_txp_crtc_data = {
> -       .hvs_channel = 2,
> +       .hvs_output = 2,
>  };
>
>  static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
