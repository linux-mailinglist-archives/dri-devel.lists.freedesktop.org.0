Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB5D5853A8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB788E7AD;
	Fri, 29 Jul 2022 16:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Fri, 29 Jul 2022 16:40:47 UTC
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD9D8E496
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:40:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 46506580897;
 Fri, 29 Jul 2022 12:35:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1659112526; x=1659119726; bh=C+jYJd9Wl4
 W0Bkfo1PkjL8TjpKm/fWgkUOf3TUKzFyM=; b=DdzWy2FJrRnhVSk2PuB20leyMs
 LAJ0CpCpMV4sUP0q5x4VUToFQK4HcyKBIAAeUs/ea9oOEcS82Ux2npZLQE1krJ/J
 c1pOHywZR+RXbbhIswbAXdVIi4A5XG9pr9lGtwD7QexmzWSCvu27D0N5SPj1/p6j
 aQEmJS5W+SVu0izC/2lAHI9w9hUVfFX1IzkFQN0a1DP0tFNbf6eJD3ZCpI3aDKHt
 ms0bcPom61SgjdE1zPJZvKzE4WJiH6/wDAYJK62M2i/7Aoe5rPeejYoR0podU/6y
 wc98iFpiWyEtCK7CcyPj4qeU/mPNMKtf1YW2IZisoGxgPkkWuddQoQaURdDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1659112526; x=1659119726; bh=C+jYJd9Wl4W0B
 kfo1PkjL8TjpKm/fWgkUOf3TUKzFyM=; b=0hzRTYxuABZCCa2X82Xi4Cz2bz6xU
 zmmuBf+0g7Ly80aNp15UxfXPqeVBCvX75o2xF1b9PTMx0LHVhrAqzWUjjnIb5LZW
 sl0pVzRk9ZDi4pcLumRPdg3fUXIJIBjzjAOEjeVIsVlXuS8PKfkMdV9Pt3ds4RH+
 D6ZTQbnkqzw3wHOIxXT2kIjzApYOPGeemxMBVTciO5g5l08EZUcZSh+SEJ2T1tgA
 KakrCj2oiwmvOmah0CDfnS9S+sISl8a+qNrTY6h53nQhL6r3yJjblE9iT7RC0Wfe
 P5NnmYVbH4TmG/HxDNRdLrg4UgBz8wIKvZ0Cy9Sc64ZJtTmixBtzTDCPw==
X-ME-Sender: <xms:TAzkYk0_3v55mHGgA5q4a62N2Gwx8x5pPrnyfJxgdKUQtv4G5V4V-w>
 <xme:TAzkYvE9cppfgymTw2A9YKGh7GomblLynNX8VSM2RUU4PwdbPsQeGJISCeYu06NFg
 1A1L0d0wuGN_b7smmg>
X-ME-Received: <xmr:TAzkYs4913WNJZR38mkvbq3dMYLlmaFBSNIKcWBAh5tZ4Ye-foZALbkvIfto7DIDg1bbXJC4mdouS2XgkJM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffogggtoffgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepffekvddvteekuedujefhtdfgffevkefgvdevieejgfetgfefjefftddu
 ueevkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TAzkYt3Q93C_8U2ffTmsguxAQAdH1fGgWUBiaATjtkZu8mRZ5YEbpA>
 <xmx:TAzkYnFAKi2aE4JGma4jdjyel1v83kDqVZeBlBs2tHHgMU3BLFNetQ>
 <xmx:TAzkYm-S9Rd7JcsxGKV7LL2U0i8U1Wsv2Ff6iE7J8Ocn4zup7CvLBw>
 <xmx:TgzkYvUe5z14LSmSdUkDBcj0Za7-KBUn43_60swCh265RngFZFwiag>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 00/35] drm: Analog TV Improvements
