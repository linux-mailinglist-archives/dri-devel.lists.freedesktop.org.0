Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8074B5353B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FC810EB43;
	Thu, 11 Sep 2025 14:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kpzjQl4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A81410EB43
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:26:34 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA8114A4;
 Thu, 11 Sep 2025 16:25:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1757600718;
 bh=qReZW+H6OyZz2AFMbvTmZJxvwut6V42yTPOtJKgTkkU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kpzjQl4gHzaXfBaGIdp3zuciJs1QF8I/wYVcHwLnl59KOl7jEas+jL5LeJ96wC5Ub
 zGuq1AJN7MzcYbfZTRr8d+DxG8OQJKotvXXy/fday67G0eqfN0+IJ1Yxa4Hjt8sAVI
 qjKQNZLyubtI9u63SW/VYvSbd4XDTS7yEGqj8nBg=
Message-ID: <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com>
Date: Thu, 11 Sep 2025 17:26:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com>
 <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
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

Hi,

On 11/09/2025 11:14, Lad, Prabhakar wrote:
> Hi Tomi,
> 
> On Wed, Sep 10, 2025 at 1:30 PM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>>
>> Hi,
>>
>> On 03/09/2025 19:17, Prabhakar wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Add support for PLLDSI and PLLDSI divider clocks.
>>>
>>> Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and share
>>> PLLDSI related data structures, limits, and algorithms between the
>>> RZ/V2H(P) CPG and DSI drivers.
>>>
>>> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly
>>> different parameter limits and omits the programmable divider present in
>>> CPG. To ensure precise frequency calculations, especially for milliHz-level
>>> accuracy needed by the DSI driver, the shared algorithm allows both drivers
>>> to compute PLL parameters consistently using the same logic and input
>>> clock.
>>
>> Can you elaborate a bit more why a new clock APIs are needed for the DSI
>> PLL? This is the first time I have heard a DSI TX (well, any IP) require
>> more precision than Hz. Is that really the case? Are there other reasons?
>>
> Im pasting the same reply from Fab
> (https://lore.kernel.org/all/TYCPR01MB12093A7D99392BC3D6B5E5864C2BC2@TYCPR01MB12093.jpnprd01.prod.outlook.com/#t)
> for the similar concern.
> 
> The PLL found inside the DSI IP is very similar to the PLLDSI found in
> the CPG IP block, although the limits for some of the parameters are

Thanks. As discussed on chat, this confused me: There's a PLLDSI on CPG,
which doesn't provide a DSI clock, but a pixel clock. And then there's a
PLL in the DSI D-PHY which provides the DSI clock.

A few comments overall some for this driver but also the dsi driver:

This hardcodes the refclk rate to 24 MHz with RZ_V2H_OSC_CLK_IN_MEGA in
the header file. That doesn't feel right, shouldn't the refclk rate come
from the clock framework with clk_get_rate()?

While not v2h related, I think it would be good to have a comment in the
dsi driver about how the g2l hs clock rate is derived directly from the
pixel clock.

I still don't see why all the code here has to be in a header file.
Usually headers contain only a few lines of inline code. Is there a
reason why it's not in a .c file?

And last, we discussed the milliHz a bit on chat, you said you'll come
back to that. I don't think it's a blocker, but I'm very curious why
exactly it is needed in the DSI. +/- 12 Hz with, say 3.6GHz clock does
not sound very much to me, and there should be enough time every line
during blanking period to empty any fifos and "catch up".

In fact, if the DSI is so picky about the rate, I find the HW design
odd: in g2l the pixel clock and the DSI clock come from a single source,
which keeps them neatly in sync. If that is required, why change the
design here so that the DSI PLL is independent of the pixel clock, yet
still the DSI PLL must be programmed to be exactly matched to the pixel
clock.

The docs say v2h supports burst mode. Isn't the idea with DSI burst mode
that you run the DSI much faster than the display controller (i.e. with
much higher clock than HSFREQ = (VCLK * bpp) / num_lanes), so that the
DSI can burst the data out from its fifos and then go to sleep? The
separate PLL in v2h allows independent DSI clock config, allowing burst
mode. If the HW can support that, then there shouldn't be a strict
requirement for HSFREQ = (VCLK * bpp) / num_lanes, or hitting the
pclk-hsfreq ratio exactly to milliHz precision.

 Tomi

