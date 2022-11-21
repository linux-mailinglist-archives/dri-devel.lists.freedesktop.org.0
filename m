Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 200056326EB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 15:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BB610E2E4;
	Mon, 21 Nov 2022 14:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB1810E2E2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 14:51:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id o30so8652999wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 06:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NPydWrNdfqIGDmJS35ofH3oOUFMXcgrP2822hY23e4Q=;
 b=b7rA/fYhZMoYD4Ha+nNtQgfE5+5JwqQhN1Vi8ciVD9ticy56QfhkdO7rRLckhUfnWH
 wUZ++ROqe21Z9tqm1YoCr1/EZN0pOFQeRFqL7tNfBXeIn9MX9ITNvpRu1X8ho6eH9ci3
 UabKwK9zsMkJrI+i1wFXsy2D8tDPjdgny8SIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NPydWrNdfqIGDmJS35ofH3oOUFMXcgrP2822hY23e4Q=;
 b=JFjZpwbRUaSwnSXKtNfkIaSXBblfe9SbE5lkxsDP/kIbCjlSI28pIJjN4XR73pAXzo
 +cy+AYGqrYDBgYwXPSG/Z/bnNbACE9fO3RAAk+A0/Owjl70nm0bz/3W+RtnN4mkMZaRg
 UvTKNMQvFjirvjxJnkIQWFXowuz7QKZbsr2hACSwnxNLaVXqYVEty+R2gKz/SPUOWAVh
 lZG9GCAQakzQZhifkFirEMNuY5AL+SQN03Iaqbxs7g+d2G+ZcBzPxudm8n7I4oTAuJ27
 LSTvCQWBuekxZ0JE77lWkMIr+NjQrNz/X4KhnHqqtgbM8IoDYetyI+BxCrXPfbLM0qjn
 KMQw==
X-Gm-Message-State: ANoB5pl7JssH8N4h4PzTiCcMo1VGib85J/GT4xLkNJJtYDpNJnL7EDjU
 PLoN/+kQ+TEw/2pvUriT3B1tow==
X-Google-Smtp-Source: AA0mqf6qLatuwUKGxJQ8235zzwr6t2QAx8gSWiqWJcy9iIeUjKbaWRqJ36As06k4guyP0zP7dkYfUw==
X-Received: by 2002:a7b:cbc6:0:b0:3c6:b650:34dd with SMTP id
 n6-20020a7bcbc6000000b003c6b65034ddmr6437308wmi.45.1669042289540; 
 Mon, 21 Nov 2022 06:51:29 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 e21-20020a05600c219500b003cf894dbc4fsm13847724wme.25.2022.11.21.06.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 06:51:29 -0800 (PST)
Date: Mon, 21 Nov 2022 15:51:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v10 00/19] drm: Analog TV Improvements
Message-ID: <Y3uQbuQotGxh+XPS@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 10:28:43AM +0100, Maxime Ripard wrote:
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

Maxime asked me to drop an Ack-in-principle on this, and I'm not sure I
have any useful input here with my utter lack of understanding for TV
things (I never even had one in my entire life, that's how much I don't
care). But it seems to check all the design boxes around solving annoying
uapi/kms-config issues properly, so

