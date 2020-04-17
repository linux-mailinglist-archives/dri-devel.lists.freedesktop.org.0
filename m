Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC31AEB38
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1AD6E444;
	Sat, 18 Apr 2020 09:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4B06E402
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 12:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587125793;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/7wrW+vEcFP2PmT/hlYc+qdlh6LxN2NKNrBMs+kwhos=;
 b=NO2PxwvFz6HQ6bZnc23r/szciTs22lwVxCJCQn5fLAK+HYMaIluSiJEfsoxD3Q2urc
 xAXm3osqGay8DjzgM6wXvoSDYkbPQADgIivoy1C9O+7KPg52VR336VgG8qiBIGK3c5cL
 wcqnmG88eYcnyVdsXixMB7NFHuTn3JH4sZElFJirCf6i1epAMpgMwcrJR8kTzh2kFYZs
 bBHGWH6OpWIpX/m7D122oBq7kO164uHX9Oj5BV3z2jyfM6b0W4/DCvJ4pBAnB+lp4RCz
 VkmJvypGfALvZOYk7vT45W9gMg0j95h84ZisEqW3kOVbxsWhaM07DKtO8roI2mZPnP/b
 KqfA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
 with ESMTPSA id g06d2dw3HCFt1cA
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 17 Apr 2020 14:15:55 +0200 (CEST)
Subject: Re: [PATCH v6 01/12] dt-bindings: add img,
 pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200417102500.erayf6quenp3cvn3@gilmour.lan>
Date: Fri, 17 Apr 2020 14:15:44 +0200
Message-Id: <C8816F10-8773-4ECD-B42D-6EEF642476EB@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
 <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan>
 <72919514-0657-4B71-902F-3E775E528F64@goldelico.com>
 <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com>
 <535CAEBE-F43E-4BFC-B989-612C81F0D7EF@goldelico.com>
 <20200415142124.yzfh6mtqq7cdq22e@gilmour.lan>
 <DC0A2DE2-3D77-46F8-8DE1-55050FDACC9B@goldelico.com>
 <20200415162151.rwym4ioqz27migfn@gilmour.lan>
 <45F411C0-150B-4FBA-A0E1-B863B3F36DF6@goldelico.com>
 <20200417102500.erayf6quenp3cvn3@gilmour.lan>
To: Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

> Am 17.04.2020 um 12:25 schrieb Maxime Ripard <maxime@cerno.tech>:
> 
> Hi,
> 
> On Wed, Apr 15, 2020 at 06:42:18PM +0200, H. Nikolaus Schaller wrote:
>>> Am 15.04.2020 um 18:21 schrieb Maxime Ripard <maxime@cerno.tech>:
>>> 
>>> On Wed, Apr 15, 2020 at 05:09:45PM +0200, H. Nikolaus Schaller wrote:
>>>> Hi Maxime,
>>>> 
>>>> Hm. Yes. We know that there likely are clocks and maybe reset
>>>> but for some SoC this seems to be undocumented and the reset
>>>> line the VHDL of the sgx gpu provides may be permanently tied
>>>> to "inactive".
>>>> 
>>>> So if clocks are optional and not provided, a driver simply can assume
>>>> they are enabled somewhere else and does not have to care about. If
>>>> they are specified, the driver can enable/disable them.
>>> 
>>> Except that at the hardware level, the clock is always going to be
>>> there. You can't control it, but it's there.
>> 
>> Sure, we can deduce that from general hardware design knowledge.
>> But not every detail must be described in DT. Only the important
>> ones.
>> 
>>>>> If OMAP is too much of a pain, you can also make
>>>>> a separate binding for it, and a generic one for the rest of us.
>>>> 
>>>> No, omap isn't any pain at all.
>>>> 
>>>> The pain is that some other SoC are most easily defined by clocks in
>>>> the gpu node which the omap doesn't need to explicitly specify.
>>>> 
>>>> I would expect a much bigger nightmare if we split this into two
>>>> bindings variants.
>>>> 
>>>>> I'd say that it's pretty unlikely that the clocks, interrupts (and
>>>>> even regulators) are optional. It might be fixed on some SoCs, but
>>>>> that's up to the DT to express that using fixed clocks / regulators,
>>>>> not the GPU binding itself.
>>>> 
>>>> omap already has these defined them not to be part of the GPU binding.
>>>> The reason seems to be that this needs special clock gating control
>>>> especially for idle states which is beyond simple clock-enable.
>>>> 
>>>> This sysc target-module@56000000 node is already merged and therefore
>>>> we are only adding the gpu child node. Without defining clocks.
>>>> 
>>>> For example:
>>>> 
>>>> 		sgx_module: target-module@56000000 {
>>>> 			compatible = "ti,sysc-omap4", "ti,sysc";
>>>> 			reg = <0x5600fe00 0x4>,
>>>> 			      <0x5600fe10 0x4>;
>>>> 			reg-names = "rev", "sysc";
>>>> 			ti,sysc-midle = <SYSC_IDLE_FORCE>,
>>>> 					<SYSC_IDLE_NO>,
>>>> 					<SYSC_IDLE_SMART>;
>>>> 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>>>> 					<SYSC_IDLE_NO>,
>>>> 					<SYSC_IDLE_SMART>;
>>>> 			clocks = <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
>>>> 			clock-names = "fck";
>>>> 			#address-cells = <1>;
>>>> 			#size-cells = <1>;
>>>> 			ranges = <0 0x56000000 0x2000000>;
>>>> 
>>>> 			gpu: gpu@0 {
>>>> 				compatible = "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544";
>>>> 				reg = <0x0 0x10000>;
>>>> 				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>>>> 			};
>>>> 		};
>>>> 
>>>> The jz4780 example will like this:
>>>> 
>>>> 	gpu: gpu@13040000 {
>>>> 		compatible = "ingenic,jz4780-sgx540-130", "img,sgx540-130", "img,sgx540";
>>>> 		reg = <0x13040000 0x4000>;
>>>> 
>>>> 		clocks = <&cgu JZ4780_CLK_GPU>;
>>>> 		clock-names = "gpu";
>>>> 
>>>> 		interrupt-parent = <&intc>;
>>>> 		interrupts = <63>;
>>>> 	};
>>>> 
>>>> So the question is which one is "generic for the rest of us"?
>>> 
>>> I'd say the latter.
>> 
>> Why?
>> 
>> TI SoC seem to be the broadest number of available users
>> of sgx5xx in the past and nowadays. Others are more the exception.
> 
> And maybe TI has some complicated stuff around the GPU that others don't have?

