Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627B61F56E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7F010E343;
	Mon,  7 Nov 2022 14:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D9710E339;
 Mon,  7 Nov 2022 14:17:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id F2BBC2B05E60;
 Mon,  7 Nov 2022 09:17:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 07 Nov 2022 09:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830641; x=
 1667837841; bh=XFfcPdcDhcdk33Fszy3XW5ENw976iYEz+wvYF4u8oEs=; b=A
 l5I+53NvF/3kJYph2+PsxaNTCxRBJhmgu6YvDTiCRlZAn/oxwzm7qWFQbAQjGDp2
 QRJa8tQ1xeEGdpkgTQdDlEiOmApHSwR2Rtr230hwt9JBsL21eqcERmXlSjocOIfO
 FTQHRayxhaQKXJp0KZBQb84jMKCZPrbnxfjB9RAgViIKvwmMJJDtajOIeoJDVZgH
 M9Ce3xaEzugil6eC+Wjz7+d4yxl76Ic10iP68L/nDukJhg3+zyF0bIUSDamv+jw+
 7mIQIfvnUUocSR0rDFzWGsuvitL6PdptzBS9jM4ObWN0rPUGcMDkC+ibGVhTsgCb
 qYXrTTZQxiq2OYZT8Zn5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830641; x=
 1667837841; bh=XFfcPdcDhcdk33Fszy3XW5ENw976iYEz+wvYF4u8oEs=; b=T
 b/9BoGAJxgdYClum5zGkfVrrmDADkJnlHBig+tRw8ooWolZozxgabUpkvfzFn/1v
 PYQpknr1oi1CUNhGPzIzEUNwVJ2fGMXOa8zjwwiRQZRaWHeB2jsuma220rq4zbgH
 kLLlfozrp04z59O6nfznC9zJzUWuy37VOOoBNZqlqYMg59//jkx92MSJMca8Ndvb
 ZWuEeQDsdF3dkmBEdkK6HuxChu8s53yccsPMs2dLzTNVFzssF0eOaK7dhpPZUVcD
 RXnqGbVeailIE3NzjdDyDc0Edz/knRJ9UPBhS9gbK9MtLoeSwTKaug48X0Qan99N
 839zrMrY0IROGa8cTIiFQ==
X-ME-Sender: <xms:cRNpY7ciLfTx6NBdJJhfhJqDwLueZKgSK-NBptrtI4jHdL2M20MKrw>
 <xme:cRNpYxNOEn_2DKQit83vd6Xeeda6Py7vzyyKWw_fv5me15BYvZuvBXHpdwBI5UozF
 BqQV7Oc5sqBpZbfuDE>
X-ME-Received: <xmr:cRNpY0io1Pe0WR8bavjSUKNXRtGw6JK6xXIgzGfcrBPpKRCZeNRvu0aKUvEWLsceSZRSf5wPoGyfT6PRoW8ULyVJMJ0tcMCra0K_xoolM0FA8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cRNpY8_C_2uErSuWxmFVFbg6cU4JmCtIUVWK8VOTF9lW9HgZiSv0lw>
 <xmx:cRNpY3uwAxo8rR9O9-j0X7gVup3Q0lg5XHZkbVzRjDNtfgZ3JGJRFQ>
 <xmx:cRNpY7FCa0DQLljWjCps5vvUGXEM5hiH0AJw73ZpenUayfmF5IxZWA>
 <xmx:cRNpY46TVEA5JFDYv1cxqRT702oNRSPp72MSfb3QhMRPSppEdgaMcynUmNc>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:17:20 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:35 +0100
Subject: [PATCH v7 09/23] drm/modes: Switch to named mode descriptors
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-9-7072a478c6b3@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=LGxFbW1leMxSUo+AXGr7lI8fRey9Y1cyWt8jC4z5gpk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwg7Ox0RzQo8J3Rb8Hnv0wyKBEyZHL22t1IzWZNpiKXmA
 dW5uRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbCIcPIcDr5dKDHC+6j62+Yc85j/l
 l+++f1p+qnyzT0WCYGFn/tVGBkWJQ/q6i1q7Z+u7nOXYk9DSe4/thGHdluvuxdrvrf3S6beAE=
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

The current named mode parsing relies only on the mode name, and doesn't
allow to specify any other parameter.

Let's convert that string list to an array of a custom structure that will
hold the name and some additional parameters in the future.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
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
