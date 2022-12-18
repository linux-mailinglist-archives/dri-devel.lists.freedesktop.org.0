Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7A464FD9E
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 05:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3025610E12F;
	Sun, 18 Dec 2022 04:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4120410E12F
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 04:34:22 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 445C584FF0;
 Sun, 18 Dec 2022 05:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671338024;
 bh=xl5fwpWRgAQn71M4HvR9Nz3egzzwDH+/7CfV7rmmBGI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VwfT79qfAunozDzZ+HWZ88MFgwG+f/TcO0TLzKRH1hDz9VBfaISSFkqn54UqCqxph
 Dh18LcID5gBIeZiFBeOKS6uv22SkhRetA4g/xkuHg+ritIG6hW9jnt3S8YLw0xCAGb
 o81AmK2qzI8naxwevOUxCLljOuBqxRPBU3tpOqFoak0x2B7w5wTW+/c19tWFPKwI7K
 w2DHMii4RCxLAPAkNAoGqU1h6JgLSeEv9RsK9ryMUApiPkKTo5mW+z+710D52jw90v
 +mkEFXOXqgFOmhuzovXVcWddIJJSdRz800nu6Wxmhhxj2xTF/Aw6Mq//rVBWabWFwi
 FhSrUXK1HP7vQ==
Message-ID: <8e5755da-db8c-7169-b140-d5f964f34a86@denx.de>
Date: Sun, 18 Dec 2022 05:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
References: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de>
 <a6ad86a0-2831-34aa-2c2a-f6d683dc5713@denx.de>
 <CAHCN7xJnepugHxVR2oCd6YyUDA=RED33PTYmsXQkZ-wa4xgHbg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7xJnepugHxVR2oCd6YyUDA=RED33PTYmsXQkZ-wa4xgHbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Alexander Stein <Alexander.Stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/18/22 05:23, Adam Ford wrote:
> On Sat, Dec 17, 2022 at 5:56 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 12/16/22 14:25, Alexander Stein wrote:
>> Hi,
>>
>> [...]
>>
>>> Oh, nice, thanks for the pointer. When setting
>>>> samsung,burst-clock-frequency = <668250000>;
>>> in imx8mm.dtsi
>>> I get a non-flickering display using 4 lanes. Although admittedly this is just
>>> random guessing. I'm not sure which clock exactly has to be in the range
>>> CHA_DSI_CLK_RANGE is configured to. With 4 lanes SN65DSI84 is configured for
>>> 205-210 MHz (0x29), while I get these PLL PMS settings on DSIM:
>>>> samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99, s 0)
>>>> samsung-dsim 32e10000.dsi: hs_clk = 668250000, byte_clk = 83531250, esc_clk
>>> = 16706250
>>
>> If I recall it right, minimum PLL frequency is:
>>
>> fPMS=1.2*width*height*bpp*fps=1.2*800*480*24*60=663.5 MHz
>>
>> the link frequency is then
>>
>> fHS=fPMS/lanes/2=82.9 MHz (on the DDR clock lane)
>>
>> So DSI83 should be in the range of 80..85 MHz input clock if I calculate
>> this right. Can you check what is the value of mode->clock, the
>> mipi_dsi_panel_format_to_bpp() return value, ctx->dsi->lanes in dsi83
>> sm65dsi83_get_dsi_range() ?
>>
>>> AFAICS DSIM bridge is configurung hs_clk, byte_clk and esc_clk just from DT
>>> properties, while SN65DSI84 is using display mode and number of lanes.
>>>
>>> Is it expected that the DSIM PLL frequencies are set in DT for a specific
>>> bridge/display setup?
>>
>> No, there should be negotiation between the host and bridge/panel, I
>> tried to propose two variants, but they were all rejected.
> 
> For one of Jagan's previous revisions, I added some code to let the
> PHY auto adjust the frequencies instead of being fixed.  NXP had this
> in their downstream kernel, but with this patch and another, I was
> able to set a variety of pixel clocks from my HDMI monitor and my
> DSI83. I haven't had time to re-base my work on Jagan's latest work,
> but you can link to the patch I did for the older stuff here:
> 
> https://github.com/aford173/linux/commit/e845274b0f22ba3b24813ffd6bb3cb88ab4b67e4
> and
> https://github.com/aford173/linux/commit/3f90057eb608f96d106029ef639813475241936f
> 
> I've been traveling a lot lately, so I haven't had time to evaluate
> his series, but I hope to get something like those re-based once the
> DSI stuff has been accepted.

I have these two attempts, both rejected:

https://patchwork.freedesktop.org/patch/475207/
https://patchwork.freedesktop.org/patch/496049/
