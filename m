Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C0591A980
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 16:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEA010EAD2;
	Thu, 27 Jun 2024 14:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NxhVU6oI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ED010EAC5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 14:44:59 +0000 (UTC)
Received: from [192.168.88.20] (91-158-144-210.elisa-laajakaista.fi
 [91.158.144.210])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 274032C5;
 Thu, 27 Jun 2024 16:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1719499474;
 bh=wiRhXRt2NhOH8Yp4ES4mussK0B06KmxvL55Tjh5zfak=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NxhVU6oIpKM5a+VZtk7haJq3mXvpgIWHgrDnKfwc6+kPBYedfWJOZgMClaDA5iEHG
 dGkAOtYUrk7L64FWBBpXoPipUSa7MVyDDgjNyGwsmQ16jek0gy3GIAdT0c5LMAuznI
 zwfQAjRdtRrBngJ39azq9+9iQX9zJ3xhHeyzs38g=
Message-ID: <30545e01-2456-429f-aa1a-ea525270820b@ideasonboard.com>
Date: Thu, 27 Jun 2024 17:44:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: display: ti: Add schema for AM625 OLDI
 Transmitter
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, DRI Development List
 <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240511193055.1686149-1-a-bhatia1@ti.com>
 <20240511193055.1686149-3-a-bhatia1@ti.com>
 <20240512193459.GF17158@pendragon.ideasonboard.com>
 <e0433619-75c7-40bc-aafb-f0a875ea7dc3@ti.com>
 <20240513193009.GA2986074-robh@kernel.org>
 <cbd44252-2abf-4443-ade7-b1aa32d24e3e@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <cbd44252-2abf-4443-ade7-b1aa32d24e3e@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 14/05/2024 08:08, Aradhya Bhatia wrote:
