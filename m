Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2776710EA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58D710E648;
	Wed, 18 Jan 2023 02:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC00010E648;
 Wed, 18 Jan 2023 02:13:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30I1UltE031643; Wed, 18 Jan 2023 02:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=do4kSKIj/GuYhaEYLKUfNifXKIHfKTn/r7ISkCrJm64=;
 b=CSU40vK244vA9v5Q9wNl2SEFNhR0hCDWy5Gkvo+mktwp0p8cqIiFORfbsKM9FfiTseh1
 l59UpxkX2W9qmN6757bkvboED3VojlG3+9OwK7JVgOEXDMMzaHEc7OItPr8ESzJi4Ube
 qeBf71lzs/1dIt2CC1mgiyhcCUGKIifhjS4Ukq6aVgozBLZygR3AeGCv/0cyjEzfa90d
 wmYEMKujusfVq3UmeMTjTOfPkER6d9bwmut61rIbWr8upPmCZsByrT7lf67ebzLIHoRo
 g+xQIdZOuzMjp47Rw2ORvf9pbkXChJqTM/BLRWo+4MU6heBe0Xw4zF1DEPeUjRfIDRx4 xw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n5b18b00y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 02:13:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30I2DKRi015889
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 02:13:20 GMT
Received: from [10.110.108.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 17 Jan
 2023 18:13:20 -0800
Message-ID: <9b9dd30b-6bb7-ccb1-705d-e29df755f542@quicinc.com>
Date: Tue, 17 Jan 2023 18:13:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] drm/msm/dpu: use sm8350_regdma on SM8350 platform
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
 <20230118020455.1689929-2-dmitry.baryshkov@linaro.org>
 <33f6f492-4660-6142-8663-b9669e8d9969@quicinc.com>
In-Reply-To: <33f6f492-4660-6142-8663-b9669e8d9969@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VANXdKZIsFD9XM2A0PiwvjmstX-x65ZT
X-Proofpoint-ORIG-GUID: VANXdKZIsFD9XM2A0PiwvjmstX-x65ZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_11,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301180015
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/17/2023 6:09 PM, Abhinav Kumar wrote:
> 
> 
> On 1/17/2023 6:04 PM, Dmitry Baryshkov wrote:
>> Correct sm8350_dpu_cfg.dma_cfg to point to sm8350_regdma rather than
>> sm8250_regdma.
>>
>> Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 3d0fbc1746e2..e6618e678384 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -2737,7 +2737,7 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
>>       .vbif_count = ARRAY_SIZE(sdm845_vbif),
>>       .vbif = sdm845_vbif,
>>       .reg_dma_count = 1,
> 
> Since you are adding the .dma_cfg, lets stick to the convention of the 
> rest of the entries and use ARRAY_SIZE.

Since reg_dma is not an array yet,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>> -    .dma_cfg = &sm8250_regdma,
>> +    .dma_cfg = &sm8350_regdma,
>>       .perf = &sm8350_perf_data,
>>       .mdss_irqs = IRQ_SM8350_MASK,
>>   };
