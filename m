Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E15A335E7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 04:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBA610E9CA;
	Thu, 13 Feb 2025 03:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UGeF5RPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A90610E9CA;
 Thu, 13 Feb 2025 03:04:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CILd5I008889;
 Thu, 13 Feb 2025 03:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8CapTW4zK04vBcb3GwBXZvC4KW59paVIIL6A9X+9/BY=; b=UGeF5RPnTXHg+O+C
 ZR26jzpIGrwNsd/LTOdk2yC3Qjaaj284PCnECF5fp9hvgo2x2u+TapecTYap673A
 bL/ygeIEBqwcPG3qYCFBrqkUOaAhBeJG8jXqFVZq7dhDW5A+FuxAgynZSa4WGAVI
 wbt8DJQJsy57UvfZ1Urp6amv4J8M2w6lgV7/6qwBaAnC6PutEvnc2Ot8ftTEFdjO
 3gO9l8q/pnEWtobH2VS4aepUt78T1hNm/vN1wZmxAYn4HiJS8mYkVfhzg1O3/a49
 2dN/pJ+/dDPw+Gk4v3Jp/mBjxr2WGC7uXEIlLYzwrqhk2t7HabMHtrvRYIWSpMU4
 KJz5LA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qtkxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2025 03:03:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D33wni031773
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2025 03:03:58 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 19:03:57 -0800
Message-ID: <4570ecc8-d991-4160-aba7-250f5580d58d@quicinc.com>
Date: Wed, 12 Feb 2025 19:03:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Disable wide bus support for SDM845
To: Marijn Suijten <marijn.suijten@somainline.org>, "James A. MacInnes"
 <james.a.macinnes@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chandan Uddaraju
 <chandanu@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Vara Reddy
 <quic_varar@quicinc.com>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Guenter Roeck" <groeck@chromium.org>,
 Rob Clark <robdclark@chromium.org>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-1-4954e51458f4@gmail.com>
 <voecekzdacvrxedltgkiq5vwnaomchv2dryi6ukvk2xynw72wp@5nre7uesyvkk>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <voecekzdacvrxedltgkiq5vwnaomchv2dryi6ukvk2xynw72wp@5nre7uesyvkk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mr0b57-DXCcKKlBb2_x5gp4txnWhpPdB
X-Proofpoint-ORIG-GUID: mr0b57-DXCcKKlBb2_x5gp4txnWhpPdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130021
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



On 2/12/2025 3:41 PM, Marijn Suijten wrote:
> On 2025-02-12 15:03:46, James A. MacInnes wrote:
>> SDM845 DPU hardware is rev 4.0.0 per hardware documents.
>> Original patch to enable wide_bus operation did not take into account
>> the SDM845 and it got carried over by accident.
>>
>> - Incorrect setting caused inoperable DisplayPort.
>> - Corrected by separating SDM845 into its own descriptor.
> 
> If anything I'd have appreciated to see our conversation in v1 pasted here
> verbatim which is of the right verbosity to explain this.  I can't do much with
> a list of two items.
> 
> I don't have a clearer way of explaining what all I find confusing about this
> description, so let me propose what I would have written if this was my patch
> instead:
> 
> 	When widebus was enabled for DisplayPort in commit c7c412202623 ("drm/msm/dp:
> 	enable widebus on all relevant chipsets") it was clarified that it is only
> 	supported on DPU 5.0.0 onwards which includes SC7180 on DPU revision 6.2.
> 	However, this patch missed that the description structure for SC7180 is also
> 	reused for SDM845 (because of identical io_start address) which is only DPU
> 	4.0.0, leading to a wrongly enbled widebus feature and corruption on that
> 	platform.
> 
> 	Create a separate msm_dp_desc_sdm845 structure for this SoC compatible,
> 	with the wide_bus_supported flag turned off.
> 
> 	Note that no other DisplayPort compatibles currently exist for SoCs older
> 	than DPU 4.0.0 besides SDM845.
> 

Yes, this is good description. Thanks Marijn!

> Hope I'm not considered being too picky.  I first sketch **how** the original
> patch created a problem, then explain how this patch is intending to fix it,
> and finally describe that we went a step further and ensured no other SoCs
> are suffering from a similar problem.
> 
> - Marijn
> 

Its indeed a bug introduced due to msm_dp_desc_sc7180 re-use. There is 
no widebus on this chipset.


With the commit text fixed like above,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant chipsets")
>> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index aff51bb973eb..e30cccd63910 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -126,6 +126,11 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>>   	{}
>>   };
>>   
>> +static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
>> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
>> +	{}
>> +};
>> +
>>   static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
>>   	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>>   	{}
>> @@ -178,7 +183,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>>   	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
>>   	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
>>   	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
>> -	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
>> +	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
>>   	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
>>   	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
>>   	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
>>
>> -- 
>> 2.43.0
>>

