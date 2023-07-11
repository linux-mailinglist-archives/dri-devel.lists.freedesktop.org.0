Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C02474E445
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 04:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914EF10E2BE;
	Tue, 11 Jul 2023 02:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A55D10E30F;
 Tue, 11 Jul 2023 02:32:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36B2Aob2007693; Tue, 11 Jul 2023 02:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xD5SsMtOnNufdqNgaLLKWwccIQ4sQv48THVGulvdeZo=;
 b=UwDdYrKJjNq6RHaz13GCYZZaKIlS5MOH00uYNX8NMSqq6+iOX0WvyKwP9U+JVe8osV/n
 DfgvfJvEwR3FgORNkaSzOJYpcRfeCF1tx80YdLXSl4B5OqWN0e5c0Aq1nEGT9umXqqqR
 3jc8ZD5jyVG0ie+V9yPh7lUdg+UuAtsT1cicixJ6fQ27DOOZs747+ZVQ27otXAjuTskv
 QBOuf/gGs7razK52Nfv8Wg31LDK+aPOOQDLMsj6+X5NYk1MVS15bc412g6mq9CzYn1bT
 EmCtwJ01nOptqGzrtSHlxKkycXGYSG5xJF+JclxV8o73D/R5S/2Jh6Tpkyar9dkrSrGF EQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rrwm1g27t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jul 2023 02:31:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36B2Vp66014728
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jul 2023 02:31:51 GMT
Received: from [10.110.47.185] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 10 Jul
 2023 19:31:50 -0700
Message-ID: <729de13d-6fb7-ff1c-8660-4710d914258b@quicinc.com>
Date: Mon, 10 Jul 2023 19:31:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 04/11] drm/msm/dpu: drop separate dpu_core_perf_tune
 overrides
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
 <20230707193942.3806526-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230707193942.3806526-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7NeTYd12_-HjGjfBzYRpd7eOn9rwoNGl
X-Proofpoint-GUID: 7NeTYd12_-HjGjfBzYRpd7eOn9rwoNGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_18,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110021
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/7/2023 12:39 PM, Dmitry Baryshkov wrote:
> The values in struct dpu_core_perf_tune are fixed per the core perf
> mode. Drop the 'tune' values and substitute them with known values when
> performing perf management.
> 
> Note: min_bus_vote was not used at all, so it is just silently dropped.
> 

Interesting ..... should bring this back properly. Will take it up.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 ++++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  4 ---
>   2 files changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 05d340aa18c5..348550ac7e51 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -235,7 +235,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>   {
>   	struct dpu_core_perf_params perf = { 0 };
>   	int i, ret = 0;
> -	u64 avg_bw;
> +	u32 avg_bw;
>   

avg_bw seems unused in this patch, so unrelated change?

>   	if (!kms->num_paths)
>   		return 0;
> @@ -291,10 +291,16 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
>   
>   static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>   {
> -	u64 clk_rate = kms->perf.perf_tune.min_core_clk;
> +	u64 clk_rate;
>   	struct drm_crtc *crtc;
>   	struct dpu_crtc_state *dpu_cstate;
>   
> +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
> +		return kms->perf.fix_core_clk_rate;
> +
> +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
> +		return kms->perf.max_core_clk_rate;
> +
>   	drm_for_each_crtc(crtc, kms->dev) {
>   		if (crtc->enabled) {
>   			dpu_cstate = to_dpu_crtc_state(crtc->state);
> @@ -305,11 +311,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>   		}
>   	}
>   
> -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
> -		clk_rate = kms->perf.fix_core_clk_rate;
> -
> -	DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
> -

Why dont you move both FIXED and MINIMUM handling below instead of above.

So that they will just override the clk_rate and you can keep this 
useful log here and it matches where the function is.

This chunk looks better that way.

<skipping the rest as it LGTM>
