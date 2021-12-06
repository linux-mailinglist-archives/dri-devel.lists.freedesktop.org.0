Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AA74694AB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 12:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C600173759;
	Mon,  6 Dec 2021 11:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AE073759
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 11:01:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 24BAA3200E42;
 Mon,  6 Dec 2021 06:01:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 06 Dec 2021 06:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=O3ZaCzF3uiaQs
 dLmrwEBkmvz3VulhurD7dF6G1DfwV8=; b=gCvPMk0SZy0bqIHly38I/tFhOpGAf
 f6EmNsQedLBTCxkCLV4BED5cnDntC9esqfFqeVNn9Z3MRWoGt3hUxDiwNjeXtNZc
 08fcJJ/I/AmPjAHE8vQJ6N9A2xdCmDROA9B5eOZ9U0cbn8l/8SQEDpYDbQgWrDBX
 vknQZkiJTf0nzocTVWL2QqgQbR53NXR0j68l0rU1ghzkhwWpshGTpkBUlXARGsUw
 oRv6AQMJjTI8crPHlLVtIn/CF9aseOI8HC6oKMjKfQ1IYdx0fYTDb3lgvveGskEO
 zAW1Y1GxZtX3xz6kdC0lhlc+GExs8BJHR4FULB2Cl9TDebfJdnpX2qMSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=O3ZaCzF3uiaQsdLmrwEBkmvz3VulhurD7dF6G1DfwV8=; b=Se0vVHqw
 sDAf7kZB/SSsGF4CYvjV05UG4Bbay2Rqgv02IHgE5Mw7dHaJ3OItuqsEW4nctK65
 DVD7tP6AirQbKP27s/gYP4578RC6a3JPyduT3+mgWoA9F454fm7Y/hABj2GnUlns
 gyR5ELSqLrKdL4PtpDCxMhpBE2Z1FPkNMa8VNLopB2hM4DjwEWd5lttGP6WlQfDT
 cp9LEypITcCqBGcWabBcNNfQqMTXGfGOpxYpc1nE9r+QWsOVpwBY7k08AraCJFCI
 ko31gpZfvGbWj0Gus1i2VYS5fAXhMN4a5pPfh8gXdwZdbt5GtX5h31ixFOmS7nCl
 p9S/I1b8tr2i3w==
X-ME-Sender: <xms:m-2tYdT9veVNoYYCuhQB36gK7HJC3YnM_jnTCVfO1mSYQp-xOZ45Lg>
 <xme:m-2tYWynV6NJxUHsDKcEGxeFRwR84xQSAWDtDenuOvmz3Ge5erzGnDn5ZjLknk_3A
 FlYOXFhQk80potSd_s>
X-ME-Received: <xmr:m-2tYS2prUM0dC34Hz6GLYT1Pg8H1AFvjFGtiGusWmz3F4anASOlVON2XVT4zU1wn9BfafHknLHdKXRUFLVxsWYpaIriSJDrSXp5fRjki_ASNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:m-2tYVDiThdQweCFswErLNp9HBcp5K8r5r1kU6Vn1U_-bJQshPmePA>
 <xmx:m-2tYWgA7gkoxp1y2x4j2DwWCPAmIbLzw_FEwEHcROMn3R4R2Jlb_w>
 <xmx:m-2tYZo4eh96f6LWoTnXElyaoMuKx3nbfdyQhY0uDQ3EWxReJXU03g>
 <xmx:m-2tYfU2fUrNWXGNNdExKzL7V7vdyaX9q6PiPKDnxtrMilHtNjSnIw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Dec 2021 06:01:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 1/3] drm/fourcc: Add packed 10bit YUV 4:2:0 format
Date: Mon,  6 Dec 2021 12:01:38 +0100
Message-Id: <20211206110140.119650-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206110140.119650-1-maxime@cerno.tech>
References: <20211206110140.119650-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Adds a format that is 3 10bit YUV 4:2:0 samples packed into
a 32bit work (with 2 spare bits).

Supported on Broadcom BCM2711 chips.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_fourcc.c  |  3 +++
 include/uapi/drm/drm_fourcc.h | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 25837b1d6639..07741b678798 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -269,6 +269,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
 		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
 		  .vsub = 0, .is_yuv = true },
+		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
+		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true},
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 7f652c96845b..fc0c1454d275 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -314,6 +314,13 @@ extern "C" {
  */
 #define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
 
+/* 2 plane YCbCr420.
+ * 3 10 bit components and 2 padding bits packed into 4 bytes.
+ * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
+ * index 1 = Cr:Cb plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 [2:10:10:10:2:10:10:10] little endian
+ */
+#define DRM_FORMAT_P030		fourcc_code('P', '0', '3', '0') /* 2x2 subsampled Cr:Cb plane 10 bits per channel packed */
+
 /* 3 plane non-subsampled (444) YCbCr
  * 16 bits per component, but only 10 bits are used and 6 bits are padded
  * index 0: Y plane, [15:0] Y:x [10:6] little endian
@@ -854,6 +861,10 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  * and UV.  Some SAND-using hardware stores UV in a separate tiled
  * image from Y to reduce the column height, which is not supported
  * with these modifiers.
+ *
+ * The DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT modifier is also
+ * supported for DRM_FORMAT_P030 where the columns remain as 128 bytes
+ * wide, but as this is a 10 bpp format that translates to 96 pixels.
  */
 
 #define DRM_FORMAT_MOD_BROADCOM_SAND32_COL_HEIGHT(v) \
-- 
2.33.1

