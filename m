Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3EDAB8E56
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0329A10E938;
	Thu, 15 May 2025 17:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXMWZGNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD5810E936
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 17:58:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFA42016637
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 17:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3vCMFGmwTleTheZqkW0G39yLmvjFdm3qxDc0K4mQmoM=; b=CXMWZGNPcwHSMZ9k
 ir4W8Ug9lzwxl9RFKmxDGQazm8ncyDNmQjalDV1gKzBY6YvWD3d5Zxs01JlBicLa
 e2S3oAI3fRZ2+eja+IBJICv5Dxt/AK+mfFGYGWiI1HsPUwQdNHy8xZuSsi/5GpS3
 FkoDD6DWna+tFXVHpvfvPrKw6y/wWM/4MPuc6E0wxUruBz9okLGZLh2RRF1goJ4K
 j8Od1KqlgdmSpWMs2HohNLzhcGTVF0wuTAZ5Ef8eyo4u0EFFkyardJDPX0smRiMd
 hCjJoOcL05fwUxDEqvTq29UjfVQHRgPl1UPB3al9BDCx7lKgIrL7uejs2dEQyurW
 gbrMCQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmqa8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 17:58:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f544cf3f6dso27246376d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 10:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747331907; x=1747936707;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3vCMFGmwTleTheZqkW0G39yLmvjFdm3qxDc0K4mQmoM=;
 b=B8Zdal/RKo4o5N4a6iQxXUbKEmKJDfYDttjpe0QviJhlMcWSJ87rAlt/tyj59gdce6
 aYSQ1xx9EciStFlPRy+kmczO3qQrKExIqmaLubRrF3yMaFTdQXev/yv3lQiv/gtRy7qD
 j9stFDOEXYpAV5AlKEYggXHNTG51aufgEn5SjHmwFIjmxKvTfL0RHg0cYu6dKR3W7Yep
 SLURgwkNPChZ3hlQH5PvnqsBIFzZadhjzhAPqgyjIotpQ6kOQ2MLzBjx/vzFXBRusg2n
 QBZmDm+bdY8L5t4JPJVOA5yJKH8CPXjGEyH/BHmsgxARfaBLLUavCbqSdZxeHQqgFR62
 G6qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEG/3OX5PAFHRVCTvrOg3AzeAI/dHCV/UcTe8Cb3MkeR0WCTOY+CN/H9pR6hnSawsmwOdHINs9cB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUMrLkGIIPxv5BcLEvjE+iy6HFjW/v6PDKkBJA25qz7eXvP32V
 X3WDbd5GNhpZNatZVSgN/R8d1taAOP7zw5J7UVGAkdNAb/JgwMvMrdw1V7m6mRpuxkoOtCFMCWY
 0gp1h28mIbf45vvx7zFzszXZPKmKZ2Ob+ihIOKDPN/6xDNFmc65nwmnaQG4N2jh2isw0HJYi0nn
 SU0Vo=
X-Gm-Gg: ASbGncvL7dZ8DcqsVEANbVv3t3QDpROkJX8lrXcPbQBH2J+FD9SvBCkqumz7k0R7PVs
 oguVJKaEQ0M4k04vDOYHhaXyqX3znlWmUFedQhs6eJdQOpjDdzGn97+c8P+3+JRilqI9jU5enni
 agUTKRec0AGyDGW9OcxnYK6Sm+knea6I8Ek02p8qIQwpCvW+dvhat4t9v0YSPiLqlKjze0lxv/u
 vAIgUC/3NdKU5tK6ghVjvtNyH2hgrClI5zWmdNl17xGB6upFcJFCXKFLgY5Y8xK37L6Ttmg3gqy
 eKrldLkG5MfwCTJsQBBamaVnyGLEaJhPm7c+bhwEGJhm82rSVBxYM66bb3t8KeKpkpgiUCD3vG3
 JD8jFCX6WbzHyRQ==
X-Received: by 2002:a05:6214:f23:b0:6f8:aa6f:438b with SMTP id
 6a1803df08f44-6f8b08352f5mr12431896d6.3.1747331907585; 
 Thu, 15 May 2025 10:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3V9qZSnGxsnRyLDYMo3pHnOqJ9QpCV03/pBIinMn3/xs6ruVL1Dp6RhU3IOueCwwwetRN/Q==
X-Received: by 2002:a05:6214:f23:b0:6f8:aa6f:438b with SMTP id
 6a1803df08f44-6f8b08352f5mr12431416d6.3.1747331906935; 
 Thu, 15 May 2025 10:58:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7018073sm44037e87.129.2025.05.15.10.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 10:58:26 -0700 (PDT)
