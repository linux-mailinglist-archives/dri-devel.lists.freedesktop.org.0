Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261D95EB7F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 10:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE74410E130;
	Mon, 26 Aug 2024 08:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SVDE35Cj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647E910E130
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 08:12:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4AC3DA41DBD;
 Mon, 26 Aug 2024 08:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CC1C8CDC1;
 Mon, 26 Aug 2024 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724659970;
 bh=GJX8WMOWMde/kMse+6fBcih9AFB2KaEoktYH4eL1+BA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SVDE35Cjmxr+/k2lBwT0mCM/tQSt4AuGzZgpMcyv8Shf9SYBF7nhdme/Ll1iQQWA+
 puftrSTyIixn36Wj4DWynLOF35Mf9qaeHI+QTh79ynJc5YPUNMpGlowGZMGgxtNWMA
 Q2zq3ANCYyBARU5UdNjuHzs53JS8jQG79whJ5IBQr3xKp4oyGf/XdX/NbSmt+tpMDA
 +Vi+v2e7qvO0f4fH8Td8hza6DMlH5p/Uw292IyYHS5wvPnYWeTbg7YK5ULNR22Wfh4
 OB3y8lLOY6Ko7ycvHnx1Tdess462qragDPDLXbVak9PHsZdzuDO8KDe21RVM/jLlKV
 YpudVOMX4+/MQ==
Message-ID: <cad20aa4-43a9-4754-b1e8-290ce0beb64d@kernel.org>
Date: Mon, 26 Aug 2024 10:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: display: ti: Add schema for AM625
 OLDI Transmitter
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240716084248.1393666-1-a-bhatia1@ti.com>
 <20240716084248.1393666-3-a-bhatia1@ti.com>
 <0144d9b4-e830-44b0-95cd-4d49d5051155@kernel.org>
 <2c1afef7-fed9-4685-bf07-b9f3d44a0077@linux.dev>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <2c1afef7-fed9-4685-bf07-b9f3d44a0077@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 26/08/2024 07:47, Aradhya Bhatia wrote:
> Hi Krzysztof,
> 
> Thank you for the reviewing the patches.
> 
> 
> On 7/21/24 21:06, Krzysztof Kozlowski wrote:
>> On 16/07/2024 10:42, Aradhya Bhatia wrote:
>>> The OLDI (transmitters) TXes do not have registers of their own, and are
>>> dependent on the source video-ports from the DSS to provide
>>> configuration data. This hardware doesn't directly sit on the internal
>>> bus of the SoC, but does so via the DSS. Hence, the OLDI TXes are
>>> supposed to be child nodes under the DSS, and not independent devices.
>>>
>>> Two of the OLDI TXes can function in tandem to output dual-link OLDI
>>> output, or cloned single-link outputs. In these cases, one OLDI will be
>>> the primary OLDI, and the other one, a companion.
>>>
>>> The OLDI functionality is further supported by a system-control module,
>>> which contains a few registers to control OLDI IO power and
>>> characteristics.
>>>
>>> Add devicetree binding schema for AM625 OLDI TXes.
>>>
>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>> ---
>>>  .../bindings/display/ti/ti,am625-oldi.yaml    | 153 ++++++++++++++++++
>>>  MAINTAINERS                                   |   1 +
>>>  2 files changed, 154 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>>> new file mode 100644
>>> index 000000000000..0a96e600bc0b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>>> @@ -0,0 +1,153 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/ti/ti,am625-oldi.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Texas Instruments AM625 OLDI Transmitter
>>> +
>>> +maintainers:
>>> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> +  - Aradhya Bhatia <a-bhatia1@ti.com>
>>> +
>>> +description: |
>>
>> Do not need '|' unless you need to preserve formatting.
> 
> Okay!
> 
>>
>>> +  The AM625 TI Keystone OpenLDI transmitter (OLDI TX) supports serialized RGB
>>> +  pixel data transmission between host and flat panel display over LVDS (Low
>>> +  Voltage Differential Sampling) interface. The OLDI TX consists of 7-to-1 data
>>> +  serializers, and 4-data and 1-clock LVDS outputs. It supports the LVDS output
>>> +  formats "jeida-18", "jeida-24" and "vesa-18", and can accept 24-bit RGB or
>>> +  padded and un-padded 18-bit RGB bus formats as input.
>>> +
>>> +properties:
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>
>> How does it even work without compatible? How is this schema selected?
>> If by part of your next patch, then this is not a proper split - this
>> patch itself is noop. Squash the patches.
>>
> 
> Yes, it is supposed to be picked like the next patch does it. I can
> squash these both.
> 
>>> +  clocks:
>>> +    maxItems: 1
>>> +    description: serial clock input for the OLDI transmitters
>>> +
>>> +  clock-names:
>>> +    const: s_clk
>>
>> Drop _clk or name it correctly.
> 
> Alright!
> 
>>
>>> +
>>> +  ti,companion-oldi:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      phandle to companion OLDI transmitter. This property is mandatory for the
>>> +      primarty OLDI TX if the OLDI TXes are expected to work either in dual-lvds
>>> +      mode or in clone mode. This property should point to the secondary OLDI
>>> +      TX.
>>> +
>>> +  ti,secondary-oldi:
>>> +    type: boolean
>>> +    description: Boolean property to mark an OLDI TX as secondary node.
>>
>> Why? Lack companion tells it, doesn't it?
> 
> A lack of companion doesn't mean secondary-OLDI automatically, actually.
> 
> There is also a possible configuration where 2 OLDI TXes could be
> individually connected to 2 different sources => 2x single Link
> configuration. The OLDI TXes would then work independently.

