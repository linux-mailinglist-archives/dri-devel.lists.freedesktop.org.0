Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF1583F428
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C7B10F383;
	Sun, 28 Jan 2024 05:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB38210F374;
 Sun, 28 Jan 2024 05:41:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40S5f0KS024560; Sun, 28 Jan 2024 05:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=w3NKvc/iQa0iGgccPy4ZVkC2X9hQXaqsWJiv2FaNfX4=; b=Zn
 E3fjUamEhmLn+xy3Xj4Bb/Eazm/NxHGHrkoOUDeSYCWVqAlvWLocTBTlipxEyfIg
 w3EztiEgFk8zqGT2MwpUS4205rmIaW260aKsRNOduYBLFXiCNWRWnu8kj0LI+Vlm
 QzYJoeZG8QmersymjO1rPgtH2+vOj96y5/HMzBjeBbRdTqU/P7AVlBqEJe0t2X3C
 FOlGhiIXXvGjA3Zh+vQ878ZuRWn2yAZIIuHrkXE1cPYvdqASPzMayMrE/veG2fTP
 hB2BwCR5WQ8wZltZgy/9GuXgjaok3YdQIQdeBcjf6EXrE5thxy++kp4RbYCnjejy
 Qyz7tOjz5m2IcWu3e4Rg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvse4sf4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:40:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40S5ewvn029685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:40:58 GMT
Received: from [10.110.114.127] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 27 Jan
 2024 21:40:56 -0800
Message-ID: <4301fb48-7ed2-9cb4-1280-20524d15266d@quicinc.com>
Date: Sat, 27 Jan 2024 21:40:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 12/17] drm/msm/dpu: add support of new peripheral flush
 mechanism
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-13-quic_parellan@quicinc.com>
 <96cf7370-b825-4ee9-ae17-8a6d72cb02d4@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <96cf7370-b825-4ee9-ae17-8a6d72cb02d4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: okLl6wcWFHQl9nynKzCZI16O-Gs9ABmj
X-Proofpoint-GUID: okLl6wcWFHQl9nynKzCZI16O-Gs9ABmj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=765
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401280039
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/2024 1:49 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>
>> Introduce a peripheral flushing mechanism to decouple peripheral
>> metadata flushing from timing engine related flush.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      | 17 +++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h      | 10 ++++++++++
>>   3 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index d0f56c5c4cce9..e284bf448bdda 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -437,6 +437,9 @@ static void dpu_encoder_phys_vid_enable(struct 
>> dpu_encoder_phys *phys_enc)
>>       if (ctl->ops.update_pending_flush_merge_3d && 
>> phys_enc->hw_pp->merge_3d)
>>           ctl->ops.update_pending_flush_merge_3d(ctl, 
>> phys_enc->hw_pp->merge_3d->idx);
>>   +    if (ctl->ops.update_pending_flush_periph && 
>> phys_enc->hw_intf->cap->type == INTF_DP)
>> +        ctl->ops.update_pending_flush_periph(ctl, 
>> phys_enc->hw_intf->idx);
>> +
>>   skip_flush:
>>       DPU_DEBUG_VIDENC(phys_enc,
>>           "update pending flush ctl %d intf %d\n",
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index e76565c3e6a43..bf45afeb616d3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -39,6 +39,7 @@
>>   #define   CTL_WB_FLUSH                  0x108
>>   #define   CTL_INTF_FLUSH                0x110
>>   #define   CTL_CDM_FLUSH                0x114
>> +#define   CTL_PERIPH_FLUSH              0x128
>>   #define   CTL_INTF_MASTER               0x134
>>   #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>>   @@ -49,6 +50,7 @@
>>   #define  MERGE_3D_IDX   23
>>   #define  DSC_IDX        22
>>   #define CDM_IDX         26
>> +#define  PERIPH_IDX     30
>>   #define  INTF_IDX       31
>>   #define WB_IDX          16
>>   #define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
>> @@ -151,6 +153,10 @@ static inline void 
>> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>                   ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>>           }
>>   +    if (ctx->pending_flush_mask & BIT(PERIPH_IDX))
>> +        DPU_REG_WRITE(&ctx->hw, CTL_PERIPH_FLUSH,
>> +                  ctx->pending_periph_flush_mask);
>> +
>>       if (ctx->pending_flush_mask & BIT(DSC_IDX))
>>           DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
>>                     ctx->pending_dsc_flush_mask);
>> @@ -311,6 +317,13 @@ static void 
>> dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
>>       ctx->pending_flush_mask |= BIT(INTF_IDX);
>>   }
>>   +static void dpu_hw_ctl_update_pending_flush_periph(struct 
>> dpu_hw_ctl *ctx,
>> +        enum dpu_intf intf)
>
> I assume this is _v1.
> Also the argument is misaligned.
Ack.
>
>> +{
>> +    ctx->pending_periph_flush_mask |= BIT(intf - INTF_0);
>> +    ctx->pending_flush_mask |= BIT(PERIPH_IDX);
>> +}
>> +
>>   static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct 
>> dpu_hw_ctl *ctx,
>>           enum dpu_merge_3d merge_3d)
>>   {
>> @@ -680,6 +693,10 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops 
>> *ops,
>>           ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
>>           ops->update_pending_flush_intf =
>>               dpu_hw_ctl_update_pending_flush_intf_v1;
>> +
>> +        ops->update_pending_flush_periph =
>> +            dpu_hw_ctl_update_pending_flush_periph;
>> +
>>           ops->update_pending_flush_merge_3d =
>>               dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>>           ops->update_pending_flush_wb = 
>> dpu_hw_ctl_update_pending_flush_wb_v1;
>
> What about the pre-active platforms?
Pre-active does not need a peripheral flush.
>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> index ff85b5ee0acf8..5d86c560b6d3f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> @@ -122,6 +122,15 @@ struct dpu_hw_ctl_ops {
>>       void (*update_pending_flush_intf)(struct dpu_hw_ctl *ctx,
>>           enum dpu_intf blk);
>>   +    /**
>> +     * OR in the given flushbits to the cached 
>> pending_(periph_)flush_mask
>> +     * No effect on hardware
>> +     * @ctx       : ctl path ctx pointer
>> +     * @blk       : interface block index
>> +     */
>> +    void (*update_pending_flush_periph)(struct dpu_hw_ctl *ctx,
>> +        enum dpu_intf blk);
>> +
>>       /**
>>        * OR in the given flushbits to the cached 
>> pending_(merge_3d_)flush_mask
>>        * No effect on hardware
>> @@ -264,6 +273,7 @@ struct dpu_hw_ctl {
>>       u32 pending_flush_mask;
>>       u32 pending_intf_flush_mask;
>>       u32 pending_wb_flush_mask;
>> +    u32 pending_periph_flush_mask;
>>       u32 pending_merge_3d_flush_mask;
>>       u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>>       u32 pending_dsc_flush_mask;
>
