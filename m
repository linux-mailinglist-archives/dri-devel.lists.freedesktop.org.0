Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C4A549949
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 18:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DD510F394;
	Mon, 13 Jun 2022 16:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143C710F394
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655139027; x=1686675027;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+HRRagI1yvwv6mVQu+qg+lU9ojq/lySZ8wB/D8/AV38=;
 b=eDqGKVbcEYLZDVANFsMP+GAKfGtwaRFBFxx0B1j7iJs/KBGtXUAOQ81N
 VcNwTfuojdVahpuhkQu0BLgscasRjmIGK8Gl9vr3CeW+6DkGgXrrPoeB7
 FvrjS63qMOSBR8pXnAZG1FCw4BOvoA2LyZD+UTF2aYFl3kAULberqBgjZ s=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 13 Jun 2022 09:50:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 09:50:25 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 13 Jun 2022 09:50:25 -0700
Received: from [10.111.164.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 13 Jun
 2022 09:50:23 -0700
Message-ID: <55143c95-00a3-b60f-cb12-1b249be3440d@quicinc.com>
Date: Mon, 13 Jun 2022 09:50:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm: Fix convert to drm_of_get_data_lanes_count
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20220612143349.105766-1-marex@denx.de>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220612143349.105766-1-marex@denx.de>
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
Cc: kernel test robot <lkp@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Sean Paul <sean@poorly.run>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/12/2022 7:33 AM, Marek Vasut wrote:
> Add missing header file into dsi_host.c and encode data-lanes string
> directly into the warning message in the driver to avoid build issues
> detected by lkp.
> 
> Fixes: 185443efa26a ("drm/msm: Convert to drm_of_get_data_lanes_count")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 4 ++--
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 346556c5706d7..57ae14a0e1814 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -106,8 +106,8 @@ static int dp_parser_misc(struct dp_parser *parser)
>   
>   	len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>   	if (len < 0) {
> -		DRM_WARN("Invalid property %s, default max DP lanes = %d\n",
> -				data_lane_property, DP_MAX_NUM_DP_LANES);
> +		DRM_WARN("Invalid property \"data-lanes\", default max DP lanes = %d\n",
> +			 DP_MAX_NUM_DP_LANES);
>   		len = DP_MAX_NUM_DP_LANES;
>   	}
>   
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index db5871b9c5d88..7e21916d1511a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -21,6 +21,8 @@
>   
>   #include <video/mipi_display.h>
>   
> +#include <drm/drm_of.h>
> +
>   #include "dsi.h"
>   #include "dsi.xml.h"
>   #include "sfpb.xml.h"
