Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E394640514
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08FE10E6C8;
	Fri,  2 Dec 2022 10:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E3010E012
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:26:28 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 318D22D9;
 Thu,  1 Dec 2022 10:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669886787;
 bh=xt+nYBG9p2F7Ov7TXjZkZafslLalNsVFj5Rxf5PFRAA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hmgrznQNc+PJ5JstFF7M7yPl/IOGPw19T3IfwFXPzGYcdWYn3PwF07QFofkeYOOgA
 CROgul+H8b2jnVWm2HsAMVn76gytOVSjYN+AxlDF0oZUQYZnVsepUzbBy5ChjzGJtK
 /msJnOvdo2z/xw5LugwihELPWCFboauYcceHxXQ8=
Message-ID: <5598c7f8-b47e-338d-e2e3-f62a44903634@ideasonboard.com>
Date: Thu, 1 Dec 2022 11:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/7] clk: renesas: r8a779g0: Add display related clocks
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221123065946.40415-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221123065946.40415-4-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdUjCS6q44XmTanu=R68GyuVECLa0B-1AFg1CUD_oV4DuA@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <CAMuHMdUjCS6q44XmTanu=R68GyuVECLa0B-1AFg1CUD_oV4DuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 02 Dec 2022 10:48:00 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert, Laurent,

On 30/11/2022 21:18, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Wed, Nov 23, 2022 at 8:00 AM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>> Add clocks related to display which are needed to get the DSI output
>> working.
>>
>> Extracted from Renesas BSP tree.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
>> +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
>> @@ -145,6 +145,8 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
>>          DEF_FIXED("viobusd2",   R8A779G0_CLK_VIOBUSD2,  CLK_VIO,        2, 1),
>>          DEF_FIXED("vcbus",      R8A779G0_CLK_VCBUS,     CLK_VC,         1, 1),
>>          DEF_FIXED("vcbusd2",    R8A779G0_CLK_VCBUSD2,   CLK_VC,         2, 1),
>> +       DEF_FIXED("dsiref",     R8A779G0_CLK_DSIREF,    CLK_PLL5_DIV4,  48, 1),
>> +       DEF_DIV6P1("dsiext",    R8A779G0_CLK_DSIEXT,    CLK_PLL5_DIV4,  0x884),
>>
>>          DEF_GEN4_SDH("sd0h",    R8A779G0_CLK_SD0H,      CLK_SDSRC,         0x870),
>>          DEF_GEN4_SD("sd0",      R8A779G0_CLK_SD0,       R8A779G0_CLK_SD0H, 0x870),
>> @@ -161,6 +163,14 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
>>          DEF_MOD("avb0",         211,    R8A779G0_CLK_S0D4_HSC),
>>          DEF_MOD("avb1",         212,    R8A779G0_CLK_S0D4_HSC),
>>          DEF_MOD("avb2",         213,    R8A779G0_CLK_S0D4_HSC),
>> +
> 
> Weird horizontal and vertical spacing below...
> 
>> +       DEF_MOD("dis0",                 411,    R8A779G0_CLK_S0D3),
> 
> I doubt this parent clock is correct.
> Based on Table 8.1.4e ("Lists of CPG clocks generated from PLL5"),
> this should be one of the VIOBUS clocks.
> VIOBUSD2 has the same rate as S0D3, so I'd use that one.
> 
>> +       DEF_MOD("dsitxlink0",           415,    R8A779G0_CLK_DSIREF),
>> +       DEF_MOD("dsitxlink1",           416,    R8A779G0_CLK_DSIREF),

Now that you started questioning about the clocks, I started to wonder 
about the DSI clocks. They don't quite make sense to me, but here also I 
just assumed it's "fine" as I copied it and it works.

The VIOBUS & VIOBUSD2 are marked to as going to the DSI. But we don't 
actually mark any of the DSI clocks as coming from those sources.

DSIREF is quite clear, it's the source for DSI PLL.

DSIEXT goes to the DSI PHY and is also marked to be used for LP-TX.

In the DT we have now:

clocks = <&cpg CPG_MOD 415>,
	 <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
	 <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
clock-names = "fck", "dsi", "pll";

The "dsi" clock name is a bit vague, but maybe it's "not fclk, not pll, 
but still needed for dsi"? =)

Is it ok to refer to DSIEXT & DSIREF like that, or should they be in the 
r8a779g0_mod_clks list? Or is that list for fclks only?

So the fclk in the dts is mod clock 415 (416 for the second dsi), which 
is dsitxlink0 or dsitxlink1. Well, those names don't quite make sense if 
it's a fclk.

I would rename those clocks to "dsi0" and "dsi1", and source them from 
R8A779G0_CLK_VIOBUSD2, similarly to the other video clocks.

Does the above make sense?

  Tomi

