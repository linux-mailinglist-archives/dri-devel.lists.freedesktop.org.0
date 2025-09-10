Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A095B51176
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 10:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF6210E2C6;
	Wed, 10 Sep 2025 08:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7kf9Hgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A858910E2C6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:35:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A7cogm023383
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mdZlGbXkoykBItIhC2uuPRcWMxj3GO69cBZWAldVw3M=; b=m7kf9HgnKQ/9rzas
 V97f3QsliMHcaYhWLmqyotcd0N5a2Nc+TwfOuH5XZv5YwYmEy8Xjh934QM8uAD3o
 TIvq0cALJVZadIZEnlNdEWVONaZpEtMPGqoFEMXlHYxWHLfz5EE63RDMhjRTM74v
 7GCvYtr+wgpdagFTCDTSYzPwflzD5eSPRkUY7Di0CtSKvdP1K7zXFGan3lAbly1i
 lB7QtZZe+uFapwsmom7T2nrCRMMOzPgGpg0fD7KyO/OEzrvQ10yGnDzhTs55ZYJo
 81l4sA8n4cDZ6ECkANElJncW6OUleHppTwnX3GTz6qbg3t+mSoDT9CuX4urb9Xrw
 F678AQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg2yvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:35:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b613a54072so8913701cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 01:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757493314; x=1758098114;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mdZlGbXkoykBItIhC2uuPRcWMxj3GO69cBZWAldVw3M=;
 b=ZRvCM4B1TDzNayANdl1QeXap/xnjiVeCGqBSlQEKi/l7JJz20T4GAcGWStYy2z9ue/
 cL9bNQId/cZs1vF3k+7G62DhZOMS57RsG2Y2+THIhWFtKjBDIs0GbVWlrQxoZKQpf4a2
 tJGO7s8lZmjqKQaeAKNPmGVJmfRIJlIpifSuvtU5ZXQ9wBmn24x0Oi82A9vr6wONNjqt
 eZ55k89Rf5T6jNeBY9NXfpxac7gptMirpTy/y7uJmnamkc0kMgxc7zG9jDKtzpM87/iy
 bRhL9wqX4twnkcuJTiNM5T3SiUjjUoat7f7UWztZjg5yEr4S7baX223ArOAUFDgM6ajx
 pVBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUguHVx74ZMnHQ6W0CLG4gLRXiAVCrxOGwflQdZCLdWmEtk57LNw3/sOKrWLwK/DlE+4Vau6SmsCcw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQQqrWXuIW1tIJkqYduE4GwJAs8VfqrTJsjRcqIUWKCTL22DJx
 zWwcHTWNihd3I5UNHcDiGwnmLdXRNyhrodg/DBWeMY7tlGRzp6eFqvVCEJHGVKyQWpZp9H2vi1t
 v2laZ5uGWdgSoWrtPNFKcXFqaisMzkY1PudojUaAGzinmVPKmbENZX633e8dVpyq1wUBJb7c=
X-Gm-Gg: ASbGncsePYyLwMy9EmUcKRAp1Xzt/avHRogAAfzGUS1vyRoFGg3DtLfNsCKpfMpywd7
 rw17gm5Bjtc3dsnRx70McXK7s85sEIFaR3Q5WLSuhfphm1U6kQNF4O/VwRBMfQC7+VUrxn0mYXl
 4LhAYm0UAEOxQHzDEo3dOklUtGhla3Ttt6dDktoCYBc8WThxxWNv4/PYiFFEzItVvKW3tP0BPpH
 dZPJbhRffQABEmkvHFPgmbcqahXO5w/Cl1SrmNfUVbG8vIsMU5T1xR+RynrddaEitHx/l0XYmUa
 wAskB5f7di9Dhbe0mrPOmJ5HcQGN96wCzDBVccUekV2+Fjim/SLP8uIzk93xf6ojMpbqcMiT5ZT
 NOgN09sRksgeUnbclkzmurA==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id
 d75a77b69052e-4b5f84608a1mr93692761cf.11.1757493313966; 
 Wed, 10 Sep 2025 01:35:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/PjlyjlapeA2UUFv3VPSLLeX8X1TPLj4/Upo+NAPNfgy876iYhaAOrUk5Om4jVsYgaP3RA==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id
 d75a77b69052e-4b5f84608a1mr93692431cf.11.1757493313260; 
 Wed, 10 Sep 2025 01:35:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b078340e5bdsm127895366b.97.2025.09.10.01.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 01:35:12 -0700 (PDT)
