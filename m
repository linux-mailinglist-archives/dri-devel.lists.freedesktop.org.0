Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB4748F0A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 22:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFA610E149;
	Wed,  5 Jul 2023 20:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5B610E149;
 Wed,  5 Jul 2023 20:39:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365KbHvT001589; Wed, 5 Jul 2023 20:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Chfx9CSSC4mbgphjXOJP4Eory2csh7EtuNFrELNzAjY=;
 b=N5i0MF1pGIdGArxLHwHCaKcpZDtG7O2UyUMy1MubPQRjFTxJDZBgGAM5WzyBOEO1Cn/B
 3QNXEEuwahBNfwHNEAUkZUtnyaPj7AMYlKxI4tp9UlXycXgGSgnFOeOIRPDfxMstVbU6
 0u9UJV35jOCo8ytubUlC5PP5orXMHtCN1RCpPDP+TOG7hUxgxMejRfIDXeLTYSLNVCJ2
 LPYLqTLpXdswqkCl6VJBX5I1/pGb/9gyVg1Up6LVejm4OPsPy0CcDwbhnFcH++m2wjAJ
 89FFxh2ihHz85xtsiAXSLm/u6jItayutQUq6Mz6CuS3fvAccuTUckyK7ieT0IRuOHMu7 5g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rnb5a0kfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 20:39:44 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 365KdhHh007431
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Jul 2023 20:39:43 GMT
Received: from [10.71.108.78] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Wed, 5 Jul 2023
 13:39:43 -0700
Message-ID: <857503f4-c828-3816-1bb0-5ee3567d63e0@quicinc.com>
Date: Wed, 5 Jul 2023 13:39:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: Update dev core dump to dump
 registers of sub-blocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
 <20230622-devcoredump_patch-v2-5-9e90a87d393f@quicinc.com>
 <cebe822f-2c00-4826-a48e-4344379b3e65@linaro.org>
