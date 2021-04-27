Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9029B36CE83
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 00:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F0C6E9ED;
	Tue, 27 Apr 2021 22:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F266E9ED
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 22:14:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619561691; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=w9iYbla8SfuYYaXRJhm+8Av4oAS2iP488Q4jqLprjkk=;
 b=KhamJj2zUOKKa8eTCPV8Ul/Z2ERW8ja8BbXkcGJEvG9qoiNLqAvMcG/JlvgCKOBAMPYfTaK5
 +ucr54UBMvc72FN0jxUk3dm8Mkjhnk7k2bucrw/v/ShTbCq38oeSdnqFzBZ/AeIkujwtgLyS
 OqFvg+d0AFNxMf9ek4NfS7pJNvU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60888cbc2cbba88980ff31af (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 22:14:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BD921C433F1; Tue, 27 Apr 2021 22:14:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 95428C4338A;
 Tue, 27 Apr 2021 22:14:18 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 27 Apr 2021 15:14:18 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 4/4] drm/msm/dsi: add DSI PHY registers to snapshot data
In-Reply-To: <20210427001828.2375555-5-dmitry.baryshkov@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-5-dmitry.baryshkov@linaro.org>
Message-ID: <c567806ed6024e5c8b6b8a948632fc71@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-26 17:18, Dmitry Baryshkov wrote:
> Add DSI PHY registers to the msm state snapshots to be able to check
> their contents.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.c         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 31 +++++++++++++++++++++++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  4 ++++
>  4 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
> b/drivers/gpu/drm/msm/dsi/dsi.c
> index 322d2e535df0..75afc12a7b25 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -269,5 +269,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
> struct drm_device *dev,
>  void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi *msm_dsi)
>  {
>  	msm_dsi_host_snapshot(disp_state, msm_dsi->host);
> +	msm_dsi_phy_snapshot(disp_state, msm_dsi->phy);
>  }
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index b5679cf89413..cea73f9c4be9 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -176,6 +176,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy 
> *phy,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
>  int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
> +void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi_phy *phy);
> 
>  #endif /* __DSI_CONNECTOR_H__ */
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..bf7a4c20c13c 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -658,14 +658,14 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	phy->regulator_ldo_mode = of_property_read_bool(dev->of_node,
>  				"qcom,dsi-phy-regulator-ldo-mode");
> 
> -	phy->base = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
> +	phy->base = msm_ioremap_size(pdev, "dsi_phy", "DSI_PHY", 
> &phy->base_size);
>  	if (IS_ERR(phy->base)) {
>  		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
>  		ret = -ENOMEM;
>  		goto fail;
>  	}
> 
> -	phy->pll_base = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
> +	phy->pll_base = msm_ioremap_size(pdev, "dsi_pll", "DSI_PLL", 
> &phy->pll_size);
>  	if (IS_ERR(phy->pll_base)) {
>  		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
>  		ret = -ENOMEM;
> @@ -673,7 +673,7 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	}
> 
>  	if (phy->cfg->has_phy_lane) {
> -		phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane", "DSI_PHY_LANE");
> +		phy->lane_base = msm_ioremap_size(pdev, "dsi_phy_lane",
> "DSI_PHY_LANE", &phy->lane_size);
>  		if (IS_ERR(phy->lane_base)) {
>  			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n", 
> __func__);
>  			ret = -ENOMEM;
> @@ -682,7 +682,7 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	}
> 
>  	if (phy->cfg->has_phy_regulator) {
> -		phy->reg_base = msm_ioremap(pdev, "dsi_phy_regulator", 
> "DSI_PHY_REG");
> +		phy->reg_base = msm_ioremap_size(pdev, "dsi_phy_regulator",
> "DSI_PHY_REG", &phy->reg_size);
>  		if (IS_ERR(phy->reg_base)) {
>  			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator
> base\n", __func__);
>  			ret = -ENOMEM;
> @@ -868,3 +868,26 @@ int msm_dsi_phy_pll_restore_state(struct 
> msm_dsi_phy *phy)
> 
>  	return 0;
>  }
> +
> +void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi_phy *phy)
> +{
> +	msm_disp_snapshot_add_block(disp_state,
> +			phy->base_size, phy->base,
> +			"dsi%d_phy", phy->id);
> +
> +	/* Do not try accessing PLL registers if it is switched off */
> +	if (phy->pll_on)
> +		msm_disp_snapshot_add_block(disp_state,
> +			phy->pll_size, phy->pll_base,
> +			"dsi%d_pll", phy->id);
> +
> +	if (phy->lane_base)
> +		msm_disp_snapshot_add_block(disp_state,
> +			phy->lane_size, phy->lane_base,
> +			"dsi%d_lane", phy->id);
> +
> +	if (phy->reg_base)
> +		msm_disp_snapshot_add_block(disp_state,
> +			phy->reg_size, phy->reg_base,
> +			"dsi%d_reg", phy->id);
> +}
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 94a77ac364d3..5b0feef87127 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -85,6 +85,10 @@ struct msm_dsi_phy {
>  	void __iomem *pll_base;
>  	void __iomem *reg_base;
>  	void __iomem *lane_base;
> +	phys_addr_t base_size;
> +	phys_addr_t pll_size;
> +	phys_addr_t reg_size;
> +	phys_addr_t lane_size;
>  	int id;
> 
>  	struct clk *ahb_clk;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