Acked-in-principle-or-something-like-that-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> 
> To: David Airlie <airlied@linux.ie>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Emma Anholt <emma@anholt.net>
> To: Jani Nikula <jani.nikula@linux.intel.com>
> To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> To: Ben Skeggs <bskeggs@redhat.com>
> To: Karol Herbst <kherbst@redhat.com>
> To: Lyude Paul <lyude@redhat.com>
> To: Chen-Yu Tsai <wens@csie.org>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Samuel Holland <samuel@sholland.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dom Cobley <dom@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v10:
> - Rebase on top of drm-misc-next-2022-11-17
> - Fix checkpatch issues
> - Add missing MODULE_* macros
> - Link to v9: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech
> 
> Changes in v9:
> - Rename some tests, switch to kunit_test_suite and parameterized tests where
>   relevant
> - Document the valid named modes
> - Link to v8: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech
> 
> Changes in v8:
> - Changed slightly the helper API to pass in the features
> - Removed unused tv_mode_support function
> - Removed mode name match in _pick_cmdline_mode
> - Added unit tests to the get_modes helper
> - Collected Noralf and Mateusz tags
> - Rebased on drm-misc-next-2022-11-10
> - Link to v7: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech
> 
> Changes in v7:
> - Switch to another implementation of get_modes from Noralf
> - Made more checks in VEC's atomic_check
> - Fixed typo in a commit log
> - Checked for tv_mode_specified in drm_mode_parse_command_line_for_connector
> - Rebased on drm-misc-next-2022-11-03
> - Link to v6: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech
> 
> Changes in v6:
> - Add and convert to a new get_modes helper to create the PAL and NTSC modes in
>   the proper order, with the right preferred mode flag, depending on the driver
>   capabilities and defaults.
> - Support PAL60
> - Renamed tests to be consistent with DRM tests naming convention
> - Simplified a bit the named mode parsing code
> - Add a tv_mode_specified field
> - Return 0 in get_modes implementations instead of error codes
> - Link to v5: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech
> 
> Changes in v5:
> - Dropped TV Standard documentation removal
> - Switched the TV Mode documentation from CSV to actual documentation
> - Switched to kunit assertions where possible
> - Switched to KUNIT_ASSERT_NOT_NULL instead of KUNIT_ASSERT_PTR_NE(..., NULL)
> - Shuffled a bit the introduction of drm_client_modeset_connector_get_modes between patches
> - Renamed tv_mode_names to legacy_tv_mode_names
> - Removed the count variable in sun4i_tv_comp_get_modes
> - Rebased on top of current drm-misc-next
> - Link to v4: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech
> 
> Changes in v4:
> - Removed the unused TV Standard property documentation
> - Added the TV Mode property documentation to kms-properties.csv
> - Fixed the documentation of drm_mode_create_tv_properties()
> - Removed DRM_MODE_TV_MODE_NONE
> - Reworded the line length check comment in drm_mode_analog_tv tests
> - Switched to HZ_PER_KHZ in drm_mode_analog_tv tests
> - Reworked drm_mode_analog_tv to fill our mode using the previously computed
>   timings
> - Added the command-line option documentation to modedb.rst
> - Improved the Kunit helpers cleanup
> - Moved the subconnector documentation renaming to the proper patch
> - Added the various review tags
> - Removed the count variable in vc4_vec_connector_get_modes
> - Rebased on drm-misc-next-2022-09-23 and fixed a merge conflict
> - Folded all the named mode parsing improvements in a single patch
> - Link to v3: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech
> 
> Changes in v3:
> - Applied some of the fixes to vc4 and sun4i
> - Renamed the old TV mode property to legacy_mode
> - Fixed a bunch of bisection errors
> - Removed most of the redundant TV modes
> - Added a new None TV mode to not fall back on NTSC by mistake
> - Fixed the mode generation function to match better what is expected
> - Added some logging to the mode generation function
> - Split the improvements to the named mode parsing logic into separate patches
> - Added more checks to the TV atomic_check helper
> - Link to v2: https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech/
> 
> Changes in v2:
> - Kept the older TV mode property as legacy so we can keep the old drivers functional
> - Renamed the tv_norm property to tv_mode
> - Added a function to create PAL and NTSC compatible display modes
> - Added some helpers to instantiate a mock DRM device in Kunit
> - More Kunit tests
> - Removed the HD analog TV modes
> - Renamed some of the tests
> - Renamed some of the named modes
> - Fixed typos in commit logs
> - Added the various tags
> - Link to v1: https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech/
> 
> ---
> Mateusz Kwiatkowski (2):
>       drm/vc4: vec: Check for VEC output constraints
>       drm/vc4: vec: Add support for more analog TV standards
> 
> Maxime Ripard (16):
>       drm/tests: client: Mention that we can't use MODULE_ macros
>       drm/connector: Rename legacy TV property
>       drm/connector: Only register TV mode property if present
>       drm/connector: Rename drm_mode_create_tv_properties
>       drm/connector: Add TV standard property
>       drm/modes: Add a function to generate analog display modes
>       drm/connector: Add a function to lookup a TV mode by its name
>       drm/modes: Introduce the tv_mode property as a command-line option
>       drm/modes: Properly generate a drm_display_mode from a named mode
>       drm/client: Remove match on mode name
>       drm/modes: Introduce more named modes
>       drm/atomic-helper: Add a TV properties reset helper
>       drm/atomic-helper: Add an analog TV atomic_check implementation
>       drm/vc4: vec: Use TV Reset implementation
>       drm/vc4: vec: Convert to the new TV mode property
>       drm/sun4i: tv: Convert to the new TV mode property
> 
> Noralf Trønnes (1):
>       drm/probe-helper: Provide a TV get_modes helper
> 
>  Documentation/fb/modedb.rst                     |   5 +
>  Documentation/gpu/drm-kms.rst                   |   6 +
>  drivers/gpu/drm/drm_atomic_state_helper.c       | 124 ++++++
>  drivers/gpu/drm/drm_atomic_uapi.c               |   4 +
>  drivers/gpu/drm/drm_client_modeset.c            |   4 -
>  drivers/gpu/drm/drm_connector.c                 | 173 +++++++-
>  drivers/gpu/drm/drm_modes.c                     | 544 +++++++++++++++++++++++-
>  drivers/gpu/drm/drm_probe_helper.c              |  82 ++++
>  drivers/gpu/drm/gud/gud_connector.c             |  10 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c                |   8 +-
>  drivers/gpu/drm/i915/display/intel_tv.c         |   4 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c       |   6 +-
>  drivers/gpu/drm/sun4i/sun4i_tv.c                | 141 ++----
>  drivers/gpu/drm/tests/Makefile                  |   3 +
>  drivers/gpu/drm/tests/drm_client_modeset_test.c |  91 +++-
>  drivers/gpu/drm/tests/drm_cmdline_parser_test.c |  68 +++
>  drivers/gpu/drm/tests/drm_connector_test.c      |  76 ++++
>  drivers/gpu/drm/tests/drm_modes_test.c          | 145 +++++++
>  drivers/gpu/drm/tests/drm_probe_helper_test.c   | 205 +++++++++
>  drivers/gpu/drm/vc4/vc4_vec.c                   | 342 ++++++++++++---
>  include/drm/drm_atomic_state_helper.h           |   4 +
>  include/drm/drm_connector.h                     |  82 +++-
>  include/drm/drm_mode_config.h                   |  12 +-
>  include/drm/drm_modes.h                         |  17 +
>  include/drm/drm_probe_helper.h                  |   1 +
>  25 files changed, 1959 insertions(+), 198 deletions(-)
> ---
> base-commit: 9a47d2357cc30d13054bb0598f74fd61f2c9fc51
> change-id: 20220728-rpi-analog-tv-properties-0914dfcee460
> 
> Best regards,
> -- 
> Maxime Ripard <maxime@cerno.tech>

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
