Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84933F413
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D486E7DC;
	Wed, 17 Mar 2021 15:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82E16E5C3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1FF2C580E6A;
 Wed, 17 Mar 2021 11:44:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 11:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=BjkD1KWTYXpBK
 VCVD2sYcNUdCI4dUqXTDvu/M/3Oysc=; b=b0l4/TxMi7rgE/GqbD3VKkdENZQMU
 wzkKkXZp8jJbatGbjOZlDY+leRMcjO68qKNhQYmqShm2cGVfeNoUb5rbAYeJivX5
 pJyDmTSUPXFRJL9yp2zP+VbqAShwXBRmwSMFJjwh29KzKCXCckpnIyeLmsC2/SAW
 c3muK6Z3msqz5s5r0l1xLUvIxrQck5lyLPqdunqQmCaInN6wIN+CeK8OKIuzzE8/
 P6cJkw3Z/mkNN7wrkAeKzi9drdTcLwQ6tqBAw3i9GglBkzk6yGcVWUHibIwvmLxw
 ++dEkWrlRp+L1lhfMxl3stm6/NM/sWQjygbZ0B0qRlFQY4iUDFruinXGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=BjkD1KWTYXpBKVCVD2sYcNUdCI4dUqXTDvu/M/3Oysc=; b=Gwq26n8B
 HHObNwpyRW1qNt6Ap68317v94FAKUhvMDVkTiMSB2aWXh6tS0oQbiiBnoJ5gZuTc
 mbZhhTvTA+/k+4LjBxP4MbgoKIBSUPBsX8Y2KGA9r6z7k3jTijrttwcSiVSDXKSn
 AJ7+Y6Z8iUhAnfJ40L5u6iFp0h/pbHl8Mh7lMBILRCJLd1UBUSUKtatmvh4kLjxW
 x7vFaEPTrGJZiJ7zeszbvPt7+j2eJYbFeRt1PzFVeIakGZTIvQ+dWJMMuu6QJAHv
 KtL4Cyc/rprLoomdLFhOsswdQH6F2NBg/UE8XxOsI2xLCIj9Pb+G3bSGCIXPpAso
 cGPfEKvNwgIXoQ==
X-ME-Sender: <xms:xSNSYFMqfIAkE4MMb8k0rHYjjMyU5Y9yQAqL_kzLinIPYR330JzEpg>
 <xme:xSNSYFd6VrvD_coUC7gQ5Ur6YIa_CjCEpbC3P5f99wARiEPVP_Tc7C3FG0RBl5X3v
 S8FlVVEDYtzG1QnUvc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xSNSYG40tk0YaJsQEoVKC03wZw0MqQElSlnTD6cKh-0PRU5J_cx0pg>
 <xmx:xSNSYHJ0jkoJo9LcrAu1yiKJ_zeSuUwQQZX85smD6k5_u7l81S6gvw>
 <xmx:xSNSYAVI3iD9hpzuv267woMcw-Cl88zHf5wfnnFEIfNrqp47nM6Ucg>
 <xmx:xSNSYFXQV3OzLUWFvBJ7W8yIKA4OdZwcDgcLGPKuhzLWOudbSgmBQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D5FA9240067;
 Wed, 17 Mar 2021 11:44:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 06/18] drm/vc4: Rework the encoder retrieval code
Date: Wed, 17 Mar 2021 16:43:40 +0100
Message-Id: <20210317154352.732095-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
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
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 +
 3 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index f1f2e8cbce79..e2607e1f2520 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -255,6 +255,19 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
 				   PV_CONTROL_FIFO_LEVEL);
 }
 
+struct drm_encoder *vc4_get_connector_encoder(struct drm_connector *connector)
+{
+	struct drm_encoder *encoder;
+
+	if (WARN_ON(hweight32(connector->possible_encoders) != 1))
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
index a7500716cf3f..1b569dcc2154 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -438,6 +438,7 @@ enum vc4_encoder_type {
 
 struct vc4_encoder {
 	struct drm_encoder base;
+	struct drm_crtc *crtc;
 	enum vc4_encoder_type type;
 	u32 clock_select;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
