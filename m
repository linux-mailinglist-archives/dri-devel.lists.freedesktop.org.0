Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E1628019
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D547010E1DD;
	Mon, 14 Nov 2022 13:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8738110E2A2;
 Mon, 14 Nov 2022 13:00:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E9DF0580230;
 Mon, 14 Nov 2022 08:00:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 08:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430855; x=
 1668438055; bh=I9h0WGDEgvQvPKNY7aY+X/bcnurAusGAi85fmyhOKCA=; b=C
 FKnGfMYG5k3jNnrXtrXM1AFFPqjoRcS0hh8Vbgsiayuiv67nOEBDeftf5r2mDoM5
 ZSXsH+Y+p7cjy2EO7Ur+eSWLOVEeNQKGcuZ4/Hl+jZ2miIDMEOcgqURyZqA+M11u
 O8N3UzCUCJsE4Cu1zWjvIjtY3gg2pvda/4uclM7Je2dIlr0ocH2Ia76ZA5GO6Jyn
 MZ09k2W6ebeKs1tFVcujgeblSnsDwYcBgOjr4r9CV6iqdbW3bXqkD05mnKet0Kq+
 Bra59ubAv5Ea7qw6NyrSGpFnDpDZQqZotMfSeAMX9N9M4OdssyZ36bRpeCHR6Eni
 KjU8OCgYdPKsT/CcPPcig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430855; x=
 1668438055; bh=I9h0WGDEgvQvPKNY7aY+X/bcnurAusGAi85fmyhOKCA=; b=T
 gKK+9cIvIBzqqIvjSxARui6/aWlCQZ0rQaax4qvr1VZG/i/ioEcjiNXTwzBPmVxl
 6FrKLCbJb0hpgU5BVVju9s78kVBl3xzitEfRNdWldQiLuTKc6a0E5K34AXxjjlTX
 HGKilXuq2GBag7SIc68eQLiuwOB9eVdzcO+aFsI9/S3/ayEyyor2/Pq7d0hSyRq2
 RpkrP8hazZ23WE2hph7o+WETF4HTw8pzUxMlT/4z/+mkptZPOqdL43RtpOC1Ox9m
 2dgmYGz9PymX797LaloMzKcDZDL16ioWUSo0wF4sh3TlHewWl3Ok7HqbdcYTjSSR
 nAErwvczhTev+ftfptfHg==
X-ME-Sender: <xms:BzxyY2pIFpxyOhuQJw7FAu1_LCOQvdRtT_LBeFvVVPOMH06c1TWmdA>
 <xme:BzxyY0otOnC-KZfYFrmJPLz-QYwgc-vLHQw_hftyLE3I5-pG7qTO6WG1pNYso_p8Q
 cd1MmImRdaoUuB2SfA>
X-ME-Received: <xmr:BzxyY7McDvGwMKVJsJeJJC2_vw6Dhh28QAqtzQwRKo_TSFQFh79Pql_SSw2sijcy1dN5oa2yhF8rUX2TGKxfv6fgqwW-uEjWB28MdYDOPZSiWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BzxyY152skTCBx3eP5jLmZl7nUYONPMAVKVqnnVnOeNNu4QV4eE7sw>
 <xmx:BzxyY16eQHVjcLbq9DUjH3alOp8BkmVpwJkjFTUUurKcHRMYgQxqaA>
 <xmx:BzxyY1h-Wv5pEEtVtdnaXzxt6BpZRk2i-qYITXYT4C5nfneay-fYKQ>
 <xmx:BzxyYykttlLkBadp8pRCCl5hdW5oZ8_xI1HlIQ_BpateK9tN9BGTRw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:00:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:29 +0100
Subject: [PATCH v9 10/25] drm/modes: Switch to named mode descriptors
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-10-24b168e5bcd5@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=w9lKNNto+j9b2STH/OZ0qo6XjNHI6R3fCJ+Pp5+TrKM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1q8bgouvG0xmuzRlc9z9loWsWRfFVocUON9WFFd2VItI
 ztfpKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwERurGFkOC/L0pn5p1LLZ8v5nIi/rL
 vfaaZdu/P5c6X5VO13nb8fPmVkmBdlFJ3XcdB33Ymo0y7+DF+jHmgLbDYUO3f++RWOgPirHAA=
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

The current named mode parsing relies only on the mode name, and doesn't
allow to specify any other parameter.

Let's convert that string list to an array of a custom structure that will
hold the name and some additional parameters in the future.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Fix typo in the commit log
- Add Noralf Reviewed-by
---
 drivers/gpu/drm/drm_modes.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 37542612912b..7594b657f86a 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2224,9 +2224,13 @@ static int drm_mode_parse_cmdline_options(const char *str,
 	return 0;
 }
 
-static const char * const drm_named_modes_whitelist[] = {
-	"NTSC",
-	"PAL",
+struct drm_named_mode {
+	const char *name;
+};
+
+static const struct drm_named_mode drm_named_modes[] = {
+	{ "NTSC", },
+	{ "PAL", },
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
@@ -2258,14 +2262,15 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 	 * We're sure we're a named mode at this point, iterate over the
 	 * list of modes we're aware of.
 	 */
-	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
+	for (i = 0; i < ARRAY_SIZE(drm_named_modes); i++) {
+		const struct drm_named_mode *mode = &drm_named_modes[i];
 		int ret;
 
-		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
+		ret = str_has_prefix(name, mode->name);
 		if (ret != name_end)
 			continue;
 
-		strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
+		strcpy(cmdline_mode->name, mode->name);
 		cmdline_mode->specified = true;
 
 		return 1;

-- 
b4 0.11.0-dev-99e3a
