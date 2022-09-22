Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF985E651B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D8D10EB4D;
	Thu, 22 Sep 2022 14:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB8910EB45;
 Thu, 22 Sep 2022 14:25:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id AF3002B05B17;
 Thu, 22 Sep 2022 10:25:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 22 Sep 2022 10:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663856728; x=1663863928; bh=aVuroWCGyk
 /Hd3ZXmpSkljpJ3y11N00AjWDftDkvdw8=; b=mx3otSVNKwA2MsVmPhVhdZpQYI
 rjYVSiSs9+yNgNlT3+kvmHauXaBBru5ntroreD0iJfsPlOa5EKeyzGQnpZMup8PU
 OT/Z5SqA3VJrEisb4MAVYSi3J3eFh/ExEh/jGH8/Qr0xJZizlNCFloGQzgWc01yb
 noHpKlmS0KmP+mmoBsmQI3pnOuNwHYt+9nL4ft+8OHiKekC5NLg5SpxBUYrJIU40
 +vuWOr6ptpkQZz0EZ80K6x0mED/zQiLC3zl1OgtMk1TxYzsvqavarKtlPliR2w6v
 hidNDKvLXEU/HSnpqjCNmPNPChKiAi9t9IjEbuH95KkplnUcQni4xFWutWvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1663856728; x=1663863928; bh=aVuroWCGyk/Hd
 3ZXmpSkljpJ3y11N00AjWDftDkvdw8=; b=QDKMW55hx+Au1fYAYgjkPrPDfUeFZ
 ffr5xulc7Tm7CwqGZB5H6C4falg2N3kRVlpGG+1Qmf8VTWQ55L0eB+TXQtpXoZyW
 oKnVYrfnusJQLuecw/zSk4Y0fju/XEOJj6K0Rmk2M65T+c0H3frceei4qjvY7JN1
 xC4F+0DPUneAsTVTXEuLvY1XpSTBAjsj6iV+jY6iSadNcTgNIf5N/kOw04DqkvOg
 Vk9RYnCcBw2ju3FJUHHBWpB25+riCiH1QJjbjq9eyMS8/1ul60C14ZgwaNp8XIys
 uPn9UDOg3Wr7KgZ3ms1X5KeFSqydvs8siGycavYLrDp3wFPjYY4+xMnow==
X-ME-Sender: <xms:V3AsYxcqOoKC1qQQb3tTYlnHTbg--UJ6MMXeZPI9rDFdRd_7fzDX6Q>
 <xme:V3AsY_OxvruAgWY_CvVLwbfsqhTh2VAXGNwazs_E8Kmfg_ovSYU8VYjQU7-Q7MfbN
 h_dUpOyR8QKMKev2mg>
X-ME-Received: <xmr:V3AsY6hudgHLUXD53038HeUorTi76aezkBV8F4YZ-0FaxYgiG1Wx-14_sZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepufggtgfghfffkffvvefosehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleeuveetteffvdevlefgffelgeduueefleevfedvudegheekfeekheejieek
 gedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:V3AsY695m_6u5gTyhYPPHpvZQy0DbOVNIb86CN5Zrc-Wv_1SFMm12w>
 <xmx:V3AsY9vNHUOoqzU05fX5uC6XB_VN624U8QZ6sKZf0kADK8IaJEhgsg>
 <xmx:V3AsY5EEbotmfhxi7KFYrRwagJPxHb0XB-sRV5NjoEXGs0DLNDv4BA>
 <xmx:WHAsY-4P7jMghBoi8L5Iech3FeVWtO2Bphut3z8-Vwz7azduXg907i5tzag>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:25:25 -0400 (EDT)
Subject: [PATCH v2 00/33] drm: Analog TV Improvements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAE1wLGMC/xWMywqEMAwAf0Vy3kA3yL7+JrZZDaxtSYsI4r9vhLnMYeaAJqbS4DMcYLJp05Jd6D
 ZAXDjPgprcgQJReNILrSpy5l+ZsW9YrVSx7gcM7/uYvlFkfATwfOImOBnnuFyDZCuu2iJm2TteOy8c
 OM8/AlMwAYUAAAA=
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:17 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
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
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8426; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=KnGlY+ZtkTTxV5rb93A1k0oD8H0SOvjsMvv8Q+AGk4A=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6Bf6Ffr/flv5+1nVhX27upvDts0NVpdV1Vu+8GL/YkfPU
 I16ujlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk50ZGhod+52be4DuplLX/04WFpW
 mFvsrbO+ynOXyLe39+m8X8CwoM/wOebe/bzSojmLhNuin96nfmw5xMPWl7Oa66S6xon3fUhxkA
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

Maxime Ripard (29):
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
      drm/modes: Bail out of named mode parsing if empty
      drm/modes: Bail out of named mode parsing early if it's a number
      drm/modes: Bail out of named mode parsing early if it's an option
      drm/modes: Bail out of named mode parsing early if it's a status
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

 drivers/gpu/drm/drm_atomic_state_helper.c       | 128 ++++-
 drivers/gpu/drm/drm_atomic_uapi.c               |   8 +
 drivers/gpu/drm/drm_client_modeset.c            |   4 +
 drivers/gpu/drm/drm_connector.c                 | 111 +++-
 drivers/gpu/drm/drm_modes.c                     | 658 +++++++++++++++++++++++-
 drivers/gpu/drm/gud/gud_connector.c             |  12 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                |   6 +-
 drivers/gpu/drm/i915/display/intel_tv.c         |   5 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c       |   6 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                | 148 ++----
 drivers/gpu/drm/tests/Makefile                  |  16 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 239 +++++++++
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c |  67 +++
 drivers/gpu/drm/tests/drm_kunit_helpers.c       |  54 ++
 drivers/gpu/drm/tests/drm_kunit_helpers.h       |   9 +
 drivers/gpu/drm/tests/drm_modes_test.c          | 136 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                  |   2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                   | 339 ++++++++++--
 include/drm/drm_atomic_state_helper.h           |   4 +
 include/drm/drm_connector.h                     |  92 +++-
 include/drm/drm_mode_config.h                   |  12 +-
 include/drm/drm_modes.h                         |  17 +
 22 files changed, 1866 insertions(+), 207 deletions(-)
---
base-commit: 9f5ef9111a4c973a69f9ba22ac73f1f9c634baf6
change-id: 20220728-rpi-analog-tv-properties-0914dfcee460

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
