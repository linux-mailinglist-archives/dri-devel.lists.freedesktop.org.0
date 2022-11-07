Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AD261F565
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B5B10E33B;
	Mon,  7 Nov 2022 14:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1653C10E32C;
 Mon,  7 Nov 2022 14:17:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 55CB32B066F4;
 Mon,  7 Nov 2022 09:17:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 07 Nov 2022 09:17:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830636; x=
 1667837836; bh=6T4B/xwI2cbxROXI0cvZgK+xr9wBqg5gtVwsC7EJyjY=; b=J
 q8lAN8dQvn/dNgMGW1ARCRLSbSYXC8G5DqraJNAmSk29Jx2XNd8+v8y1YZ39zTUr
 1E4TffA3x3v2+YrUlHNLebwWx3+frU9wpmBFcaaM0xGS1I5KXcHbK5UE9htOc3uL
 KamosONKksUsi4FbbQ9nxVeOkGNxH4cosnA5QEaF2yvSn6um0HLS927asryFPgHb
 yS6dn+/6PnVx0mPbjIv7rNs8ETsRFFrxvHmm1GMusLHuB8GQGPkuIJs159N4qhxW
 klq/IBHvDW0IDT/SRQ0IPkkVLEUSK05zhltMFg0BbRjZfZKFE6A/NvLePu0H7VLV
 lIfF5/5bLrWkzFKHllJzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830636; x=
 1667837836; bh=6T4B/xwI2cbxROXI0cvZgK+xr9wBqg5gtVwsC7EJyjY=; b=K
 MXOqO3B+7L4C84qKxVszx5HRcSilQoWaxDHV5fo+LFmkiwppfX5voVH09uISDs/u
 CGmZrhxaGwSp/172np9egja+YaNR1OYn4bxsgqOW8Pl/GhBamK/U65dCa2AhRRtc
 sGXBnWphVgkIXLqrWn1viJTpG7zexV+yDVn/HHz9EJVQfmNUMa6QkDikmH+zzlWI
 d+QqzAqgXr85EqdWSrJnuRuPPE6aru1g3d+cDPXDcylTVnSnkTb3WtRDm6vM1KiZ
 FC6QgmHvx8R/+E2gQwft7e3oRx+ap32BPKgAhGPEPPOVzTp9pigPQYWG7fa2wLpm
 ZIwL55/F+e0mvkW9nX9aw==
X-ME-Sender: <xms:bBNpYzjqwhv-qCkXYLfHiUPU2SX_YHdh0q9zkgK_t1hUdlrb7FXTGA>
 <xme:bBNpYwAmArQxDNprNxD_GgvPN1sA0eVk6TcIkfpfHDRQsBrTYqEAGKefiJ-06tvpJ
 AHgAei6YCBqT-XIKkI>
X-ME-Received: <xmr:bBNpYzGGbpLPkl8BkifZV_PPsm_nVZXZfW-sAJnt5jd6WjTi_FUATVP71CDHHWTNRuiruJm6pnNQmlVt12IsZyJzpXrkQA7aSWPQOQE5VS13-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bBNpYwSVrh1DU51UvqeHAESjOREgZ7nzk9Nmd7ujnJVxVTM9ES7P6g>
 <xmx:bBNpYwzPKpGZh5Ok-NIfSBeWxo7Y17y1phQgrDykuHhhZDPZYFgrgw>
 <xmx:bBNpY26MNQ0uExVcCE0SSg9ePNMb0Hfokr1IFvtNNIclK_MA77jvYw>
 <xmx:bBNpY4f3lcgJpm608ncWBSOZ6izXyFG53UZUTJAXpnHECmWJM6yg6fGBRlU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:17:16 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:34 +0100
Subject: [PATCH v7 08/23] drm/modes: Move named modes parsing to a separate
 function
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-8-7072a478c6b3@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3744; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=k66y5WV0/97WdCO7GgeXv4fdViXcdIgvNaFuNM4xnGU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwg4hamraoYfEe5M3tLDstBFKLmHM2/ul452TZ+S9fSd3
 n4jpKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwETeFjIyvNwsqMKQoPXybtKtY29uRX
 JfzLks9GxjsobmntXTmJ8+mcbwP7245SjLClGx1qjvW/OnL1w5L2sTp7VeYLSk38WFOzoLGQE=
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
