Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECD39492D
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 01:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6006F63C;
	Fri, 28 May 2021 23:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371E86F63C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 23:40:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622245234; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ObCt7FLVUSqowY1LQ9oBhYcHVdMypKRBt0IQ8qdhFjM=;
 b=g3zZZnaUx7cx7T9TZZSEaxx866wf+96jEDByCbWmCaiZ/WLrge9tW5YLMSvoMXv4viRPyBe/
 M3QfNz7Nclg6SSHqtgxuCC+jR8Hwrle5OvZVSzL7XU/rEhfpT4WLEhowQ7VXsRfS65yzn7Dd
 4EOTw9oDfGoDZV//AvqGEq7rvLk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60b17f71ea2aacd729677399 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 May 2021 23:40:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2DF5DC4323A; Fri, 28 May 2021 23:40:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 45190C4338A;
 Fri, 28 May 2021 23:40:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 28 May 2021 16:40:32 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Freedreno] [PATCH 4/4] drm/msm/dp: Add support for SC8180x eDP
In-Reply-To: <20210511042043.592802-5-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <20210511042043.592802-5-bjorn.andersson@linaro.org>
Message-ID: <a1a8221a44edc3a509bdc1bb89bb5a97@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sbillaka@codeaurora.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-10 21:20, Bjorn Andersson wrote:
> The eDP controller found in SC8180x is at large compatible with the
> current implementation, but has its register blocks at slightly
> different offsets.
> 
> Add the compatible and the new register layout.
> 
I am not able to completely recall the history of why in the DP bindings
we added DP register base as a big hunk and let catalog handle the 
submodule
offsets.

I guess earlier that made sense because DP sub-block offsets were fixed.
But if we plan to re-use the DP driver for eDP as well like this series, 
then maybe it might be
better if this comes from device tree like the earlier version was 
planning to

https://patchwork.kernel.org/project/dri-devel/patch/0101016ec6ddf446-e87ab1ce-5cbf-40a0-a0bb-cd0151cd577a-000000@us-west-2.amazonses.com/


+- reg:                  Base address and length of DP hardware's memory 
mapped regions.
+- cell-index:           Specifies the controller instance.
+- reg-names:            A list of strings that name the list of regs.
+			"dp_ahb" - DP controller memory region.
+			"dp_aux" - DP AUX memory region.
+			"dp_link" - DP link layer memory region.
+			"dp_p0" - DP pixel clock domain memory region.
+			"dp_phy" - DP PHY memory region.
+			"dp_ln_tx0" - USB3 DP PHY combo TX-0 lane memory region.
+			"dp_ln_tx1" - USB3 DP PHY combo TX-1 lane memory region.

Now there is more reason to separate the sub-module offsets like 
ahb/aux/link/p0
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  1 +
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 28 ++++++++++++++++++++--------
>  2 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index d1319b58e901..0be03bdc882c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -121,6 +121,7 @@ struct dp_display_private {
> 
>  static const struct of_device_id dp_dt_match[] = {
>  	{.compatible = "qcom,sc7180-dp"},
> +	{ .compatible = "qcom,sc8180x-edp" },
>  	{}
>  };
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 51ec85b4803b..47cf18bba4b2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -251,6 +251,7 @@ static int dp_parser_clock(struct dp_parser 
> *parser)
>  static int dp_parser_parse(struct dp_parser *parser)
>  {
>  	struct dss_io_data *io = &parser->io.dp_controller;
> +	struct device *dev = &parser->pdev->dev;
>  	int rc = 0;
> 
>  	if (!parser) {
> @@ -276,14 +277,25 @@ static int dp_parser_parse(struct dp_parser 
> *parser)
>  	 */
>  	parser->regulator_cfg = &sdm845_dp_reg_cfg;
> 
> -	io->ahb = io->base + 0x0;
> -	io->ahb_len = 0x200;
> -	io->aux = io->base + 0x200;
> -	io->aux_len = 0x200;
> -	io->link = io->base + 0x400;
> -	io->link_len = 0x600;
> -	io->p0 = io->base + 0x1000;
> -	io->p0_len = 0x400;
> +	if (of_device_is_compatible(dev->of_node, "qcom,sc8180x-edp")) {
> +		io->ahb = io->base + 0x0;
> +		io->ahb_len = 0x200;
> +		io->aux = io->base + 0x200;
> +		io->aux_len = 0x200;
> +		io->link = io->base + 0x400;
> +		io->link_len = 0x600;
> +		io->p0 = io->base + 0xa00;
> +		io->p0_len = 0x400;
> +	} else {
> +		io->ahb = io->base + 0x0;
> +		io->ahb_len = 0x200;
> +		io->aux = io->base + 0x200;
> +		io->aux_len = 0x200;
> +		io->link = io->base + 0x400;
> +		io->link_len = 0x600;
> +		io->p0 = io->base + 0x1000;
> +		io->p0_len = 0x400;
> +	}
> 
>  	return 0;
>  }
