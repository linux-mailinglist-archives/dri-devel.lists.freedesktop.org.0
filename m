Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D1E805B28
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 18:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C30410E573;
	Tue,  5 Dec 2023 17:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EEB10E573
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 17:33:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B5HX9Xs016253;
 Tue, 5 Dec 2023 11:33:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1701797589;
 bh=7Gnv2zcHaYktlo+k0zMSRDQ5ojNMnlpQU0FowjEG8HI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Ru+fkaZJgeMO4EYg4Xc2ba9h1SKCO5JbBpsRnzS9jaR3hCs98fQgRGkzWqvtk/qe7
 X0A2LaHs58HFQ0O7se/V+UAwK4jXaLTxbqC82W//WT270VpzY+V6yV7KC7/CDJkIaG
 z+rx6wKtzBVXC7bH10btOaG9Yy1edOpOdVqT01HU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B5HX9fj003764
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Dec 2023 11:33:09 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Dec 2023 11:33:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Dec 2023 11:33:08 -0600
Received: from [10.249.36.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B5HX78t022703;
 Tue, 5 Dec 2023 11:33:07 -0600
Message-ID: <cb590a13-e0ff-49d9-8583-be613ad50dc5@ti.com>
Date: Tue, 5 Dec 2023 11:33:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <CFF198DA-5C42-425E-86F4-759629489ECB@goldelico.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CFF198DA-5C42-425E-86F4-759629489ECB@goldelico.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/5/23 2:17 AM, H. Nikolaus Schaller wrote:
> Hi Andrew,
> 
>> Am 04.12.2023 um 19:22 schrieb Andrew Davis <afd@ti.com>:
>>
>> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
>> multiple vendors.
> 
> Great and thanks for the new attempt to get at least the Device Tree side
> upstream. Really appreciated!
> 

Thanks for helping us maintain these GPUs with the OpenPVRSGX project :)

>> Describe how the SGX GPU is integrated in these SoC,
>> including register space and interrupts.
> 
>> Clocks, reset, and power domain
>> information is SoC specific.
> 
> Indeed. This makes it understandable why you did not directly
> take our scheme from the openpvrsgx project.
> 
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> .../devicetree/bindings/gpu/img,powervr.yaml  | 69 +++++++++++++++++--
>> 1 file changed, 63 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
>> index a13298f1a1827..9f036891dad0b 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
>> @@ -11,11 +11,33 @@ maintainers:
>>    - Frank Binns <frank.binns@imgtec.com>
>>
>> properties:
>> +  $nodename:
>> +    pattern: '^gpu@[a-f0-9]+$'
>> +
>>    compatible:
>> -    items:
>> -      - enum:
>> -          - ti,am62-gpu
>> -      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - ti,am62-gpu
>> +          - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
>> +      - items:
>> +          - enum:
>> +              - ti,omap3430-gpu # Rev 121
>> +              - ti,omap3630-gpu # Rev 125
> 
> Is the "Rev 121" and "Rev 125" a property of the SoC integration (clock/reset/power
> hookup etc.) or of the integrated SGX core?
> 

The Rev is a property of the SGX core, not the SoC integration. But it seems that
compatible string is being used to define both (as we see being debated in the other
thread on this series).

> In my understanding the Revs are different variants of the SGX core (errata
> fixes, instruction set, pipeline size etc.). And therefore the current driver code
> has to be configured by some macros to handle such cases.
> 
> So the Rev should IMHO be part of the next line:
> 
>> +          - const: img,powervr-sgx530
> 
> +          - enum:
> +              - img,powervr-sgx530-121
> +              - img,powervr-sgx530-125
> 
> We have a similar definition in the openpvrsgx code.
> Example: compatible = "ti,omap3-sgx530-121", "img,sgx530-121", "img,sgx530";
> 
> (I don't mind about the powervr- prefix).
> 
> This would allow a generic and universal sgx driver (loaded through just matching
> "img,sgx530") to handle the errata and revision specifics at runtime based on the
> compatible entry ("img,sgx530-121") and know about SoC integration ("ti,omap3-sgx530-121").
> 
> And user-space can be made to load the right firmware variant based on "img,sgx530-121"
> 
> I don't know if there is some register which allows to discover the revision long
> before the SGX subsystem is initialized and the firmware is up and running.
> 
> What I know is that it is possible to read out the revision after starting the firmware
> but it may just echo the version number of the firmware binary provided from user-space.
> 

We should be able to read out the revision (register EUR_CR_CORE_REVISION), the problem is
today the driver is built for a given revision at compile time. That is a software issue,
not something that we need to encode in DT. While the core ID (SGX5xx) can be also detected
(EUR_CR_CORE_ID), the location of that register changes, and so it does need encoded in
DT compatible.

The string "ti,omap3430-gpu" tells us the revision if we cannot detect it (as in the current
driver), and the SoC integration is generic anyway (just a reg and interrupt).

Andrew

>> +      - items:
>> +          - enum:
>> +              - ingenic,jz4780-gpu # Rev 130
>> +              - ti,omap4430-gpu # Rev 120
>> +          - const: img,powervr-sgx540
>> +      - items:
>> +          - enum:
>> +              - allwinner,sun6i-a31-gpu # MP2 Rev 115
>> +              - ti,omap4470-gpu # MP1 Rev 112
>> +              - ti,omap5432-gpu # MP2 Rev 105
>> +              - ti,am5728-gpu # MP2 Rev 116
>> +              - ti,am6548-gpu # MP1 Rev 117
>> +          - const: img,powervr-sgx544
>>
>>    reg:
>>      maxItems: 1
>> @@ -40,8 +62,6 @@ properties:
>> required:
>>    - compatible
>>    - reg
>> -  - clocks
>> -  - clock-names
>>    - interrupts
>>
>> additionalProperties: false
>> @@ -56,6 +76,43 @@ allOf:
>>        properties:
>>          clocks:
>>            maxItems: 1
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,am654-sgx544
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 1
>> +      required:
>> +        - power-domains
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: allwinner,sun6i-a31-gpu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +        clock-names:
>> +          minItems: 2
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ingenic,jz4780-gpu
>> +    then:
>> +      required:
>> +        - clocks
>> +        - clock-names
>>
>> examples:
>>    - |
>> -- 
>> 2.39.2
>>
> 
> BR and thanks,
> Nikolaus
