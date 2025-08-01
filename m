Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEB8B17B50
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 04:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B279D10E2E3;
	Fri,  1 Aug 2025 02:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bKojUV3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4660010E2E0;
 Fri,  1 Aug 2025 02:50:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VNmnNE025832;
 Fri, 1 Aug 2025 02:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6HrEXklmTT9r1JiqMh77EhJ94xuPJu/BUx+ChrtVX8w=; b=bKojUV3s6te1dOZ1
 47lIfm7sRqQEU5kosBS93cDqLTbsnR8+RPq50ACMX7WqI2gpKSgYQOjFYFwyiDcU
 aC1sV/MaI8EG5jr08cOL48Q1zHG+lv52WmPENHca0xvwPcPLUuJ3tSWH0oNR0O48
 qKrVRCfilcUqKRPVn6OxaNo58BxceBod5dDJUF4syHAIDngGwWjA36DQt2lc9blO
 aLs3mrgzvwjHRwDB3XOQhHtAAQ8TMdO3PCPJPQY3DE/ApeGkWgRWaLDk8UYM3RQ2
 6zFMf/inG2tez/yfOlXzYRDveG4XH+oOVhb7pSmOrHAsRViQF0sLQO5lqs5mSKHA
 iS9n2g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48887g2hs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Aug 2025 02:50:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5712oK24010208
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Aug 2025 02:50:20 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 31 Jul
 2025 19:50:14 -0700
Message-ID: <1f012c23-914e-4910-a87b-6f9e99c83a25@quicinc.com>
Date: Fri, 1 Aug 2025 10:50:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-5-bc8ea35bbed6@quicinc.com>
 <070915c8-4d7f-40d2-ba38-e20a801c9089@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <070915c8-4d7f-40d2-ba38-e20a801c9089@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Vdn3PEp9 c=1 sm=1 tr=0 ts=688c2b6c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=8zkoDQCAsDv43kGhBogA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NrMzwIxgG3z5Xois7MMAjFBTn_JlD0kK
X-Proofpoint-GUID: NrMzwIxgG3z5Xois7MMAjFBTn_JlD0kK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAyMSBTYWx0ZWRfX2VrmplPbImYL
 SJkyHe4+RbnN9CiJ/0twxvrm3gVQdB4o884HdIkMoJrxoId+SaLpT55zzogM75JlJ6mUfKQ4O7r
 HTPrZJe4TmQOpG44GHGGCCyvOrPqpxAHP0Cqvdd8rt/g+TJThsQdpv+Ik+75wqBdxUXEKuEE0Q2
 Lv0tgRPyXFJL1oh/WIxTPInU+NLet2Gid4NZZOIszfoD3tiwOXfoKwKAdSgdhRh/2ORrrrQKR1+
 YmBz+sQk0SR3VmaXPCDxrS/0KKqvOiWUgbFzFMmMVskaY1dazAs4ivunCmmJABmueNgj8XCEmSh
 QJLJf4JxdcTbYmv1fT97qWlo4ezpxLM70IdtdApPPVy5hAC6ZxRGDbNACMeLZbpw30GRwqb1FyU
 OyWgzqxG1SdIG4mPD56P10sV+V/0jw2zbUr9qT4tP1JNhgjlASn7FTeUIV1xEiaPFSqZmYkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010021
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



On 2025/7/30 18:16, Konrad Dybcio wrote:
> On 7/30/25 11:42 AM, Yongxing Mou wrote:
>> The QCS8300 adopts UBWC 4.0, consistent with SA8775P, add 4 channels LP5
>> configuration data according to the specification.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..389fb871018b65987295db60571c063b4d984d70 100644
>> --- a/drivers/soc/qcom/ubwc_config.c
>> +++ b/drivers/soc/qcom/ubwc_config.c
>> @@ -35,6 +35,16 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
>>   	.highest_bank_bit = 15,
>>   };
>>   
>> +static const struct qcom_ubwc_cfg_data qcs8300_data = {
>> +	.ubwc_enc_version = UBWC_4_0,
>> +	.ubwc_dec_version = UBWC_4_0,
>> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
>> +			UBWC_SWIZZLE_ENABLE_LVL3,
>> +	.ubwc_bank_spread = true,
>> +	.highest_bank_bit = 16,
>> +	.macrotile_mode = true,
>> +};
>> +
>>   static const struct qcom_ubwc_cfg_data sa8775p_data = {
>>   	.ubwc_enc_version = UBWC_4_0,
>>   	.ubwc_dec_version = UBWC_4_0,
>> @@ -225,6 +235,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>>   	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
>>   	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
>>   	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
>> +	{ .compatible = "qcom,qcs8300", .data = &qcs8300_data, },
> 
> You can just pass &sc8280xp_data instead, they're equivalent
> 
> Konrad
Acked. Thanks.
