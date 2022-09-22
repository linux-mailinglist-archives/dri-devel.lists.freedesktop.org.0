Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1FF5E654D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563CD10EB85;
	Thu, 22 Sep 2022 14:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F60A10EB7D;
 Thu, 22 Sep 2022 14:27:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id CF9842B05B1F;
 Thu, 22 Sep 2022 10:27:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856830; x=
 1663864030; bh=B1g5+PQrjPEH8uZqDM8R+Nwa9E9ZBZ5LKu7vSOSADwE=; b=P
 oUQghVxf8iEO4Pnvztuw+92pyAzV/avpag/lagK/fQhEojRwZSvcDov1ZjNth72d
 Fntjnqo/GbwiKOtUE8iTDjuc+uT4wTO+LOlus18b+zpGUx35rIuLBEXjC9FBZVmc
 gnWZeNmUggWtPyPOIHs3AfP5SATUGFzG3jz9FMPPB/VZa7Y+90ZBZupGRzlnaFbm
 Qfp/5YIWy5tEK/SkZSmGLhlUBkx99IkqQtVMf7O1eKnU2Adu4XXub5AlOgy5y9+w
 V3O6kYvDrMtK2Vnx4xR6wvDfVX+/Njk9eQBDPtXpzqbgzxCtgiwLtUPNAsCA+tVv
 wU8hfzV6qmTlhoctnmmWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856830; x=
 1663864030; bh=B1g5+PQrjPEH8uZqDM8R+Nwa9E9ZBZ5LKu7vSOSADwE=; b=X
 c3fH45kjqTiIPx29b4R6VbXjmBmPDzOFxBr+UZNTIWJVgC0E/seJh6pwQepQP/k3
 nZVSXL8avvn4nZu/fAO1Ov5aeysBi24EjKrOtitQb+7lMKM93cZYqOXtcUFrKBC1
 v8MEDH80f1nQmEOt4XfTRJ9VCGn9hb+ybj55v3bD9PkGAwaitxxfi3lUTEUa9gfy
 fXEcvihhs5V1LSg09yEbN9dsQLsSZtd5QjRoEDEK5oIzHDfZONw/ZpNofMDk1cNR
 zvQlF+ZRlXd5kfzKkNJm2V26vzdDNAG4fZv5a9kwk18a+bUyibgTjWP64ygqeqfs
 C9bqH+Hr2Ydaai1eFhZIw==
X-ME-Sender: <xms:vnAsY3LZ5qOnde1YcxBriJDInUod6bZmx0n4FLK3pp9RdIbkfowSIw>
 <xme:vnAsY7Idtcl4paIYRJvqm0R9962EmKvulVhTUJvJRPWFHeCL9qtysctBrVO_jlzqd
 9n5QRUMoiymmRWmRgU>
X-ME-Received: <xmr:vnAsY_voQ04cW1OgZoqnu8xjk62B6xyauZRA96zMSgCYsyXsF6fJ76JIj2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vnAsYwYhgwwTGNyqoGucif_oaNI72YRxI3IxRieQhEel-1rPrJ6UIA>
 <xmx:vnAsY-Y3TAW8TksZUphmwjHTjvpZ6-VokecMK2oHqqCDdtOaBzQ1Cg>
 <xmx:vnAsY0ANmzjZ7hH3W8eydQiZyS3JLtSyJYcJbcCkxhM42sWLh8rt0A>
 <xmx:vnAsY_F58zk8LoR1yiRGI8IgQGs1Z55ip1MT9bHyJlVyZL3aWu4TCjWWvls>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:27:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:31 +0200
Subject: [PATCH v2 14/33] drm/modes: Move named modes parsing to a separate
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-14-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2608; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=u2O3q2buX2U/Iv2bkD92AxW39Mh2ouzixRSVhxjJb+I=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQEHGj6dM/sj4PojP2vjtjP6zTmlcpWuE00uS6t+lU+U
 WXKho5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNZ1M3w37P8CftnntdcUV6PLL1mvm
 9ftMzD+mm+1N2U1uUxZaG3JBkZtnB/CV9osDAsKfSVzsP8L4F9GsIbq2dvi/5h+WfL/r50NgA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current construction of the named mode parsing doesn't allow to extend
it easily. Let's move it to a separate function so we can add more
parameters and modes.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index a1964e08c38f..b1e800e4ed60 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2229,6 +2229,32 @@ static const char * const drm_named_modes_whitelist[] = {
 	"PAL",
 };
 
+static int drm_mode_parse_cmdline_named_mode(const char *name,
+					     unsigned int name_end,
+					     struct drm_cmdline_mode *cmdline_mode)
+{
+	unsigned int i;
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
@@ -2265,7 +2291,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 	const char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
 	const char *options_ptr = NULL;
 	char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
-	int i, len, ret;
+	int len, ret;
 
 	memset(mode, 0, sizeof(*mode));
 	mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
@@ -2306,17 +2332,19 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
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
b4 0.10.0
