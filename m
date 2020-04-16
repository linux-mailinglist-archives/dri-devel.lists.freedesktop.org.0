Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C6B1ACDAF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 18:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80806E34A;
	Thu, 16 Apr 2020 16:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624196E326
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 16:29:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id BA4EB2A22CA
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: dw_mipi_dsi.txt: convert to yaml
In-Reply-To: <CAL_JsqLyEjXjeADvxztT0kg6Sc-VASUeBPr0jJAwS39PckQjpw@mail.gmail.com>
References: <20200416125207.425271-1-adrian.ratiu@collabora.com>
 <CAL_JsqLyEjXjeADvxztT0kg6Sc-VASUeBPr0jJAwS39PckQjpw@mail.gmail.com>
Date: Thu, 16 Apr 2020 19:30:32 +0300
Message-ID: <87r1wnjsuv.fsf@adirat.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Philippe CORNU <philippe.cornu@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the review, I will address all your points in v2, 
however I have a one neclarity below.

On Thu, 16 Apr 2020, Rob Herring <robh@kernel.org> wrote:
> On Thu, Apr 16, 2020 at 7:51 AM Adrian Ratiu 
> <adrian.ratiu@collabora.com> wrote: 
>> 
>> This converts the Synopsis MIPI DSI binding documentation to 
>> yaml and should be quite straightforward. I've added a missing 
>> ref clk and also added Mark and Rob as maintainers based on 
>> 'get_maintainer.pl' results. 
>> 
>> Cc: Rob Herring <robh@kernel.org> Cc: Mark Rutland 
>> <mark.rutland@arm.com> Cc: devicetree@vger.kernel.org 
>> Suggested-by: Laurent Pinchart 
>> <laurent.pinchart@ideasonboard.com> Signed-off-by: Adrian Ratiu 
>> <adrian.ratiu@collabora.com> --- 
>>  .../bindings/display/bridge/dw_mipi_dsi.txt   | 32 --------- 
>>  .../display/bridge/snps,dw-mipi-dsi.yaml      | 66 
>>  +++++++++++++++++++ 2 files changed, 66 insertions(+), 32 
>>  deletions(-) delete mode 100644 
>>  Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt 
>>  create mode 100644 
>>  Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml 
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt 
>> b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt 
>> deleted file mode 100644 index b13adf30b8d3..000000000000 --- 
>> a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt 
>> +++ /dev/null @@ -1,32 +0,0 @@ -Synopsys DesignWare MIPI DSI 
>> host controller -============================================ - 
>> -This document defines device tree properties for the Synopsys 
>> DesignWare MIPI -DSI host controller. It doesn't constitue a 
>> device tree binding specification -by itself but is meant to be 
>> referenced by platform-specific device tree -bindings.  - -When 
>> referenced from platform device tree bindings the properties 
>> defined in -this document are defined as follows. The platform 
>> device tree bindings are -responsible for defining whether each 
>> optional property is used or not.  - -- reg: Memory mapped base 
>> address and length of the DesignWare MIPI DSI -  host 
>> controller registers. (mandatory) - -- clocks: References to 
>> all the clocks specified in the clock-names property -  as 
>> specified in [1]. (mandatory) - -- clock-names: -  - "pclk" is 
>> the peripheral clock for either AHB and APB. (mandatory) -  - 
>> "px_clk" is the pixel clock for the DPI/RGB input. (optional) - 
>> -- resets: References to all the resets specified in the 
>> reset-names property -  as specified in [2]. (optional) - -- 
>> reset-names: string reset name, must be "apb" if 
>> used. (optional) - -- panel or bridge node: see 
>> [3]. (mandatory) - -[1] 
>> Documentation/devicetree/bindings/clock/clock-bindings.txt -[2] 
>> Documentation/devicetree/bindings/reset/reset.txt -[3] 
>> Documentation/devicetree/bindings/display/mipi-dsi-bus.txt diff 
>> --git 
>> a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml 
>> b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml 
>> new file mode 100644 index 000000000000..0ab4125eee30 --- 
>> /dev/null +++ 
>> b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml 
>> @@ -0,0 +1,66 @@ +# SPDX-License-Identifier: (GPL-2.0-only OR 
>> BSD-2-Clause) +%YAML 1.2 +--- +$id: 
>> http://devicetree.org/schemas/display/bridge/snps,dw-mipi-dsi.yaml# 
>> +$schema: http://devicetree.org/meta-schemas/core.yaml# + 
>> +title: Synopsys DesignWare MIPI DSI host controller + 
>> +maintainers: +  - Rob Herring <robh+dt@kernel.org> 
> 
> No thanks, I don't know anything about this hardware. It should 
> be the owner for this binding, not who applies patches. 
>

Sorry about that, I just followed what get_maintainer.pl -f 
returned.

I'm not sure I understand the owner vs maintainers difference for 
the "maintainers" entry. How do I find out who is the owner?

Looking at the git log, this file was touched only once when added 
in 88dd1e6f9ad8 ("dt-bindings: display: Add Synopsys DW MIPI DSI 
host controller") by Philippe CORNU <philippe.cornu@st.com>.

Is the person who added the file automatically owner?

(cc'd Philippe)
 
>> +  - Mark Rutland <mark.rutland@arm.com> 
> 
> Check current maintainers. Mark is not one anymore. 
>

Yes, I just noticed he got removed in my latest next-20200416 
tree, thanks.

>> +
>> +description: |
>> +  This document defines device tree properties for the Synopsys DesignWare MIPI
>> +  DSI host controller. It doesn't constitue a device tree binding specification
>> +  by itself but is meant to be referenced by platform-specific device tree
>> +  bindings.
>> +
>> +  When referenced from platform device tree bindings the properties defined in
>> +  this document are defined as follows. The platform device tree bindings are
>> +  responsible for defining whether each property is required or optional.
>> +
>
> Need to reference ($ref) dsi-controller.yaml here.
>
>> +properties:
>> +  reg:
>> +    description: |
>> +      Memory mapped base address and length of the DesignWare MIPI DSI host
>> +      controller registers.
>
> Drop the description. That's every 'reg'. You need to say how many
> regions (maxItems: 1?).
>
>> +
>> +  clocks:
>> +    description: |
>> +      References to all the clocks specified in the clock-names property as
>> +      specified in Documentation/devicetree/bindings/clock/clock-bindings.txt
>
> Drop
>
>> +    items:
>> +      - description: Module clock
>> +      - description: DSI bus colck for either AHB and APB
>
> typo
>
>> +      - description: Pixel clock for the DPI/RGB input
>> +    minItems: 2
>> +    maxItems: 3
>
> You can drop 'maxItems'. It's implied by the length of 'items'.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +      - const: pclk
>> +      - const: px_clk
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +  resets:
>> +    description: |
>> +      References to all the resets specified in the reset-names property as
>> +      specified in Documentation/devicetree/bindings/reset/reset.txt
>
> Drop.
>
> You need maxItems to define how many reset entries.
>
>> +
>> +  reset-names:
>> +    const: apb
>> +
>> +patternProperties:
>> +  "^panel@[0-3]$":
>> +    type: object
>> +    description: |
>> +      A node containing the panel or bridge description as documented in
>
> bridge? But the node name says panel only.
>
>> +      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
>
> Drop description.
>
>> +
>> +required:
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> --
>> 2.26.0
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
