Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F45597A1D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 01:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7055BB04F5;
	Wed, 17 Aug 2022 23:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36F197723
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 23:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vy8IjC4ytmVgtE4WiKJlzHK2KV7oXQXXOSGLLqZ9y04=; b=oTgogptRyiMoOmoHALGOlPZgMh
 D1Ju0RvJe/0scBxdEqE+ZJQFmvMZC29tOJlBgtT0mVGlwBwWjc9U1T4VIFmP3Ov0G4jh7DYrtKkTu
 cAnxMD+oOg5LMip4DwJHZB/zq6w90/1RCJ48FxhejAi1WbXiKQovN2I5q3pvjOYkR8sPvU+bIc08G
 GSWDKzymJW9GmsKR2A+vKkCLUcl48w78CML+9Qc2xf1haES/zv288eUJyYpjJXq8WRU30mS0ttbuI
 0z5ue40C7i4yXuiZuDIGa+fZ0X53YM4M2EIU10hdhMNVPVZ5qg1ZUjPRj3/HXzlOz8KOmMelCsB7u
 nXSxIrfw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=52827)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oOSNZ-0004zx-So; Thu, 18 Aug 2022 01:23:17 +0200
Message-ID: <133c2a1d-0b4c-cef9-11fe-9ce9985253d6@tronnes.org>
Date: Thu, 18 Aug 2022 01:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
 <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
 <20220817114605.jpb3tlnoseyvf65d@houat>
 <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 17.08.2022 15.11, skrev Noralf Trønnes:
> 
> 
> Den 17.08.2022 13.46, skrev Maxime Ripard:
>> On Tue, Aug 16, 2022 at 09:35:24PM +0200, Noralf Trønnes wrote:
>>> Den 16.08.2022 11.49, skrev Maxime Ripard:
>>>> On Tue, Aug 16, 2022 at 11:42:20AM +0200, Noralf Trønnes wrote:
>>>>> Den 16.08.2022 10.26, skrev Maxime Ripard:
>>>>>> Hi,
>>>>>>
>>>>>> On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Trønnes wrote:
>>>>>>> Den 29.07.2022 18.34, skrev Maxime Ripard:
>>>>>>>> The TV mode property has been around for a while now to select and get the
>>>>>>>> current TV mode output on an analog TV connector.
>>>>>>>>
>>>>>>>> Despite that property name being generic, its content isn't and has been
>>>>>>>> driver-specific which makes it hard to build any generic behaviour on top
>>>>>>>> of it, both in kernel and user-space.
>>>>>>>>
>>>>>>>> Let's create a new bitmask tv norm property, that can contain any of the
>>>>>>>> analog TV standards currently supported by kernel drivers. Each driver can
>>>>>>>> then pass in a bitmask of the modes it supports.
>>>>>>>>
>>>>>>>> We'll then be able to phase out the older tv mode property.
>>>>>>>>
>>>>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>>>>>>

>>> How do you test the property? I've used modetest but I can only change
>>> to a tv.mode that matches the current display mode. I can't switch from
>>> ntsc to pal for instance.
>>
>> Yep, if you want to change from PAL to NTSC, it will require a new mode.
>>
> 
> So userspace has to check tv.mode first and then create a display mode
> the driver will accept if switching to a different display mode is
> necessary? In other words, userspace can't discover from the kernel
> which display modes a certain tv.mode/norm provides before it is
> selected? If so, maybe libdrm should have some function(s) to deal with
> switching between modes that require a different display mode since
> knowledge about which display modes a tv.mode supports is needed before
> hand.
> 

I haven't used vc4 on Pi4 in mainline before and have finally gotten it
to work.

I see that the connector reports 2 modes that together fit all tv.norms
so userspace doesn't have to contruct a display mode, but it does need
to know which display mode belongs to a certain tv.norm.

When I try to use modetest I'm unable to set a mode:

pi@pi4t:~ $ modetest -M vc4 -s 45:720x480i
setting mode 720x480i-29.97Hz on connectors 45, crtc 68
failed to set mode: Function not implemented

The errno is misleading, modetest does a drmModeDirtyFB before checking
the error returned by drmModeSetCrtc.

Setting the property succeeds, but the modeset still fails:

pi@pi4t:~ $ modetest -M vc4 -s 45:720x480i -w 45:"tv norm":2
setting mode 720x480i-29.97Hz on connectors 45, crtc 68
failed to set mode: Function not implemented

pi@pi4t:~ $ modetest -M vc4 -c
        37 tv norm:
                flags: bitmask
                values: NTSC-443=0x1 NTSC-J=0x2 NTSC-M=0x4 PAL-B=0x10
PAL-M=0x200 PAL-N=0x400 SECAM-B=0x2000
                value: 2

Here's the log, can you see if there's anything obvious in there:
https://gist.github.com/notro/a079498bf6b64327105752b2bafa8858

Noralf.
