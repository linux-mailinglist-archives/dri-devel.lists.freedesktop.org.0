Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA0C828A7C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 17:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17FA10E48E;
	Tue,  9 Jan 2024 16:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FFF10E48E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 16:53:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 409Gr5Xm016878;
 Tue, 9 Jan 2024 10:53:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1704819185;
 bh=iHiTjx8NHZJnPof+njozBL2G+dd0BsVHIjNWCy6rIek=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Yy3bMx4/Yzf97w86aOfBS4akux9QB2Kuo5MatkVOI+0K9M8kchw4Oqto7TtkbrtMr
 2tL48v1DNa2NdNWNJhQccC9k8qy3/pfg9p32n89F6nuLNtgezOFNwohAzj0oVfL94Z
 NuMDjG5qfsIWUm0HKnL/gbstXMeEoeb6OaUgdHkA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 409Gr57x031093
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jan 2024 10:53:05 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jan 2024 10:53:05 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jan 2024 10:53:05 -0600
Received: from [10.249.40.136] ([10.249.40.136])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 409Gr3gb015005;
 Tue, 9 Jan 2024 10:53:03 -0600
Message-ID: <c3664f43-431a-421f-8d2a-a3d2cc6f8777@ti.com>
Date: Tue, 9 Jan 2024 10:53:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 02/11] dt-bindings: gpu: Add PowerVR Series5 SGX
 GPUs
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 Adam Ford <aford173@gmail.com>, Ivaylo
 Dimitrov <ivo.g.dimitrov.75@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-3-afd@ti.com>
 <e68b3b0c-7a03-4771-b6e8-c1a263e31425@linaro.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <e68b3b0c-7a03-4771-b6e8-c1a263e31425@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/24 5:32 AM, Krzysztof Kozlowski wrote:
> On 08/01/2024 19:32, Andrew Davis wrote:
>> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
>> multiple vendors. Describe how the SGX GPU is integrated in these SoC,
>> including register space and interrupts. Clocks, reset, and power domain
>> information is SoC specific.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../bindings/gpu/img,powervr-sgx.yaml         | 124 ++++++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   2 files changed, 125 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
>> new file mode 100644
>> index 0000000000000..bb821e1184de9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
>> @@ -0,0 +1,124 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (c) 2023 Imagination Technologies Ltd.
> 
> Your email has @TI domain, are you sure you attribute your copyrights to
> Imagination?
> 

The file started as a copy/paste from a IMG copyrighted file, even
though it is now almost completely re-written I've left their (c)
for good measure. I'll add an additional TI (c).

> ...
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks: true
> 
> Missing min/maxItems
> 

These are set in the allOf/if/then blocks below, seems
if I don't set them to at least something here then I get
a warning:

    'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

even if I define them in the allOf block below. I don't
know what the min/max should be until I check the compatible
in the allOf block.

>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: core
>> +      - const: mem
>> +      - const: sys
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
> 
> This goes after allOf: block.
> 

ACK

>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,am6548-gpu
>> +    then:
>> +      required:
>> +        - power-domains
>> +    else:
>> +      properties:
>> +        power-domains: false
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - allwinner,sun6i-a31-gpu
>> +              - ingenic,jz4780-gpu
>> +    then:
>> +      allOf:
>> +        - if:
> 
> I don't understand why do you need to embed allOf inside another allOf.
> The upper (outer) if:then: looks entirely useless.
> 

It is so that both compatibles falls through to having
clock being required.

Logic in YAML always seems messy to me, here it is in pseudo C:

if (compatible == allwinner,sun6i-a31-gpu ||
     compatible == ingenic,jz4780-gpu) {
	if (compatible == allwinner,sun6i-a31-gpu)
		clocks: ...
	if (compatible == ingenic,jz4780-gpu)
		clocks: ...
	required:
		- clocks
		- clock-names
} else { /* disallow for all others */
	properties:
		clocks: false
		clock-names: false
}

Now if I had an "else if" that didn't force the indention to keep
growing I would have used that. (does one exist?) I also cannot
simply add the clock properties only for the two compats need
them for the reasons above and so must add them unconditionally
before then explicitly disable them in a catch-all else path.

Andrew

>> +            properties:
>> +              compatible:
>> +                contains:
>> +                  const: allwinner,sun6i-a31-gpu
>> +          then:
>> +            properties:
>> +              clocks:
>> +                minItems: 2
>> +                maxItems: 2
>> +              clock-names:
>> +                minItems: 2
>> +                maxItems: 2
> 
> 
> Best regards,
> Krzysztof
> 
