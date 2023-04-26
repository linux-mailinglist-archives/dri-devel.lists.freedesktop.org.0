Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D04376EF85E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 18:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D125D10E979;
	Wed, 26 Apr 2023 16:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF5E10E59E;
 Wed, 26 Apr 2023 16:24:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QG4XXi025015; Wed, 26 Apr 2023 16:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jxCYqtU/KKjkZUQB929AylqzoqPHD48TdjP8lQBgiQo=;
 b=Uu+TZDjj+vDoVLruPzOacCpgFhY5A2lFI1+RjGNifA9iRNN72IoPFtKCEwpQL2xOp2+G
 FR9zyLCESBO+kPbJjDN24lwMoZR2zHWuTMDrLZla6kmr/zpanWK8JxQk4OlDyTFRTJ13
 YQpMhFm4315TrcLEhGpLWIX6QurL/b9aDLpFS9tnZSQyFdcldnr9St6FDEiFcd2ZLuGH
 2sncuX3M1nzhcoozWjogtowb9bIPxf4pB/LCTVaX2TTj/YIqSl3V1wOqMi4PfUbEKR+9
 ad2lyUgVCMAX9zoPsBjzUOtXtXG2mbdjfD41IUnzmcdlPX5xefWksCiO+rpns+VPn4P9 lA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6uprsrct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 16:24:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33QGOMcS019706
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 16:24:22 GMT
Received: from [10.110.124.105] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 26 Apr
 2023 09:24:20 -0700
Message-ID: <d44022e0-bc09-122e-5a48-1994cb025ba8@quicinc.com>
Date: Wed, 26 Apr 2023 09:24:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 06/21] drm/msm/dpu: Use V2 DITHER PINGPONG sub-block in
 SM8[34]50/SC8280XP
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-6-693b17fe6500@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230411-dpu-intf-te-v3-6-693b17fe6500@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: rTTZ43xHj4-xreqtiXVZR4FNTkRaHNT6
X-Proofpoint-GUID: rTTZ43xHj4-xreqtiXVZR4FNTkRaHNT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_08,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260144
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
Cc: Jami
 Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/25/2023 4:05 PM, Marijn Suijten wrote:
> According to downstream sources this DITHER sub-block sits at an offset
> of 0xe0 with version 0x20000.  The PP_BLK_DITHER macro is _not_ used as
> downstream still says the size of the PINGPONG block is 0xd4 and not 0.
> 

the PINGPONG block size is 0x0 on sm8350, sm8450 and sc8280xp.

and length of dither is 0x20 and they all start at 0xe0.

So now does anything prevent us from using PP_BLK_DITHER macro for these?

> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
>   3 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 41ef0c8fc993f..4c1bb88029cd3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -127,22 +127,22 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
>   };
>   
>   static const struct dpu_pingpong_cfg sm8350_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>   			-1),
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 12c14d15e3863..bab9b0715f8c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -121,17 +121,17 @@ static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
>   };
>   
>   static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
>   		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
>   		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
>   		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
>   		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
>   		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
>   		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index e409c119b0a2a..ec296a52076ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -128,28 +128,28 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
>   };
>   /* FIXME: interrupts */
>   static const struct dpu_pingpong_cfg sm8450_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>   			-1),
> -	PP_BLK("pingpong_6", PINGPONG_6, 0x65800, MERGE_3D_3, sdm845_pp_sblk,
> +	PP_BLK("pingpong_6", PINGPONG_6, 0x65800, MERGE_3D_3, sc7280_pp_sblk,
>   			-1,
>   			-1),
> -	PP_BLK("pingpong_7", PINGPONG_7, 0x65c00, MERGE_3D_3, sdm845_pp_sblk,
> +	PP_BLK("pingpong_7", PINGPONG_7, 0x65c00, MERGE_3D_3, sc7280_pp_sblk,
>   			-1,
>   			-1),
>   };
> 
