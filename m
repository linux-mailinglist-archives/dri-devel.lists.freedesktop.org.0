Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E1AB0BBB2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 06:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0D110E00D;
	Mon, 21 Jul 2025 04:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pd+gqMZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E30D10E00D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 04:18:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L40kLW000890
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 04:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0HxS55+QTxxnhovCNlJMVgeCUCIs7adrQbeCrM4+8pY=; b=Pd+gqMZN6VlsReQ2
 ApLJJ3KRx8yfPGzjKNebwJ80Go6FToeUYYa4O3lfQ5S2qmB4E34dhEzTL4M9KXN7
 vU58SaWiWgI4OzuOYPgSrgb4RQf375zxiPkmT2RUyzmLU7FJsSnJTkBQqSIc0xQe
 hH68NESm3siMXM5EMpgKo76pIExrNphUcOUVqi/jQgSj23wvtEG8dmGSi6TaCuPI
 thk+Z/BVtHM2Lw4D3n6mBmBwz1l9IKfKnqGriP6TdGbt06GYnx+uoH91zzfPDYI6
 F/Oi+QNMY1ijMZcOsntm8K2USXBvnjx669FrqrQIPQixelVh80lAKL/3UoieitQL
 j6WMLQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dbacp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 04:18:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-749286f935aso299300b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 21:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753071504; x=1753676304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0HxS55+QTxxnhovCNlJMVgeCUCIs7adrQbeCrM4+8pY=;
 b=UncQnEIRLnKZjfTWis3nroyHuBi6P3aUasehQwKj/g0p+0VEUJE1JeLutaPHnQ3mH1
 LQwTovCOaJF4zhEdBvVtS2Qul6ZVZ+M/fyN9WbsVV6bR+3qEfWjbF/xJzcNJ02BL7bzc
 ljPYf9pM9w0u0frXNRyZFt7HnS4EKFRynGXk2dQpMtOoY7VLTmDf0LriraEq0J+WA8Us
 B0NkIzHeRP2mqSjcE4ieb8LeCHWliqk7F2dBhAAoErDSmYUpxBINizfhORZQ7tKXydVs
 chdFu6uwbCC9wVHkXbQcSwwWMwCshV3U5lCLQLLslCBhxTIfLnNiNrVy01Qqs9cBKRgJ
 4v2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk1KknfipnLRiyGMroacC6bsVG5ESqewfp/s5Ccnwmvd6ndZ0FGnKOSAajpin4f8MkqKAeWug9tYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxngyObqOdsxOg/V6PgePy4e4WkBhkvX3HLgWlu/8I/7aIb/BDZ
 yURJvn5Oy9+xfGxFVQJH7VK+m6mGvooZEsLy1BMUGmTuLR/DQB4knZwsirFwlJXBJ5F6oTIoJQb
 cJFMZQh1RE+8MPTpqgHCwqnXDZqit5n5biVKCCPUj7ac+Avp6CvA1qYrVQhNibx4Yw6BItsM=
X-Gm-Gg: ASbGnctokIrtbh7AJN5wJF9FaQ+T19qCn+0G6I9yW8LtOJy79JzXVhgK6mSUilubtCS
 dPRfqnQsc9UHnVTqVGqyyygk0G6PrawSH0KmapNTlGppJAUZMMbPBnGkN3icm2WiFsAGVRw6D57
 gCpXe2xaEqZbPfQzcLzZ/a7q3cM+y5IxKlreM8XwMWEL3Gxl9G3K4hY5qixVtbzkgaxy/kxnS6P
 umLr1SIbidrIw6bn7ARnhPUQoIrs0jmEF9SgWTpcxbQ2vWhK/yD7mclxz3L1i2ojspN6ZGpUqja
 u2YHbt1rCZUUAJ3M6BrB0Xr858Y8noGzLt7oeeaRmOsh6VZLwzRFLJHbzOHiTQblVYe3uI/oamv
 cviq3CCN+N0m9rDcyntcSYkdzAOiM
X-Received: by 2002:a05:6a20:9147:b0:1ee:d6da:b645 with SMTP id
 adf61e73a8af0-237d5c0df9emr13823371637.4.1753071504501; 
 Sun, 20 Jul 2025 21:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9E+Jpxuf/n9mwdKcrc+ICdr6n87fGKbL6wE5SUt8XIJ2tugZsZ8TP4nLkT2kWBtaUKyMt+w==
X-Received: by 2002:a05:6a20:9147:b0:1ee:d6da:b645 with SMTP id
 adf61e73a8af0-237d5c0df9emr13823324637.4.1753071503997; 
 Sun, 20 Jul 2025 21:18:23 -0700 (PDT)
