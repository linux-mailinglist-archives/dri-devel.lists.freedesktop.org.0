Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BDAA00C83
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 18:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FA310E439;
	Fri,  3 Jan 2025 17:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HsMI649l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1560610E439
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 17:04:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B68C55C648E;
 Fri,  3 Jan 2025 17:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D73C4CECE;
 Fri,  3 Jan 2025 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735923861;
 bh=SByc/N9How7/ZDztUDiEHkrbYTvlWlG9S5ZZuJl3oCs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HsMI649l/0xtPdAR6zjaBtsHAX7rIhwaFNEqMZpEtH42TwOX/Y3ojO+JoKCoGMgAv
 5Y1coZRBAlCKngjTtuxVn/dTSYogZZAm34hPPUvuDrVczvhbRPU6wfhWffH2Wd5o7X
 XzleAc7/aSl323IUfTL+7TSFJ4mE+IgE5uUGmTxhbkE9rWjlTopjg6mNnn6VAZsEM5
 fbujuA3wD668iSYJEO5u1WgRum7FU80AV7GzT4rue5dKXYy/Y1y134UCVfkN/SZNz4
 dRMwIrzFeu+uW571YRlF7t7LMoXPurSYO6nPiLKM4foZXUhVYKPxiN4fIUxjXOFwNl
 J7AxscPdUOdAQ==
Message-ID: <6adfa5fe-7b68-4f8e-919d-7b7607fe617c@kernel.org>
Date: Fri, 3 Jan 2025 18:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mchehab@kernel.org"
 <mchehab@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
 <yg7b2iaz53avd7gpvuewhi6b3myh6owls3dt2hzpqc26lnykjf@tpu2vxqqkipe>
 <11f168c11b4cea48cf51406c0afaf8f1f53ad90f.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <11f168c11b4cea48cf51406c0afaf8f1f53ad90f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 30/12/2024 10:23, Jason-JH Lin (林睿祥) wrote:
> Hi Krzysztof,
> 
> On Fri, 2024-12-27 at 09:13 +0100, Krzysztof Kozlowski wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On Fri, Dec 20, 2024 at 01:07:54AM +0800, Jason-JH.Lin wrote:
>>>    2) GCE Subsys ID:
>>>    - Defined in the header file: `#define SUBSYS_1c00XXXX 3`
>>>    - Used in the Device Tree:
>>>       `mediatek,gce-client-reg = <&gce SUBSYS_1c00XXXX 0x0000
>>> 0x1000>;`
>>>    - Parsed and used in the driver to configure subsys ID:
>>>      ```c
>>>      int cmdq_dev_get_client_reg(struct device *dev,
>>>                                struct cmdq_client_reg *client_reg,
>>>                                int idx)
>>>      {
>>>       client_reg->subsys = (u8)spec.args[0];
>>>       client_reg->offset = (u16)spec.args[1];
>>>      }
>>>      // GCE write the value to the register 0x1c000000 + 0x0000 +
>>> offset
>>>      cmdq_pkt_write(cmdq_handle, client_reg->subsys,
>>>                   client_reg->offset + offset, value);
>>
>> This is a proof that SUBSYS_1300XXXX is not a binding. Your driver
>> does
>> not use it.
>>
>> Drop all such things which are not used by drivers or explain why
>> they
>> are needed to be in the binding - what do they bind.
>>
>> I asked for this already, for exactly the same thing.
>>
>>
>> I did not check the rest, so next time I will choose any other random
>> define and if I do not find it explained nor used, I will question
>> it.
>> Because you tend to apply pieces of review instead of really change
>> your
>> code.
> 
> Please forgive me for putting a lot of redundant message. I just want
> to provide as much detail as possible to help you determine if they are
> bindings. I appreciate your guidance and will make the necessary
> adjustments.
> 
> 
> I checked the clk header you accepted before:
> https://lore.kernel.org/all/402ac5a2-334e-1843-0517-5ecf61f6a965@linaro.org/

With arguments like "someone, somewhere acked this, so I am allowed as
well to send it" you enter tricky grounds.

> 
> Please don't mind me to make a confirmation here because I can't find
> the documentation of the definition for binding header.
> Do you mean all the header defined in include/dt-bindings/* should be
> used in a specific driver and the DTS in the same time?

Yes, otherwise how is it abstraction?

There are numerous exceptions of course when binding binds different
pieces of software/firmware. Is that the case? Nothing in commit msg
explained this.

> 
> Take the `#define CLK_TOP_AXI` and `#define CLK_TOP_VPP` in
> mediatek,mt8188-clk.h for example:
> 
> `CLK_TOP_AXI` is used in the drivers/clk/mediatek/clk-mt8188-topckgen.c
> but not in arch/arm64/boot/dts/mediatek/mt8188.dtsi:
> ```
>   #include <dt-bindings/clock/mediatek,mt8188-clk.h>
> 
>   ...
> 
>   static const struct mtk_mux top_mtk_muxes[] = {
> 	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_AXI, "top_axi",
> axi_parents,
> 				   0x020, 0x024, 0x028, 0, 4, 7, 0x04,
>   ...
> 	
> 	MUX_GATE_CLR_SET_UPD(CLK_TOP_VPP, "top_vpp",
> 			     vpp_parents, 0x02C, 0x030, 0x034, 0, 4,
> 7, 
>   ...
> ```
> 
> and `CLK_TOP_VPP` is used in the both clk-mt8188-topckgen.c and
> mt8188.dtsi:
> ```
>   power-domain@MT8188_POWER_DOMAIN_VPPSYS0 {
>   	reg = <MT8188_POWER_DOMAIN_VPPSYS0>;
> 	clocks = <&topckgen CLK_TOP_VPP>,
> 		 <&topckgen CLK_TOP_CAM>,
> ...
> ```
> 
> But it seems that both of `CLK_TOP_AXI` and `CLK_TOP_VPP` are regarded
> as binding headers.

