Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504D5AB1836
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C0F10EA49;
	Fri,  9 May 2025 15:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGFysvlf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BBA10EA68
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 15:18:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BE3NJ025435
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 15:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 utDfRm9yEnEcuSD5wRoweKl442QKaEa5GIg5IOHfbG4=; b=AGFysvlfYlojTWJr
 fuPItSLQ7FohYoLGYuEZncqk5x81gXE0Tzxp4y9lR9GM3tEXuQGJIHGgC6h8taEm
 bU0IdJiS6F4O3VZe7p8njwElnL+D1+Y3uoimv11jNF6gUnZgi7I96DVpmOsOH0yo
 8s/Qfr4PqZ9vXcR+odwcZMJP5AcNXBglX2UU0I+v0VM1qccG73vfXuEggd7bxqhb
 WJGq252vq0daz2yxxHj0x1lw0koqHHGuOm3YAxk+UT7DN+MKpWPGhMg4mz0x/k5D
 k+6vp+3g3v2KyKPq10tMEVnxwThGeeaRLaRlEg3QWU5Lh3v62dJB49KlZw7atjCG
 ttNxhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp155db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 15:18:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7cabd21579eso40305085a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 08:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746803923; x=1747408723;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=utDfRm9yEnEcuSD5wRoweKl442QKaEa5GIg5IOHfbG4=;
 b=C56mqXMeMubNUnxxj8MM8MFo24+TRdiEynmda+lDMvQVkgzcaGKexZmXJsoAEOsLeA
 awVADP20F/8Cmw41sQU+AGAUuJYVSWYsgB9omIT7NmQpJ9VhBGWKYhS4BKWVcThtkdnp
 FwMgy7eavUgVVEZrW9JHZd64W21PV15yKwIP4enW6dytO/L9SMrHxoL34rEQVfVM43Oo
 3Z5A8WWEWqh+9mndyf5TxGlM1ovu4JpOBJlnXoBoS7VLYQp69dmf8SHBQQbEA1TYxYei
 rMnKKDYYCD+JBD3cYmj9xqFb7rFTboz2SWnzwR7HkNFKdOW9te7Jq5jrtOkZV5IXGN2w
 Agmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmuLUHf7aeRWsGM23Hy5ePNQuyhaSWGIL6f6z6zBeMS+Dh6G1cdairrluL8sAcbEIsRqfOGD5vFW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNtb97cM+N6Gul8PLkeRzZih2FjEmwUbbxwz4wyMHGJ7hkivBY
 kUX+Tjd6RJYhluRmPEBdMUPKlwbpnqFBPWJXeQh74ZK65ajh54jOBppFqLJm1wt3EGuz3N2PQ/2
 I2aFoJseumWWC0Q0kLbmGaJmXh5KbKRiKUOm6MLXArpaSamZRjNLHCdwp4ZltncPX5Y4=
X-Gm-Gg: ASbGncuw/DL52jJNExmIG0/rHUHSVF0mkjI7DyS2Tiz2rT1WcdizQr4u/zAXgUavpjm
 vjv0x+GYKdoi0DNIL96iP3vhGd17eZofcQ5zf4UR93qG+3ldHKX1o6QjUakLLicDwR6S/m6CrkG
 NJAntzx/Fkwb9HOwmvgajJ8lm+XPT22F8Fz8V/e9yhrDqZsrkcgebobXydOAQcOd41HxSdGlRpG
 bEn8y+HFR3V2V560s4ZK56ouexhCVbIFY4UN9hhMxUJfHbrk3+XH/i0cCNvIKEIC5mm/nmXCjPl
 VUTS8+Mp20d2WSFDqjnp4OuMGNdcU2P0lSaCfjljcXb1JKMH0G4xsNaBVH7kz6Vht9CPVvY0i+b
 4o5Qif+q8DHL4uq1566iMc2momHzCeqP3T3OPbUQWYmp9vFfm3jO7WQaiynwAEs84
X-Received: by 2002:a05:620a:4727:b0:7c9:2383:afef with SMTP id
 af79cd13be357-7cd0115034cmr674763785a.37.1746803922673; 
 Fri, 09 May 2025 08:18:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPsqI2DXHYl8igD/hABxSIitYc1LfAKRC3bEPVNydkg0fxuqduKG1kw9aY/mt1U3TUllVG3g==
X-Received: by 2002:a05:620a:4727:b0:7c9:2383:afef with SMTP id
 af79cd13be357-7cd0115034cmr674759385a.37.1746803922301; 
 Fri, 09 May 2025 08:18:42 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a6:738a:e519:cad2:e720:53eb?
 (2001-14bb-a6-738a-e519-cad2-e720-53eb.rev.dnainternet.fi.
 [2001:14bb:a6:738a:e519:cad2:e720:53eb])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cee9sm305198e87.75.2025.05.09.08.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 08:18:41 -0700 (PDT)
