Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC7B82A4F7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 00:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0C410E69D;
	Wed, 10 Jan 2024 23:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67F210E69D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 23:39:06 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5ed10316e22so44149677b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 15:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704929946; x=1705534746; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qv5xXL6A+2J+1KA1k07jEHKx6VrItsmSJjrNVSwQV2Q=;
 b=IGre0zjYPrCHQda8hv/zneGvk3olpNGKuVAtbZ7FexMFJcaJQimGmWTU4IynxXiB/D
 oJ0rDRH7wBHtp06AJe0kfbUhc8QkjjKMoMmx6mxn5ZHhWQaiaKsVKUEA7NbPCq2+JNfX
 meaKYqNJmAueQrhco930wvvRuYX6/jIKTOyo0kMKRCQmF9GrvZNDy4io8Ou3FgtgRl2k
 wAGWfBhs40+tPVyX7/c+FjPz+M9Wm30WutJMgt7CzA67vGl0lthcpdwVoOBKyddpc1xF
 tFK5i9Lul8/8Kdaq6lI1/CS0v8U3rN4vUhisT6xdVut3+SgP5vw/sBy5DDo418PXobGj
 Jmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704929946; x=1705534746;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qv5xXL6A+2J+1KA1k07jEHKx6VrItsmSJjrNVSwQV2Q=;
 b=wG3TnZqjh/rbeznSspQEyIA9QoKQ3rTZ/PX8ptc8dGSQRdvjwLZQNQx8Ldxstoi3Qo
 7qYCZQHFOnLElartP5pI2yCInDtAODgTM7p9GmUHkKNkfH8vHsvyhwrGCak8I4og+cYN
 Z3budEYNiuWP2Cf82HWFIlCaEm3xElbkqhUjMdEuhjyj651cNIYGRDAWL+dzhthttvuu
 33hpNGNRNjmftmbCCQEUKE0HA1DiBNtizVzZIlu5TT7j/jPXHqDQEcV6sGg5spK15ujJ
 4u9bX/XIkbblRnziZv9ryA0kJqplHZ8zaVhACI5oatBI9Q84GZ6TJT/A8Vq7QntyoN1z
 GEMQ==
X-Gm-Message-State: AOJu0Yz2Pfl1T0LktUn88rW8PMjViHbG6NxHrs+GBLpNiFy8dFQLMl8L
 MFcfuiefAIO8UvjHa3T6T0qVx8SYxGH+pknBt0pRhzfPBoCBqw==
X-Google-Smtp-Source: AGHT+IELbhs6J/vYJKH6p9upru1FLiSNRZUYT+IjljI5i3mV9Lgk53N2Nt8oekCONRvnRPwD07Z7MNCLhbwBqWQFrCE=
X-Received: by 2002:a81:ee04:0:b0:5f8:f50e:bd36 with SMTP id
 l4-20020a81ee04000000b005f8f50ebd36mr347845ywm.96.1704929945816; Wed, 10 Jan
 2024 15:39:05 -0800 (PST)
MIME-Version: 1.0
References: <1704917888-30039-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1704917888-30039-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 01:38:54 +0200
Message-ID: <CAA8EJprkotYgo8je2+N=aZGxEReHgLR_rooKQBOWqRn+dgKtSQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: correct configure Colorimetry Indicator
 Field at MISC0
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Jan 2024 at 22:18, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field. At current
> implementation, Colorimetry Indicator Field of MISC0 is not configured
> correctly. This patch add support of RGB formats Colorimetry.

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Also the commit message doesn't provide any details or what was incorrect.

