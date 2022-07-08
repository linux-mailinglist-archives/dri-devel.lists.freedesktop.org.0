Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C92156B6A6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11E4112344;
	Fri,  8 Jul 2022 09:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EA5112344
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 29DBD32009AE;
 Fri,  8 Jul 2022 05:58:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274322; x=1657360722; bh=lk
 FtvFO9vr6OIYKUa2HIPXpyK3h0qMzfpQkEr1YfaYk=; b=hpWM3IFEXObUEB9TI1
 z9qrpqR2jjRUnMnUia+JXtscxc+aS4no+FBUHkdu2sRjTQYdSLxwyYhpl3Bez3r2
 4GE9+RPzJmv02lKIqy3GFguygMUkcNkN+aG21XsBck3FSEJoqjhnKZjain5Afxlw
 5JtVSEMuf+LvICgTGKMgaoPzTzIxv7GF39AGBMNGetP/L92TbEdxK15lxRlUXDOj
 KO4/kHADwJcelUOtpJpygKmy4yppevRPJCjJuystROM+ESyZ1/XrE4hDStq+9v0c
 E1h/V8NhC+kluO4NO9a5bK0gJgOW1jpmlRwQ2tUPoacLMOPA2CIhRjBCHRAdalRj
 C2dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274322; x=1657360722; bh=lkFtvFO9vr6OI
 YKUa2HIPXpyK3h0qMzfpQkEr1YfaYk=; b=M8p9mDsS1G8D+ygDC5DQzAfgZbDja
 TB3mpC4MYuTO6sWoQy4FnEAIw3KX7gbysHjziia8mA1b6oq/LeKqJUpV7FmKEXIE
 5Dn461weFTP65cRae+f+bYBou+TFXyCXZv9PlsGfaz29x4+erYxnwM9w7fBBAJcf
 oCded59fjWr7OeZhe7zni/BtgRAPHmb67fdUt9eRte1rc4jxA4KIoKfmraRabTjK
 wYvgKBuoqnjSiqGgY52GDhCuH1Yer3j3gmHRjOYldLn9sFgUaUZ+qV4ukwN3mQCt
 OXBUB5L7106lAISF6lJwMBpeCzMl5vijoO4dQFrhjWAQUO90loFyUvAog==
X-ME-Sender: <xms:0v_HYhIF5sW9v72MZJkaCI3I8_dT_-yFe8byuYtOzEHSEfQYOpB1ig>
 <xme:0v_HYtJwDHyOaEvBbIJLUgxIfFNdfXbfmWH4A1rakOq4YZnNzSzU55LT6rCMDhwDB
 UB_HC1rfykeYeiMC1c>
X-ME-Received: <xmr:0v_HYpsNoRM3to-p6XPca0SgE_EjaX3442I8ygxGp3EcT0nTxDcQNDBlk1Y14XCPQtMs0zj4xgPmj-d3zutkndWIg-_O2o48_TBVVZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0v_HYiZ5k0fIJ145D2xwpCZfHhq3qzSx1F89vgNuC5V_Rmx-obUz1A>
 <xmx:0v_HYoZ97tcCtPVNEGvj-xFQJgV9Uq3KSrqaNzBJyaF32TGIDe2aPQ>
 <xmx:0v_HYmBywKHVTavBRaVAuFzUlEq2XOedSsBwacpEZTZnrWLIGdz-vw>
 <xmx:0v_HYnyBkE_lWGzKCNgS4KoJCIWkb8y6g9qKqDxpatK6AkK8sdQGlQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 31/69] drm/vc4: dpi: Protect device resources
Date: Fri,  8 Jul 2022 11:56:29 +0200
Message-Id: <20220708095707.257937-32-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