Message-ID: <73b8087a-6bf2-4f59-a9df-2a439a04fe1c@oss.qualcomm.com>
Date: Thu, 15 May 2025 20:58:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
 <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
 <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
 <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
 <d0a036e7-605b-4475-8ddc-69482e16f0b3@oss.qualcomm.com>
 <CAO9ioeWHMUf66Vb0XPw9eHRoAXzroSSqQRzW1o+e509-BK+Y7Q@mail.gmail.com>
 <6d7b30b1-60ac-45bf-9ff8-72461f1b21c3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <6d7b30b1-60ac-45bf-9ff8-72461f1b21c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3NyBTYWx0ZWRfX0ACYGe/TeU57
 cCBdlHkMCCEDL/Aru938W4GnBBqF6cDUWqBZV0SKDHFyFcpz4aupxWTI7Ws0z5hAtOjoz4xg60G
 ndWpEP0erAtsDYwfkwOn2buLdgv+WxhPK8HfV6yjeKIV9pOPYJN3jocUSc8E0TpmPcPvGDvB2UX
 /19xap00Tc/GfYqTFEObjiTWaNmHecwVHZTg1icwaLaX83QziLuCF7X2GRJScixgKvjjVL2reEx
 oVwrD9oCl6V9tfblXzntzj0y/Ff0GUCQYvRds55YlPUKIAsJL35m4gT75EGr8OncfzmgszPnXlb
 c5NK7U75qqyFi31LqjS+Z9vJpeYcBpslj1xhbuZxMdzK3i3bShJEZ/dgxgsvpDX6A03DqS4G/Jc
 k54wx5eNpTQLB1B8TBDv5MKCtWgOUZ6NU+uX6iZzxuun6qG1ffSBxer8IbWA0oRwphQJrir3
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68262b45 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=PtrESY3dGf2tItbbhh4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ERxgWNsDwj1aTY_J-am10uirSuIjMUTm
X-Proofpoint-ORIG-GUID: ERxgWNsDwj1aTY_J-am10uirSuIjMUTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150177
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

On 15/05/2025 20:56, Konrad Dybcio wrote:
> On 5/15/25 7:15 PM, Dmitry Baryshkov wrote:
>> On Thu, 15 May 2025 at 19:36, Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 5/15/25 6:21 PM, Dmitry Baryshkov wrote:
>>>> On 15/05/2025 19:18, Konrad Dybcio wrote:
>>>>> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
>>>>>> On 14/05/2025 23:05, Konrad Dybcio wrote:
>>>>>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>>>>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>>>>>>> 1.0 encoder).
>>>>>>>>>
>>>>>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>>>>>>> bits, as they weren't consumed on this platform).
>>>>>>>>>
>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>>>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>>>>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>>>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>>>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>>>>>>     static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>>>>>>         .ubwc_enc_version = UBWC_1_0,
>>>>>>>>>         .ubwc_dec_version = UBWC_3_0,
>>>>>>>>> -    .ubwc_swizzle = 1,
>>>>>>>>> +    .ubwc_swizzle = 7,
>>>>>>>>>         .highest_bank_bit = 14,
>>>>>>>>>     };
>>>>>>>>
>>>>>>>> Add a comment and squash into the patch 1.
>>>>>>>
>>>>>>> I don't think that's a good idea, plus this series should be merged
>>>>>>> together anyway
>>>>>>
>>>>>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
>>>>>>
>>>>>> - MDSS: offset HBB by 13 (patch 2)
>>>>>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
>>>>>> - get a handle (patch 4)
>>>>>> - resolve / simplify (patches 5-10, not squashed)
>>>>>> - fix sm6125 (patch 13)
>>>>>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
>>>>>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
>>>>>
>>>>> Does this bring any functional benefit? This series is unfun to remix
>>>>
>>>> I know the pain.
>>>>
>>>> The functional benefit is to have the WARN_ON and side-by-side comparison of common_ubwc_config vs computed ubwc_config for HBB and swizzle.
>>>
>>> HBB I agree, since we'll be outsourcing it to yet another driver, swizzle
>>> should be good enough (tm) - I scanned through the values in the driver
>>> and couldn't find anything wrong just by eye
>>
>> Well. What is the ubwc_swizzle value used for SDM845? I think it
>> should be 6 according to a6xx_gpu.c and 0 according to msm_mdss.c.
>> Yes, higher bits are most likely ignored. Still, we'd better have one
>> correct value.
> 
> Ehh, so laziness bites after all..
> 
> Unfortunately it seems like I don't have a good answer for you
> - although I can infer a technically valid config for these
> at the very least:
> 
> msm8937
> msm8998
> sc8180x
> sdm670
> sdm845
> sm6150
> sm7150
> sm8150

WARN_ON would be a good thing in the end

> 
> with the ubwc1.0 platforms receiving all 3 levels and ubwc 2.0/
> 3.0 enabling 2/3
> 
> this however I'm not sure matches what downstream does..

Well, let's match previous GPU config, so 6 whenever we don't define 
anything special.

> 
> Konrad


-- 
With best wishes
Dmitry
