Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718BFBD912C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ACD10E21A;
	Tue, 14 Oct 2025 11:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Fppc6H5d";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eetYmZCP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF17D10E21A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:42:27 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cmC4f2p9pz9sw8;
 Tue, 14 Oct 2025 13:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760442146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dY2Qy1oLXlncM2wbx0m303ejw+R9m2mSN34h1ZTvrBw=;
 b=Fppc6H5d6pdqcHIUDwhsxOwv1CbX7/UYT0rbz2HKqP/MjIhnzDFbB4wEqmQ/EDu+BeTPT4
 8+IDE3iyU09AQORDYuO+xbvvNyHkuM4tnSd/5LFdBdmmrnGvi9YBzR9/z0OUIgrsdbHHEs
 21vUh7AMILYnIDBPSbYH6U+Fn30+sBxUXl3g+QrZbU2g19CV9gzH+aUv/vRwWM6XRKGUtA
 rQh1XOJLvPI5nLOsMgmNWTms0mg8HIg/kF4E1DMrMMcVaG8m5Trdp7IAhe01av26q+eyli
 tJSTy+wWSZS3Y627wqR4a6RFaZdNxnLrU+a6Qn4rqndvR08Jbtd/yN0ZK5hwjA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760442144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dY2Qy1oLXlncM2wbx0m303ejw+R9m2mSN34h1ZTvrBw=;
 b=eetYmZCPvTO+RPdeMGlNc/7HypD71CxFY8LXL8pKJdDXv3aB03rTH62QUqByCeHvsVxMle
 6J1k6CcUcUBQh39CI3uEFbW77PhU3iwamQjAJK9abJt6JPaJA/17W///Cnq5dcrHY2DWF2
 djUzBH+w/TORzddIES1jz87tix5wmmptwgH+5ZSHqzUmgOaX2Br2vuLhA8yIHzr5FPuF1e
 eoc4ptn6RRn0oNdHYuFUOIZJkmt+HaTAzat0lT7M++MSYDiW3PNqabIdS13OyFix6dB9g5
 oEnlA74r8nAXDopKls+Atvx+nbys12fuxloyMqj/eCbCzMmafd2LcEkOXLOaXQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: dc: Sort bits and bitfields in descending order
Date: Tue, 14 Oct 2025 13:41:07 +0200
Message-ID: <20251014114148.43922-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8e1b822faf7e4e01bb0
X-MBO-RS-META: k8cwxg7ug5w56m6nr4towkfpi7asn9rf
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

Consistently sort bits and bitfields from highest to lowest bits.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-ed.c |  8 ++++----
 drivers/gpu/drm/imx/dc/dc-fg.c |  4 ++--
 drivers/gpu/drm/imx/dc/dc-fu.c | 10 +++++-----
 drivers/gpu/drm/imx/dc/dc-fu.h |  4 ++--
 drivers/gpu/drm/imx/dc/dc-lb.c | 28 ++++++++++++++--------------
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index 86ecc22d0a554..d42f33d6f3fcc 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -15,12 +15,12 @@
 #include "dc-pe.h"
 
 #define PIXENGCFG_STATIC	0x8
-#define  POWERDOWN		BIT(4)
-#define  SYNC_MODE		BIT(8)
-#define  SINGLE			0
 #define  DIV_MASK		GENMASK(23, 16)
 #define  DIV(x)			FIELD_PREP(DIV_MASK, (x))
 #define  DIV_RESET		0x80
+#define  SYNC_MODE		BIT(8)
+#define  SINGLE			0
+#define  POWERDOWN		BIT(4)
 
 #define PIXENGCFG_DYNAMIC	0xc
 
@@ -28,9 +28,9 @@
 #define  SYNC_TRIGGER		BIT(0)
 
 #define STATICCONTROL		0x8
+#define  PERFCOUNTMODE		BIT(12)
 #define  KICK_MODE		BIT(8)
 #define  EXTERNAL		BIT(8)
-#define  PERFCOUNTMODE		BIT(12)
 
 #define CONTROL			0xc
 #define  GAMMAAPPLYENABLE	BIT(0)
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
index 7f6c1852bf724..28f372be92472 100644
--- a/drivers/gpu/drm/imx/dc/dc-fg.c
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -56,9 +56,9 @@
 
 #define FGINCTRL		0x5c
 #define FGINCTRLPANIC		0x60
-#define  FGDM_MASK		GENMASK(2, 0)
-#define  ENPRIMALPHA		BIT(3)
 #define  ENSECALPHA		BIT(4)
+#define  ENPRIMALPHA		BIT(3)
+#define  FGDM_MASK		GENMASK(2, 0)
 
 #define FGCCR			0x64
 #define  CCGREEN(x)		FIELD_PREP(GENMASK(19, 10), (x))
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index f94c591c81589..1d8f74babef8a 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -18,11 +18,11 @@
 #define BASEADDRESSAUTOUPDATE(x)	FIELD_PREP(BASEADDRESSAUTOUPDATE_MASK, (x))
 
 /* BURSTBUFFERMANAGEMENT */
