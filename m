Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1487132F60B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 23:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648A56E1D3;
	Fri,  5 Mar 2021 22:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA6E6EC7B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 22:45:24 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id e7so6359489lft.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 14:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FOK/3RIskxWxbqQcsQFEJPI1xEXUn3wcudWwNgFLA5Y=;
 b=esQGue9YpbsE2BnWamAL/QS+ol5Ucaio/gc+QJfuWX9TbLxhuL05JRd3iaSTfMM+ZT
 SiCIUdqkt8tbyazqA3tu4C1PT9WRxXlhvtGblEcwUnghR/sk7FrHE67qdwjza+l+FWXu
 tTGzH4Z61uWCAwD3mS/yzOaQgAJkJBJ6cm7lrbwi7pH64elU8VDOJG7h+NmyHFy6mxKK
 Xlu0PLQqVpRdSt7LgyjGRKDhJEoscP5+lkzj8Q1c5YJB+1WYs5tANy1gVnyQpDO4Hn8B
 K9cNNmZT/qed/93qTT31VIuLDADjh5aUelqOSHsu+S+4isIjhjinDO4yR1RZGtqmZ7Dv
 ljwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FOK/3RIskxWxbqQcsQFEJPI1xEXUn3wcudWwNgFLA5Y=;
 b=Wuzu2AlzraDgCBuWoSSGx0gnFq5nUdj1A+qpYbtqJ8BaGdVodLjp2L24deTEvoOsgX
 eTg7yzlV6XCALuepr726OWCfsV4qIsl/m9gNz26tLAZ/0jmNTu/wYRsFMvjtuAr7g3rn
 Si35ZJ4/9FVB4iTtXO5DUmgxQu7JqFkUOW7xex13A4BkpOPsg2LssLc0zxKtUtHpUqHI
 uHTPLuerAgNQ0OxjXAWHHzQ46EVCRuChMCJFB7xkwLlzuVweBTXyBJzpRX2UfbWK6TV4
 4VwPrhvOVRTzhVjMP/Ktu47b8qZlgJFVzyQKpXb/pgQaDtSsnp475od3xNiq8xCmTNUp
 PToQ==
X-Gm-Message-State: AOAM533UaJpz8k8gkKWsltN7i2rMooUZmEmiMCTPRU/w4v5LU3PrZ5tw
 XFVXGMyRNc5ervEiA24yqjjViw==
X-Google-Smtp-Source: ABdhPJxjyVuZEQnq1OV6y0hg3sDLiB7MWslzlTpE7fxnRrUrVIFuHPqDIijjs0T2rvjKc5sWEMYCfQ==
X-Received: by 2002:a05:6512:230f:: with SMTP id
 o15mr6940292lfu.326.1614984322570; 
 Fri, 05 Mar 2021 14:45:22 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id 3sm468042lfq.1.2021.03.05.14.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 14:45:22 -0800 (PST)
Subject: Re: [PATCH] drm/msm/dsi: support CPHY mode for 7nm pll/phy
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20210215162805.21481-1-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <3e511cd9-2dbc-abf0-23c0-26779eb1777f@linaro.org>
Date: Sat, 6 Mar 2021 01:45:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215162805.21481-1-jonathan@marek.ca>
Content-Language: en-GB
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/02/2021 19:27, Jonathan Marek wrote:
> Add the required changes to support 7nm pll/phy in CPHY mode.
> 
> This adds a "qcom,dsi-phy-cphy-mode" property for the PHY node to enable
> the CPHY mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Other that few comments bellow:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   .../devicetree/bindings/display/msm/dsi.txt   |  1 +
>   drivers/gpu/drm/msm/dsi/dsi.c                 | 12 +--
>   drivers/gpu/drm/msm/dsi/dsi.h                 |  6 +-
>   drivers/gpu/drm/msm/dsi/dsi.xml.h             |  2 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c            | 34 +++++--
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 49 +++++++++-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  3 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 89 ++++++++++++++-----
>   drivers/gpu/drm/msm/dsi/pll/dsi_pll.c         |  4 +-
>   drivers/gpu/drm/msm/dsi/pll/dsi_pll.h         |  5 +-
>   drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 71 +++++++++------
>   11 files changed, 210 insertions(+), 66 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index b9a64d3ff184..7ffc86a9816b 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -124,6 +124,7 @@ Required properties:
>   Optional properties:
>   - qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
>     regulator is wanted.
> +- qcom,dsi-phy-cphy-mode: Boolean value indicating if CPHY mode is wanted.
>   - qcom,mdss-mdp-transfer-time-us:	Specifies the dsi transfer time for command mode
>   					panels in microseconds. Driver uses this number to adjust
>   					the clock rate according to the expected transfer time.

This should go in a separate patch, shan't it?

> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 627048851d99..68d8547f7264 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -13,7 +13,7 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
>   	return msm_dsi->encoder;
>   }
>   
> -static int dsi_get_phy(struct msm_dsi *msm_dsi)
> +static int dsi_get_phy(struct msm_dsi *msm_dsi, bool *cphy_mode)

I see no need to pass the 'cphy_mode' through the bool pointer and back 
to msm_dsi_host_init. What about just putting it into struct msm_dsi?

>   {
>   	struct platform_device *pdev = msm_dsi->pdev;
>   	struct platform_device *phy_pdev;
> @@ -29,6 +29,7 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>   	if (phy_pdev)
>   		msm_dsi->phy = platform_get_drvdata(phy_pdev);
>   
> +	*cphy_mode = of_property_read_bool(phy_node, "qcom,dsi-phy-cphy-mode");
>   	of_node_put(phy_node);
>   
>   	if (!phy_pdev || !msm_dsi->phy) {
> @@ -65,6 +66,7 @@ static void dsi_destroy(struct msm_dsi *msm_dsi)
>   static struct msm_dsi *dsi_init(struct platform_device *pdev)
>   {
>   	struct msm_dsi *msm_dsi;
> +	bool cphy_mode;
>   	int ret;
>   
>   	if (!pdev)
> @@ -79,13 +81,13 @@ static struct msm_dsi *dsi_init(struct platform_device *pdev)
>   	msm_dsi->pdev = pdev;
>   	platform_set_drvdata(pdev, msm_dsi);
>   
> -	/* Init dsi host */
> -	ret = msm_dsi_host_init(msm_dsi);
> +	/* GET dsi PHY */
> +	ret = dsi_get_phy(msm_dsi, &cphy_mode);
>   	if (ret)
>   		goto destroy_dsi;
>   
> -	/* GET dsi PHY */
> -	ret = dsi_get_phy(msm_dsi);
> +	/* Init dsi host */
> +	ret = msm_dsi_host_init(msm_dsi, cphy_mode);
>   	if (ret)
>   		goto destroy_dsi;


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
