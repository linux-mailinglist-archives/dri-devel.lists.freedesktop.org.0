Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D64731B7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8224710E7B0;
	Mon, 13 Dec 2021 16:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6EF10E7D4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:26:46 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3A2335801BE;
 Mon, 13 Dec 2021 11:26:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 13 Dec 2021 11:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=c7km/lvZ5a2iH
 qu7qa5YLTQv7U1pBCi32tVq4pp5uwo=; b=OX4pRvqbucgkVQApIEi5wHXzyDlde
 cf4IvAoI4QqNjyIBsRHf54fAPF4ydWX6zLwyfqHRl2SgoTPnFci7SnSJ2ttzHLkJ
 lIwyfCnQLfSX5atJITJZrBKa333bQwf//sFe4achkXhM3NSuBh6V+yK5yMAPiqZ+
 6BWaw7RpjgyRUJqm/JPbAJoS0zH4W8IeRjP0uOSyLV4JYRrwnX9omqNRXAJoJL1U
 44aS2271zU7uAGhDxhkoCvWuV0U35x+33c1jj8pEAQWzGhN92tmX2Kh4bpbdbTt8
 euRkM8KXpc/CqnVEeh45QPM9Ia+0qjvjwFHF4r8RzYdunGqtRHHxZBylA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=c7km/lvZ5a2iHqu7qa5YLTQv7U1pBCi32tVq4pp5uwo=; b=OdDaXrWg
 hZrh9I3zmJc2ieYE4JGU2+2c9OdaZ7NoPfd2UebbAJt02XpqMgnIbh/t5tHbWWC1
 xFc3BrgZ3zOKn0lLWylWVWVsVxEmpAR1VVKgFe4lbAAFGpHsFm2ybGCj1OiYP9ZS
 0pZoDfHG7h9NVeRmbeL+VTatVfcGyqjEUg7iwPYuXFzFyYJgnxHZ3U6W0w2dJeTC
 ZXfIGUHgkSmfaouavZ0E+Z6IBRhBJf4lbVkpXYmmDk1z9/x9T11hlr1iHQQYtbLP
 lv3RSeKiFLMaPMeackfUBm2h8AVtNRU1ITobvPYHg+FdTYmm/I+D+K2p9mm6i7aV
 h2lOTaOBarN6lw==
X-ME-Sender: <xms:RnS3YeymmvPWV8Jk03fh-rlviJUtvMKuSV_SBIscQaPkoK8aqXqLDw>
 <xme:RnS3YaQ2V3xdtOqWto4PQbX-krjGYbQy69dCULaYNuL2seDQBqy4zZYkI3Ur6dcIl
 Zh350HF5R-LWR1yir0>
X-ME-Received: <xmr:RnS3YQX0ydq4Dio6KUggunQw5riCtN5A6jYCtr4VUXPZW5COsa2-pOPNxcpEHgi04aB8NhVknHnDlV77BNEr2Wl9VcghpusKDWjRl0bV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RnS3YUjQuCgIAudJHq--85ljs1Q3rdvaZlHiYBpm7OoavLgFpmi7Bg>
 <xmx:RnS3YQAjdRD3FB_whqTjXxdsXBKE2-Kox_wEh66uCRXIZxnO8HtO6w>
 <xmx:RnS3YVKDOASdKwDPZcpYJ_a76amjbIoy5fU9WCsX3yYjPQtyVEudtw>
 <xmx:RnS3YY6Cn_dQWKEPwF8tvyw7yGkkBZUQQ25AE_e8KQdpr-LI0jPOBA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:26:45 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Ray Jui <rjui@broadcom.com>
Subject: [PATCH RESEND v4 v4 4/4] drm/vc4: Notify the firmware when DRM is in
 charge
Date: Mon, 13 Dec 2021 17:26:35 +0100
Message-Id: <20211213162635.252582-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213162635.252582-1-maxime@cerno.tech>
References: <20211213162635.252582-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once the call to drm_fb_helper_remove_conflicting_framebuffers() has
been made, simplefb has been unregistered and the KMS driver is entirely
in charge of the display.

Thus, we can notify the firmware it can free whatever resource it was
using to maintain simplefb functional.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c0d7e510694f..e4bb37a191f6 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -37,6 +37,8 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_vblank.h>
 
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
 #include "uapi/drm/vc4_drm.h"
 
 #include "vc4_drv.h"
@@ -215,6 +217,7 @@ static void vc4_match_add_drivers(struct device *dev,
 static int vc4_drm_bind(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct rpi_firmware *firmware = NULL;
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
 	struct device_node *node;
@@ -251,10 +254,29 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
+	if (node) {
+		firmware = rpi_firmware_get(node);
+		of_node_put(node);
+
+		if (!firmware)
+			return -EPROBE_DEFER;
+	}
+
 	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
 	if (ret)
 		return ret;
 
+	if (firmware) {
+		ret = rpi_firmware_property(firmware,
+					    RPI_FIRMWARE_NOTIFY_DISPLAY_DONE,
+					    NULL, 0);
+		if (ret)
+			drm_warn(drm, "Couldn't stop firmware display driver: %d\n", ret);
+
+		rpi_firmware_put(firmware);
+	}
+
 	ret = component_bind_all(dev, drm);
 	if (ret)
 		return ret;
-- 
2.33.1