> Hi Rob,
> 
> Thank you for reviewing the patches!
> 
> On 14/05/24 01:00, Rob Herring wrote:
>> On Mon, May 13, 2024 at 02:07:44PM +0530, Aradhya Bhatia wrote:
>>> Hi Laurent,
>>>
>>> Thank you for reviewing the patches!
>>>
>>> On 13-May-24 01:04, Laurent Pinchart wrote:
>>>> Hi Aradhya,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Sun, May 12, 2024 at 01:00:53AM +0530, Aradhya Bhatia wrote:
>>>>> Add devicetree binding schema for AM625 OLDI Transmitters.
>>>>>
>>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>> ---
>>>>>   .../bindings/display/ti/ti,am625-oldi.yaml    | 153 ++++++++++++++++++
>>>>>   MAINTAINERS                                   |   1 +
>>>>>   2 files changed, 154 insertions(+)
>>>>>   create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..0a96e600bc0b
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>>>>> @@ -0,0 +1,153 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/display/ti/ti,am625-oldi.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Texas Instruments AM625 OLDI Transmitter
>>>>> +
>>>>> +maintainers:
>>>>> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>> +  - Aradhya Bhatia <a-bhatia1@ti.com>
>>>>> +
>>>>> +description: |
>>>>> +  The AM625 TI Keystone OpenLDI transmitter (OLDI TX) supports serialized RGB
>>>>> +  pixel data transmission between host and flat panel display over LVDS (Low
>>>>> +  Voltage Differential Sampling) interface. The OLDI TX consists of 7-to-1 data
>>>>> +  serializers, and 4-data and 1-clock LVDS outputs. It supports the LVDS output
>>>>> +  formats "jeida-18", "jeida-24" and "vesa-18", and can accept 24-bit RGB or
>>>>> +  padded and un-padded 18-bit RGB bus formats as input.
>>>>> +
>>>>> +properties:
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>> +    description: serial clock input for the OLDI transmitters
>>>>> +
>>>>> +  clock-names:
>>>>> +    const: s_clk
>>>>> +
>>>>> +  ti,companion-oldi:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description:
>>>>> +      phandle to companion OLDI transmitter. This property is mandatory for the
>>>>> +      primarty OLDI TX if the OLDI TXes are expected to work either in dual-lvds
>>>>> +      mode or in clone mode. This property should point to the secondary OLDI
>>>>> +      TX.
>>>>> +
>>>>> +  ti,secondary-oldi:
>>>>> +    type: boolean
>>>>> +    description: Boolean property to mark an OLDI TX as secondary node.
>>>>> +
>>>>> +  ti,oldi-io-ctrl:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description:
>>>>> +      phandle to syscon device node mapping OLDI IO_CTRL registers found in the
>>>>> +      control MMR region. This property is needed for OLDI interface to work.
>>>>> +
>>>>> +  ports:
>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>> +
>>>>> +    properties:
>>>>> +      port@0:
>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>> +        description: Parallel RGB input port
>>>>> +
>>>>> +      port@1:
>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>> +        description: LVDS output port
>>>>> +
>>>>> +    required:
>>>>> +      - port@0
>>>>> +      - port@1
>>>>> +
>>>>> +allOf:
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        ti,secondary-oldi: true
>>>>> +    then:
>>>>> +      properties:
>>>>> +        ti,companion-oldi: false
>>>>> +        ti,oldi-io-ctrl: false
>>>>> +        clocks: false
>>>>> +        clock-names: false
>>>>> +
>>>>> +    else:
>>>>> +      required:
>>>>> +        - ti,oldi-io-ctrl
>>>>> +        - clocks
>>>>> +        - clock-names
>>>>> +
>>>>> +required:
>>>>> +  - reg
>>>>> +  - ports
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
>>>>> +
>>>>> +    oldi_txes {
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +        oldi: oldi@0 {
>>>>> +            reg = <0>;
>>>>> +            clocks = <&k3_clks 186 0>;
>>>>> +            clock-names = "s_clk";
>>>>> +            ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
>>>>
>>>> What bus does this device live on ? Couldn't the I/O register space be
>>>> referenced by the reg property ?.
>>>>
>>>
>>> These registers are a part of the system-controller register space
>>> (ctrl_mmr0). The whole register set is owned by the main_conf[0]
>>> devicetree node, with sub-nodes pointing to specific regions. That's why
>>> I cannot reference these registers directly.
>>
>> Then what does 'reg' represent? Looks like you just made up an index. If
>> so, then this should probably be a child of &dss_oldi_io_ctrl instead.
>> Or it should just be merged into that node.
>>
> 
> I did make up an index when I used the 'reg' property. Similar to how
> ports can be indexed. The AM65 has 1 OLDI TX. AM62 and AM62P have 2 OLDI
> TXes each. The index is to help the driver parse through each of them.
> 
> If I push these OLDI TX nodes as child nodes under &dss_oldi_io_ctrl,
> then that would be an inaccurate representation of the hardware.
> 
> The OLDI TXes are very well a part of the DSS hardware. As such, the
> (three) registers that control the functionality have been made a part
> of the DSS video-port (VP) register space, leaving OLDI TXes with no
> direct access to the primary bus (cbass_main) where the DSS sits.
> 
> The IO control registers, on the other hand, do not affect OLDI
> functionality in any way. These are just helper registers that merely
> control the power characteristics of the OLDI data and clock lanes.

Just summarizing my understanding from today's code and ref manual (TRM) 
reading, which mostly repeats what Aradhya said above:

There may be 0, 1 or 2 OLDI instances, depending on the SoC. With two 
instances, they may be (or are currently always?) connected to the same 
display controller videoport, and thus can be used for cloning or 
dual-link lvds.

In the TRM the OLDI instances are depicted to be inside DSS (display 
subsystem), but outside DISPC (display controller). However, the 
registers to configure and control OLDI are in the DISPC register block. 
More specifically, in the DISPC VP1 block, which is the videoport to 
which the OLDIs are connected to, and additionally one bit in the 
DSS_SYSSTATUS register.

The oldi-io-ctrl points to a system-control module, which contains a 
register to control OLDI power up/down. But why is it called 
"oldi-io-ctrl"? The register in question is OLDI_PD_CTRL.

So... How to represent this in the DT?

I think we do want have separate nodes for the OLDIs, so that we can use 
the of_graph to represent how the data flows. OLDI doesn't have its own 
register block, and is controlled via DSS. If the OLDI nodes are not 
children of the DSS node, where could they be?

I think the DT design in these patches matches my understanding of the 
hardware.

  Tomi

