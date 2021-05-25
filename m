Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D1E390179
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF61884FD;
	Tue, 25 May 2021 13:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BD589D43
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:00:12 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BF9E982EB5;
 Tue, 25 May 2021 15:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1621947610;
 bh=pIXBp2ZbbBxhSpZY2IWliSrsiLRFAHds6nRSUxE2bMs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=K4QY86H0KxTuqypot1R0D4jiqupMj4H/lHjb0EDpq9mxvYyozq5MgBZOcINg4Yf7I
 h0gAOvGXiILQPA01UfrXJqcczOsUJpwBHjKNsBvg3XzmZiVeTwSsEm/We34B3XMm9V
 gbutLHVup5lzBcSPPsWPQ5sUy8AgR1B2p/LZNMZSgf/mXJ2gBxGc86tdQPkOGg5Hnh
 mQ83yMiZ3cbCqNK0O2i9KR5ZvwW7X3KQnnMRMQUwwTZKGgxcVFZ/eunuICTr84MVx1
 G2HJJDYp6DHNOvCqC93bmn2MTTML3lv/PIRxWv6/5gL0WSCuKF+sMy1AvMClnJztxy
 kvqIuaAUvzkaw==
Subject: Re: [V3, 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84
 driver
To: Mike Looijmans <mike.looijmans@topic.nl>, dri-devel@lists.freedesktop.org
References: <20210505100218.108024-2-marex@denx.de>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.d251689f-a6ba-486d-bfa1-070ac0c167d5@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.81349e00-3f39-4654-ab28-8c85568d0c51@emailsignatures365.codetwo.com>
 <f61c710e-cd12-f1cf-d05b-759fd2c0e8b1@topic.nl>
 <61fe258a-c89b-ffa8-2773-0e7eef35b612@denx.de>
 <27f1e433-3290-c5ea-d338-83906ef10b3f@topic.nl>
From: Marek Vasut <marex@denx.de>
Message-ID: <ecc4d3b6-4d74-02f7-e09b-1dfb3881b6e8@denx.de>
Date: Tue, 25 May 2021 15:00:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <27f1e433-3290-c5ea-d338-83906ef10b3f@topic.nl>
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
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/25/21 2:08 PM, Mike Looijmans wrote:
> See below...

You can just comment inline and skip this top-post.

> Met vriendelijke groet / kind regards,
> 
> Mike Looijmans
> System Expert
> 
> 
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
> 
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topic.nl
> 
> Please consider the environment before printing this e-mail
> On 25-05-2021 12:53, Marek Vasut wrote:
>> On 5/17/21 3:23 PM, Mike Looijmans wrote:
>>
>> Which system/soc are you testing this on ?
> 
> On a raspberry-pi 4 at the moment.

Ah, OK, it seems this bridge is popular on RPi.
Is there some adapter board with such a bridge for RPi available ?

>> [...]
>>
>>>> +static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
>>>> +{
>>>> +    struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>>>> +
>>>> +    /*
>>>> +     * Reset the chip, pull EN line low for t_reset=10ms,
>>>> +     * then high for t_en=1ms.
>>>> +     */
>>>> +    regcache_mark_dirty(ctx->regmap);
>>>> +    gpiod_set_value(ctx->enable_gpio, 0);
>>>> +    usleep_range(10000, 11000);
>>>> +    gpiod_set_value(ctx->enable_gpio, 1);
>>>> +    usleep_range(1000, 1100);
>>> Taking the chip out of reset here is not needed and may even disrupt 
>>> things, as the DSI hasn't set up anything yet so the clock may not be 
>>> running. I'd move this all into enable and get rid of the pre_enable 
>>> call. Similar for post_disable.
>>
>> I am still waiting for someone to confirm the behavior of the DSI 
>> clock and data lanes in pre_enable/enable() . The datasheet says the 
>> HS clock have to be running and data lanes must be in LP state during 
>> init, but I don't think that is guaranteed currently in either 
>> pre_enable or enable.
> 
> Neither is suited. pre-enable may have nothing, while enable has the 
> data lanes sending video according to the docs. So on many systems 
> either this driver or the DSI driver will need changes to make it work 
> properly.
> 
> On the raspberrypi, the DSI has the clock running in pre-enable, hence 
> putting everything in pre-enable instead of in enable makes the chip work.

I think someone from the RPi foundation mentioned this before.

> Alternatively, one can modify the RPi DSI code to start sending data 
> after the enable calls. That also works on my setup, with everything in 
> enable.
> 
> The major point here is that you should pick one and only one callback: 
> pre-enable or enable. The GPIO reset code as well as writing the 
> registers should be done in that one method.

Why , please elaborate ? It seems to be if there was no need for those 
two callbacks, there would be no two callbacks in the API in the first 
place. There is a chance you will get disable()->enable() sequence 
without going through post_disable()->pre_enable() as far as I can tell.

> Same for (post)disable for symmetry. There's no point keeping the chip 
> awake after a disable.
> 
> 
> It's pretty likely for a DSI driver to have the clock active in order to 
> allow the panel driver to send MIPI commands and things like that. So 
> everything in pre_enable makes sense.

That's how the RPi behaves, on MX8M the DSI clock are active only in 
enable. But that might be wrong, see below.

> I don't know how the platform you're testing on is behaving in this 
> respect?

iMX8M{M,N}.

And I suspect the DSI behaves differently than on RPi. And that is why I 
would like to get some clarification on what (clock, data, LP and HS) is 
enabled where from the maintainers.

>> [...]
>>
>>>> +static void sn65dsi83_enable(struct drm_bridge *bridge)
>>>> +{
>>>> +    struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>>>> +    unsigned int pval;
>>>> +    u16 val;
>>>> +    int ret;
>>>> +
>>>> +    /* Clear reset, disable PLL */
>>>> +    regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
>>> Writing 0 to the RESET register is a no-op. Has no effect whatsoever, 
>>> just wasting time and code.
>>
>> I would rather keep it to make sure the register is initialized.
> 
> Why? It's marked "volatile" so the regmap cache will not touch it. On 
> the I2C level, there's absolutely no reason to do this.

It still does trigger a write into the hardware.

>>>> +    regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>>>> +
>>>> +    /* Reference clock derived from DSI link clock. */
>>>> +    regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
>>>> + REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
>>>> +        REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
>>>> +    regmap_write(ctx->regmap, REG_DSI_CLK,
>>>> + REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
>>>> +    regmap_write(ctx->regmap, REG_RC_DSI_CLK,
>>>> + REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
>>>> +
>>>> +    /* Set number of DSI lanes and LVDS link config. */
>>>> +    regmap_write(ctx->regmap, REG_DSI_LANE,
>>>> +        REG_DSI_LANE_LVDS_LINK_CFG_DUAL |
>>>> +        REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
>>>> +        /* CHB is DSI85-only, set to default on DSI83/DSI84 */
>>>> +        REG_DSI_LANE_CHB_DSI_LANES(3));
>>>> +    /* No equalization. */
>>>> +    regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
>>>> +
>>>> +    /* RGB888 is the only format supported so far. */
>>>> +    val = (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
>>>> +           REG_LVDS_FMT_HS_NEG_POLARITY : 0) |
>>>> +          (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC ?
>>>> +           REG_LVDS_FMT_VS_NEG_POLARITY : 0) |
>>>> +          REG_LVDS_FMT_CHA_24BPP_MODE;
>>>> +    if (ctx->lvds_dual_link)
>>>> +        val |= REG_LVDS_FMT_CHB_24BPP_MODE;
>>>> +    else
>>>> +        val |= REG_LVDS_FMT_LVDS_LINK_CFG;
>>>> +
>>>> +    regmap_write(ctx->regmap, REG_LVDS_FMT, val);
>>>> +    regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
>>>> +    regmap_write(ctx->regmap, REG_LVDS_LANE,
>>>> +        (ctx->lvds_dual_link_even_odd_swap ?
>>>> +         REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
>>>> +        REG_LVDS_LANE_CHA_LVDS_TERM|
>>>> +        REG_LVDS_LANE_CHB_LVDS_TERM);
>>>> +    regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
>>>> +
>>>> +    regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
>>>> +              &ctx->mode.hdisplay, 2);
>>>
>>> I think this ignores the endian format of the data. So this would 
>>> only work on little-endian systems, right?
>>
>> Likely, can you double-check that ?
>> Some cpu_to_le16() could help here then.
> 
> I'd add a small helper function that does the endian conversion and 
> register write, e.g.
> 
> static int sn65dsi83_write16bit(struct sn65dsi83 *ctx, unsigned int reg, 
> u16 value)

That just adds unnecessary indirection and makes the code harder to 
read, so I won't do that. val = cpu_to_le16(...) looks good enough and 
there are already such sequences, i.e. val = ... ; regmap_bulk_write(...);
