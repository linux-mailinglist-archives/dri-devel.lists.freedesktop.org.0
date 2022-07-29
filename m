Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF45853C7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FB110E64C;
	Fri, 29 Jul 2022 16:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D13810EE19
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 92AB1580940;
 Fri, 29 Jul 2022 12:36:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 29 Jul 2022 12:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112563; x=
 1659119763; bh=e8w96O80jWmpbrCBw3kEkho0/4LLDZdkQsICNURykFA=; b=Q
 nXF2tg/gQ3dK6BjE4qA2oH11e4jGyvmEpFUrjG5UdYRskaBHQFrJKfIvuePSNcTe
 a5Pshnm2g9vxd1lUmWYK9xh58xFgOzqiQvoVB4lcbJy++00kxdbuNVCM+BAdlDUt
 0t6mZLuYplbVVk3Koif/MQAwjhFH6J0OzCepa9iz59aU4t/FeNppHIwrbxhdrh38
 Yxn5wJh+a0vlMsXK18U0zpo0aogCW2C/H7VnrD2OOgfhNtuB5mF9zkne5Tj2pJ6G
 Sm4ohwmmyHVPAg5NXRe/XuVgrexFasfjDdkP5wV52mkAOF3xClomdDo3zyqWUXW6
 yz/RRQ/tKzbCMxk5dHvWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112563; x=
 1659119763; bh=e8w96O80jWmpbrCBw3kEkho0/4LLDZdkQsICNURykFA=; b=F
 tWdbMbwd8gGLz7Pgfb8eYqdd73EAP0ttC5XD+SSbs2AVxnza5/jbd4e0JD+OrZpM
 6d3wubHYvGeqJjfI3rvCDI4rpO/e5zvX3888iAaY+UgsWStaTdjX3v0u7aLWPCIw
 0mfBcd9fHF08UeFnzWntUeRTng0wwfDjnqDpL2uc67GUe6IW5Qm90Mgu/CzfPhSa
 JFmlKqZjAPFXxssHue06CCjoLqyskdcpGGqDsAf7DDrmUYWRCgsAKj5YlKxrOnBf
 gg2KN7Hg30Ivf4Fm/LqzlQSDg1AXg6qDfVdyS0mFcIBS9/qiS9oYzq6s5OUxrU2x
 GGoZHOQaHUL0etfAa5eHw==
X-ME-Sender: <xms:cwzkYtUh_sucbcxeqmDTCbveRxbhJiOfj0aR61JInJ25lBDMyVAqXA>
 <xme:cwzkYtnh61u867QSxzM8DXGZBSRET4ersZWUKzxG_uXzOiJ8iBbF46ch7Tbe19__1
 uVQoro0PFWpADqFbjE>
X-ME-Received: <xmr:cwzkYpZ3xGnobEdUAQOyEb6ht31Pnb6XCpUZ85Z_CzE12w49Om5EMqRlVbSAULZHAjbIqbaTVdvEyXQUPdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cwzkYgUbQyNxw6siDLaaM45nVkv8G5hbhjHp1iJlkl5__ZcNNt99Aw>
 <xmx:cwzkYnnDuMjedRRcg0CJz-gu6pUvWu1130Omvd-sR97XsccAFGyhIw>
 <xmx:cwzkYteMvBhHPqKqRpZ0BtIXuowijmNEjUVZ-HeDnD_epkXOjU6DDw>
 <xmx:cwzkYr3cHP82AOz0OVoZp4DeNyzw-4dzH37RimerQgGDkVHpSFpTDg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:02 -0400 (EDT)
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
Subject: [PATCH v1 10/35] drm/modes: Switch to named mode descriptors
Date: Fri, 29 Jul 2022 18:34:53 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-10-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=7XZdQfRWjHdAHz8+TLk9cQGA52WaqvFzAKH3QklOSko=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFScrT42N+ncm6dRG94xZ5Me7OwhzZJ3uduiUSph7zS
 FNrfUcrCIMzBICumyHJd8K0dX1iUWwTPh80wc1iZQIYwcHEKwET8PzIy/GypzfGVftPbOW3Z8+bNm4
 s1J13O9fNZefvp8qvRub139RgZ9tawG7J2PrtYzTrV0V5P5+EP3t/LPx4oZ6g48b7oybecVQA=
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

The current named mode parsing relies only the mode name, and doesn't allow
to specify any other parameter.

Let's convert that string list to an array of a custom structure that will
hold the name and some additional parameters in the future.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index e85099df0326..1421e5da49e0 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1768,9 +1768,13 @@ static int drm_mode_parse_cmdline_options(const char *str,
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
 
 static bool drm_mode_parse_cmdline_named_mode(const char *name,
@@ -1779,14 +1783,15 @@ static bool drm_mode_parse_cmdline_named_mode(const char *name,
 {
 	unsigned int i;
 
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
 
 		return true;

-- 
b4 0.10.0-dev-49460
