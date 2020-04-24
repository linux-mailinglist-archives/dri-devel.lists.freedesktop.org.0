Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54281B8015
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EEA6EB4B;
	Fri, 24 Apr 2020 20:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EAA6EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 299CC10AA;
 Fri, 24 Apr 2020 11:36:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pnZ3mgpaIO6iV
 y4XLi2/ge60zj86iy21qSwo/YutQY0=; b=lLhL3PEV1QMONd0+YlvnbHKBhl1lR
 tByunTAYhlcb3clzK6kqZDNmeiKIjD8twFQ/6o3Dhj9dXiUHVJp+UdfynJUcrINe
 sZ300MW6HDKTfrYKeSyyEJXELG0hCQbuVmENo8dq/NCM9LqRjJalNez5jTdAHEio
 Wp2PvhtlmWWx0gpywlPBy0GBVVWTKggClCt8h7+dBCnoFAo0GT42Tuf6fINd1lJE
 VKrAg/kaXt611MKd9dScc2YpkJJRYcDdimhmyBdYHXSWGPJ9kaMY9YOq8l00j4/C
 l3kkEJvMe6vdLgph6/f94kVTJ9jyFx3NBz9mWizYrxOPeGmGb0gt2McnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=pnZ3mgpaIO6iVy4XLi2/ge60zj86iy21qSwo/YutQY0=; b=XDtKritB
 azud3rZLIdwR+4f2majaxF/A72hnx4wPg7xnL9QkHj9oIKyZQ78GrD571DEq8oWw
 YF+bRgEMEpCG8IE1Brm5SO5f0iz57af7U1bB4aKYmLH8+6ZkKzFLeQ7MLpmCBJDx
 DG7NZGYPHZpJvbKb/nbsYfnug7yJmbY8QS8mFRf/nFyunOfiz4D+MqEeNORKjCIa
 ieRzcLX4fjRgKT8BHjdQCYgM6lIbyyHKTpN/BclHL1pbYgc8vvd0mxvJ7cJ+QQ/y
 7qPv2stKsFf/HJvFwVWP1OmBsEtnVVbjW0T/UGg0Bapne/QQhTCyQOpZmBb5wzBM
 VKc811yqF/Zs4g==
X-ME-Sender: <xms:bwejXhLmwX9_DK8bT0jgvPdQ1ZN1xgyyihQt6T4v3B232AtGSTN57A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvleenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bwejXhsDEFyGCksvtIwU5Y-vxdeogYIy4L05C24UzarASrhyfS0d5g>
 <xmx:bwejXlmFZlNlmQjIFS1NUA02evt9LAImrISyS6gH9Kb2MTUK7Ncjvw>
 <xmx:bwejXvHs9JHQYmT8LZ2GEYCfVl9pxsnZ9Z-V8WJaT315maDxcf4OIg>
 <xmx:bwejXpVMramIrK23oqKw98KkA43pFCZk9-s97I0UACZpnAyOqAZloY5VG3E>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D28A328005A;
 Fri, 24 Apr 2020 11:36:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 38/91] drm/vc4: plane: Move planes creation to its own
 function
Date: Fri, 24 Apr 2020 17:34:19 +0200
Message-Id: <52b7591887d3bbf8e1354b5cd2cbfa6ca98fd4bf.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The planes so far were created as part of the CRTC binding code with
each planes created associated only to one CRTC. However, the hardware
in the vc4 doesn't really have such constraint and can be used with any
CRTC.

In order to rework this, let's first move the overlay and cursor planes
creation to a function of its own.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  | 33 +++---------------------------
 drivers/gpu/drm/vc4/vc4_drv.h   |  2 ++-
 drivers/gpu/drm/vc4/vc4_plane.c | 38 ++++++++++++++++++++++++++++++++++-
 3 files changed, 44 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 591a10ae1950..29c72c322c6b 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1144,7 +1144,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_crtc *vc4_crtc;
 	struct drm_crtc *crtc;
-	struct drm_plane *primary_plane, *cursor_plane, *destroy_plane, *temp;
+	struct drm_plane *primary_plane, *destroy_plane, *temp;
 	const struct of_device_id *match;
 	int ret, i;
 
@@ -1192,34 +1192,9 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	 */
 	drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
 
-	/* Set up some arbitrary number of planes.  We're not limited
-	 * by a set number of physical registers, just the space in
-	 * the HVS (16k) and how small an plane can be (28 bytes).
-	 * However, each plane we set up takes up some memory, and
-	 * increases the cost of looping over planes, which atomic
-	 * modesetting does quite a bit.  As a result, we pick a
-	 * modest number of planes to expose, that should hopefully
-	 * still cover any sane usecase.
-	 */
-	for (i = 0; i < 8; i++) {
-		struct drm_plane *plane =
-			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
-
-		if (IS_ERR(plane))
-			continue;
-
-		plane->possible_crtcs = drm_crtc_mask(crtc);
-	}
-
-	/* Set up the legacy cursor after overlay initialization,
-	 * since we overlay planes on the CRTC in the order they were
-	 * initialized.
-	 */
-	cursor_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_CURSOR);
-	if (!IS_ERR(cursor_plane)) {
-		cursor_plane->possible_crtcs = drm_crtc_mask(crtc);
-		crtc->cursor = cursor_plane;
-	}
+	ret = vc4_plane_create_additional_planes(drm, crtc);
+	if (ret)
+		goto err_destroy_planes;
 
 	vc4_crtc_get_cob_allocation(vc4_crtc);
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 4fd6f72dec56..0875d29a0cee 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -855,6 +855,8 @@ int vc4_kms_load(struct drm_device *dev);
 /* vc4_plane.c */
 struct drm_plane *vc4_plane_init(struct drm_device *dev,
 				 enum drm_plane_type type);
+int vc4_plane_create_additional_planes(struct drm_device *dev,
+				       struct drm_crtc *crtc);
 u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist);
 u32 vc4_plane_dlist_size(const struct drm_plane_state *state);
 void vc4_plane_async_set_fb(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 602927745f84..89d03605332e 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1371,3 +1371,41 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 
 	return plane;
 }
+
+int vc4_plane_create_additional_planes(struct drm_device *drm,
+				       struct drm_crtc *crtc)
+{
+	struct drm_plane *cursor_plane;
+	unsigned int i;
+
+	/* Set up some arbitrary number of planes.  We're not limited
+	 * by a set number of physical registers, just the space in
+	 * the HVS (16k) and how small an plane can be (28 bytes).
+	 * However, each plane we set up takes up some memory, and
+	 * increases the cost of looping over planes, which atomic
+	 * modesetting does quite a bit.  As a result, we pick a
+	 * modest number of planes to expose, that should hopefully
+	 * still cover any sane usecase.
+	 */
+	for (i = 0; i < 8; i++) {
+		struct drm_plane *plane =
+			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
+
+		if (IS_ERR(plane))
+			continue;
+
+		plane->possible_crtcs = drm_crtc_mask(crtc);
+	}
+
+	/* Set up the legacy cursor after overlay initialization,
+	 * since we overlay planes on the CRTC in the order they were
+	 * initialized.
+	 */
+	cursor_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_CURSOR);
+	if (!IS_ERR(cursor_plane)) {
+		cursor_plane->possible_crtcs = drm_crtc_mask(crtc);
+		crtc->cursor = cursor_plane;
+	}
+
+	return 0;
+}
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
