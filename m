Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813DB88CC09
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 19:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173DA10F121;
	Tue, 26 Mar 2024 18:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MaHdzFbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222F610F1D6;
 Tue, 26 Mar 2024 18:31:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42QIOYRB029149; Tue, 26 Mar 2024 18:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=GiHiaL1bOe/EXbSYTdniLPpYaBRiQap8rwEvH/06QSs=; b=Ma
 HdzFbTlivB4jJEP8Yaxuhh63DFVObMMzYKWyOOUkUI6zyYt9U1TEnSnEaFNC6/K7
 kroit2tPzZz5b6ZERQ4HiD+UZhw+3cfvSsqo7rLKfspAGt0E4LUDTucpziQMX+A8
 FqfQzNNmohRLZW4zJ6sLnS4TgsXpVgeolNmSxRWhswUKVfnoL0o/CubiMUsuMWfS
 eE+w2swZRDxSvg8qrexnkrLONY0iJUKudknNSVkchXjJlI6kX9XhlzxG/5wg30gw
 de/wFB7rMDy8+H8/sPTAiEmQXFq16EPBwriWGTBlIrm5RUntPNZ+RKGkE+PAVrJS
 gE9wkpeDjzXP0JgxuLcQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x41k68d5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 18:31:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QIVgov023006
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 18:31:42 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 11:31:40 -0700
Message-ID: <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
Date: Tue, 26 Mar 2024 11:31:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
 <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8ye9dJjpHj1CMyW79gz2c4cjYopMDVqy
X-Proofpoint-GUID: 8ye9dJjpHj1CMyW79gz2c4cjYopMDVqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 priorityscore=1501
 malwarescore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260133
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



On 3/26/2024 11:19 AM, Dmitry Baryshkov wrote:
> On Tue, 26 Mar 2024 at 20:05, Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> Hi,
>>
>> In today's next, I got:
>>
>>      drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
>> 'out' set but not used [-Werror,-Wunused-but-set-variable]
>>
>> `out` seems to be there since commit 64d6255650d4 ("drm/msm: More
>> fully implement devcoredump for a7xx").
>>
>> Untested diff below assuming `dumper->iova` is constant -- if you want
>> a formal patch, please let me know.
> 
> Please send a proper patch that we can pick up.
> 

This should be fixed with https://patchwork.freedesktop.org/patch/581853/.

We can pickup that one with a Fixes tag applied.

>>
>> Cheers,
>> Miguel
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> index 1f5245fc2cdc..a847a0f7a73c 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> @@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
>>               (block->type << 8) | i);
>>
>>           in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
>> -            block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
>> +            block->size, out);
>>
>>           out += block->size * sizeof(u32);
>>       }
> 
> 
> 
