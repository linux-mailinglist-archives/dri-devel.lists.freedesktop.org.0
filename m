Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D03662A83
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 16:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C997E10E440;
	Mon,  9 Jan 2023 15:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32E310E440
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 15:49:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 309FnKbk021502;
 Mon, 9 Jan 2023 09:49:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1673279360;
 bh=tHZZefyYne34nwtHlmcO9279ZiTFZKklHDR4wSaraLs=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=MPUiZGBLs/Ku6SlSm3Fh+yFJcoGIXbBdA2icjuIIZ3bG28Lf4hxlbusjtBtW3r+j1
 d+ESwERr6zuKSVhU4PuUTfDVFIQp3yL6qzK+Rp5rdyZvl3hNXAGClH9q8f6DuClU8d
 KyAqikzfsRBeqcXaHluWkpbzVG7Qm/XmCoIq+OSg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 309FnKl1105964
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Jan 2023 09:49:20 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 9
 Jan 2023 09:49:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 9 Jan 2023 09:49:19 -0600
Received: from [10.250.234.21] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 309Fn9qV038794;
 Mon, 9 Jan 2023 09:49:10 -0600
Message-ID: <784cc3a5-8b10-aed3-b151-77cedb531f25@ti.com>
Date: Mon, 9 Jan 2023 21:19:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS panel
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren
 <guoren@kernel.org>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
 <85837957-f6d2-4722-7693-98c6cf932096@linaro.org>
 <32d66fb7-6c63-0985-222f-0bd3c36c165d@ti.com>
 <30423568-df03-1d72-81fe-3a4b33214e5c@linaro.org>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <30423568-df03-1d72-81fe-3a4b33214e5c@linaro.org>
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

Hi Krzysztof,

On 03-Jan-23 16:58, Krzysztof Kozlowski wrote:
> On 03/01/2023 12:02, Aradhya Bhatia wrote:
>> But this is throwing an error. I am confused what else could be done.
>> Can you please suggest what might be a more accurate check here?
>>
>>>
>>>> +              required:
>>>> +                - dual-lvds-odd-pixels
>>>> +        then:
>>>> +          properties:
>>>> +            port@1:
>>>> +              properties:
>>>> +                dual-lvds-even-pixels: true
>>>> +                dual-lvds-odd-pixels: false
>>>
>>> Why do you need this? Your oneOf before already solves it.
>>
>> I agree with your comment here. It makes sense to only have
>>
>> 	dual-lvds-even-pixels: true
>>
>> and have the oneOf condition take care of the other. But, I just tested
>> this and it was unable to pick-up this intentionally-added error.
>>
>> I added 'dual-lvds-odd-pixels' property to both the nodes, and
>> dt_binding_check passes successfully (which it should have not.)
>>
>> Instead, if I only keep this,
>>
>> 	dual-lvds-odd-pixels: false
>>
>> then the dt_binding_check detects the error as it should.
>>
>> Regardless, I am curious why the first method doesn't work. Will try to
>> explore more on that.
> 
> The check for presence of properties is only against required:, but you
> added there properties. Like this:
> 
> https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml#L155
> 
> 
> Other way is to drop your both oneOf and entire allOf from ports and use:
> 
> oneOf:
>    - properties:
>        ports:
>          $ref: /schemas/graph.yaml#/properties/ports
>          properties:
>            port@0:
>              required:
>                - dual-lvds-odd-pixels
>            port@1:
>              required:
>                - dual-lvds-even-pixels
>    - properties:
>        ports:
>          $ref: /schemas/graph.yaml#/properties/ports
>          properties:
>            port@1:
>              required:
>                - dual-lvds-odd-pixels
>            port@0:
>              required:
>                - dual-lvds-even-pixels
> 

Thank you for the suggestions.
I tested the both of them, and they seem to be working as expected.

V2 will reflect all the required fixes.


Regards
Aradhya
