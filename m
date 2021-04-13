Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8835E1FB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DC16E5CF;
	Tue, 13 Apr 2021 14:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D1F6E526
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:54:52 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 281F9169B;
 Tue, 13 Apr 2021 10:54:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 13 Apr 2021 10:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=sBPiDL14g8CxG
 FRhxed8ANjZOcf1q05bfsrRbbWG1CA=; b=Q+wWliC+cGjJPKmVpgIpjmKgKYIeF
 1PQuS8bXAIfaKh4226eGy4uyFvWUwTQV6k9hAMjlAptJjScVQ0P9YeVqVMzqfUyr
 dE3kLoLVSMrEcBH2yml01SsmtZFT4Tz7Qvs3nL4ZVICyzPJaz1wwDIEbbFFOissb
 l6LPhjmjGKFbEx2yEWo5uD680wlDijWd30RE8kzH1OLJEm4I34o/J+A99x/IBwBo
 a3+U206q/cpSxM3SJyKzVR/72roN4kgDbQk1k3Xit/hjgmaHKyMbBivf0q6IImgL
 X5gqUmVzHsWtuSzSePPyo7rnrmU8mWgzMIt49yjCc3CDyHsewLIJY4S3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sBPiDL14g8CxGFRhxed8ANjZOcf1q05bfsrRbbWG1CA=; b=sNt+4EMJ
 8ZmEJOIu4GJca8DZJhCDysuCCMYpzLmHnxu1AcUWrPz1NeOWTOnbrJ9OsqspjqTj
 yP/+FrC5rUitqVOjJJq31eiuVITDwM4GcoQu7lXZPnTQqL2JQdkEeWp+kMoN1HV7
 uJTj92DdKetOaEUGVmyDbkCUlxWQy6c5FQNwYFy4ld1C2YdWOjWwccf9sZvu9AsZ
 5eN8p9DOCjiUHYZ10rcF/UYNHZWLCjQ31UgDCwLvIzU+ep6Y0Imv2Dx+Mi6uW8kU
 RKKF8E79C6aOLIRAhLH3820A90L3X0cgOpVxfBUqSETpEEf9rJBdGzKpsZViUeFW
 lNLqd0MELf00Pg==
X-ME-Sender: <xms:ubB1YOOUTb139c68pwHdrtPXjN-Z0xU2ZawsNcsJiekaBpxtihRctg>
 <xme:ubB1YC_OEkIqIjRo1cl3-K0-3VHr-_Al-FXf0_fKLgcZ9k0kS5EY1Bk9yGgQPXg1E
 ry44bswA1Uo9cl95c0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ubB1YAFtVHDfjhFCRdDkHQz2Z9ub0gFOTF6WLiEtm0JvI5HLtYU54w>
 <xmx:ubB1YBhgP8tIeGtTnyOsM7gjGKeM3609394Ho_0hU0ef_8kcZU0MXA>
 <xmx:ubB1YFs87GliR8oW7F4OvlrX069PmvDLA2756vLLwdoY5dLqsZEXmA>
 <xmx:urB1YKRMT1mmvThuP0t_FvY11BYLVY73cvY7UpifF5UPdPJMbaiJUN_oqWI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 080AA240054;
 Tue, 13 Apr 2021 10:54:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 3/9] drm/vc4: Rework the encoder retrieval code
Date: Tue, 13 Apr 2021 16:54:35 +0200
Message-Id: <20210413145441.483977-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413145441.483977-1-maxime@cerno.tech>
References: <20210413145441.483977-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to a FIFO that cannot be flushed between the pixelvalve and the HDMI
controllers on BCM2711, we need to carefully disable both at boot time
if they were left enabled by the firmware.

However, at the time we're running that code, the struct drm_connector
encoder pointer isn't set yet, and thus we cannot retrieve the encoder
associated to our CRTC.

We can however make use of the fact that we have a less flexible setup
than what DRM allows where we have a 1:1 relationship between our CRTCs
and encoders (and connectors), and thus store the crtc associated to our
encoder at boot time.

