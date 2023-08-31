Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D378F3F0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 22:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAD610E6D7;
	Thu, 31 Aug 2023 20:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6AF10E6D7;
 Thu, 31 Aug 2023 20:28:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37VJ9UXp002278; Thu, 31 Aug 2023 20:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Ys49PkpoeoqodHudvYndP+UifUpkStkIb4kswc6vt8o=;
 b=UgI5h/gA74+P2lfo8q2DmmBrFRwUq3VJQHL8Znqa2iawIfE/V/0YhOvf1VUnQ1z/6Xfx
 6D2J3oVEaN1qFGBCN8GffBBmTgX1E1e8ufUStlK0KQl8fm+fKCiI69WlrTs+iC5RZ0RQ
 qVXQAbb6QXXNWpNICBRKH3Rwy5om00bDDNVYvnnQIw+1WHbzRL2RkBPhLKIyanP21SbP
 nwKpZ1GSHhyyTXXou/DlvhWpxDZvm/ioNqJPTtfDDMoIOIwZqX2bwvTv5m8gU+fvTk3Y
 v9Q4wbb549hMF4GV3JZT3fDvK3OYS8roX0UrdN2dS+b7rTC7maUuVKGJQs4DGgwX/QHM Vg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3stpy9a1ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 20:28:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37VKS32L005676
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 20:28:04 GMT
Received: from [10.71.108.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 31 Aug
 2023 13:28:03 -0700
Message-ID: <a181f3ab-bdb3-df24-5dcc-26e26f2feaf1@quicinc.com>
Date: Thu, 31 Aug 2023 13:28:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/7] drm/msm/dp: Remove dead code related to downstream
 cap info
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-4-swboyd@chromium.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20230829184735.2841739-4-swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aUdBQO0m3CrEMi7Zn8Q9N56YePkxgoZS
X-Proofpoint-GUID: aUdBQO0m3CrEMi7Zn8Q9N56YePkxgoZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_18,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310183
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
> We read the downstream port count and capability info but never use it
> anywhere. Remove 'ds_port_cnt' and 'ds_cap_info' and any associated code
> from this driver. Fold the check for 'dfp_present' into a call to
> drm_dp_is_branch() at the one place it is used to get rid of any member
> storage related to downstream ports.
>
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 25 +++----------------------
>   drivers/gpu/drm/msm/dp/dp_panel.h |  6 ------
>   2 files changed, 3 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index a0523b18b9e9..9fb4e963fefb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -43,9 +43,7 @@ static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
>   
>   static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   {
> -	int rc = 0;
> -	size_t len;
> -	ssize_t rlen;
> +	int rc;
>   	struct dp_panel_private *panel;
>   	struct dp_link_info *link_info;
>   	u8 *dpcd, major, minor;
> @@ -79,25 +77,8 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	if (drm_dp_enhanced_frame_cap(dpcd))
>   		link_info->capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
>   
> -	dp_panel->dfp_present = dpcd[DP_DOWNSTREAMPORT_PRESENT];
> -	dp_panel->dfp_present &= DP_DWN_STRM_PORT_PRESENT;
> -
> -	if (dp_panel->dfp_present && (dpcd[DP_DPCD_REV] > 0x10)) {
> -		dp_panel->ds_port_cnt = dpcd[DP_DOWN_STREAM_PORT_COUNT];
> -		dp_panel->ds_port_cnt &= DP_PORT_COUNT_MASK;
> -		len = DP_DOWNSTREAM_PORTS * DP_DOWNSTREAM_CAP_SIZE;
> -
> -		rlen = drm_dp_dpcd_read(panel->aux,
> -			DP_DOWNSTREAM_PORT_0, dp_panel->ds_cap_info, len);
> -		if (rlen < len) {
> -			DRM_ERROR("ds port status failed, rlen=%zd\n", rlen);
> -			rc = -EINVAL;
> -			goto end;
> -		}
> -	}
> -
>   	dp_panel_read_psr_cap(panel);
> -end:
> +
>   	return rc;
>   }
>   
> @@ -173,7 +154,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   		return -EINVAL;
>   	}
>   
> -	if (dp_panel->dfp_present) {
> +	if (drm_dp_is_branch(dp_panel->dpcd)) {
>   		count = drm_dp_read_sink_count(panel->aux);
>   		if (!count) {
>   			DRM_ERROR("no downstream ports connected\n");
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 6d733480a62d..3cb1f8dcfd3b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -13,9 +13,6 @@
>   
>   struct edid;
>   
> -#define DP_DOWNSTREAM_PORTS		4
> -#define DP_DOWNSTREAM_CAP_SIZE		4
> -
>   struct dp_display_mode {
>   	struct drm_display_mode drm_mode;
>   	u32 capabilities;
> @@ -39,9 +36,6 @@ struct dp_panel_psr {
>   struct dp_panel {
>   	/* dpcd raw data */
>   	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> -	u8 ds_cap_info[DP_DOWNSTREAM_PORTS * DP_DOWNSTREAM_CAP_SIZE];
> -	u32 ds_port_cnt;
> -	u32 dfp_present;
>   
>   	struct dp_link_info link_info;
>   	struct drm_dp_desc desc;
