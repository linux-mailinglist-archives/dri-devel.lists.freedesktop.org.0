Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D534DC95
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 01:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E916E5A1;
	Mon, 29 Mar 2021 23:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E30D6E5A2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 23:43:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617061407; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WgW6syh6j6COpNAJzyDzrYgUluof8RVQTmMEBMQ1CDk=;
 b=fsEigdAesGu4PAHHXZi/E1CBODo65F8CCuLwNv7KidLgrZ7pVPBHVtABcTssfS0/eQ0b+8/c
 Dp5Upu7zSCXqZhOpZpTxnNtr4OwGTXa7bGN0FppQp25Pe/9wHFfRXLzLOggzQeo592Pz7uIA
 SFlVP8qeul0nOjJQvudxR4YAEdo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6062661d197975f05ef1e5a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Mar 2021 23:43:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 06A3EC433CA; Mon, 29 Mar 2021 23:43:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 27440C433ED;
 Mon, 29 Mar 2021 23:43:24 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 29 Mar 2021 16:43:24 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 13/25] drm/msm/dsi: use
 devm_of_clk_add_hw_provider
In-Reply-To: <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
Message-ID: <efeb7fefb8e025ec26bb227680942c76@codeaurora.org>
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
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> Use devm_of_clk_add_hw_provider() to register provided clocks. This
> allows dropping the remove function alltogether.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index df3b91b0ea88..46561435a27d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -728,7 +728,7 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  		}
>  	}
> 
> -	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>  				     phy->provided_clocks);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n",
> __func__, ret);
> @@ -742,31 +742,11 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	return 0;
> 
>  fail:
> -	if (phy->pll) {
> -		of_clk_del_provider(dev->of_node);
> -		phy->pll = NULL;
> -	}
> -
>  	return ret;
>  }
> 
> -static int dsi_phy_driver_remove(struct platform_device *pdev)
> -{
> -	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
> -
> -	if (phy && phy->pll) {
> -		of_clk_del_provider(pdev->dev.of_node);
> -		phy->pll = NULL;
> -	}
> -
> -	platform_set_drvdata(pdev, NULL);
> -
> -	return 0;
> -}
> -
>  static struct platform_driver dsi_phy_platform_driver = {
>  	.probe      = dsi_phy_driver_probe,
> -	.remove     = dsi_phy_driver_remove,
>  	.driver     = {
>  		.name   = "msm_dsi_phy",
>  		.of_match_table = dsi_phy_dt_match,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
