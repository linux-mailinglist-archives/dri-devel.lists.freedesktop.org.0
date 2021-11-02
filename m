Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9FD443122
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A9E72E89;
	Tue,  2 Nov 2021 15:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90B272E7B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:00:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C8B258073F;
 Tue,  2 Nov 2021 11:00:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 02 Nov 2021 11:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=kSLWds4QU53zw
 AH3axWvblvvwR6VtiPGfngCi4Yt7UI=; b=dkIh0gYY20XnNNEKhtCOBDhqrMD55
 tt6mYSji6Tv7AbFjIF2HqDGwSpEcEa0Q9C3O+3KuhTjkiKwibl03FNLbIMoibpbA
 oiuurVnxerM6hT/ZD4oC+s7xdjxhUOYHoLZlWqL0h3lC2eBMpqrw6/FZC6TFhl4Z
 GkBBLOTbPM9ThQrf0S7+3tFsO9ePh9urLJvGr8Is2oACaLic2ZQsl1BTiprRCWnX
 JWi+mIuuBFIkI9sJ7G7mdBWfLYdEB4nOZYdRH3SPVvpGC+69zHYZfic/hJzuhkyh
 fw275vFdQaVMCxTYcrFj8Zy3scvrF7nPDesxDdq8UiN6XHU6PVFoT7Yuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=kSLWds4QU53zwAH3axWvblvvwR6VtiPGfngCi4Yt7UI=; b=WlFn+I6R
 c2+RtJ29rPfWhUdoV6gOkbEPHLSrogxUI/viadkvUHE6T36Ny8zqSF7Gg3NBxD7x
 1k9dOXIQuzDhnDBsK/e9zIyrzBMcvmvCytBMjQbIzAVAyV5+PWM2/FpXp+RDV0Ua
 8FLOdprK/8Th7xayzCZEDA1/E2V6Fjzkp3i5N6FcV/6GpSmmiDsgPpU/Q/Nw3y0b
 j6xoIhj5nPyIPWXsv6D5oriwpHKDimelVFfugL4qsuF9GiT7tdxMdSxt+5yhFQ/A
 fvFniyz5GoktFPytRWvOACLtBU/NgU5g//Dcvg9AoFziXqkNtiOjEhaJIrEDiWeu
 OXMMWYxgbWHcKg==
X-ME-Sender: <xms:e1KBYZ_yGdFt7ju1Kvy5NAfFny3N_K8ylQrt3MOMkcEueENh-F4CRA>
 <xme:e1KBYdtDkSwh6QYyDK4qM-owcovouhhtOQoWVErDqiCTt8pjpDKF4XPzkFytAYIx2
 YrVf2GcXEhac8xu6oE>
X-ME-Received: <xmr:e1KBYXD-FOxsTh1FyQ17RHDSxI0ieg7mPPysI9zPYRR9gCHk1iZeFWvVPUjbEvYCFG5kyVwS7BuN3RJkM5VZJ17OsW1HaIidzJagVlzI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:e1KBYddhrFWLF51xzflICjZAZbg6pEQ3mrU6VcHOU8B_ymeb82xAyw>
 <xmx:e1KBYeOWxDoOErtiv3aaGYuF16mxtRV9w-BsMiA-vpzfPgs-ZcvJCQ>
 <xmx:e1KBYfnMbhnTJekjPe1qprwCrcEMZSTLWn3rykgE_24fuJOl4wWKCQ>
 <xmx:e1KBYVqmCSyw-vrr2r73fThD0KQWb-95P0w4HaUVlcBk1vX06AgiGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:00:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 09/13] drm/vc4: hdmi: Simplify the hotplug handling
Date: Tue,  2 Nov 2021 15:59:40 +0100
Message-Id: <20211102145944.259181-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our detect callback has a bunch of operations to perform depending on
the current and last status of the connector, such a setting the CEC
physical address or enabling the scrambling again.

This is currently dealt with a bunch of if / else statetements that make
it fairly difficult to read and extend.

Let's move all that logic to a function of its own.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 50 ++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 288c2bfbf88b..4f2f138f93e3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -177,11 +177,35 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
 
+static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
+				    enum drm_connector_status status)
+{
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct edid *edid;
+
+	if (status == connector->status)
+		return;
+
+	if (status == connector_status_disconnected) {
+		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
+		return;
+	}
+
+	edid = drm_get_edid(connector, vc4_hdmi->ddc);
+	if (!edid)
+		return;
+
+	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
+	kfree(edid);
+
+	vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
+}
+
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
-	bool connected = false;
+	enum drm_connector_status status = connector_status_disconnected;
 
 	/*
 	 * NOTE: This function should really take vc4_hdmi->mutex, but
@@ -198,7 +222,7 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 	if (vc4_hdmi->hpd_gpio) {
 		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
-			connected = true;
+			status = connector_status_connected;
 	} else {
 		unsigned long flags;
 		u32 hotplug;
@@ -208,27 +232,13 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
 		if (hotplug & VC4_HDMI_HOTPLUG_CONNECTED)
-			connected = true;
+			status = connector_status_connected;
 	}
 
-	if (connected) {
-		if (connector->status != connector_status_connected) {
-			struct edid *edid = drm_get_edid(connector, vc4_hdmi->ddc);
-
-			if (edid) {
-				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-				kfree(edid);
-			}
-		}
-
-		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
-		pm_runtime_put(&vc4_hdmi->pdev->dev);
-		return connector_status_connected;
-	}
-
-	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
+	vc4_hdmi_handle_hotplug(vc4_hdmi, status);
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
-	return connector_status_disconnected;
+
+	return status;
 }
 
 static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
-- 
2.32.0

