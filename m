Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C960E490
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A90310E39A;
	Wed, 26 Oct 2022 15:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD85110E389;
 Wed, 26 Oct 2022 15:33:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 52741580260;
 Wed, 26 Oct 2022 11:33:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 26 Oct 2022 11:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666798411; x=1666805611; bh=/cEdkCRLPs
 WW+yYgJwVQO8yOwqoT+4tWEgNCquIG3NM=; b=zCWW9tXO+cVN+awHlRRB2K4K1d
 Jfmonl65fjxzcWkzOV6uFKF7Xu1IU4M7QnUZnH8YG3XTm5C6FX/rwfEadZ/vxTVV
 69zNwrSBvH1cgf18KwGS17zIW3k9oErZfInsco6s5EApjOYOS54JHWgvpAIyIhAt
 MIq4n1ISQYM47Z8xou4I5RN67Qxhc+61J3hMJaPd8l08UkAmmQXiyqBGIC6S9qmL
 KvH9AGxGJ4ZYWCFftEJxVhD2mSHuIYvEKwVsT2A9auMFOhsco+eRbVQyyxdpJ2zV
 qXOWThXBAV4hEVlEeoRS3TRrpdxsCNLh47sGBzu6g4maxgESFFGG4i6HFrGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1666798411; x=1666805611; bh=/cEdkCRLPsWW+
 yYgJwVQO8yOwqoT+4tWEgNCquIG3NM=; b=LDIRT0ney4GOGCdErBo4Cft0FJGxl
 9LYMyvcohA/C20j6a3qR7VuopKYPuGu5IzULBKeRwhU3vVCWP9s/6L8Cn1siKAUd
 gZGyCjLk1//Hote4346RODhr7LVPcV4MjZ07n2Xjl6i9UEoAnTCzB+rNcrcAkrdw
 sJUhWo6f3V7FvmsFhIZx4IpI3VL0k5sftbyeTlNMmq1Kjtp6KHLvsBQUZfAnFbGs
 5J2hq+dKe0YmYIBT+4XSUs72ndvDAe3fVNSc2dDBwtvnWYVPZzVLdWMVLRqjVtE4
 wyasaQBv5aZaRBUwRFt1W7dWQ5P77hsWjiRNXdJdBX3CKHhLzdo3EGhaA==
X-ME-Sender: <xms:SVNZY_JY5iFiCHfjwtRR-nO_e8lw1EvquCVf1SUm01Exr29pk2eR3A>
 <xme:SVNZYzJnC4bM-rbCXKIwIehPpU9SaazwJE_EoeayB2hXLiVabQGfh4-6hngMqoISm
 tZR3nbJ-kOY19dI_B0>
X-ME-Received: <xmr:SVNZY3s0Csejq0-hY9AywWoU86dWcLN47YS0mjS-K_Qeoq3K7Vh6FEMwM3ERm8G7qfGoMocJAoWhyWqH2ZJBkURuN7EPUPR1QpD1B6682o7rdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhufggtgfgfffkvfevofesthekredtredtjeenucfhrhhomhepmhgrgihimhgv
 segtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeltdeifefgffetueehueefgf
 dvtdfgjeegueetiedtteelieeftedtvefhlefgheenucffohhmrghinhepkhgvrhhnvghl
 rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SVNZY4ZGxjp7eLfYUNu2vSuOJR6ZkgWTg56S0cUBD0OfZYJujFBR2A>
 <xmx:SVNZY2YvlJ0A9Q8oHVFt_Pyn--wAtmAfvVZBbOWRNlG8J382ZSYFqA>
 <xmx:SVNZY8BunOHlpfDHdzF5cjq64xmdUwSGizr28jCOPILel_q3dOl25w>
 <xmx:S1NZY3G9qlrhWD_bXKh2Eu539L3qqbZHSigzxEA7XnGkBQoN18PF8Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:29 -0400 (EDT)
From: maxime@cerno.tech
Subject: [PATCH v6 00/23] drm: Analog TV Improvements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAD9TWWMC/43NQQ7CIBAF0KsY1o6hQAt15T2MCwqDJTHQQENiTO/u6M646WryM/nvv1jFErGy8+
 HFCrZYY04UhuOBudmmO0L0lJngQnAtDJQlgk32ke+wNlhKXrCsJAAfO+WDQ1QDZ1SfbEWYik1u/gBa
 9qg6L+Xo/Oc9x7rm8vwON0nnumOjCeAQtJSWox/DyC8OS8qnFWnkRmpTeyVF0sC9NEbLoI34k/q9Uk
 +SN6pzblAB1fQjbdv2Blmjr7VkAQAA
Date: Wed, 26 Oct 2022 17:33:19 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=10004; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=I0r4wpJ5a54KsF+Jci3sVAyWz/wd61IGNVOHBpV8H14=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW55mxauUHSqzWyeaXtygW3yrmyDQym6Rm+Nlv9L7RDa
 yH6go5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMpS2Bk2Lv20IPXJfJGqry5hbqpFS
 r7yt7KTi0SEb8QuvS786OMZ4wM/2x3aXAfkJvGucA0dJUxy4Hw+137/z89H7ma74neXqM/LAA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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
Changes in v6:
- Add and convert to a new get_modes helper to create the PAL and NTSC modes in
  the proper order, with the right preferred mode flag, depending on the driver
  capabilities and defaults.
- Support PAL60
- Renamed tests to be consistent with DRM tests naming convention
- Simplified a bit the named mode parsing code
- Add a tv_mode_specified field
- Return 0 in get_modes implementations instead of error codes
- Link to v5: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech

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

Maxime Ripard (21):
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
      drm/probe-helper: Provide a TV get_modes helper
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
 drivers/gpu/drm/drm_modes.c                     | 639 +++++++++++++++++++++++-
 drivers/gpu/drm/drm_probe_helper.c              |  97 ++++
 drivers/gpu/drm/gud/gud_connector.c             |  10 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                |   6 +-
 drivers/gpu/drm/i915/display/intel_tv.c         |   5 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c       |   6 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                | 141 ++----
 drivers/gpu/drm/tests/Makefile                  |   2 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 229 +++++++++
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c |  67 +++
 drivers/gpu/drm/tests/drm_kunit_helpers.c       |  61 +++
 drivers/gpu/drm/tests/drm_kunit_helpers.h       |   9 +
 drivers/gpu/drm/tests/drm_modes_test.c          | 144 ++++++
 drivers/gpu/drm/vc4/vc4_vec.c                   | 337 +++++++++++--
 include/drm/drm_atomic_state_helper.h           |   4 +
 include/drm/drm_connector.h                     |  89 +++-
 include/drm/drm_mode_config.h                   |  12 +-
 include/drm/drm_modes.h                         |  17 +
 include/drm/drm_probe_helper.h                  |   1 +
 25 files changed, 1985 insertions(+), 204 deletions(-)
---
base-commit: 3f94c7492f45365557b597d888241ddc59f347e1
change-id: 20220728-rpi-analog-tv-properties-0914dfcee460

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