Message-ID: <6cfc706f-4909-4121-9849-a37e4769ab2f@oss.qualcomm.com>
Date: Fri, 9 May 2025 18:18:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before
 checking plane
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
 <b5kl5whmagpxn4saimkj4qloowh73xggehdh5rnl6lmjvqf65j@esycoi7w2nmp>
 <CABymUCMuiKQwtuYW-HX4bwyTR4awm4scwXTWNzVCEmyQsQ29aA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CABymUCMuiKQwtuYW-HX4bwyTR4awm4scwXTWNzVCEmyQsQ29aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1MSBTYWx0ZWRfXz83Ol+u8tm2b
 VurFXpUcpRQHrAL0ytiT9KHGI9TxbNjTblLBp/Sdv6LxKavE7VtYe/wg4H2EEEy5NN891VrqD57
 ClDZeJaIZf6P4V5E7lLQIPpgXFF91PCtB91iC/UyaFvXIyDvZWeLBBTw5UVAFt9tK1LzDiXRnLc
 FZUDl0LssXjU+cbMrigNb4geoKSeKAupWgIwK+iKxbH6gMQM9JO9Gk1Eh0500M0mP2gNTkn3ndt
 emxMv2jo82oU3MyFjEUTsBBbE5fTrPVf1tQn99iZggAeELc5c6HzZdkujDnsqTou6RecMPNbPo3
 6RMOrZqn1x+DxFXMz9qYGM1JeIHEaEYdhownd3SijS64HobgKYWspmRU8nFDrCC3BGhJ4I4Fyg+
 imUYLajaghZSenGZS3EMFSoyqOLnl9bMhmhFCfEUvIOqtqNsNXe6jJ9SDLM+SoB4DxdKuCpb
X-Proofpoint-GUID: F-6vM6_kmSruKwSsLb2rCk43_zkqN40i
X-Proofpoint-ORIG-GUID: F-6vM6_kmSruKwSsLb2rCk43_zkqN40i
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681e1cd4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=sWdYkf8P3oHYA_MdvdkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090151
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

On 09/05/2025 06:08, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年5月8日周四 18:47写道：
>>
>> On Tue, May 06, 2025 at 11:47:31PM +0800, Jun Nie wrote:
>>> Some display controller support flexible CRTC and DMA, such as the display
>>> controllers in snapdragon SoCs. CRTC can be implemented with several mixers
>>> in parallel, and plane fetching can be implemented with several DMA under
>>> umberala of a virtual drm plane.
>>>
>>> The mixer number is decided per panel resolution and clock rate constrain
>>> first, which happens in CRTC side. Then plane is split per mixer number
>>> and configure DMA accordingly.
>>
>> Here you are describing a behaviour of one particular driver as a reason
>> to change the framework.
> 
> Yeah, the specific driver requires a change in framework. Maybe the
> comment is not
> proper?

Yes. Explain how does that benefit the framework / other drivers. 
Otherwise the answer would be as simple as 'replace 
drm_atomic_helper_check_planes() in your driver'.

>>
>>>
>>> To support such forthcoming usage case, CRTC checking shall happen before
>>> checking plane. Add the checking in the drm_atomic_helper_check_modeset().
>>
>> So, now drivers will get two calls to atomic_check(), one coming in
>> circumstances which were not expected by the drivers before. Are you
>> sure that this won't break anything?
> 
> Yes, it is a concern. Is there any way to limit the change in
> framework to specific
> driver with a flag, such as DRM_FLAG_CHECK_CRTC_BEFORE_PLANE?

Definitely not with a flag. You can try adding a new helper callback, 
but I don't know how DRM core maintainers would react to it.

>>
>>>
>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>>> ---
>>>   drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
>>>   1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>>> index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb7c0bc9d57960314fe 100644
>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>> @@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>>>                        return ret;
>>>        }
>>>
>>> +     for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>>> +             const struct drm_crtc_helper_funcs *funcs;
>>> +
>>> +             funcs = crtc->helper_private;
>>> +
>>> +             if (!funcs || !funcs->atomic_check)
>>> +                     continue;
>>> +
>>> +             ret = funcs->atomic_check(crtc, state);
>>> +             if (ret) {
>>> +                     drm_dbg_atomic(crtc->dev,
>>> +                                    "[CRTC:%d:%s] atomic driver check failed\n",
>>> +                                    crtc->base.id, crtc->name);
>>> +                     return ret;
>>> +             }
>>> +     }
>>> +
>>> +
>>> +
>>
>> Too many empty lines. But the main quesiton is: why are you calling it
>> before mode_valid()? According to your description a better place would
>> be in drm_atomic_helper_check_planes().
>>
> Agree, that's the proper function. Will remove the empty line in next version.
> 
>>>        ret = mode_valid(state);
>>>        if (ret)
>>>                return ret;
>>>
>>> --
>>> 2.34.1
>>>
>>
>> --
>> With best wishes
>> Dmitry
>>


-- 
With best wishes
Dmitry
