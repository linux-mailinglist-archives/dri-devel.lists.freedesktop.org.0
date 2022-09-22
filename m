Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A395E6560
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1852510EB9E;
	Thu, 22 Sep 2022 14:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5880410EB91;
 Thu, 22 Sep 2022 14:27:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 0C72E2B05B31;
 Thu, 22 Sep 2022 10:27:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856867; x=
 1663864067; bh=6jzwlHXRKIyndP+lXIzt3Yajs+mMskqMIyYzuX3/ETo=; b=3
 rc9Y6M4VcaUa9oTKUDa98p2Tz57bk6UXGVPlSW9oNm9SOsde3XnA2r7T9qwa/ryb
 K+UJEOAzPS8W99+oFUDBwlHJQOfXcJJQ3CoxUMp4M5n/21g9EGjgAxHxZg6ivCMW
 p+1ZQNXoqrzqnlkIhPtzzseew4RybzT0r5y6doReHQYJPKbo39hXfEOfOpcegA7B
 fW+tZE7vHLssUDxcYVvn+YKhuw+wL49vIdk8HhI86S4eMPrdjJJxKjrvKQHM1ttm
 CTkdnWWTGp81f2c741J8Ya5hnFrbc+yl9UrNJD9qC6nH9fYfkv3HuNiTIdWgFsRA
 clj5wDEE3zotEqfjbLYUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856867; x=
 1663864067; bh=6jzwlHXRKIyndP+lXIzt3Yajs+mMskqMIyYzuX3/ETo=; b=f
 ypF9vRSDT+YVhSsnOwVtIBWKhwUs4s8TBuV6SUJ0tvd6CF5TE8QGqFN9rr63iCFJ
 6rpgLofGUBi39e/+xoeBAMpi1OPByGEXn4U3lrxawLmlMisOJktDZ81DgifUTXVW
 NRvDrCZsiGHSXUGqPheMCQwKZ8DloWHFMx8AcXE2Lri4b1N9YhyUvM9l4Ys3WEBE
 jxKs04OIrxj6/AphSWpM+pq/EuV5TWP8Fcnjo94/JDQBidauBlUvyeMHwxBmj7gU
 aFrEjUkwW+34NzCZFLdKhNrJm6FCsotYFBMcx5VmxVWXriorqNa1nGwgwPr2AvbQ
 /xZy/YERpU3OK+HvaQGFA==
X-ME-Sender: <xms:43AsYzYGd3cTfZfBSnxJoqw2ptJ6Cu33gK0-ju8HuLLK2_ygGFRkQg>
 <xme:43AsYyZFAKOv7_GZqlm7He9hVmDeBmmfDtiLf7DqCV5KFAN9qbkdKen2t12IIKF9C
 vvKlhH8M1roz87SIy4>
X-ME-Received: <xmr:43AsY1_tpU_X_EhMIxBQxNY1nR6oG4AI38FjDavj5L_YvvTXoFRPo6BtYJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:43AsY5rXYHfSXNizL2iPlVcblxONdHwLJioulkFN0IIl1xQI_xEGjA>
 <xmx:43AsY-rsK2DkcfUUfqhjTu-6xb6S6Nou5Wg3gRPnn83TsqI0ZbaNbQ>
 <xmx:43AsY_S3LD4iCIX-b6wFkLItv57i38Ap_9yUnOTV33HWbRILpujb_w>
 <xmx:43AsY5UC0wmpkWpzput8vQlc-gmBBxwptnZGVDrkQaSmXGRW92QtkJZBsSc>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:27:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:36 +0200
Subject: [PATCH v2 19/33] drm/modes: Switch to named mode descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-19-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ak4bdagFeC60CdYLI9q4vEZkdpDO1FK48fEhtSFByyY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYGbFz1iPeo843W50lt+pagbitN0ctwkExet7RLXakh7
 7fOro5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNRXszI8JzLoq3P9v5POUG18/FNL6
 +/Sda7VPL0vpBtwdRaVnfjBIb/TknZa/ZLd3dx333Ff4pF4Ynbsn2vKqK2KxhGPd6yQoifCQA=
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

The current named mode parsing relies only the mode name, and doesn't allow
to specify any other parameter.

Let's convert that string list to an array of a custom structure that will
hold the name and some additional parameters in the future.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 9cee0ad806b8..8c8b37ba37dc 100644
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
b4 0.10.0
