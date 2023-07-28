Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB376690E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B5F10E6C1;
	Fri, 28 Jul 2023 09:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E912B10E6C1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:37:28 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d0b597e7ac1so1796524276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 02:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690537048; x=1691141848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JlZf2RL3i6UDORQb9mZw6fYIEm2cS2iGuc+pwaym0fI=;
 b=uUz/3R3iJOplNYB1AkkHSjLhoozRziAFHJjM631Jfbue8Cm+UFJjT0tGZCToZB1gcU
 4IyPWiViAfuq6WdsCO23qHimmlsX0XzNNE7K9OxEU99kmjk/fxyA37ByIf5gDDICcBuZ
 Q3G++K7KkaqCZkMCXAnPkDuDlyX1mjsAf8wyXiPqrLxA/AW9GcLzl6ul3rk4iSreEC2Y
 BUcIoCMXwphAz8I2/h1BC0TWhRmmjf/MaixUsxb72SuMSdj5ejdQ5q5s7usOup9rK+Zk
 XZtxodYYQYsWVhwofTSMzWCoUFFIWxU99JPF7pIOkpCn1Gi67VBlsruBKj9D7FR3Sfiq
 DRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690537048; x=1691141848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JlZf2RL3i6UDORQb9mZw6fYIEm2cS2iGuc+pwaym0fI=;
 b=Lmg3HexSzlu8wXc8a+bB+KufNTZgqzeuF/eY0qDYViGcLxp4x6GUyJHXkigvBfsidW
 D0q35U5tqGB99EiH9eGZdB5Xr9PAQ2Y91v0MW5v0Q5SsXmXCh3ZNj5LRKGUfqh9f294P
 Hj/UdhpQoN8DI5W5YFpj+szHp1UzqapScexkbc0H8j9xuWkYftUFi1me7K2hgKGbMTQ8
 X0xFC9TN9z4ksBziy/w8wzHMqgn1T0YNb86hDsCS3ickGGy/eUtcccY3cig9+4Ez8AxK
 pAYtsuIxk+BEk+bBrJJpFfV9HUiDUuu70zrYCC7TKwJP4VGxiC5iaQgmRU7mqJ3PViH0
 +etw==
X-Gm-Message-State: ABy/qLYVz4hQRm4fuFQG6KZRkB+WD9FeRun5tAb0XSFZVHL2KG7ybCO+
 C/2HSZTbNb8/ortbDKEjojro12lm33nZOrcYXZQdsg==
X-Google-Smtp-Source: APBJJlHP+0vhBr5pqqSindcVAEKtPZL7T+Mqdb+FcAqoZgG9TNDCetnFMDUrGRwkofjLPfASs0KY9UC1k96BrCfnA5Q=
X-Received: by 2002:a5b:88c:0:b0:bca:7cd:7f32 with SMTP id
 e12-20020a5b088c000000b00bca07cd7f32mr1208001ybq.48.1690537048006; 
 Fri, 28 Jul 2023 02:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230728012623.22991-1-quic_parellan@quicinc.com>
In-Reply-To: <20230728012623.22991-1-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jul 2023 12:37:17 +0300
Message-ID: <CAA8EJpqPgzd4ZSP948MQW=f4EVBHxajj4nwYq5s-OConBP7Vvg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: Enable DSC and CMD mode for Visionox
 VTDR6130 panel
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org, sam@ravnborg.org,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 at 04:26, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Enable display compression (DSC v1.2) and CMD mode for 1080x2400 Visionox
> VTDR6130 AMOLED DSI panel. In addition, this patch will set the default
> to command mode with DSC enabled.
>
> Note: This patch has only been validated DSC over command mode as DSC over
> video mode has never been validated for the MSM driver before.
>
> Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]
>
> Changes since v1:
>  - Changed from email address
>
> [1] https://patchwork.freedesktop.org/series/121337/
>
> Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 ++++++++++++++++++-
>  1 file changed, 73 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index e1363e128e7e..5658d39a3a6b 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>
>  #include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_modes.h>
>  #include <drm/drm_panel.h>
> @@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
>         struct mipi_dsi_device *dsi;
>         struct gpio_desc *reset_gpio;
>         struct regulator_bulk_data supplies[3];
> -       bool prepared;
> +       bool prepared, enabled;
> +       bool video_mode;
>  };
>
>  static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
> @@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>         if (ret)
>                 return ret;
>
> +       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
>         mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>         mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
>         mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>         mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>         mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +
> +       if (ctx->video_mode)
> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +       else
> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
> +
>         mipi_dsi_dcs_write_seq(dsi, 0x70,
>                                0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
>                                0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
> @@ -214,6 +222,42 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
>         .height_mm = 157,
>  };
>
> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
> +{
> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +       struct mipi_dsi_device *dsi = ctx->dsi;
> +       struct drm_dsc_picture_parameter_set pps;
> +       int ret;
> +
> +       if (ctx->enabled)
> +               return 0;
> +
> +       if (!dsi->dsc) {
> +               dev_err(&dsi->dev, "DSC not attached to DSI\n");
> +               return -ENODEV;
> +       }

The error message is misleading. Also, if you don't want to enable DSC
for the video mode, this will break.

> +
> +       drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> +       ret = mipi_dsi_picture_parameter_set(dsi, &pps);
> +       if (ret) {
> +               dev_err(&dsi->dev, "Failed to set PPS\n");
> +               return ret;
> +       }
> +
> +       ctx->enabled = true;

Do we need this refcount just for PPS upload? What will happen if PPS
is uploaded several times?

> +
> +       return 0;
> +}
> +
> +static int visionox_vtdr6130_disable(struct drm_panel *panel)
> +{
> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +
> +       ctx->enabled = false;
> +
> +       return 0;
> +}
> +
>  static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>                                        struct drm_connector *connector)
>  {
> @@ -237,6 +281,8 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
>         .prepare = visionox_vtdr6130_prepare,
>         .unprepare = visionox_vtdr6130_unprepare,
>         .get_modes = visionox_vtdr6130_get_modes,
> +       .enable = visionox_vtdr6130_enable,
> +       .disable = visionox_vtdr6130_disable,
>  };
>
>  static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
> @@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>  {
>         struct device *dev = &dsi->dev;
>         struct visionox_vtdr6130 *ctx;
> +       struct drm_dsc_config *dsc;
>         int ret;
>
>         ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
> +
> +       ctx->video_mode = of_property_read_bool(dev->of_node, "enforce-video-mode");

Please also add a DT bindings patch.

> +
> +       dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
> +       if (!dsc)
> +               return -ENOMEM;

You can add struct drm_dsc_config to struct visionox_vtdr6130 instead
of allocating it.

> +
> +       /* Set DSC params */
> +       dsc->dsc_version_major = 0x1;
> +       dsc->dsc_version_minor = 0x2;
> +
> +       dsc->slice_height = 40;
> +       dsc->slice_width = 540;
> +       dsc->slice_count = 2;
> +       dsc->bits_per_component = 8;
> +       dsc->bits_per_pixel = 8 << 4;
> +       dsc->block_pred_enable = true;
> +
> +       dsi->dsc = dsc;

Only in command mode?

>
>         ctx->supplies[0].supply = "vddio";
>         ctx->supplies[1].supply = "vci";
> @@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>
>         dsi->lanes = 4;
>         dsi->format = MIPI_DSI_FMT_RGB888;
> -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
> -                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +       dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS;

Keep the line split please.

> +       if (ctx->video_mode)
> +               dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
> +
>         ctx->panel.prepare_prev_first = true;
>
>         drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
