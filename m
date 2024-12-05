Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCE99E4C6F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 03:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54E510E0EC;
	Thu,  5 Dec 2024 02:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FxkOAYvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F7810E0E3;
 Thu,  5 Dec 2024 02:46:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4FYiOK010188;
 Thu, 5 Dec 2024 02:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Uf7kfTAk0QPk/J1ykbjhJ4K9c+4Go26O2FgRuYAVa80=; b=FxkOAYvHg9D/8XAE
 nFLhRlW6jW3z/XuQAfGAi12wy0A+VX/ZJe79EOuuKAzsiG23gaZpP2Vf6/os08FE
 7PqXf1ldtu0ImqBE7w2OB8AAQfjDC17PD9E7Ji8O10gVTIKOSvPD00EZA1Qktt+X
 GE0mERxjL0zmJVOo41DejX1lJ+YNQ5oVtsEzczQc/+X/vn/ItBp7bU1NzAvedMyY
 ZEwxT7P9YHshFgGOdT2ZbfXyJgeUCq3REE6vCKgeY0bDJbAHbg64NNTCIqmbNOaY
 /+NFfdfZG5mFsve506k0x7uY5iDGekwXpQ/bE8tY1zOs5kStOz4pbzUmAZeOGGE3
 90PxEg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a4by4thy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2024 02:46:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B52kpN7025242
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 5 Dec 2024 02:46:51 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 18:46:44 -0800
Message-ID: <b6603724-d9bc-44fd-8474-1dd181b47433@quicinc.com>
Date: Thu, 5 Dec 2024 10:46:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add QCS8300 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>
 <wbw7ftf7ogcylxbeav3vegyfgz32sc2h5plneo2w7djsy2kaeo@enkcbukosern>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <wbw7ftf7ogcylxbeav3vegyfgz32sc2h5plneo2w7djsy2kaeo@enkcbukosern>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 49rVFHB5gW7yqsCsh6uNj0fUPHnmKPmV
X-Proofpoint-ORIG-GUID: 49rVFHB5gW7yqsCsh6uNj0fUPHnmKPmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050022
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



On 2024/11/30 2:55, Dmitry Baryshkov wrote:
> On Wed, Nov 27, 2024 at 03:05:03PM +0800, Yongxing Mou wrote:
>> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
> 
> Once rebased on top of [1]:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [1] https://lore.kernel.org/dri-devel/20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/
> 
got it,thanks
>>
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index b7bd899ead44bf86998e7295bccb31a334fa6811..90d8fe469d3134ec73f386153509ac257d75930a 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -568,6 +568,16 @@ static const struct msm_mdss_data qcm2290_data = {
>>   	.reg_bus_bw = 76800,
>>   };
>>   
>> +static const struct msm_mdss_data qcs8300_data = {
>> +	.ubwc_enc_version = UBWC_4_0,
>> +	.ubwc_dec_version = UBWC_4_0,
>> +	.ubwc_swizzle = 6,
>> +	.ubwc_static = 1,
>> +	.highest_bank_bit = 3,
>> +	.macrotile_mode = 1,
>> +	.reg_bus_bw = 74000,
>> +};
>> +
>>   static const struct msm_mdss_data sa8775p_data = {
>>   	.ubwc_enc_version = UBWC_4_0,
>>   	.ubwc_dec_version = UBWC_4_0,
>> @@ -715,6 +725,7 @@ static const struct of_device_id mdss_dt_match[] = {
>>   	{ .compatible = "qcom,mdss" },
>>   	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>>   	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
>> +	{ .compatible = "qcom,qcs8300-mdss", .data = &qcs8300_data },
>>   	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>>   	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>>   	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>>
>> -- 
>> 2.34.1
>>
> 

