Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D02BAE8A53
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3349010E785;
	Wed, 25 Jun 2025 16:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QuxfdDHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22B210E781
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 16:46:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAB394437D;
 Wed, 25 Jun 2025 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750869961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3a1Rzdc1h479uhkmsSChL9Bs/Oz8Co/C/4PMlEqNa3g=;
 b=QuxfdDHqgPHRizJVH+3oQCXlpbMy5eywPhI4Ozl0lF2js/0GOMfrMlciMa9NtNXRr+Z7q4
 xKrFtXj2Ag38H5ZlAEBRb4xEwj2bgrO6sxsu8+UtJMqPCKiTA/nwJFcJPJn1AadfkfNpbi
 rLq3koLgDr8H37S0vvYMOAIAsG9Po5vPVlh9+NFgxiTP3wR7VrvF/f9kabpvxhkfAnn0r3
 oXPaYfeZithCwipFBKdm9GAELB2719Fo1q/cK0JnMpgL2dS6DMIuQQNUqz1oOK9L4k/uVq
 ryeSwMfcroju3yYq8torzkFLB/Tfo97r5NlbMxXtNyDvXzwrXV5SOHo1BdVuGw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:17 +0200
Subject: [PATCH 13/32] drm/mipi-dsi: move format define above
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-13-e36bc258a7c5@bootlin.com>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
 dhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

In preparation for adding a new struct using them, but visible to the
struct mipi_dsi_host_ops declaration, move them above such declaration.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_mipi_dsi.h | 76 +++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..e42483fd022fed4dfc9e5ef180117c3dd37a3b51 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -64,6 +64,44 @@ struct mipi_dsi_packet {
 int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
 			   const struct mipi_dsi_msg *msg);
 
+/* DSI mode flags */
+
+/* video mode */
+#define MIPI_DSI_MODE_VIDEO		BIT(0)
+/* video burst mode */
+#define MIPI_DSI_MODE_VIDEO_BURST	BIT(1)
+/* video pulse mode */
+#define MIPI_DSI_MODE_VIDEO_SYNC_PULSE	BIT(2)
+/* enable auto vertical count mode */
+#define MIPI_DSI_MODE_VIDEO_AUTO_VERT	BIT(3)
+/* enable hsync-end packets in vsync-pulse and v-porch area */
+#define MIPI_DSI_MODE_VIDEO_HSE		BIT(4)
+/* disable hfront-porch area */
+#define MIPI_DSI_MODE_VIDEO_NO_HFP	BIT(5)
+/* disable hback-porch area */
+#define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
+/* disable hsync-active area */
+#define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
+/* flush display FIFO on vsync pulse */
+#define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
+/* disable EoT packets in HS mode */
+#define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
+/* device supports non-continuous clock behavior (DSI spec 5.6.1) */
+#define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
+/* transmit data in low power */
+#define MIPI_DSI_MODE_LPM		BIT(11)
+/* transmit data ending at the same time for all lanes within one hsync */
+#define MIPI_DSI_HS_PKT_END_ALIGNED	BIT(12)
+
+enum mipi_dsi_pixel_format {
+	MIPI_DSI_FMT_RGB888,
+	MIPI_DSI_FMT_RGB666,
+	MIPI_DSI_FMT_RGB666_PACKED,
+	MIPI_DSI_FMT_RGB565,
+};
+
+#define DSI_DEV_NAME_SIZE		20
+
 /**
  * struct mipi_dsi_host_ops - DSI bus operations
  * @attach: attach DSI device to DSI host
@@ -112,44 +150,6 @@ int mipi_dsi_host_register(struct mipi_dsi_host *host);
 void mipi_dsi_host_unregister(struct mipi_dsi_host *host);
 struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
 
-/* DSI mode flags */
-
-/* video mode */
-#define MIPI_DSI_MODE_VIDEO		BIT(0)
-/* video burst mode */
-#define MIPI_DSI_MODE_VIDEO_BURST	BIT(1)
-/* video pulse mode */
-#define MIPI_DSI_MODE_VIDEO_SYNC_PULSE	BIT(2)
-/* enable auto vertical count mode */
-#define MIPI_DSI_MODE_VIDEO_AUTO_VERT	BIT(3)
-/* enable hsync-end packets in vsync-pulse and v-porch area */
-#define MIPI_DSI_MODE_VIDEO_HSE		BIT(4)
-/* disable hfront-porch area */
-#define MIPI_DSI_MODE_VIDEO_NO_HFP	BIT(5)
-/* disable hback-porch area */
-#define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
-/* disable hsync-active area */
-#define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
-/* flush display FIFO on vsync pulse */
-#define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
-/* disable EoT packets in HS mode */
-#define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
-/* device supports non-continuous clock behavior (DSI spec 5.6.1) */
-#define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
-/* transmit data in low power */
-#define MIPI_DSI_MODE_LPM		BIT(11)
-/* transmit data ending at the same time for all lanes within one hsync */
-#define MIPI_DSI_HS_PKT_END_ALIGNED	BIT(12)
-
-enum mipi_dsi_pixel_format {
-	MIPI_DSI_FMT_RGB888,
-	MIPI_DSI_FMT_RGB666,
-	MIPI_DSI_FMT_RGB666_PACKED,
-	MIPI_DSI_FMT_RGB565,
-};
-
-#define DSI_DEV_NAME_SIZE		20
-
 /**
  * struct mipi_dsi_device_info - template for creating a mipi_dsi_device
  * @type: DSI peripheral chip type

-- 
2.49.0

