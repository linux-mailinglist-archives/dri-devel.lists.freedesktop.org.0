Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7BB0C81F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6110E585;
	Mon, 21 Jul 2025 15:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMR0HOfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507F910E583
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:52:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L9xeG5015848
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k1To2TtXrWvL7KDLUWwYZS+zt9S2lZ7nkcx7wxlUsgc=; b=UMR0HOfNvnMdl+Uc
 aUIUBqSvnw1RGmMDEBnY1JMRFTTxP2Z9qQLJyzDWK4t5Kh5ui6nVH9DZ9+SpWFQy
 r/S6xJKg1zJX7bCyCDTK68JxtdLP5pDkuNlvassiqkz5i5Nt/8Yc0dv1uFajWqjQ
 A5BPK6oCteGYiU0ELJO+agf/aE7m+aOB8xUnfDwZtpujON3yWq1Q+NeLtIS6uqwj
 7h0o2bzvXjRqlxMI3pNeEq9zFbI88TD0eAAfuAaKlZ5czEO7YvlIC182a/mdDfo1
 8+FNROe3LNH4TYC6m4vakJgFruUpowdEe/tghuEB8pSuz8IvFtywIuaKQvjsBUFS
 RUxaPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451dwve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:52:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-235c897d378so41673055ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 08:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753113146; x=1753717946;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k1To2TtXrWvL7KDLUWwYZS+zt9S2lZ7nkcx7wxlUsgc=;
 b=i3R50YfKTyljNC51OdyyRH9kao9+HEi6peTq+VweyNUUACZsITrMwEL7AsFCzCQuEG
 So8FoNkmk95NvFS+LbcMFELX+I4n28xaVhE+k0Zk2dDuvF6opzdycCyk7xIl0NixGD+Q
 GmZ/MJrye2Gs3tMC+bZR+tmAfZpzHEboBqy7Tp2sQf+/c6RJJXYuY1GGR5VOaNkyv+bS
 ifJxkOmeoVFcuFjwY2OXsU++8XRblvOhhdKOUPtIK0huwk12wY/YZZ3gpEqVVcxDv3lU
 ZBS7FTIhN5bE/dNgMYuXgZWto8OB4WbY2sbRjxhWiZYSdpFeqbYzdE9iJakz21LCnD4z
 60Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGu+GQL+TdJjJ267wZXpKovHsvii6nEZPKAyqzd6yq289jBm6X4aj1fNk0MTjomzHWi3Bm3NxT9BM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOTwi/Qbu4G5kZ5YRBHzD0G+Oxx+aL8ArukwNzFqtmUvZKg/OW
 oosdthBUDpNG/OMkuUKBp6oK+D1fjB8pkqXOgk0ClGc58DaWecYc0B9mVXOc7M/BfKPKXQVolze
 0lDO+ZOOvj7h/CireEIe1zkXeUB6TBIeLpZlYLl4BSVfwa/u0yeEyPnsU4HMTlvwTmB+JdUo=
X-Gm-Gg: ASbGncsX7o8QTYZjzV5WQNAYzl3077egG5RJvKNGnK2Og9Ho4JVBObTk1Xq++tSbIJy
 6OTOWaYRC7dA3M/+TK1IyvEM8mE1mmjzNY/0u6WToasRuoYRjHIdf8lxxt6C9qQIgJIDOcPgBsJ
 Mo8lLwY/u6Dqltap+xCA4HZqNJyA6c1uqfQWZxssqpiiCHGnYxAVhKFFqwBj0I7tGkCtedtEgPf
 o2DXfG89VNKNDm61XTztdByy+Rsno71wyMXWSWwILaEJdOcVWudjvQjboMfS0cFP/aSBG703Kiw
 TJaF+nyoqLE3qxoV2hOeAVnB5zmYupfprDhAGMdH/ip18I6uTsR7436AiRptuvP7fqLaBrQFS20
 kakpe/EYqacRC0w==
X-Received: by 2002:a17:903:11c5:b0:23e:1b99:2a71 with SMTP id
 d9443c01a7336-23e24f59902mr290415555ad.39.1753113145675; 
 Mon, 21 Jul 2025 08:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPCwCxq1QkhMyEoe34Z12143edz1TUZnWOSk/9IkmrEyBMoiqaPExRfBVgfEPrzhXVmpdjcQ==
X-Received: by 2002:a17:903:11c5:b0:23e:1b99:2a71 with SMTP id
 d9443c01a7336-23e24f59902mr290415145ad.39.1753113145178; 
 Mon, 21 Jul 2025 08:52:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d2a8dsm60084815ad.165.2025.07.21.08.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 08:52:24 -0700 (PDT)
Message-ID: <7649e4ff-c712-4db4-8777-f96bc4de97c4@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 09:52:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
 <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
 <4109088.mvXUDI8C0e@diego>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <4109088.mvXUDI8C0e@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687e623b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=DISFzqtZAAAA:8
 a=eRn_eXbfG_JMZ2bVrUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-ORIG-GUID: tcCAFM72Hq_dNAm7JgXr2FnESTXmegxn
X-Proofpoint-GUID: tcCAFM72Hq_dNAm7JgXr2FnESTXmegxn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE0MSBTYWx0ZWRfX/Wxum6+Eq2Xt
 RPYROKHfbdC4B8F1mlLRGeP/qRoQlTLxgznHJfG/peA6vwg1kK+Y4MKbMdKo7WGzlwpZ3FESdTm
 o8d0xrB2rXzp79i1NoUrp4WG58OJ3bL+t/UpTYD7jVp5ZwGLKvebzSIU43Elxe8zk4km5Syx9Yb
 wnRtsvwUTbvPIsHSl0Yz+QFgY8ryJB7cEv6S4mVKxgqORCxjhOREcn+IKFre0nEV+w96olfrHeg
 /roQ5TSh7FZB6m/Y34y/esJ2dGLzSg/nVci/MXwObq0mKOpVV2gr6PRUh4d89wFpZUZBcPmAD9Y
 pRGBaDeJxZjFYHT7kb4ZhrjeppbRqc61fYKEZNPKWL/mpqiBzd9wu3tTp0jepuZwo6Hn82eLrI8
 RHf3f35HnN5anlqG5za6RnuHNNZXa7NdIebcdujYGsPBQm7Bj5mNNHo683qsd8YVobyIPwBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210141
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

On 7/21/2025 9:24 AM, Heiko Stübner wrote:
> Hi Jeff,
> 
> Am Montag, 21. Juli 2025, 16:55:01 Mitteleuropäische Sommerzeit schrieb Jeff Hugo:
>> On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
>>> This series adds a new driver for the NPU that Rockchip includes in its
>>> newer SoCs, developed by them on the NVDLA base.
>>>
>>> In its current form, it supports the specific NPU in the RK3588 SoC.
>>>
>>> The userspace driver is part of Mesa and an initial draft can be found at:
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>>
>> This (and the userspace component) appear ready for merge from what I
>> can tell. Tomeu is still working on his drm-misc access so I've offered
>> to merge on his behalf. Planning on waiting until Friday for any final
>> feedback to come in before doing so.
> 
> sounds great.
> 
> Just to make sure, you're planning to merge patches 1-6 (driver + binding)
> into drm-misc and I'll pick up the "arm64: dts: " patches 7-10 afterwards?

That works for me. I'll plan on merging 1-6 and leaving 7-10 for you.

-Jeff
