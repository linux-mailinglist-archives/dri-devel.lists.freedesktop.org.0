Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94405390432
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 16:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF306E0CE;
	Tue, 25 May 2021 14:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9721B6E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:42:51 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B5D0B80C92;
 Tue, 25 May 2021 16:42:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1621953769;
 bh=NGj3U3rboIWlgL35MFMSkGFA7UwkZOWP2J8Bt5SiyMU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=d8NgQDwQbPSX6OlP8zyj3wQEV6sjF0dJ65ZWSfZuSnjaalsVcbStqR+MXUs8p4uMj
 5kJH/7m1zJVhIA7A2h3AjxaCaKHxH1E5AVburKd408/fo4GELTxD/Sfxcw5hNdzCl+
 PepLOs0qp6wJyjypHx9LYFhM7pz2AjrD+AcdPO1pbl4p9I3O10tTtMjO98g52XLk+1
 fYT+t3zHIF80VFy5oDje0szE2MQO5Bc5O7o0jVAMawC2vjAknjSaYCtTalBmPU/urk
 IZJgbmJsA5LsXM/MYS9XqhS3OiiesZqLtJ+7Ewo7VVgmSBOYhyPolLk9fiM8yzpCax
 EmMvXrWsf0esQ==
Subject: Re: [V3, 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84
 driver
To: Mike Looijmans <mike.looijmans@topic.nl>, dri-devel@lists.freedesktop.org
References: <20210505100218.108024-2-marex@denx.de>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.d251689f-a6ba-486d-bfa1-070ac0c167d5@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.81349e00-3f39-4654-ab28-8c85568d0c51@emailsignatures365.codetwo.com>
 <f61c710e-cd12-f1cf-d05b-759fd2c0e8b1@topic.nl>
 <61fe258a-c89b-ffa8-2773-0e7eef35b612@denx.de>
 <27f1e433-3290-c5ea-d338-83906ef10b3f@topic.nl>
 <ecc4d3b6-4d74-02f7-e09b-1dfb3881b6e8@denx.de>
 <e977a404-1c00-a37f-fecc-9440eeb37ab9@topic.nl>
From: Marek Vasut <marex@denx.de>
Message-ID: <d86d0fea-83d1-69ee-9772-2605bbe19db8@denx.de>
Date: Tue, 25 May 2021 16:42:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <e977a404-1c00-a37f-fecc-9440eeb37ab9@topic.nl>
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
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/25/21 4:23 PM, Mike Looijmans wrote:

Hi,

[...]

>>>> Which system/soc are you testing this on ?
>>>
>>> On a raspberry-pi 4 at the moment.
>>
>> Ah, OK, it seems this bridge is popular on RPi.
>> Is there some adapter board with such a bridge for RPi available ?
> 
> Nope, but about 4 subscribers on the RPi forum have created their own 
> PCB. I'm working for a company that did their own PCB too and my job for 
> them is to get it to work...
> 
> The DSI-to-LVDS bridge is a lot cheaper (and simpler) than a 
> HDMI-to-LVDS bridge. In hardware that is.

Oh, I see

[...]

>>> Alternatively, one can modify the RPi DSI code to start sending data 
>>> after the enable calls. That also works on my setup, with everything 
>>> in enable.
>>>
>>> The major point here is that you should pick one and only one 
>>> callback: pre-enable or enable. The GPIO reset code as well as 
>>> writing the registers should be done in that one method.
>>
>> Why , please elaborate ? It seems to be if there was no need for those 
>> two callbacks, there would be no two callbacks in the API in the first 
>> place. There is a chance you will get disable()->enable() sequence 
>> without going through post_disable()->pre_enable() as far as I can tell.
> 
> The datasheet states that "the DSI CLK lanes MUST be in HS state and the 
> DSI data lanes MUST be driven to LP11 state" when the reset de-asserts 
> (goes high) and when the CSR registers are being written.
> 
> Your driver now de-asserts the reset in the pre_enable and writes the 
> CSR registers in enable. This is the "least likely to work" option.

Understood. However, it seems to work on iMX8MM and MN just fine.

Is there a problem on the RPi, that the driver does not work on it ?

> Both the reset and the CSR writing are to be done in the same context. 
> So either everything in "pre_enable", or everything in "enable". Which 
> one is correct is up to the maintainers, I also don't know which is 
> best. The other callback can just remain unused.
> 
> If the choice is to do the chip initialization in "pre_enable" then do 
> all the de-initialization in "post_disable". If the choice is to do the 
> chip initialization in "enable" then do all the de-initialization in 
> "disable".
> 
> If for some platform the choice happens to be wrong, it's a very simple 
> patch (just change the "ops" pointers) to change it and make it work for 
> that platform.
> 
> Alternatively, it's possible to make it a runtime choice through 
> devicetree or so as to whether the CSR initializes at "enable" or 
> "pre-enable".

That would mean you encode policy in DT, so not an option.

I would suggest we stop this discussion until there is input from the 
maintainers. It could even be there is an API missing for configuring 
the clock/data/LP/HS modes which needs to be added.

>>> Same for (post)disable for symmetry. There's no point keeping the 
>>> chip awake after a disable.
>>>
>>>
>>> It's pretty likely for a DSI driver to have the clock active in order 
>>> to allow the panel driver to send MIPI commands and things like that. 
>>> So everything in pre_enable makes sense.
>>
>> That's how the RPi behaves, on MX8M the DSI clock are active only in 
>> enable. But that might be wrong, see below.
>>
>>> I don't know how the platform you're testing on is behaving in this 
>>> respect?
>>
>> iMX8M{M,N}.
>>
>> And I suspect the DSI behaves differently than on RPi. And that is why 
>> I would like to get some clarification on what (clock, data, LP and 
>> HS) is enabled where from the maintainers.
> 
> Suspect so.

Yes

> As I wrote before, any DSI that adheres to the documentation 
> would never work with this chip. The chip won't work without clock and 
> it also won't work if the DSI is already sending video data is my 
> experience.

The later part would mean this driver could never work on iMX8M, but it 
does, on multiple iMX8MM and MN. So the chip must be tolerant at least 
toward data on the data lanes when it is being configured.

[...]
