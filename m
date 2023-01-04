Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943EF65D7A1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 16:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D33110E449;
	Wed,  4 Jan 2023 15:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3736610E445
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 15:55:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 038B38558B;
 Wed,  4 Jan 2023 16:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1672847734;
 bh=XWNekA8wnv34bRzhm/ZQB6vM5DVH4F49f5CUC0+rFQc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NbWEvGg7G+BPIYX2hDbSNPK8ITAw/pbXIDQph8gyfEop3ruCiRaPM+IAokrlKR10j
 o1VCpoX44EEVNh958eGwmTj4IdJHuNVXzOUTkTOHA1kNoc213/Ab8BBHU9OW7CRehO
 ws9sWVP/IcKRDlaTh56ulICLnhlUNQse4WXXCacHcbv3tAoN3NwA+O8IEkxthU728x
 WUm61dkNMuGYnQg3+aHZoPT9kLFNYd492ANw2Jz8n1xslf+0+Hs6UPXVwFzRxrVyQy
 jwxOdIgfis+eZ8foEU147GSh0lCe+uBD8clO7CuIwd6/Igw4hIASjEJKjV0gGQXnat
 MyOO3BTEucHTg==
Message-ID: <8172fbfd-a1b9-bfca-983d-b97a1f9560da@denx.de>
Date: Wed, 4 Jan 2023 16:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Adam Ford <aford173@gmail.com>, Maxime Ripard <maxime@cerno.tech>
References: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de>
 <CAHCN7xL1qqhFkroBUswpSyTGUFo6B26rmp0zRL2K8ATT4HtUGg@mail.gmail.com>
 <449d03be-226f-9a90-aff3-8afee68c346d@denx.de> <4207863.mogB4TqSGs@steina-w>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4207863.mogB4TqSGs@steina-w>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/3/23 11:59, Alexander Stein wrote:
> Hi,
> 
> Am Sonntag, 18. Dezember 2022, 23:28:20 CET schrieb Marek Vasut:
>> On 12/18/22 23:24, Adam Ford wrote:
>>> On Sat, Dec 17, 2022 at 10:33 PM Marek Vasut <marex@denx.de> wrote:
>>>> On 12/18/22 05:23, Adam Ford wrote:
>>>>> On Sat, Dec 17, 2022 at 5:56 PM Marek Vasut <marex@denx.de> wrote:
>>>>>> On 12/16/22 14:25, Alexander Stein wrote:
>>>>>> Hi,
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> Oh, nice, thanks for the pointer. When setting
>>>>>>>
>>>>>>>> samsung,burst-clock-frequency = <668250000>;
>>>>>>>
>>>>>>> in imx8mm.dtsi
>>>>>>> I get a non-flickering display using 4 lanes. Although admittedly this
>>>>>>> is just random guessing. I'm not sure which clock exactly has to be
>>>>>>> in the range CHA_DSI_CLK_RANGE is configured to. With 4 lanes
>>>>>>> SN65DSI84 is configured for>>>>>
>>>>>>> 205-210 MHz (0x29), while I get these PLL PMS settings on DSIM:
>>>>>>>> samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99, s 0)
>>>>>>>> samsung-dsim 32e10000.dsi: hs_clk = 668250000, byte_clk = 83531250,
>>>>>>>> esc_clk
>>>>>>>
>>>>>>> = 16706250
>>>>>>
>>>>>> If I recall it right, minimum PLL frequency is:
>>>>>>
>>>>>> fPMS=1.2*width*height*bpp*fps=1.2*800*480*24*60=663.5 MHz
>>>>>>
>>>>>> the link frequency is then
>>>>>>
>>>>>> fHS=fPMS/lanes/2=82.9 MHz (on the DDR clock lane)
>>>>>>
>>>>>> So DSI83 should be in the range of 80..85 MHz input clock if I
>>>>>> calculate
>>>>>> this right. Can you check what is the value of mode->clock, the
>>>>>> mipi_dsi_panel_format_to_bpp() return value, ctx->dsi->lanes in dsi83
>>>>>> sm65dsi83_get_dsi_range() ?
>>>>>>
>>>>>>> AFAICS DSIM bridge is configurung hs_clk, byte_clk and esc_clk just
>>>>>>> from DT
>>>>>>> properties, while SN65DSI84 is using display mode and number of lanes.
>>>>>>>
>>>>>>> Is it expected that the DSIM PLL frequencies are set in DT for a
>>>>>>> specific
>>>>>>> bridge/display setup?
>>>>>>
>>>>>> No, there should be negotiation between the host and bridge/panel, I
>>>>>> tried to propose two variants, but they were all rejected.
>>>>>
>>>>> For one of Jagan's previous revisions, I added some code to let the
>>>>> PHY auto adjust the frequencies instead of being fixed.  NXP had this
>>>>> in their downstream kernel, but with this patch and another, I was
>>>>> able to set a variety of pixel clocks from my HDMI monitor and my
>>>>> DSI83. I haven't had time to re-base my work on Jagan's latest work,
>>>>> but you can link to the patch I did for the older stuff here:
>>>>>
>>>>> https://github.com/aford173/linux/commit/e845274b0f22ba3b24813ffd6bb3cb8
>>>>> 8ab4b67e4 and
>>>>> https://github.com/aford173/linux/commit/3f90057eb608f96d106029ef6398134
>>>>> 75241936f
>>>>>
>>>>> I've been traveling a lot lately, so I haven't had time to evaluate
>>>>> his series, but I hope to get something like those re-based once the
>>>>> DSI stuff has been accepted.
>>>>
>>>> I have these two attempts, both rejected:
>>>>
>>>> https://patchwork.freedesktop.org/patch/475207/
>>>> https://patchwork.freedesktop.org/patch/496049/
>>>
>>> I have some patches re-based to Jagan's latest branch.  It doesn't
>>> impact any drivers other than the new samsung-dsim driver, and it
>>> doesn't touch any of the drm helper functions either.  It adjusts hs
>>> clock based on the connected device.  I am not sure what the impact
>>> will have on the attached Exynos devices, so I am expecting some
>>> iterations.  Right now it's working with my DSI83 chip, but I need to
>>> get it working with my adv7535 part as well.  On the older branch, I
>>> was able to sync the ad7535 with a variety of resolutions using
>>> different pixel clock rates.
>>>
>>> Once I get it working again with my adv7535 and cleaned up, I'll
>>> submit the patches to the drm group, and I'll CC you, Jagan and Marek
>>> Szyprowski with a reference to Jagan's series so people wanting to try
>>> it can apply it to his branch.
>>
>> The negotiation has to happen between the host and the bridge/panel,
>> otherwise you won't be able to support bridge/panel devices which
>> require specific clock rate on the DSI. Only the bridge/panel driver
>> knows about such requirement.
> 
> AFAICS using Adam's patch the dynamic DPHY config is done in atomic_pre_enable
> callback. So at this point the negotiation has to be finished already.
> Wouldn't it be possible to setup 'dsi->format' within a atomic_check for
> samsung_dsim? But I don't know how you would get the expected clock frequency
> from the downward bridge.

Maybe Maxime can comment on this ?
