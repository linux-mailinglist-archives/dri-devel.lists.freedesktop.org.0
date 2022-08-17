Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0C3596F46
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 15:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD8A91FAD;
	Wed, 17 Aug 2022 13:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27AD113808
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pDCos68B5fYwu0J1jHvoBMN3b2H9PzkwSjTTD6oc4Dw=; b=oVNxVfBIagqBVB/GeyTV+RhXYd
 S8ASJh3xQZDwqE6gAnoLqjXC9bWw93kEfTEAefgEu81WQzDL2nznsNJ4qNahSV8kmR2RxpfQc+07l
 1yRaxTwA5ko/aV0cNqLd/cz9NIrf9PAq0q7s7/1k3Yy+qS4zzo+9/rstZMPWMeehQ1U8tWBo/AqIS
 DcjahO0y3Yl75jQVKAn1QEtCUqEn4zW9UDhNrfck3LAXPee8SdrmCoWlAJdM9mbdH2MZpUMyYz7/V
 y1qCPpU0USakhogU+uY999Au6Tz/Y5yIF3GollJ6UicsaWsXbW1b+uwOptqGmYZmVDQ8up7XUhys6
 wwHeH59A==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=62332)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oOIq4-0007wI-6A; Wed, 17 Aug 2022 15:12:04 +0200
Message-ID: <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
Date: Wed, 17 Aug 2022 15:11:56 +0200
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
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220817114605.jpb3tlnoseyvf65d@houat>
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



Den 17.08.2022 13.46, skrev Maxime Ripard:
> On Tue, Aug 16, 2022 at 09:35:24PM +0200, Noralf Trønnes wrote:
>> Den 16.08.2022 11.49, skrev Maxime Ripard:
>>> On Tue, Aug 16, 2022 at 11:42:20AM +0200, Noralf Trønnes wrote:
>>>> Den 16.08.2022 10.26, skrev Maxime Ripard:
>>>>> Hi,
>>>>>
>>>>> On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Trønnes wrote:
>>>>>> Den 29.07.2022 18.34, skrev Maxime Ripard:
>>>>>>> The TV mode property has been around for a while now to select and get the
>>>>>>> current TV mode output on an analog TV connector.
>>>>>>>
>>>>>>> Despite that property name being generic, its content isn't and has been
>>>>>>> driver-specific which makes it hard to build any generic behaviour on top
>>>>>>> of it, both in kernel and user-space.
>>>>>>>
>>>>>>> Let's create a new bitmask tv norm property, that can contain any of the
>>>>>>> analog TV standards currently supported by kernel drivers. Each driver can
>>>>>>> then pass in a bitmask of the modes it supports.
>>>>>>>
>>>>>>> We'll then be able to phase out the older tv mode property.
>>>>>>>
>>>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>>>>>
>>>>>>
>>>>>> Please also update Documentation/gpu/kms-properties.csv
>>>>>>
>>>>>> Requirements for adding a new property is found in
>>>>>> Documentation/gpu/drm-kms.rst
>>>>>
>>>>> I knew this was going to be raised at some point, so I'm glad it's that
>>>>> early :)
>>>>>
>>>>> I really don't know what to do there. If we stick by our usual rules,
>>>>> then we can't have any of that work merged.
>>>>>
>>>>> However, I think the status quo is not really satisfactory either.
>>>>> Indeed, we have a property, that doesn't follow those requirements
>>>>> either, with a driver-specific content, and that stands in the way of
>>>>> fixes and further improvements at both the core framework and driver
>>>>> levels.
>>>>>
>>>>> So having that new property still seems like a net improvement at the
>>>>> driver, framework and uAPI levels, even if it's not entirely following
>>>>> the requirements we have in place.
>>>>>
>>>>> Even more so since, realistically, those kind of interfaces will never
>>>>> get any new development on the user-space side of things, it's
>>>>> considered by everyone as legacy.
>>>>>
>>>>> This also is something we need to support at some point if we want to
>>>>> completely deprecate the fbdev drivers and provide decent alternatives
>>>>> in KMS.
>>>>>
>>>>> So yeah, strictly speaking, we would not qualify for our requirements
>>>>> there. I still think we have a strong case for an exception though.
>>>>
>>>> Which requirements would that be? The only one I can see is the
>>>> documentation and maybe an IGT test.
>>>
>>> This is the one I had in mind
>>> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
>>>
>>
>> Oh right, I had forgotten about that one.
>>
>> One benefit of having a userspace implementation is that it increases
>> the chance of widespread adoption having a working implementation to
>> look at. I don't think the reason tv.mode is not used anywhere (that I
>> know of) is because the driver picks the enum values resulting in no
>> standard names.
> 
> It probably doesn't help, but it's not what I was implying.
> 
>> It's a niche thing and way down on the todo list. nouveau and ch7006
>> has a tv_norm module parameter which certainly doesn't help in moving
>> people/projects over to the DRM property (downstream rpi also has it
>> now).
> 
> Yeah, the RPi version is part of the reason I started working on this.
> We should also consider the named modes used by vc4 and sun4i. All these
> ad-hoc solutions are limited and (I think) come from the fact that we
> don't have a solution easy enough to use for drivers (and to discover).
> 
> nouveau, ch7006, i915 and vc4 are using the tv.mode property for
> example, but sun4i and meson don't.
> 
> sun4i relies on named modes to reimplement TV modes, but meson doesn't
> at all.
> 
> And then nouveau has that extra command line parameter to set it up at
> boot time.
> 
> It doesn't really make much sense to me, when all drivers have very
> similar needs, that none of them behave in the same way. And I think the
> non-standard property is partly to blame for this, since without some
> generic content we can't share code.
> 
> This is what this series is about: every driver having similar
> capabilities and as trivially as possible.
> 
>> mpv[1] is a commandline media player that after a quick look might be a
>> candidate for implementing the property without too much effort.
> 
> Kodi might be another one. I can try to hack something around, but I'm
> really skeptical about whether a PR would be merged or not.
> 

You can ask first before wasting time ofc.

But this baffles me, if you don't think projects like Kodi which is TV
centered want this, what kind of projects do you think want to use this
property?

>> How do you test the property? I've used modetest but I can only change
>> to a tv.mode that matches the current display mode. I can't switch from
>> ntsc to pal for instance.
> 
> Yep, if you want to change from PAL to NTSC, it will require a new mode.
> 

So userspace has to check tv.mode first and then create a display mode
the driver will accept if switching to a different display mode is
necessary? In other words, userspace can't discover from the kernel
which display modes a certain tv.mode/norm provides before it is
selected? If so, maybe libdrm should have some function(s) to deal with
switching between modes that require a different display mode since
knowledge about which display modes a tv.mode supports is needed before
hand.

Noralf.
