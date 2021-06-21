Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 433A93AF852
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 00:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAF26E438;
	Mon, 21 Jun 2021 22:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BEB6E437
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 22:11:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624313514; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HKNsi+w7AxIkww4j4w/Umdlr46gLw0rw5Mk8zTV9k9c=;
 b=WjBfjxdzt4H+45lxCRqY1qLMScxFZLuEac1arLFqoOtwMLpN/yMZyZT3kF3dqZALEwC1Uiw2
 cxjDHBq5OahL7U/YZhCXR+3x0hu/Cb9aMETqXDopl+wY8Yu2X1g2kSLMOMONXm095csMWqw+
 uw1v0twEmolTz4Ve6R66jCfc2Y4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60d10e9851f29e6bae455ed7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 22:11:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 21E68C43460; Mon, 21 Jun 2021 22:11:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F163C433F1;
 Mon, 21 Jun 2021 22:11:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Jun 2021 15:11:35 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 6/8] drm/msm/dsi: phy: use
 of_device_get_match_data
In-Reply-To: <20210515131217.1540412-7-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
 <20210515131217.1540412-7-dmitry.baryshkov@linaro.org>
Message-ID: <1ca5e55d218780867de91e36531fc748@codeaurora.org>
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
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-15 06:12, Dmitry Baryshkov wrote:
> Use of_device_get_match-data() instead of of_match_node().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f2b5e0f63a16..feaeb34b7071 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -625,17 +625,12 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  {
>  	struct msm_dsi_phy *phy;
>  	struct device *dev = &pdev->dev;
> -	const struct of_device_id *match;
>  	int ret;
> 
>  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>  	if (!phy)
>  		return -ENOMEM;
> 
> -	match = of_match_node(dsi_phy_dt_match, dev->of_node);
> -	if (!match)
> -		return -ENODEV;
> -
>  	phy->provided_clocks = devm_kzalloc(dev,
>  			struct_size(phy->provided_clocks, hws, NUM_PROVIDED_CLKS),
>  			GFP_KERNEL);
> @@ -644,7 +639,10 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
> 
>  	phy->provided_clocks->num = NUM_PROVIDED_CLKS;
> 
> -	phy->cfg = match->data;
> +	phy->cfg = of_device_get_match_data(&pdev->dev);
> +	if (!phy->cfg)
> +		return -ENODEV;
> +
>  	phy->pdev = pdev;
> 
>  	phy->id = dsi_phy_get_id(phy);
