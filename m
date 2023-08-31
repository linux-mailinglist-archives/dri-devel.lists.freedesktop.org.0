Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BE178F3FD
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 22:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489EB10E6E5;
	Thu, 31 Aug 2023 20:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA13810E6E1;
 Thu, 31 Aug 2023 20:29:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37VKFGOY008657; Thu, 31 Aug 2023 20:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4Qei91qpDVD4YxnsbX+ONhJtjFfbKJznpV27P9vRhvQ=;
 b=n9/oq/Lc0ovlx3KoW3OK55DXPbxKUtGoVpZ/H2S9WSaDlsMLOE49tPqVhN8oe4uE3M8b
 JjG+1WTLUvFE5YTvKbMJReRxKFwWyxqjIlJybaG0NrSpqmZtR8b1VCqsf1xKy8/t6rU8
 Rv51PmGAJhRi9Al6U/nCtL+WMPjI4Jl6hj7q7G34Wp38+nM96JoKbVGOY4CDKGa+15fL
 N23sYWOH3cYxlyId8HPVDTqItV3O87uEOwYzj8UCxk9XFYCzRW1ipaTEOneWUp3gceel
 Qzznx4StZZPvzaJH0JL86l1dxVmKjowyeCTa+2PJ4kBgLGESe3BhF5dbaMd8cSdsIEM7 rw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3stku2a6cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 20:29:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37VKSm6l006335
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 20:28:48 GMT
Received: from [10.71.108.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 31 Aug
 2023 13:28:47 -0700
Message-ID: <c581ba5d-fa61-dfca-317f-3e2da95eac2a@quicinc.com>
Date: Thu, 31 Aug 2023 13:28:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/7] drm/msm/dp: Remove aux_cfg_update_done and related
 code
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-5-swboyd@chromium.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20230829184735.2841739-5-swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: c-HlcV31aSr81Bqv7kzHEL1bsqa1J2-F
X-Proofpoint-ORIG-GUID: c-HlcV31aSr81Bqv7kzHEL1bsqa1J2-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_18,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308310183
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/29/2023 11:47 AM, Stephen Boyd wrote:
> The member 'aux_cfg_update_done' is always false. This is dead code that
> never runs. Remove it.
>
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 15 ---------------
>   1 file changed, 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 9fb4e963fefb..0893522ae158 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -17,7 +17,6 @@ struct dp_panel_private {
>   	struct dp_link *link;
>   	struct dp_catalog *catalog;
>   	bool panel_on;
> -	bool aux_cfg_update_done;
>   };
>   
>   static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
> @@ -177,19 +176,6 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   		}
>   	}
>   
> -	if (panel->aux_cfg_update_done) {
> -		drm_dbg_dp(panel->drm_dev,
> -				"read DPCD with updated AUX config\n");
> -		rc = dp_panel_read_dpcd(dp_panel);
> -		bw_code = drm_dp_link_rate_to_bw_code(dp_panel->link_info.rate);
> -		if (rc || !is_link_rate_valid(bw_code) ||
> -			!is_lane_count_valid(dp_panel->link_info.num_lanes)
> -			|| (bw_code > dp_panel->max_bw_code)) {
> -			DRM_ERROR("read dpcd failed %d\n", rc);
> -			return rc;
> -		}
> -		panel->aux_cfg_update_done = false;
> -	}
>   end:
>   	return rc;
>   }
> @@ -434,7 +420,6 @@ struct dp_panel *dp_panel_get(struct dp_panel_in *in)
>   
>   	dp_panel = &panel->dp_panel;
>   	dp_panel->max_bw_code = DP_LINK_BW_8_1;
> -	panel->aux_cfg_update_done = false;
>   
>   	return dp_panel;
>   }
