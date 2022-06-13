Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4025485C9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F82110E584;
	Mon, 13 Jun 2022 14:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F0C10E815
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 62E2F320091E;
 Mon, 13 Jun 2022 10:48:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 13 Jun 2022 10:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131714; x=1655218114; bh=9v
 e0FZgHMhIVEiZHAncRlXsNc5BBHr5t6sJWICzwfRw=; b=F/ms8Kc5z8Jy7WMILG
 JnceradVvySF/x8Bn3aIKm+iM1aT6DCRcMyVgMmn3a74bgBT5lsDstOEr9hsBUqm
 PjcRBB04zTHPjDyqZnRxJ3qJRFzFaXia8tquhxYWq6tJ41aBBBH1y0MYnEMZ/7Y8
 c+9/KQsVyg+iuOUngOomtgeZv/O0PMWNWCEgh/vI2Cg/HSLNxLYTpBbRy6XloGLU
 tVJ/9XsdwPoaGEUX6i+lf3Ic8mvo919kX8/29/T/SI8i14oY6nilwIr+IqkTLzSL
 cfEeBPW43K9Zgo9kGPkGM9L1ZzA5Iy7G2jZCbn1BCohDqf5P2tESxOuvwIr0PrCG
 OOtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131714; x=1655218114; bh=9ve0FZgHMhIVE
 iZHAncRlXsNc5BBHr5t6sJWICzwfRw=; b=pycP+XCVIMwUlr2GiywWy5/cmq6iD
 HVwqBnRibAmy8rdDvvtUAPLgK1MC1E4NFTOrwuQIif3fHbw3vCgTuuNx0zuko1oF
 H/CdWjkwXCGa/v8ZTmTS+oJTZKMswfx4RYIf0dKsV6k0/xvvmA05TxJou/P4g2g2
 jMxWkRpygUOedAR36mqPbZP1qig07RT7W61u5k9B0/p8OwAgFNV11Pa8DK3wzkv9
 ENLrM7knUwXsU6dDyRNVRipTIQeI5Qmupo5JO5b8IgxUGEfNCydjRuEQzgKmyaeq
 XfIzQrbPC5OEQZuiDUjFW7ElDZutrQgpkP/BmE6+U/d7ij4zzC9IEPVyg==
X-ME-Sender: <xms:Qk6nYtbUy3bctUAZ2y2c8PfCWGcdpVMnPllyo-pfc84LnciCxHKy9Q>
 <xme:Qk6nYkb_P8cmHoZZcXLDm-xSKpxUxs36r5VgDzBSYcEdT1bs8LxYs4yKNfVuAMe_E
 hLXjgSFGlinANYWW4g>
X-ME-Received: <xmr:Qk6nYv_sgFUdFy1QjtDY321P6frpUHjjyI1wVtV3IVEoGu2LghlOJvM8r-jpKn2A6SPTcuwGZ7_HkVTpWpFNgVdWcIsrSjtzPQ4-VaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Qk6nYrpuyR664mmhWksoCk2QQGv5igUz0i1ea8VDp6GGRA1aYZj7fQ>
 <xmx:Qk6nYooF-7BWDwyD_nBg-3pxL9eKvMb1GZdmKaxDDvmQB_BCAJQGhw>
 <xmx:Qk6nYhT0-SlTNEZhMwQPAK8hsNedK8T8E2_WoH1ODLashpLwGpFTiA>
 <xmx:Qk6nYtDCzHBRkIA6DWZsFx2S9K317XkiQHU_s5SdfBnK_Qcigd2JaA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 10/33] drm/vc4: dpi: Ensure a default format is selected
Date: Mon, 13 Jun 2022 16:47:37 +0200
Message-Id: <20220613144800.326124-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

In a couple of error/incomplete configuration cases, the
DPI_FORMAT bits wouldn't get set.

Enforce our RGB888 default in all these cases.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 695b759db9bc..44355b347ff2 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -148,10 +148,15 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
+	/* Default to 24bit if no connector or format found. */
+	dpi_c |= VC4_SET_FIELD(DPI_FORMAT_24BIT_888_RGB, DPI_FORMAT);
+
 	if (connector) {
 		if (connector->display_info.num_bus_formats) {
 			u32 bus_format = connector->display_info.bus_formats[0];
 
+			dpi_c &= ~DPI_FORMAT_MASK;
+
 			switch (bus_format) {
 			case MEDIA_BUS_FMT_RGB888_1X24:
 				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_24BIT_888_RGB,
@@ -187,9 +192,6 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 
 		if (connector->display_info.bus_flags & DRM_BUS_FLAG_DE_LOW)
 			dpi_c |= DPI_OUTPUT_ENABLE_INVERT;
-	} else {
-		/* Default to 24bit if no connector found. */
-		dpi_c |= VC4_SET_FIELD(DPI_FORMAT_24BIT_888_RGB, DPI_FORMAT);
 	}
 
 	if (mode->flags & DRM_MODE_FLAG_CSYNC) {
-- 
2.36.1

