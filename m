Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB4489B18
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 15:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079F6113A64;
	Mon, 10 Jan 2022 14:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC011139DB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 14:12:29 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id w27so14902240qkj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 06:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4DQvnQ3Cgyp1i2b8VzPQ4ffSeU79jX0QQNrlOvytV+k=;
 b=OUoKQA5Bq99RZPfc/HvGf3IC0D0ABjqCwC4nhlM5NAzpqqcuigYGd2HXdBYHHsC9sG
 iK9MHGCKPpDTicEzbuKas1BW+7NlK5CttyrOGXV2O9hE/9CmP780h/Qr8WZzGY6m29xf
 xBQjrx7OzvS/2SMa3KpRiXvuJ+eZlhfnwAKEcFGlBG1kdSJ/M4S/oqatBIdq9C6ufCfp
 OMhkMCm7mM5YPt2QFK0gXY6mfj9JU1atLPNdpibcHx75wcKvggfl2hj1u17ww/f7nXDG
 1ZfE/83az1RzrQI1DH4o5qquWTFw0CRNkEA2MjWyVMuliSpZ0Mtr3VyUjIiX7mrJhYUq
 ZXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4DQvnQ3Cgyp1i2b8VzPQ4ffSeU79jX0QQNrlOvytV+k=;
 b=Aw9acmRxwipsgj6AdWw38vpSG7gzKxbzbTZLXD822g3SIzW4oBZn4JbmaAsZQRy+Wc
 LX3x1e+AOrfLz3kNLkYCsWYiG2GdfY4wycdKDyi3esOudmVf60jO+5yL0nTnxODycQU7
 OTJceMOac0Hb2D3IVEtHiVuymyOhpfjn9+WUsbF2ZQGvyPXJ3rHFWECWvqsgwEha6LoY
 pVpTymCRYJ7ii5XjUkKDy2UR96F04iOCY8MbK/td72hcG01dV3waQGwkbauD3jaEd+7Y
 nM7qrxzZZK+gothsNJZHH75+NnQCawqdtwROWtTMnzB5DXIujHJZTKtvs+fBYjRIhw2D
 Qk5w==
X-Gm-Message-State: AOAM531vSxUk5DNl8TcMTSgsa2w9tUWM1gHzRsxF8W+zFeWOUFjr6Yxw
 Db1W1q6vMSvfj3/osFD6GLU6oPjurpHW5+vUKtsmsw==
X-Google-Smtp-Source: ABdhPJwc8URm7uyLRQ1JKPTzT8ft0eFiJWdpt88+kIZ845z3s0s9BABfuWZHZDyFD3Yj2xexfrVnVs0bMA5zP14V0ow=
X-Received: by 2002:a05:620a:1e1:: with SMTP id
 x1mr11386078qkn.363.1641823948169; 
 Mon, 10 Jan 2022 06:12:28 -0800 (PST)
MIME-Version: 1.0
References: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
 <1641819337-17037-3-git-send-email-quic_rajeevny@quicinc.com>
In-Reply-To: <1641819337-17037-3-git-send-email-quic_rajeevny@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Jan 2022 17:12:17 +0300
Message-ID: <CAA8EJpr_iEvv3oM-KteT7or3HyMk45Z8mzWyKwZ=rnASm-hNXA@mail.gmail.com>
Subject: Re: [v2 2/3] drm/msm/dsi: Add dsi phy tuning configuration support
To: Rajeev Nandan <quic_rajeevny@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, freedreno@lists.freedesktop.org,
 jonathan@marek.ca, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jan 2022 at 15:56, Rajeev Nandan <quic_rajeevny@quicinc.com> wrote:
>
> Add support for MSM DSI PHY tuning configuration. Current design is
> to support drive strength and drive level/amplitude tuning for
> 10nm PHY version, but this can be extended to other PHY versions.
>
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> ---
>
> Changes in v2:
>  - New.
>  - Split into generic code and 10nm-specific part (Dmitry Baryshkov)
>
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c |  3 +++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h | 16 ++++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 8c65ef6..ee3739d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -739,6 +739,9 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>                 }
>         }
>
> +       if (phy->cfg->ops.tuning_cfg_init)
> +               phy->cfg->ops.tuning_cfg_init(phy);

Please rename to parse_dt_properties() or something like that.

> +
>         ret = dsi_phy_regulator_init(phy);
>         if (ret)
>                 goto fail;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index b91303a..b559a2b 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -25,6 +25,7 @@ struct msm_dsi_phy_ops {
>         void (*save_pll_state)(struct msm_dsi_phy *phy);
>         int (*restore_pll_state)(struct msm_dsi_phy *phy);
>         bool (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
> +       void (*tuning_cfg_init)(struct msm_dsi_phy *phy);
>  };
>
>  struct msm_dsi_phy_cfg {
> @@ -81,6 +82,20 @@ struct msm_dsi_dphy_timing {
>  #define DSI_PIXEL_PLL_CLK              1
>  #define NUM_PROVIDED_CLKS              2
>
> +#define DSI_LANE_MAX                   5
> +
> +/**
> + * struct msm_dsi_phy_tuning_cfg - Holds PHY tuning config parameters.
> + * @rescode_offset_top: Offset for pull-up legs rescode.
> + * @rescode_offset_bot: Offset for pull-down legs rescode.
> + * @vreg_ctrl: vreg ctrl to drive LDO level
> + */
> +struct msm_dsi_phy_tuning_cfg {
> +       u8 rescode_offset_top[DSI_LANE_MAX];
> +       u8 rescode_offset_bot[DSI_LANE_MAX];
> +       u8 vreg_ctrl;
> +};

How generic is this? In other words, you are adding a struct with the
generic name to the generic structure. I'd expect that it would be
common to several PHY generations.

> +
>  struct msm_dsi_phy {
>         struct platform_device *pdev;
>         void __iomem *base;
> @@ -98,6 +113,7 @@ struct msm_dsi_phy {
>
>         struct msm_dsi_dphy_timing timing;
>         const struct msm_dsi_phy_cfg *cfg;
> +       struct msm_dsi_phy_tuning_cfg tuning_cfg;
>
>         enum msm_dsi_phy_usecase usecase;
>         bool regulator_ldo_mode;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
