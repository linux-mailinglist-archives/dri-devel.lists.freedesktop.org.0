Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA79E6A62
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782410F063;
	Fri,  6 Dec 2024 09:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VMjsEkHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A4610F063
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:35:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B69SW7h016330;
 Fri, 6 Dec 2024 09:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +cfxuTELxF93ZfP87WkyvuPWPDNqQ/S9iCnzIgGGh58=; b=VMjsEkHvrvwVhdQH
 j8IGOvJ9mQZ3qNB+6ZC3aXxraLskSnt8h5qx/hvpfkGr2xVsuqbW26UAbDPBRtwj
 SmBseUumQ0/wsIbsow5rooZsY9tt1tfZl407BubZsz8ZCDC3g8zBiZaSgL3sIT+3
 7cQAZ28Xw5k9r3Zlf8wQWOuOCywXeRjx4WVobya+AeCeaopSgyZH6SXPfEzSZ+/b
 iTHUDXNlvyQ1CiioeJ+MrFWxUUESK0t5MgmZaYgRLWDUI1XrxaiYpAC9JXAxLvxh
 Q2mP/PQLPxKvy0aWPB5k4FM19kA+MkUIrhntQ4RA4/AJIMQWYy0bXjhm1K+aIixO
 1/u9vg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bxny80uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 09:35:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B69ZiPb025607
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 09:35:44 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 01:35:43 -0800
Message-ID: <411626da-7563-48fb-ac7c-94f06e73e4b8@quicinc.com>
Date: Fri, 6 Dec 2024 17:35:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/dp: Add DisplayPort controller for QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
 <20241127-qcs8300_dp-v1-4-0d30065c8c58@quicinc.com>
 <2ld2iwmvhz6myn6ume3lspi63wjefa3hpctoj2rdreaqhwdxmx@seic3sq2yo4h>
 <c7cf322c-2f52-4bb1-953b-1816fb9e57a2@quicinc.com>
 <vvfc43i222h74b2m4xmnxd25frk5nfy7pxpv7io46awnaugaw2@tdpuvg2m7vqc>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <vvfc43i222h74b2m4xmnxd25frk5nfy7pxpv7io46awnaugaw2@tdpuvg2m7vqc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: riTX1NaDntWzAtmC-YMFtb2Bb4XUD-98
X-Proofpoint-ORIG-GUID: riTX1NaDntWzAtmC-YMFtb2Bb4XUD-98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060068
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



On 2024/11/30 2:53, Dmitry Baryshkov wrote:
> On Fri, Nov 29, 2024 at 06:15:56PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2024/11/27 21:43, Dmitry Baryshkov wrote:
>>> On Wed, Nov 27, 2024 at 04:15:51PM +0800, Yongxing Mou wrote:
>>>> The Qualcomm QCS8300 platform comes with a DisplayPort controller
>>>> with same base offset with SA8775P, add support for this in the
>>>> DisplayPort driver.
>>>
>>> Can we reuse SA8775P config then? And SA8775p compatible as a fallback,
>>> not requiring any driver modifications.
>>>
>> for DP controller,in qcs8300, it only support controller_0,connection of
>> controller_1 are removed. but sa8775p have two dpu,each of them support two
>> controllers. So is it fine to reuse sa8775p?
> 
> Please take a look around in the file, you will notice the answer for
> this question. Then take another look around, find the data that you
> should have used instead, remove the useless mention of SA8775P and
> mention the correct platform instead.
> 
> Or, better, drop the patch completely and modify the schema in a correct
> way.
> 
> Please, always make a broader look around when writing the code, rather
> than implementing a feature in a most obvious (but not always optimal)
> way.
> 
Thanks for your reminder. I think i got the correct implementation 
method. I will drop this patch and reuse sm8650 dp data.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index aba925aab7ad7c6652e81004043864c1cb3ac370..f870faa89f26a8cb5bd7f4caf11f42e919c9efac 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -118,6 +118,11 @@ struct msm_dp_desc {
>>>>    	bool wide_bus_supported;
>>>>    };
>>>> +static const struct msm_dp_desc msm_dp_desc_qcs8300[] = {
>>>> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> 
> I don't know what has happened here. I doublechecked, original patch
> uses Tabs in the beginning of the lines, so it's okay.
> 
>>>> +	{}
>>>> +};
>>>> +
>>>>    static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>>>>    	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>>>>    	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>>>> @@ -170,6 +175,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
>>>>    };
>>>>    static const struct of_device_id msm_dp_dt_match[] = {
>>>> +	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_qcs8300 },
>>>>    	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
>>>>    	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
>>>>    	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 

