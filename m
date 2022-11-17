Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8D562D6F0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B350010E5B5;
	Thu, 17 Nov 2022 09:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A0410E5AF;
 Thu, 17 Nov 2022 09:29:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 034172B069CB;
 Thu, 17 Nov 2022 04:29:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 17 Nov 2022 04:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677383; x=
 1668684583; bh=MuHDE3CNOIfNo4O4bODhOYE0EIhImjC2RP9g5kZQp6U=; b=W
 ll5nv9xGW9HRiPBXpExG43R05eFNjBTiOiCV0elYLOt2EajtfZo33N7Z5uFre26O
 7tH/rPFVKbPGWn18ayA70oFiASZufasPOIts7dvjrvkAZ9E3BVnGx9ixpVirnxIU
 U+IqA64no37VpkUwduAiAu20IQ06BETccRj5XRAEq1Oiok/6vgYbsrLgWfkoxgXF
 ZD2nKwV0mLWvxpJV7XX5HaDgIQtWz3YQcmO27PYrfqwCGHjZRNQu40w3xWY3yvr4
 sK9PcTYjrLKXhxxPwsCUd6cRBvythMdR6UMHKxAtTiJk2fzYEepxnGSrGUN1L+cg
 G5wzSkCvZE6vQPBzn7YFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677383; x=
 1668684583; bh=MuHDE3CNOIfNo4O4bODhOYE0EIhImjC2RP9g5kZQp6U=; b=b
 e1InmLbhcIBIZrXGUcoSEYMFO4kWATvGXU2d3Zm0Pkjym5rLYF/JXKy2gjH4kdqQ
 S+pD9b9aVjxgzJbn7RwN5locWV8+D0tRReJOXozP+pjrKZIBztyHk9u6gUZBsYfb
 34gcW5d10PjsYSvrmJ1vGvFxOnKhMTYwTWcvYJYErpTjqfiY7CToSIb1GNySMGiw
 er8zM5UItFcWhFA2S7zEfCNSRv2WMiRldXvI4LMGQqL6F2M5dTtr8HzwN9B8HpeE
 ssNPDHpAjZmd8zhtQE869wJqn/tbDeJrLs0cPTfTSJLX/GnbryEeLmg7c7BEDhip
 gw+ZpoK67lOJ4lP5wU2bg==
X-ME-Sender: <xms:B_91YwdNnNFHYAxkhjVUvNbayEyUrcbK8rnVdChhe2JvZPLVoLxTDg>
 <xme:B_91YyMyKwkpMhS51th89v6uRYlVeW2K_ET0zLBVx-L0yD6nu5-j4e7kgqe0_TBSu
 7lKPIkE1Oe0Uc26tLU>
X-ME-Received: <xmr:B_91YxgjFEB7XLxuZbaI6lxwaBI78wLVow0Jwjb1tGtSVVVXFKchzxx2mGZ0_9GpuR4ZLAUthuKo16uSZSTXqIsP5ie1PPTic9h-wIaym--DZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:B_91Y1_tHc9FORWGFf2_HEXvwVsC4to-rXZ-yQQ-VQ-X4_isdJMHfQ>
 <xmx:B_91Y8sv2YRhUIylj6Lqx21lrf_TxwkyTnA-13YfuogfamUzQrvOxw>
 <xmx:B_91Y8FXdEvKu9Fg9tXcPxFvPdsMFvhhyI6QP03aEOxTMqkQn_ASoA>
 <xmx:B_91Y14Td-YhZDMHGqkRpIB2cyFfbFl-EsMhAYMljdERNeAx6fwJJAvK4aQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:29:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:54 +0100
Subject: [PATCH v10 11/19] drm/modes: Introduce more named modes
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-11-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2971; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=jaOBr4CmxYNe7drN+2/eXasdFgIKLEEd//OdC+esHKM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y5IOj1yLuDry85oS/ISCUwRTPdoXjx7yaPYf23rdmlN
 bZnVUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgImkMzEydIRKnTpVklartllnY2lw4K
 uSq294fM/MsfVnn/fVYunMnwz/iw9frq0qts3VffuyMj/35uXAi9/P6jRc//bkr/DyD5/CeAE=
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

Now that we can easily extend the named modes list, let's add a few more
analog TV modes that were used in the wild, and some unit tests to make
sure it works as intended.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v9:
- Document the new supported names

Changes in v6:
- Renamed the tests to follow DRM test naming convention

Changes in v5:
- Switched to KUNIT_ASSERT_NOT_NULL
---
 Documentation/fb/modedb.rst                     | 3 +++
 drivers/gpu/drm/drm_modes.c                     | 2 ++
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/Documentation/fb/modedb.rst b/Documentation/fb/modedb.rst
index bebfe61caa77..bb2889c6ea27 100644
--- a/Documentation/fb/modedb.rst
+++ b/Documentation/fb/modedb.rst
@@ -29,7 +29,10 @@ Things between square brackets are optional.
 Valid names are::
 
   - NSTC: 480i output, with the CCIR System-M TV mode and NTSC color encoding
+  - NTSC-J: 480i output, with the CCIR System-M TV mode, the NTSC color
+    encoding, and a black level equal to the blanking level.
   - PAL: 576i output, with the CCIR System-B TV mode and PAL color encoding
+  - PAL-M: 480i output, with the CCIR System-M TV mode and PAL color encoding
 
 If 'M' is specified in the mode_option argument (after <yres> and before
 <bpp> and <refresh>, if specified) the timings will be calculated using
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 3d410be8db69..699c66e54668 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2274,7 +2274,9 @@ struct drm_named_mode {
 
 static const struct drm_named_mode drm_named_modes[] = {
 	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC),
+	NAMED_MODE("NTSC-J", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC_J),
 	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL),
+	NAMED_MODE("PAL-M", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL_M),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index fe1f6be097a2..52929536a158 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -150,7 +150,9 @@ static void drm_test_pick_cmdline_named(struct kunit *test)
 static const
 struct drm_connector_pick_cmdline_mode_test drm_connector_pick_cmdline_mode_tests[] = {
 	TEST_CMDLINE("NTSC", drm_mode_analog_ntsc_480i),
+	TEST_CMDLINE("NTSC-J", drm_mode_analog_ntsc_480i),
 	TEST_CMDLINE("PAL", drm_mode_analog_pal_576i),
+	TEST_CMDLINE("PAL-M", drm_mode_analog_ntsc_480i),
 };
 
 static void

-- 
b4 0.11.0-dev-99e3a
