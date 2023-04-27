Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730F26F0CF9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 22:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6FC10E156;
	Thu, 27 Apr 2023 20:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C64110E0CD;
 Thu, 27 Apr 2023 20:20:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RJAxLP025224; Thu, 27 Apr 2023 20:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7sYLtoGqHixjuLKoSO7Z5gBZMqdPqhuKfIZLXnURMO8=;
 b=iOOw52L/tgWmxE/e1ImYvuoKgVup0ZkZV81g4hh2+B60g3qe0iuUXX5VdhoKDiUj4MPu
 zyhcEhw4Uv6M9OGJNE+yatIXdqiZCieH/HTvjiRBC+r7DZoEAJQQDHnMkQ5xJnGpePQ9
 ziwDDuVZpIoxVVFTsPF+Zs+IYlCAT4gEocdIonnJWaPMgd04sLuXv/EXehb2oukwbIJ1
 mNZWoFWmByJqzq4E6Ir6or2weIXufhhqIhCQR8k5/fNwwSLHzdY+1Bxvm/5xdf2lLw/n
 YZajxaUJsP69OquttUnrWl468n3cj5ZUtj2WmQr8eZnTXPsdehWWaicN7TYQN7ic1OYp Lw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7xdy85qt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 20:20:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33RKKUGM005824
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 20:20:30 GMT
Received: from [10.110.124.105] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 27 Apr
 2023 13:20:29 -0700
Message-ID: <5b0fb557-482b-a3df-613e-371eddfee93b@quicinc.com>
Date: Thu, 27 Apr 2023 13:20:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: remove GC related code from dpu
 catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230426192246.5517-1-quic_abhinavk@quicinc.com>
 <20230426192246.5517-3-quic_abhinavk@quicinc.com>
 <a1a4f31e-b591-498d-d99e-872661d154d1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <a1a4f31e-b591-498d-d99e-872661d154d1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gczkiXd2tbRIEEh3_Nz0J_gwmtUA6PHs
X-Proofpoint-ORIG-GUID: gczkiXd2tbRIEEh3_Nz0J_gwmtUA6PHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270179
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
Cc: quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/27/2023 8:57 AM, Dmitry Baryshkov wrote:
> On 26/04/2023 22:22, Abhinav Kumar wrote:
>> Since Gamma Correction (GC) block is currently unused, drop
>> related code from the dpu hardware catalog otherwise this
>> becomes a burden to carry across chipsets in the catalog.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Link: 
>> https://lore.kernel.org/r/20230421224721.12738-2-quic_abhinavk@quicinc.com 
>>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 +---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
>>   2 files changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 03f162af1a50..badfc3680485 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -91,7 +91,7 @@
>>   #define MERGE_3D_SM8150_MASK (0)
>> -#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
>> +#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC)
>>   #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
>> @@ -449,8 +449,6 @@ static const struct dpu_lm_sub_blks 
>> qcm2290_lm_sblk = {
>>   static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
>>       .pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
>>           .len = 0x90, .version = 0x10007},
>> -    .gc = { .id = DPU_DSPP_GC, .base = 0x17c0,
>> -        .len = 0x90, .version = 0x10007},
>>   };
>>   static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 71584cd56fd7..e0dcef04bc61 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -127,12 +127,10 @@ enum {
>>   /**
>>    * DSPP sub-blocks
>>    * @DPU_DSPP_PCC             Panel color correction block
>> - * @DPU_DSPP_GC              Gamma correction block
>>    * @DPU_DSPP_IGC             Inverse gamma correction block
>>    */
>>   enum {
>>       DPU_DSPP_PCC = 0x1,
>> -    DPU_DSPP_GC,
>>       DPU_DSPP_IGC,
> 
> Don't we need to remove this one too (in the previous patch)?

Yes, we should. I thought of it right after sending this. will push a v3 
which fixes it in the prev patch.

> 
>>       DPU_DSPP_MAX
>>   };
>> @@ -433,22 +431,18 @@ struct dpu_sspp_sub_blks {
>>    * @maxwidth:               Max pixel width supported by this mixer
>>    * @maxblendstages:         Max number of blend-stages supported
>>    * @blendstage_base:        Blend-stage register base offset
>> - * @gc: gamma correction block
>>    */
>>   struct dpu_lm_sub_blks {
>>       u32 maxwidth;
>>       u32 maxblendstages;
>>       u32 blendstage_base[MAX_BLOCKS];
>> -    struct dpu_pp_blk gc;
>>   };
>>   /**
>>    * struct dpu_dspp_sub_blks: Information of DSPP block
>> - * @gc : gamma correction block
>>    * @pcc: pixel color correction block
>>    */
>>   struct dpu_dspp_sub_blks {
>> -    struct dpu_pp_blk gc;
>>       struct dpu_pp_blk pcc;
>>   };
> 