Content-Language: en-US
From: Ryan McCann <quic_rmccann@quicinc.com>
In-Reply-To: <cebe822f-2c00-4826-a48e-4344379b3e65@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ASMTGw35VvpPEjZpewiGxTFRBmHDJqJw
X-Proofpoint-ORIG-GUID: ASMTGw35VvpPEjZpewiGxTFRBmHDJqJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_11,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050187
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/5/2023 1:22 PM, Dmitry Baryshkov wrote:
> On 05/07/2023 22:30, Ryan McCann wrote:
>> Currently, the device core dump mechanism does not dump registers of
>> sub-blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Edit
>> dpu_kms_mdp_snapshot function to account for sub-blocks.
>>
>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 106 
>> ++++++++++++++++++++++++--------
>>   1 file changed, 82 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index aa8499de1b9f..c83f5d79e5c5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -890,62 +890,120 @@ static void dpu_kms_mdp_snapshot(struct 
>> msm_disp_state *disp_state, struct msm_k
>>       int i;
>>       struct dpu_kms *dpu_kms;
>>       const struct dpu_mdss_cfg *cat;
>> +    void __iomem *mmio;
>> +    u32 base;
>>       dpu_kms = to_dpu_kms(kms);
>>       cat = dpu_kms->catalog;
>> +    mmio = dpu_kms->mmio;
>>       pm_runtime_get_sync(&dpu_kms->pdev->dev);
>>       /* dump CTL sub-blocks HW regs info */
>>       for (i = 0; i < cat->ctl_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
>> -                dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len, mmio 
>> + cat->ctl[i].base,
>> +                        "%s", cat->ctl[i].name);
> 
> This is not relevant to sub-blocks. If you wish to refactor the main 
> block printing, please split it to a separate commit.

Ok. I will split this commit into changes pertaining to sub-blocks and 
changes to how the name of main blocks are printed. I would like to 
print main block names as they appear in the catalog.
> 
> Also, please note that `msm_disp_snapshot_add_block(...., "%s", 
> block->name)` is redundant. We do not expect formatting characters in 
> block names. So, "%s" can be dropped.

Here, "%s" is used in order to print the the name of the main block from 
the catalog. As mentioned above I can implement this in another commit.
> 
>>       /* dump DSPP sub-blocks HW regs info */
>> -    for (i = 0; i < cat->dspp_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
>> -                dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
>> +    for (i = 0; i < cat->dspp_count; i++) {
>> +        base = cat->dspp[i].base;
>> +        msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, 
>> mmio + base, "%s",
>> +                        cat->dspp[i].name);
>> +
>> +        if (cat->dspp[i].sblk && cat->dspp[i].sblk->pcc.len > 0)
>> +            msm_disp_snapshot_add_block(disp_state, 
>> cat->dspp[i].sblk->pcc.len,
>> +                            mmio + base + cat->dspp[i].sblk->pcc.base,
>> +                            "%s_%s", cat->dspp[i].name,
>> +                            cat->dspp[i].sblk->pcc.name);
>> +    }
>> +
>>       /* dump INTF sub-blocks HW regs info */
>>       for (i = 0; i < cat->intf_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
>> -                dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->intf[i].len, 
>> mmio + cat->intf[i].base,
>> +                        "%s", cat->intf[i].name);
>>       /* dump PP sub-blocks HW regs info */
>> -    for (i = 0; i < cat->pingpong_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
>> -                dpu_kms->mmio + cat->pingpong[i].base, "pingpong_%d", 
>> i);
>> +    for (i = 0; i < cat->pingpong_count; i++) {
>> +        base = cat->pingpong[i].base;
>> +        msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len, 
>> mmio + base, "%s",
>> +                        cat->pingpong[i].name);
>> +
>> +        /* TE2 block has length of 0, so will not print it */
>> +
>> +        if (cat->pingpong[i].sblk && 
>> cat->pingpong[i].sblk->dither.len > 0)
>> +            msm_disp_snapshot_add_block(disp_state, 
>> cat->pingpong[i].sblk->dither.len,
>> +                            mmio + base + 
>> cat->pingpong[i].sblk->dither.base,
>> +                            "%s_%s", cat->pingpong[i].name,
>> +                            cat->pingpong[i].sblk->dither.name);
>> +    }
>>       /* dump SSPP sub-blocks HW regs info */
>> -    for (i = 0; i < cat->sspp_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
>> -                dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
>> +    for (i = 0; i < cat->sspp_count; i++) {
>> +        base = cat->sspp[i].base;
>> +        msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, 
>> mmio + cat->sspp[i].base,
>> +                        "%s", cat->sspp[i].name);
>> +
>> +        if (cat->sspp[i].sblk && cat->sspp[i].sblk->scaler_blk.len > 0)
>> +            msm_disp_snapshot_add_block(disp_state, 
>> cat->sspp[i].sblk->scaler_blk.len,
>> +                            mmio + base + 
>> cat->sspp[i].sblk->scaler_blk.base,
>> +                            "%s_%s", cat->sspp[i].name,
>> +                            cat->sspp[i].sblk->scaler_blk.name);
>> +
>> +        if (cat->sspp[i].sblk && cat->sspp[i].sblk->csc_blk.len > 0)
>> +            msm_disp_snapshot_add_block(disp_state, 
>> cat->sspp[i].sblk->csc_blk.len,
>> +                            mmio + base + 
>> cat->sspp[i].sblk->csc_blk.base,
>> +                            "%s_%s", cat->sspp[i].name,
>> +                            cat->sspp[i].sblk->csc_blk.name);
>> +    }
>>       /* dump LM sub-blocks HW regs info */
>>       for (i = 0; i < cat->mixer_count; i++)
>>           msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
>> -                dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
>> +                        mmio + cat->mixer[i].base,
>> +                        "%s", cat->mixer[i].name);
>>       /* dump WB sub-blocks HW regs info */
>>       for (i = 0; i < cat->wb_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>> -                dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->wb[i].len, mmio 
>> + cat->wb[i].base,
>> +                        "%s", cat->wb[i].name);
>>       if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>> -        msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>> -                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +        msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0, mmio 
>> + cat->mdp[0].base,
>> +                        "top");
>>           msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 
>> MDP_PERIPH_TOP0_END,
>> -                dpu_kms->mmio + cat->mdp[0].base + 
>> MDP_PERIPH_TOP0_END, "top_2");
>> +                        mmio + cat->mdp[0].base + MDP_PERIPH_TOP0_END,
>> +                        "top_2");
>>       } else {
>> -        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>> -                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len, mmio 
>> + cat->mdp[0].base,
>> +                        "top");
>>       }
>>       /* dump DSC sub-blocks HW regs info */
>> -    for (i = 0; i < cat->dsc_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
>> -                dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
>> +    for (i = 0; i < cat->dsc_count; i++) {
>> +        base = cat->dsc[i].base;
>> +
>> +        if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
>> +            struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
>> +            struct dpu_dsc_blk ctl = cat->dsc[i].sblk->ctl;
>> +
>> +            /* For now, pass in a length of 0 because the DSC_BLK 
>> register space
>> +             * overlaps with the sblks' register space.
>> +             *
>> +             * TODO: Pass in a length of 0 t0 DSC_BLK_1_2 in the HW 
>> catalog where
>> +             * applicable.
>> +             */
>> +            msm_disp_snapshot_add_block(disp_state, 0, mmio + base, 
>> "%s", cat->dsc[i].name);
>> +            msm_disp_snapshot_add_block(disp_state, enc.len, mmio + 
>> base + enc.base,
>> +                            "%s_%s", cat->dsc[i].name, enc.name);
>> +            msm_disp_snapshot_add_block(disp_state, ctl.len, mmio + 
>> base + ctl.base,
>> +                            "%s_%s", cat->dsc[i].name, ctl.name);
>> +        } else {
>> +            msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, 
>> mmio + base, "%s",
>> +                            cat->dsc[i].name);
>> +        }
>> +    }
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }
>>
> 
