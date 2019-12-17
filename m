Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB82124135
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728146E231;
	Wed, 18 Dec 2019 08:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2416E051
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576605723;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=BCgViyEUHggaH/2A66pubiKAk00tvESIUfyUxBf6x1Q=;
 b=aeac+ebyNJCfCxM/tJjVgtrZUprfc918VBs9hx5F+AnqovnH0intbvhxRadv28dubl
 agua6c5jfLZSJJ10+cAir7wpkzqJDSmJePPDilAO7ggkw5Adi2uoEWCKe34VMnsxFQsq
 Xf8lrJb4Ivcoz/FSSHamPL9Ev9btVlC8x6OSfVCAF/5r3UaznYaGvv4FpaAR7WoIjk7u
 Vb3qQe7q1WAy0lG/DCX0wGOwJEco+BhLNCrFGH8RAoD2UcS0AI3UCF4FwNlRxu9Om+M0
 KmrgiEMlO2Dx2WXkaY7cOIUM+9k7y1C5vd5CGugfY7qHvQmI2Zh05vT9rKvVwHNI/sn+
 moVw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWeXA4JZbo="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
 with ESMTPSA id q020e2vBHI1h2dM
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 17 Dec 2019 19:01:43 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3 1/8] dt-bindings: add img,
 pvrsgx.yaml for Imagination GPUs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191205170113.GA853@bogus>
Date: Tue, 17 Dec 2019 19:01:42 +0100
Message-Id: <A9C93118-7E78-4910-8446-AF1E7827C23E@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
 <c93eff41b4a85ec01fa01819af8a380b7465e01c.1574595627.git.hns@goldelico.com>
 <20191205170113.GA853@bogus>
To: Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
 letux-kernel@openphoenux.org, Paul Burton <paulburton@kernel.org>,
 David Airlie <airlied@linux.ie>, James Hogan <jhogan@kernel.org>,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,
sorry for the delay. I wanted to wait for v5.5-rc1 and it did take longer...

> Am 05.12.2019 um 18:01 schrieb Rob Herring <robh@kernel.org>:
> 
> On Sun, Nov 24, 2019 at 12:40:21PM +0100, H. Nikolaus Schaller wrote:
>> The Imagination PVR/SGX GPU is part of several SoC from
>> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo
>> and others.
>> 
>> With this binding, we describe how the SGX processor is
>> interfaced to the SoC (registers, interrupt etc.).
>> 
>> In most cases, Clock, Reset and power management is handled
>> by a parent node or elsewhere.
>> 
>> Tested by make dt_binding_check dtbs_check
>> 
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 83 +++++++++++++++++++
>> 1 file changed, 83 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> new file mode 100644
>> index 000000000000..fe206a53cbe1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license new bindings: (GPL-2.0-only OR BSD-2-Clause)

What are the consequences?

> 
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Imagination PVR/SGX GPU
>> +
>> +maintainers:
>> +  - H. Nikolaus Schaller <hns@goldelico.com>
>> +
>> +description: |+
>> +  This binding describes the Imagination SGX5 series of 3D accelerators which
>> +  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
>> +  Allwinner A83, and Intel Poulsbo and CedarView and more.
>> +
>> +  For an almost complete list see: https://en.wikipedia.org/wiki/PowerVR#Implementations
>> +  
>> +  Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently covered by
>> +  this binding but the extension of the pattern is straightforward.
>> +  
>> +  The SGX node is usually a child node of some DT node belonging to the SoC
>> +  which handles clocks, reset and general address space mapping of the SGX
>> +  register area.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +    # BeagleBoard ABC, OpenPandora 600MHz
> 
> I'd expect compatibles to be per SoC, not per board.

Yes.

The boards are examples I can test, but any board with the same SoC should work.
I have added "Example: " in front of all these comments.

> 
>> +      - ti,omap3-sgx530-121, img,sgx530-121, img,sgx530, img,sgx5
> 
> 4 compatibles is probably a bit much. Are there not any version or 
> feature registers that some of this could be detected?

