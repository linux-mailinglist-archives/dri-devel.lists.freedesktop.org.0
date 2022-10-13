Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9D35FDA83
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC6310E8DC;
	Thu, 13 Oct 2022 13:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C912710E8B4;
 Thu, 13 Oct 2022 13:19:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 26641580364;
 Thu, 13 Oct 2022 09:19:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 13 Oct 2022 09:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667163; x=
 1665674363; bh=VDMrw1yZwYW6eVQ+GdZtOc2VlNxaLWcKqU1ZUn1UESU=; b=Q
 NbwZSLKL4z+LpF+XyP+hAwftLKilrKxTutMsYIQ5QRqEaC2nrs2r6iLMqnSQsIQy
 cFtmPAsiDCuvN617G76VMxUR8xl2d7hP+y5iwCQZPI+Re4pWnrgCsED4jgdQ7dBH
 W1xp1+Q9AAkSdqdGWwLdloOVhpJIroZVFPFqKI/tPIVpqwZpAnMRseKSnbDspeZV
 Gg28xiZt5oYGp0QXfij1EGrz4JPqYUKhc2N9vPt99wHxPM4nU27FF8gF3CYGWO/7
 +yHXTdlMlW0PpuutkKwKfylMgjJoJiDHyMl+ot1ymRN1qtmACKR2WD8aareBDFvK
 sw+2qw9FmrygGka2wUxyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667163; x=
 1665674363; bh=VDMrw1yZwYW6eVQ+GdZtOc2VlNxaLWcKqU1ZUn1UESU=; b=D
 f6A0R3Qf9P9Qc0GNnOImtSMxCyiz5J/bgm/eAXMZZ90WtNm6SFrM8Jky2VFm4cV6
 TqDvj0wbu3mbCrVtN3kg1ltWEGkMbFYCNShJZ3ZVZRv7Ngllh4DiC6HiGqGkyzQ4
 YoFcwrz+igytFQNMN81z8Ylxxam3vwjaLSJIA3rZVVtSp/Neu2RN4akKhHZYVCKX
 trMYxgZs5HRxB0UdZX1CwlFV1lYa/FSsF6zwQ3RENXK7fj72wX75sMVpNiOYbrav
 K0WaQ7FsmVbFEfzyr/OHFDjD72sDepq/UkvwzRKVPfxwwScfsT0w9F/gGtklvDGi
 RqJvdmdB9cNtL/H5u1mbA==
X-ME-Sender: <xms:WhBIYzNTi1NK_DQ7nrgBgVrUwIcvsp54XopZhVpo7DC7wgNTQX5qkA>
 <xme:WhBIY99aDPRLXmkKZLw5IukNx0sKVXj2IApirrrh5cyDUbRM908sG9PQFvHrBsuPQ
 a0UVMAdT1lkptHYc90>
X-ME-Received: <xmr:WhBIYyRj2yEWSq1xo87X3vDPdSzcXd8lmI8FmlPDneP-BJJXC5ROCqhJJZkPk8Mi40_L8HxNBMyPothk61j0H4Ns0VybJuZi_n-i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WxBIY3v6jmdXd4eAMKx7LB6QaVGf_hzPyDt1rNywSJz2nf3hhVxNAw>
 <xmx:WxBIY7fsklyJv4HweKWI-qVQw-9jIp8Y9if9u03kflIpXu1If1QJTg>
 <xmx:WxBIYz3Q1dazpADOH5pntucKL_5MfQgnw1eChXCvEfz_RIpb3B0b7A>
 <xmx:WxBIYyoeXYZQFezacF3W3E0mfDhX_s839cXFUckJWWPh2HKhnWtPdQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:52 +0200
Subject: [PATCH v5 08/22] drm/modes: Move named modes parsing to a separate
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v5-8-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, 
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=3594; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=DtnwP9Q9mxYOTTGN+0iGfB9KDWq4AsYj+A/D/gHKHHY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm6vovvd9uyKlDT32JuSJXtoLfs8k/Xqxpdu6szgYD51
 z4Oto5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABP5FMjI0PijrfGI56n288k5H2x8Wh
 c5b32se2LPQW73swoPQw7EZjEybJ714sC0Lp2z3m7PJ/s/kJP2Ytoyp/E66xtPRoHS85JMTAA=
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
