Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D5C5F1C50
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 15:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8278710E574;
	Sat,  1 Oct 2022 13:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED4C10E31D;
 Sat,  1 Oct 2022 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xm3k3rXTAnM3/xBtTJRt1rIfPDOB6Gc4ge2d1vnIVMQ=; b=BI4lHTeKnCtdWww6MSKbeGl4uV
 VsTh3DKF4fINvj8Zr4SEnGvHBeNPn8XaA+liKHN0D5DDaL2uaWmFB7nMA1wteQP4Um8gqKD3BaspB
 HJBu3ByVglpIMAGg5gpTAIq5D7UprmsY/KzWo8RRbUEKCjugXwS4xuJSOwWOWWq0LwirIcjRMgp+n
 uZoFtOq2U2LKJmewAnGrQsC7X8DlLRxS/HHwx7bswRS2D5a3FF885zOom4T/6GkKLiQetg4e2b5xM
 AuRq8h1wAY0U4hGcBZQ005Nnjg4u7RchLaPQQF5mUZt2mb+sDLlNoqLq4ArIP9xzrgdxjG1Z4DRQ/
 aLAf9/GA==;
Received: from [2a01:799:961:d200:138:ce02:d9d4:d972] (port=61118)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oecHr-0005NI-V7; Sat, 01 Oct 2022 15:12:12 +0200
Message-ID: <0db1c833-eeee-cadd-b050-837d79a3d691@tronnes.org>
Date: Sat, 1 Oct 2022 15:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v4 00/30] drm: Analog TV Improvements
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Lyude Paul <lyude@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 29.09.2022 18.30, skrev Maxime Ripard:
> Hi,
> 
> Here's a series aiming at improving the command line named modes support,
> and more importantly how we deal with all the analog TV variants.
> 
> The named modes support were initially introduced to allow to specify the
> analog TV mode to be used.
> 
> However, this was causing multiple issues:
> 
>   * The mode name parsed on the command line was passed directly to the
>     driver, which had to figure out which mode it was suppose to match;
> 
>   * Figuring that out wasn't really easy, since the video= argument or what
>     the userspace might not even have a name in the first place, but
>     instead could have passed a mode with the same timings;
> 
>   * The fallback to matching on the timings was mostly working as long as
>     we were supporting one 525 lines (most likely NSTC) and one 625 lines
>     (PAL), but couldn't differentiate between two modes with the same
>     timings (NTSC vs PAL-M vs NSTC-J for example);
> 
>   * There was also some overlap with the tv mode property registered by
>     drm_mode_create_tv_properties(), but named modes weren't interacting
>     with that property at all.
> 
>   * Even though that property was generic, its possible values were
>     specific to each drivers, which made some generic support difficult.
> 
> Thus, I chose to tackle in multiple steps:
> 
>   * A new TV mode property was introduced, with generic values, each driver
>     reporting through a bitmask what standard it supports to the userspace;
> 
>   * This option was added to the command line parsing code to be able to
>     specify it on the kernel command line, and new atomic_check and reset
>     helpers were created to integrate properly into atomic KMS;
> 
>   * The named mode parsing code is now creating a proper display mode for
>     the given named mode, and the TV standard will thus be part of the
>     connector state;
> 
>   * Two drivers were converted and tested for now (vc4 and sun4i), with
>     some backward compatibility code to translate the old TV mode to the
>     new TV mode;
> 
> Unit tests were created along the way.
> 
> One can switch from NTSC to PAL now using (on vc4)
> 
> modetest -M vc4  -s 53:720x480i -w 53:'TV mode':1 # NTSC
> modetest -M vc4  -s 53:720x576i -w 53:'TV mode':4 # PAL
> 
> Let me know what you think,
> Maxime
> 

I suggest that you apply the patches that are reviewed, have merrit on
their own and are not tied to the TV mode property.
This will help in keeping this rather big patchset focused and ease the
task for reviewers.

The following seems to be in that group:

  drm/tests: Order Kunit tests in Makefile
  drm/atomic-helper: Rename drm_atomic_helper_connector_tv_reset to
avoid ambiguity
  drm/connector: Rename subconnector state variable
  drm/atomic: Add TV subconnector property to get/set_property
  drm/modes: Only consider bpp and refresh before options
  drm/modes: parse_cmdline: Add support for named modes containing dashes
  drm/vc4: vec: Fix definition of PAL-M mode

Noralf.
