Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039D886D0B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 14:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CB5112488;
	Fri, 22 Mar 2024 13:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uaTq7T4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A93112489
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 13:31:06 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-60a5a11b59dso22944677b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711114265; x=1711719065; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nKSrfsCzVcwON1miF/nJghTVlXIY9BQztSw13EPVqsY=;
 b=uaTq7T4ZHL3XNdUx3WAAzBZ6g5BA6JvpZx5LR822WASp/dzT2D7pcNCo+EcsOoM7Sw
 OX0pRsqR5g+LrR/1UpM8QAoDoijG/Hvo6fxhESvNQE66WSIQo81ZRlwOOQnbQ9rvVlkJ
 vBQvvj2PkKBlPTWd5QP5fSWMh8Qi17d9XgKQXsowmLyrJxsDnaabwFnFSGDBoFxDZl0/
 +703sVbqUvImyCoVwca7YztlPjOphelftSXrruNnIgxYSxaIVpaK+SKYiaxu2LzuIbE4
 PocqzE37bxya1uHBs6Yac4gdR2u7XuGi1xPLGy/UgqflmpRDLbyULsZw+Hs8a65hcrtV
 OlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711114265; x=1711719065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nKSrfsCzVcwON1miF/nJghTVlXIY9BQztSw13EPVqsY=;
 b=jeDLTvEUylUSRzrW7bss1bNtOqjMJjsdeEmnCHDNikQgpBOIKzacDp3aq1qrau61X7
 A0EjCd8pLxJlXx1uDdzkLLHdAiRUjwTWzAtoLXOXVvgEGLBRPdZ0pDGAWxN8Dc8o9VUD
 TXEk6uKOz1jETFATSGPv3KiMS/5CjfMNNHvLwGWv9ib4krtkaglm32q3oiK/wL0pA37f
 K+SCh0fOliONhMTmtu8UMpAKPq6U2yD/BXdPSRSYdJirB8uMY8y4pQJjjGzI9lJdu5o1
 BPWbROXcERV9aki/YddAVammEPY5w97w+nCSGd+lO8BQFP9uES6derBeuGGdt2cOjv/c
 nMow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs9YPvzB+8DyQNha/5RI4uA1YzGeDLw02lNR2umHLu/YadKXhktpegSob+KJunV9b5NevOpXipbt2GVQ9wytCB/vfkhe4E8gJvW8acthn7
X-Gm-Message-State: AOJu0YwA5nrudSRGiobF4dMvl3p7V3LfpF9umCJ/931VkpehdmXTgkUF
 NcOSryrGkC/JWcOqee1jvotCphWI2MlFIDHj3RskErbw+qmNZpdKz9hUVvvuVUqHeEiKGKr9YTv
 72JWrh6mSbg7b9okzZzIRLilzUgSCabsnnBwT/A==
X-Google-Smtp-Source: AGHT+IH5D7oINyyS4I7mJfjQsUG8tjEnZb27UduJJvC4NRi0Ic4EVPL4891T5fcpIsZnAyGZGlX1vXTstxDaw+yL7Vk=
X-Received: by 2002:a25:84ca:0:b0:dcc:d694:b4a6 with SMTP id
 x10-20020a2584ca000000b00dccd694b4a6mr2044325ybm.15.1711114265437; Fri, 22
 Mar 2024 06:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
 <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
In-Reply-To: <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 15:30:54 +0200
Message-ID: <CAA8EJpp6V5qVzbYtnU=JjO8FX45fcxBvWsD3PWQ5bu5wuv-T=g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm/dp: Add support for determining the eDP/DP
 mode from DT
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Mar 2024 at 15:22, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Instead of relying on different compatibles for eDP and DP, lookup
> the panel node in devicetree to figure out the connector type and
> then pass on that information to the PHY. External DP is not described

Nit: External DP doesn't have a panel described in DT...

> in DT, therefore, assume it's eDP if panel node is present.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 43 +++++++++++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c4cb82af5c2f..c9763f77c832 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -726,6 +726,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>         if (IS_ERR(phy))
>                 return PTR_ERR(phy);
>
> +       rc = phy_set_mode_ext(phy, PHY_MODE_DP,
> +                             dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
> +       if (rc) {
> +               DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
> +               dp->catalog = NULL;
> +               goto error;
> +       }
> +
>         dp->catalog = dp_catalog_get(dev);
>         if (IS_ERR(dp->catalog)) {
>                 rc = PTR_ERR(dp->catalog);
> @@ -734,9 +742,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>                 goto error;
>         }
>
> -       dp->aux = dp_aux_get(dev, dp->catalog,
> -                            phy,
> -                            dp->dp_display.is_edp);
> +       dp->aux = dp_aux_get(dev, dp->catalog, phy, dp->dp_display.is_edp);

Unrelated

>         if (IS_ERR(dp->aux)) {
>                 rc = PTR_ERR(dp->aux);
>                 DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
> @@ -1241,6 +1247,35 @@ static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
>         return dp_display_probe_tail(aux->dev);
>  }
>
> +static int dp_display_get_connector_type(struct platform_device *pdev,
> +                                        const struct msm_dp_desc *desc)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *aux_bus;
> +       struct device_node *panel;
> +       int ret = DRM_MODE_CONNECTOR_DisplayPort;
> +
> +       /* legacy platforms specify connector type in match data */
> +       if (desc->connector_type == DRM_MODE_CONNECTOR_eDP ||
> +               desc->connector_type == DRM_MODE_CONNECTOR_DisplayPort)

misaligned

> +               return desc->connector_type;

Can we drop this part completely?

> +
> +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +       if (!aux_bus)
> +               goto out;
> +
> +       panel = of_get_child_by_name(aux_bus, "panel");
> +       if (!panel)
> +               goto out;
> +
> +       ret = DRM_MODE_CONNECTOR_eDP;
> +
> +out:
> +       of_node_put(panel);
> +       of_node_put(aux_bus);
> +       return ret;
> +}
> +
>  static int dp_display_probe(struct platform_device *pdev)
>  {
>         int rc = 0;
> @@ -1263,7 +1298,7 @@ static int dp_display_probe(struct platform_device *pdev)
>         dp->dp_display.pdev = pdev;
>         dp->name = "drm_dp";
>         dp->id = desc->id;
> -       dp->dp_display.connector_type = desc->connector_type;
> +       dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
>         dp->wide_bus_supported = desc->wide_bus_supported;
>         dp->dp_display.is_edp =
>                 (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
