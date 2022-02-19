Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3574BC521
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 04:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCD410EB31;
	Sat, 19 Feb 2022 03:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C13110EB31
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 03:02:15 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id s8so5086769oij.13
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 19:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/aL39Z+/g+dDunOKEkaaG/tOKqWyPS3k7avsFh9Lne4=;
 b=flpsNJFtWTy2yRtjs2ojwi77DizDk9HOYIt6foK4Q7ndEtm6poQ1iskpuPaG2xOxy2
 cKXdZHfmbw9BxA7ZHFeCycVv0NXHeDbY2DeuNFxMCmc3luBSdvoQPqErDxqH9jQYcSCt
 scvso1n2GPqzKjcKfb1I0gnt1GAEyX/9tdepI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/aL39Z+/g+dDunOKEkaaG/tOKqWyPS3k7avsFh9Lne4=;
 b=CsYYlpccZzqQvsG24jW3dT8mg2JwRHp+nAZOtqpA+ul+aMm5/qS1DUe0u/tU34xM2U
 KCAZM24EmsjTYUndVLi5hfM2hojb2Gct9x1jvIvuvOnKzt04yq+ieTh7dk4Gb9DMV9Oa
 yN8RadVVFgfqOVOS9I+HdnFJdXq6p7sOCPsawg77ph5w0Fo2sO6+LPRvSwcOzTgyaBw6
 XoLTKLDwdGR15pXhVH/kWVjM2uFAqghYTvmcAYuO+KsBNoNAbpRWlIhfZADK/5+ajB74
 or9vUMYWZbpo4OFexwP9FKkkC3IKvco6i2olr9sAiaOrbxO8DJDJog637YPEs+oZxiNy
 c1NQ==
X-Gm-Message-State: AOAM530wiVbvtdvG8T6bh8+4Qw5CJb6EYgguaFGPReBrJEuNIVyx1wW8
 rk44CgOxiVr8cUWpCjl+ML+zMDUTdhf0C8X/4Bk9og==
X-Google-Smtp-Source: ABdhPJyTrVif3DX8Xtnalz1sr5dnWdhvQiHw4aCJ/Me1nIAlSUMyfKMCXaya8cz45jki7GYCtRslmo+guYGfBJ1+0Tc=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr6329158oig.40.1645239734376; Fri, 18
 Feb 2022 19:02:14 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 19:02:13 -0800
MIME-Version: 1.0
In-Reply-To: <1645133788-5057-5-git-send-email-quic_khsieh@quicinc.com>
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com>
 <1645133788-5057-5-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 19:02:13 -0800
Message-ID: <CAE-0n51v_2V4CnLzciagKYxtzALcyL5e1PgTDw28Aq7iFGNt_A@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] drm/msm/dp: enable widebus feature for display port
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-17 13:36:28)
> Widebus feature will transmit two pixel data per pixel clock to interface.
> This feature now is required to be enabled to easy migrant to higher

s/migrant/migrate/?

> resolution applications in future. However since some legacy chipsets

s/in/in the/

> does not support this feature, this feature is enabled base on chip's

s/does not/don't/

> hardware revision.
>
> changes in v2:
> -- remove compression related code from timing
> -- remove op_info from  struct msm_drm_private
> -- remove unnecessary wide_bus_en variables
> -- pass wide_bus_en into timing configuration by struct msm_dp
>
> Changes in v3:
> -- split patch into 3 patches
> -- enable widebus feature base on chip hardware revision
>
> Changes in v5:
> -- DP_INTF_CONFIG_DATABUS_WIDEN
>
> Changes in v6:
> -- static inline bool msm_dp_wide_bus_enable() in msm_drv.h
>
> Changes in v7:
> -- add Tested-by
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 +++-
>  drivers/gpu/drm/msm/dp/dp_catalog.c         | 34 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_catalog.h         |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c            | 13 +++++++----
>  drivers/gpu/drm/msm/dp/dp_ctrl.h            |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c         | 30 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h         |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c           |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_panel.h           |  2 +-
>  drivers/gpu/drm/msm/msm_drv.h               |  6 +++++
>  10 files changed, 88 insertions(+), 11 deletions(-)

My mind is blown by the amount of lines that have to change to plumb
through wide_bus_en bool argument. This driver has too many layers.

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 64f0b26..5c809c6f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -1796,6 +1796,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>         int ret = 0;
>         bool mainlink_ready = false;
>         struct dp_ctrl_private *ctrl;
> +       u32 pixel_rate_orig;

Why u32? Just unsigned long pixel_rate?

>
>         if (!dp_ctrl)
>                 return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e89556ad..bc86c03 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -979,6 +983,7 @@ int dp_display_get_modes(struct msm_dp *dp,
>                 dp->connector, dp_mode);
>         if (dp_mode->drm_mode.clock)
>                 dp->max_pclk_khz = dp_mode->drm_mode.clock;
> +
>         return ret;
>  }
>

This hunk is useless.

> @@ -1451,6 +1456,28 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>         }
>  }
>
> +bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
> +{
> +       struct dp_display_private *dp;
> +       u32 revision, major, minor;
> +
> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +       /* for the time being widebus only support on DP */

/* TODO: For the time being only support widebus on DP */

> +       if (dp_display->connector_type  == DRM_MODE_CONNECTOR_DisplayPort) {
> +               revision = dp_catalog_hw_revision(dp->catalog);
> +               major = ((revision >> 28) & 0x0ff);
> +               minor = ((revision >> 16) & 0x0fff);

Use GENMASK() and FIELD_GET()?

> +
> +               DRM_DEBUG_DP("id=%d major=%d minor=%d\n", dp->id, major, minor);
> +
> +               if (major >= 1 && minor >= 2)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>  {
>         struct dp_display_private *dp;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 07f6c41..d11bf5c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -398,6 +398,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display);
>  void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
> +bool msm_dp_wide_bus_enable(struct msm_dp *dp_display);

A better name would be msm_dp_wide_bus_available()
