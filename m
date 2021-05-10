Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9D3797BC
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 21:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C2D89FC9;
	Mon, 10 May 2021 19:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F25E89FC9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 19:29:57 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3C71A82ADA;
 Mon, 10 May 2021 21:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1620674996;
 bh=dxQjgd5yG/mNcNTYSr7Th6oyg3aAwEfI+2dVgWiWDog=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=coE8ISTClbdUBTjkcokh/6UT9VRH70TMBlaKnAGLIAowb58P6wCF0dOwScsyWAT0s
 b3oZGBrFGpMHoKvrbUzwTv3chnbBGihBosjhkDfyVDAdQE7zGz0BnclS1X329mCDSc
 8RID+pAkQPhQmYH+UpNbwfRy1v9GoJ4Dnj4OWSOKejBQzcyTMR0HnB1SwtNqZfaQuN
 fqxQ5VxypXlcMVep+q9J1v7x9mydmU7V85MXxWzQdI/BmGmbr+J5TSKfhQHkQtioY+
 rng9r3ch8QDWhY9lEa+8Y8ZN594Z6PhKpwdfv/3n44+BkYxJvjMuvVHxb1ce6nepJw
 YntBNhj9PmQWg==
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <CAPY8ntCzu6=uBqRfQ+9QJWH-zqy0K9FD8XWdC8NZxJZiUBfYfg@mail.gmail.com>
 <8d2fbc9b-fb3e-aac9-566a-033c4bb218d7@denx.de>
 <CAPY8ntDMJyUHvKn=4fXZK2tYTQ9Lj_QTY-zk_1h+oZ-fQ80E+w@mail.gmail.com>
 <5a895cb3-92fd-32c4-2133-cd5b6b914790@denx.de>
 <CAPY8ntDLF1phpvHpCYP0E62yb88Y43KZsVJqhs0vMw=kSDtVZA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <af3d5aec-b750-a17a-4255-77ea725ecfc1@denx.de>
Date: Mon, 10 May 2021 21:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntDLF1phpvHpCYP0E62yb88Y43KZsVJqhs0vMw=kSDtVZA@mail.gmail.com>
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

On 5/10/21 8:04 PM, Dave Stevenson wrote:

Hi,
[...]
>>>>>> +static void sn65dsi83_enable(struct drm_bridge *bridge)
>>>>>> +{
>>>>>> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>>>>>> +       unsigned int pval;
>>>>>> +       u16 val;
>>>>>> +       int ret;
>>>>>> +
>>>>>> +       /* Clear reset, disable PLL */
>>>>>> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
>>>>>> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>>>>>
>>>>> Sorry, a further thread of discussion coming from the investigations
>>>>> I've been involved with.
>>>>>
>>>>> You've powered up in pre_enable, and are sending the I2C writes in enable.
>>>>>
>>>>> >From the docs for drm_bridge_funcs->enable[1]
>>>>>
>>>>>     * The bridge can assume that the display pipe (i.e. clocks and timing
>>>>>     * signals) feeding it is running when this callback is called. This
>>>>>     * callback must enable the display link feeding the next bridge in the
>>>>>     * chain if there is one.
>>>>>
>>>>> So video is running when enable is called, and the DSI data lanes may
>>>>> be HS. (Someone correct me if that is an incorrect reading of the
>>>>> text).
>>>>>
>>>>> The SN65DSI84 datasheet table 7-2 Initialization Sequence gives init
>>>>> seq 8 as being "Change DSI data lanes to HS state and start DSI video
>>>>> stream", AFTER all the I2C has been completed except reading back
>>>>> registers and checking for errors.
>>>>> With video running you don't fulfil the second part of init seq 2 "the
>>>>> DSI data lanes MUST be driven to LP11 state"
>>>>>
>>>>> My investigations have been over delaying starting the DSI video
>>>>> stream until after enable, but reading the descriptive text for enable
>>>>> I believe the Pi is correct to be sending video at that point.
>>>>> I guess there is some ambiguity as to whether the clock lane is going
>>>>> to be in HS mode during pre_enable. On the Pi the PHY and clocks will
>>>>> be enabled prior to pre_enable to allow for sending DSI commands
>>>>> during pre_enable, but it may not be true on other platforms.
>>>>
>>>> You have to make sure the clock lane is running and in HS mode when
>>>> configuring the DSI83, otherwise the internal DSI83 state machine won't
>>>> be able to operate.
>>>
>>> Indeed, but my reading of the documentation says that neither
>>> pre_enable nor enable give you the state that you require.
>>> You need a hook in the middle, an option to ask for clock lanes during
>>> pre_enable or no video during enable, or an amendment to the docs over
>>> the state during enable.
>>>
>>> Having the data lanes in HS mode does appear to stop the DSI83
>>> accepting the I2C setup commands.
>>
>> Uhh, that is new. Is that what you observed in your lab ?
>>
>> I saw the DSI83 behave this way if the clock lane was stopped, but the
>> data lanes had no impact. Was your clock lane running when the DSI83 was
>> not accepting i2c commands ? Does your DSI83 source clock from it or
>> from external Xtal ?
> 
> I haven't got into the lab as yet, and I don't have a DSI83 myself.
> This is relaying experimentation from others.
> They're using the DSI clock lane as the clock source.Yes the clock
> lane on the Pi is started before any of the enable bridge calls.
> 
> In the vc4 driver[1] it runs through the all pre-enables, configures
> register DISP0_CTRL including setting bit DSI_DISP0_ENABLE which
> starts it requesting pixels from the pipeline, and then calls all the
> enables. With that behaviour it fails to start the DSI83.
> 
> If the DSI83 I2C setup code is moved from enable to pre_enable then it
> works, or if patch [2] is used to move the setting of the
> DSI_DISP0_ENABLE bit to after enable it also works.

The pre_enable option won't work on MX8M and I suspect Exynos5, because 
that DSIM PHY only enables the DSI HS clock in its bridge enable 
(whether that is OK or not, I cannot tell, I am hoping someone can 
clarify that).

> Sorry life is all rather up in the air with working from home. I'll go
> into the lab and try to confirm that DSI_DISP0_ENABLE does what the
> documentation implies it does.
> Those who do have hardware now have it working on the Pi, although
> with a version of Jagan's driver rather than yours. We're trying to
> figure out the diffs with yours.

All right, if you figure it out, I'd be interested to know what it is.

> If you have it working reliably on other platforms that you believe
> are following the docs during pre_enable and enable, then I'm happy to
> drop out of the discussions for now. We can revisit it once we have
> determined exactly why it's being fussy on the Pi.

Since you have one working setup and another non-working, and the only 
difference is the DSI83 bridge driver, it should be possible to find the 
difference easily.

I had a look at the driver from Jagan again, and there is no 
configuration in pre_enable either, so the pre_enable is likely not the 
reason why it works for you. Maybe the extra mdelays the driver adds all 
over the place are the reason ?

> Cheers
>    Dave
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vc4/vc4_dsi.c#L1072
> [2] https://github.com/6by9/linux/commit/b939eaffc47cc84ebfea6bf1ab10ae1ec9fa58c2
> 

[...]
