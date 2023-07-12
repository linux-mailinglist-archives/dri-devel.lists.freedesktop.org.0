Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F4750FA1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 19:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B815110E59D;
	Wed, 12 Jul 2023 17:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C58A10E59D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 17:25:44 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A1B38862DA;
 Wed, 12 Jul 2023 19:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689182741;
 bh=+/9P2RDXkiWPawrkFasbFUXp9kTFyBQDTDMgqnS3V40=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rPSZVMpsSu5adOopxN6lmiMgXGvSBMEb75b3Ay6TjHJpd5yt5Ei6qx3fvD7gRbYJK
 XhTRohT+EeRlEvi2TwZAXrfPYVC9n+pjcaLSqMIDBa8aj+JM1n2c6Orq+dt+Npo8HZ
 OJ/DXUjUfLxAV2mxBpLXBRGtTnZZD97SQZSK1/RpULtQ751VU91yo4JwQselLbZev+
 ocLKwv4oUdO8FOkyvhlUfJNVnB8gpSXyXXUq04uy6b3z4DFqOtt54/54hGOz500I1C
 c/wKEiaabF3xdx5pNxdFz4sr3D0wj4Dc7wSRZ7mfWrTy/aCIhfPyG61w1x/qbowxy5
 m2Zb5YYroIkaw==
Message-ID: <ff5270e7-573d-2700-881f-1358683f2618@denx.de>
Date: Wed, 12 Jul 2023 19:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
 <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
 <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
 <CACRpkdYXtQwmZR1u-1fwmyC_8Yq4bMkjDBcUCfuGqSz_UhXWJQ@mail.gmail.com>
 <CAO9szn0OuKW+-JZMs3TPUHiwLCe6cUPcsUq+og64K2utMyZpqQ@mail.gmail.com>
 <CACRpkdb5stXKb7FNk_FC-PKduCngRX3sZTbzcxN+kRskz78fuQ@mail.gmail.com>
 <CAO9szn3oTzrrwiyr91H14ep7OPUkA-SDST3CSQAQHvFFnkJWfA@mail.gmail.com>
 <0d43e653-32cd-b25e-40fa-6f0571048467@denx.de>
 <CAO9szn20RY3uBDceyUJ1S+gb=FN8Hd5qqMfOSbitHFyFCZ+iLg@mail.gmail.com>
 <8b0ae1d1-c769-1f55-0452-4bbc62da133b@denx.de>
 <CAO9szn1QdB5WGshuyCOGqb0qbBWHqoikeiMkk+bNGhAF5TX5ew@mail.gmail.com>
 <45488dcc-226e-1e7c-c681-c1d9be17bcbb@denx.de>
 <CAO9szn3scWfrP3mB8QnvPewZegV0=6iD8PE2bOS09HuN6gywmg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAO9szn3scWfrP3mB8QnvPewZegV0=6iD8PE2bOS09HuN6gywmg@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Jagan Teki <jagan@amarulasolutions.com>, sam@ravnborg.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/23 17:10, Paulo Pavacic wrote:

Hi,

[...]

>>>> Or whether it makes sense to outright have a separate driver. The later
>>>> would introduce duplication, but maybe that much duplication is OK.
>>>
>>> I would like to create new driver because panel-st7701 seems to be
>>> outdated and is using non-standard macro (ST7701_WRITE()
>>
>> There is no such macro:
>>
>> $ git grep ST7701_WRITE drivers/gpu/drm/panel/ | wc -l
>> 0
>>
>> There never was such a macro used in the driver either, are you sure you
>> are not using some hacked up patched downstream fork of the driver ?
> 
> I meant ST7701_DSI() macro; It can be replaced with
> mipi_dsi_generic_write_seq from kernel 6.3. Sorry for the confusion.

OK

>> $ git log -p next/master --
>> drivers/gpu/drm/panel/panel-sitronix-st7701.c | grep ST7701_WRITE | wc -l
>> 0
>>
>>> ) and for me
>>> it is crashing kernel 5.15.
>>
>> Have you based all the aforementioned discussion and argumentation on
>> year and half old Linux 5.15.y code base too ?
>>
>> If so, you are missing many patches:
>>
>> $ git log --oneline --no-merges v5.15..next/master --
>> drivers/gpu/drm/panel/panel-sitronix-st7701.c
>> 5a2854e577dc2 drm: panel: Add orientation support for st7701
>> e89838968ee44 drm: panel: Add Elida KD50T048A to Sitronix ST7701 driver
>> c62102165dd79 drm/panel/panel-sitronix-st7701: Remove panel on DSI
>> attach failure
>> 49ee766b364ed drm/panel/panel-sitronix-st7701: Clean up CMDnBKx selection
>> c1cdee9b685a1 drm/panel/panel-sitronix-st7701: Fix RTNI calculation
>> 57b2efce45ef5 drm/panel/panel-sitronix-st7701: Add Densitron
>> DMT028VGHMCMI-1A TFT
>> 42542c7904cf2 drm/panel/panel-sitronix-st7701: Split GIP and init sequences
>> 83b7a8e7e88e7 drm/panel/panel-sitronix-st7701: Parametrize voltage and
>> timing
>> de2b4917843cd drm/panel/panel-sitronix-st7701: Infer horizontal pixel
>> count from TFT mode
>> 82f9cee25598a drm/panel/panel-sitronix-st7701: Adjust porch control
>> bitfield name
>> 1ba85119afb5e drm/panel/panel-sitronix-st7701: Infer vertical line count
>> from TFT mode
>> 779c84fea3dbd drm/panel/panel-sitronix-st7701: Make gamma correction TFT
>> specific
>> 7fa8e07128ed6 drm/panel/panel-sitronix-st7701: Make voltage supplies
>> common to ST7701
>> a6c225be3da7e drm/panel/panel-sitronix-st7701: Enable DSI burst mode,
>> LPM, non-continuous clock
>> 6f481afe220d3 drm/panel/panel-sitronix-st7701: Make DSI mode flags
>> common to ST7701
>> 79abca2b39900 drm/mipi-dsi: Make remove callback return void
> 
> I will try backporting those patches to 5.15 and applying them to see
> whether it will then work with initialization sequences provided in
> this merge request just to be sure not to have duplication. We are
> still working on transitioning to newer kernel so for the time being
> I'm using mostly 5.15.
> 
> On 5.15 kernel I have following kernel panic only with st7701 from the
> panel drivers I have tried:
> 
> [   20.255322] Kernel panic - not syncing: Asynchronous SError Interrupt
> [   20.255326] CPU: 1 PID: 36 Comm: kworker/1:1 Tainted: G           O
>       5.15.77-5.15.77-2.1.0 #1

The latest 5.15.y is 5.15.120 , can you re-test on that version ?

> [   20.255330] Hardware name: XXX i.MX8XX board:XXX (DT)

Is this some NXP downstream kernel fork with thousands of extra patches?
The version string 2.1.0 looks very much like NXP versioning scheme ...

[...]
