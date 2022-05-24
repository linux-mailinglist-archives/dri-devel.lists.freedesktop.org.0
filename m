Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C4532024
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 03:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9825310E9D5;
	Tue, 24 May 2022 01:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6293510E9D5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 01:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653354441; x=1684890441;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=04sFJAdFzSSOKF5S3OmhGmikP+EvjqHBy1pEPF+1/oA=;
 b=F7hRM2Bwbow+QdnJe1aQzxkjz5Y+0Vv/Mt1VY3ZXgdou3IoLTcYT/XH9
 Pkeqm2uT/0E7bD3mUPBV89WSxoX6hNoq/pnutTrmK6Y6cKV1Z2bo2p8de
 hBx2crd89Go/jVLe74cmPuT5eRAdkWTHtJ6wSwIhHzVSwgs/Wqfs/NJFF 0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 May 2022 18:07:20 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 18:07:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 23 May 2022 18:07:20 -0700
Received: from [10.38.240.101] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 23 May
 2022 18:07:17 -0700
Message-ID: <d438fa5a-5c3d-513c-db0b-2989a09fb8c1@quicinc.com>
Date: Mon, 23 May 2022 18:07:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 10/11] drm/msm: Convert to drm_of_get_data_lanes_count
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20220524010522.528569-1-marex@denx.de>
 <20220524010522.528569-10-marex@denx.de>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220524010522.528569-10-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sam
 Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/23/2022 6:05 PM, Marek Vasut wrote:
> Convert driver to use this new helper to standardize
> OF "data-lanes" parsing.
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sean Paul <sean@poorly.run>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Use drm/msm prefix
>      - Rename drm_of_get_data_lanes{,_ep} to drm_of_get_data_lanes_count{,_ep}
>      - Add RB from Andrzej and Dmitry
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 6 ++----
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +++----
>   2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 8f9fed9fdafc4..346556c5706d7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -102,11 +102,9 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   static int dp_parser_misc(struct dp_parser *parser)
>   {
>   	struct device_node *of_node = parser->pdev->dev.of_node;
> -	int len = 0;
> -	const char *data_lane_property = "data-lanes";
> +	int len;
>   
> -	len = of_property_count_elems_of_size(of_node,
> -			 data_lane_property, sizeof(u32));
> +	len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>   	if (len < 0) {
>   		DRM_WARN("Invalid property %s, default max DP lanes = %d\n",
>   				data_lane_property, DP_MAX_NUM_DP_LANES);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index a95d5df52653c..90f9d3daa9a6d 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1779,11 +1779,10 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
>   		return 0;
>   	}
>   
> -	num_lanes = len / sizeof(u32);
> -
> -	if (num_lanes < 1 || num_lanes > 4) {
> +	num_lanes = drm_of_get_data_lanes_count(ep, 1, 4);
> +	if (num_lanes < 0) {
>   		DRM_DEV_ERROR(dev, "bad number of data lanes\n");
> -		return -EINVAL;
> +		return num_lanes;
>   	}
>   
>   	msm_host->num_data_lanes = num_lanes;
