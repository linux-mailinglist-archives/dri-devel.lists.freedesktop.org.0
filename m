Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D097173BB
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 04:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB3010E45E;
	Wed, 31 May 2023 02:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458D310E45E;
 Wed, 31 May 2023 02:32:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V2L99I032617; Wed, 31 May 2023 02:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UOZlxMBcTyoR+H3OtqbjN67kWh3KHWFFv6RTOzoTVoU=;
 b=ZZ7VodkwGbRb2XiTECydWymxFlgFiHSBR3bWHc8st0GprRKeSyK+l0Po2yfh5eWe80Ah
 QgTC1yuHalptoNQV/hcRJ3d2M8ZEC2IOHgXnzgTmss+ZIesjZwpqpalxd58Li+8qdoP4
 KLyuDKjICk/jBB+Kh00qbL8BEQYBTN1UhaWngoaCFKPRq605lalhmjyeoPqZsKVM8I1g
 Z3XUol2FsoujIxGbkWrot1mCHWEhuAk5ft6HlMUjH3HC9NlFOOzkWCImY4CBIEJPnuzV
 nwhAOo6Vm13b7z4rqDxHk2flXBk2U5S9U6/SSqQWiz1XtNVXPSCKO090+ri7DdSvUAYO HQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qwmvpgyfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 02:32:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34V2WAwh026591
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 02:32:10 GMT
Received: from [10.110.120.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 30 May
 2023 19:32:09 -0700
Message-ID: <df4652ad-8403-5ae0-b8fe-cf4c016e9832@quicinc.com>
Date: Tue, 30 May 2023 19:32:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: re-introduce dpu core revision to the catalog
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <20230531005358.18090-1-quic_abhinavk@quicinc.com>
 <20230531021612.7juugywxkvakewif@ripper>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230531021612.7juugywxkvakewif@ripper>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kfGJS1Cp-377Y4z9DLA3k78hlj_nlxSi
X-Proofpoint-ORIG-GUID: kfGJS1Cp-377Y4z9DLA3k78hlj_nlxSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_18,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305310018
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/30/2023 7:16 PM, Bjorn Andersson wrote:
> On Tue, May 30, 2023 at 05:53:55PM -0700, Abhinav Kumar wrote:
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
>> 	enable the bit;
>>
>> Also, add some of the useful macros back to be able to use dpu core
>> revision effectively.
>>
>> [1]: https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4
>>
> 
> No concerns with the patch, it looks good and the argumentation sounds
> reasonable. But it would be preferable to introduce it together with an
> actual user (or am I just missing it?).
> 
> Regards,
> Bjorn
> 

The plan is that the DSC over DP (to be posted in a week or week.5), DSC 
over DSI (already on the list) , widebus (already on the list) and 
perhaps even the interrupt cleanup (already on the list) will be rebased 
on top of this.

Its just that the authors for those are different.

If we agree on this change, the rebased versions for those can be posted 
to the list. That was the intention of posting this first as I didnt 
want others to rebase if this wasnt going to be accepted.

>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  1 +
>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  1 +
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 31 ++++++++++++++++++-
>>   14 files changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index 3c732a0360c7..16c2861e0359 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -185,6 +185,7 @@ static const struct dpu_perf_cfg msm8998_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>> +	.core_rev = DPU_HW_VER_300,
>>   	.caps = &msm8998_dpu_caps,
>>   	.ubwc = &msm8998_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(msm8998_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> index 36ea1af10894..1c003935c948 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> @@ -183,6 +183,7 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sdm845_cfg = {
>> +	.core_rev = DPU_HW_VER_400,
>>   	.caps = &sdm845_dpu_caps,
>>   	.ubwc = &sdm845_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sdm845_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> index b5f751354267..8c914be62a88 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> @@ -208,6 +208,7 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sm8150_cfg = {
>> +	.core_rev = DPU_HW_VER_500,
>>   	.caps = &sm8150_dpu_caps,
>>   	.ubwc = &sm8150_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sm8150_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> index 8ed2b263c5ea..9465bde128eb 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> @@ -214,6 +214,7 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>> +	.core_rev = DPU_HW_VER_510,
>>   	.caps = &sc8180x_dpu_caps,
>>   	.ubwc = &sc8180x_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> index daebd2170041..1b04ecfb7cde 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> @@ -214,6 +214,7 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sm8250_cfg = {
>> +	.core_rev = DPU_HW_VER_600,
>>   	.caps = &sm8250_dpu_caps,
>>   	.ubwc = &sm8250_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sm8250_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> index 0b05da2592c0..16e905e35025 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> @@ -128,6 +128,7 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sc7180_cfg = {
>> +	.core_rev = DPU_HW_VER_620,
>>   	.caps = &sc7180_dpu_caps,
>>   	.ubwc = &sc7180_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sc7180_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>> index ba9de008519b..87ad7a765e4c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>> @@ -103,6 +103,7 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sm6115_cfg = {
>> +	.core_rev = DPU_HW_VER_630,
>>   	.caps = &sm6115_dpu_caps,
>>   	.ubwc = &sm6115_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sm6115_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> index 92ac348eea6b..a61140ab96ed 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> @@ -93,6 +93,7 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
>> +	.core_rev = DPU_HW_VER_650,
>>   	.caps = &qcm2290_dpu_caps,
>>   	.ubwc = &qcm2290_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index 3c1b2c13398d..01abce7a311c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -201,6 +201,7 @@ static const struct dpu_perf_cfg sm8350_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>> +	.core_rev = DPU_HW_VER_700,
>>   	.caps = &sm8350_dpu_caps,
>>   	.ubwc = &sm8350_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sm8350_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 5d894cbb0a62..4294f1d35d25 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -141,6 +141,7 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>> +	.core_rev = DPU_HW_VER_720,
>>   	.caps = &sc7280_dpu_caps,
>>   	.ubwc = &sc7280_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sc7280_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index c3f1ae000a21..2108e531f13b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -203,6 +203,7 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>> +	.core_rev = DPU_HW_VER_800,
>>   	.caps = &sc8280xp_dpu_caps,
>>   	.ubwc = &sc8280xp_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> index 86c2e68ebd2c..b8d5d0ee8c82 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> @@ -209,6 +209,7 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>> +	.core_rev = DPU_HW_VER_810,
>>   	.caps = &sm8450_dpu_caps,
>>   	.ubwc = &sm8450_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sm8450_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index 85dc34458b88..87a7c06e3024 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -213,6 +213,7 @@ static const struct dpu_perf_cfg sm8550_perf_data = {
>>   };
>>   
>>   const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>> +	.core_rev = DPU_HW_VER_900,
>>   	.caps = &sm8550_dpu_caps,
>>   	.ubwc = &sm8550_ubwc_cfg,
>>   	.mdp_count = ARRAY_SIZE(sm8550_mdp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 677048cc3b7d..cc4aa75a1219 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -19,6 +19,33 @@
>>    */
>>   #define MAX_BLOCKS    12
>>   
>> +#define DPU_HW_VER(MAJOR, MINOR, STEP)\
>> +		  ((((unsigned int)MAJOR & 0xF) << 28) |\
>> +		  ((MINOR & 0xFFF) << 16) |\
>> +		  (STEP & 0xFFFF))
>> +
>> +#define DPU_HW_MAJOR(rev)((rev) >> 28)
>> +#define DPU_HW_MINOR(rev)(((rev) >> 16) & 0xFFF)
>> +#define DPU_HW_STEP(rev)((rev) & 0xFFFF)
>> +#define DPU_HW_MAJOR_MINOR(rev)((rev) >> 16)
>> +
>> +#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
>> +(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
>> +
>> +#define DPU_HW_VER_300 DPU_HW_VER(3, 0, 0) /* 8998 v1.0 */
>> +#define DPU_HW_VER_400 DPU_HW_VER(4, 0, 0) /* sdm845 v1.0 */
>> +#define DPU_HW_VER_500 DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
>> +#define DPU_HW_VER_510 DPU_HW_VER(5, 1, 1) /* sc8180 */
>> +#define DPU_HW_VER_600 DPU_HW_VER(6, 0, 0) /* sm8250 */
>> +#define DPU_HW_VER_620 DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>> +#define DPU_HW_VER_630 DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
>> +#define DPU_HW_VER_650 DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>> +#define DPU_HW_VER_700 DPU_HW_VER(7, 0, 0) /* sm8350 */
>> +#define DPU_HW_VER_720 DPU_HW_VER(7, 2, 0) /* sc7280 */
>> +#define DPU_HW_VER_800 DPU_HW_VER(8, 0, 0) /* sc8280xp */
>> +#define DPU_HW_VER_810 DPU_HW_VER(8, 1, 0) /* sm8450 */
>> +#define DPU_HW_VER_900 DPU_HW_VER(9, 0, 0) /* sm8550 */
>> +
>>   #define DPU_HW_BLK_NAME_LEN	16
>>   
>>   #define MAX_IMG_WIDTH 0x3fff
>> @@ -769,7 +796,7 @@ struct dpu_perf_cfg {
>>   /**
>>    * struct dpu_mdss_cfg - information of MDSS HW
>>    * This is the main catalog data structure representing
>> - * this HW version. Contains number of instances,
>> + * this HW version. Contains dpu core revision, number of instances,
>>    * register offsets, capabilities of the all MDSS HW sub-blocks.
>>    *
>>    * @dma_formats        Supported formats for dma pipe
>> @@ -778,6 +805,8 @@ struct dpu_perf_cfg {
>>    * @mdss_irqs:         Bitmap with the irqs supported by the target
>>    */
>>   struct dpu_mdss_cfg {
>> +	u32 core_rev;
>> +
>>   	const struct dpu_caps *caps;
>>   
>>   	const struct dpu_ubwc_cfg *ubwc;
>> -- 
>> 2.40.1
>>
