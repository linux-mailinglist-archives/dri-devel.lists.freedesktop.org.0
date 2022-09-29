Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D36F5EFA83
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870A710EAC4;
	Thu, 29 Sep 2022 16:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F5B10E128;
 Thu, 29 Sep 2022 16:31:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3A8B75807D7;
 Thu, 29 Sep 2022 12:31:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 29 Sep 2022 12:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664469068; x=1664476268; bh=7RHzLU9hR9
 LLeroMnqijUPLrsWnQsBv6WBMebB+Ifk4=; b=N4AxiVL9J5r1R7hnFIQnQ6vb4C
 /EJ4+QixNSn90KvWebrNieZke/RDHzOqX404XxDNJwAGLNsI+dtnTk8HUfG9AfOy
 Peopw895+Gd7JOJ1XwtKJ7u6Yccqm/VZk/899v1Ov4pQkaBvdScrj6plr/rMeHSw
 TwErv+kmt0oKG0CK19H/qGkiENNwidoFYhNZ1WxCklY8JloD+P5hObHyHk/+E9nU
 M2SbNBVrgQDweKY4QBBc77T3VZ5iT03u7Muyz9S80YC3tJus5BjaZoAIV1zHoWQ4
 1C83edlf9U+atTfsaSI3yctoh+JrFOWvcClWjv+qd+yEPokrohdYjnJGz+SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1664469068; x=1664476268; bh=7RHzLU9hR9LLe
 roMnqijUPLrsWnQsBv6WBMebB+Ifk4=; b=EYPczQ1O+vbB7Zv18YoX9kcwXEZfY
 xZyozDJmYB5lZUNy8yXeXGrlyDB7BlaMwqKKWGuRZ+eZwtdYOCLYF7h4/4JNJnOz
 9Ab5qYQ9mEecSPbACdbbM+pbVixeqIw4aRmWnUxs1p+qloB6OoiSh66HoUrWCOJG
 K4ttRFVG9tnnF8gmMCfqmfRMY2IGME3lyFESF7yQ1n9nqcmCCj3YxI3XVlWOnq7N
 +jyglJJN5rYVkVS8BupqfzbqpjDCra9tI3D5yCQUYAct8FKUFQzNRddiOio1fn+S
 lpHtFg3v91MpATgC9y7McNOqlKSmTy13p4sGbXPO7hu1x1CeG5Pv3hkQQ==
X-ME-Sender: <xms:Ssg1Y53EBDgfvRU-ayL_hnRqkoiKY8cDlwl8pIXl5V95TIJlyWVsrQ>
 <xme:Ssg1YwHhXtHya-KHXoCjZ8iYIhz82twHduZJJQD8e_roF59KPxtA59qj3OzfmVSWI
 4j2-l_viCNZjPArIP4>
X-ME-Received: <xmr:Ssg1Y54L2aUww16iWstMek1gCSqOqWKeaxO6nFEL5Ew7dWJzYR2Fh5klMc19>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefugggtgffhfffkvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelueevteetffdvveelgfffleegudeufeelveefvddugeehkeefkeehjeei
 keegudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:Ssg1Y21SZZxn2F7yVLz3AWn-A2joU28-PfJFCxlVCbSA1zIFbTjifA>
 <xmx:Ssg1Y8HK8V1XF_xf3HIHi77OO-5nCXrKFtEnjQvzoEQ6xzX7AFoNUA>
 <xmx:Ssg1Y39W7wRDMoyHLvDvJs2oOLi3C5IMAOCA7EBtou1XnIl3ti70eg>
 <xmx:TMg1Y0SpucgrMnL6d1mnaqBFQutXi_cb0fWDqks0yYOfd9u37CpZBw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:06 -0400 (EDT)
Subject: [PATCH v4 00/30] drm: Analog TV Improvements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAD7INWMC/42OUQqDMBBEryL57pY0Sq398h6lHzFZdaEmsgmhRbx7156gMLAM7LyZTSVkwqTu1a
 YYCyWKQUxzqpSbbZgQyItXRhujW3MDXglssK84QS6wclyRsxBAd5fGjw6xuWol8cEmhIFtcPMB8LzA
 QslBwHeGAycJ0fE6U8qRP78RpZbz+KOvCADGtq6tRt+Nne4dcojnjFL43Pf9C3Fv6MncAAAA
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:30:54 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=9271; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Yr40RoFlPyeq6zBgoNSqYFJA8x3cZo1Ypr+RnWwaUpc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9z0pr08mH/S3D55yZ9F5kcCZ8b0SX0WPsWk4hf2QPnW
 0h1LO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRb2cY/pn6rFFcbcZxWYRNh/Xl5e
 NbTm2OLWh/8PFI9h7NulkKpycyMswVstrG4nJ3u9n03bMbvs+JM7nzIvfWptJjvD9/sR34fZoLAA==
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
Geert Uytterhoeven (1):
      drm/modes: parse_cmdline: Add support for named modes containing dashes

Mateusz Kwiatkowski (3):
      drm/vc4: vec: Fix definition of PAL-M mode
      drm/vc4: vec: Check for VEC output constraints
      drm/vc4: vec: Add support for more analog TV standards

Maxime Ripard (26):
      drm/docs: Remove unused TV Standard property
      drm/tests: Order Kunit tests in Makefile
      drm/tests: Add Kunit Helpers
      drm/atomic-helper: Rename drm_atomic_helper_connector_tv_reset to avoid ambiguity
      drm/connector: Rename subconnector state variable
      drm/atomic: Add TV subconnector property to get/set_property
      drm/connector: Rename legacy TV property
      drm/connector: Only register TV mode property if present
      drm/connector: Rename drm_mode_create_tv_properties
      drm/connector: Add TV standard property
      drm/modes: Add a function to generate analog display modes
      drm/modes: Only consider bpp and refresh before options
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
 Documentation/gpu/kms-properties.csv            |   2 +-
 drivers/gpu/drm/drm_atomic_state_helper.c       | 128 ++++-
 drivers/gpu/drm/drm_atomic_uapi.c               |   8 +
 drivers/gpu/drm/drm_client_modeset.c            |   4 +
 drivers/gpu/drm/drm_connector.c                 | 108 +++-
 drivers/gpu/drm/drm_modes.c                     | 658 +++++++++++++++++++++++-
 drivers/gpu/drm/gud/gud_connector.c             |  12 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                |   6 +-
 drivers/gpu/drm/i915/display/intel_tv.c         |   5 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c       |   6 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                | 148 ++----
 drivers/gpu/drm/tests/Makefile                  |  16 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 230 +++++++++
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c |  67 +++
 drivers/gpu/drm/tests/drm_kunit_helpers.c       |  61 +++
 drivers/gpu/drm/tests/drm_kunit_helpers.h       |   9 +
 drivers/gpu/drm/tests/drm_modes_test.c          | 144 ++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                  |   2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                   | 336 ++++++++++--
 include/drm/drm_atomic_state_helper.h           |   4 +
 include/drm/drm_connector.h                     |  86 +++-
 include/drm/drm_mode_config.h                   |  12 +-
 include/drm/drm_modes.h                         |  17 +
 24 files changed, 1863 insertions(+), 208 deletions(-)
---
base-commit: 06bd0853188a01ce58f75e6dce940abff39c897f
change-id: 20220728-rpi-analog-tv-properties-0914dfcee460

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