Received: from [10.133.33.17] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe8ea7bsm4493637a12.21.2025.07.20.21.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jul 2025 21:18:23 -0700 (PDT)
Message-ID: <a723b6a6-c70a-442f-9785-9f607548664f@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 12:18:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 quic_xiangxuy@quicinc.com
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
 <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
 <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
 <b4e1ea54-ff3c-408e-8716-f48001ec9113@oss.qualcomm.com>
 <d427de7d-76ac-4e5b-b79a-3b7638a8e7fc@oss.qualcomm.com>
 <w66xyhu5w7ajpkennvj24cad4j6izvapsp3reyla7iui2jdgkx@d43b6z3qw5tj>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <w66xyhu5w7ajpkennvj24cad4j6izvapsp3reyla7iui2jdgkx@d43b6z3qw5tj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687dbf91 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=q-zp-rPcFIMxVU44S18A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Xj-FLtmjrLcacG1dpD3DAyT6aI66LQLv
X-Proofpoint-ORIG-GUID: Xj-FLtmjrLcacG1dpD3DAyT6aI66LQLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDAzNCBTYWx0ZWRfX9G2QwBfdK3gH
 u9Zv1pPe8VXXxXQtu49nsaAIPlt4vaf2fg0hZsUsXc1Donh3EOiKvNGJh6Oxeewaluik1kr9+c0
 c5+F/wsTIOAyiNEnaVYsSH+Aybm2/n1x+48qWqMKQCY8iJgX1difsuG3ulXMdswhYEAEo8GOn73
 Z57Z//9OnEWlTwdNhWKICq9TnbkE/C+61C0yj4Sx292NaKd7KLlc7GXPeeUz1/vlPkH4TgYkUe8
 BxHfoysqLZorTcc4Q+4FL4UPZnBPOW0RJiVKJQfUcgM5cDQA2cxSOKRhUxnPBJFflk/uwejo6lB
 HGd2GIIdbeKwYWhGm6KC52Q41WDoge9bcBenN295nnjb4D9c1nvz5YMsWAW9H848eE22Wc1j5Jd
 bVgvouTH77/t1APvf2OXDGaWbB5aCchen49f0dse61KPji/qeyql1XrpG+3jVayB1wwQ+Utz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210034
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


On 7/19/2025 5:43 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 09, 2025 at 05:16:02PM +0800, Xiangxu Yin wrote:
>>
>> On 5/28/2025 4:49 AM, Konrad Dybcio wrote:
>>> On 12/3/24 3:07 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Dec 03, 2024 at 04:13:22PM +0800, Xiangxu Yin wrote:
>>>>>
>>>>> On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>>> Add a mechanism to retry Link Training 2 by lowering the pattern level
>>>>>>> when the link training #2 first attempt fails. This approach enhances
>>>>>>> compatibility, particularly addressing issues caused by certain hub
>>>>>>> configurations.
>>>>>> Please reference corresponding part of the standard, describing this lowering.
>>>>>>
>>>>> Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:
>>>> Anything in DP 2.1?
>>>>
>> In the DP 2.1 spec, mainly on section '3.6.7.2 8b/10b DP Link Layer LTTPR Link Training Mandates', defined 'LTTPR shall support TPS4'.
>> The other parts seems similar to the 1.4 spec.
>>>>> - All devices shall support TPS1 and TPS2
>>>>> - HDR2-capable devices shall support TPS3
>>>>> - HDR3-capable devices shall support TPS4
>>>>> While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
>>>>> In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.
>>>> Any other driver doing such TPS lowering? Or maybe we should be
>>>> selecting TPS3 for HBR2-only devices?
>> This logic is porting from qualcomm downstream, 
> Hopefully a downstream has some sensible commit message which describes
> the issue and the configuration to reproduce it?

The downstream commit log shows in 2019/08, SM8250 (kernel 4.19) type-c DP meet LT2 failures on Samsung HDR curved monitor, the pattern lowering fix was adopted.
On QCS615, an mDP-to-HDMI adapter cable exhibited similar LT failure pattern, and it's works with this solution.
However, It's rare compatibility case with special device and lowering seems violates protocol standards, maybe not suitable for general deployment.

>> For other device, only found in some older Tx chips like i915（intel_dp_training_pattern) used the maximum hardware-supported patterns, but not lowering.
>>
>> According to the description in DPCD table 2-232 003h, From the DP spec perspective, it appears that all supported cases should preferably adopt TPS4, as it is more robust.
> If other drivers don't perform this kind of lowering, I'd prefer if we
> don't perform it too.
Agree,  I'll remove this patch in an upcoming version soon.
>
>> 'DPRXs should support TPS4 and set this bit, regardless of whether the DPRX supports HBR3 because TPS4 is more conducive to robust link establishment than TPS2 and TPS3.
>> 0 = TPS4 is not supported.
>> 1 = TPS4 is supported (shall be supported for downstream devices with DPCD r1.4, except for eDPRXs).'
>>
>> Although maximum capability of QCS615 is HBR2, but the actual pattern supports TPS4. 
>> From pure design perspective, it would be cleaner to drop this lowering in next patch. 
>>> Bump, this patch looks interesting and I'd like to see it revisited if
>>> it's correct
>>>
>>> Konrad
>>
