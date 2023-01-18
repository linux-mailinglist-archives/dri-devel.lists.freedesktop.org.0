Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB11F6710E6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CD510E646;
	Wed, 18 Jan 2023 02:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB1A10E646;
 Wed, 18 Jan 2023 02:11:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30I1Qako029396; Wed, 18 Jan 2023 02:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eAl8+im5tf2XKwNXbyrAgAQLLdiSTOXpMZ0T2zWAbxk=;
 b=pH7DnokWqa9yIrTvv16aMGkzChqV5K8vBAbfeL4X2XPvAq5QBCEYhZgQXZoRktjxAk4s
 SxiAQDDXowP6B4Wr7GVBHXZUV0dFWPh0ztrhAnzGxaG0iWnNt+Kt60H/5z9KLJNtWSqb
 A/5Yh+NOd1B9KTVs2+DdHQKqSi7NKJWPVHlE+QPrdFXrC8SYY50VhLAwviT54bBB1ouZ
 AE6vEdYFrH+QR00OB4aregaAw82MhZNJIr6jb1dECxa/lkUkDc/YutJ1TTEuo7QzJDi6
 EFySXxcDalrTy5MgeiMLo9ARgywzGmu9C/1re9iCYSBZr+MordQudtetP+XCkrcLl+i0 nQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n5rfw1vn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 02:11:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30I2BfXF014279
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 02:11:41 GMT
Received: from [10.110.108.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 17 Jan
 2023 18:11:40 -0800
Message-ID: <8d037d34-8dce-a0ee-2146-5f9cbf82cc5c@quicinc.com>
Date: Tue, 17 Jan 2023 18:11:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/msm/dpu: point sc8280xp_dpu_cfg to sc8280xp_regdma
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
 <785376c2-26de-10c4-c7a0-22ebb2c086fd@quicinc.com>
 <80a826c0-1d4d-fd0f-5ae6-06ceaaf4abd7@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <80a826c0-1d4d-fd0f-5ae6-06ceaaf4abd7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uRftsa5LEEwFE9U8IlwVUIJU7iZK4Ig2
X-Proofpoint-ORIG-GUID: uRftsa5LEEwFE9U8IlwVUIJU7iZK4Ig2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_11,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180015
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/17/2023 6:09 PM, Dmitry Baryshkov wrote:
> On 18/01/2023 04:08, Abhinav Kumar wrote:
>>
>>
>> On 1/17/2023 6:04 PM, Dmitry Baryshkov wrote:
>>> SC8280XP configuration missed the reg_dma configuration. We do not use
>>> regdma for now, but let's put the correct pointer anyway.
>>>
>>> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 4375e72a9aab..3d0fbc1746e2 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -2680,6 +2680,8 @@ static const struct dpu_mdss_cfg 
>>> sc8280xp_dpu_cfg = {
>>>       .intf = sc8280xp_intf,
>>>       .vbif_count = ARRAY_SIZE(sdm845_vbif),
>>>       .vbif = sdm845_vbif,
>>> +    .reg_dma_count = 1,
>>
>> Lets stick to the convention of the rest of the entries and use 
>> ARRAY_SIZE.
> 
> regdma is not an array, so all platforms use 1 here. We should probably 
> change this, as some of newer platforms seem to have two regdma blocks, 
> but I haven't taken a look into that.

Ah .... ack, then this is fine. We should probably change that though,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> 
>>
>>> +    .dma_cfg = &sc8280xp_regdma,
>>>       .perf = &sc8280xp_perf_data,
>>>       .mdss_irqs = IRQ_SC8280XP_MASK,
>>>   };
> 
