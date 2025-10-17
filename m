Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD054BE94A5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 16:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93E988CE4;
	Fri, 17 Oct 2025 14:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ZiLm0CVA";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MD4O4tSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066BF88CE4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 14:46:50 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp7204LNgz9tLN;
 Fri, 17 Oct 2025 16:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760712408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4oFpQxCRPHPhxmrzbDq11iN7OoUPx8eSZeteuoKy5SM=;
 b=ZiLm0CVARzNN0e7ngM74Xu6tJJPP0/NV9ed/rn0Ezsghcycamn4u81C2lO0uWC8nq+y0mt
 loyi2/4EBcnRVPiTNZQHRPUjHJqKnD/RSeCA6zLOkYQlgMrRXDhT5avU/y2+/AGyH4ZCua
 tDZ7mQ39sIUxYeWBXSJg1d0MMZo/UzJYHie8eWamuWUHpRScJiezcSVo21qj6UUvpnQ0VM
 v2v2S9S2DK1RRF4UVTAegGMJb0jEDgtZHD5whhDSvbkYBlxUtq7Y4lG8XSniGfaUALCJXc
 hsibFEn1oThEd3BrL92Vj5Xv45R/uqloQ/ANncWL/QyaaotbKCtwugqBqI/SKg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MD4O4tSs;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760712406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4oFpQxCRPHPhxmrzbDq11iN7OoUPx8eSZeteuoKy5SM=;
 b=MD4O4tSslu4VlSY6X557bhCZg9XGb5jfB5TQiawNR3henZzMv4zqVsRN74XV+1BfKqnoDg
 lmQ6i94t5v6BdAlZPDAYjWrJ6uGJ7AcQZ4hB+wuaJUyHTN8nLrw1RcYnZjH2URhVK4gsx1
 vAImInPR3ik/5zMeYx035KwTY6yD6+50K8zevtW2DSndFRp/qpgrVmouEdKr8L6iaMXzpv
 jpcyXZa73XrP7R7DqGQc8kxvm11Zl5rBcCIAOtsT7wIwB/nr9JgrwW/BlJXvFHibi1cOb7
 tyAEpNJvWlML/zs3ifoKSiN6Nn5Yw5tR/A5V3Bo6Tc879O3nwuQhtW1u6MPotQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH] drm/imx: Add more RGB swizzling options
Date: Fri, 17 Oct 2025 16:45:38 +0200
Message-ID: <20251017144626.66918-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4pr7n6758hstwaphqgu7emsng5k8rkyg
X-MBO-RS-ID: fcef7ad647f09f2b715
X-Rspamd-Queue-Id: 4cp7204LNgz9tLN
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add additional buffer format swizzling options beyond XR24, the
hardware is capable of sampling other formats, fill them in.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
Liu, please test on MX8qxp , I do not have that hardware.
---
 drivers/gpu/drm/imx/dc/dc-fu.c    | 40 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c |  8 +++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 1d8f74babef8a..397af0e9b0236 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -65,6 +65,46 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
 		DRM_FORMAT_XRGB8888,
 		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
 		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_ARGB8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(24),
+	}, {
+		DRM_FORMAT_ABGR8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(24),
+	}, {
+		DRM_FORMAT_XBGR8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGBA8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGBX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGRA8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGRX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGB888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGR888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGB565,
+		R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
+		R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
 	},
 };
 
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index e40d5d66c5c1f..68d32b76fab95 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -33,6 +33,14 @@ do {									\
 
 static const uint32_t dc_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
 };
 
 static const struct drm_plane_funcs dc_plane_funcs = {
-- 
2.51.0

