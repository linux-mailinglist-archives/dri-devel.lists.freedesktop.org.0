Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C480FB1089D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 13:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF1F10E1F6;
	Thu, 24 Jul 2025 11:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5co5boj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DA610E1F6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:09:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9o4r6029504
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 omoQ5joPArCteDC0YHg4O+qjve6IQsjjq+F76qZeAQA=; b=c5co5bojJjlNRKbP
 bMLUJtjLT0X1E/YOmJTps3XhNkUhDcAEqcWz1XcsAIhoWqg9m77xUCToYT3egYnt
 z8p6gpB37g+Isjuevyjg40D3W3+R+Ijhn8fzDR74NeDpG/MW8ZNnqwAwT28a/R/h
 3IJOD+OZJFjj6pBtHazcT8Mz7wfp+GsOZl22QEvYHNVHsxm2jeRCA5+QdjHRMrSU
 63M98ulaw+XRt8/xiP/kivVFlAHk5qGXAR2c8Dz7bhs2+Dex07cNbTSv/YdbyABS
 0vgcQ15Cdm9w43/ZiBuqNbbeFSPEe7WTNXCDHmlvsnttCQwhoTlrlP6Fz2aSMF1g
 2gHhuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1fsu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:09:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e095227f5dso149233385a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 04:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753355353; x=1753960153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=omoQ5joPArCteDC0YHg4O+qjve6IQsjjq+F76qZeAQA=;
 b=kfHPLjQRkLk/r07s8FyMY9rtUS6OUqWA5N4FYWXExVjOmN7TZ7XIXc3xWzK47FL0fD
 bKIvFEK8VzDPiB4MTov1nDXCZ9yWHvb8e24RhIeXXbV9W2u4kumGVSLwhsDmLFp0SpJs
 0ZfEf/iZ4FHEyueJowQvpAHzjNenVKAIO5brML9iys3qzRrn1FBH+qmz9tgCLGZnFU7S
 NUtJyukSeTD9yOd9CoyfQwRNFfLOZZR+00/lfFIkbq/fKyPw2XR87qZSDtMbu0pHDXPt
 I0YgRZxWLQIXdn70ChZUZrbQUrD5VHbcHoCCHSKoDLkXcFYgah60/6vFMelNauNjZ8wx
 Dakg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPQVllTclAsgkk8O58/svgOC0qjQknRLBwTJPL3RXpjnLheVgrbHcqnl4vtH2YiNz/PbAdw7AHXMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhcrv6fGLb1GcyCr3HdPlUvPkg4NmTzVBAh9Wfn8boipSzl9d1
 R+ZmWri3kwXhofKpg34PjYTCPJdmYAe+G2nfQWKotWxx6h+G55WTlk0fVLn9/x+Gd4Hwtu42IBc
 kgo7R33ibfUAzS5rAxVsjnNZ5kCyvlgauZft5q9U4C4BbXUAq0ftT2iyREEJbZ9CgCUhFpLg=
X-Gm-Gg: ASbGnctqjHWfxKuuyKZ8YuqmAwN6fXqjIyrmZpcbw0WQiyFYWF4OnHFj0YbE530pe1N
 hlTyQ3iLsN9KkM5f7s+RgiBz0GCoMBqZLXxNjJgQP3Ea6n30iN4gm+dTMgrg44Cu1XgVZg1aRcH
 uzACL3FpfaRNhsNia7HcygtNWB72vkO40N8Oqe08pYEA1TlbCiyVb76nGSE9r09eq3HKEnDmNBz
 4RaHKR1GayH9eA1JSObMQB/a8W8qtkNDt0TJHsML8knSJ+7zeV/oRHw6SfddsLsIfuolSSGVZj5
 Z8YZ/5CmUUdXmJPbNjhMlNVwMVdpZnLIGHahU1h7xxhhyzRFVA58lbuO8xbiT7iLczmmt7HeRXm
 tQ7PXFMiyVbvAnM4jR0B/l4dx4jEnfIaMHjYbSOVUCItP9Z32GsMsG65ohAwWaqKrdXZ9zoRxFJ
 QY9NpCSC1I1lsbwxT+X5yWgMw=
X-Received: by 2002:a05:6214:300c:b0:6fd:26bd:3fe9 with SMTP id
 6a1803df08f44-7070075b46fmr88683636d6.36.1753355352906; 
 Thu, 24 Jul 2025 04:09:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc/fYZ423PcC/MADtOutu923q+hqx/kNGi5uwxh6IK8njxLje60SRvGbbX151gfy/K27n6jw==
X-Received: by 2002:a05:6214:300c:b0:6fd:26bd:3fe9 with SMTP id
 6a1803df08f44-7070075b46fmr88681936d6.36.1753355351070; 
 Thu, 24 Jul 2025 04:09:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00:6f:d7d0:17d0:bfc8?
 (2001-14ba-a0c3-3a00-6f-d7d0-17d0-bfc8.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:6f:d7d0:17d0:bfc8])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331e08e81ebsm2577601fa.50.2025.07.24.04.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 04:09:10 -0700 (PDT)
