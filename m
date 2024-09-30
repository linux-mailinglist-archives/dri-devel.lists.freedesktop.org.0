Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A677498A8DE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 17:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93C410E53E;
	Mon, 30 Sep 2024 15:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="oI4L83S1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A6010E53C;
 Mon, 30 Sep 2024 15:42:08 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48U6RwYN014784;
 Mon, 30 Sep 2024 15:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Gc55ob5J5ocO4uDw82svtlrKc6l6j/9azVaUVKIUbzg=; b=oI4L83S1Yru2ByEf
 oaSvklSYWWKAJIYTd4fvvdv+/1FLUWnJikQlFF5FAc63q+qsAwuiyItbPPoS+NPb
 mEln0G2d5hjOMOnr4VTm9vVGsFq4r2HAGV0KiBCMaVsIx9VEYtwfyxyUcx+zSJHS
 7Anduf9GAHea1R1mcz6Zm9Wod/1GCg3EqCi1WuMMLi56MFFARyhacR/adVIiO0lI
 3u2vVTqMs1dPKKNuPn3k1W/FQ3QNqV73fzPlxtmGXyjsm8fvutJjJqbijwvDPrY2
 Fv96HIwV0e/IxaRio+HnMmGyWqgxy7O1GtfGGZRa/Aa+eAApRZYwKaB9X94Iyvay
 SpISrQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41yprahfsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2024 15:41:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48UFfqHM000802
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2024 15:41:52 GMT
Received: from [10.216.16.87] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 08:41:41 -0700
Message-ID: <942f6385-295a-4b48-8c1b-159930eeb828@quicinc.com>
Date: Mon, 30 Sep 2024 21:11:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: Add SA8775P support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <swboyd@chromium.org>,
 <konrad.dybcio@linaro.org>, <danila@jiaxyga.com>,
 <bigfoot@classfun.cn>, <neil.armstrong@linaro.org>,
 <mailingradian@gmail.com>, <quic_jesszhan@quicinc.com>,
 <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <quic_kalyant@quicinc.com>, <quic_jmadiset@quicinc.com>,
 <quic_vpolimer@quicinc.com>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-5-quic_mahap@quicinc.com>
 <w26xpuqeltoxjvewo4zesnjazw23onovcasltzcwrejdpgav2h@p6fj2lts2n4s>
Content-Language: en-US
From: Mahadevan P <quic_mahap@quicinc.com>
In-Reply-To: <w26xpuqeltoxjvewo4zesnjazw23onovcasltzcwrejdpgav2h@p6fj2lts2n4s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dsmez5AIwekIwyx4FTHzul4uvDZHFR0g
X-Proofpoint-ORIG-GUID: dsmez5AIwekIwyx4FTHzul4uvDZHFR0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300112
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


On 9/26/2024 6:39 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 26, 2024 at 04:31:36PM GMT, Mahadevan wrote:
>> Add definitions for the display hardware used on the
>> Qualcomm SA8775P platform.
>>
>> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
>> ---
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Minor nit below.
>
>> [v2]
>> - Reorder compatible string of DPU based on alphabetical order.[Dmitry]
>>
>> ---
>>   .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
>>   4 files changed, 491 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
>> new file mode 100644
>> index 000000000000..14d65b5d4093
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
>> @@ -0,0 +1,485 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> What exactly is copyrighted by LF?


LF copyright is not needed.

Thanks for pointing out the copyrights in other files too. Will update 
in subsequent patch.


>
>> + */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index dcb4fd85e73b..6f60fff2c9a6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> I am not a lawyer, but I don't think a single #include is copyrightable.
> Neither are single data lines in other files.
>
>>    */
>>   
>>   #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
>> @@ -699,6 +699,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>>   
>>   #include "catalog/dpu_8_0_sc8280xp.h"
>>   #include "catalog/dpu_8_1_sm8450.h"
>> +#include "catalog/dpu_8_4_sa8775p.h"
>>   
>>   #include "catalog/dpu_9_0_sm8550.h"
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 37e18e820a20..cff16dcf277f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> - * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>>    */
>>   
>> @@ -850,6 +850,7 @@ extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>>   extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>>   extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
>>   extern const struct dpu_mdss_cfg dpu_sm8450_cfg;
>> +extern const struct dpu_mdss_cfg dpu_sa8775p_cfg;
>>   extern const struct dpu_mdss_cfg dpu_sm8550_cfg;
>>   extern const struct dpu_mdss_cfg dpu_sm8650_cfg;
>>   extern const struct dpu_mdss_cfg dpu_x1e80100_cfg;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 9bcae53c4f45..16a0b417435e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -2,7 +2,7 @@
>>   /*
>>    * Copyright (C) 2013 Red Hat
>>    * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    *
>>    * Author: Rob Clark <robdclark@gmail.com>
>>    */
>> @@ -1447,6 +1447,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>>   static const struct of_device_id dpu_dt_match[] = {
>>   	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
>>   	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
>> +	{ .compatible = "qcom,sa8775p-dpu", .data = &dpu_sa8775p_cfg, },
>>   	{ .compatible = "qcom,sdm630-mdp5", .data = &dpu_sdm630_cfg, },
>>   	{ .compatible = "qcom,sdm660-mdp5", .data = &dpu_sdm660_cfg, },
>>   	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },
>> -- 
>> 2.34.1
>>
