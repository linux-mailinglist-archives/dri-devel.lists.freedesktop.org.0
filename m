Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B55A4D24
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2424610F1B4;
	Mon, 29 Aug 2022 13:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A030310F1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:12:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 56DDA2B05F99;
 Mon, 29 Aug 2022 09:12:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 29 Aug 2022 09:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661778720; x=1661785920; bh=Gt3QdRBpDL
 r3ksyKqNP7CtpGFcb0aPox+HlDnxbw8D0=; b=mNnmVQ1GDhKMjp+MGtQcms5wYE
 pMjLcUarKmKj/5FleiIsYAMZc8IvGVUXs3FiVP3hzLEsnSW4omqr1uKeTCVj1aBb
 lVo3g1QKkNZkOIoQkDSCSTYZlAVfLevqj7r04ntL4f2522G03G0VeUEVFza5QBz8
 ++pCcnUAhQQ8vmOpSEq5rnX7WcwJ9X05lJm4nvoPpT/tBMOBZUTVRr84vFy2g4HK
 99EbHru7tPRJ3V2TBxIZUTrtmFHsHB7ea/5fQdxaD0okmNbjpYJsUYIubX+/BNIl
 QZhpXG45hNJJrFv3vId0cxgoaLE4AShBEwP1Fq+8tK5uKbe/+0nVqpg+ubWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661778720; x=1661785920; bh=Gt3QdRBpDLr3k
 syKqNP7CtpGFcb0aPox+HlDnxbw8D0=; b=Qz/z4QlR2w+X4vzoLj7wz6hFKIex/
 4QejW6yPU5Qhy8vmPI/19tjYlYZZb04oICenR67hlDBrCCTqgmpK5qDLBiRZbWgv
 0WjMvaPSiugNx/s6gtMojWpdmaA5vJ7xvbB7ITA2ea6XBryVX5nPjnWLFYZ3Zdgh
 XArNojGgDglpKXVGvJkjtLObKW+v13ZZRdCBX4DugjPbUNzoPUTCIDdC7frAQBXE
 ZqzpXHpGdbPGo5XH2jdUZyE4qH1rjUV/XRDWkQpv3OJbvBnmzuGA0bUDU2iWJOff
 q3a16/Jlp5V1WJPY0szNcRqsSvYJGLhgToXIOJYEByLAaSFL6F087wBsA==
X-ME-Sender: <xms:H7sMYyQ6so3iVzfxfI3TEWh6LqvE1u65VfMi86SiJM-ECgGTv5FB2w>
 <xme:H7sMY3w1RY73zHca1p-BThlwrK1xDTkcR_Rx_I69zInglWiqpEZ8vx4VGM5FNmT4C
 29GgRUru4flC9zGIUE>
X-ME-Received: <xmr:H7sMY_2FNY_czGCvtiWDRmsDyZfNcfo3TqUOz7Eq6ALE1sRTe9k2uX2sacIx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfogfesthhqredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefhvdekffefkeehfeffjeefgeekgefhtddvudffgfefueffvdefueekvdek
 teelteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:H7sMY-DGSkBIGvBBp2VZbnDCpERAGGK0I0lV8xfFhidVwv9IvAsHrQ>
 <xmx:H7sMY7ixR2HIvyAoxrkONcClLdaGMBDQgNMOgeAEHL_8TtG7CqPU1A>
 <xmx:H7sMY6qXuLund067dOcgOWCiVwSSOvUoxqvph7DFyteMkA2lHLU0Iw>
 <xmx:ILsMY8b6kn6yWWLhiU6z6R90bSk0VCj7SB4HBA3MBuCc-O-hBgg-ObaaLsg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:11:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 00/41] drm: Analog TV Improvements
Date: Mon, 29 Aug 2022 15:11:14 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=7147; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=cqo2aafkzYcyJ3mBZFUeznciMg58A/nLuDpuY2DeYGU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+S6rEyb1q243cVn8ZipLMlM+lNbWEtE5pEJtS8mZL9y
 yePoKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwETq5jIyfF5y9+/aiecEO+awz1sQ9r
 3E/qPsDOlzXOzOK7gau15Ev2L4wzU9dZ+UR0Pcs8Y/9zLPxTz6niexI/3Q/OO8usUbQi4ksAAA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
