Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4919DC202
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 11:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7548D10E33C;
	Fri, 29 Nov 2024 10:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Qq8Jaz92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CE210E33C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 10:16:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT7o916021800
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 10:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YUVpFSOI47hpJImoAQorLG0E4TKpniHAtKdlxMAfG1I=; b=Qq8Jaz92xQxVUxI9
 uda4PDgN0U/Z2o6zWkwguK6TGXoU6c92/V88mnjOYoYLqPmEwTkifniA0WdG/k/i
 dMZPCVgwmxGO80+PdHZ3x8nZRieq8ldcs+LejjvFmzLSvFcjQ2DcJeIdBq3E1AoD
 JZbKgccX8f1UfYkGw7T1Lj8hI8N/WqjSDDCyYROX3l4OuSQsgQpDCPRIyH/GblZ5
 0ihcG72NGxGw3gQNQRPdKqqzCki22rDbDUVO1hqMzQB6xcWHsroWiHZsydt7xXMd
 fyBxPfoAqddcbiWW5RQokRZIoQ45EL+Csg+AhD2bt6Yh88yCFpsrMJ8N2Ha6ObzP
 G4FbSA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4379jm0crb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 10:16:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ATAFxkM010362
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 10:16:00 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 02:15:58 -0800
Message-ID: <c7cf322c-2f52-4bb1-953b-1816fb9e57a2@quicinc.com>
Date: Fri, 29 Nov 2024 18:15:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/dp: Add DisplayPort controller for QCS8300
To: <dri-devel@lists.freedesktop.org>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
 <20241127-qcs8300_dp-v1-4-0d30065c8c58@quicinc.com>
 <2ld2iwmvhz6myn6ume3lspi63wjefa3hpctoj2rdreaqhwdxmx@seic3sq2yo4h>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <2ld2iwmvhz6myn6ume3lspi63wjefa3hpctoj2rdreaqhwdxmx@seic3sq2yo4h>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DtaYDzLHmFALTdYueeilvMov8C3P2nV-
X-Proofpoint-ORIG-GUID: DtaYDzLHmFALTdYueeilvMov8C3P2nV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290083
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



On 2024/11/27 21:43, Dmitry Baryshkov wrote:
> On Wed, Nov 27, 2024 at 04:15:51PM +0800, Yongxing Mou wrote:
>> The Qualcomm QCS8300 platform comes with a DisplayPort controller
>> with same base offset with SA8775P, add support for this in the
>> DisplayPort driver.
> 
> Can we reuse SA8775P config then? And SA8775p compatible as a fallback,
> not requiring any driver modifications.
> 
for DP controller,in qcs8300, it only support controller_0,connection of 
controller_1 are removed. but sa8775p have two dpu,each of them support 
two controllers. So is it fine to reuse sa8775p?
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index aba925aab7ad7c6652e81004043864c1cb3ac370..f870faa89f26a8cb5bd7f4caf11f42e919c9efac 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -118,6 +118,11 @@ struct msm_dp_desc {
>>   	bool wide_bus_supported;
>>   };
>>   
>> +static const struct msm_dp_desc msm_dp_desc_qcs8300[] = {
>> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>> +	{}
>> +};
>> +
>>   static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>>   	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>>   	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>> @@ -170,6 +175,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
>>   };
>>   
>>   static const struct of_device_id msm_dp_dt_match[] = {
>> +	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_qcs8300 },
>>   	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
>>   	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
>>   	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
>>
>> -- 
>> 2.34.1
>>
> 

