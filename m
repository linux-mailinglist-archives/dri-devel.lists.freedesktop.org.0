Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A16DB759
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 01:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2DA10EE7D;
	Fri,  7 Apr 2023 23:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC94F10ED48;
 Fri,  7 Apr 2023 23:43:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 337NS7Qt017509; Fri, 7 Apr 2023 23:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lvPxUj334HnKjjUG8mIbh75+iOvRS1YOvJ4B3TXXHPE=;
 b=djhjzuDwbNPXXvyv8i+YB85GtVevi9bzm0M3DZRZ8pyUhzDJFmu3ZFY9Cg1MTdEs2+EH
 4DCHdiVvD9hBxdbDp9quSBrPcB82bAzjdzpf80a4+XpPH4aeFY9Gwa/HO3fxCidVqigX
 eE9QV3MmGvXwxHTOZl+R6U5foZy4/TDbByV1wtWX72cwhBaXJ75Br8auZrljBnLFs2L/
 A0Jr5wRyqeL+trcE6SgdG4CdX8Mmw/AEhxRXlEvPKbzq+gQbLQHq8barVJ+JaErkl8Fd
 zmysHmituzkH7PG/Uuk53527nTTmJ0SyTUiLpzr82J6C0nbbVNHZFs+cZ/V3LJmT3iTC LQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pt5s9ttcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 23:43:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 337NhSAd032728
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Apr 2023 23:43:28 GMT
Received: from [10.110.59.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 7 Apr 2023
 16:43:27 -0700
Message-ID: <6b144e9f-0607-62db-05ee-58d5640807ab@quicinc.com>
Date: Fri, 7 Apr 2023 16:43:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 34/42] drm/msm/dpu: enable DSPP and DSC on sc8180x
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-35-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230404130622.509628-35-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 828XtTTO_V4PTXyLV2eW7ifsJiqZrJHx
X-Proofpoint-ORIG-GUID: 828XtTTO_V4PTXyLV2eW7ifsJiqZrJHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_15,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070214
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



On 4/4/2023 6:06 AM, Dmitry Baryshkov wrote:
> Enable DSPP and DSC hardware blocks on sc8180x platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 26 +++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index fb8cdcd6bfe9..93d303cc0dc5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -102,9 +102,9 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>   
>   static const struct dpu_lm_cfg sc8180x_lm[] = {
>   	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> +		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>   	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
> +		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>   	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>   		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
>   	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> @@ -115,6 +115,17 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>   		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
>   };
>   
> +static const struct dpu_dspp_cfg sc8180x_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};

I was looking at DSPP_SC7180_MASK. This has only PCC. Today the only 
DSPP feature we are supporting seems to be PCC as the "gc" base is not 
used. In that aspect this is fine. Perhaps getting rid of 
DSPP_SC7180_MASK and just using the feature mask directly is more 
appropriate here. So BIT(DPU_DSPP_PCC). I dont know if you want to 
handle that in a separate series to replace DSPP_SC7180_MASK with 
BIT(DPU_DSPP_PCC)

So do we also need to correct the msm8998 DSPP mask because gc is really 
not programmed today from what I can see. So that mask really is not 
doing anything.

> +
>   static const struct dpu_pingpong_cfg sc8180x_pp[] = {
>   	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -142,6 +153,13 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
>   	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
>   };
>   
> +static const struct dpu_dsc_cfg sc8180x_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> +};

There is also DSC_4 and DSC_5 at 0x81000 and 0x81400 resp.

Rest LGTM.

> +
>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -190,6 +208,10 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>   	.sspp = sc8180x_sspp,
>   	.mixer_count = ARRAY_SIZE(sc8180x_lm),
>   	.mixer = sc8180x_lm,
> +	.dspp_count = ARRAY_SIZE(sc8180x_dspp),
> +	.dspp = sc8180x_dspp,
> +	.dsc_count = ARRAY_SIZE(sc8180x_dsc),
> +	.dsc = sc8180x_dsc,
>   	.pingpong_count = ARRAY_SIZE(sc8180x_pp),
>   	.pingpong = sc8180x_pp,
>   	.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
