Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D3C925A35
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E163C10E78F;
	Wed,  3 Jul 2024 10:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="BlPGfyy4";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="k6LstXKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBE010E791
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:55:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.nyi.internal (Postfix) with ESMTP id CD8C61380623;
 Wed,  3 Jul 2024 06:55:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 03 Jul 2024 06:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720004133; x=
 1720090533; bh=o3qVQfKQ/XHL+ZVO+DX1YbTnMylMpiQelndBdWLa+sI=; b=B
 lPGfyy4ZoX8GowuXA5dD0Lk5ksLAIRgtfwWxR0wSOcnloBJ8oNfuPwF7Wmzh3iBr
 T1UdEt1yR1Hlvq5I+JzXB3B8f87xdqgqEmGuTxKcSNgKzSJbmdbAjnPYu1ztv2HX
 Hj7e91bZ55Z8H2RlBeTfi16xOMsE4AeRcjgmwxDYuw+gjyPfx+L91Zj5KjsMuas6
 JwfAu3xOBpHrwGIxhH/JJ0xXUcbx9jb5k+fGJ7GreDXVrHXW6EOehY55M3LZs76+
 mDBpTTRYiTS80DIyTxjDcm5FBEEmgz8w9N8b0vFchhQs3A1BuXNa+zIwhDYq7ts6
 yAFVUZPLZ8d11DvLXWNyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004133; x=
 1720090533; bh=o3qVQfKQ/XHL+ZVO+DX1YbTnMylMpiQelndBdWLa+sI=; b=k
 6LstXKU4Uyn5ehXICrxT85I656gdgUrubHwuZqOp4WP/TCkZXlewHZQOWGxaIf69
 cmkQXuJQfcqtVlwoz5DZXX0Sf+z37uTiP31dhU40KkaILIKerQGyGXoPDzyM7Arx
 W7F8t8uELjOi9UJypSJ76AH6O3NufmrsWwd7gAdgZBz+Ov+bI6iP7kcLV/4qJaRw
 PCHkFIlt4rRPvaCMNFgWVIh/ZNZ3wb7fwIDjPANy4ei9yQWZYJixhmsDV/dAdbEt
 k/Urr2OIy6+JKqZ+jvt9tlR7wus5EsI5e5AonwVfPKe+PZBwslPHfrr3eUvZkJCD
 48CKSs1xeRdW1cd2L+GMA==
X-ME-Sender: <xms:JS6FZkzzx4kGiMiD3b4zZPQ4ByXJoERhyNN8m1J52nAMK6uW2YBEOA>
 <xme:JS6FZoT7vsi8AyF5M-MPNLjq1QIKnWQrgEpgM80CFM_t0CbAWI2MpIJIFL2FwyKoU
 Ny1zClglM0jiOKaxQ>
X-ME-Received: <xmr:JS6FZmUHWlyuR27IgkGv8mRGfjTMjaHtyPBMX0YagA2ou6kj2ICTm-hhoqJh6Z8mzSESA4CJQ-WtQUmhe6g49A033GBgtZyX1Lxc6QhH3Sdxrvd1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:JS6FZihQ-eAHvDSK2hYQrF3GFEavWjgQ8SZu58km5OT22wAsxsiMLg>
 <xmx:JS6FZmDVTplDlnSZz7DG8Ds3SeiA2lnS3IIYULGw0OhPtnDzZvRtdQ>
 <xmx:JS6FZjK2q4_7vbSW0qKad792WqOVz_HOeez7jGUuSXBesuaJBxygsA>
 <xmx:JS6FZtAQgzYjakcLn7ajq4ddfotgjL3u95N6cq8_lRklF3_ziarwBg>
 <xmx:JS6FZoyjFM53X13NHynRX1V941zF4Z0IniiqZXFFkRO9d3P14CsN7ZIJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:55:27 -0400 (EDT)
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
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 03/23] drm: sun4i: de2/de3: call csc setup also for UI layer
Date: Wed,  3 Jul 2024 22:50:53 +1200
Message-ID: <20240703105454.41254-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
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
index 0dcbc0866ae82..68d955c63b05b 100644
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
index ca75ca0835a63..884abe3cf773a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
@@ -184,6 +185,11 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
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
2.45.2

