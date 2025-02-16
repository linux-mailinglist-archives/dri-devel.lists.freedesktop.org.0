Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE336A376A5
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 19:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149E010E241;
	Sun, 16 Feb 2025 18:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="JohbovOm";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="j3bkwhz1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305A7891A3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 18:37:44 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id E488A2540111;
 Sun, 16 Feb 2025 13:37:42 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Sun, 16 Feb 2025 13:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739731062; x=
 1739817462; bh=FL9di+CvqAZswVCEURGPLsHq/4BTefiQImdfVOi0kBA=; b=J
 ohbovOmKR0JJodXr3o6ARQcZu5yOWm/UW/1n0Mbg1ZiHt8e3sAt3mxG4rOKH/Upq
 PcoahRtKbN9BOKSurVvzB64tlfpr8f5NuYGHDT+QKfZFE7h2CysFlGisBtCvRrZu
 aljiM3nAR3VK3kspvmwdvxQ2AyeP2lNg7pLNPuGs/O74je1uRUaUEvcghrFabdfv
 zpSNmP1exrH4wOztup8CVAi8lg8quXMhgAgOr3bVGfczJYEFJcy0e6xxP5bVMW0v
 xCr4/R4WbK4lu+kh7FT00HeSuhAyjrXruvJBBOYBfP1Ic2uMq4UV3SD9qIbhr9Tp
 w12dETHlzfJQLSa+voNkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739731062; x=1739817462; bh=F
 L9di+CvqAZswVCEURGPLsHq/4BTefiQImdfVOi0kBA=; b=j3bkwhz1oLMQEbobB
 7KRPgxJWS0aIQ2oW1mGlUl8Q/c61yIUtYt0RyZjPWL4pMAarCeHeJNJ/RGpOBM+Z
 77+AlvINA7Zia2yjbaryP4FXdKPjKZhiSFMKWdZaTptWURx6nnXes+fwK84KLGMi
 8nAhmO8yLv1RNuus91S7AZgbq7JSffjTuFYVWl8WjqJDxVZZHmeysPOWmJ6awkes
 sOdV7p4IhHb7YKnFQ+OsDlw56rjQ23bu9IJBOxSBwHMcZgRmya+NBGgNNJQdvvQI
 j4phHJzIxh+aWnUWoecN6O6pAXyF/VzuxwAViQK5jZurFPYr9XNKtcAD3MFknXLZ
 YpEvA==
X-ME-Sender: <xms:djCyZ_KSJXFnCdqF_Zjer6s90zGOZNfspdoobxxODJBDIsju9F4yaQ>
 <xme:djCyZzIZE4pc6kDa_Hu3Hqc8rR9wicGEok8r4-aFMO09rsYPkUNO_GV3RIGHohJ7J
 fIXlZBZi1KFUC81wA>
X-ME-Received: <xmr:djCyZ3v-PIBEwF3-uQX9enzJDzHjTCkSrsYSHZK-MnpX5EtpOhPxquO1pZUCVuwMrLfSKcg5B-eTxDEE1eyQ2MHioAgnDwMmTqtvL3c_N85p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:djCyZ4ZI4u5GkKNLZowuGoF5MFarkX57G3YCRU3GTnpdEh1wISo0TA>
 <xmx:djCyZ2YJTU9JwcdVonfyRL8iw0mEkpSPp16dMa9YBa6jvAIS1UsHpA>
 <xmx:djCyZ8BALZmr9XGCCZ1HoCKOHZPUTR9Uwj5im5aoNPfyqGmAWPpPOw>
 <xmx:djCyZ0ajDoSROdM4QOgmlTscZ0VDvXdPw7BjBCTtL4MnLWkOzaseXg>
 <xmx:djCyZyK6Y1AKYClETKj_GPpm0GB8I_e2Dm5FZqkSDE-MPHXV1iFaVKTd>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:37:36 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v7 03/27] drm: sun4i: de2/de3: call csc setup also for UI layer
Date: Mon, 17 Feb 2025 07:36:03 +1300
Message-ID: <20250216183710.8443-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Currently, only VI layer calls CSC setup function. This comes from DE2
limitation, which doesn't have CSC unit for UI layers. However, DE3 has
separate CSC units for each layer. This allows display pipeline to make
output signal in different color spaces. To support both use cases, add
a call to CSC setup function also in UI layer code. For DE2, this will
be a no-op, but it will allow DE3 to output signal in multiple formats.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 8 +++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 6 ++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 5606912f92de5..558f7a4c1354e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -209,8 +209,10 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 		return;
 	}
 
-	base = ccsc_base[mixer->cfg->ccsc][layer];
+	if (layer < mixer->cfg->vi_num) {
+		base = ccsc_base[mixer->cfg->ccsc][layer];
 
-	sun8i_csc_setup(mixer->engine.regs, base,
-			fmt_type, encoding, range);
+		sun8i_csc_setup(mixer->engine.regs, base,
+				fmt_type, encoding, range);
+	}
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index b90e5edef4e88..aa987bca1dbb9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
@@ -135,6 +136,11 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
 
+	/* Note: encoding and range arguments are ignored for RGB */
+	sun8i_csc_set_ccsc(mixer, channel, FORMAT_TYPE_RGB,
+			   DRM_COLOR_YCBCR_BT601,
+			   DRM_COLOR_YCBCR_FULL_RANGE);
+
 	return 0;
 }
 
-- 
2.48.1

