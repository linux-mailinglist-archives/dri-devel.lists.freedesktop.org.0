Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE5970E62A
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 22:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B3610E4C6;
	Tue, 23 May 2023 20:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A643810E4EE;
 Tue, 23 May 2023 20:01:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34NIjFkE010482; Tue, 23 May 2023 20:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=exOVyQ0BZXYAezuKBYhiu0aT2oYSEcNVjLzOtS7AbEE=;
 b=Tjp3559F90FmTyJT1Gl1NurGF7d6+/44OMauLbrfKX6f0qS0A2S8eyZrBdgPnQlntFnV
 tyvFb6S0ZZp1WwaCsJ/152mEZjvlq4gfIBjjoMlWneqNEJNApTiuwVYPEjJgCuvaps2T
 wWhjlL5KZknmw0JJiPnsMxbK3ZRmBsO3RMrZbj/pOgHgHs0oTXK+odZL1E6LbTWYIqTz
 Pa6kt6Bgzr76mcEcgaNSN9S99kQiiyhV7SquRdBENGFuEOkTjaP1Ok8MUNYBsQpRMBQy
 SjbjugEDcITWEtssySs7VIK33p9GbUxd0arh+4BP0tK+NICe1O41CAzXlGE/9B7HvjAb Cg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qrf77b138-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 20:01:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34NK1FHW016366
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 20:01:15 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 23 May
 2023 13:01:14 -0700
Message-ID: <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
Date: Tue, 23 May 2023 13:01:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ud7W2rk5AEi4U5Is9HVFlYgEmHuLQ3pA
X-Proofpoint-ORIG-GUID: Ud7W2rk5AEi4U5Is9HVFlYgEmHuLQ3pA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_12,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 mlxlogscore=760 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230161
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> Drop SSPP-specifig debugfs register dumps in favour of using
> debugfs/dri/0/kms or devcoredump.
> 

I did see another series which removes src_blk from the catalog (I am 
yet to review that one) . Lets assume that one is fine and this change 
will be going on top of that one right?

The concern I have with this change is that although I do agree that we 
should be in favor of using debugfs/dri/0/kms ( i have used it a few 
times and it works pretty well ), devcoredump does not have the support 
to dump sub-blocks . Something which we should add with priority because 
even with DSC blocks with the separation of enc/ctl blocks we need that 
like I wrote in one of the responses.

So the "len" of the blocks having sub-blocks will be ignored in favor of 
the len of the sub-blocks.

If we remove this without adding that support first, its a loss of debug 
functionality.

Can we retain these blocks and remove dpu_debugfs_create_regset32 in a 
different way?


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 25 ---------------------
>   1 file changed, 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index bfd82c2921af..6c5ebee2f7cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -727,31 +727,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>   	debugfs_create_xul("features", 0600,
>   			debugfs_root, (unsigned long *)&hw_pipe->cap->features);
>   
> -	/* add register dump support */
> -	dpu_debugfs_create_regset32("src_blk", 0400,
> -			debugfs_root,
> -			sblk->src_blk.base + cfg->base,
> -			sblk->src_blk.len,
> -			kms);
> -
> -	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> -		dpu_debugfs_create_regset32("scaler_blk", 0400,
> -				debugfs_root,
> -				sblk->scaler_blk.base + cfg->base,
> -				sblk->scaler_blk.len,
> -				kms);
> -
> -	if (cfg->features & BIT(DPU_SSPP_CSC) ||
> -			cfg->features & BIT(DPU_SSPP_CSC_10BIT))
> -		dpu_debugfs_create_regset32("csc_blk", 0400,
> -				debugfs_root,
> -				sblk->csc_blk.base + cfg->base,
> -				sblk->csc_blk.len,
> -				kms);
> -
>   	debugfs_create_u32("xin_id",
>   			0400,
>   			debugfs_root,
