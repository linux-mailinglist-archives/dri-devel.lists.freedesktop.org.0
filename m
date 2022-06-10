Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C480546236
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA7811B2C8;
	Fri, 10 Jun 2022 09:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E0F11B284
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 521AF5C01C8;
 Fri, 10 Jun 2022 05:30:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853418; x=1654939818; bh=Eh
 8dbr0MI2TmXqk/aa+gvdcn9/fJUUyLqGZ+hE+dcD0=; b=M1Up5bgGLek4fzhdYp
 /BLRgE/lMxot6SzLFOOpkr8gZMpKYhzd5IBdoqaU2Y9ChhgIO22ePIHdfDKg6xMs
 1jzHTzD6YBuobNtAEmgbf/bGtwAHSAL2TdxD9BG8xYiOE9FMYoBVX5AppDh0RdML
 aG8N5QtZrvYuHv7s2cBmfwfhw7quF7GtEb7DrcMmKqeNLYosvuz+/TVIbWp2FBt5
 eQcRaGHSaoCd89U2YnWqeGaE1cglPOhdWOELR55sszaLSUHkWYUy8ibkojyV8wlM
 i73K+I0ih9d7ysKLgVqp/00iE5gKti/NaJT1K0hshjYPTKg4MnwqlBJp6a1A6WEr
 3QLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853418; x=1654939818; bh=Eh8dbr0MI2TmX
 qk/aa+gvdcn9/fJUUyLqGZ+hE+dcD0=; b=sSZFNQ15g1Ckq1655ODfNOVHUHsXc
 lIVFMTTpKdd412oLnzjizkDbznZocZiyzV17AcTYDXMVwbRto8e07RZm/S7TdWan
 JXLsIZUuiSettpXVUXZmU6BhEftjkQiyAETVe0QS48wZULhwGnc1VvUVOaQtd1cb
 6f0vpCb4o2g56bWg6fVwE3l4m3SlBah/jrzQjKy17IqyIkGnN54Dc//2eFPXNf/P
 T7INzkJYakjDlFNHO77G/W51ECJRxxC23Uwj2DPfbOi2cHqoUir1P/61vmAdzW/W
 C04acjRlVfXaDaqmms7E2qFYXMoOQ4DlpcH+x9itxjhHd6wpvaMQItphA==
X-ME-Sender: <xms:Kg-jYiHnFq5BGRCjFDb87-ycV6YkLNeTnFOkkSe2h_efgDSDoCcKSg>
 <xme:Kg-jYjUryqs1Y7HZYbvGHXd0CXPw67xcVXQAM5KPiW7YntKoV7TifEn3OW4JHcDxZ
 A3rCQMNErbl33gz0o4>
X-ME-Received: <xmr:Kg-jYsJbIoqSYJzdCpqvxDbB27l2HfdsUNT7_YjU3Hyr5Oi-BjrjHT3DEhQ0XTKqDz-wVr7Hj4JW8c7JAOY0tlctjYkti68_0gFi6DI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Kg-jYsHJzMbSac5MnhG07eSYiIkSTAfKIMD0PyGb1hLPGL3C0QQZDg>
 <xmx:Kg-jYoURpTqPaMCk_gUiuDnVlb2nMptRuVUpKTZFI1XXlydeNp7MyA>
 <xmx:Kg-jYvOPiEMieee8p5CAvGLCY-ECALug--NkdD3cVYArHPK3VVgQdQ>
 <xmx:Kg-jYmyfk7Xzs4ej-fSbkKYRc6oWS_D2nolcaGe1PIq8QE3jQyALFQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 28/64] drm/vc4: dpi: Protect device resources
Date: Fri, 10 Jun 2022 11:28:48 +0200
Message-Id: <20220610092924.754942-29-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 9950761449cf..ea3d20651f43 100644
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
 	u32 dpi_c = DPI_ENABLE | DPI_OUTPUT_ENABLE_MODE;
+	int idx;
 	int ret;
 
 	/* Look up the connector attached to DPI so we can get the
@@ -184,6 +193,9 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	else if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
 		dpi_c |= DPI_VSYNC_DISABLE;
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	DPI_WRITE(DPI_C, dpi_c);
 
 	ret = clk_set_rate(dpi->pixel_clock, mode->clock * 1000);
@@ -193,6 +205,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	ret = clk_prepare_enable(dpi->pixel_clock);
 	if (ret)
 		DRM_ERROR("Failed to set clock rate: %d\n", ret);
+
+	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status vc4_dpi_encoder_mode_valid(struct drm_encoder *encoder,
-- 
2.36.1

