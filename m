Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0679D468A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 05:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1164E10E853;
	Thu, 21 Nov 2024 04:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="wCBSNVwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C8410E853
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 04:16:29 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 634C089649;
 Thu, 21 Nov 2024 05:16:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1732162587;
 bh=2fodjiAgYPDtTdtLZpHcgtZf3CNy/SOSXhvCQwtxCgw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wCBSNVwyMCtyV+EJz0s8mS+rd+v36qvA6mFZGmMq5phZpHsR8dVcwGXv1+Rb9y2at
 vsjlPVwrsU5S4f4P5xYBBa5K0xb+uVxFaxY7j/z/l1UpozYFVIqww/Udrm5fpNjGT/
 LbUI5mQUyf6oWpXEpUbfI2rEWAl3jIx6jj1pSecUModI1Te5cxyi0666k4EfbEdKsA
 KPriDe1TbHoQXl52Y/tIL/T5YMdrjSuQAZir/s1AX/Jg+yTV3aAHfGwikJ3zcX2RAq
 Vr5rmPHGPGtbL4MU9z4M22mTSqhbimd8GZkUQxOTzmD53oJgF6xTxjvAcB6aM3CuRO
 tWMS71DS4zVPw==
Message-ID: <c5ab63da-21ec-4c0d-8ecc-3745943d806f@denx.de>
Date: Thu, 21 Nov 2024 03:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
To: Ying Liu <victor.liu@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "abelvesa@kernel.org" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241114065759.3341908-3-victor.liu@nxp.com>
 <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de>
 <AM7PR04MB7046546A882A8D48E135D84698272@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <8a4fd234-4c7b-4a04-990d-3222aaa5172d@denx.de>
 <AM7PR04MB7046E282FD702ACE5E288F8998202@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <83be0a27-6b6c-4ba6-b9dc-f914a10abace@denx.de>
 <AM7PR04MB7046587167BF790549B8560F98212@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AM7PR04MB7046587167BF790549B8560F98212@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 11/20/24 7:38 AM, Ying Liu wrote:

[...]

>>> If the DP monitors support typical video modes like 1080p60 with
>>> 148.5MHz pixel clock rate, I assume these typical video modes work
>>> still ok with this patch at least.  Please help confirm this, since if the
>>> alternative solution(*) doesn't stand, we would know those video
>>> modes still work ok with my solution(fixed PLL rate).
>>
>> They do not work with the fixed PLL setting.
> 
> Why?  Did you assign a sensible fixed PLL rate in DT?

Whatever was in imx8mp.dtsi does not really work for all the panels.
Please keep in mind that the use case I have does not include only 
1920x1080 "standard" panels, but also other resolutions.

> Can you please compare clk_summary output for the failing cases
> before and after this patch is applied? I assume that if you use
> the fixed PLL rate same to the rate which works before this patch is
> applied, the typical video modes still just work after this patch is
> applied.

I'm afraid I do not need to support only typical video modes, but also 
the other "atypical" modes.

[...]

>> One really nasty way I can think of is -- use find_node_by_compatible(),
>> look up all the relevant DT nodes, parse their clock properties, and
>> check whether they all point to the Video PLL or not.
> 
> That's nasty.  It looks even more nasty when considering the fact that
> i.MX93 LCDIF is also driven by imx-lcdif DRM while only i.MX8MP LCDIF
> needs the nasty check, because i.MX93 SoC embeds only one LCDIF.

The check can be skipped based on compatible string.

I agree it is nasty, but it is a start. Are there better ideas ?

>> Maybe the clock subsystem has a better way, like list "neighbor"
>> consumers of some specific parent clock or something like that.
> 
> What will imx-lcdif DRM look like by using this way? Get the ancestor PLL
> clock of pixel clock(media_disp{1,2}_pix_root_clk), list all child clocks
> (media_disp1_pix and/or media_disp2_pix + other possible clocks) of the
> PLL clock in a string array and find media_disp1_pix + media_disp2_pix
> in it?
> 
> Doesn't look nice, either.

One other option came to my mind -- place a virtual clock between the 
Video PLL and consumers (LCDIF1/2/LDB), and then have the virtual clock 
driver do the clock rate negotiation in some .round_rate callback. That 
is also nasty, but it is another idea. If there is a clock specifically 
implemented to negotiate best upstream clock rate for all of its 
consumers, and it is aware of the consumer behavior details and 
requirements, maybe that could work ?

>> [...]
>>
>>>> Can something like (*) above be implemented instead, so both Shared
>> and
>>>> separate PLLs would be supported ? That should solve both of our use
>>>> cases, right ?
>>>
>>> I don't see any clear way to implement something like(*).
>>>
>>> Take the 3 i.MX8MP LCDIFs as one graphic card driven by one imx-lcdif
>>> DRM instance?  Would it be too intrusive?
>>
>> Yes, and I think unnecessary, one can simply traverse and parse the DT
>> to determine the clock assignment?
> 
> Yes, people can traverse and parse DT, but it's nasty.
> 
> In addition, one may argue that now that CLK_SET_RATE_PARENT flag
> is set for the pixel clocks, all potential video modes read from EDID
> should be supported when only either LVDS display pipeline or MIPI DSI
> display pipeline is active in the shared PLL case.  This requires one
> single DRM instance to detect single or dual active display pipelines
> dynamically, hence this single DRM instance becomes necessary.

Would single virtual clock which do the frequency negotiation between 
multiple DRM consumers work too ?

I do not have much to add to the points below.
