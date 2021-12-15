Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC1547557F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D0989A67;
	Wed, 15 Dec 2021 09:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABC610E270
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:51:29 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 277805801B1;
 Wed, 15 Dec 2021 04:51:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 15 Dec 2021 04:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=RqIRL4ZPwU58/
 g8eCUp1MElSyGBaUDT1H6iHs1T1CnU=; b=DthYzW41gxuezgmP8bR68niFtK23u
 Xo5qYUwb2azfKA4PKGDQp9ru1qgHW+KvtGevtHXFLtl4vIEAlVq36yEHflMMp9rB
 JpXFyV5Dy+d6mgfHGBOzvGWm43JttmQbEiad402sBgTenA2nkf6IiJZJ2ffTQ+Xa
 TLDPT+GQzAephZ8wKzlIcTbJlX+BO+iu7Mho7pWxCbY+VbB6hM1aAxr5jH7LSsUz
 iZcH3Ph+lB/x9QNLGFve0QMp9OyWN0xABKatpQYef+4Ui70JvWvYZMUKKLNPMN1A
 odMxlksIaAdbwolLgCcQWiu88F4/ukW6HfOTLHQGpovmA5iRA825h2Fvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=RqIRL4ZPwU58/g8eCUp1MElSyGBaUDT1H6iHs1T1CnU=; b=WDNYokl9
 myWPIokTCQs1+nPxyNh7ouYOn0iwVukw/LjTC688oItXe2hzvynXwCd/hmK4IyQD
 t1MttDD/LGJocBAXYb6KZhTzBA2iIDbMLSRDbSX2s5kT6U0QhYEidXZ1/ahoMt5S
 RV64UJfu3As3N/pe7VBLoVEQPDgMgH3l2QPM0Eaul21vpQqIrkCMQ6sVfgsWJ4Bc
 isSQZhqhmjuaBfaaUuRCre79N+wvY3JaBnwb+AYeIQlOFMJXPy9SqkaH3lQqp5tq
 vNP3CdHllM4QFfP/OiGuo6yeZv+DuN4BkGD83wK4tS5+fP/RN0QxvMtSwJ6ipwxv
 NAxRiU8/b/FigA==
X-ME-Sender: <xms:oLq5YdWxTaixI0CT8UrMHRC66O3a3qH9MV1t_x_vshzRh9_QBeqU7w>
 <xme:oLq5YdkxLGWhDg42zFUHHZuExvgiGuf_I12f5jbjePU6or63FQZMIaoOPFGmKYdQO
 ek29ACQuFtyAEnaMyQ>
X-ME-Received: <xmr:oLq5YZaHBuK9Zy5BcXSm_oTdPryP0dCuLPD-bE8prFFUjajIhJ7zjc70v4BlzPctd8gtLD2gjMvN9RA5SCLvoe8yd4j094inWHV0D4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:obq5YQXrw3Gg8uPYYM6Brv9nYNrTZEVoFglj5zx82_jejCB0KqIVYQ>
 <xmx:obq5YXlTcbAhRYIyGGc0oKBcTITvMvuOqogi-yw19D-p7TBz1fXoqw>
 <xmx:obq5YdfcsVO3mDmeF0GyrWT3y-DNgnYLIL7eYJfkZRL4ZHT6CGX2Og>
 <xmx:obq5YWfBdPo3xrO2bPCYkFpHoe-8jx94NJTBSeJZm6TqRkR8L4R-6A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 04:51:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH RESEND v4 v5 4/4] drm/vc4: Notify the firmware when DRM is in
 charge
Date: Wed, 15 Dec 2021 10:51:17 +0100
Message-Id: <20211215095117.176435-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215095117.176435-1-maxime@cerno.tech>
References: <20211215095117.176435-1-maxime@cerno.tech>
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
index 86c61ee120b7..a03053c8e22c 100644
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

