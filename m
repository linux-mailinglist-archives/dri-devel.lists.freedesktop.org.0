Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3636F6240F0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8523C10E70A;
	Thu, 10 Nov 2022 11:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E389410E6DA;
 Thu, 10 Nov 2022 11:07:35 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4E8735802EE;
 Thu, 10 Nov 2022 06:07:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 06:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078455; x=
 1668085655; bh=c5RJi0M8Q1SE//r8kHa3xrGioqqVyBLDq6u+CcpOVQk=; b=F
 TvSPiX6dCF3LmEFNZzJc7tZn1bz4yBZUkmvP5o5RYVAOr7AaK9EzpaFqImx4yEev
 s6gdJJCvWqW8a5yNIwlshR2U1ACs2WMCMOCz1jIJqedgz5DS4IKl8C3a75aHveuP
 cNfzc5/vqvN0xDm69yjEUhLNupQNPU8yO1Aycroa7fn3Bzm3ulsQQIUAde3Ok66J
 aIu6qR2LI857myXVRKtxj4Y24f3OG5G/J2MG6Qf7n9z37YwsJ5RChQ8Xgljxpsm7
 dUbcTcbkYcDm/mG0Pd3zFcOsIKZ1hLz7+zS1WVX+QoPsgvixvP6EN3FRZRPzdsVI
 XVUPDwhnyc1eBfRJYY6sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078455; x=
 1668085655; bh=c5RJi0M8Q1SE//r8kHa3xrGioqqVyBLDq6u+CcpOVQk=; b=T
 z5kKc0b370fxiMU0xfojBHN519s3f0GmCVPvT36welIMAcX9We8Fhn8uMxwJhB12
 il/jyAIVEyLtAUee34OWY8UHCV+l2mJBjoEZ7KeE5yY+oWj6d/46S6nadZppZgms
 neTO8WqkIByqoGmauOgDv5QPVVBD0NNjJDKi9iEWy6U9yfjpzeqRsUy/UqS0PRWS
 Qljo1avxZwZlJF860osc/EOBSWAyvhOBLPgkOJY3fE6jSiPV5B6YVh5JYTZ1epxP
 wrK2gl0mdmBUXtW72YRo2K6c78TIknRUcukXjD0gF5iEiseLFZqDvIBuUGlDbOhz
 dc7CiAz/434o7ElfYTxMw==
X-ME-Sender: <xms:d9tsY1jRP_w5RT3GcZWuY7hpp5nr0UsR_3djHm2_98UbvwfaqGKPlg>
 <xme:d9tsY6BOV1Ky8ADXawpMsv1saZKyOHBsquxUC51l8TxcdVONBGZy5XUBYNRg3snK1
 Tvyt9t4j0G_IQ-1VHo>
X-ME-Received: <xmr:d9tsY1GSsLLqVskfpQHoQUKEy6WKg8wmVhTKAQPW6WEc3TZozX17hK9ld7YNdonIXdznRbjcjFrWVJJ-uhMpoa1wc2FrxKfyUCC1fulo4F5vDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:d9tsY6R-Mh4CQUZS0Roi9AexQVR2qIql5dCFsr1HAprjqleNSrIBHQ>
 <xmx:d9tsYywIu2zX_JRhiPjMKIYbdI-yk2TxNDMw1DeckpUwBo6cZ3CHPA>
 <xmx:d9tsYw6fcIYZuM7rR7e5SFIZLuFOcm6Fv_cg0aTy92qv2pP28sokVQ>
 <xmx:d9tsY6c1ir8SM7GnWnTNuuST4SPVbHSAWOZ8CyC4BWT7Ed4NvjDsIA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:20 +0100
Subject: [PATCH v8 08/24] drm/modes: Move named modes parsing to a separate
 function
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-8-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=gJftk6Nvc/pYwNn1PcqGXwDIYm8zDBtvZRiBH7cMPJw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1PevnfXTZi5WaW4gffC6/a3qb2cZ9pn/WBRFSzyyvZ8
 +OxGRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACayYykjw52mya+P2P8yuNltuOKV5f
 GquMMWV9l3PBB7OqOB27Dc4Rkjw4HobJes23UlBca3LVfPnSNSV7u7zvo+Q8CpzWZHN7bEcgEA
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

The current construction of the named mode parsing doesn't allow to extend
it easily. Let's move it to a separate function so we can add more
parameters and modes.

In order for the tests to still pass, some extra checks are needed, so
it's not a 1:1 move.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Add Noralf Reviewed-by

Changes in v6:
- Simplify the test for connection status extras
- Simplify the code path to call drm_mode_parse_cmdline_named_mode

Changes in v4:
- Fold down all the named mode patches that were split into a single
  patch again to maintain bisectability
---
 drivers/gpu/drm/drm_modes.c | 70 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 71c050c3ee6b..37542612912b 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2229,6 +2229,51 @@ static const char * const drm_named_modes_whitelist[] = {
 	"PAL",
 };
 
+static int drm_mode_parse_cmdline_named_mode(const char *name,
+					     unsigned int name_end,
+					     struct drm_cmdline_mode *cmdline_mode)
+{
+	unsigned int i;
+
+	if (!name_end)
+		return 0;
+
+	/* If the name starts with a digit, it's not a named mode */
+	if (isdigit(name[0]))
+		return 0;
+
+	/*
+	 * If there's an equal sign in the name, the command-line
+	 * contains only an option and no mode.
+	 */
+	if (strnchr(name, name_end, '='))
+		return 0;
+
+	/* The connection status extras can be set without a mode. */
+	if (name_end == 1 &&
+	    (name[0] == 'd' || name[0] == 'D' || name[0] == 'e'))
+		return 0;
+
+	/*
+	 * We're sure we're a named mode at this point, iterate over the
+	 * list of modes we're aware of.
+	 */
+	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
+		int ret;
+
+		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
+		if (ret != name_end)
+			continue;
+
+		strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
+		cmdline_mode->specified = true;
+
+		return 1;
+	}
+
+	return -EINVAL;
+}
+
 /**
  * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
  * @mode_option: optional per connector mode option
@@ -2265,7 +2310,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 	const char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
 	const char *options_ptr = NULL;
 	char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
-	int i, len, ret;
+	int len, ret;
 
 	memset(mode, 0, sizeof(*mode));
 	mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
@@ -2306,18 +2351,19 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 		parse_extras = true;
 	}
 
-	/* First check for a named mode */
-	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
-		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
-		if (ret == mode_end) {
-			if (refresh_ptr)
-				return false; /* named + refresh is invalid */
+	if (!mode_end)
+		return false;
 
-			strcpy(mode->name, drm_named_modes_whitelist[i]);
-			mode->specified = true;
-			break;
-		}
-	}
+	ret = drm_mode_parse_cmdline_named_mode(name, mode_end, mode);
+	if (ret < 0)
+		return false;
+
+	/*
+	 * Having a mode that starts by a letter (and thus is named) and
+	 * an at-sign (used to specify a refresh rate) is disallowed.
+	 */
+	if (ret && refresh_ptr)
+		return false;
 
 	/* No named mode? Check for a normal mode argument, e.g. 1024x768 */
 	if (!mode->specified && isdigit(name[0])) {

-- 
b4 0.11.0-dev-99e3a