Message-ID: <5d86adfd-e16d-4072-b5a8-4f128a2c9adb@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:09:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
 <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
 <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
 <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kYJNhZClWYIX__vNWKw60H36uKPJLsy8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4MyBTYWx0ZWRfX7KnIJpc+npxh
 KbBqeEHOEw1MrdGsBjo/DCZinudlYebbOAUj54FZuCRWpR/Qd+kvtrKTRwS823iGh/bEdFGyKhp
 /5DPHh3KZh298sV5KGwzg14hgcmp84HdRzWuztVzCLXWKE6fmnYyzBxRHp5xVJuSqg2QPA7hA8u
 QpOmrbqKrtq/N/iZgqPYa4wqWgMW9HUI/hsOPODakTFtKf0bBejzS4PEm/uTXh4KU6fTux28GpB
 LJPDEnFpm5I1xRkGOlirR8me6pCQN6i04YYqgV1hGyPF4g2bGoRCsR0u+FL1BkUyFe4m2RwhhMr
 VWhdgEDuf3Nsgrnguo9n64127DgpnPeLYePRFUeRrhYR6GztZ50snrQiAVTU1SfdCDnpZabdxET
 cN5Q6ufpuz1AbywXFP25Vi47a9SexReJP4SNYs7KvMnRwAEngVkgHBFDInUudmgtEVBuKnOv
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6882145a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=m-6kepI0FKUGdeIz8lcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kYJNhZClWYIX__vNWKw60H36uKPJLsy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240083
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



On 24/07/2025 12:42, Neil Armstrong wrote:
> On 24/07/2025 11:32, Dmitry Baryshkov wrote:
>> On Thu, 24 Jul 2025 at 12:08, <neil.armstrong@linaro.org> wrote:
>>>
>>> On 20/05/2025 10:06, Johan Hovold wrote:
>>>> Hi Chris,
>>>>
>>>> On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
>>>>> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
>>>>>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
>>>>>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>>>>>>>>> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct 
>>>>>>>>> drm_dp_aux *aux, struct drm_edp_backlight_inf
>>>>>>>>>         }
>>>>>>>>>
>>>>>>>>>         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>>> +
>>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, 
>>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
>>>>>>>>> +     if (ret < 0) {
>>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read 
>>>>>>>>> pwmgen bit count cap min: %d\n",
>>>>>>>>> +                         aux->name, ret);
>>>>>>>>> +             return -ENODEV;
>>>>>>>>> +     }
>>>>>>>>> +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>>> +
>>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, 
>>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
>>>>>>>>> +     if (ret < 0) {
>>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read 
>>>>>>>>> pwmgen bit count cap max: %d\n",
>>>>>>>>> +                         aux->name, ret);
>>>>>>>>> +             return -ENODEV;
>>>>>>>>> +     }
>>>>>>>>> +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>>> +
>>>>>>>>> +     /*
>>>>>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
>>>>>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than 
>>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
>>>>>>>>> +      * the sink must use the MIN value as the effective PWM 
>>>>>>>>> bit count.
>>>>>>>>> +      * Clamp the reported value to the [MIN, MAX] capability 
>>>>>>>>> range to ensure
>>>>>>>>> +      * correct brightness scaling on compliant eDP panels.
>>>>>>>>> +      */
>>>>>>>>> +     pn = clamp(pn, pn_min, pn_max);
>>>>>>>>
>>>>>>>> You never make sure that pn_min <= pn_max so you could end up with
>>>>>>>> pn < pn_min on broken hardware here. Not sure if it's something 
>>>>>>>> you need
>>>>>>>> to worry about at this point.
>>>
>>> I'm trying to figure out what would be the behavior in this case ?
>>>
>>> - Warn ?
>>> - pn_max = pn_min ?
>>> - use BIT_COUNT as-is and ignore MIN/MAX ?
>>> - pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
>>> - reverse clamp? clamp(pn, pn_max, pn_min); ?
>>> - generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?
>>
>> Per the standard, the min >= 1 and max >= min. We don't need to bother
>> about anything here.
> 
> Yeah, I agree. But I think a:
> if (likely(pn_min <= pn_max))
> is simple and doesn't cost much..

Really, no need to.

> 
>>
>> On the other hand, I think the patch needs to be updated a bit. If the
>> pn value changed after clamping, it makes sense to write it back to
>> the DP_EDP_PWMGEN_BIT_COUNT register by jumping to the tail of the
>> drm_edp_backlight_probe_max() function
> 
> You're right, we need to write it back, but we can't jump to
> the tail of the function since it has all the pwmgen logic
> in the middle.

If you add 'driver_pwm_freq_hz && 'to the 
DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP condition at the end of the function, 
then we can jump to the tail.

> 
> Neil
> 
>>
>>>
>>> Or just bail out ?
>>>
>>> Neil
>>>
>>>>>>>
>>>>>>> I am honestly not sure. I would hope that devices follow the spec 
>>>>>>> and
>>>>>>> there is no need to be too paranoid, but then again we do live in 
>>>>>>> the
>>>>>>> real world where things are... not so simple ;-).
>>>>>>> I will wait for further feedback from someone who has more 
>>>>>>> experience
>>>>>>> with eDP panels than I have.
>>>>>>
>>>>>> There's always going to be buggy devices and input should always be
>>>>>> sanitised so I suggest adding that check before calling clamp() 
>>>>>> (which
>>>>>> expects min <= max) so that the result here is well-defined.
>>>>>
>>>>> Makes sense, I will do so in the next revision.
>>>>
>>>> It seems you never got around to respinning this one so sending a
>>>> reminder.
>>>>
>>>> Johan
>>>>
>>>
>>
>>
> 

-- 
With best wishes
Dmitry

