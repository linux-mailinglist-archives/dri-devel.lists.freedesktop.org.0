Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA485B0BA9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 19:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C773610E810;
	Wed,  7 Sep 2022 17:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB22310E7FA;
 Wed,  7 Sep 2022 17:42:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 287FmTth026854;
 Wed, 7 Sep 2022 17:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xFDq35mmAJYJOEza2s0pazbnmRY1ELwvsbbSXtUUi+I=;
 b=jNLCfLbDQJoM26saZaHQMzVUPGP8D9f+VH5zaYF9+Hfv955i2TsDwN43yxO5Hrbsj3MF
 KwCf/K/hCJRxIb78kwVAlAGlBu9/+nHmgiVhydLPX4wtZRKJDfqQQagAyzP3/j5iPzZH
 BDrr1fFRaqYeGpPQKkaoXhEFZpmkvRUVSS7yFFwhQMwpmC6Oct1KbcGRDg6/EEep8i9v
 mZdP97gsoJ5r3/39jfu0E++TJGnVUh6NcgyKWkmBi0OXjvt+hpQxcF0n5F4SJpAXYEiN
 vdLCHMeJXKH2oS2NZeqrTT7NymuO6RQLD5hFQ0GqwEMsD07fCGwNayMC8cUcoPjW5hQ6 vg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jeqfwj7hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 17:42:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 287HgAM0017230
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 7 Sep 2022 17:42:10 GMT
Received: from [10.111.166.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 7 Sep 2022
 10:42:07 -0700
Message-ID: <e7f08898-b967-f1fb-6067-5243622dd7be@quicinc.com>
Date: Wed, 7 Sep 2022 10:42:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dp: cleared DP_DOWNSPREAD_CTRL register before
 start link training
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
References: <1662571300-4898-1-git-send-email-quic_khsieh@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1662571300-4898-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gC-7QpqqnlvDoHSKIvzKbRV2sGIUoSYm
X-Proofpoint-GUID: gC-7QpqqnlvDoHSKIvzKbRV2sGIUoSYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_09,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070068
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/7/2022 10:21 AM, Kuogee Hsieh wrote:
> DOWNSPREAD_CTRL (0x107) shall be cleared to 0 upon power-on reset or an
> upstream device disconnect. This patch will enforce this rule by always
> cleared DOWNPREAD_CTRL register to 0 before start link training. At rare
> case that DP MSA timing parameters may be mis-interpreted by the sinker
sinker--->sink
> which causes audio sampling rate be calculated wrongly and cause audio
> did not work at sinker if DOWNSPREAD_CTRL register is not cleared to 0.
same here
> This patch also make sure bring sinker out of D3 power-down mode into D0
> (normal operation mode) successfully by retrying 3 times.
> 
here too
> Fixes: 154b5a7da0fd ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c |  5 ++---
>   drivers/gpu/drm/msm/dp/dp_link.c | 17 +++++++++++------
>   2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index ab6aa13..e864a6e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1245,7 +1245,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>   {
>   	int ret = 0;
>   	const u8 *dpcd = ctrl->panel->dpcd;
> -	u8 encoding = DP_SET_ANSI_8B10B;
> +	u8 encoding[2] = {0, DP_SET_ANSI_8B10B};
>   	u8 ssc;
>   	u8 assr;
>   	struct dp_link_info link_info = {0};
> @@ -1263,8 +1263,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>   		drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
>   	}
>   
> -	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
> -				&encoding, 1);
> +	drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, encoding, 2);
>   

This seems wrong.

This will override the value programmed by the above piece of code.

         if (drm_dp_max_downspread(dpcd)) {
                 ssc = DP_SPREAD_AMP_0_5;
                 drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
         }

Perhaps, you should have an else case to the above if and program 0 only 
for those cases?

>   	if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
>   		assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 36f0af0..3ad3826 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -49,7 +49,7 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
>   					struct dp_link_info *link)
>   {
>   	u8 value;
> -	int err;
> +	int i, err;
>   
>   	if (link->revision < 0x11)
>   		return 0;
> @@ -61,11 +61,16 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
>   	value &= ~DP_SET_POWER_MASK;
>   	value |= DP_SET_POWER_D0;
>   
> -	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> -	if (err < 0)
> -		return err;
> -
> -	usleep_range(1000, 2000);
> +	/*
> +	 * When turning on, we need to retry for 1ms to give the sink
> +	 * time to wake up.
> +	 */
> +	for (i = 0; i < 3; i++) {
> +	        err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> +		usleep_range(1000, 2000);
> +		if (err == 1)
> +			break;
> +	}
>   
>   	return 0;
>   }