+#define LINEMODE_MASK			BIT(31)
 #define SETBURSTLENGTH_MASK		GENMASK(12, 8)
 #define SETBURSTLENGTH(x)		FIELD_PREP(SETBURSTLENGTH_MASK, (x))
 #define SETNUMBUFFERS_MASK		GENMASK(7, 0)
 #define SETNUMBUFFERS(x)		FIELD_PREP(SETNUMBUFFERS_MASK, (x))
-#define LINEMODE_MASK			BIT(31)
 
 /* SOURCEBUFFERATTRIBUTES */
 #define BITSPERPIXEL_MASK		GENMASK(21, 16)
@@ -31,20 +31,20 @@
 #define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
 
 /* SOURCEBUFFERDIMENSION */
-#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
 #define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
 
 /* LAYEROFFSET */
-#define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
 #define LAYERYOFFSET(x)			FIELD_PREP(GENMASK(30, 16), (x))
+#define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
 
 /* CLIPWINDOWOFFSET */
-#define CLIPWINDOWXOFFSET(x)		FIELD_PREP(GENMASK(14, 0), (x))
 #define CLIPWINDOWYOFFSET(x)		FIELD_PREP(GENMASK(30, 16), (x))
+#define CLIPWINDOWXOFFSET(x)		FIELD_PREP(GENMASK(14, 0), (x))
 
 /* CLIPWINDOWDIMENSIONS */
-#define CLIPWINDOWWIDTH(x)		FIELD_PREP(GENMASK(13, 0), (x) - 1)
 #define CLIPWINDOWHEIGHT(x)		FIELD_PREP(GENMASK(29, 16), (x) - 1)
+#define CLIPWINDOWWIDTH(x)		FIELD_PREP(GENMASK(13, 0), (x) - 1)
 
 enum dc_linemode {
 	/*
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index e016e1ea5b4e0..f678de3ca8c0a 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -33,13 +33,13 @@
 #define A_SHIFT(x)			FIELD_PREP_CONST(GENMASK(4, 0), (x))
 
 /* LAYERPROPERTY */
+#define SOURCEBUFFERENABLE		BIT(31)
 #define YUVCONVERSIONMODE_MASK		GENMASK(18, 17)
 #define YUVCONVERSIONMODE(x)		FIELD_PREP(YUVCONVERSIONMODE_MASK, (x))
-#define SOURCEBUFFERENABLE		BIT(31)
 
 /* FRAMEDIMENSIONS */
-#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
 #define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
 
 /* CONTROL */
 #define INPUTSELECT_MASK		GENMASK(4, 3)
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 38f966625d382..ca1d714c8d6e6 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -17,12 +17,12 @@
 #include "dc-pe.h"
 
 #define PIXENGCFG_DYNAMIC			0x8
-#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
-#define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
-		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
 #define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
 #define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
 		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
+		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
 
 #define STATICCONTROL				0x8
 #define  SHDTOKSEL_MASK				GENMASK(4, 3)
@@ -37,24 +37,24 @@
 #define BLENDCONTROL				0x10
 #define  ALPHA_MASK				GENMASK(23, 16)
 #define  ALPHA(x)				FIELD_PREP(ALPHA_MASK, (x))
-#define  PRIM_C_BLD_FUNC_MASK			GENMASK(2, 0)
-#define  PRIM_C_BLD_FUNC(x)			\
-		FIELD_PREP(PRIM_C_BLD_FUNC_MASK, (x))
-#define  SEC_C_BLD_FUNC_MASK			GENMASK(6, 4)
-#define  SEC_C_BLD_FUNC(x)			\
-		FIELD_PREP(SEC_C_BLD_FUNC_MASK, (x))
-#define  PRIM_A_BLD_FUNC_MASK			GENMASK(10, 8)
-#define  PRIM_A_BLD_FUNC(x)			\
-		FIELD_PREP(PRIM_A_BLD_FUNC_MASK, (x))
 #define  SEC_A_BLD_FUNC_MASK			GENMASK(14, 12)
 #define  SEC_A_BLD_FUNC(x)			\
 		FIELD_PREP(SEC_A_BLD_FUNC_MASK, (x))
+#define  PRIM_A_BLD_FUNC_MASK			GENMASK(10, 8)
+#define  PRIM_A_BLD_FUNC(x)			\
+		FIELD_PREP(PRIM_A_BLD_FUNC_MASK, (x))
+#define  SEC_C_BLD_FUNC_MASK			GENMASK(6, 4)
+#define  SEC_C_BLD_FUNC(x)			\
+		FIELD_PREP(SEC_C_BLD_FUNC_MASK, (x))
+#define  PRIM_C_BLD_FUNC_MASK			GENMASK(2, 0)
+#define  PRIM_C_BLD_FUNC(x)			\
+		FIELD_PREP(PRIM_C_BLD_FUNC_MASK, (x))
 
 #define POSITION				0x14
-#define  XPOS_MASK				GENMASK(15, 0)
-#define  XPOS(x)				FIELD_PREP(XPOS_MASK, (x))
 #define  YPOS_MASK				GENMASK(31, 16)
 #define  YPOS(x)				FIELD_PREP(YPOS_MASK, (x))
+#define  XPOS_MASK				GENMASK(15, 0)
+#define  XPOS(x)				FIELD_PREP(XPOS_MASK, (x))
 
 enum dc_lb_blend_func {
 	DC_LAYERBLEND_BLEND_ZERO,
-- 
2.51.0

