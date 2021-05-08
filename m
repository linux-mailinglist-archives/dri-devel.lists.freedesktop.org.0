Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906F43773FD
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 22:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6966E0E3;
	Sat,  8 May 2021 20:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717EE6E0E3
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 20:26:18 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A97BC82008;
 Sat,  8 May 2021 22:26:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1620505576;
 bh=ODOFtiSSxjI0fzU+N9WSWoZaq48FOWpDYf02qp2FJs4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nr7e0PF8r1lBX090Fp7ByfoQMSe8w52dgDQirLGBU2ruKw6AADpYx9A765ddlEjqQ
 LrZm7A5gJ5RDICJvrKku3W9p14uRNBhhGaICVGNooVOwPFDqoD0nGczBJ2FdzXRmRt
 OxPlABfHFRavh5webyImNBNDb9fPSZ15l1k9yx6aZ3hnIKXuJYNqds9iW2a5yaalFk
 lqCcLDl8slr/GDyXMmuZciM/LOpIOYl4xO2GgJfoibBs3bBhk48ziyVaqS03x/5xs0
 lJGVgnMzwMkOL5Cavo3EnpSC3JDm+S6mNxffhR0bu9KetatA9i2LJXoZCVU8MbmLaG
 4CoSWibhIxBuw==
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <2655a86a-d371-6a5a-715a-53b73a696d28@kontron.de>
 <7da2c2d2-fb02-0a1b-d853-bfd756a0cd9b@denx.de>
 <61e269b7-870a-01a8-722b-15c9aecf9bf9@kontron.de>
 <8985230f-cb0a-43ca-f8f7-66898f85dc2b@denx.de>
 <CAPY8ntAra-sOXKTrifammiAwH+PuGmnC0AD4oQ4bPiD+HR857Q@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <b55250e0-e05c-c329-a718-45f72cfb9b62@denx.de>
Date: Sat, 8 May 2021 22:10:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntAra-sOXKTrifammiAwH+PuGmnC0AD4oQ4bPiD+HR857Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
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
Cc: Loic Poulain <loic.poulain@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/7/21 11:17 AM, Dave Stevenson wrote:
> On Thu, 6 May 2021 at 21:51, Marek Vasut <marex@denx.de> wrote:
>>
>> On 5/6/21 6:03 PM, Frieder Schrempf wrote:
>>> On 06.05.21 17:46, Marek Vasut wrote:
>>>> On 5/6/21 5:38 PM, Frieder Schrempf wrote:
>>>> [...]
>>>>> Works on i.MX8MM with SN65DSI84 and a single link LVDS display (1024x600) and from my perspective everything else also looks good. Thanks for your work!
>>>>>
>>>>> I have two remarks:
>>>>>
>>>>> 1. In my test I couldn't get it to work with four DSI lanes enabled (only with two) but I'm quite sure that the DSIM driver is to blame as everything on the bridge level looks good (also setting the DSI EQ register didn't help as you suggested, Marek).
>>>>
>>>> I suspect there is indeed something with the DSIM going on, I'll keep you posted if I find something out.
>>>>
>>>>> 2. When I set MEDIA_BUS_FMT_RGB888_1X7X4_SPWG in the panel driver I get distorted colors. I need to use MEDIA_BUS_FMT_RGB888_1X24 to make it work, but this is not valid for LVDS. Again I don't think this driver is to blame as I can't see where it does anything wrong, but my experience here is very limited so I still want to mention it.
>>>>
>>>> Hmm, in that conversion supposed to happen in this bridge driver or should MXSFB handle the SPWG pixel format ? Or should the DSIM bridge do something about that ?
>>>
>>> As far as I understand it the conversion is already done by the DSI84 without any extra configuration necessary. The only thing that needs to be done is selecting the LVDS output format via CHx_24BPP_MODE and CHx_24BPP_FORMAT1 which the driver currently hardcodes to 24bpp aka MEDIA_BUS_FMT_RGB888_1X7X4_SPWG. I think the DSI input format is always 24bpp aka MEDIA_BUS_FMT_RGB888_1X24.
>>
>> The DSI is MEDIA_BUS_FMT_RGB888_1X24, yes.
>>
>> So maybe this bridge driver has to somehow deal with
>> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ? Except I haven't seen such a thing
>> implemented in other bridge drivers, so input would be welcome on this.
> 
> I'm claiming no knowledge of whether this is the correct approach or
> not, but Toshiba TC358775 is also a DSI to LVDS bridge which appears
> to handle both formats.
> https://elixir.free-electrons.com/linux/latest/source/drivers/gpu/drm/bridge/tc358775.c#L457

That's what quick git grep points you to, yes. Except that driver does 
not patch the bus pixel format for the DSI in any way, it just passes 
whatever bus pixel format it got from the panel/output bridge through.

You need something like drm_display_info_set_bus_formats() called somewhere.

>>> So I wonder where the format actually is evaluated. Could it be that it is passed down to the LCDIF and changes its output format which causes the data passed by DSIM to the DSI84 to already be in the SPWG format? If that's the case we maybe need a way to specify MEDIA_BUS_FMT_RGB888_1X24 as input bus format for the DSI84 so it doesn't pass on the panel's format? Only a wild guess, no idea if it really works like that.
>>
>> I _think_ the bridge must somehow handle the
>> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG <-> MEDIA_BUS_FMT_RGB888_1X24 conversion.
> 
> I've not looked at where the interchange happens, but as you're
> setting the DSI format in struct mipi_dsi_device to
> MIPI_DSI_FMT_RGB888 doesn't that provide the configuration side to the
> DSI transmitter?
> Otherwise presumably it needs to support the atomic_get_input_bus_fmts
> and/or atomic_get_output_bus_fmts functions in drm_bridge_funcs.

That doesn't work either, but see above, I think you need 
drm_display_info_set_bus_formats() .
