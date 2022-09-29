Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A0A5EFAAE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FA110EADA;
	Thu, 29 Sep 2022 16:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CC410EAE7;
 Thu, 29 Sep 2022 16:31:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 035E85807D7;
 Thu, 29 Sep 2022 12:31:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 29 Sep 2022 12:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469106; x=
 1664476306; bh=k4mI+P2Uyj6hcgKCV+eHrMM/leiBXfvlbKoa1CrN44E=; b=r
 v8HLpPacc/kJsaJrsMdtTJ+RC9XcTpetlFfs51P0ZZyF6GWrSiMYA9ne7PujaNox
 eaf7O/QBRqWHhg781G/aw1U5UlKILsFUye/Lb+7F1MjoBVXIQpyuMMHO2Le3Uyf8
 0XLxu12LBrydayWXa6zVRpQ95gVssLldYW/G55JwHRKJLonoWpkrKKB9x/IrBgL9
 zGKvzZp2mjQqRE0Q5hdYEqr0/a1ywdDhWFhnOagJgn3XnUS4U5T9q0IvbnY1Q96X
 9hzhjsdk+dJHs/rp1JHgd7m8heUAhZdbcr0105Hf6QMqD+v6eQ39sKXct1W/bBE7
 zGLgmrFq7INTiihhzqtkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469106; x=
 1664476306; bh=k4mI+P2Uyj6hcgKCV+eHrMM/leiBXfvlbKoa1CrN44E=; b=f
 F1n5oXC2pu4DHi80PfZ2+35ln1aKVdr+f9CTzx8QkCeNuFdP7poi76+wMnv9qANb
 7DLTzIdyZxy4jcIu8ok6P8WWZLdZ10rhNYTeeepTDap1G/gpNO46ZN6zU2GE5/hq
 B/G4ehIKvqZ1Yn5BZw6Sz8UwkLsXlOAXMQ7l4T7qdZ49XVLvr3NdAWZ2disCmBDu
 QMBZgJ/XYsRkPg/UHZq8vy1TI4rIdKiO4EzO+Iv5IAgZcD7HXyunC2LQ8MUQO3rk
 BqiAqzItphD9XV2fpLFaejRseRBF961b9Zy37kBx4qeNATauiSmFtpq32qYJc53h
 ubY1hJGGbxNG4MkcQuGyA==
X-ME-Sender: <xms:ccg1Y2ZatXz2kdI1Z-InntWkrrLZF2DlEG-4NOD1_5NG5Ua9x7oaQQ>
 <xme:ccg1Y5Y9bRqSIByRG_YwvCB4YivJqtVppJ0lD3JOcUsGSZlKqNavLcTgcM8X91tUz
 VdDOCB5OElC4sorqcg>
X-ME-Received: <xmr:ccg1Yw9VgDeFDoNCmowkxrJt7ZKVB2e8wP5ytS7Ysqfyh3lCNPCyFdP7hlBl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ccg1Y4odx557iC0xl0XE08Dv18Y2OYfjrI-mWRykXOOUbGvL2mYFMA>
 <xmx:ccg1YxpUzaJvdEm6ahvIzvK_RByy-29KvmkcTVmIpMqn9BMCkTh0wA>
 <xmx:ccg1Y2TH2l87TOiCKC_5buDeLGjljR1V1zRd-lN1F5oNLSz4lCYUVg>
 <xmx:csg1Y0VNjahebxd2XQNVUEca7q--RNd9H1gpScILjWkN6h2mHZkgYA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:10 +0200
Subject: [PATCH v4 16/30] drm/modes: Switch to named mode descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-16-60d38873f782@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=59DgDb/G3ltKD7zwB3OQQJ/5jkTCTY8o4hInxsXZAc0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9wPtlQ5b23kFWefcm/5vMJe3geruF7Nt3uWolLT+tj8
 wKbmjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkjofhv8/kj5wzDnzjuX/yuWku+1
 F1ju71n7x1cs6c+MbnZSL4ahMjw9SWY1tLp7o7db5Ku6rgkf5Awe7ijhWup2a+fPXMa5NnMC8A
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

The current named mode parsing relies only the mode name, and doesn't allow
to specify any other parameter.

Let's convert that string list to an array of a custom structure that will
hold the name and some additional parameters in the future.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_modes.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 2f020ef2ddf2..7ed3fb839db7 100644
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
@@ -2262,14 +2266,15 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 	 * We're sure we're a named mode at that point, iterate over the
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
b4 0.11.0-dev-7da52