We cannot do that at the time the encoders are probed though, since the
CRTCs won't be probed yet and thus we don't know at that time which CRTC
index we're going to get, so let's do this in two passes: we can first
bind all the components and then once they all are bound, we can iterate
over all the encoders to find their associated CRTC and set the pointer.

This is similar to what we're doing to set the possible_crtcs field.

Fixes: 875a4d536842 ("drm/vc4: drv: Disable the CRTC at boot time")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 25 +++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.c  | 36 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_drv.h  | 10 ++++++++++
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index f1f2e8cbce79..2bcd7c4e0fc7 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -255,6 +255,19 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
 				   PV_CONTROL_FIFO_LEVEL);
 }
 
+static struct drm_encoder *vc4_get_connector_encoder(struct drm_connector *connector)
+{
+	struct drm_encoder *encoder;
+
+	if (drm_WARN_ON(connector->dev, hweight32(connector->possible_encoders) != 1))
+		return NULL;
+
+	drm_connector_for_each_possible_encoder(connector, encoder)
+		return encoder;
+
+	return NULL;
+}
+
 /*
  * Returns the encoder attached to the CRTC.
  *
@@ -269,9 +282,17 @@ static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc)
 
 	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
-		if (connector->state->crtc == crtc) {
+		struct drm_encoder *encoder;
+		struct vc4_encoder *vc4_encoder;
+
+		encoder = vc4_get_connector_encoder(connector);
+		if (!encoder)
+			continue;
+
+		vc4_encoder = to_vc4_encoder(encoder);
+		if (vc4_encoder->crtc == crtc) {
 			drm_connector_list_iter_end(&conn_iter);
-			return connector->encoder;
+			return encoder;
 		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 556ad0f02a0d..cd1fb75c66a7 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -199,6 +199,41 @@ static int compare_dev(struct device *dev, void *data)
 	return dev == data;
 }
 
+static struct drm_crtc *vc4_drv_find_crtc(struct drm_device *drm,
+					  struct drm_encoder *encoder)
+{
+	struct drm_crtc *crtc;
+
+	if (WARN_ON(hweight32(encoder->possible_crtcs) != 1))
+		return NULL;
+
+	drm_for_each_crtc(crtc, drm) {
+		if (!drm_encoder_crtc_ok(encoder, crtc))
+			continue;
+
+		return crtc;
+	}
+
+	return NULL;
+}
+
+static void vc4_drv_set_encoder_data(struct drm_device *drm)
+{
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder(encoder, drm) {
+		struct vc4_encoder *vc4_encoder;
+		struct drm_crtc *crtc;
+
+		crtc = vc4_drv_find_crtc(drm, encoder);
+		if (WARN_ON(!crtc))
+			return;
+
+		vc4_encoder = to_vc4_encoder(encoder);
+		vc4_encoder->crtc = crtc;
+	}
+}
+
 static void vc4_match_add_drivers(struct device *dev,
 				  struct component_match **match,
 				  struct platform_driver *const *drivers,
@@ -261,6 +296,7 @@ static int vc4_drm_bind(struct device *dev)
 	ret = component_bind_all(dev, drm);
 	if (ret)
 		return ret;
+	vc4_drv_set_encoder_data(drm);
 
 	ret = vc4_plane_create_additional_planes(drm);
 	if (ret)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index a7500716cf3f..a22e49665d9c 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -438,6 +438,16 @@ enum vc4_encoder_type {
 
 struct vc4_encoder {
 	struct drm_encoder base;
+
+	/*
+	 * At boot time, we need to be able to retrieve the CRTC for a given
+	 * connector in order to run the disable hooks below to avoid the stuck
+	 * pixel issue. Unfortunately the drm_connector->encoder pointer is
+	 * NULL at that time so we can't move up the chain, so we'll store it
+	 * ourselves here.
+	 */
+	struct drm_crtc *crtc;
+
 	enum vc4_encoder_type type;
 	u32 clock_select;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