Well, there are hints that they exist but there is no good documentation
about it. This means that at the moment the user-space must be able to
identify the correct blobs that are to be used for a specific SoC. And
we need different variants compiled as .ko and loaded on demand.

The first one is also used to match different .ko builds from the same
source tree with different macro definitions for the individual SoC.

It may be possible that we end up in a more generic driver that only matches
on one of the second to fourth compatible record, and asks runtime API about
the SoC, but at the moment this does not exist.

> If there are, I'd 
> assume the middle 2 strings could be dropped. If not, drop the last one 
> and just match on the 3rd string. It's not a long list.

The fourth one is intended to be able distinguish between sgx5 and sgx6.

I also found that I have not defined it in most of the device tree patches.

But yes, we can drop it since AFAIK there are no activities for sgx6.
And if they start, we can update bindings and boards.


> 
>> +    # BeagleBoard XM, GTA04, OpenPandora 1GHz
>> +      - ti,omap3-sgx530-125, img,sgx530-125, img,sgx530, img,sgx5
>> +    # BeagleBone Black
>> +      - ti,am3352-sgx530-125, img,sgx530-125, img,sgx530, img,sgx5
>> +    # Pandaboard, Pandaboard ES
>> +      - ti,omap4-sgx540-120, img,sgx540-120, img,sgx540, img,sgx5
>> +      - ti,omap4-sgx544-112, img,sgx544-112, img,sgx544, img,sgx5
>> +    # OMAP5 UEVM, Pyra Handheld
>> +      - ti,omap5-sgx544-116, img,sgx544-116, img,sgx544, img,sgx5
>> +      - ti,dra7-sgx544-116, img,sgx544-116, img,sgx544, img,sgx5
>> +    # CI20
>> +      - ingenic,jz4780-sgx540-120, img,sgx540-120, img,sgx540, img,sgx5
>> +    # the following entries are not validated with real hardware
>> +    # more TI
>> +      - ti,am3517-sgx530-125, img,sgx530-125, img,sgx530, img,sgx5
>> +      - ti,am4-sgx530-125, img,sgx530-125, img,sgx530, img,sgx5
>> +      - ti,ti81xx-sgx530-125, img,sgx530-125, img,sgx530, img,sgx5
>> +    # Banana-Pi-M3 (Allwinner A83T)
>> +      - allwinner,sun8i-a83t-sgx544-116, img,sgx544-116, img,sgx544, img,sgx5
>> +    # Atom Z5xx
>> +      - intel,poulsbo-gma500-sgx535, img,sgx535-116, img,sgx535, img,sgx5
>> +    # Atom Z24xx
>> +      - intel,medfield-gma-sgx540, img,sgx540-116, img,sgx540, img,sgx5
>> +    # Atom N2600, D2500
>> +      - intel,cedarview-gma3600-sgx545, img,sgx545-116, img,sgx545, img,sgx5
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: physical base address and length of the register area
> 
> No need to give a generic description of a standard property.

Ok. Dropped.

> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: interrupt line from SGX subsystem to core processor
> 
> Same here.

Ok. Dropped.

> 
>> +
>> +  clocks:
>> +    description: optional clocks
> 
> Need to define how many and what they are. Or drop until you know.

It differs depending on the integration of the SoC. OMAP does not need
any clock defintions on the gpu node (clocks are handled by sysc parent)
while JZ4780 needs one (at least in the v3.18 vendor kernel with working
SGX).

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
> 
> Add:
> 
> additionalProperties: false

Ok.

> 
>> +
>> +examples:
>> +  - |+
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    gpu@fe00 {
>> +      compatible = "ti,omap-omap5-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5";
>> +      reg = <0xfe00 0x200>;
>> +      interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>> +    };
>> +
>> +...
>> -- 
>> 2.23.0
>> 

[PATCH v4] coming.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
