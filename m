Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A15FDA5E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B1F10E23B;
	Thu, 13 Oct 2022 13:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FA510E23B;
 Thu, 13 Oct 2022 13:19:09 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id BC9E5580351;
 Thu, 13 Oct 2022 09:19:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 13 Oct 2022 09:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665667147; x=1665674347; bh=G6fgTFiIkO
 NzGD9gpRNcfHn47HEkhVUzgdJVPhYERKg=; b=uRC1JBQqOPGLdv4sPWy6p1yoXX
 VsMHTmxEb0Hfk8iR7HN/LMEXSGzclQNGqxiMpzHR17NjpwqqO+xyTLtz0wyGm5r2
 mft3zlSIUObnluziDTkAJXd09Kqyx3AZEqSZKUK2/sm8Fi5Hx6N5IdlV9DhLYISM
 vVrJccAAyWOqmteC+Dz5J2ei+HQfpmu2xwtWGdEGYVneT2pHjZCIaQiyLWebmov0
 qQSG/gpGI3HR1QAusu0+ntpRe8k+tJmopXowvWJVA1o7DP6vti6o8e1GZNiQ49Zt
 kz07rDvitBztrHw83vuWY+o/Tolwf3ix8IDk2OsdKfl5o9/5psv47FLUP4iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1665667147; x=1665674347; bh=G6fgTFiIkONzG
 D9gpRNcfHn47HEkhVUzgdJVPhYERKg=; b=Z9+diphb086tWqFIovbrlLcj/1uKP
 39MARFtdyZjLbGAZXUntB0jZF4VfjnO0rDU0ej0aEqznipQwOXDaZ+Ww5uZxjmhj
 fk+zHv49rrK0+/rWPBO0eplEFNrTEm87DpDdMHq8BhlRKW8pkoYboSONhCvsisXz
 SJbUuzrrCu/IC/qL/BKEDmj8gYwA00XqcT8MUrC23BA0S0OMnHLrNvslNMHBpePs
 KHcm2bY/4H5gOQUDgfUfMtb7HKQzobx8PfjlqfMehhPsU+60kzn80D3JK5etS5Ew
 1+nzyt+8jbeZqNnGjwDZwMHEugxLHo++TJ1S+FjWivZhpRvslqP8CR9Gg==
X-ME-Sender: <xms:ShBIY0f_jRfX827KaJr634lKqFpguR8cHU56VIYXCO3xORqgFs9A5w>
 <xme:ShBIY2OXOcr76AP6Nl9CJVuzauJckHfk1X0Vv9CZ23LI0uZWGyOy-A2H3wjrKL-ld
 xaXPNb00011XHAF3zk>
X-ME-Received: <xmr:ShBIY1i_LDkUTwEsV-225WzBZx5DEDrG1PM_NzYpk81OT2m1ZEHZg7X6hvTRWY0gZCbQOKFo31YYO5Zdcx37aCP39EJjFxYYg7JQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepufggtgfghfffkffvvefosehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleeuveetteffvdevlefgffelgeduueefleevfedvudegheekfeekheejieek
 gedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ShBIY5_0-YWcw1EP6TyRn-18Ur_EEAReIijOGL70v3K73dpFJBZCOw>
 <xmx:ShBIYwvGCz6O3LhgK6A-25rWSbYVLq-Nhgh7U35gSrwV8oM44fXnyQ>
 <xmx:ShBIYwHR-5tEXqeVWphtv2gthZBvDQlVdl53Rcq6n3YOtflpdjT9cg>
 <xmx:SxBIY55T6rJOSvlir9Ns9Uj-DBI2jWUU8ZcdCz1g0No35cTCOsUqCg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:05 -0400 (EDT)
