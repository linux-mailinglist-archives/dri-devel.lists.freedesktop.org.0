Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C02560015
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3C514A61D;
	Wed, 29 Jun 2022 12:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC2B14A618
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E8CDE3200922;
 Wed, 29 Jun 2022 08:36:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506207; x=1656592607; bh=qP
 HiCJaIDxswql/uThGYaZJwc51gq4YD3exSvWTCH7o=; b=AjjOFIcD+NqgHZsyqE
 svVpRLg92TzHIeRzHmVtZrTraPz6wuvro8q9dUxzv+j0V65AGk1yKlGAQ9ZcGaxZ
 Lmyg1yFIjsyeJwShRqzF+DDaURh0LTxaqqfIDsnXQxnP4iilrLhqG3eIRrnN2lsM
 13YJVE6GfvKGqCd3W4Jq201aMKy79aRIWOoyiCiPE+Mk5hstZo/00SdHASqo4fpS
 UOia2oCUNkuMGZ3k7l4W9zBFZtV0wY6SlRraubAkyRd4T7JGo0IjxIoG+RJk8N8j
 M2wBpFQ0V+TrBQpT8j2OEEv3U4jf1x6LvGL8q4aqzE45bQWXdb9qKlsDKo/7mkTT
 bEWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506207; x=1656592607; bh=qPHiCJaIDxswq
 l/uThGYaZJwc51gq4YD3exSvWTCH7o=; b=GFCAjy8AXJa53lf38dZClxGALYulM
 +NPPnAGajOpacirz6xvFOY1q3qWuAchM/5u9OZWG347iZgjlCGDBSgyhSyO9C1gL
 6Pc8TqdzY+8fNrA9+Fy09q2bV2HLKApNZ+UZDg2jJAbMPJxnFsEmV+a6pmDhz5ZF
 +y6l82rz+lh3gbVhCiaO7lgK8gmfTax8KXmvYcR45FCWmLOfSr+LUOaJJKYby3sL
 4GPauaH5IKsCpMfb3YnluGN+Mso+rF2gz9JAhbu//pcl4qlvHRDtLskDcUGUpX40
 KuEAoz/FuDSORw/HVHH8x1UGK6CUd13kg9mVLpnub2hD2k6vTS1mRWbsw==
X-ME-Sender: <xms:X0e8YlyYAQYaBy9Z8i3ywV5h5YEZY8ogosvQ8zaLr6UD-zm5wGFHcg>
 <xme:X0e8YlSjVoJxeXTFFRhzse6CaYMX1l7n6tig-EymA8mfDK1HQkPZ_gkcdJ6L3PEJD
 fkPRnixJY0NinYIhhc>
X-ME-Received: <xmr:X0e8YvVacbaLk3VJ7Uei5GQjDinl0Uc-rLd9w2V6O0AIUOqlaJSwPl---cqkSesAlv-mOYmwygKas6TLfYuD8l6H1GhXC6T2i_V3yXE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:X0e8YnhEuxq3mF1Zm5myGTaMSCQvUXfJsJ-aafXQnSfPxzTLHA2XsQ>
 <xmx:X0e8YnC7Iwxa4HpXjx2138ycPr93qZuuVAaryMFvt0dqrlePX3Rl1g>
 <xmx:X0e8YgILxLFOPFiNxui-Cia-vUqXTlmX3O2nSXhKtzb-__ctlbQDyg>
 <xmx:X0e8Yi4MUXmDh68V93Uh-sxyB4MT16MCn3mkemS6sc-Z0olvRHrKsA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 31/71] drm/vc4: dpi: Protect device resources
Date: Wed, 29 Jun 2022 14:34:30 +0200
Message-Id: <20220629123510.1915022-32-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index b4059820c9f5..e892ac853f64 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -111,9 +112,16 @@ static const struct debugfs_reg32 dpi_regs[] = {
 
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
@@ -124,6 +132,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector = NULL, *connector_scan;
 	u32 dpi_c = DPI_ENABLE;
+	int idx;
 	int ret;
 
 	/* Look up the connector attached to DPI so we can get the
@@ -203,6 +212,9 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 			dpi_c |= DPI_VSYNC_DISABLE;
 	}
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	DPI_WRITE(DPI_C, dpi_c);
 
 	ret = clk_set_rate(dpi->pixel_clock, mode->clock * 1000);
@@ -212,6 +224,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	ret = clk_prepare_enable(dpi->pixel_clock);
 	if (ret)
 		DRM_ERROR("Failed to set clock rate: %d\n", ret);
+
+	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status vc4_dpi_encoder_mode_valid(struct drm_encoder *encoder,
-- 
2.36.1

