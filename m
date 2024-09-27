Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFFA987E98
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 08:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09E510EC24;
	Fri, 27 Sep 2024 06:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CXmCGkvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244C810E1D6;
 Fri, 27 Sep 2024 06:44:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6d6Fx001947;
 Fri, 27 Sep 2024 06:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ON3zv317POrum9p0WhSwvi3GjOkzBVaoI7HUYQhGUbM=; b=CXmCGkvJSJ2TWpC6
 qrFHGrqXcGO7oOVQe9HgBAMudU5CJBUxud5TAyU7oOZpEcFzFhvoPyudjR4QNTAx
 u3jlzig60FHhDbAIlNmfQE1Iz/68u9XmU40sHsj0rPqUodjkGnZtylj0dz6Rd2w8
 AyZCYcQYd7P+1L6m4+5lyXK96X75Ren/2sDBpNUvrB680Rvm3p064kc9QezeqOqh
 KegoROlbPXvTyBWuoXVNVsrWEXsy1emAYAQO96f7n20qzoGIuFYriCmAEg0FGoZy
 j27OemQYGzA6yQkSds9jOh2NrXEj90s/cFGffd0EK8wGn+drZuXzWqKAa/84msm/
 UUYy9A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnjg94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 06:44:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48R6iRVA014330
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 06:44:27 GMT
Received: from [10.204.67.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Sep
 2024 23:44:19 -0700
Message-ID: <2414cba4-53f2-4aec-b87b-9f8d92035bad@quicinc.com>
Date: Fri, 27 Sep 2024 12:14:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/msm: mdss: Add SA8775P support
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
 <20240926110137.2200158-4-quic_mahap@quicinc.com>
 <35e6yleiy6wkja3ojlfjddifxv7kr7x6tyn5pszas2chouuvql@trpeb7b4eop2>
Content-Language: en-US
From: Mahadevan P <quic_mahap@quicinc.com>
In-Reply-To: <35e6yleiy6wkja3ojlfjddifxv7kr7x6tyn5pszas2chouuvql@trpeb7b4eop2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 24P3xGPppakOwre31esyCz8hqkm2HohV
X-Proofpoint-GUID: 24P3xGPppakOwre31esyCz8hqkm2HohV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270044
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


On 9/26/2024 6:32 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 26, 2024 at 04:31:35PM GMT, Mahadevan wrote:
>> Add Mobile Display Subsystem (MDSS) support for the SA8775P platform.
>>
>> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
>> ---
>>
>> [v2]
>> - Update commit message. [Dmitry]
>> - Reorder compatible string of MDSS based on alphabetical order. [Dmitry]
>> - add reg_bus_bw in msm_mdss_data. [Dmitry]
>>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index faa88fd6eb4d..8f1d42a43bd0 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -573,6 +573,16 @@ static const struct msm_mdss_data qcm2290_data = {
>>   	.reg_bus_bw = 76800,
>>   };
>>   
>> +static const struct msm_mdss_data sa8775p_data = {
>> +	.ubwc_enc_version = UBWC_4_0,
>> +	.ubwc_dec_version = UBWC_4_0,
> Just 4.0 or 4.3?


UBWC version has to be 4.0 as per UBWC reference document of sa8775p.


>
>> +	.ubwc_swizzle = 4,
>> +	.ubwc_static = 1,
>> +	.highest_bank_bit = 0,
>> +	.macrotile_mode = 1,
>> +	.reg_bus_bw = 74000,
>> +};
>> +
>>   static const struct msm_mdss_data sc7180_data = {
>>   	.ubwc_enc_version = UBWC_2_0,
>>   	.ubwc_dec_version = UBWC_2_0,
>> @@ -710,6 +720,7 @@ static const struct of_device_id mdss_dt_match[] = {
>>   	{ .compatible = "qcom,mdss" },
>>   	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>>   	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
>> +	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>>   	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>>   	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>>   	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
>> -- 
>> 2.34.1
>>
