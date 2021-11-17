Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A4B454934
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19206E188;
	Wed, 17 Nov 2021 14:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2A76E188
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:50:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 23FF7580882;
 Wed, 17 Nov 2021 09:50:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Nov 2021 09:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=23dqcmjSH9B2h
 73WyYCD5rWytbbg/psxAuav/PZZVQg=; b=MG2lEI8rPFK2Ha+6tbxWgg3qMZreD
 TzODacTLdimFuYRN8UkNSJkzlLg2UCFWYwA6zZ3OhRgvhCnJGjeYBoMD3Cr8/23F
 f8WupOmKUBkP9+Iary7EK6CjU6azQ7FFefwJYdkigi/M3aoVQo1wK3i/1dILAQD+
 eOo+SWtNFSn0/xGdZxryVpnrhEu7qywhwxlLJDIgRe3Jt9gmqMz6dF8DjXfmEu1g
 VTtb5UasGFAGY6RnxSzRF6W7QCKv2Y4q1Univb275yt45ExMRae/vqv05/X/SODb
 OTgzhoR+FE0948ql8YYkCWWKiLw5l7p/xJZMCpAlA3kZ3YZq2N+RJbgaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=23dqcmjSH9B2h73WyYCD5rWytbbg/psxAuav/PZZVQg=; b=EpF92wSo
 aJS5IZZcQSznSPQLcmMoEQ6reQ/KUXtB7YXBC7ZBudq8WkjfvWw7wNIDVR3NwGM3
 E5GoXJ1pv+Bg7/OguMNVCPnOR0SqqrRJeMP5JT/5Q4jkGtzG/cPokWu/3mqWAL2d
 9ULv5ji4e5LN3Xk+QCVWOfhn/63Ih/VEcByYcd0mJbdMbvTxGWilb+PWk5HQ8omu
 XLJpJiE9pFpygpkU6yBBERiuC85krn0UKmBKR/OaWgEWMogGEUFNJNPzXJOuro2B
 cSuYK6JM9Vj/LC5gLd0MbJpoN4uwU8F/VO2Vfk5iIn06oxrNvZBDW3qtpP6wyPlJ
 eWWu608MKD6OOw==
X-ME-Sender: <xms:yxaVYYT4_aUfvLzHMWGr34LcSVH9wTOrJPr19s6c5qk60p1KRRPJRQ>
 <xme:yxaVYVyED7RglqWsobXtBNKh_6dHo8XCsGpI4o85aOmmPjE_gDRGP_xcWWRlpjW8e
 Dzm4dU2U-yRxqxUA10>
X-ME-Received: <xmr:yxaVYV1btl-tXIkLfGS8IFxscIM-2SLYwKpRbpKFNp4qrQ6_SzoAaUDkisE50goCR4IiqMcGpQCo7Aayka50y0U0XRDIGb-RFH41AOPqrnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yxaVYcDgWbuGoXAfWbhMExzjDx0Wa8a0DtnOnYz_wEZIEwQ3QomV4A>
 <xmx:yxaVYRj2dHJRneNtzMMdzM4B-tLdQ7GEgyf2cCT54_bUvjzaTNr1Aw>
 <xmx:yxaVYYr07P9sk1uPpAwzB9a52UNU-F4mZvMJxX-loLny53cIG1nCng>
 <xmx:zBaVYaZW0cqGFL7_ZpRqxOXWX8XHSN56-9DzrsVORxZtQ84khHCS2g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 09:50:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Scott Branden <sbranden@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 4/5] drm/vc4: Notify the firmware when DRM is in charge
Date: Wed, 17 Nov 2021 15:50:39 +0100
Message-Id: <20211117145040.334827-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117145040.334827-1-maxime@cerno.tech>
References: <20211117145040.334827-1-maxime@cerno.tech>
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
index 8ab89f805826..d09fa9c130da 100644
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
 
+	node = of_parse_phandle(dev->of_node, "raspberrypi,firmware", 0);
+	if (node) {
+		vc4->firmware = rpi_firmware_get(node);
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

