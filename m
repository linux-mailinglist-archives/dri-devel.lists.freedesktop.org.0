Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4D8C4BDE
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 07:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B0310E14C;
	Tue, 14 May 2024 05:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="kvL/1Bj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3248F10E14C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 05:08:59 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44E58O33128134;
 Tue, 14 May 2024 00:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715663304;
 bh=yBMKBLuh7D78bOQzhm5+DgKkaea+stGzc4l0jX34Gfw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=kvL/1Bj/paktdHIV9civJ2kyHffBLeL90jDtDMw23/sTPE86oIdS9GCJCC7BBAJ3+
 VPVf6IfXSgqBNeQx+SVQS7M7avGWLbWg4v+BG7pp82O/a9eRO6BC8pHFa3Hccm+QyZ
 exgEtLVd7BLImCM+OVPP2oZ4gg8XYDP8pvJZXlpk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44E58OQv041401
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 May 2024 00:08:24 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 14
 May 2024 00:08:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 14 May 2024 00:08:23 -0500
Received: from [10.249.131.75] ([10.249.131.75])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44E58E7Z048288;
 Tue, 14 May 2024 00:08:15 -0500
Message-ID: <cbd44252-2abf-4443-ade7-b1aa32d24e3e@ti.com>
Date: Tue, 14 May 2024 10:38:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: display: ti: Add schema for AM625 OLDI
 Transmitter
To: Rob Herring <robh@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Jyri Sarha <jyri.sarha@iki.fi>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, DRI Development List
 <dri-devel@lists.freedesktop.org>, Devicetree List
 <devicetree@vger.kernel.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>, Alexander
 Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240511193055.1686149-1-a-bhatia1@ti.com>
 <20240511193055.1686149-3-a-bhatia1@ti.com>
 <20240512193459.GF17158@pendragon.ideasonboard.com>
 <e0433619-75c7-40bc-aafb-f0a875ea7dc3@ti.com>
 <20240513193009.GA2986074-robh@kernel.org>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20240513193009.GA2986074-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for reviewing the patches!

On 14/05/24 01:00, Rob Herring wrote:
> On Mon, May 13, 2024 at 02:07:44PM +0530, Aradhya Bhatia wrote:
>> Hi Laurent,
>>
>> Thank you for reviewing the patches!
>>
>> On 13-May-24 01:04, Laurent Pinchart wrote:
>>> Hi Aradhya,
>>>
>>> Thank you for the patch.
>>>
>>> On Sun, May 12, 2024 at 01:00:53AM +0530, Aradhya Bhatia wrote:
>>>> Add devicetree binding schema for AM625 OLDI Transmitters.
>>>>
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> ---
>>>>  .../bindings/display/ti/ti,am625-oldi.yaml    | 153 ++++++++++++++++++
>>>>  MAINTAINERS                                   |   1 +
>>>>  2 files changed, 154 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>>>> new file mode 100644
>>>> index 000000000000..0a96e600bc0b
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>>>> @@ -0,0 +1,153 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/ti/ti,am625-oldi.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Texas Instruments AM625 OLDI Transmitter
>>>> +
>>>> +maintainers:
>>>> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> +  - Aradhya Bhatia <a-bhatia1@ti.com>
>>>> +
>>>> +description: |
>>>> +  The AM625 TI Keystone OpenLDI transmitter (OLDI TX) supports serialized RGB
>>>> +  pixel data transmission between host and flat panel display over LVDS (Low
>>>> +  Voltage Differential Sampling) interface. The OLDI TX consists of 7-to-1 data
>>>> +  serializers, and 4-data and 1-clock LVDS outputs. It supports the LVDS output
>>>> +  formats "jeida-18", "jeida-24" and "vesa-18", and can accept 24-bit RGB or
>>>> +  padded and un-padded 18-bit RGB bus formats as input.
>>>> +
>>>> +properties:
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +    description: serial clock input for the OLDI transmitters
>>>> +
>>>> +  clock-names:
>>>> +    const: s_clk
>>>> +
>>>> +  ti,companion-oldi:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description:
>>>> +      phandle to companion OLDI transmitter. This property is mandatory for the
>>>> +      primarty OLDI TX if the OLDI TXes are expected to work either in dual-lvds
>>>> +      mode or in clone mode. This property should point to the secondary OLDI
>>>> +      TX.
>>>> +
>>>> +  ti,secondary-oldi:
>>>> +    type: boolean
>>>> +    description: Boolean property to mark an OLDI TX as secondary node.
>>>> +
>>>> +  ti,oldi-io-ctrl:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description:
>>>> +      phandle to syscon device node mapping OLDI IO_CTRL registers found in the
>>>> +      control MMR region. This property is needed for OLDI interface to work.
>>>> +
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    properties:
>>>> +      port@0:
>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>> +        description: Parallel RGB input port
>>>> +
>>>> +      port@1:
>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>> +        description: LVDS output port
>>>> +
>>>> +    required:
>>>> +      - port@0
>>>> +      - port@1
>>>> +
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        ti,secondary-oldi: true
>>>> +    then:
>>>> +      properties:
>>>> +        ti,companion-oldi: false
>>>> +        ti,oldi-io-ctrl: false
>>>> +        clocks: false
>>>> +        clock-names: false
>>>> +
>>>> +    else:
>>>> +      required:
>>>> +        - ti,oldi-io-ctrl
>>>> +        - clocks
>>>> +        - clock-names
>>>> +
>>>> +required:
>>>> +  - reg
>>>> +  - ports
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
>>>> +
>>>> +    oldi_txes {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +        oldi: oldi@0 {
>>>> +            reg = <0>;
>>>> +            clocks = <&k3_clks 186 0>;
>>>> +            clock-names = "s_clk";
>>>> +            ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
>>>
>>> What bus does this device live on ? Couldn't the I/O register space be
>>> referenced by the reg property ?.
>>>
>>
>> These registers are a part of the system-controller register space
>> (ctrl_mmr0). The whole register set is owned by the main_conf[0]
>> devicetree node, with sub-nodes pointing to specific regions. That's why
>> I cannot reference these registers directly.
> 
> Then what does 'reg' represent? Looks like you just made up an index. If 
> so, then this should probably be a child of &dss_oldi_io_ctrl instead. 
> Or it should just be merged into that node.
> 

I did make up an index when I used the 'reg' property. Similar to how
ports can be indexed. The AM65 has 1 OLDI TX. AM62 and AM62P have 2 OLDI
TXes each. The index is to help the driver parse through each of them.

If I push these OLDI TX nodes as child nodes under &dss_oldi_io_ctrl,
then that would be an inaccurate representation of the hardware.

The OLDI TXes are very well a part of the DSS hardware. As such, the
(three) registers that control the functionality have been made a part
of the DSS video-port (VP) register space, leaving OLDI TXes with no
direct access to the primary bus (cbass_main) where the DSS sits.

The IO control registers, on the other hand, do not affect OLDI
functionality in any way. These are just helper registers that merely
control the power characteristics of the OLDI data and clock lanes.

Regards
Aradhya