I don't get the comparisons. Both constants represent abstraction, so
they are correct.


> 
> 
> From the previous description of the example you gave me:
> Bindings are imaginary numbers starting from 0 or 1 which are used
> between drivers and DTS, serving as abstraction layer (or abstraction
> values) between these two.

Exactly, what to say more?

> 
> As I understand, each clock definition corresponds to the clock CG
> settings provided to different hardware, and each hardware driver can
> control its own clock CG through the CCF to control their CG in clock
> driver. So they can be an abstraction values between driver and DTS.
> 
> Similarly, the GCE subsys ID and GCE event ID correspond to symbols
> used by GCE to control various hardware, and each hardware driver can
> use these IDs to generate commands buffer for GCE through the API
> provided by the GCE driver and achieve the desired control over their
> hardware.

So are they abstract or not? Then use some different values, really
abstract.

I brought you definition: abstract. You now cited it. But last paragraph
entirely skips this point.


> 
> I guess the difference is that the clock driver has a platform-specific
> clock table to store these binding headers, while the GCE driver does
> not have a platform-specific thread priority table, subsys ID table,
> and event ID table. Instead, the GCE client drivers can directly obtain
> their respective hardware settings from the DTS.
> 
> On the other hand, definitions like CLK_TOP_MAINPLL_D3,
> CLK_TOP_MAINPLL_D4, etc., correspond to different clock frequency
> divider levels, and the CMDQ_THR_PRIO_X for GCE thread priority also
> corresponds to different priority levels for GCE threads. Therefore, I
> am not quite sure why GCE thread priority cannot be considered a
> binding when it is also a symbol number for a hardware level setting.

Well, maybe nothing here is a binding. I took one thing to inspect. I
did not inspect the rest. How does it help your case?


> 
> 
> If the condition for becoming a binding header is that it `must` be
> used by a specific driver, such as a platform-specific table, then I

No, "used by the driver" is indication that you use it as abstraction.

> will remove the entire GCE dt-binding header. Because the current usage
> of these definitions is that each GCE client drivers can directly store
> these GCE definitions through the DTS, just like IRQ IDs, and without
> the need for an additional table defined by the GCE driver.

Do you store IRQ IDs as binding constants in binding headers? No. Why?

Before proceeding with this header further, please answer to above - why
interrupt numbers, MMIO addresses and some other values appearing in DTS
are not used like "binding headers".


Best regards,
Krzysztof