Here's a series aiming at improving the command line named modes support,=0D
and more importantly how we deal with all the analog TV variants.=0D
=0D
The named modes support were initially introduced to allow to specify the=0D
analog TV mode to be used.=0D
=0D
However, this was causing multiple issues:=0D
=0D
  * The mode name parsed on the command line was passed directly to the=0D
    driver, which had to figure out which mode it was suppose to match;=0D
=0D
  * Figuring that out wasn't really easy, since the video=3D argument or wh=
at=0D
    the userspace might not even have a name in the first place, but=0D
    instead could have passed a mode with the same timings;=0D
=0D
  * The fallback to matching on the timings was mostly working as long as=0D
    we were supporting one 525 lines (most likely NSTC) and one 625 lines=0D
    (PAL), but couldn't differentiate between two modes with the same=0D
    timings (NTSC vs PAL-M vs NSTC-J for example);=0D
=0D
  * There was also some overlap with the tv mode property registered by=0D
    drm_mode_create_tv_properties(), but named modes weren't interacting=0D
    with that property at all.=0D
=0D
  * Even though that property was generic, its possible values were=0D
    specific to each drivers, which made some generic support difficult.=0D
=0D
Thus, I chose to tackle in multiple steps:=0D
=0D
  * A new TV norm property was introduced, with generic values, each driver=
=0D
    reporting through a bitmask what standard it supports to the userspace;=
=0D
=0D
  * This option was added to the command line parsing code to be able to=0D
    specify it on the kernel command line, and new atomic_check and reset=0D
    helpers were created to integrate properly into atomic KMS;=0D
=0D
  * The named mode parsing code is now creating a proper display mode for=0D
    the given named mode, and the TV standard will thus be part of the=0D
    connector state;=0D
=0D
  * Two drivers were converted and tested for now (vc4 and sun4i), with=0D
    some backward compatibility code to translate the old TV mode to the=0D
    new TV mode;=0D
=0D
Unit tests were created along the way.=0D
=0D
One can switch from NTSC to PAL now using (on vc4)=0D
=0D
modetest -M vc4  -s 53:720x480i -w 53:'tv norm':0=0D
=0D
modetest -M vc4 -s 53:720x480i -w 53:'tv norm':4=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1 (https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-p=
roperties-v1-0-3d53ae722097@cerno.tech/):=0D
  - Kept the older TV mode property as legacy so we can keep the old driver=
s functional=0D
  - Renamed the tv_norm property to tv_mode=0D
  - Added a function to create PAL and NTSC compatible display modes=0D
  - Added some helpers to instantiate a mock DRM device in Kunit=0D
  - More Kunit tests=0D
  - Removed the HD analog TV modes=0D
  - Renamed some of the tests=0D
  - Renamed some of the named modes=0D
  - Fixed typos in commit logs=0D
  - Added the various tags=0D
=0D
Cc: Geert Uytterhoeven <geert@linux-m68k.org>=0D
Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>=0D
Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>=0D
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>=0D
Cc: Dom Cobley <dom@raspberrypi.com>=0D
Cc: Phil Elwell <phil@raspberrypi.com>=0D
Cc: <dri-devel@lists.freedesktop.org>=0D
=0D
---=0D
Geert Uytterhoeven (1):=0D
      drm/modes: parse_cmdline: Add support for named modes containing dash=
es=0D
=0D
Mateusz Kwiatkowski (5):=0D
      drm/vc4: vec: Refactor VEC TV mode setting=0D
      drm/vc4: vec: Remove redundant atomic_mode_set=0D
      drm/vc4: vec: Fix timings for VEC modes=0D
      drm/vc4: vec: Fix definition of PAL-M mode=0D
      drm/vc4: vec: Add support for more analog TV standards=0D
=0D
Maxime Ripard (35):=0D
      drm/tests: Order Kunit tests in Makefile=0D
      drm/tests: Add Kunit Helpers=0D
      drm/atomic-helper: Rename drm_atomic_helper_connector_tv_reset to avo=