Subject: [PATCH v5 00/22] drm: Analog TV Improvements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIADQQSGMC/43NQQrDIBAF0KsU151i1ETTVe9RujA6JkLRoCKUkLvXdNddVsNn+O9vJGPymMn9sp
 GE1WcfQwv99ULMosOM4G3LhFHGqGQK0upBB/2OM5QKa4orptIEoGMnrDOIYqCk1SedEaakg1kOQPIe
 RWc5H4093ovPJabPb7jydp4nNioDCk5yrina0Y30YTCFeCvYRl5NreKsJJo0UMuVktxJxf6kfd+/I9
 wJZBoBAAA=
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:44 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, 
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=9285; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=7GxKft3Lddw6iGnxcQzoeGHxuf2aXt58Gxn3+SVNeTc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm4Htri1tsZZVUhOnaX75+UknQcTFG2XnONR7THvSzzG
 rbywo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNJW8Twv/bD5HMrrM7UxlU8TLLcdU
 PA4yrz9o0nHB5rVd+4J8btG8Hwz754dYHlovySNqF3i6xOZR15WOU0tVf3yGTbi01H2w+08QEA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a series aiming at improving the command line named modes support,
and more importantly how we deal with all the analog TV variants.

The named modes support were initially introduced to allow to specify the
analog TV mode to be used.

However, this was causing multiple issues:

  * The mode name parsed on the command line was passed directly to the
    driver, which had to figure out which mode it was suppose to match;

  * Figuring that out wasn't really easy, since the video= argument or what
    the userspace might not even have a name in the first place, but
    instead could have passed a mode with the same timings;

  * The fallback to matching on the timings was mostly working as long as
    we were supporting one 525 lines (most likely NSTC) and one 625 lines
    (PAL), but couldn't differentiate between two modes with the same
    timings (NTSC vs PAL-M vs NSTC-J for example);

  * There was also some overlap with the tv mode property registered by
    drm_mode_create_tv_properties(), but named modes weren't interacting
    with that property at all.

  * Even though that property was generic, its possible values were
    specific to each drivers, which made some generic support difficult.

Thus, I chose to tackle in multiple steps:

  * A new TV mode property was introduced, with generic values, each driver
    reporting through a bitmask what standard it supports to the userspace;

  * This option was added to the command line parsing code to be able to
    specify it on the kernel command line, and new atomic_check and reset
    helpers were created to integrate properly into atomic KMS;

  * The named mode parsing code is now creating a proper display mode for
    the given named mode, and the TV standard will thus be part of the
    connector state;

  * Two drivers were converted and tested for now (vc4 and sun4i), with
    some backward compatibility code to translate the old TV mode to the
    new TV mode;

Unit tests were created along the way.

One can switch from NTSC to PAL now using (on vc4)

modetest -M vc4  -s 53:720x480i -w 53:'TV mode':1 # NTSC
modetest -M vc4  -s 53:720x576i -w 53:'TV mode':4 # PAL

Let me know what you think,
Maxime

To: David Airlie <airlied@linux.ie>
To: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Emma Anholt <emma@anholt.net>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
To: Lyude Paul <lyude@redhat.com>
To: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <dom@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v5:
- Dropped TV Standard documentation removal
- Switched the TV Mode documentation from CSV to actual documentation
- Switched to kunit assertions where possible
- Switched to KUNIT_ASSERT_NOT_NULL instead of KUNIT_ASSERT_PTR_NE(..., NULL)
- Shuffled a bit the introduction of drm_client_modeset_connector_get_modes between patches
- Renamed tv_mode_names to legacy_tv_mode_names
- Removed the count variable in sun4i_tv_comp_get_modes
- Rebased on top of current drm-misc-next
- Link to v4: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech

Changes in v4:
- Removed the unused TV Standard property documentation
- Added the TV Mode property documentation to kms-properties.csv
- Fixed the documentation of drm_mode_create_tv_properties()
- Removed DRM_MODE_TV_MODE_NONE
- Reworded the line length check comment in drm_mode_analog_tv tests
- Switched to HZ_PER_KHZ in drm_mode_analog_tv tests
- Reworked drm_mode_analog_tv to fill our mode using the previously computed
  timings
- Added the command-line option documentation to modedb.rst
- Improved the Kunit helpers cleanup
- Moved the subconnector documentation renaming to the proper patch
- Added the various review tags
- Removed the count variable in vc4_vec_connector_get_modes
- Rebased on drm-misc-next-2022-09-23 and fixed a merge conflict
- Folded all the named mode parsing improvements in a single patch
- Link to v3: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech

