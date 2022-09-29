Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D6D5EFAAF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B485A10EAE9;
	Thu, 29 Sep 2022 16:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA5910EAB9;
 Thu, 29 Sep 2022 16:31:44 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E03B4580807;
 Thu, 29 Sep 2022 12:31:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 29 Sep 2022 12:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469103; x=
 1664476303; bh=VDMrw1yZwYW6eVQ+GdZtOc2VlNxaLWcKqU1ZUn1UESU=; b=o
 GqjJGmAJ76Fnd9q32lgwun+M6mLr/ISsxOl/qBPfEeF6I3MGXkjNqe7Y57MaY3gE
 v9viBzKQPnYZKcM7KPDERejXzNsZyKe/LwMMUToETiGYwoL0E8SY9lhberhvMBuy
 bB0Cv6rk6T0rj2Izqs8fCiRRcfOuusLon5PJYnYWTulUAEIVSeK8vSIEpAaZkOFT
 nE++w7+AnjT+DWTbjnLXdNQlAm9HaIIPsUIgNiDjLcbw25BLaCb9gTiIGT05q2Dk
 J4meNGH4MYt0M0o0mzl39d1cE4RjIvNvlwrhnb8D3gVvedzUfvvIfdsabB4bklDD
 b++UJ4fyLhTBD004KM8Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469103; x=
 1664476303; bh=VDMrw1yZwYW6eVQ+GdZtOc2VlNxaLWcKqU1ZUn1UESU=; b=U
 sYkAuVYEQ27K2Uo+FIw1j2IdHTVfLbN4QHHduWOmsm/hAgt697zzMF55rC7yIbNi
 IZNIfh8NPtxulNkWcujSqrQn1r5ShdYZIEr6G1j5dxW2HSb9KCYzh/CDGMSOmonR
 tEiyiDHp/J8fv2b6hriKBa6Zk5pDY+TpK2T29vhmb4oaKSe9hKT60YKnJX4xXdAt
 pEgK4/CfGuIGBHi5oKLd+qnMnPXjwY/ExKZAX8GyyiMJyn8OJ/4yLCgr5GW0Vzzv
 d4ziwfYiqbMc3NCb7/SkJetJ74uktm2oy6wokFeqQ0LOcswd3n76X4ccKuJ4wpTR
 pW8EaKSKPFyvdJk7x1nGQ==
X-ME-Sender: <xms:b8g1Yy2qMqdsYFTvXuHHJ83SmsrSYzF-FLmfv2IUnZc4MxDvkzudnQ>
 <xme:b8g1Y1H_6OQ4wC-M_MRc3NipICegGUhaMYVFR40xnGQ3-3VozkIHm071XydD-nv5Q
 LZJAJ3GlYJYFnpExTA>
X-ME-Received: <xmr:b8g1Y67To2Cvh1PfS8BzQ-0RUIz79-jGof9_T-Y9UV9wvUwFaWnmWYK3A-nh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b8g1Yz3hOqPx2sOW5abxv-a7Uk2OHGxd2EC3DatGtYtV9r7pD2MxKA>
 <xmx:b8g1Y1F57izrJhSQK3cVYHZwSwu2TBrYkz_cMM1Wuzx5WGXxURjEhA>
 <xmx:b8g1Y88JG_iXzndoPpZ1M4AvXBWQj6s_gec_x2JDErVFqUP3LQVp_w>
 <xmx:b8g1Y1SqEBr_J2iSMlxokNX7psbzueb9kUYB6rbVcdabYNmmQKrtSA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:09 +0200
Subject: [PATCH v4 15/30] drm/modes: Move named modes parsing to a separate
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-15-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=3594; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=DtnwP9Q9mxYOTTGN+0iGfB9KDWq4AsYj+A/D/gHKHHY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9xr779oEet+PJVjouVeLY2etBvRCuyNpTOb5f7tDbKs
 fvO4o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABP5rc7wP/sUQ72NWHL/pCvfK2RDvi
 w32de+++Xbs9M2ndx/af98C3OG/94dDrf3PDxn5TZ31+Kl91gVVH5ITO7xK1gsrn+uZQYHGzsA
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

The current construction of the named mode parsing doesn't allow to extend
it easily. Let's move it to a separate function so we can add more
parameters and modes.

In order for the tests to still pass, some extra checks are needed, so
it's not a 1:1 move.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v4:
- Fold down all the named mode patches that were split into a single
  patch again to maintain bisectability
---
 drivers/gpu/drm/drm_modes.c | 73 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index c0dceff51cac..2f020ef2ddf2 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2229,6 +2229,55 @@ static const char * const drm_named_modes_whitelist[] = {
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
+#define STR_STRICT_EQ(str, len, cmp) \
+	(str_has_prefix(str, cmp) == len)
+
+	/* The connection status extras can be set without a mode. */
+	if (STR_STRICT_EQ(name, name_end, "d") ||
+	    STR_STRICT_EQ(name, name_end, "D") ||
+	    STR_STRICT_EQ(name, name_end, "e"))
+		return 0;
+
+	/*
+	 * We're sure we're a named mode at that point, iterate over the
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
@@ -2265,7 +2314,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 	const char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
 	const char *options_ptr = NULL;
 	char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
-	int i, len, ret;
+	int len, ret;
 
 	memset(mode, 0, sizeof(*mode));
 	mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
@@ -2306,17 +2355,19 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 		parse_extras = true;
 	}
 
-	/* First check for a named mode */
-	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
-		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
-		if (ret == mode_end) {
-			if (refresh_ptr)
-				return false; /* named + refresh is invalid */
 
-			strcpy(mode->name, drm_named_modes_whitelist[i]);
-			mode->specified = true;
-			break;
-		}
+	if (mode_end) {
+		ret = drm_mode_parse_cmdline_named_mode(name, mode_end, mode);
+		if (ret < 0)
+			return false;
+
+		/*
+		 * Having a mode that starts by a letter (and thus is named)
+		 * and an at-sign (used to specify a refresh rate) is
+		 * disallowed.
+		 */
+		if (ret && refresh_ptr)
+			return false;
 	}
 
 	/* No named mode? Check for a normal mode argument, e.g. 1024x768 */

-- 
b4 0.11.0-dev-7da52
