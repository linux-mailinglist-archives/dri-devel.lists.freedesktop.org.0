Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F18C4329FE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 01:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18E96EAA3;
	Mon, 18 Oct 2021 23:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0200B6EAA3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 23:08:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634598481; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=CHs2EnROtj+eI2bECiXGaoryEmZF7c86X9Ki3HRSSFs=;
 b=SgQmRNFWDGeFwAhe9dQsrDVUEVV/ACDHfKq3KQg+TWNLdvqfv35QaddDqNqxy0tAqXX7MiI8
 QsQZ2vl5gbrWUzyQPz9HNEa0OXN0mc8u9qAkA93kUBtV21h/3TfgUA25YqHILwch3FKR/wei
 QfLCbi6LQTIK4WEle7PuCMhxxao=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 616dfe4e3416c2cb702e9cc6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Oct 2021 23:07:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 229D6C43619; Mon, 18 Oct 2021 23:07:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ECA93C4338F;
 Mon, 18 Oct 2021 23:07:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 18 Oct 2021 16:07:56 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v5 3/7] drm/msm/dp: Allow specifying
 connector_type per controller
In-Reply-To: <20211016221843.2167329-4-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-4-bjorn.andersson@linaro.org>
Message-ID: <94c1d92263498f83c39d3383cc122a05@codeaurora.org>
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

On 2021-10-16 15:18, Bjorn Andersson wrote:
> As the following patches introduced support for multiple DP blocks in a
> platform and some of those block might be eDP it becomes useful to be
> able to specify the connector type per block.
> 
> Although there's only a single block at this point, the array of descs
> and the search in dp_display_get_desc() are introduced here to simplify
> the next patch, that does introduce support for multiple DP blocks.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes since v4:
> - const the various struct msm_dp_desc instances
> - unsigned the connector_type
> 
> 
> The references to DRM_MODE_CONNECTOR_DisplayPort in dp_debug.c, that 
> was
> highligted in the review of v4 has been removed in a separate patch.
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 43 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 +-
>  3 files changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5d3ee5ef07c2..6913970c8cf9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -115,8 +115,25 @@ struct dp_display_private {
>  	struct dp_audio *audio;
>  };
> 
> +struct msm_dp_desc {
> +	phys_addr_t io_start;
> +	unsigned int connector_type;
> +};
> +
> +struct msm_dp_config {
> +	const struct msm_dp_desc *descs;
> +	size_t num_descs;
> +};
> +
> +static const struct msm_dp_config sc7180_dp_cfg = {
> +	.descs = (const struct msm_dp_desc[]) {
> +		{ .io_start = 0x0ae90000, .connector_type = 
> DRM_MODE_CONNECTOR_DisplayPort },
> +	},
> +	.num_descs = 1,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
> -	{.compatible = "qcom,sc7180-dp"},
> +	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>  	{}
>  };
> 
> @@ -1180,10 +1197,29 @@ int dp_display_request_irq(struct msm_dp 
> *dp_display)
>  	return 0;
>  }
> 
> +static const struct msm_dp_desc *dp_display_get_desc(struct
> platform_device *pdev)
> +{
> +	const struct msm_dp_config *cfg = 
> of_device_get_match_data(&pdev->dev);
> +	struct resource *res;
> +	int i;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return NULL;
> +
> +	for (i = 0; i < cfg->num_descs; i++)
> +		if (cfg->descs[i].io_start == res->start)
> +			return &cfg->descs[i];
> +
> +	dev_err(&pdev->dev, "unknown displayport instance\n");
> +	return NULL;
> +}
> +
>  static int dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
>  	struct dp_display_private *dp;
> +	const struct msm_dp_desc *desc;
> 
>  	if (!pdev || !pdev->dev.of_node) {
>  		DRM_ERROR("pdev not found\n");
> @@ -1194,8 +1230,13 @@ static int dp_display_probe(struct 
> platform_device *pdev)
>  	if (!dp)
>  		return -ENOMEM;
> 
> +	desc = dp_display_get_desc(pdev);
> +	if (!desc)
> +		return -EINVAL;
> +
>  	dp->pdev = pdev;
>  	dp->name = "drm_dp";
> +	dp->dp_display.connector_type = desc->connector_type;
> 
>  	rc = dp_init_sub_modules(dp);
>  	if (rc) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h
> b/drivers/gpu/drm/msm/dp/dp_display.h
> index 8b47cdabb67e..75fcabcfbbdd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -18,6 +18,7 @@ struct msm_dp {
>  	bool is_connected;
>  	bool audio_enabled;
>  	bool power_on;
> +	unsigned int connector_type;
> 
>  	hdmi_codec_plugged_cb plugged_cb;
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c 
> b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 764f4b81017e..f33e31523f56 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -147,7 +147,7 @@ struct drm_connector *dp_drm_connector_init(struct
> msm_dp *dp_display)
> 
>  	ret = drm_connector_init(dp_display->drm_dev, connector,
>  			&dp_connector_funcs,
> -			DRM_MODE_CONNECTOR_DisplayPort);
> +			dp_display->connector_type);
>  	if (ret)
>  		return ERR_PTR(ret);