You are responding for something month old. I am not in the context anymore.

Probably you miss proper graphs here, not such property.

> 
>>
>>> +
>>> +  ti,oldi-io-ctrl:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      phandle to syscon device node mapping OLDI IO_CTRL registers found in the
>>> +      control MMR region. This property is needed for OLDI interface to work.
>>
>> "This property is needed for OLDI interface to work." tells nothing.
>> Everything is needed for everything to work. Be specific.
>>
> 
> Yes! Will fix this.
> 
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description: Parallel RGB input port
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description: LVDS output port
>>> +
>>> +    required:
>>> +      - port@0
>>> +      - port@1
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        ti,secondary-oldi: true
>>
>> This does not work... Test your schema.
>>
> 
> I tested again just now. At least the schema check didn't report any
> error. I used the v2024.05 dtschema too.

No, test your condition. Come with DTS with exercises this if. You will
see this DOES NOT WORK. This is just no-op, does not perform any useful
work. So test the code that it actually performs what you want it to do.

> 
> This github gist[0] captures all details of this test.
> 
> Could you instead please elaborate what maybe wrong here, and I will try
> to fix that.

Look at example-schema or any of my talks with useful references.

> 
> 
>>> +    then:
>>> +      properties:
>>> +        ti,companion-oldi: false
>>> +        ti,oldi-io-ctrl: false
>>> +        clocks: false
>>> +        clock-names: false
>>> +
>>> +    else:
>>> +      required:
>>> +        - ti,oldi-io-ctrl
>>> +        - clocks
>>> +        - clock-names
>>> +
>>> +required:
>>> +  - reg
>>> +  - ports
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
>>> +
>>> +    oldi_txes {
>>
>> No underscores in node names.
>>
>> Node names should be generic. See also an explanation and list of
>> examples (not exhaustive) in DT specification:
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> Right. Will make the name generic.
> 
>>
>>
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        oldi: oldi@0 {
>> What is the "reg" for?
> 
> The reg is for indexing purposes so that the driver can distinguish
> between which OLDI TX is under question. Since, the syscon controller
> has different power control registers and bits for different OLDIs - its
> important for the driver to be able to tell one from another.

Again, not sure, not in context. Patch is not even in the inbox anymore.

Best regards,
Krzysztof

