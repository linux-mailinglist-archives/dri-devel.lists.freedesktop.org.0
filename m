Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2077465C8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 00:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DCF10E244;
	Mon,  3 Jul 2023 22:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799E410E242;
 Mon,  3 Jul 2023 22:37:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 363Lm2gd013358; Mon, 3 Jul 2023 22:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Ay6tLkI/AH1QA9KrggdGysWuCoyjCKgERcC7ED2x39E=;
 b=WELS16T5W5jK8KEStGaspZ2YR+TlBf29KxGTidVXYN8SeVTn2lnp5ZvD6Dp9LiklN5sD
 y4VZmzIYuW45A+p29yp0YiBtEfFrWlxsnmsjGtziLbeVPu3mJxqNgEGe5lVu30rAncek
 GBT31+B+ukdoCnCrH065s8Pyzy7RiqHFH8Xr4glHMsMuYyEL9rSaGqCNx35hOAsDHFmp
 JEhl4sUmL4fL1UDkQoJ+/lOta5vk0klQtpUYbz4zurywJ4KoLlzqDGASTVS5UnUpxpuB
 knz8xB8rbLpjWetQoZ63QJTY3xEkdQW02Ga37SVEFRPBOcmljXSwPTxfsF+4I07xMV3X ag== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rksycss7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jul 2023 22:37:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 363MbW9W015852
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jul 2023 22:37:32 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 15:37:31 -0700
Message-ID: <61760ea5-92a4-2150-033f-7d8a9b167eb7@quicinc.com>
Date: Mon, 3 Jul 2023 15:37:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/8] drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s
 stop_req param
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230620000846.946925-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CQgudFB62GhSDgJaq7URoovrK2499iw_
X-Proofpoint-ORIG-GUID: CQgudFB62GhSDgJaq7URoovrK2499iw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_15,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030205
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> The stop_req is true only in the dpu_crtc_disable() case, when
> crtc->enable has already been set to false. This renders the stop_req
> argument useless. Remove it completely.
> 

What about the enable case?

That time dpu_crtc->enabled  will be false but you need valid clock and 
BW that time when you want to enable.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +++---
>   3 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index f8d5c87d0915..773e641eab28 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -277,7 +277,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>   }
>   
>   int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> -		int params_changed, bool stop_req)
> +			      int params_changed)
>   {
>   	struct dpu_core_perf_params *new, *old;
>   	bool update_bus = false, update_clk = false;
> @@ -301,13 +301,13 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>   	dpu_crtc = to_dpu_crtc(crtc);
>   	dpu_cstate = to_dpu_crtc_state(crtc->state);
>   
> -	DRM_DEBUG_ATOMIC("crtc:%d stop_req:%d core_clk:%llu\n",
> -			crtc->base.id, stop_req, kms->perf.core_clk_rate);
> +	DRM_DEBUG_ATOMIC("crtc:%d enabled:%d core_clk:%llu\n",
> +			crtc->base.id, crtc->enabled, kms->perf.core_clk_rate);
>   
>   	old = &dpu_crtc->cur_perf;
>   	new = &dpu_cstate->new_perf;
>   
> -	if (crtc->enabled && !stop_req) {
> +	if (crtc->enabled) {
>   		/*
>   		 * cases for bus bandwidth update.
>   		 * 1. new bandwidth vote - "ab or ib vote" is higher
> @@ -337,7 +337,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>   	}
>   
>   	trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
> -		new->core_clk_rate, stop_req, update_bus, update_clk);
> +		new->core_clk_rate, !crtc->enabled, update_bus, update_clk);
>   
>   	if (update_bus) {
>   		ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
> @@ -355,7 +355,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>   	if (update_clk) {
>   		clk_rate = _dpu_core_perf_get_core_clk_rate(kms);
>   
> -		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
> +		trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
>   
>   		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
>   		ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index 2bf7836f79bb..c29ec72984b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -58,11 +58,10 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>    * dpu_core_perf_crtc_update - update performance of the given crtc
>    * @crtc: Pointer to crtc
>    * @params_changed: true if crtc parameters are modified
> - * @stop_req: true if this is a stop request
>    * return: zero if success, or error code otherwise
>    */
>   int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> -		int params_changed, bool stop_req);
> +			      int params_changed);
>   
>   /**
>    * dpu_core_perf_crtc_release_bw - release bandwidth of the given crtc
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index ff5d306b95ed..214229d11e3e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -718,7 +718,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
>   void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>   {
>   	trace_dpu_crtc_complete_commit(DRMID(crtc));
> -	dpu_core_perf_crtc_update(crtc, 0, false);
> +	dpu_core_perf_crtc_update(crtc, 0);
>   	_dpu_crtc_complete_flip(crtc);
>   }
>   
> @@ -884,7 +884,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
>   		return;
>   
>   	/* update performance setting before crtc kickoff */
> -	dpu_core_perf_crtc_update(crtc, 1, false);
> +	dpu_core_perf_crtc_update(crtc, 1);
>   
>   	/*
>   	 * Final plane updates: Give each plane a chance to complete all
> @@ -1100,7 +1100,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   		atomic_set(&dpu_crtc->frame_pending, 0);
>   	}
>   
> -	dpu_core_perf_crtc_update(crtc, 0, true);
> +	dpu_core_perf_crtc_update(crtc, 0);
>   
>   	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
>   		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
