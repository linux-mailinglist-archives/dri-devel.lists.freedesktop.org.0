Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F673C507
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 02:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4A410E103;
	Sat, 24 Jun 2023 00:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D703110E103;
 Sat, 24 Jun 2023 00:09:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35NNqr03021448; Sat, 24 Jun 2023 00:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cnq5krcqwAsOwPeNM8J57gWplA/sMeZZivFN/l7ve1M=;
 b=CqPMSlHDIdXi+W/xuHav8hDD1E9y27HpiUzwAhc8sxXwhtpiGOSMehnYlFa66hPjbKYu
 GSr10+qTUNDvrMzgEgmN/OkrqvTSH1WVyaK7cj98HV1t5rGvwOlaHlgFJb/3pR9ZBHEd
 7EC9TkQB484lK75Mzy4UZVOR0WWHPf5gyU45MrCW7H7ErwoWFVI3EbMBd/T78Q17A3K1
 hZONSMLwACKfzQ8/VDerjSUjFgWQnOwiuGlnn2MvdAjl7vRphy+Q7JUuPv6yGOmqeyQd
 996PWLpBfF9nxcvUBoGOVKmMH+cQaBhdM0xX7AiyuCK3kB5waeeckWJbGdMzqOflWnT+ eg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rcw93jvgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 24 Jun 2023 00:09:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35O09CVZ013409
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 24 Jun 2023 00:09:12 GMT
Received: from [10.110.61.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 17:09:10 -0700
Message-ID: <1e41b909-4886-8392-edbc-78684e52bbf9@quicinc.com>
Date: Fri, 23 Jun 2023 17:09:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/msm/dpu: Update dev core dump to dump registers
 of sub blocks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Ryan McCann
 <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-6-3b2cdcc6a576@quicinc.com>
 <114f34dd-e5ce-f878-5b23-4c14dc800547@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <114f34dd-e5ce-f878-5b23-4c14dc800547@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: A9EqZX9Jcar87sot__13p7oWJRsOaaQg
X-Proofpoint-ORIG-GUID: A9EqZX9Jcar87sot__13p7oWJRsOaaQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_14,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230219
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



On 6/22/2023 5:13 PM, Dmitry Baryshkov wrote:
> On 23/06/2023 02:48, Ryan McCann wrote:
>> Currently, the device core dump mechanism does not dump registers of sub
>> blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Add wrapper
>> function to dump hardware blocks that contain sub blocks.
>>
>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 194 
>> +++++++++++++++++++++++++++-----
>>   1 file changed, 168 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index aa8499de1b9f..9b1b1c382269 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -885,6 +885,154 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
>>       return 0;
>>   }
>> +static void dpu_kms_mdp_snapshot_add_block(struct msm_disp_state 
>> *disp_state,
>> +                       void __iomem *mmio, void *blk,
>> +                       enum dpu_hw_blk_type blk_type)
> 
> No. Such multiplexers add no value to the code. Please inline it.
> 
> Not to mention that this patch is hard to review. You both move existing 
> code and add new features. If it were to go, it should have been split 
> into two patches: one introducing the multiplexer and another one adding 
> subblocks.
> 

Ok. we can split this into:

1) adding the multiplexer
2) adding sub-blk parsing support inside the multiplexer