Message-ID: <108895ac-0c4d-4aee-86b1-96461e00def3@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 10:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation
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
 <20250908-leds-v3-1-5944dc400668@vinarskis.com>
 <MOj2NUVAdyu9bvVkEON8rhAlGJ9FRRh9gJABkrOR_6gKhE8rmeZ5Isbj9noA1bDZ12gY4dlDpEtmEjxlRTucCssKwTo4f5nCowMOin85IKk=@vinarskis.com>
 <d957d16f-d206-4f7d-b52e-a2cad9e4abfc@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d957d16f-d206-4f7d-b52e-a2cad9e4abfc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c6GgJBMEnWoZ3FtfhYrpBP-Vpof0MrWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXwG9/X/zD7xO3
 RYoU/mxFYCX5M0Crxo1TRG05gWu1HziEz0hGapBBYe1wnhEfDbygeJl31XO3kO2DD2OHExiwq9k
 w/SUFH8f8QWWLP08cggglO4o4ocpr9XMzvGYpfvUpxW1xxWFHRfycDFo9Dp0AQmqEgWqaugcxr1
 HqYd3TgwxOzcc/YNO1sDBCzZm8o0FUUZE6GBR+guV0GJ82UtMoW6fNqvBVzjlicWgsa1PVPcmE/
 fnwLxFRjLtSX8Qw+tmf5ksKdLu0vQaOtU58FSrXpfrKf489G2Hynt2VkrZ9ONCPPfDqufCHCHjH
 fZnm29ZOfQbB557w8tyiN6Z8HjE6eAvIUUzONjQjfFirhNUjeSHM30odno1DjhFTNd9ecfuaGbV
 tQK5Evx5
X-Proofpoint-GUID: c6GgJBMEnWoZ3FtfhYrpBP-Vpof0MrWs
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c1384c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=I76Qk8w-AAAA:8
 a=bzamcEsfLQq8zZigF6MA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

On 9/9/25 10:39 PM, Hans de Goede wrote:
> Hi,
> 
> On 9-Sep-25 6:57 PM, Aleksandrs Vinarskis wrote:
>>
>>
>>
>>
>>
>> On Monday, September 8th, 2025 at 01:18, Aleksandrs Vinarskis <alex@vinarskis.com> wrote:
>>
>>>
>>>
>>> Introduce common generic led consumer binding, where consumer defines
>>> led(s) by phandle, as opposed to trigger-source binding where the
>>> trigger source is defined in led itself.
>>>
>>> Add already used in some schemas 'leds' parameter which expects
>>> phandle-array. Additionally, introduce 'led-names' which could be used
>>> by consumers to map LED devices to their respective functions.
>>>
>>> Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
>>>
>>> ---
>>> .../devicetree/bindings/leds/leds-consumer.yaml | 89 ++++++++++++++++++++++
>>> 1 file changed, 89 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..d50a3850f6336e9e3a52eb1374e36ea50de27f47
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
>>> @@ -0,0 +1,89 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Common leds consumer
>>> +
>>> +maintainers:
>>> + - Aleksandrs Vinarskis alex@vinarskis.com
>>>
>>> +
>>> +description:
>>> + Some LED defined in DT are required by other DT consumers, for example
>>> + v4l2 subnode may require privacy or flash LED. Unlike trigger-source
>>> + approach which is typically used as 'soft' binding, referencing LED
>>> + devices by phandle makes things simpler when 'hard' binding is desired.
>>> +
>>> + Document LED properties that its consumers may define.
>>> +
>>> +select: true
>>> +
>>> +properties:
>>> + leds:
>>> + oneOf:
>>> + - type: object
>>> + - $ref: /schemas/types.yaml#/definitions/phandle-array
>>> + description:
>>> + A list of LED device(s) required by a particular consumer.
>>> + items:
>>> + maxItems: 1
>>> +
>>> + led-names:
>>
>> While going over the feedback I realized `leds` and `led-names` do
>> not follow `property`, `property-names` convention. Any objections
>> if I rename `led-names` to `leds-names` for consistency?
> 
> No objections from me, `leds-names` indeed is better.

FWIW we have "clocks"/"clock-names", "resets"/"reset-names" etc.

I sometimes refer to "property"/"property-names" during review to
bring attention to the preferred style (ordering of such entries),
which is maybe what confused you

Konrad
