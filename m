Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CD7432F7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 05:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3596D10E070;
	Fri, 30 Jun 2023 03:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E73710E034;
 Fri, 30 Jun 2023 03:16:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35U2m70p025208; Fri, 30 Jun 2023 03:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xJjlRidnZXjEHdkYaMEdnnf8uxeObiRxT7BiJBMePWE=;
 b=f4U2bhZZjyCpi3PHPSq3a98oz44xufQVKSXr1rcQ8/oMXqV2Z6aWyz7FGTbY0ial/vXk
 uImiy4FGlzgJv2fYNyNJtVx1G16n51j7p6tFgjGsH9ZVTpHskQo0Xx/OUE9Vl7fxNMyF
 lcLOEkGHdBbpdGA7P/FJCFAfF+VaMxO2jyCNh+tkhWPh+OC1Dlr2qQoLINCUdKo0Go6t
 kIgcqmh21maw0UeyKa0REHiBJlVw84QBB4RQEjN60gFnghHnMEcXtqULmdzAz+2ExmpE
 61/mHTsc+V3PZ/f5j9HHTsykWyHmO1Nun8p6I9vo7MQCRmasfWXeGkFUdt39+wjBEBcL hA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rh4y6a69h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 03:15:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U3FuSC009505
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 03:15:56 GMT
Received: from [10.110.33.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Thu, 29 Jun
 2023 20:15:55 -0700
Message-ID: <e9cd1c5e-5f2f-5135-65b1-5b02c7aca227@quicinc.com>
Date: Thu, 29 Jun 2023 20:15:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: re-introduce dpu core revision to the
 catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
 <3f8b8abf-9c99-cc9d-5985-ebadbecfe4f6@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <3f8b8abf-9c99-cc9d-5985-ebadbecfe4f6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mFXj76b2gq8ljQfOq7G4NbJblah0LKIw
X-Proofpoint-ORIG-GUID: mFXj76b2gq8ljQfOq7G4NbJblah0LKIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_01,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300026
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/29/2023 5:13 PM, Dmitry Baryshkov wrote:
> On 29/06/2023 22:29, Abhinav Kumar wrote:
>> With [1] dpu core revision was dropped in favor of using the
>> compatible string from the device tree to select the dpu catalog
>> being used in the device.
>>
>> This approach works well however also necessitates adding catalog
>> entries for small register level details as dpu capabilities and/or
>> features bloating the catalog unnecessarily. Examples include but
>> are not limited to data_compress, interrupt register set, widebus etc.
>>
>> Introduce the dpu core revision back as an entry to the catalog so that
>> we can just use dpu revision checks and enable those bits which
>> should be enabled unconditionally and not controlled by a catalog
>> and also simplify the changes to do something like:
>>
>> if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
>>     enable the bit;
>>
>> Since dpu's major and minor versions are now separate fields, lets
>> drop all the DPU_HW_VER macros.
>>
>> [1]: https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4
>>
>> changes in v3:
>>     - drop DPU step version as features are not changing across steps
>>     - add core_major_version / core_minor_version to avoid conflicts
>>     - update the commit text to drop references to the dpu macros
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 8 ++++++--
>>   16 files changed, 36 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Nit: if there is a need for v-next, I'd probably suggest dropping th hex 
> prefix from these values.
> 

ack, I was debating in my head whether to keep it or not and kept it in 
the end. I am fine to drop it too.

>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index 7d0d0e74c3b0..a5d486783c3f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -190,6 +190,8 @@ static const struct dpu_perf_cfg msm8998_perf_data 
>> = {
>>   };
>>   const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>> +    .core_major_version = 0x3,
>> +    .core_minor_version = 0x0,
>>       .caps = &msm8998_dpu_caps,
>>       .ubwc = &msm8998_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(msm8998_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> index b6098141bb9b..1fdb89a4b7a6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> @@ -194,6 +194,8 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sdm845_cfg = {
>> +    .core_major_version = 0x4,
>> +    .core_minor_version = 0x0,
>>       .caps = &sdm845_dpu_caps,
>>       .ubwc = &sdm845_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sdm845_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> index b5f751354267..129c62cf450d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> @@ -208,6 +208,8 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sm8150_cfg = {
>> +    .core_major_version = 0x5,
>> +    .core_minor_version = 0x0,
>>       .caps = &sm8150_dpu_caps,
>>       .ubwc = &sm8150_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sm8150_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> index 8ed2b263c5ea..ca037b070f44 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> @@ -214,6 +214,8 @@ static const struct dpu_perf_cfg sc8180x_perf_data 
>> = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>> +    .core_major_version = 0x5,
>> +    .core_minor_version = 0x1,
>>       .caps = &sc8180x_dpu_caps,
>>       .ubwc = &sc8180x_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sc8180x_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> index daebd2170041..e446af90767e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> @@ -214,6 +214,8 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sm8250_cfg = {
>> +    .core_major_version = 0x6,
>> +    .core_minor_version = 0x0,
>>       .caps = &sm8250_dpu_caps,
>>       .ubwc = &sm8250_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sm8250_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> index 67566b07195a..88288c80b652 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> @@ -132,6 +132,8 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sc7180_cfg = {
>> +    .core_major_version = 0x6,
>> +    .core_minor_version = 0x2,
>>       .caps = &sc7180_dpu_caps,
>>       .ubwc = &sc7180_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sc7180_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>> index 031fc8dae3c6..93c901502b5a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>> @@ -102,6 +102,8 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sm6115_cfg = {
>> +    .core_major_version = 0x6,
>> +    .core_minor_version = 0x3,
>>       .caps = &sm6115_dpu_caps,
>>       .ubwc = &sm6115_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sm6115_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> index 06eba23b0236..ff7e4b775fd5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> @@ -141,6 +141,8 @@ static const struct dpu_perf_cfg sm6350_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sm6350_cfg = {
>> +    .core_major_version = 0x6,
>> +    .core_minor_version = 0x4,
>>       .caps = &sm6350_dpu_caps,
>>       .ubwc = &sm6350_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sm6350_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> index f2808098af39..7bc86aa50e6f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> @@ -92,6 +92,8 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
>> +    .core_major_version = 0x6,
>> +    .core_minor_version = 0x5,
>>       .caps = &qcm2290_dpu_caps,
>>       .ubwc = &qcm2290_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(qcm2290_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> index 241fa6746674..d92890f090d4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> @@ -107,6 +107,8 @@ static const struct dpu_perf_cfg sm6375_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sm6375_cfg = {
>> +    .core_major_version = 0x6,
>> +    .core_minor_version = 0x9,
>>       .caps = &sm6375_dpu_caps,
>>       .ubwc = &sm6375_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sm6375_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index 8da424eaee6a..8a2dc56c79f8 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -213,6 +213,8 @@ static const struct dpu_perf_cfg sm8350_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>> +    .core_major_version = 0x7,
>> +    .core_minor_version = 0x0,
>>       .caps = &sm8350_dpu_caps,
>>       .ubwc = &sm8350_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sm8350_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 900fee410e11..bba7bdb9bd42 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -154,6 +154,8 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>> +    .core_major_version = 0x7,
>> +    .core_minor_version = 0x2,
>>       .caps = &sc7280_dpu_caps,
>>       .ubwc = &sc7280_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sc7280_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index f6ce6b090f71..3f51b802b6b7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -217,6 +217,8 @@ static const struct dpu_perf_cfg 
>> sc8280xp_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>> +    .core_major_version = 0x8,
>> +    .core_minor_version = 0x0,
>>       .caps = &sc8280xp_dpu_caps,
>>       .ubwc = &sc8280xp_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sc8280xp_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> index 8d13c369213c..20acff9db979 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> @@ -221,6 +221,8 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>> +    .core_major_version = 0x8,
>> +    .core_minor_version = 0x1,
>>       .caps = &sm8450_dpu_caps,
>>       .ubwc = &sm8450_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sm8450_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index f17b9a7fee85..89fdf334a0aa 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -225,6 +225,8 @@ static const struct dpu_perf_cfg sm8550_perf_data = {
>>   };
>>   const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>> +    .core_major_version = 0x9,
>> +    .core_minor_version = 0x0,
>>       .caps = &sm8550_dpu_caps,
>>       .ubwc = &sm8550_ubwc_cfg,
>>       .mdp_count = ARRAY_SIZE(sm8550_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index b860784ade72..8b900be3ea90 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -796,8 +796,9 @@ struct dpu_perf_cfg {
>>   /**
>>    * struct dpu_mdss_cfg - information of MDSS HW
>>    * This is the main catalog data structure representing
>> - * this HW version. Contains number of instances,
>> - * register offsets, capabilities of the all MDSS HW sub-blocks.
>> + * this HW version. Contains dpu's major and minor versions,
>> + * number of instances, register offsets, capabilities of the
>> + * all MDSS HW sub-blocks.
>>    *
>>    * @dma_formats        Supported formats for dma pipe
>>    * @cursor_formats     Supported formats for cursor pipe
>> @@ -805,6 +806,9 @@ struct dpu_perf_cfg {
>>    * @mdss_irqs:         Bitmap with the irqs supported by the target
>>    */
>>   struct dpu_mdss_cfg {
>> +    u8 core_major_version;
>> +    u8 core_minor_version;
>> +
>>       const struct dpu_caps *caps;
>>       const struct dpu_ubwc_cfg *ubwc;
> 