>> +{
>> +    u32 base;
>> +
>> +    switch (blk_type) {
>> +    case DPU_HW_BLK_TOP:
>> +    {
>> +        struct dpu_mdp_cfg *top = (struct dpu_mdp_cfg *)blk;
>> +
>> +        if (top->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>> +            msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>> +                            mmio + top->base, "top");
>> +            msm_disp_snapshot_add_block(disp_state, top->len - 
>> MDP_PERIPH_TOP0_END,
>> +                            mmio + top->base + MDP_PERIPH_TOP0_END,
>> +                            "top_2");
>> +        } else {
>> +            msm_disp_snapshot_add_block(disp_state, top->len, mmio + 
>> top->base, "top");
>> +        }
>> +        break;
>> +    }
>> +    case DPU_HW_BLK_LM:
>> +    {
>> +        struct dpu_lm_cfg *mixer = (struct dpu_lm_cfg *)blk;
>> +
>> +        msm_disp_snapshot_add_block(disp_state, mixer->len, mmio + 
>> mixer->base, "%s",
>> +                        mixer->name);
>> +        break;
>> +    }
>> +    case DPU_HW_BLK_CTL:
>> +    {
>> +        struct dpu_ctl_cfg *ctl = (struct dpu_ctl_cfg *)blk;
>> +
>> +        msm_disp_snapshot_add_block(disp_state, ctl->len, mmio + 
>> ctl->base, "%s",
>> +                        ctl->name);
>> +        break;
>> +    }
>> +    case DPU_HW_BLK_INTF:
>> +    {
>> +        struct dpu_intf_cfg *intf = (struct dpu_intf_cfg *)blk;
>> +
>> +        msm_disp_snapshot_add_block(disp_state, intf->len, mmio + 
>> intf->base, "%s",
>> +                        intf->name);
>> +        break;
>> +    }
>> +    case DPU_HW_BLK_WB:
>> +    {
>> +        struct dpu_wb_cfg *wb = (struct dpu_wb_cfg *)blk;
>> +
>> +        msm_disp_snapshot_add_block(disp_state, wb->len, mmio + 
>> wb->base, "%s",
>> +                        wb->name);
>> +        break;
>> +    }
>> +    case DPU_HW_BLK_SSPP:
>> +    {
>> +        struct dpu_sspp_cfg *sspp_block = (struct dpu_sspp_cfg *)blk;
>> +        const struct dpu_sspp_sub_blks *sblk = sspp_block->sblk;
>> +
>> +        base = sspp_block->base;
>> +
>> +        msm_disp_snapshot_add_block(disp_state, sspp_block->len, mmio 
>> + base, "%s",
>> +                        sspp_block->name);
>> +
>> +        if (sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED4))
>> +            msm_disp_snapshot_add_block(disp_state, 
>> sblk->scaler_blk.len,
>> +                            mmio + base + sblk->scaler_blk.base, 
>> "%s_%s",
>> +                            sspp_block->name, sblk->scaler_blk.name);
> 
> Actually, it would be better to:
> - drop name from all sblk instances (and use known string instead of the 
> sblk name here)
> - Use sblk->foo_blk.len to check if it should be printed or not.
> 

No, I dont agree. If we drop the names from the sub_blk in the catalog, 
we will end up using "sub_blk_name" string here in the code to indicate 
which blk that is in the dump.

If we add more sub_blks in the catalog in the future we need to keep 
changing the code over here. Thats not how it should be.

Leaving the names in the catalog ensures that this code wont change and 
only catalog changes when we add a new sub_blk either for an existing or 
new chipset.

catalog is indicating the new blk, and dumping code just prints it.

with your approach, dumping code will or can keep changing with chipsets 
or sub_blks. Thats not how it should be.

>> +
>> +        if (sspp_block->features & BIT(DPU_SSPP_CSC) || 
>> sspp_block->features
>> +                    & BIT(DPU_SSPP_CSC_10BIT))
> 
> A very bad use of indentation. In future please split logically rather 
> than just filling the line up to the line width.
> 
>> +            msm_disp_snapshot_add_block(disp_state, sblk->csc_blk.len,
>> +                            mmio + base + sblk->csc_blk.base, "%s_%s",
>> +                            sspp_block->name, sblk->csc_blk.name);
>> +        break;
>> +    }
>> +    case DPU_HW_BLK_DSPP:
>> +    {
>> +        struct dpu_dspp_cfg *dspp_block = (struct dpu_dspp_cfg *)blk;
>> +
>> +        base = dspp_block->base;
>> +
>> +        msm_disp_snapshot_add_block(disp_state, dspp_block->len, mmio 
>> + base, "%s",
>> +                        dspp_block->name);
>> +
>> +        if (dspp_block->features & BIT(DPU_DSPP_PCC))
>> +            msm_disp_snapshot_add_block(disp_state, 
>> dspp_block->sblk->pcc.len,
>> +                            mmio + base + dspp_block->sblk->pcc.base,
>> +                            "%s_%s", dspp_block->name,
>> +                            dspp_block->sblk->pcc.name);
>> +        break;
>> +    }
>> +    case DPU_HW_BLK_PINGPONG:
>> +    {
>> +        struct dpu_pingpong_cfg *pingpong_block = (struct 
>> dpu_pingpong_cfg *)blk;
>> +        const struct dpu_pingpong_sub_blks *sblk = pingpong_block->sblk;
>> +
>> +        base = pingpong_block->base;
>> +
>> +        msm_disp_snapshot_add_block(disp_state, pingpong_block->len, 
>> mmio + base, "%s",
>> +                        pingpong_block->name);
>> +
>> +        if (pingpong_block->features & BIT(DPU_PINGPONG_TE2))
>> +            msm_disp_snapshot_add_block(disp_state, sblk->te2.len,
>> +                            mmio + base + sblk->te2.base, "%s_%s",
>> +                            pingpong_block->name, sblk->te2.name);
>> +
>> +        if (pingpong_block->features & BIT(DPU_PINGPONG_DITHER))
>> +            msm_disp_snapshot_add_block(disp_state, sblk->dither.len,
>> +                            mmio + base + sblk->dither.base, "%s_%s",
>> +                            pingpong_block->name, sblk->dither.name);
>> +        break;
>> +    }
>> +    case DPU_HW_BLK_DSC:
>> +    {
>> +        struct dpu_dsc_cfg *dsc_block = (struct dpu_dsc_cfg *)blk;
>> +
>> +        base = dsc_block->base;
>> +
>> +        if (dsc_block->features & BIT(DPU_DSC_HW_REV_1_2)) {
>> +            struct dpu_dsc_blk enc = dsc_block->sblk->enc;
>> +            struct dpu_dsc_blk ctl = dsc_block->sblk->ctl;
>> +
>> +            /* For now, pass in a length of 0 because the DSC_BLK 
>> register space
>> +             * overlaps with the sblks' register space.
>> +             *
>> +             * TODO: Pass in a length of 0 t0 DSC_BLK_1_2 in the HW 
>> catalog where
>> +             * applicable.
> 
> Nice catch, thank you. We should fix that.
> 

Yes and we would have fixed that ourself if you wanted that with this 
series as another patch.

