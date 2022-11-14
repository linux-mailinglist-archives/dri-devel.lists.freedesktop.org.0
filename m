Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A58FE62801A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA3810E2D0;
	Mon, 14 Nov 2022 13:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463A410E2B6;
 Mon, 14 Nov 2022 13:01:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id A4C56580258;
 Mon, 14 Nov 2022 08:01:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 14 Nov 2022 08:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430872; x=
 1668438072; bh=GR8yd3xkp3m5q5171NoosfT+Q8zFyHZNiQ3LsD+pUAI=; b=e
 vfeTfdx3VbsWridfxOAut2CxYhXTDDqAz+SBNWqLWoIFByDRjcDsw6pP2gVYkVBX
 1ba8VrkByVCW04MUlMngyZYwNEoKKuwvcVS9/cPpyT5aIxNbz7chD71JJTac/2kb
 fQAe8GNdFX/PJAuB9B/Y7VIB2sxiZwALkWIBisYYoCoP9jx9RhQX5yZfnxJAapEb
 e1h6oNvqSzdDHWGOfTxXeK7u/Dv86u8bj8FH2GgMvnHeCngRtUSqtBF/vs0rG92k
 4vnhkXuwmmEqW8PMw/nuzTvWViwvvIIEmAbfACSq+CkF11wM6x/3TIAM/HiUK11m
 JQakidVSz7aBE+6687ODQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430872; x=
 1668438072; bh=GR8yd3xkp3m5q5171NoosfT+Q8zFyHZNiQ3LsD+pUAI=; b=L
 GltnB2tHtM5E1HOCi6AuEVFF+VXwQN3h3gWi3ZoJd+r6IptZzG9ocUYl9icQOH8I
 JMDuEoCHqfZcOgFQG7ilqG/Io+ocfQCGVznTVeBMxS/ZTxRiP5csSHwEtfh7YlEC
 2WTwzl0u6hRgfDHo7hS60gT+90vS+oOQTgvXHFlxTcCFyI4/yxE13EPGo8hQEDSv
 X4VPF8/raIdjFMP7nev8RpzDBb5YtGDhpJJnlKvEeFq62H+s8ehmb3lDOW95wqI6
 wy0e+x+HvHUqBXV/PK8QFrtibAYqN1sQ+GzAB99lsnPT0y0OQ+d6F+op2vSTRMzM
 +yuhrSpL0MZe84eSSNfCg==
X-ME-Sender: <xms:GDxyYwvqn0Am5HVQX-RflIYaFYW6JmEVxX2ltz1tbXeDJgIphb_lfQ>
 <xme:GDxyY9ekdsS3GGhXjTFpyt7San4KkU615xlhJe9ycq2-wpo4MD_Yucq8KkOmGcQzv
 t-_yhldDXNHy6q4yv4>
X-ME-Received: <xmr:GDxyY7yxMZ5ow8sNJgf_3aPEnEuW80Mt2pVDQYkj296tXf9i3oXR2JTVcjVvIPfVHGqBz4FEIHqndZwLhKfTn25e3CQW80zzLAZQWxzDepWC4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GDxyYzMBCydT2_BwtwtCR_9j3DqEdYqtt6hNnx6XpyE6insKC7GSnw>
 <xmx:GDxyYw8ZCxS4wINI2KmMqhMdTMDpkPJQEbwfPOtNACBLassp3aXm-Q>
 <xmx:GDxyY7XB9x3L_Do-gLgtprJCUuHFVGsVSP5S8J63ToJvg71cn5ABmA>
 <xmx:GDxyY0Kq7BICzU0f7TvlTHvU5QxhT_6HyHw5_opySSh9hhdXR58hKg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:01:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:36 +0100
Subject: [PATCH v9 17/25] drm/modes: Introduce more named modes
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-17-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2971; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=OCASaZ5ypeWqDlW0Op+nk7Cu54z43oCV4OVNt9wlZv4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1m9OHF1gFKNTG7/map5uYenzWd8ktCfOfPXw5mLZxdMd
 1h791lHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJFP9mZJiys7P3WGk6d+KXXIYjDz
 c818lrNTtZ4iW/UiLuu56Wwg1Ghit/alOrvDncsyyV/3zWbRV77rj04KeuIxIV91sZlCaf5AUA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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
index d3f0a3559812..855569a269b8 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2272,7 +2272,9 @@ struct drm_named_mode {
 
 static const struct drm_named_mode drm_named_modes[] = {
 	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC),
+	NAMED_MODE("NTSC-J", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC_J),
 	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL),
+	NAMED_MODE("PAL-M", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL_M),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 497434cc56cd..f2e18392a953 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -151,7 +151,9 @@ static void drm_test_pick_cmdline_named(struct kunit *test)
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
