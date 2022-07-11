Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954D570918
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACFF9030F;
	Mon, 11 Jul 2022 17:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D6890312
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 238D65C015A;
 Mon, 11 Jul 2022 13:40:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 13:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561236; x=1657647636; bh=lk
 FtvFO9vr6OIYKUa2HIPXpyK3h0qMzfpQkEr1YfaYk=; b=ju+fLN0APVLLy0Biy4
 RijuutMSFB6m26El4EywDkLqsy7bOEovRGMSn0MwC9RCC/wPaspp8D93KzratAHI
 6hlZb8LwBF1U/75yonVbtNaKXipL6QLioeYEf0pCJbTSov5M3uaY6ccZCr1rC/7K
 2c9yKInvPPZj6sPAszKQCZ/z08jcRUkcg8WIJJ2oapRu+nxOzg6EIhGdC2CSkBm+
 cL19DnodJQL6/z/WfCagImQGH8q2kZtCbvyOxUuEc5wklIKz3AWevMGiHDnQv0J4
 BlyKPLnSng8+8ma5cwau1Oc9U5Bb0M0CZGH3sF0UfzbB2UTy5HoaF08JmnR6z0lV
 L52g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561236; x=1657647636; bh=lkFtvFO9vr6OI
 YKUa2HIPXpyK3h0qMzfpQkEr1YfaYk=; b=awugeyNhR9w2ErxUq7Rs+kTP8koIl
 Yuuh1HWwMSUrvv8J9x0XE6DykH4lzyCE70vTYvw1rYJNtBUdbANm4jQaTub0UM5m
 5n9TpxYf7UGf4Jn6LFY2pNv/1KwbBnofVjlTbDuYdzWMAj7rupRcZ2/esv3gZrVa
 u0HmSOhlMkWPCJW3ASOn0gxwJ4+sgyD2kNGTiXYMPjeZLZSAHQG1zYvgq1HkOEel
 Qj+59VRE0L3v+BcLyl/slgXfOdLnJUV7/PLeA3KphJp+qgYOpjgGcOUwL0uZp2I9
 zHZBxMsHvg6INvI1RaOlbqWBMUEMq+8tcM5VeUt7FnK7NR1r/QZNkcV/Q==
X-ME-Sender: <xms:k2DMYmlEaS5h8MYynB29eE_LA5Qa_aBK6-z4h4jOYoBJ5QiQbqu8Yg>
 <xme:k2DMYt2SCr0-3b-DGLW4jipOLRRJtHCOe-fzrgq128pc9aPZCLfpWJnhthEpKNCM4
 a6rxvnasqvEWOP2mH8>
X-ME-Received: <xmr:k2DMYkpuj_5DmJ0FBXzIUBeQmfe2GFMiP5v4gws5M7qK81wKl7by9dJK9oHuSwGrZl-SL3KK6yXOxzLosBuar3j61TicV5Da6euvwcs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lGDMYqndQ13555hFjBDutLQIzDgP1PZz5ASxKatOMsVoPwq_2oU6FA>
 <xmx:lGDMYk37GtGHZdQM7iaX4ktZLij4JQyhlRnweenrIL_biJy9iH6NVw>
 <xmx:lGDMYhvKJjhTQAMv3YCFByf50DpodNVR6-GQzfOSXqWEcgr3ruzqEQ>
 <xmx:lGDMYo8upmy87kHM4CGP_YN6Qsvk_McAMKe_4gkh2I5hEWGwg6YJ_g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 31/69] drm/vc4: dpi: Protect device resources
Date: Mon, 11 Jul 2022 19:39:01 +0200
Message-Id: <20220711173939.1132294-32-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our current code now mixes some resources whose lifetime are tied to the
device (clocks, IO mappings, etc.) and some that are tied to the DRM device
(encoder, bridge).

The device one will be freed at unbind time, but the DRM one will only be
freed when the last user of the DRM device closes its file handle.

So we end up with a time window during which we can call the encoder hooks,
but we don't have access to the underlying resources and device.

Let's protect all those sections with drm_dev_enter() and drm_dev_exit() so
that we bail out if we are during that window.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 660feea0534d..7286a3333538 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -112,9 +113,16 @@ static const struct debugfs_reg32 dpi_regs[] = {
 
 static void vc4_dpi_encoder_disable(struct drm_encoder *encoder)
 {
+	struct drm_device *dev = encoder->dev;
 	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	clk_disable_unprepare(dpi->pixel_clock);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
@@ -125,6 +133,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector = NULL, *connector_scan;
 	u32 dpi_c = DPI_ENABLE;
+	int idx;
 	int ret;
 
 	/* Look up the connector attached to DPI so we can get the
@@ -204,6 +213,9 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 			dpi_c |= DPI_VSYNC_DISABLE;
 	}
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	DPI_WRITE(DPI_C, dpi_c);
 
 	ret = clk_set_rate(dpi->pixel_clock, mode->clock * 1000);
@@ -213,6 +225,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	ret = clk_prepare_enable(dpi->pixel_clock);
 	if (ret)
 		DRM_ERROR("Failed to set clock rate: %d\n", ret);
+
+	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status vc4_dpi_encoder_mode_valid(struct drm_encoder *encoder,
-- 
2.36.1