Changes in v3:
- Applied some of the fixes to vc4 and sun4i
- Renamed the old TV mode property to legacy_mode
- Fixed a bunch of bisection errors
- Removed most of the redundant TV modes
- Added a new None TV mode to not fall back on NTSC by mistake
- Fixed the mode generation function to match better what is expected
- Added some logging to the mode generation function
- Split the improvements to the named mode parsing logic into separate patches
- Added more checks to the TV atomic_check helper
- Link to v2: https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech/

Changes in v2:
- Kept the older TV mode property as legacy so we can keep the old drivers functional
- Renamed the tv_norm property to tv_mode
- Added a function to create PAL and NTSC compatible display modes
- Added some helpers to instantiate a mock DRM device in Kunit
- More Kunit tests
- Removed the HD analog TV modes
- Renamed some of the tests
- Renamed some of the named modes
- Fixed typos in commit logs
- Added the various tags
- Link to v1: https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech/

---
Mateusz Kwiatkowski (2):
      drm/vc4: vec: Check for VEC output constraints
      drm/vc4: vec: Add support for more analog TV standards

Maxime Ripard (20):
      drm/tests: Add Kunit Helpers
      drm/connector: Rename legacy TV property
      drm/connector: Only register TV mode property if present
      drm/connector: Rename drm_mode_create_tv_properties
      drm/connector: Add TV standard property
      drm/modes: Add a function to generate analog display modes
      drm/client: Add some tests for drm_connector_pick_cmdline_mode()
      drm/modes: Move named modes parsing to a separate function
      drm/modes: Switch to named mode descriptors
      drm/modes: Fill drm_cmdline mode from named modes
      drm/connector: Add pixel clock to cmdline mode
      drm/connector: Add a function to lookup a TV mode by its name
      drm/modes: Introduce the tv_mode property as a command-line option
      drm/modes: Properly generate a drm_display_mode from a named mode
      drm/modes: Introduce more named modes
      drm/atomic-helper: Add a TV properties reset helper
      drm/atomic-helper: Add an analog TV atomic_check implementation
      drm/vc4: vec: Use TV Reset implementation
      drm/vc4: vec: Convert to the new TV mode property
      drm/sun4i: tv: Convert to the new TV mode property

 Documentation/fb/modedb.rst                     |   2 +
 Documentation/gpu/drm-kms.rst                   |   6 +
 drivers/gpu/drm/drm_atomic_state_helper.c       | 124 +++++
 drivers/gpu/drm/drm_atomic_uapi.c               |   4 +
 drivers/gpu/drm/drm_client_modeset.c            |   4 +
 drivers/gpu/drm/drm_connector.c                 | 173 ++++++-
 drivers/gpu/drm/drm_modes.c                     | 640 +++++++++++++++++++++++-
 drivers/gpu/drm/gud/gud_connector.c             |  10 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                |   6 +-
 drivers/gpu/drm/i915/display/intel_tv.c         |   5 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c       |   6 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                | 145 ++----
 drivers/gpu/drm/tests/Makefile                  |   2 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 229 +++++++++
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c |  67 +++
 drivers/gpu/drm/tests/drm_kunit_helpers.c       |  61 +++
 drivers/gpu/drm/tests/drm_kunit_helpers.h       |   9 +
 drivers/gpu/drm/tests/drm_modes_test.c          | 144 ++++++
 drivers/gpu/drm/vc4/vc4_vec.c                   | 322 ++++++++++--
 include/drm/drm_atomic_state_helper.h           |   4 +
 include/drm/drm_connector.h                     |  82 ++-
 include/drm/drm_mode_config.h                   |  12 +-
 include/drm/drm_modes.h                         |  17 +
 23 files changed, 1889 insertions(+), 185 deletions(-)
---
base-commit: 735e41d339cd617ce056dfd630c6de03c56eb6cd
change-id: 20220728-rpi-analog-tv-properties-0914dfcee460

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
