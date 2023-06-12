Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8746772CFA5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 21:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA42210E2C9;
	Mon, 12 Jun 2023 19:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F300E10E2C6;
 Mon, 12 Jun 2023 19:36:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35CJU3ja010196; Mon, 12 Jun 2023 19:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fPKQJtui81opo56mpOlA1n8Dz+1eDrQwBjeFrk/NclU=;
 b=eO41uHUgQPleXJt5lmvhdNNXSzjAXq+qkmLBx9RQv4fElxLjzmtYqMoxYlN6uD9sxWJd
 KTmVB4gIJ7wWFaAJn4I36NnieZryDmkuIFBH3To7A5BDsAw+Z9QmKRmqv7sHxwhZQKkc
 qX7NHTQ5+zgPzkJ8OXqf4TMqeeYN60NghH+noResAKh9asEpJfuKK1qywKMt93D080JX
 oR8XGysh9KmzmA8JXiO5mIAyl7sEojDKs1t0ZFwo/88XXHpuOIsjoyWbbvydrMKIsUm+
 NC/Eavqko82JPCn53pfkVmyasSLPXW6mllVzphtD2HVGNI7vDOWexuKiNHcFg54Yj6/d fw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r61q2141w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 19:35:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35CJZsK1027135
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 19:35:54 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 12 Jun
 2023 12:35:52 -0700
Message-ID: <b2ab681d-5f22-2ea2-a8af-7e06839967a1@quicinc.com>
Date: Mon, 12 Jun 2023 12:35:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/msm/dpu/catalog: define DSPP blocks found on
 sdm845
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
 <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xF36dUSvIjmJDwLHT1Sq3rhkyjJmgbti
X-Proofpoint-ORIG-GUID: xF36dUSvIjmJDwLHT1Sq3rhkyjJmgbti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_14,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120170
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



On 6/12/2023 11:25 AM, Dmitry Baryshkov wrote:
> Add definitions of DSPP blocks present on the sdm845 platform. This
> should enable color-management on sdm845-bassed devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 21 +++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 

This change itself is fine, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

one note below for a future cleanup:

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 36ea1af10894..b6098141bb9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -96,19 +96,30 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>   
>   static const struct dpu_lm_cfg sdm845_lm[] = {
>   	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> +		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>   	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
> +		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>   	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
> +		&sdm845_lm_sblk, PINGPONG_2, LM_5, DSPP_2),
>   	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
> +		&sdm845_lm_sblk, PINGPONG_NONE, 0, DSPP_3),
>   	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
>   		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
>   	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
>   		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>   };
>   
> +static const struct dpu_dspp_cfg sdm845_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};
> +

I see the len of pcc blocks should be 0x88 not 0x90 as sm8150_dspp_sblk 
explains.

Also, I need to do some digging on the PCC version here. Can you pls 
provide me the link to downstream source which mentions PCC version is 
4.0 for sdm845?

>   static const struct dpu_pingpong_cfg sdm845_pp[] = {
>   	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -193,6 +204,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
>   	.sspp = sdm845_sspp,
>   	.mixer_count = ARRAY_SIZE(sdm845_lm),
>   	.mixer = sdm845_lm,
> +	.dspp_count = ARRAY_SIZE(sdm845_dspp),
> +	.dspp = sdm845_dspp,
>   	.pingpong_count = ARRAY_SIZE(sdm845_pp),
>   	.pingpong = sdm845_pp,
>   	.dsc_count = ARRAY_SIZE(sdm845_dsc),
