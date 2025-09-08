Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56542B48574
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B9510E478;
	Mon,  8 Sep 2025 07:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqUr7NDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE5710E478
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 07:36:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LnaF2024006
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 07:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QNHN7kPRAWt4JfWXRnbbHXUE90qzcsGnkDRXHKAjBCg=; b=oqUr7NDgdpeIBem0
 aVox1B+2FjDGu1UOiC+yVMM1C7o+lWzGABi2XQTC6PuSwD1aa2x84C/Up62MXDgr
 84rDBjaseTB2FQmtL/pQZ4Etmaeum3x6jPtyIdbZnuDBZEnSSzTbbulP6R1BhBtw
 wanMFBO495a7SYeTSOUdp4N55V5C9eXS6Ey8VxvFoNVlTkmTb+8Aqss7G8fg9i7T
 o/98QkYuf0veFhKAcVDsQ3qNubCwoAbDG+pYXqh+PKjhg4E5JqK7S39sy7fQ8y3L
 xrS7OIB+9K/2IzmKuRLpDdSIXe0WN9CxSoPjSiXvL4uS7YOZaa4YimVzrR8yC/up
 raSUUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapbw4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 07:36:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f15a5f3dso6317171cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 00:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757317004; x=1757921804;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QNHN7kPRAWt4JfWXRnbbHXUE90qzcsGnkDRXHKAjBCg=;
 b=eXOSlEOTm2xSA9DyC0AMlzA0sQSKkuDDlNXTgdtOViem8/3XYdMORoChRH8B0fH28l
 02fn7zrmsjg905BzSlW1uCEbaB8QybtSSnV+H31n3n9HG+e7B7ZYAqex0fYb//ZXYSKj
 LVH42QAxQXaS3TQzU/+fFGOxdLOLZ6CjPnGNPPRWy5DfWGCYAoe8azuzYQLYcivNPTzu
 AYuq3VNGb4WiWWqm33K359jMNEvtaVGd8eYKcqPp7g20VyEgqNUC4N2lUSsUUxm52CNy
 0b2GY/KGDgaiclxVd27puopJ8Xxpxq0vkNItD0YFoFxRTK+KZfSa/ZhiLUCID10yWomi
 0y4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7fzA1+waRgxO4b6Rw7RJp0cf0mp1hgQc741YgtpaatYlxXz13WK3EbULOGCGbPatlm7Be7+4yvZ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnDLibv6wi3B76ofglzyacYgOl4o1S4bxjqpiwufb4COEkze4e
 1BpV6G+E/clRDgIUeXtjl5KIUNGeulsrb2ga5Ujbg/ICNFCiiwnRHfiVyUGwNDi1vnuFR4fv6tZ
 +bV4puEFKILBqZPtMtIJi0zPwl2cGv2ORgV6kYvLFXNTrWzW4zm0Ie/xAdeSu3oAbwXh0R+k=
X-Gm-Gg: ASbGncuczXq3BPlOPUj00yXdxnfRMdI/9X/8lJTf48VWuxpionpvPkIqrb4TuGzhNVf
 xCeVp6WmKkiDLodLkjeXyEF+ds2POLgVCZKbzoWrF09pWbf642ID0MZ54vRqyrSSK08yshD6LL4
 QHnxlShelkT6dzE9cPcHi1lc33t9OpaphqNP2D+NAgzIZfLeQ+Z78/LjhcBVdPuFGttIdKGLUnZ
 nbgHcdlUuImJ2jt76Cl9zemPrUCwE+m4b+0tKjxHtSOU56hqg/SyH2XlxLwAoTRSHEN0ZYNUh9B
 3ae3+EVz5pPlFcqv+bazcqYei68hD+skpdNw5mFoalpkTBDXjTkSFWjqiyYYohjkzpWrqeVsLwT
 8Cpe34DpVg7GzbmJJxKCg4g==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id
 d75a77b69052e-4b5f848d05bmr48274191cf.7.1757317003667; 
 Mon, 08 Sep 2025 00:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElIxN4NWUvxQroVKmxTi8+UW7BRi0pLtgjjPwqySqL6k7dbcrx49kS4O8YknoB23Bc/E9voA==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id
 d75a77b69052e-4b5f848d05bmr48273961cf.7.1757317002960; 
 Mon, 08 Sep 2025 00:36:42 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0484e8a4a1sm1001949866b.83.2025.09.08.00.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 00:36:42 -0700 (PDT)
Message-ID: <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 09:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
To: Hans de Goede <hansg@kernel.org>,
 Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
 <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
 <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68be878c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=wJ-R-PlTzkls_HvLT0IA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: -j6oQpT2DUK5O85bGh_M1kYkWB1YtZEY
X-Proofpoint-ORIG-GUID: -j6oQpT2DUK5O85bGh_M1kYkWB1YtZEY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX/Rs/n2lN3d3x
 nQZ7cvhU2kgpPxTbqO+QEWT7dewxsMNN+15Y6/0DhuM6V71yeYm5Hft/DdUCVA1Y8KeJQVZDQlf
 1u0tzUEJ/531bg2DXjhFXGlFj1S4AxXm/0h/7KyF9zhBKG96FtDkJKD/6aIoyj3PqWdwv7EQfxj
 AMPoFdiMfJPpjwxinvEp9G50MrBUIYawaa3O4SEISykzEuI49yHlLcR4cN4z+gU9dmMBJAyIYJ7
 1Ft9KUCDqcq2oChLOFS47eTUKXsNJ9OfLpJamvF3M1ikK1bsQ+aazJh4cZQV7/uhe0LkUCV1wIN
 1rUbTR41YtcpJBslksh4BwguonWvmslPkBXj3rMUduZpIWbPkx6Bce0z12YZQYP7RddJ+dtSVae
 BmfK8fmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On 9/8/25 9:33 AM, Hans de Goede wrote:
> Hi,
> 
> On 8-Sep-25 09:20, Konrad Dybcio wrote:
>> On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
>>> A number of existing schemas use 'leds' property to provide
>>> phandle-array of LED(s) to the consumer. Additionally, with the
>>> upcoming privacy-led support in device-tree, v4l2 subnode could be a
>>> LED consumer, meaning that all camera sensors should support 'leds'
>>> and 'led-names' property via common 'video-interface-devices.yaml'.
>>>
>>> To avoid dublication, commonize 'leds' property from existing schemas
>>> to newly introduced 'led-consumer.yaml'.
>>>
>>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>>> ---
>>
>> [...]
>>
>>>  
>>> +  leds:
>>> +    minItems: 1
>>> +    maxItems: 1
>>
>> My brain compiler suggests this will throw a warning (minItems should
>> be redundant in this case)
>>> +
>>> +  led-names:
>>> +    enum:
>>> +      - privacy-led
>>
>> Nit: "privacy" makes more sense without the suffix, as we inherently
>> know this is supposed to be an LED
> 
> Note "privacy-led" as name is already used on the x86/ACPI side and
> the code consuming this will be shared.
> 
> With that said if there is a strong preference for going with just
> "privacy" the x86 side can be adjusted since the provider-info is
> generated through a LED lookup table on the x86/ACPI side. So we can
> just modify both the lookup table generation as well as the already
> existing led_get(dev, "privacy-led") call to use just "privacy"
> without problems.

In that case, it may be cleaner to just go with what we have today
(unless the dt maintainers have stronger opinions)

Konrad
