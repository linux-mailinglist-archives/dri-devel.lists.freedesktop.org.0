Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB91684ECE8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 00:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C08010EFB4;
	Thu,  8 Feb 2024 23:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OtmZHtxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789F510EFB4;
 Thu,  8 Feb 2024 23:19:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 418LixnQ012448; Thu, 8 Feb 2024 23:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=p3XhTwLMsB7rV3y5I5+RwHhoJ/CpmAJmMb9DPE8rZxY=; b=Ot
 mZHtxHd8U7gJn+ezvLmsjQ06zXQD/ba2hZxmavB3ZihtWMkj2EG8HZUwpTt3qCIf
 soCM0MT/hvvV42E/CQ92XPGGI5QiOSwilIoH9HlsPXPMY5nap/rEN+itjcagSZUr
 mi3vMJ22rBYoEd6DT3fqtyqkMe0zR50r5FhiRU/ake9yxLVVr0dwBKUayTsjgCNu
 xjbbIMeaSKOw8yUkcy7fGrZu1in8ngGjwAq1BF650WCIWRpEi1RXWPok792Bcw28
 muyyQG/GgNXOClrJusMKh6Sa1XPiiWOpaKqtvmhyk5VH5f8XiwsTNameBgALyOUQ
 DCvUVgC9S6A1mVPs0dZg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4frwukad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Feb 2024 23:19:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 418NJmYK019238
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Feb 2024 23:19:48 GMT
Received: from [10.71.111.96] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 8 Feb
 2024 15:19:47 -0800
Message-ID: <c75a2779-409c-4cef-cbea-3481eaad4bdd@quicinc.com>
Date: Thu, 8 Feb 2024 15:19:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 15/17] drm/msm/dpu: allow certain formats for CDM for DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
 <quic_khsieh@quicinc.com>, <marijn.suijten@somainline.org>,
 <neil.armstrong@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-16-quic_parellan@quicinc.com>
 <e587b3e3-aa0a-44d6-a860-253d337397e3@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <e587b3e3-aa0a-44d6-a860-253d337397e3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: RK8ttAX6g7tYE9jHdKZcnc1zMLaeA3s0
X-Proofpoint-GUID: RK8ttAX6g7tYE9jHdKZcnc1zMLaeA3s0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_11,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=711 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402080132
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


On 1/25/2024 1:58 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> CDM block supports formats other than H1V2 for DP. Since we are now
>> adding support for CDM over DP, relax the checks to allow all other
>> formats for DP other than H1V2.
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>> index e9cdc7934a499..9016b3ade6bc3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>> @@ -186,7 +186,7 @@ static int dpu_hw_cdm_enable(struct dpu_hw_cdm 
>> *ctx, struct dpu_hw_cdm_cfg *cdm)
>>       dpu_hw_cdm_setup_cdwn(ctx, cdm);
>>         if (cdm->output_type == CDM_CDWN_OUTPUT_HDMI) {
>> -        if (fmt->chroma_sample != DPU_CHROMA_H1V2)
>> +        if (fmt->chroma_sample == DPU_CHROMA_H1V2)
>>               return -EINVAL; /*unsupported format */
>
> This means that the original check was incorrect. Please add 
> corresponding Fixes tag and move to the top of the patchset.


Ack.


>
>>           opmode = CDM_HDMI_PACK_OP_MODE_EN;
>>           opmode |= (fmt->chroma_sample << 1);
>
