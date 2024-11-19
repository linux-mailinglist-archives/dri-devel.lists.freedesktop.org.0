Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A239D302A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 22:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531D710E376;
	Tue, 19 Nov 2024 21:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Wu1Uld26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D35810E376
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 21:56:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D5335895BF;
 Tue, 19 Nov 2024 22:56:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1732053397;
 bh=atOqhpShv6nVPXJfhzq/Bh3Ko/bhRYVXc8Rnk2+8Rt4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Wu1Uld26U2/CKmnv3kHtE9x+XTdgM4pNc+e4mnZ4unWp2//I7x6JrgANcYps0EEtl
 yAUFXaNJqAfv48rOn49RHiC4FGgVzx8omnErPAEJh0p2hDH+30Ta1CKLbIz5LoJatl
 sCO9n0TN+/e8ufwdlQU9dOTsLBeI/TZg+piBf5WSjwlGmoplTC/YIioJmcISIj8CHR
 bk2mM9tWOJTsd5py0tloVaK8qHVzTSg1W6Ij9zQ7jX1uR453RQxI6OWOTJe9d3GT0j
 XxSNqPaGBDt8/n2qk7OjNGvOGwfPo+HxvTAvie9a7nBF417HYvg7GzC4qFCbe8YWE5
 xtEa69egQQGGg==
Message-ID: <83be0a27-6b6c-4ba6-b9dc-f914a10abace@denx.de>
Date: Tue, 19 Nov 2024 22:42:50 +0100
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AM7PR04MB7046E282FD702ACE5E288F8998202@AM7PR04MB7046.eurprd04.prod.outlook.com>
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

On 11/19/24 9:18 AM, Ying Liu wrote:

[...]

>> The TC9595 can drive an DP output, for that the clock which have to be
>> set on the LCDIF cannot be predicted, as that information comes from the
>> monitor EDID/DPCD. That is why the LCDIF has to be able to configure the
>> Video PLL1 clock to accurate clock frequency.
>>
>> For the LVDS LDB, the use case is the other way around -- the pixel
>> clock which should be generated by LCDIF and fed to LDB are known from
>> the panel type listed in DT, but they should still be accurate.
> 
> Thanks for the information.  I think the key question is whether the
> alternative solution(*) you mentioned below stands or not, in other words,
> whether LCDIF1/LCDIF2/LDB drivers know that they are sharing a PLL
> or not.

I'll continue at the end ...

>>> You still may assign an accurate PLL rate in DT.
>>> This patch only makes the PLL rate be unchangeable dynamically in
>>> runtime.  That means the existing imx8m-dhcom-som.dtsi would use
>>> IMX8MP_VIDEO_PLL1_OUT(running at 1.0395GHz) as the parent clock
>>> of IMX8MP_CLK_MEDIA_DISP1_PIX (for LCDIF1/DSI), since it includes
>>> imx8mp.dsti.  I assume it should be able to support typical video modes
>>> like 1080p60 video mode with 148.5MHz pixel clock at least with 1.0395GHz
>>> PLL rate.
>>
>> This will break multiple DP monitors I tested so far I'm afraid. And I
>> spent a LOT of time wrestling with the TC9595 bridge to make sure it
>> actually does work well.
> 
> If the DP monitors support typical video modes like 1080p60 with
> 148.5MHz pixel clock rate, I assume these typical video modes work
> still ok with this patch at least.  Please help confirm this, since if the
> alternative solution(*) doesn't stand, we would know those video
> modes still work ok with my solution(fixed PLL rate).

They do not work with the fixed PLL setting.

>>> Granted that less video modes read from DP monitor would
>>> be supported without dynamically changeable PLL rates, this is something
>>> we have to accept because some i.MX8MP platforms(like i.MX8MP EVK)
>>> have to share IMX8MP_VIDEO_PLL1_OUT between LVDS and MIPI DSI
>>> display pipelines.
>>
>> What I need is the use of two full PLL1443x (like Video PLL and Audio
>> PLL1/2) , one for each display output, and those PLLs have to be fully
>> configurable to produce accurate pixel clock for each connected panel.
>> Otherwise I cannot make proper use of the video output capabilities of
>> the MX8MP SoC.
> 
> Yeah, I understand your requirements.  However, it still depends on
> whether the alternative solution(*) stands or not.

I'll continue at the end ...

>>> The missing part is that we need to do mode validation
>>> for the MIPI DSI display pipeline either in samsung-dsim.c or lcdif_kms.c
>>> to filter unsupported video mode out.  Is this missing mode validation
>>> the cause of your failure case?
>>
>> I do want to support the various modes, I do not want to filter them
>> out. They can be supported, the only "problem" is the shared Video PLL
>> which is not really an actual problem in my case, because I do not use
>> shared Video PLL, I use two separate PLLs.
>>
>> I think what is needed is for the LCDIF1/LCDIF2/LDB to figure out
>> whether they share the Video PLL at all (you already suggested the clock
>> subsystem can provide that information), and then if:
> 
> But, how to let LCDIF1/LCDIF2/LDB drivers to figure out that?
> 
> I didn't suggest that the clock subsystem can provide that information.

... by end I mean here.

One really nasty way I can think of is -- use find_node_by_compatible(), 
look up all the relevant DT nodes, parse their clock properties, and 
check whether they all point to the Video PLL or not.

Maybe the clock subsystem has a better way, like list "neighbor" 
consumers of some specific parent clock or something like that.

[...]

>> Can something like (*) above be implemented instead, so both Shared and
>> separate PLLs would be supported ? That should solve both of our use
>> cases, right ?
> 
> I don't see any clear way to implement something like(*).
> 
> Take the 3 i.MX8MP LCDIFs as one graphic card driven by one imx-lcdif
> DRM instance?  Would it be too intrusive?

Yes, and I think unnecessary, one can simply traverse and parse the DT 
to determine the clock assignment?

> Use clk_get_parent() to determine if the pixel clocks of LCDIF1&2 are
> sharing PLL(note clk_get_parent() implementation contains a TODO:
> Create a per-user clk.)?

Maybe not necessary for this case.

> How to do mode validation for the shared PLL case(note mode_valid()
> callback is supposed to look at nothing more than passed-in mode)?
> Use clk_set_rate_range() to fix the PLL rate(min == max)?

This is a good question -- we can use fixed frequency set in DT for the 
PLL in case it is shared, and set whatever optimal frequency if the PLL 
is not shared. That would be a good first step I think (**).

The next step would be to find a way to negotiate acceptable PLL 
frequency between LCDIF1/LCDIF2/LDB in case the PLL is shared, but I do 
agree this is non-trivial, hence next step.

>>> I hope that we can agree on this solution first before spreading
>>> discussions across different threads and eventually the NAK can be
>>> taken back.
>>
>> I cannot really agree on a solution which breaks one of my use cases,
>> but maybe there is an alternative how to support both options, see (*)
>> above ?
> 
> I tend to say there is no any alternative solution to satisfy both
> separate PLLs and shared PLL use cases, or even if there is one, it won't
> be easy to implement.  If you know one, please shout it out.
Maybe (*) with first step (**) would be doable ?
