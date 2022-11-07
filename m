Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF3061F51B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1F010E31A;
	Mon,  7 Nov 2022 14:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89EE10E31A;
 Mon,  7 Nov 2022 14:16:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 96C602B05E60;
 Mon,  7 Nov 2022 09:16:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Nov 2022 09:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1667830596; x=1667837796; bh=a5DhP4F/qG
 5HvF6cjResrf1Tj2WUnVOLuH+UMUtcpZ0=; b=Irs4WA5jwTUfnu0gSQwv4V94K8
 7MsbWUMZtxT4ZBm3wLguPArhA9rPqFeWNG4jZzjW7PTvVtiYqhug2QKap6/VrNJp
 IqhnLu2t51lFXkwuEjN1RyI7BuVLWlZZSaecSRop6uNKFDBeFVR+2yeki7ilp7q0
 EposIf7YnokBjisM4qwAlEYLDtkv1UkMD+Res4aswlXPi3+CVd9kUrsOVsH7M45v
 jT9Ss/d/bMcyRF1avJGaEMpWrxy6L5LnVfc+36cNEGja/Wq1c8cFyFsyvEkgR0eO
 d0KvKE0cFv+ulayfU5lmLHxgVuxi7L8Ge5qA3e9oNAbdlC5z7iJwtHv4np1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1667830596; x=1667837796; bh=a5DhP4F/qG5Hv
 F6cjResrf1Tj2WUnVOLuH+UMUtcpZ0=; b=S0YT5h+vOIHnw+4zMGIqxxEhDtn2O
 TJ53Fi2jc95i3IKUjEhOKItJqmsZe3UVso+09TZ6pV10MgGFdpevuRYc8lUif7lv
 B9e5E9tpfUxbJHwmRpSjRiHEDfO6THGqMu01kUG9A5koNEIQiAuJU+ZWCeMDMzJi
 nzozvmcJ1R/46aNub5WpjvLEYvCH+KWWORBXReirNiYtb9iZf/dKLkN29svG6nBj
 UdC5SgOcBwqf8JcfLJDHcMH26CfbrYGMZHsW5ASkAXlId99hpK1X2r+lkXBxzpLb
 Y9m8V5Badv3JZm1fUJHl4j/UNrJSiEKdWEvUms8VIrjfjm28f/Kz1p/SA==
X-ME-Sender: <xms:QxNpY828-6Skp7hUvB4pHdluDLNDsa0kYx7XGFy9WLX6HI8I120MZQ>
 <xme:QxNpY3GtwYVUQ1uOWgT8ZOKj1z6ISB8exVJgM-dl-Y4WNUH8YtoydBrdlhHpZYsYX
 -J6Ny8AzyqhzxneChk>
X-ME-Received: <xmr:QxNpY0631s5yLcmBuEzMVh_htsS6K18Bp022Bi8GNr2Z6tA-G73ysxHX8D8ssbDtIGIEiLCVHJInCU6RlTvyy9fqzkXV70t4DfE6BX1ptecBug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefugggtgffhfffkvfevofesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelueevteetffdvveelgfffleegudeufeelveefvddugeehkeefkeehjeeikeeg
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QxNpY12M5970vTwJFLVQnaRaaGmddwwtWKMhNGCfVdaixjTqXfBGSQ>
 <xmx:QxNpY_EVsjjWf5NtZtGEznQdwdRzxoDplAiooRJjZoZa3RA2zKhsLQ>
 <xmx:QxNpY-95nNzZuhnmPv8LBaYIRiKRNQqJxTsLztNqYGOERQEHs0hG6Q>
 <xmx:RBNpY_R3GQXmDjD5dD-Xriieh4xUuyaM4FSwNSDsWwlUkUHz69EsJy0heMU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:16:34 -0500 (EST)
Subject: [PATCH v7 00/23] drm: Analog TV Improvements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIADoTaWMC/43NTWrDMBAF4KsErTtFlmT9ZNV7hCxkaRQLimQkIyjBd++ku5KNV8NjeN97so4tY2
 fXy5M1HLnnWiiYjwsLqy8PhBwpM8GF4EZYaFsGX/x3fcA+YGt1w7aTANxNKqaAqDRnVF98R1iaL2F9
 AUbOqKYopQvx9V5z32v7+Rseks7txMYQwCEZKT3H6JLjXwFbqZ870sid1KHOSookzaO01shkrHiT5r
 PSTFK0agpBq4RqeZP0WUmThMY4YaSauE3/pOM4fgGdfeforgEAAA==
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:26 +0100
Message-Id: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=10461; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=SlyfK6wHPDEhY295MhAjmc3d0LQIZizwrf3w51ZuICQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwvZ5HP7Prs64rTFt6Yn1ifmty04t8T/QmBrjrlTycV7A
 Mp91HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIgSUMv1l918xq5jLd1tDN9e3jwT
 PbU04rzX0c/e2OnDn/plwPozyG/8FiOz8U9a+8dPLTF/mmoDPKT74Lyr022/YvXenQCoO62UwA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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
Changes in v7:
- Switch to another implementation of get_modes from Noralf
- Made more checks in VEC's atomic_check
- Fixed typo in a commit log
- Checked for tv_mode_specified in drm_mode_parse_command_line_for_connector
- Rebased on drm-misc-next-2022-11-03
- Link to v6: https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech

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

Noralf Trønnes (1):
      drm/probe-helper: Provide a TV get_modes helper

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
 drivers/gpu/drm/tests/Makefile                  |   3 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 229 +++++++++
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c |  67 +++
 drivers/gpu/drm/tests/drm_connector_test.c      |  90 ++++
 drivers/gpu/drm/tests/drm_kunit_helpers.c       |  61 +++
 drivers/gpu/drm/tests/drm_kunit_helpers.h       |   9 +
 drivers/gpu/drm/tests/drm_modes_test.c          | 144 ++++++
 drivers/gpu/drm/vc4/vc4_vec.c                   | 342 +++++++++++--
 include/drm/drm_atomic_state_helper.h           |   4 +
 include/drm/drm_connector.h                     |  89 +++-
 include/drm/drm_mode_config.h                   |  12 +-
 include/drm/drm_modes.h                         |  17 +
 include/drm/drm_probe_helper.h                  |   1 +
 26 files changed, 2081 insertions(+), 204 deletions(-)
---
base-commit: 3b536e43463ed91b7bf9acec1eb4da0bc677dc43
change-id: 20220728-rpi-analog-tv-properties-0914dfcee460

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
