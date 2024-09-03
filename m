Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99C96AC10
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 00:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E139310E60C;
	Tue,  3 Sep 2024 22:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Etljk7Bp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C401710E603;
 Tue,  3 Sep 2024 22:20:56 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LwKB9028269;
 Tue, 3 Sep 2024 22:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5j0OpXvCFxUbCCZ05zKzT5gBio/MEcN9YIb08hJBy+A=; b=Etljk7Bpc6RxFs6M
 4YGn3wzPaycjH5SSJYR7z8P611e++hL2XoDdVcJ32C4jklm7nCturesVdcN1/YnT
 0aPNly0uxVobNqlMD+EQ1DPDFqTG4XLcuFXfOw879ut1Ykwv9z8l2fRlbFDWuunL
 OO3xRDxF9pR3oR+K3M9ubqUt1iiHIwoJ+cP0zXu2RG0X0iOitAu5vZ7qV/l78BoH
 qDBlP4akGsBMOUXah8WHnwqFQaD7T1g3cVQUxL6fH5tJIRl6SDb4HQ3gK7ZUi6VR
 WjZseYrAa9PeZQpIjzHELvnNSxx26Vesh9/Kd2iO8Ym+u5SYMhR0oCNQj9+xSgMJ
 QzaRbQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btrxrvjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2024 22:20:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483MKmIm029647
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Sep 2024 22:20:48 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 15:20:47 -0700
Message-ID: <85022ded-962a-47ac-a083-88db7cd81f0f@quicinc.com>
Date: Tue, 3 Sep 2024 15:20:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] drm/msm/dpu: add CWB entry to catalog for SM8650
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-8-502b16ae2ebb@quicinc.com>
 <audsl366wkyqlizb254haxchirlgycr4wpgmp7sbkmynafivoq@pyanmqyfwj7b>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <audsl366wkyqlizb254haxchirlgycr4wpgmp7sbkmynafivoq@pyanmqyfwj7b>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GLe-fU_ol172R9bwXyOeiuZRzFuLLWlG
X-Proofpoint-ORIG-GUID: GLe-fU_ol172R9bwXyOeiuZRzFuLLWlG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030179
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



On 8/30/2024 10:13 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 29, 2024 at 01:48:29PM GMT, Jessica Zhang wrote:
>> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
>>
>> Add new block for concurrent writeback mux to HW catalog and change
>> pingpong index names to distinguish between general use pingpong blocks
>> and pingpong blocks dedicated for concurrent writeback
> 
> Please split into two commits.

Hi Dmitry,

Sounds good

> 
>>
>> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 29 +++++++++++++++++++---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  4 +--
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  4 +--
>>   .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  4 +--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 13 ++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  8 +++---
>>   6 files changed, 48 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
>> index eb5dfff2ec4f..ce2773029763 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
>> @@ -252,25 +252,25 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
>>   		.merge_3d = MERGE_3D_2,
>>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>   	}, {
>> -		.name = "pingpong_6", .id = PINGPONG_6,
>> +		.name = "pingpong_6", .id = PINGPONG_CWB_0,
> 
> Should we also rename such blocks?

Sure, I can change the name to match the id

Thanks,

Jessica Zhang

> 
>>   		.base = 0x66000, .len = 0,
>>   		.features = BIT(DPU_PINGPONG_DITHER),
>>   		.sblk = &sc7280_pp_sblk,
>>   		.merge_3d = MERGE_3D_3,
> 
> 
> -- 
> With best wishes
> Dmitry
