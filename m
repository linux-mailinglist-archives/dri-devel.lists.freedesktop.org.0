Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D873FF705
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 00:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681176E828;
	Thu,  2 Sep 2021 22:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA4D6E825
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 22:18:51 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id y34so7575265lfa.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 15:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I80/njeEuIl/GJzCkVNPmxV3BIOQ6IK40gpDFUmpFPE=;
 b=tLstc1tkclrh6VOyGN9XpBl8QeZOtuFjU0HMW1kDqb2Ro3mZk9hu2ykmGSK5LV9IO0
 cnD0qj8qJXnnQGJSjxUeWU9eK5WUXuA/q4LmwChkV3jY/PY+JvPKsNGaH9bYiF6OZ2tZ
 e252aM2vQxImXCclXV/qCdELwWNFAB+2LfJKcDbC8H6ZQ2fkcbdRJWz2d7WNF3qxobyD
 cxHCZuA7LdbG6bsMMVrQ93rq/sqzxXo+uiOCkRAW94unqvdYhZVK1FBaV7585PRI59dA
 Qg4lLcdre8f9qfQYqgBP4/A4VwpdqjwkLUePQVbBmWk1N2xKomIrBd0bI5osbXD0j/xn
 Ls4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I80/njeEuIl/GJzCkVNPmxV3BIOQ6IK40gpDFUmpFPE=;
 b=gHOmQeKu6zkKX7459sZbN/bgvYZaMdPJjL/3P60u2zSxtVXn26xie+Vfgy8pSTgJK4
 1zrvMmB7oNsqIS/uTbbP9oMoEp7zYfZkDg01Unc9XZKWFqkzhFGM34N75dIRNoflm9oz
 EWIiMjPsm00LeKHt8PV5PViriIAM2DLAggAiy+Mrd4T1x7B/MJBxPeUrM9jlOQb9L8U1
 Q80IwwLHqqJ+0eEO4dMAtkWAOIj4nLHM1cWvAUZS48gzkocT8LCDr7ah5KfcQ/vivBkr
 rllRdhRDgt+f4qlILQ3RyDaRSFNV+9jYH1T7/KRTW/8CLyGDEBQpL7ABN12QTRS5NOVO
 tCdQ==
X-Gm-Message-State: AOAM533PWsSjakrTjXOmlt/g/K/GwEKnwrYCM4MBfZxf1vF4AwamehaX
 cN8Jx9NqUzNNy0uSl4jKTPM8jA==
X-Google-Smtp-Source: ABdhPJxKIbhDHEhz+WnPbtRExtRO7GyqAmUYcs+ViGPRRMFhDPW3GRnWUUrydse7XnAuWXqHyU6+jw==
X-Received: by 2002:a19:c3ca:: with SMTP id t193mr262222lff.21.1630621129639; 
 Thu, 02 Sep 2021 15:18:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m5sm309732lfk.267.2021.09.02.15.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 15:18:49 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/msm/dsi: Add phy configuration for MSM8953
To: Sireesh Kodali <sireeshkodali1@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, robdclark@gmail.com,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Rajeev Nandan <rajeevny@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20210902155951.6672-1-sireeshkodali1@gmail.com>
 <20210902155951.6672-2-sireeshkodali1@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <70676288-731f-fc14-42bb-c955efc64c57@linaro.org>
Date: Fri, 3 Sep 2021 01:18:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902155951.6672-2-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

On 02/09/2021 18:59, Sireesh Kodali wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add phy configuration for 14nm dsi phy found on MSM8953 SoC. Only
> difference from existing configurations are io_start addresses.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>   .../bindings/display/msm/dsi-phy-14nm.yaml    |  1 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 ++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 21 +++++++++++++++++++
>   4 files changed, 25 insertions(+)

Please split dt-bindings to a separate patch, to be acked by Rob Herring.

After that, the dsi/phy/* part is:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index 72a00cce0147..7527fb299caa 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -17,6 +17,7 @@ properties:
>       oneOf:
>         - const: qcom,dsi-phy-14nm
>         - const: qcom,dsi-phy-14nm-660
> +      - const: qcom,dsi-phy-14nm-8953
>   
>     reg:
>       items:
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 8c65ef6968ca..9842e04b5858 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -627,6 +627,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>   	  .data = &dsi_phy_14nm_cfgs },
>   	{ .compatible = "qcom,dsi-phy-14nm-660",
>   	  .data = &dsi_phy_14nm_660_cfgs },
> +	{ .compatible = "qcom,dsi-phy-14nm-8953",
> +	  .data = &dsi_phy_14nm_8953_cfgs },
>   #endif
>   #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
>   	{ .compatible = "qcom,dsi-phy-10nm",
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index b91303ada74f..4c8257581bfc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -48,6 +48,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index d13552b2213b..9a6b1f0cbbaf 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1065,3 +1065,24 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
>   	.io_start = { 0xc994400, 0xc996000 },
>   	.num_dsi_phy = 2,
>   };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
> +	.has_phy_lane = true,
> +	.reg_cfg = {
> +		.num = 1,
> +		.regs = {
> +			{"vcca", 17000, 32},
> +		},
> +	},
> +	.ops = {
> +		.enable = dsi_14nm_phy_enable,
> +		.disable = dsi_14nm_phy_disable,
> +		.pll_init = dsi_pll_14nm_init,
> +		.save_pll_state = dsi_14nm_pll_save_state,
> +		.restore_pll_state = dsi_14nm_pll_restore_state,
> +	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
> +	.io_start = { 0x1a94400, 0x1a96400 },
> +	.num_dsi_phy = 2,
> +};
> 


-- 
With best wishes
Dmitry