Looks so.

> If I look quickly at the Allwinner stuff, I see nothing looking alike in the
> SoC, so making the binding like that for everyone just because TI did something
> doesn't really make much sense.

That is why I propose to make the clocks optional. This solves both
cases in a simple and neat way.

> 
>>> If your clock is optional, then you define it but don't mandate
>>> it. Not documenting it will only result in a mess where everyone will
>>> put some clock into it, possibly with different semantics each and
>>> every time.
>> 
>> So you mean that we should require a dummy clock for the omap gpu node
>> or did I misunderstand that?
>> 
>> Well, yes there is of course a clock connection between the
>> omap target-module and the sgx but it is IMHO pointless to
>> describe it because it can't and does not need to be controlled
>> separately.
>> 
>> As said the target-module is already accepted and upstream and my
>> proposal is to get the gpu node described there. There is simply
>> no need for a clocks node for the omap.
> 
> There is no need for a clocks property *currently* *on the OMAP*.

Yes. But why "currently"? Do you think the OMAPs we already have
defined and tested will change?

> 
>> What I also assume is that developers of DTS know what they do.
>> So the risk that there is different semantics is IMHO very low.
> 
> Well, they know what they do if you document the binding. Let's say I have two
> clocks now on my SoC, and you just document that you want a clocks property,
> with a generic name in clock-names like "gpu".

Yes, that is what I want to propose for v7:

  clocks:
    maxItems: 1

  clock-names:
    maxItems: 1
    items:
      - const: gpu

> 
>> If you agree I can add the clocks/clock-names property as an
>> optional property. This should solve omap and all others.
> 
> With the above example, what clock should I put in there? In which order? This
> isn't some random example pulled out of nowhere. The Allwinner A31 has (at
> least) 4 clocks for the GPU, 1 reset line and 1 regulator, so I can only assume
> that the GPU actually needs at least that amount to be properly integrated into
> an SoC.

Ah, now I understand your motivation: you have access and experience with
the A31 and you know that our proposal doesn't fit to it.

From what I know from your description is that the A31 is quite special with
4 GPU clocks... Are they all really for the GPU or 3 of them for the interface
logic (like on OMAP which separates between "functional clocks" and "interface
clocks")? Or are there 4 groups of GPU cores with a separate clock for each one?

So what would be your proposal for the A31 DT?

Then I get a chance to compare DT snippets and try to make a mixture for
the bindings.

> 

>>> This has nothing to do with the binding being complete. And if you use
>>> a binding like this one, you'll be severely limited when you'll want
>>> to implement things like DVFS.
>> 
>> Now you have unhooked me... Nobody seems to know if and how DVFS can be
>> applied to SGX. IMHO we should bake small bread first and get initial
>> support into mainline.
> 
> On the software side, yes, of course. But the discussion here doesn't have much
> to do with software support, this is about the hardware. No matter if you enable
> DVFS or not, you'll have those resources connected to the GPU.
> 
> And if you want to enable the strict minimum in DT for now and expand it later
> as the software gains support for more stuff, then you'll have to deal with the
> minimal stuff in software later-on to keep the backward compatibility.

That is IMHO common practise everywhere. Sometimes you even have to adapt
years old DT to new limitations of the drivers (this happened recently for
combination of SPI and GPIO). 

And you can still write two different drivers for a single bindings document
or use the .data field of the compatibility table. And I think clocks and regulators
can also be referenced by name if they are not defined in DT. This is not a
"single variety" style, but a potential solution.

What I want to say: there are many roads to Rome.

> But given that the current state on the Allwinner SoCs (at least) is that you
> can't even read a register, it might be a good idea to delay the introduction of
> that binding until you have something that works to avoid drowning under the
> number of special cases to deal with backward compatibility.

Philipp has something minimal working on the A83 which works with the proposed
binding and enabled him to read out the sgx revision register.

So if you are a specialist for the A31 SGX, please make a proposal for a binding
that covers all the A31 needs and all other SoC we know. Or define a separate
bindings for the A31.

Thank you very much,
Nikolaus Schaller

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
