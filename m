Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D38120A7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 22:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899AD10E888;
	Wed, 13 Dec 2023 21:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E51410E87B;
 Wed, 13 Dec 2023 21:23:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDHx1xu005096; Wed, 13 Dec 2023 21:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=N72R4emcnUh/HyiNHvIadlEfsL/Z5O5GJkGxloDSAjU=; b=e4
 kwSfRrr680fiEJC84g5GEFoqPtdkoany1PFD71Jiznnh9O7fbMLq0c7HdqBfKEZv
 Yu2SfIlR6y2qfPiQyQRlJ1MlVw7yyRsKY+oVdD7RFKRoTj/yJE6epIK4Wtnoe3ti
 AOnIyrgKkqw26iWCWS//leTqp/3P6DBCeWCdCfIQmz8wxUw53Qhnk25jQmmKuTwz
 JJASoSsqua4M4ieVv1zOd/xykbod4GGHsBC4h25OZdsYEwYWRNB4iNTWsqhWFLHL
 QMZNJ1oZepOrEI59EYIajhF3hdozIMDIbpdaQd7tbt2UZq1w0siy4yCYeIF1zTT6
 HEPpEPyJgQsWZY1Wk4Jg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy32najgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:23:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDLNh0V029914
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:23:43 GMT
Received: from [10.110.0.246] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 13:23:41 -0800
Message-ID: <038adec5-599c-4ff3-b959-a886a8af9947@quicinc.com>
Date: Wed, 13 Dec 2023 13:23:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: Set input_sel bit for INTF
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com>
 <20231213-encoder-fixup-v2-1-b11a4ad35e5e@quicinc.com>
 <CAA8EJpqr0akUZoDYR1Q2+WBC4vvAgp_xfjBSq2ZTuoS4HLxnUQ@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpqr0akUZoDYR1Q2+WBC4vvAgp_xfjBSq2ZTuoS4HLxnUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2Ge66T5EEhqy8QjgiiM7GAfMkD5hNBXg
X-Proofpoint-GUID: 2Ge66T5EEhqy8QjgiiM7GAfMkD5hNBXg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312130150
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/13/2023 1:20 PM, Dmitry Baryshkov wrote:
> On Wed, 13 Dec 2023 at 22:51, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> Set the input_sel bit for encoders as it was missed in the initial
>> implementation.
>>
>> Reported-by: Rob Clark <robdclark@gmail.com>
>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
>> Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for interface")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 10 ++++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  3 ++-
>>   4 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 0b6a0a7dcc39..226133af7840 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -322,7 +322,7 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>>
>>   static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
>>   {
>> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count);
>> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count, 0x1);
>>   }
>>
>>   static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> index 25af52ab602f..bbc9756ecde9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> @@ -85,7 +85,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>>
>>   static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
>>   {
>> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
>> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count, 0x0);
>>   }
>>
>>   static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> index 0b05061e3e62..87716a60332e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> @@ -477,7 +477,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>>
>>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>>                  u32 misr_ctrl_offset,
>> -               bool enable, u32 frame_count)
>> +               bool enable, u32 frame_count,
>> +               u32 input_sel)
>>   {
>>          u32 config = 0;
>>
>> @@ -487,8 +488,13 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>>          wmb();
>>
>>          if (enable) {
>> +               /*
>> +                * note: Aside from encoders, input_sel should be
>> +                * set to 0x0 by default
>> +                */
> 
> Even if it is not a proper kernedoc, please move this comment before
> the function.

Acked.

> 
>>                  config = (frame_count & MISR_FRAME_COUNT_MASK) |
>> -                       MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
>> +                       MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK |
>> +                       ((input_sel & 0xF) << 24);
>>
>>                  DPU_REG_WRITE(c, misr_ctrl_offset, config);
>>          } else {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> index fe083b2e5696..761056be272b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> @@ -357,7 +357,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>>                  u32 misr_ctrl_offset,
>>                  bool enable,
>> -               u32 frame_count);
>> +               u32 frame_count,
>> +               u32 input_sel);
>>
>>   int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>>                  u32 misr_ctrl_offset,
>>
>> --
>> 2.43.0
>>
> 
> 
> -- 
> With best wishes
> Dmitry
