Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51F674B84
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD96F10EA47;
	Fri, 20 Jan 2023 04:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D763710EA42
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:59:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30K4wwaL059217;
 Thu, 19 Jan 2023 22:58:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1674190738;
 bh=FhdMm8snS4EyWglAxG9HV9C8rgTh2MdCa/PV2daai+0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=IQIjXef8eot9FsusDlpnq4ExSa3ShrotvDLKZTWVWjFVwfIti0C44gBEdKYHbZ941
 d4FgjRzaupR90M0pb3/LnJq5dmc3YnXkhoE3pJDNHx0Qr1bjWPdqMFChFPaLYKEnYn
 t+rnl+NLCidenbOG2q/xjWzNgOKMsVQqdVS3O2H4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30K4wwvM108629
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Jan 2023 22:58:58 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 19
 Jan 2023 22:58:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 19 Jan 2023 22:58:57 -0600
Received: from [172.24.223.178] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30K4wmmo100309;
 Thu, 19 Jan 2023 22:58:49 -0600
Message-ID: <36fe032b-a00c-dad1-a3db-bea1f15726c0@ti.com>
Date: Fri, 20 Jan 2023 10:28:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS panel
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard
 <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren
 <guoren@kernel.org>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
 <09f1ca83-c7d5-a186-6fa6-09cdd7a0b9cc@collabora.com>
 <431ddd82-055b-2526-3d5e-f6563e48d264@ti.com>
 <808e831f-4282-0e58-ebb2-2f556aaeaca4@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <808e831f-4282-0e58-ebb2-2f556aaeaca4@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for taking a look at the patches!

On 17-Jan-23 18:08, Tomi Valkeinen wrote:
> On 09/01/2023 18:21, Aradhya Bhatia wrote:
>> Hi Angelo,
>>
>> Thanks for taking a look at the patches!
>>
>> On 03-Jan-23 17:21, AngeloGioacchino Del Regno wrote:
>>> Il 03/01/23 07:46, Aradhya Bhatia ha scritto:
>>>> Dual-link LVDS interfaces have 2 links, with even pixels traveling on
>>>> one link, and odd pixels on the other. These panels are also generic in
>>>> nature, with no documented constraints, much like their single-link
>>>> counterparts, "panel-lvds".
>>>>
>>>> Add a new compatible, "panel-dual-lvds", and a dt-binding document for
>>>> these panels.
>>>>
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> ---
>>>>   .../display/panel/panel-dual-lvds.yaml        | 157 
>>>> ++++++++++++++++++
>>>>   MAINTAINERS                                   |   1 +
>>>>   2 files changed, 158 insertions(+)
>>>>   create mode 100644 
>>>> Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>>>>
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>>>> new file mode 100644
>>>> index 000000000000..88a7aa2410be
>>>> --- /dev/null
>>>> +++ 
>>>> b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>>>> @@ -0,0 +1,157 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/panel/panel-dual-lvds.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Generic Dual-Link LVDS Display Panel
>>>> +
>>>> +maintainers:
>>>> +  - Aradhya Bhatia <a-bhatia1@ti.com>
>>>> +  - Thierry Reding <thierry.reding@gmail.com>
>>>> +
>>>> +description: |
>>>> +  A dual-LVDS interface is a dual-link connection with the even pixels
>>>> +  traveling on one link, and the odd pixels traveling on the other.
>>>> +
>>>> +allOf:
>>>> +  - $ref: panel-common.yaml#
>>>> +  - $ref: /schemas/display/lvds.yaml/#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - lincolntech,lcd185-101ct
>>>> +              - microtips,13-101hieb0hf0-s
>>>> +          - const: panel-dual-lvds
>>>> +      - const: panel-dual-lvds
>>>> +
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    properties:
>>>> +      port@0:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        unevaluatedProperties: false
>>>> +        description: The sink for first set of LVDS pixels.
>>>> +
>>>> +        properties:
>>>> +          dual-lvds-odd-pixels:
>>>> +            type: boolean
>>>> +
>>>> +          dual-lvds-even-pixels:
>>>> +            type: boolean
>>>> +
>>>> +        oneOf:
>>>> +          - required: [dual-lvds-odd-pixels]
>>>
>>> One question: why do we need a "panel-dual-lvds" compatible?
>>> A Dual-LVDS panel is a LVDS panel using two ports, hence still a 
>>> panel-lvds.
>>>
>>> If you're doing this to clearly distinguish, for human readability purposes,
>>> single-link vs dual-link panels, I think that this would still be clear even
>>> if we use panel-lvds alone because dual-link panels, as you wrote in this
>>> binding, does *require* two ports, with "dual-lvds-{odd,even}-pixels" properties.
>>
>> Yes, while they are both LVDS based panels the extra LVDS sink in these
>> panels, and the capability to decode and display the 2 sets of signals
>> are enough hardware differences that warrant for an addition of a new
>> compatible.
>>
>>>
>>> So... the devicetree node would look like this:
>>>
>>> panel {
>>>      compatible = "vendor,panel", "panel-lvds";
>>>      ....
>>>      ports {
>>>          port@0 {
>>>              .....
>>>              -> dual-lvds-odd-pixels <-
>>>          }
>>>
>>>          port@1 {
>>>              .....
>>>              -> dual-lvds-even-pixels <-
>>>          };
>>>      };
>>> };
>>>
>>>> +          - required: [dual-lvds-even-pixels]
>>>
>>> ...Though, if you expect dual-lvds panels to get other quirks in the future,
>>> that's a whole different story and you may actually need the panel-dual-lvds
>>> compatible.
>>
>> Yes, exactly. Even while being non-smart, there are going to be more
>> quirks in future. And it would be better if they have their own
>> compatible/binding, and are not getting appended in an ever-growing
>> if-else ladder. :)
> 
> I can imagine a panel which you can use with a single LVDS link if the 
> clock is high enough, or two LVDS links if the clock has to be lower. Is 
> that a dual-lvds panel? =)

Hmm, I can see what you are saying here.

If one wants to run a dual-link panel, with 1 link (given enough clock
frequency), then the bindings here will *not* allow for a single port
with the odd/even properties absent.

In such a case, the compatible will indeed need to be changed to
"panel-lvds".

While it does feel a tad bit odd, I believe it is still worth
maintaining the clarity and HW differences between the single and dual
link panels. :)

> 
> But probably that situation is no different than a panel that can work 
> with DSI or DPI input.
> 
> Still, I'm agree with Angelo in that a new compatible string for dual 
> link lvds feels a bit odd. That said, it's possible the panel-lvds  > bindings might get rather confusing. So I don't have a strong feeling 
here.

Regards
Aradhya
