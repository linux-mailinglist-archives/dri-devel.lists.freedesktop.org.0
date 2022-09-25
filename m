Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C81765E9426
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 17:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D921310E1E4;
	Sun, 25 Sep 2022 15:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7462F10E1E4;
 Sun, 25 Sep 2022 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sDUzqos38NTHKjqKIbjlgYCo7KMd6hyJQ5kwVtvn2uY=; b=aUOU3kpP1xZAGZ3dK/FPnPmN44
 IFB5fkqB+7/gDaDlxHDtUFNwExLm2Y82UixoykTgQQFV7UJ6zCaI0TRAb016BK+MWPxFKYT87rEuu
 A1bemkbLrV1sxM+2rSTYFVMhsHyHGsq8Rf5UKYL8o5L/v38Oko/QwO4yL+3vCtNEhQg8MU+JZMiPA
 EVy0sNCfGvxloaFKqVVe04oxeKvT4KDyGC/4SyyWNp2P84LU3a9mSkwuvbNZUIkVWdQ0IQJa+7xOQ
 D6+Uxr3m1gcVDNPJI6COfxOM261GO67oHOOTfGyHSXgD0+10bhAg/cDRWDQBl5062iEgkhFEBsL6J
 km1Dw7Vw==;
Received: from [2a01:799:961:d200:f09d:f08a:eb68:87b1] (port=49636)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ocU1u-0001pc-49; Sun, 25 Sep 2022 17:58:54 +0200
Message-ID: <b5fcb40b-fe9a-c634-902f-35808adfca68@tronnes.org>
Date: Sun, 25 Sep 2022 17:58:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 00/33] drm: Analog TV Improvements
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 22.09.2022 16.25, skrev Maxime Ripard:
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

<snip>

>  drivers/gpu/drm/drm_atomic_state_helper.c       | 128 ++++-
>  drivers/gpu/drm/drm_atomic_uapi.c               |   8 +
>  drivers/gpu/drm/drm_client_modeset.c            |   4 +
>  drivers/gpu/drm/drm_connector.c                 | 111 +++-
>  drivers/gpu/drm/drm_modes.c                     | 658 +++++++++++++++++++++++-
>  drivers/gpu/drm/gud/gud_connector.c             |  12 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c                |   6 +-
>  drivers/gpu/drm/i915/display/intel_tv.c         |   5 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c       |   6 +-
>  drivers/gpu/drm/sun4i/sun4i_tv.c                | 148 ++----
>  drivers/gpu/drm/tests/Makefile                  |  16 +-
>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 239 +++++++++
>  drivers/gpu/drm/tests/drm_cmdline_parser_test.c |  67 +++
>  drivers/gpu/drm/tests/drm_kunit_helpers.c       |  54 ++
>  drivers/gpu/drm/tests/drm_kunit_helpers.h       |   9 +
>  drivers/gpu/drm/tests/drm_modes_test.c          | 136 +++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c                  |   2 +-
>  drivers/gpu/drm/vc4/vc4_vec.c                   | 339 ++++++++++--
>  include/drm/drm_atomic_state_helper.h           |   4 +
>  include/drm/drm_connector.h                     |  92 +++-
>  include/drm/drm_mode_config.h                   |  12 +-
>  include/drm/drm_modes.h                         |  17 +

These also needs updating:

Documentation/gpu/kms-properties.csv
Documentation/fb/modedb.rst

Noralf.