>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  |  5 ++--
>  drivers/gpu/drm/msm/dp/dp_link.c  | 26 ++++++++++++++++-----
>  drivers/gpu/drm/msm/dp/dp_panel.c | 48 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
>  4 files changed, 73 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 77a8d93..2ef89fb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2012-2023, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved
>   */
>
>  #define pr_fmt(fmt)    "[drm-dp] %s: " fmt, __func__
> @@ -172,7 +173,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>
>         tb = dp_link_get_test_bits_depth(ctrl->link,
>                 ctrl->panel->dp_mode.bpp);
> -       cc = dp_link_get_colorimetry_config(ctrl->link);
> +       cc = dp_panel_get_misc_colorimetry_val(ctrl->panel);
>         dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
>         dp_panel_timing_cfg(ctrl->panel);
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 98427d4..21fa1a2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved
>   */
>
>  #define pr_fmt(fmt)    "[drm-dp] %s: " fmt, __func__
> @@ -12,6 +13,11 @@
>
>  #define DP_TEST_REQUEST_MASK           0x7F
>
> +enum dynamic_range {
> +       DP_DYNAMIC_RANGE_RGB_VESA,
> +       DP_DYNAMIC_RANGE_RGB_CEA,
> +};
> +
>  enum audio_sample_rate {
>         AUDIO_SAMPLE_RATE_32_KHZ        = 0x00,
>         AUDIO_SAMPLE_RATE_44_1_KHZ      = 0x01,
> @@ -1083,6 +1089,7 @@ int dp_link_process_request(struct dp_link *dp_link)
>  int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>  {
>         u32 cc;
> +       enum dynamic_range dr;
>         struct dp_link_private *link;
>
>         if (!dp_link) {
> @@ -1092,14 +1099,21 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>
>         link = container_of(dp_link, struct dp_link_private, dp_link);
>
> -       /*
> -        * Unless a video pattern CTS test is ongoing, use RGB_VESA
> -        * Only RGB_VESA and RGB_CEA supported for now
> -        */
> +       /* unless a video pattern CTS test is ongoing, use CEA_VESA */
>         if (dp_link_is_video_pattern_requested(link))
> -               cc = link->dp_link.test_video.test_dyn_range;
> +               dr = link->dp_link.test_video.test_dyn_range;

test_dyn_range has the value of (dpcd[DP_TEST_MISC0] &
DP_TEST_DYNAMIC_RANGE_CEA), so it can not be assigned to dr.

I don't feel like this has been tested.

>         else
> -               cc = DP_TEST_DYNAMIC_RANGE_VESA;
> +               dr = DP_DYNAMIC_RANGE_RGB_VESA;
> +
> +       /* Only RGB_VESA and RGB_CEA supported for now */
> +       switch (dr) {
> +       case DP_DYNAMIC_RANGE_RGB_CEA:
> +               cc = BIT(2);

No undefined magic, please.

> +               break;
> +       case DP_DYNAMIC_RANGE_RGB_VESA:
> +       default:
> +               cc = 0;
> +       }
>
>         return cc;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 127f6af..785bb59 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved
>   */
>
>  #include "dp_panel.h"
> @@ -386,6 +387,53 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>         return 0;
>  }
>
> +/*
> + * Mapper function which outputs colorimetry to be used for a
> + * given colorspace value when misc field of MSA is used to
> + * change the colorimetry. Currently only RGB formats have been
> + * added. This API will be extended to YUV once it's supported on DP.
> + */
> +u8 dp_panel_get_misc_colorimetry_val(struct dp_panel *dp_panel)
> +{
> +       u8 colorimetry;
> +       u32 colorspace;
> +       u32 cc;
> +       struct dp_panel_private *panel;
> +
> +       panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
> +       cc = dp_link_get_colorimetry_config(panel->link);
> +       /*
> +        * If there is a non-zero value then compliance test-case
> +        * is going on, otherwise we can honor the colorspace setting
> +        */
> +       if (cc)
> +               return cc;
> +
> +       colorspace = dp_panel->connector->state->colorspace;

The driver doesn't attach the colorspace property, so this part is
useless. Anyway, I think adding colorimetry support will require more
changes than just setting the register in the DisplayPort controller.

> +       drm_dbg_dp(panel->drm_dev, "colorspace=%d\n", colorspace);
> +
> +       switch (colorspace) {
> +       case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
> +       case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> +               colorimetry = 0x7;
> +               break;
> +       case DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
> +               colorimetry = 0x3;
> +               break;
> +       case DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
> +               colorimetry = 0xb;
> +               break;
> +       case DRM_MODE_COLORIMETRY_OPRGB:
> +               colorimetry = 0xc;

Please define these magic values.

> +               break;
> +       default:
> +               colorimetry = 0;        /* legacy RGB mode */
> +       }
> +
> +       return colorimetry;
> +}
> +
>  struct dp_panel *dp_panel_get(struct dp_panel_in *in)
>  {
>         struct dp_panel_private *panel;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index a0dfc57..c34a51d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved
>   */
>
>  #ifndef _DP_PANEL_H_
> @@ -65,6 +66,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>                 struct drm_connector *connector);
>  void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
>  void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
> +u8 dp_panel_get_misc_colorimetry_val(struct dp_panel *dp_panel);
>
>  /**
>   * is_link_rate_valid() - validates the link rate
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