Date: Fri, 29 Jul 2022 18:34:43 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=6103; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=oyH2EBYkTjIG+9yKJt/0byzyaDW2WxQwQX0bPCZ5n1g=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VH6F3vJp+Tlnxie3Zt/WM3udno3M/LmF8Mdp1UOPdQ4
 VLNlR0cpC4MwB4OsmCLLdcG3dnxhUW4RPB82w8xhZQIZwsDFKQATCZvCyLBGP39fX0vEM13dpvbixx
 n74rtqrz+aedpzdp3OpHjfedwMf8Uqj5nuvHXi8ewLJ80T/D2k2beLCxRVFjs6sT09/TTk7nwA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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

  * A new TV norm property was introduced, with generic values, each driver
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

Unit tests were created along the way. Nouveau, ch7006 and gud are
currently broken for now since I expect that work to be reworked fairly
significantly. I'm also not entirely sure about how to migrate GUD to the
new property.

Let me know what you think,
Maxime

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <dom@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Mateusz Kwiatkowski (5):
      drm/vc4: vec: Refactor VEC TV mode setting
      drm/vc4: vec: Remove redundant atomic_mode_set
      drm/vc4: vec: Fix timings for VEC modes
      drm/vc4: vec: Fix definition of PAL-M mode
      drm/vc4: vec: Add support for more analog TV standards

Maxime Ripard (30):
      drm/atomic-helper: Rename drm_atomic_helper_connector_tv_reset to avoid ambiguity
      drm/connector: Rename subconnector state variable
      drm/atomic: Add TV subconnector property to get/set_property
      drm/modes: Introduce 480i and 576i modes
      drm/connector: Add TV standard property
      drm/connector: Only register TV mode property if present
      drm/modes: Only consider bpp and refresh before options
      drm/client: Add some tests for drm_connector_pick_cmdline_mode()
      drm/modes: Move named modes parsing to a separate function
      drm/modes: Switch to named mode descriptors
      drm/modes: Fill drm_cmdline mode from named modes
      drmi/modes: Properly generate a drm_display_mode from a named mode
      drm/atomic-helper: Add a TV properties reset helper
      drm/atomic-helper: Add an analog TV atomic_check implementation
      drm/vc4: vec: Remove empty mode_fixup
      drm/vc4: vec: Convert to atomic helpers
      drm/vc4: vec: Switch for common modes
      drm/vc4: vec: Use TV Reset implementation
      drm/vc4: vec: Convert to the new TV mode property
      drm/sun4i: tv: Remove unused mode_valid
      drm/sun4i: tv: Convert to atomic hooks
      drm/sun4i: tv: Merge mode_set into atomic_enable
      drm/sun4i: tv: Remove useless function
      drm/sun4i: tv: Remove useless destroy function
      drm/sun4i: tv: Rename error label
      drm/sun4i: tv: Add missing reset assertion
      drm/sun4i: tv: Convert to the new TV mode property
      drm/connector: Remove TV modes property
      drm/modes: Introduce the tv_mode property as a command-line option
      drm/modes: Introduce more named modes

 drivers/gpu/drm/drm_atomic_state_helper.c       | 166 +++++++++-
 drivers/gpu/drm/drm_atomic_uapi.c               |  12 +-
 drivers/gpu/drm/drm_client_modeset.c            |   4 +
 drivers/gpu/drm/drm_connector.c                 |  46 ++-
 drivers/gpu/drm/drm_modes.c                     | 198 +++++++++--
 drivers/gpu/drm/gud/gud_connector.c             |   2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c      |  18 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.h      |   2 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                | 173 +++-------
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c | 295 +++++++++++++++++
 drivers/gpu/drm/tests/drm_mode_test.c           | 255 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                  |   2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                   | 418 ++++++++++++++++--------
 include/drm/drm_atomic_state_helper.h           |   4 +
 include/drm/drm_connector.h                     |  40 ++-
 include/drm/drm_mode_config.h                   |   6 +
 include/drm/drm_modes.h                         |   3 +
 17 files changed, 1314 insertions(+), 330 deletions(-)
---
base-commit: 37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
change-id: 20220728-rpi-analog-tv-properties-0914dfcee460

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
