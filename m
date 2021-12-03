Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D1D4678DE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 14:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F38C7ADCB;
	Fri,  3 Dec 2021 13:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CBA7ADCA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 13:51:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id ADE725800F0;
 Fri,  3 Dec 2021 08:51:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 03 Dec 2021 08:51:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=HOi4Gz1hW38Xl
 SjSMQhvunvdi3R7X8A7uhXWityqRXw=; b=QuZxfjfDAuBHCw/qGhRC4wgLfWeav
 qPT8KIWs+o2yHgHfamUqT+UCa1LzxdvVHvdXEXnNytGaOi/CQW+b6t80sDiu5aEU
 iHbt/ITVLyfB+e/gavtofrlgAWVYCTYQyY7LcBLEufecbKfgu2ViTpalEYv4Q/LG
 q5/c9ZwYOguWNkmENK/XlUSTX9PkirZG6h4ZG9Z7ear0dIQ6ulVmu8oW0hbRrWu0
 M/nFMZGC4kEWA7f245TA2l9Tt9MNiUvCRO0H23yuAlTnM4sddCJ2AZ2GVAAFLDCZ
 zdWQSgMwGzq0gQq6HIeQI0YT6HZ9Bvuy/xpi1c5R+zu1NhjpGbJ8HhOlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HOi4Gz1hW38XlSjSMQhvunvdi3R7X8A7uhXWityqRXw=; b=aNAhwW77
 VFU1zk7cp6ftINRSXZu105qQjpRFURIl6vMwIwyiZL0toUzK+UtU9f57G33iW2MR
 7xQXnwFoLttpdB9tldQs+CqMOQwpIVmAuCkMqvmIKGa5JFY4fc6DybiDLkI1o4E4
 05GqfX7sMx8dQszXs1D2RHc0E4+eOwgrIH95yWolLzzuprzBbBXyXzs1SfXzqJTJ
 VxU5HPxETeL+nwcGSoiqV06y0UtBw3GgMvpIe7q2gN53PMSd6ej+AUUo4X2b/mPG
 OZ8sjzuokr9kkDyuo2wai20TU6PFihHbGCoF3/BPCuAFFgU5HpQ8ycbFp0hrl6m2
 o3OqBU54cIiFCQ==
X-ME-Sender: <xms:6CCqYYk8e8-1DYBuBf6B52i06QdpY00tdFXAaMsPzB5A5A9QPPe01w>
 <xme:6CCqYX34HfSl3AzcpJyIcwKuY5ofmXQvrUB4lB-PQ2rWFDR8CZdTW-hkSk8nRMyEZ
 kT9CtZM8L9UWpbyVq8>
X-ME-Received: <xmr:6CCqYWpzn06GEoGEbyyeQBChZ5hNE1P_wXyED0NRyOMuKknsNMMyCnRPchIquZnmvQKOY2vqbE8oymwuon4DtfC5YpIlusbI4M4gC7vU4GmvyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6CCqYUnMMFJO10MNh0Jjp-iYfxScE1b0ZwdC7PcD_0MCtABSzGdj3A>
 <xmx:6CCqYW1V4LPUBItwRB6TGyKmHCFgmTRbjHA9SffLwbMqWhYymdOyww>
 <xmx:6CCqYbvppuoFCyPCeE3f2ZuN6zc8tPK-1tbRCA3Dr2Lsk_E3iwj5Ug>
 <xmx:6CCqYduS2tz7v5Vbdd6Tlzt_VVgV_8B3MDQMAfElvOfNrdOUh5-kKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 08:51:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 3/3] drm/vc4: Notify the firmware when DRM is in charge
Date: Fri,  3 Dec 2021 14:51:26 +0100
Message-Id: <20211203135126.700165-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203135126.700165-1-maxime@cerno.tech>
References: <20211203135126.700165-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_drv.c | 19 +++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_drv.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 8ab89f805826..38d55a47c831 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -37,6 +37,8 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_vblank.h>
 
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
 #include "uapi/drm/vc4_drm.h"
 
 #include "vc4_drv.h"
@@ -251,10 +253,27 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
+	if (node) {
+		vc4->firmware = devm_rpi_firmware_get(dev, node);
+		of_node_put(node);
+
+		if (!vc4->firmware)
+			return -EPROBE_DEFER;
+	}
+
 	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
 	if (ret)
 		return ret;
 
+	if (vc4->firmware) {
+		ret = rpi_firmware_property(vc4->firmware,
+					    RPI_FIRMWARE_NOTIFY_DISPLAY_DONE,
+					    NULL, 0);
+		if (ret)
+			drm_warn(drm, "Couldn't stop firmware display driver: %d\n", ret);
+	}
+
 	ret = component_bind_all(dev, drm);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 4329e09d357c..b840654c53a9 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -76,6 +76,8 @@ struct vc4_dev {
 
 	unsigned int irq;
 
+	struct rpi_firmware *firmware;
+
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
 	struct vc4_dpi *dpi;
-- 
2.33.1

