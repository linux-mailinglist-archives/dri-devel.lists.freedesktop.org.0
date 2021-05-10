Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126073784BC
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 13:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F776E450;
	Mon, 10 May 2021 11:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C156E450
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 11:16:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2411C81660;
 Mon, 10 May 2021 13:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1620645411;
 bh=YxuFjti80b/meH94Luf0hQJ7WRKw1QDiHemg7IBzxPY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S+pS4qtwVXXcCYCPLVRtiWfWbbheIa/nSE+7fCfXtDvBQkOv398jVQaC8WzO9b17h
 MjQa8KAaoljPPCGx9Zhj3Bspi1sN9TIQfgvlwQSLjiZoeWYPltK60rzqHyoSE8Hkgb
 W+dcYD91QwZxBMSMg39CU1Y6W0v0iqVjaA2vleXQKuCSJL2VOnKMcZSAb6/khE2oei
 hTBZzCOULdGSOBbdv2xfHFypMM1SbbBSGrJYQiDQVdfWBeZ27Ww0LCfe0usBEKg1+l
 kGWdsHkXDiZAd+j7cN3oQ4a6baqrVq1ZXhidUP/vC9jj/Zbaa55RFlgjhLSu266jn5
 5CiLOPVHjB32A==
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <CAPY8ntCzu6=uBqRfQ+9QJWH-zqy0K9FD8XWdC8NZxJZiUBfYfg@mail.gmail.com>
 <8d2fbc9b-fb3e-aac9-566a-033c4bb218d7@denx.de>
 <CAPY8ntDMJyUHvKn=4fXZK2tYTQ9Lj_QTY-zk_1h+oZ-fQ80E+w@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <5a895cb3-92fd-32c4-2133-cd5b6b914790@denx.de>
Date: Mon, 10 May 2021 13:16:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntDMJyUHvKn=4fXZK2tYTQ9Lj_QTY-zk_1h+oZ-fQ80E+w@mail.gmail.com>
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

On 5/10/21 11:58 AM, Dave Stevenson wrote:
> On Sat, 8 May 2021 at 21:26, Marek Vasut <marex@denx.de> wrote:
>>
>> On 5/7/21 2:48 PM, Dave Stevenson wrote:
>>
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
>>>
>>> Sorry, a further thread of discussion coming from the investigations
>>> I've been involved with.
>>>
>>> You've powered up in pre_enable, and are sending the I2C writes in enable.
>>>
>>> >From the docs for drm_bridge_funcs->enable[1]
>>>
>>>    * The bridge can assume that the display pipe (i.e. clocks and timing
>>>    * signals) feeding it is running when this callback is called. This
>>>    * callback must enable the display link feeding the next bridge in the
>>>    * chain if there is one.
>>>
>>> So video is running when enable is called, and the DSI data lanes may
>>> be HS. (Someone correct me if that is an incorrect reading of the
>>> text).
>>>
>>> The SN65DSI84 datasheet table 7-2 Initialization Sequence gives init
>>> seq 8 as being "Change DSI data lanes to HS state and start DSI video
>>> stream", AFTER all the I2C has been completed except reading back
>>> registers and checking for errors.
>>> With video running you don't fulfil the second part of init seq 2 "the
>>> DSI data lanes MUST be driven to LP11 state"
>>>
>>> My investigations have been over delaying starting the DSI video
>>> stream until after enable, but reading the descriptive text for enable
>>> I believe the Pi is correct to be sending video at that point.
>>> I guess there is some ambiguity as to whether the clock lane is going
>>> to be in HS mode during pre_enable. On the Pi the PHY and clocks will
>>> be enabled prior to pre_enable to allow for sending DSI commands
>>> during pre_enable, but it may not be true on other platforms.
>>
>> You have to make sure the clock lane is running and in HS mode when
>> configuring the DSI83, otherwise the internal DSI83 state machine won't
>> be able to operate.
> 
> Indeed, but my reading of the documentation says that neither
> pre_enable nor enable give you the state that you require.
> You need a hook in the middle, an option to ask for clock lanes during
> pre_enable or no video during enable, or an amendment to the docs over
> the state during enable.
> 
> Having the data lanes in HS mode does appear to stop the DSI83
> accepting the I2C setup commands.

Uhh, that is new. Is that what you observed in your lab ?

I saw the DSI83 behave this way if the clock lane was stopped, but the 
data lanes had no impact. Was your clock lane running when the DSI83 was 
not accepting i2c commands ? Does your DSI83 source clock from it or 
from external Xtal ?
