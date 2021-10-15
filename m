Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7C942FDF6
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 00:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDB76E3F4;
	Fri, 15 Oct 2021 22:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587456EE01
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 22:16:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634336221; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jxUmdC8gbXSzYcXhva+BMdfRB94QKC3IUsGhsZsNxXA=;
 b=n1/o0X7GpAAly9Hz20hGfAsXzX+qRaOJF1fiobuKAUvD35JLDv8GgVrnGE26gKsp1PUqjy6i
 lmi+g2iUVTe4xDXpnMW5RZLtSP6mpy14GX8eCxoOZOCZY1e9xzyIAFddTw230fDIZlWs39HA
 MxI8LXrG/VMVq7JMshvNczf18No=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6169fdcff922f9e772d131f0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Oct 2021 22:16:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AD9F2C4360D; Fri, 15 Oct 2021 22:16:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 18D92C4338F;
 Fri, 15 Oct 2021 22:16:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 15 Oct 2021 15:16:44 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/hdmi: use bulk regulator API
In-Reply-To: <20211015001100.4193241-1-dmitry.baryshkov@linaro.org>
References: <20211015001100.4193241-1-dmitry.baryshkov@linaro.org>
Message-ID: <b4ad0b7f370964da16c282c5fe99d7fd@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-10-14 17:10, Dmitry Baryshkov wrote:
> Switch to using bulk regulator API instead of hand coding loops.
> 
Nice cleanup!

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c           | 34 +++++++----------------
>  drivers/gpu/drm/msm/hdmi/hdmi.h           |  6 ++--
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c    | 20 ++++---------
>  drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 24 ++++++----------
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c       | 33 ++++++++--------------
>  5 files changed, 40 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
> b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 737453b6e596..db17a000d968 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -154,19 +154,13 @@ static struct hdmi *msm_hdmi_init(struct
> platform_device *pdev)
>  		ret = -ENOMEM;
>  		goto fail;
>  	}
> -	for (i = 0; i < config->hpd_reg_cnt; i++) {
> -		struct regulator *reg;
> -
> -		reg = devm_regulator_get(&pdev->dev,
> -				config->hpd_reg_names[i]);
> -		if (IS_ERR(reg)) {
> -			ret = PTR_ERR(reg);
> -			DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: %s (%d)\n",
> -					config->hpd_reg_names[i], ret);
> -			goto fail;
> -		}
> +	for (i = 0; i < config->hpd_reg_cnt; i++)
> +		hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
> 
> -		hdmi->hpd_regs[i] = reg;
> +	ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt,
> hdmi->hpd_regs);
> +	if (ret) {
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: %d\n", ret);
> +		goto fail;
>  	}
> 
>  	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
> @@ -177,19 +171,11 @@ static struct hdmi *msm_hdmi_init(struct
> platform_device *pdev)
>  		ret = -ENOMEM;
>  		goto fail;
>  	}
> -	for (i = 0; i < config->pwr_reg_cnt; i++) {
> -		struct regulator *reg;
> 
> -		reg = devm_regulator_get(&pdev->dev,
> -				config->pwr_reg_names[i]);
> -		if (IS_ERR(reg)) {
> -			ret = PTR_ERR(reg);
> -			DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: %s (%d)\n",
> -					config->pwr_reg_names[i], ret);
> -			goto fail;
> -		}
> -
> -		hdmi->pwr_regs[i] = reg;
> +	ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt,
> hdmi->pwr_regs);
> +	if (ret) {
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: %d\n", ret);
> +		goto fail;
>  	}
> 
>  	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h 
> b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index d0b84f0abee1..82261078c6b1 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -56,8 +56,8 @@ struct hdmi {
>  	void __iomem *qfprom_mmio;
>  	phys_addr_t mmio_phy_addr;
> 
> -	struct regulator **hpd_regs;
> -	struct regulator **pwr_regs;
> +	struct regulator_bulk_data *hpd_regs;
> +	struct regulator_bulk_data *pwr_regs;
>  	struct clk **hpd_clks;
>  	struct clk **pwr_clks;
> 
> @@ -163,7 +163,7 @@ struct hdmi_phy {
>  	void __iomem *mmio;
>  	struct hdmi_phy_cfg *cfg;
>  	const struct hdmi_phy_funcs *funcs;
> -	struct regulator **regs;
> +	struct regulator_bulk_data *regs;
>  	struct clk **clks;
>  };
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 6e380db9287b..f04eb4a70f0d 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -28,13 +28,9 @@ static void msm_hdmi_power_on(struct drm_bridge 
> *bridge)
> 
>  	pm_runtime_get_sync(&hdmi->pdev->dev);
> 
> -	for (i = 0; i < config->pwr_reg_cnt; i++) {
> -		ret = regulator_enable(hdmi->pwr_regs[i]);
> -		if (ret) {
> -			DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %s 
> (%d)\n",
> -					config->pwr_reg_names[i], ret);
> -		}
> -	}
> +	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
> +	if (ret)
> +		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", 
> ret);
> 
>  	if (config->pwr_clk_cnt > 0) {
>  		DBG("pixclock: %lu", hdmi->pixclock);
> @@ -70,13 +66,9 @@ static void power_off(struct drm_bridge *bridge)
>  	for (i = 0; i < config->pwr_clk_cnt; i++)
>  		clk_disable_unprepare(hdmi->pwr_clks[i]);
> 
> -	for (i = 0; i < config->pwr_reg_cnt; i++) {
> -		ret = regulator_disable(hdmi->pwr_regs[i]);
> -		if (ret) {
> -			DRM_DEV_ERROR(dev->dev, "failed to disable pwr regulator: %s 
> (%d)\n",
> -					config->pwr_reg_names[i], ret);
> -		}
> -	}
> +	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
> +	if (ret)
> +		DRM_DEV_ERROR(dev->dev, "failed to disable pwr regulator: %d\n", 
> ret);
> 
>  	pm_runtime_put_autosuspend(&hdmi->pdev->dev);
>  }
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> index 58707a1f3878..a7f729cdec7b 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> @@ -146,16 +146,13 @@ int msm_hdmi_hpd_enable(struct drm_connector 
> *connector)
>  	const struct hdmi_platform_config *config = hdmi->config;
>  	struct device *dev = &hdmi->pdev->dev;
>  	uint32_t hpd_ctrl;
> -	int i, ret;
> +	int ret;
>  	unsigned long flags;
> 
> -	for (i = 0; i < config->hpd_reg_cnt; i++) {
> -		ret = regulator_enable(hdmi->hpd_regs[i]);
> -		if (ret) {
> -			DRM_DEV_ERROR(dev, "failed to enable hpd regulator: %s (%d)\n",
> -					config->hpd_reg_names[i], ret);
> -			goto fail;
> -		}
> +	ret = regulator_bulk_enable(config->hpd_reg_cnt, hdmi->hpd_regs);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "failed to enable hpd regulators: %d\n", ret);
> +		goto fail;
>  	}
> 
>  	ret = pinctrl_pm_select_default_state(dev);
> @@ -207,7 +204,7 @@ static void hdp_disable(struct hdmi_connector
> *hdmi_connector)
>  	struct hdmi *hdmi = hdmi_connector->hdmi;
>  	const struct hdmi_platform_config *config = hdmi->config;
>  	struct device *dev = &hdmi->pdev->dev;
> -	int i, ret = 0;
> +	int ret;
> 
>  	/* Disable HPD interrupt */
>  	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
> @@ -225,12 +222,9 @@ static void hdp_disable(struct hdmi_connector
> *hdmi_connector)
>  	if (ret)
>  		dev_warn(dev, "pinctrl state chg failed: %d\n", ret);
> 
> -	for (i = 0; i < config->hpd_reg_cnt; i++) {
> -		ret = regulator_disable(hdmi->hpd_regs[i]);
> -		if (ret)
> -			dev_warn(dev, "failed to disable hpd regulator: %s (%d)\n",
> -					config->hpd_reg_names[i], ret);
> -	}
> +	ret = regulator_bulk_disable(config->hpd_reg_cnt, hdmi->hpd_regs);
> +	if (ret)
> +		dev_warn(dev, "failed to disable hpd regulator: %d\n", ret);
>  }
> 
>  static void
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index 8a38d4b95102..16b0e8836d27 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -23,22 +23,15 @@ static int msm_hdmi_phy_resource_init(struct 
> hdmi_phy *phy)
>  	if (!phy->clks)
>  		return -ENOMEM;
> 
> -	for (i = 0; i < cfg->num_regs; i++) {
> -		struct regulator *reg;
> -
> -		reg = devm_regulator_get(dev, cfg->reg_names[i]);
> -		if (IS_ERR(reg)) {
> -			ret = PTR_ERR(reg);
> -			if (ret != -EPROBE_DEFER) {
> -				DRM_DEV_ERROR(dev,
> -					      "failed to get phy regulator: %s (%d)\n",
> -					      cfg->reg_names[i], ret);
> -			}
> +	for (i = 0; i < cfg->num_regs; i++)
> +		phy->regs[i].supply = cfg->reg_names[i];
> 
> -			return ret;
> -		}
> +	ret = devm_regulator_bulk_get(dev, cfg->num_regs, phy->regs);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to get phy regulators: %d\n", ret);
> 
> -		phy->regs[i] = reg;
> +		return ret;
>  	}
> 
>  	for (i = 0; i < cfg->num_clks; i++) {
> @@ -66,11 +59,10 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy 
> *phy)
> 
>  	pm_runtime_get_sync(dev);
> 
> -	for (i = 0; i < cfg->num_regs; i++) {
> -		ret = regulator_enable(phy->regs[i]);
> -		if (ret)
> -			DRM_DEV_ERROR(dev, "failed to enable regulator: %s (%d)\n",
> -				cfg->reg_names[i], ret);
> +	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "failed to enable regulators: (%d)\n", ret);
> +		return ret;
>  	}
> 
>  	for (i = 0; i < cfg->num_clks; i++) {
> @@ -92,8 +84,7 @@ void msm_hdmi_phy_resource_disable(struct hdmi_phy 
> *phy)
>  	for (i = cfg->num_clks - 1; i >= 0; i--)
>  		clk_disable_unprepare(phy->clks[i]);
> 
> -	for (i = cfg->num_regs - 1; i >= 0; i--)
> -		regulator_disable(phy->regs[i]);
> +	regulator_bulk_disable(cfg->num_regs, phy->regs);
> 
>  	pm_runtime_put_sync(dev);
>  }