id ambiguity=0D
      drm/connector: Rename subconnector state variable=0D
      drm/atomic: Add TV subconnector property to get/set_property=0D
      drm/connector: Rename legacy TV property=0D
      drm/connector: Only register TV mode property if present=0D
      drm/connector: Rename drm_mode_create_tv_properties=0D
      drm/connector: Add TV standard property=0D
      drm/modes: Add a function to generate analog display modes=0D
      drm/modes: Only consider bpp and refresh before options=0D
      drm/client: Add some tests for drm_connector_pick_cmdline_mode()=0D
      drm/modes: Move named modes parsing to a separate function=0D
      drm/modes: Switch to named mode descriptors=0D
      drm/modes: Fill drm_cmdline mode from named modes=0D
      drm/connector: Add pixel clock to cmdline mode=0D
      drm/connector: Add a function to lookup a TV mode by its name=0D
      drm/modes: Introduce the tv_mode property as a command-line option=0D
      drm/modes: Properly generate a drm_display_mode from a named mode=0D
      drm/modes: Introduce more named modes=0D
      drm/atomic-helper: Add a TV properties reset helper=0D
      drm/atomic-helper: Add an analog TV atomic_check implementation=0D
      drm/vc4: vec: Remove empty mode_fixup=0D
      drm/vc4: vec: Convert to atomic helpers=0D
      drm/vc4: vec: Switch for common modes=0D
      drm/vc4: vec: Use TV Reset implementation=0D
      drm/vc4: vec: Convert to the new TV mode property=0D
      drm/sun4i: tv: Remove unused mode_valid=0D
      drm/sun4i: tv: Convert to atomic hooks=0D
      drm/sun4i: tv: Merge mode_set into atomic_enable=0D
      drm/sun4i: tv: Remove useless function=0D
      drm/sun4i: tv: Remove useless destroy function=0D
      drm/sun4i: tv: Rename error label=0D
      drm/sun4i: tv: Add missing reset assertion=0D
      drm/sun4i: tv: Convert to the new TV mode property=0D
=0D
 drivers/gpu/drm/drm_atomic_state_helper.c       | 115 ++++-=0D
 drivers/gpu/drm/drm_atomic_uapi.c               |   8 +=0D
 drivers/gpu/drm/drm_client_modeset.c            |   4 +=0D
 drivers/gpu/drm/drm_connector.c                 | 119 ++++-=0D
 drivers/gpu/drm/drm_modes.c                     | 638 ++++++++++++++++++++=
+++-=0D
 drivers/gpu/drm/gud/gud_connector.c             |   8 +-=0D
 drivers/gpu/drm/i2c/ch7006_drv.c                |   6 +-=0D
 drivers/gpu/drm/i915/display/intel_tv.c         |   2 +-=0D
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c       |   6 +-=0D
 drivers/gpu/drm/sun4i/sun4i_tv.c                | 198 +++-----=0D
 drivers/gpu/drm/tests/Makefile                  |  16 +-=0D
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 239 +++++++++=0D
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c | 216 ++++++++=0D
 drivers/gpu/drm/tests/drm_kunit_helpers.c       |  54 ++=0D
 drivers/gpu/drm/tests/drm_kunit_helpers.h       |   9 +=0D
 drivers/gpu/drm/tests/drm_modes_test.c          | 131 +++++=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c                  |   2 +-=0D
 drivers/gpu/drm/vc4/vc4_vec.c                   | 422 ++++++++++------=0D
 include/drm/drm_atomic_state_helper.h           |   4 +=0D
 include/drm/drm_connector.h                     | 165 +++++-=0D
 include/drm/drm_mode_config.h                   |  12 +-=0D
 include/drm/drm_modes.h                         |  17 +=0D
 22 files changed, 2057 insertions(+), 334 deletions(-)=0D
---=0D
base-commit: 8869fa666a9e6782c3c896c1fa57d65adca23249=0D
change-id: 20220728-rpi-analog-tv-properties-0914dfcee460=0D
=0D
Best regards,=0D
-- =0D
Maxime Ripard <maxime@cerno.tech>=0D
