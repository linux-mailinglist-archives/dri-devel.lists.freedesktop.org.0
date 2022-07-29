Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8CC5853F5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27986113DE2;
	Fri, 29 Jul 2022 16:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F9210F72D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6A46C58093D;
 Fri, 29 Jul 2022 12:36:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 29 Jul 2022 12:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112560; x=
 1659119760; bh=st2NK37KTfySqs+WWdYxjBL07hSVh6varfy6HltspJc=; b=r
 dFEjrH53Yv87FiCgiK7WnA0uvSnLZ3ZRT8ZwaJcinNzyBTzUSg4dbLcYSVAsR5UO
 x2hngPpmPwPKGdP6DW8u9/RX+nmNLHaCSggbVJ+F6po0QtBUk5sbR7eblJlzgmMc
 8SV/xVsnszvlW3QHtZ41/7y6XPYlifM1kzPJ27qXSZy8oNkegEwlCJzwuWuS2Cvk
 Kjx/XdbZqfw1vx2ke9RIzVn6jnI4EZzYbh5unk1j2VuePiwKjfBRN9jGpcoz4/A1
 ajsXuIjjsCBkYkpr4ieQM/uhda30iyGsd8Q6JMujbF0bu1VLzxxGqTY4iHn2T9AL
 hC6TT43I9cdruUMOKY6uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112560; x=
 1659119760; bh=st2NK37KTfySqs+WWdYxjBL07hSVh6varfy6HltspJc=; b=y
 5ZHinuWkTWspJfi/IPrezlrOZ5v5DBOq+BvMGGrotoC9RjPRRZ4a4DlDqGQWBEHs
 hvFK/PicN7qqkUJDAoMEKbX3UwCH+GbHAuZxZd85eybIJ/gPZup7qd4xyxi/g4MZ
 EK+yYiGTpEvyFLkxEQYKfR+ChSGPlYqNZWoCD8F+H3dC1Yupv/QViaRsOy/M8ltz
 mpA5QLWjL/I+XjozTJrrlBoxcbLOWzSLvm+h06/IPk/YtofcZ2lYNJP9wZUJNVkR
 8XenPK451CPGOMGkXrG+mSlrIi3H0zmamqFP2P3YVV5T9Dy5ql1BrjXe8SOCeW6k
 svDNDJa6aEbtT5SsnDbfA==
X-ME-Sender: <xms:cAzkYivwx_5XWGtQOxVGDmesa_L6NTlT4P8-qWu94dprvZ2gdMXRWw>
 <xme:cAzkYncAghay4hmPG6ckgIp882ALCvK6K2MeJCK-1sdfpCqYVzkRaEGW4ukM9YYSU
 naGHpJFDG8Oq_-LUnw>
X-ME-Received: <xmr:cAzkYtx02fgFZp6gzPI4_twHQgNsXG8iHPjt85tLlio3J3wEjfEFhm3_pRbzf3emd-v8PkzkZPzr0ftiKDM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cAzkYtPVRxs-feqqI2oYdKT_KPfdfWke3vB9U5tw9jvRgScc8p84CA>
 <xmx:cAzkYi9heXywNUOjQ41T57EVqTDNBeRLoQfT5SiU3l-5ZWF6JR0Klg>
 <xmx:cAzkYlU3OedLqxVomAwHTM38c2eBMGxjDfAr6TwgraB9yME7aKO9Jg>
 <xmx:cAzkYgP1R3JfVlIyTl0TPFsGfsP_sHNwvtzs_FaoQ9UIDaVlDap3dw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:59 -0400 (EDT)
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
Subject: [PATCH v1 09/35] drm/modes: Move named modes parsing to a separate
 function
Date: Fri, 29 Jul 2022 18:34:52 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=2488; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=jeXmsF+0yQoip9VjnXEGiKY2SAbOvZx7rBy39YwT/5A=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHS9vnqUd56XL2tMM13vuv60m8Bjo5TH1s4Vey4rWKR
 uXVrRykLgzAHg6yYIst1wbd2fGFRbhE8HzbDzGFlAhnCwMUpABPRvMvI0CATOj3A4sK+03cCi5d1dR
 zpSLijNfHqhg2eAgkrXKzlJzMybDxbsn39K6/o+y41j2yXeeoIsn9tl5bkZvj5QbFAxKxGCwA=
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

The current construction of the named mode parsing doesn't allow to extend
it easily. Let's move it to a separate function so we can add more
parameters and modes.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 06a006e0b2e3..e85099df0326 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1773,6 +1773,28 @@ static const char * const drm_named_modes_whitelist[] = {
 	"PAL",
 };
 
+static bool drm_mode_parse_cmdline_named_mode(const char *name,
+					      unsigned int name_end,
+					      struct drm_cmdline_mode *cmdline_mode)
+{
+	unsigned int i;
+
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
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
  * @mode_option: optional per connector mode option
@@ -1809,7 +1831,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 	const char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
 	const char *options_ptr = NULL;
 	char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
-	int i, len, ret;
+	int len, ret;
 
 	memset(mode, 0, sizeof(*mode));
 	mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
@@ -1848,18 +1870,14 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 		parse_extras = true;
 	}
 
-	/* First check for a named mode */
-	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
-		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
-		if (ret == mode_end) {
-			if (refresh_ptr)
-				return false; /* named + refresh is invalid */
+	/*
+	 * Having a mode that starts by a letter (and thus is named) and
+	 * an at-sign (used to specify a refresh rate) is disallowed.
+	 */
+	if (!isdigit(name[0]) && refresh_ptr)
+		return false;
 
-			strcpy(mode->name, drm_named_modes_whitelist[i]);
-			mode->specified = true;
-			break;
-		}
-	}
+	drm_mode_parse_cmdline_named_mode(name, mode_end, mode);
 
 	/* No named mode? Check for a normal mode argument, e.g. 1024x768 */
 	if (!mode->specified && isdigit(name[0])) {

-- 
b4 0.10.0-dev-49460
