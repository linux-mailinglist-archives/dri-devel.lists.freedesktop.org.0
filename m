Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EFF88CD41
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 20:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7888910F21E;
	Tue, 26 Mar 2024 19:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nr4Gyn5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4EA10F21E;
 Tue, 26 Mar 2024 19:32:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42QIgwco027984; Tue, 26 Mar 2024 19:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Gvl/cErnJ0hcWPz7bh+uiNg8+CKOhxG44k87KtPunH0=; b=nr
 4Gyn5aS6vsLZdpONgV1Q/2VMOeDPW3noCeZFXJTXePf26K3wuMD9T0Sq2W2UjWlC
 A0bqoPQaTVEXkJtHIY+oSztw7S3NSa2cUuTd+dAKJyYHqv3X2ykZpdzBNdzJwJR4
 zwhtPGHsk4Addr5ru8FLzCFO3Ae/vwdwROEC/Ytt4vAbEbrYOcF59852ZVQnqCaM
 5L058iuYn271RkYmngoscPjcpOjW4ZpOELZPTu3GwZfoXT24R5fmNaiZluSfoU2O
 gs2P1V5IJl34PSb0BJHviA99pXAHSKMTENS8X5ElED81iv+EbDfB7XvrhkjK3nAQ
 m6GTJwbqcwywRA3KtZow==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x3q0n2jaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 19:32:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QJWiRU015728
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 19:32:44 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 12:32:41 -0700
Message-ID: <671d2662-df4e-4350-0084-476eb1671cc1@quicinc.com>
Date: Tue, 26 Mar 2024 12:32:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
 <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
 <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
 <CAA8EJppqrF10J1qExM=gopiF4GPDt7v4TB6LrQxx5OGyAL9hSg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppqrF10J1qExM=gopiF4GPDt7v4TB6LrQxx5OGyAL9hSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 45Zt0ye1_N9N-CvHZY087ABXmToD95_R
X-Proofpoint-ORIG-GUID: 45Zt0ye1_N9N-CvHZY087ABXmToD95_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2403260140
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



On 3/26/2024 12:10 PM, Dmitry Baryshkov wrote:
> On Tue, 26 Mar 2024 at 20:31, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/26/2024 11:19 AM, Dmitry Baryshkov wrote:
>>> On Tue, 26 Mar 2024 at 20:05, Miguel Ojeda
>>> <miguel.ojeda.sandonis@gmail.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> In today's next, I got:
>>>>
>>>>       drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
>>>> 'out' set but not used [-Werror,-Wunused-but-set-variable]
>>>>
>>>> `out` seems to be there since commit 64d6255650d4 ("drm/msm: More
>>>> fully implement devcoredump for a7xx").
>>>>
>>>> Untested diff below assuming `dumper->iova` is constant -- if you want
>>>> a formal patch, please let me know.
>>>
>>> Please send a proper patch that we can pick up.
>>>
>>
>> This should be fixed with https://patchwork.freedesktop.org/patch/581853/.
> 
> Is that a correct fix? If you check other usage locations for
> CRASHDUMP_READ, you'll see that `out` is the last parameter and it is
> being incremented.
> 

Right but in this function out is not the last parameter of CRASHDUMP_READ.

Maybe you or Rob can correct me but I thought the fix looked sane 
although noone commented on that patch.

>>
>> We can pickup that one with a Fixes tag applied.
>>
>>>>
>>>> Cheers,
>>>> Miguel
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>>>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>>>> index 1f5245fc2cdc..a847a0f7a73c 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>>>> @@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
>>>>                (block->type << 8) | i);
>>>>
>>>>            in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
>>>> -            block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
>>>> +            block->size, out);
>>>>
>>>>            out += block->size * sizeof(u32);
>>>>        }
>>>
>>>
>>>
> 
> 
> 
