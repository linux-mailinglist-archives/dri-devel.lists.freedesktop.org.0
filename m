Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93738C4788
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 21:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106B810E2A8;
	Mon, 13 May 2024 19:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tyGGm2RA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1AA10E1CD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 19:30:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C4A8ECE0FBF;
 Mon, 13 May 2024 19:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9685C113CC;
 Mon, 13 May 2024 19:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715628612;
 bh=iThTAPThwTXWAZAmme59Q3SDkLqYOlftEs0Yr1QP0QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tyGGm2RAVP1mZAkKhfrfz4v417TAvlwbXuDJRuVh153vHpFC6PB0RLDWWzlsbaXFu
 1zb4h5e0mbfJ8mUcu7AJaVWLvTEHTOcYrNO2ke6CdBFjHDrzpv/bwnzeZrOdEwLkTl
 zfxzPjLeQPriqOai9sRB8GrtpyBbguwfrnQyWD37AohL9ney2Ulm4uEyQEjf5jiW4+
 Jil1524zA2Ugl5oTAg/JpetNOwClNUwd32HlPrjHmr9oIii9qAhlfdyk20c5FBSFX5
 Jn4NeuW9VckXfkTFDYoeIesS1qjTHo4KAfmjJCjQN3LxTzlRPHumEtdHbRGVTQLnBH
 jxe/Sx9N99J3w==
Date: Mon, 13 May 2024 14:30:09 -0500
From: Rob Herring <robh@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: ti: Add schema for AM625 OLDI
 Transmitter
Message-ID: <20240513193009.GA2986074-robh@kernel.org>
References: <20240511193055.1686149-1-a-bhatia1@ti.com>
 <20240511193055.1686149-3-a-bhatia1@ti.com>
 <20240512193459.GF17158@pendragon.ideasonboard.com>
 <e0433619-75c7-40bc-aafb-f0a875ea7dc3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0433619-75c7-40bc-aafb-f0a875ea7dc3@ti.com>
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

On Mon, May 13, 2024 at 02:07:44PM +0530, Aradhya Bhatia wrote:
> Hi Laurent,
> 
> Thank you for reviewing the patches!
> 
> On 13-May-24 01:04, Laurent Pinchart wrote:
> > Hi Aradhya,
> > 
> > Thank you for the patch.
> > 
> > On Sun, May 12, 2024 at 01:00:53AM +0530, Aradhya Bhatia wrote:
> >> Add devicetree binding schema for AM625 OLDI Transmitters.
> >>
> >> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> >> ---
> >>  .../bindings/display/ti/ti,am625-oldi.yaml    | 153 ++++++++++++++++++
> >>  MAINTAINERS                                   |   1 +
> >>  2 files changed, 154 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> >> new file mode 100644
> >> index 000000000000..0a96e600bc0b
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> >> @@ -0,0 +1,153 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/ti/ti,am625-oldi.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Texas Instruments AM625 OLDI Transmitter
> >> +
> >> +maintainers:
> >> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> +  - Aradhya Bhatia <a-bhatia1@ti.com>
> >> +
> >> +description: |
> >> +  The AM625 TI Keystone OpenLDI transmitter (OLDI TX) supports serialized RGB
> >> +  pixel data transmission between host and flat panel display over LVDS (Low
> >> +  Voltage Differential Sampling) interface. The OLDI TX consists of 7-to-1 data
> >> +  serializers, and 4-data and 1-clock LVDS outputs. It supports the LVDS output
> >> +  formats "jeida-18", "jeida-24" and "vesa-18", and can accept 24-bit RGB or
> >> +  padded and un-padded 18-bit RGB bus formats as input.
> >> +
> >> +properties:
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +    description: serial clock input for the OLDI transmitters
> >> +
> >> +  clock-names:
> >> +    const: s_clk
> >> +
> >> +  ti,companion-oldi:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to companion OLDI transmitter. This property is mandatory for the
> >> +      primarty OLDI TX if the OLDI TXes are expected to work either in dual-lvds
> >> +      mode or in clone mode. This property should point to the secondary OLDI
> >> +      TX.
> >> +
> >> +  ti,secondary-oldi:
> >> +    type: boolean
> >> +    description: Boolean property to mark an OLDI TX as secondary node.
> >> +
> >> +  ti,oldi-io-ctrl:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to syscon device node mapping OLDI IO_CTRL registers found in the
> >> +      control MMR region. This property is needed for OLDI interface to work.
> >> +
> >> +  ports:
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port@0:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: Parallel RGB input port
> >> +
> >> +      port@1:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: LVDS output port
> >> +
> >> +    required:
> >> +      - port@0
> >> +      - port@1
> >> +
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        ti,secondary-oldi: true
> >> +    then:
> >> +      properties:
> >> +        ti,companion-oldi: false
> >> +        ti,oldi-io-ctrl: false
> >> +        clocks: false
> >> +        clock-names: false
> >> +
> >> +    else:
> >> +      required:
> >> +        - ti,oldi-io-ctrl
> >> +        - clocks
> >> +        - clock-names
> >> +
> >> +required:
> >> +  - reg
> >> +  - ports
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> >> +
> >> +    oldi_txes {
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +        oldi: oldi@0 {
> >> +            reg = <0>;
> >> +            clocks = <&k3_clks 186 0>;
> >> +            clock-names = "s_clk";
> >> +            ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
> > 
> > What bus does this device live on ? Couldn't the I/O register space be
> > referenced by the reg property ?.
> > 
> 
> These registers are a part of the system-controller register space
> (ctrl_mmr0). The whole register set is owned by the main_conf[0]
> devicetree node, with sub-nodes pointing to specific regions. That's why
> I cannot reference these registers directly.

Then what does 'reg' represent? Looks like you just made up an index. If 
so, then this should probably be a child of &dss_oldi_io_ctrl instead. 
Or it should just be merged into that node.

Rob
