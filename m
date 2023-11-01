Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B649C7DE476
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 17:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B9410E737;
	Wed,  1 Nov 2023 16:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C0C10E735;
 Wed,  1 Nov 2023 16:19:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A1D4aoJ015879; Wed, 1 Nov 2023 16:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MgILOF+Vh0PfgLESTCkAgx0RiBlPVUa1StBHb19C1zU=;
 b=RhqdMyyiG88i0/JgZ+xz+7rh3+17OxMCVNZVXQs1p1Q+pY6UYBiFp4ja/u1wOzg6lH7U
 it5jo8GDAlZKO6EkCW6kYLU0Byh6ty3DDJV3zpv40UFcF7fwzhaMG/oU0A/z0YW2S7e3
 ZYZytfrc/1Mp/jFRCXRRnQhu/Sap8OkyqcB5fKxdpICy/anJg6rXPSQ8PjknIcSv8ORn
 upCFlRsK9Pq4FlHgqampOm9bQ2nIff7iAfZXlAG45ufdxdBO+ohA6q50gF0bO1hMCtfm
 sRUr3pGOjzFL3ta74RyTTafXytbMrIh1lsuWCjaSt65g/QHCjWdJiSs98+tBXYR4rn0a Gg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u3eq1j8nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Nov 2023 16:19:20 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A1GJK4u010946
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Nov 2023 16:19:20 GMT
Received: from [10.134.69.165] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 1 Nov
 2023 09:19:19 -0700
Message-ID: <118a8d20-2032-4689-b5c1-26797492f5c5@quicinc.com>
Date: Wed, 1 Nov 2023 09:19:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/dp: don't touch DP subconnector property
 in eDP case
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FXF3sm4txgQW_2wNLDf_m7xV7mbNMpTL
X-Proofpoint-ORIG-GUID: FXF3sm4txgQW_2wNLDf_m7xV7mbNMpTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_15,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1011 phishscore=0
 mlxscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311010129
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn
 Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Abel Vesa <abel.vesa@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/25/2023 2:23 AM, Dmitry Baryshkov wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> In case of the eDP connection there is no subconnetor and as such no
> subconnector property. Put drm_dp_set_subconnector_property() calls
> under the !is_edp condition.
> 
> Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SC7280

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e329e03e068d..1b88fb52726f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -365,9 +365,11 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>   	/* reset video pattern flag on disconnect */
>   	if (!hpd) {
>   		dp->panel->video_test = false;
> -		drm_dp_set_subconnector_property(dp->dp_display.connector,
> -						 connector_status_disconnected,
> -						 dp->panel->dpcd, dp->panel->downstream_ports);
> +		if (!dp->dp_display.is_edp)
> +			drm_dp_set_subconnector_property(dp->dp_display.connector,
> +							 connector_status_disconnected,
> +							 dp->panel->dpcd,
> +							 dp->panel->downstream_ports);
>   	}
>   
>   	dp->dp_display.is_connected = hpd;
> @@ -396,8 +398,11 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>   
>   	dp_link_process_request(dp->link);
>   
> -	drm_dp_set_subconnector_property(dp->dp_display.connector, connector_status_connected,
> -					 dp->panel->dpcd, dp->panel->downstream_ports);
> +	if (!dp->dp_display.is_edp)
> +		drm_dp_set_subconnector_property(dp->dp_display.connector,
> +						 connector_status_connected,
> +						 dp->panel->dpcd,
> +						 dp->panel->downstream_ports);
>   
>   	edid = dp->panel->edid;
>   
> -- 
> 2.42.0
> 
