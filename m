Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E85AA01D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 21:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD5910E1AF;
	Thu,  1 Sep 2022 19:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6ED10E1A8;
 Thu,  1 Sep 2022 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HSmU8cbfTMrBaPDEft9ugvcLZ7df9DZiQiiVlzQT0Tw=; b=qLjy/48/HybrCZXhucwMbBtKJp
 3TQbxLtZYMvSPYnBIV1FP4YMZdeVxZdeb8IrBeAhyjcHbR48eZ3cqwaUyKSRMM6DOQ9iZfJ2XCPD6
 av7PC77mmiFG6qUN0YW2TLxNBmhG/OHSuD5qut6FTgE9i/x1rSJzTI8Sc2eAma98W6N4XxH64KZyD
 nX//akYOhh3zihSmyGBz7pNFVaeuP5f+pGW5j4s9zWcQ2RNqzSMRDsGMOSZkpxU2nUJWqrKaD0MyS
 K6gTTOv8Lx+Cv8ibktpYIIY5h542j1BJDWvYwCzIYBQPXPj6+c9B6PKY4gZZIneg3dathxMx/k1tv
 4FK26vCQ==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=52634)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oTpyL-0002UR-US; Thu, 01 Sep 2022 21:35:29 +0200
Message-ID: <24e09a29-6d04-3b1e-63ce-cd3c31d350e2@tronnes.org>
Date: Thu, 1 Sep 2022 21:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 00/41] drm: Analog TV Improvements
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 29.08.2022 15.11, skrev Maxime Ripard:
> Hi,
> 
> 
> 
> Here's a series aiming at improving the command line named modes support,
> 
> and more importantly how we deal with all the analog TV variants.
> 
> 
> 
> The named modes support were initially introduced to allow to specify the
> 
> analog TV mode to be used.
> 
> 
> 
> However, this was causing multiple issues:
> 
> 
> 
>   * The mode name parsed on the command line was passed directly to the
> 
>     driver, which had to figure out which mode it was suppose to match;
> 
> 
> 
>   * Figuring that out wasn't really easy, since the video= argument or what
> 
>     the userspace might not even have a name in the first place, but
> 
>     instead could have passed a mode with the same timings;
> 
> 
> 
>   * The fallback to matching on the timings was mostly working as long as
> 
>     we were supporting one 525 lines (most likely NSTC) and one 625 lines
> 
>     (PAL), but couldn't differentiate between two modes with the same
> 
>     timings (NTSC vs PAL-M vs NSTC-J for example);
> 
> 
> 
>   * There was also some overlap with the tv mode property registered by
> 
>     drm_mode_create_tv_properties(), but named modes weren't interacting
> 
>     with that property at all.
> 
> 
> 
>   * Even though that property was generic, its possible values were
> 
>     specific to each drivers, which made some generic support difficult.
> 
> 
> 
> Thus, I chose to tackle in multiple steps:
> 
> 
> 
>   * A new TV norm property was introduced, with generic values, each driver
> 
>     reporting through a bitmask what standard it supports to the userspace;
> 
> 
> 
>   * This option was added to the command line parsing code to be able to
> 
>     specify it on the kernel command line, and new atomic_check and reset
> 
>     helpers were created to integrate properly into atomic KMS;
> 
> 
> 
>   * The named mode parsing code is now creating a proper display mode for
> 
>     the given named mode, and the TV standard will thus be part of the
> 
>     connector state;
> 
> 
> 
>   * Two drivers were converted and tested for now (vc4 and sun4i), with
> 
>     some backward compatibility code to translate the old TV mode to the
> 
>     new TV mode;
> 
> 
> 
> Unit tests were created along the way.
> 
> 
> 
> One can switch from NTSC to PAL now using (on vc4)
> 
> 
> 
> modetest -M vc4  -s 53:720x480i -w 53:'tv norm':0
> 
> 
> 
> modetest -M vc4 -s 53:720x480i -w 53:'tv norm':4
> 

The property name has changed, this gives me PAL:

$ modetest -M vc4 -s 45:720x576i -w 45:'TV mode':4


I have finally found a workaround for my kernel hangs.

Dom had a look at my kernel and found that the VideoCore was fine, and
he said this:

> That suggests cause of lockup was on arm side rather than VC side.
>
> But it's hard to diagnose further. Once you've had a peripheral not
> respond, the AXI bus locks up and no further operations are possible.
> Usual causes of this are required clocks being stopped or domains
> disabled and then trying to access the hardware.
>

So when I got this on my 64-bit build:

[  166.702171] SError Interrupt on CPU1, code 0x00000000bf000002 -- SError
[  166.702187] CPU: 1 PID: 8 Comm: kworker/u8:0 Tainted: G        W
    5.19.0-rc6-00096-gba7973977976-dirty #1
[  166.702200] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
[  166.702206] Workqueue: events_freezable_power_ thermal_zone_device_check
[  166.702231] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS
BTYPE=--)
[  166.702242] pc : regmap_mmio_read32le+0x10/0x28
[  166.702261] lr : regmap_mmio_read+0x44/0x70
...
[  166.702606]  bcm2711_get_temp+0x58/0xb0 [bcm2711_thermal]

I wondered if that reg read was stalled due to a clock being stopped.

Lo and behold, disabling runtime pm and keeping the vec clock running
all the time fixed it[1].

I don't know what the problem is, but at least I can now test this patchset.

[1] https://gist.github.com/notro/23b984e7fa05cfbda2db50a421cac065

Noralf.
