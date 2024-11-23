Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42049D6BD0
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 23:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C12A10E0B9;
	Sat, 23 Nov 2024 22:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="cYxJwfmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B1D10E0B9
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 22:34:33 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 944DD89401;
 Sat, 23 Nov 2024 23:34:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1732401268;
 bh=UVI84fOke9gLRZ0suzoYkdmP/Z7GYELBjts2k6DzJl0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cYxJwfmTaViuJOl0E6LpQm/Yli1C/FbRzss9eticyEKW0qVpN1ZSjg/mt+Jhflech
 xZPDZK/2aDIWkoZCayi0JfCMpOWINUNWavA6h3p2lCt5sGaekQVrM1Rh3lMJzDDT9I
 0P5uEXc/IOYzu8lRmA7IUMCIbDIOfeYVkTgl43z8X46shVEBMmRvaPIOo39o0Smn2y
 MzUfd3fB98Nx4L29dvoE4Wub78AS+8by0lY2Ld8CUxGFA2OhGcx/7eFtjUcbUiFYI6
 UDMn/y70IKCsE1VZzCaAq9TgOEH8XdQr2XrBNHm4cLfehwhtgt2Hdz4lEZNyzoctiu
 1lij3zQXXUpgw==
Message-ID: <bd884164-3a38-446d-8a54-3d716a3e0360@denx.de>
Date: Sat, 23 Nov 2024 21:11:58 +0100
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
 <c5ab63da-21ec-4c0d-8ecc-3745943d806f@denx.de>
 <AM7PR04MB7046D404841394382324DE7198232@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AM7PR04MB7046D404841394382324DE7198232@AM7PR04MB7046.eurprd04.prod.outlook.com>
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

On 11/22/24 4:39 AM, Ying Liu wrote:
> On 11/22/24, Marek Vasut wrote:
>> On 11/20/24 7:38 AM, Ying Liu wrote:
>>
>> [...]
>>
>>>>> If the DP monitors support typical video modes like 1080p60 with
>>>>> 148.5MHz pixel clock rate, I assume these typical video modes work
>>>>> still ok with this patch at least.  Please help confirm this, since if the
>>>>> alternative solution(*) doesn't stand, we would know those video
>>>>> modes still work ok with my solution(fixed PLL rate).
>>>>
>>>> They do not work with the fixed PLL setting.
>>>
>>> Why?  Did you assign a sensible fixed PLL rate in DT?
>>
>> Whatever was in imx8mp.dtsi does not really work for all the panels.
>> Please keep in mind that the use case I have does not include only
>> 1920x1080 "standard" panels, but also other resolutions.
> 
> It looks like you are still sticking to the idea of supporting all potentially
> valid video modes by trying to find an "alternative" solution, while
> neglecting that the solution *could be* never working.

Reconfiguring the PLL to achieve accurate pixel clock is working 
already, right now.

>>> Can you please compare clk_summary output for the failing cases
>>> before and after this patch is applied? I assume that if you use
>>> the fixed PLL rate same to the rate which works before this patch is
>>> applied, the typical video modes still just work after this patch is
>>> applied.
>>
>> I'm afraid I do not need to support only typical video modes, but also
>> the other "atypical" modes.
> 
> If the "alternative" solution doesn't work, we'll end up using the "fixed
> PLL rate" solution.  It that case, some video modes would be filtered
> out as a sacrifice.

Maybe it would be better to continue the discussion in

[PATCH 0/5] clk: Fix simple video pipelines on i.MX8

which seems close to the alternative solution I was looking for ?
