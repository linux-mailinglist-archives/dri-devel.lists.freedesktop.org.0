Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE664A9FF16
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 03:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5840410E113;
	Tue, 29 Apr 2025 01:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="oja3v6wW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C4710E113;
 Tue, 29 Apr 2025 01:33:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNr8Au014387;
 Tue, 29 Apr 2025 01:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k8UK6jwGk/6PHbZRlDY7xuQUeLMYPt9vBG1td0U3d9E=; b=oja3v6wWCVhS/c3O
 1+VgWOKEv6xVtuaELzbBUXdMZxzuxK/NSc0iJO/ekOGw8Y3MnWg4ii+uFtGGk0ek
 vCnzfyyCr22PgN8QekXVEOfRSgj8KCGal/aezFmFOnkq4qF2QNVxKl9CaVH1LS8f
 G22XAFzUh70ZKe8/Ops6bJhj2SE5tcuQf7FH2cXzVObmMOSl+tgiAOE4mqweLUll
 0ClgUznltkLDBK4R1DAhnGW3/q4B2jz5b0xP/UbZVhToktQG1r9QTRxhkWMUJztA
 mOMYmepQxx6x+S7P1Ei8srGG54qahffbn4ufIRkBhldKfVxtQ5P7LyuMdqjbr3vl
 vZ+ZvA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn1s0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Apr 2025 01:33:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T1X71g026229
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Apr 2025 01:33:07 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 18:33:06 -0700
Message-ID: <628f3361-6795-4e69-aac2-f9f3200eb6fe@quicinc.com>
Date: Mon, 28 Apr 2025 18:33:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: drop TE2 definitions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?=
 <barnabas.czeman@mainlining.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
 <20250301-dpu-fix-catalog-v2-4-498271be8b50@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250301-dpu-fix-catalog-v2-4-498271be8b50@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: S7FufDX-5zJyBIM899_LNUpvOwOTPkOL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAxMCBTYWx0ZWRfXxjEPR+B5Gp3+
 wf8HxFjk6MFy9PJuMuYHGMQXg98JKawTUkw9/tAxudBXkyq7H2LR04BMvpTTAIkhBXxPjNSvv0Z
 k4OLbb7R4YD2EnL4aNFJXlICqMVqwrJDgaw+rJJ6SZsWZntZnvh+2AQgXLXnZ3+3FTOlQCHU6hn
 QKMVhG1NFMObdqfkePLqLmrdZp+c379v6WD8sIIccvBml/6JIgByHx7CZCphiYNquSTYf4NF6gk
 /3cCEBiBpcWo/QuMk/HPECYDqW6pzRrlxEASUmjP7tTCI/YOyx4COWjpmNDx5OwVFE0EZZxfsb/
 x6oP2yacbQ091HoafUX+u1+oJCjzvevI5dsiDCWq4U5rHCL/9nRriK4EadrMbAy//IZ+QeWk4Wr
 PC2gYJVppKQkJOXE8CU4i4spE11PPt2g95fCPgrM17hn0c0jlzssN3QNIKsFNu8t55IswKj5
X-Proofpoint-GUID: S7FufDX-5zJyBIM899_LNUpvOwOTPkOL
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=68102c54 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=0mfY3lsZo78Ad611_AQA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290010
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/1/2025 1:24 AM, Dmitry Baryshkov wrote:
> Neither DPU driver nor vendor SDE driver do not use TE2 definitions
> (and, in case of SDE driver, never did). Semantics of the TE2 feature
> bit and .te2 sblk are not completely clear. Drop these bits from the
> catalog with the possibility of reintroducing them later if we need to
> support ppsplit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 17 -----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  6 +-----
>   7 files changed, 19 insertions(+), 40 deletions(-)
> 

<snip>

>   
> @@ -465,22 +459,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
>   /*************************************************************
>    * PINGPONG sub blocks config
>    *************************************************************/
> -static const struct dpu_pingpong_sub_blks msm8996_pp_sblk_te = {
> -	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
> -		.version = 0x1},
> -};
>   
>   static const struct dpu_pingpong_sub_blks msm8996_pp_sblk = {
>   	/* No dither block */
>   };
>   
> -static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
> -	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
> -		.version = 0x1},
> -	.dither = {.name = "dither", .base = 0x30e0,
> -		.len = 0x20, .version = 0x10000},
> -};
> -

Agreed about TE2. I do not see even te2 sub-block programming in 
dpu_hw_pingpong but why do we also need to drop dither?

That one is being used in dpu_hw_pp_setup_dither().

>   static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
>   	.dither = {.name = "dither", .base = 0x30e0,
>   		.len = 0x20, .version = 0x10000},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..07b50e23ee954b96e7e6bd684dc12823f99d630b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -115,7 +115,6 @@ enum {
>   
>   /**
>    * PINGPONG sub-blocks
> - * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
>    * @DPU_PINGPONG_DITHER     Dither blocks
> @@ -123,8 +122,7 @@ enum {
>    * @DPU_PINGPONG_MAX
>    */
>   enum {
> -	DPU_PINGPONG_TE2 = 0x1,
> -	DPU_PINGPONG_SPLIT,
> +	DPU_PINGPONG_SPLIT = 0x1,
>   	DPU_PINGPONG_SLAVE,
>   	DPU_PINGPONG_DITHER,
>   	DPU_PINGPONG_DSC,
> @@ -404,8 +402,6 @@ struct dpu_dspp_sub_blks {
>   };
>   
>   struct dpu_pingpong_sub_blks {
> -	struct dpu_pp_blk te;
> -	struct dpu_pp_blk te2;
>   	struct dpu_pp_blk dither;
>   };
>   
> 

