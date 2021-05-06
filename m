Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190CE375C6A
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 22:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F87C6EDB4;
	Thu,  6 May 2021 20:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8816EDB4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 20:49:10 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 876C682CF3;
 Thu,  6 May 2021 22:49:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1620334148;
 bh=pe1wN/XUeBSGZ0NmvfLyC70gaX3w+mH5AIfolWBVcgw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=A7XLwWqqmbREaEqtM9tBNi5L02DPQX9r3g0SINItedRQypP0qf8pDnOgbmO8QkmuP
 i9xRB5RjWvtAjb/RxzgBMysd0SDX7qhXjLEqdg1O6n54lHllQrmLgzlY8BJaXeuc38
 PpqS1OcQUaqO67aBH9M7nZFehyfm2EK7sxP/W79rp6fyw1/5JUcRLX9HhourVCPKt8
 5k8Q2E6NB2QOUkwTCUElwm2mrq53wsGEZ7N/0DYIbS2kD7GL2bGdtYMTIX8GP7bHJL
 0zwYKI3IdWoKdKVoTzsxhbaNmdwcb37XYd8M3TO3Ze/2TO6KsAJ48jc1ppIe6sE9cG
 NryvxcIASR+/w==
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <CAPY8ntD8T8B6y4S70vya=PBP9hJs=w2kcovYEMG8n4mFpd0APA@mail.gmail.com>
 <b806a975-352b-6755-d5b0-232d1d8ccda0@denx.de>
 <CAPY8ntDPRcK8f7fT-5kScK+amtKGB-s+tkDUXrsCkfL2xDpTYg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <7a16b9db-22a3-0361-8353-1c373c2a135e@denx.de>
Date: Thu, 6 May 2021 22:49:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntDPRcK8f7fT-5kScK+amtKGB-s+tkDUXrsCkfL2xDpTYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/6/21 7:03 PM, Dave Stevenson wrote:
> On Thu, 6 May 2021 at 13:48, Marek Vasut <marex@denx.de> wrote:
>>
>> On 5/6/21 11:45 AM, Dave Stevenson wrote:
>>> Hi Marek
>>
>> Hi,
>>
>>> I'm taking an interest as there are a number of Raspberry Pi users
>>> trying to get this chip up and running (not there quite yet).
>>> A couple of fairly minor comments
>>
>> Is there any readily available display unit / expansion board with this
>> chip ?
> 
> Not that I'm aware of. It's a forum thread[1] where two different
> users are trying to bring up the chip, each with their own boards. One
> has just reported they have got it working with Jagan's patch set but
> with a load of hacks to both bridge and DSI drivers.
> If Laurent has a board then that may be a useful further test route.
> 
> I'm not 100% convinced that the Pi is doing exactly the right thing
> with regard LP-11 state during initialisation, but hope to get into
> the lab to check either tomorrow or early next week.

Good

> [1] https://www.raspberrypi.org/forums/viewtopic.php?f=44&t=305690
> 
>> [...]
>>
>>>> +#define REG_DSI_LANE                           0x10
>>>> +#define  REG_DSI_LANE_LVDS_LINK_CFG_DUAL       BIT(5) /* dual or 2x single */
>>>
>>> The bit name here seems a little odd.
>>> Bits 5&6 are the DSI channel mode on SN65DSI85, not the LVDS link
>>> config (which appears to be reg 0x18 bit 4)
>>> DSI_CHANNEL_MODE
>>> 00 – Dual-channel DSI receiver
>>> 01 – Single channel DSI receiver (default)
>>> 10 – Two single channel DSI receivers
>>> 11 – Reserved
>>> SN65DSI83 and 84 require it to be set to 01. You have that end result,
>>> but using an odd register name that only documents one of the 2 bits.
>>>
>>> Is it worth documenting bit 7 as being the '85 Dual DSI link
>>> LEFT_RIGHT_PIXELS flag at the same time? The chip isn't supported in
>>> dual DSI mode at present, but defining all the registers up front
>>> seems reasonable.
>>
>> Yes, let's fix those.
>>
>> [...]
>>
>>>> +       /*
>>>> +        * Reset the chip, pull EN line low for t_reset=10ms,
>>>> +        * then high for t_en=1ms.
>>>> +        */
>>>> +       regcache_mark_dirty(ctx->regmap);
>>>> +       gpiod_set_value(ctx->enable_gpio, 0);
>>>> +       usleep_range(10000, 11000);
>>>> +       gpiod_set_value(ctx->enable_gpio, 1);
>>>> +       usleep_range(1000, 1100);
>>>> +}
>>>
>>> Whilst section 6.6 of the SN65DSI84 datasheet does list t_en as 1ms,
>>> the initialization sequence listed in table 7.2 states
>>> Init seq 3 - Set EN pin to Low
>>> Wait 10 ms
>>> Init seq 4 - Tie EN pin to High
>>> Wait 10 ms
>>>
>>> with the note that these are "Minimum recommended delay. It is fine to
>>> exceed these."
>>>
>>> Have you had alternate guidance from TI over that delay?
>>
>> No, I trusted the timing diagrams in section 6.6 of the datasheet. I
>> would like to believe those are correct, while the init sequence listing
>> might be a copy-paste error.
> 
> It's a tough one to call as to which is going to be correct. I just
> thought I'd flag it.
> 
>> [...]
>>
>>>> +static void sn65dsi83_enable(struct drm_bridge *bridge)
>>>> +{
>>>> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>>>> +       unsigned int pval;
>>>> +       u16 val;
>>>> +       int ret;
>>>> +
>>>> +       /* Clear reset, disable PLL */
>>>> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
>>>> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>>>> +
>>>> +       /* Reference clock derived from DSI link clock. */
>>>> +       regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
>>>> +               REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
>>>> +               REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
>>>
>>> (Checkpatch whinge for "Alignment should match open parenthesis" on
>>> several lines through this function)
>>
>> Do you have any extra checkpatch settings somewhere ?
>> I get this on current next:
>>
>> linux-2.6$ ./scripts/checkpatch.pl -f drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> total: 0 errors, 0 warnings, 625 lines checked
> 
> Sorry, yes "./scripts/checkpatch.pl --strict --codespell". Too much
> working in the linux-media realms where --strict is required :-/

So I can add a variable , assign it the value of 
sn65dsi83_get_lvds_range(ctx) and then do 
REG_RC_LVDS_PLL_LVDS_CLK_RANGE(val), but that doesn't really improve the 
readability at all, it just adds extra indirection.
