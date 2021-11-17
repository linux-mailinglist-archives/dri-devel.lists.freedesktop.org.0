Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A846454838
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BD96E04A;
	Wed, 17 Nov 2021 14:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168EF6E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:09:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 356465C021F;
 Wed, 17 Nov 2021 09:09:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 17 Nov 2021 09:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=6EgSDgk7r3xWx
 zJWronK9iKKw8cfgLssmFfslCLiwCE=; b=Pph/k3PZpnZmiuWKPLrbtt+Vttoi+
 GeK7rVL5HrFrxifi8nBl8wifrIZA8EKW3Jw/ldG8MZLQg1/B/mF6kOoZEpHdk7Md
 Do69A9ufn/27+Ys+T6b/2q0C+53adsb0+MMsYFZH9kp6fcNqPj25blwKUdxm58BA
 Hnwa5nqJPnI7rF0nysoNZyv5aggvu14lpYBbF2Ma9dw+vGAeHPY+nXh/wvqCBmlN
 6cyahWxgh0vPLyUCPDMHFsURBNG0TAoBv8pGl9FV7NotvEfQsus9MwNvvBQoRZ0G
 DlE0wMo/snw+DBIP/13ylrtOTRrFBQyoKLhW3wPpR5I7vLCbPpEJJgyMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=6EgSDgk7r3xWxzJWronK9iKKw8cfgLssmFfslCLiwCE=; b=ZRg1Oatm
 QSGxKktw6svfAaMJgxly2UxN/w+8dKy6KKmdtlobudiUx3tJU6rkF1pZGeR7gXR8
 bX9BrISZTFFUbXY4d3fWY73xmTFrzpndd8Cyhda2Sl3F+qQI3KsGjvC7SJKnaGcz
 OisCYQLRIlKw4ngoq0quypxRYJSw797mI1M2zP2VIaWKmXX9zCVl3AliLm5L11F/
 2VUZ4lET4bqYx1+xaBYh9TzchLBO6OhcWqh9JfPATgBuOdl7zUoyJ2l5kWVTq0FR
 MWTf5mcg7xT4WWeNi0WuXBwKndhsDQSU+08ng/LYpq+X5HN/Vo03sDrkNuW3lEJJ
 EmFoqFXaroE2yw==
X-ME-Sender: <xms:Aw2VYYJ4-fRkyuCUzOyaDo03NZnbOX03PZt9W8xsDUTLIZ-2bVPZJw>
 <xme:Aw2VYYI3S4yZ2SPWFzXx6qd8CZKJrTfM19p_xKGEf7obhWB3WIP3ZT2th2u8VB7SL
 Sj9DZwWoAk0FCq_bx8>
X-ME-Received: <xmr:Aw2VYYvGHS9bNNCzFoE46NRsqwR7wt8BKXpNjz4F2Buwx5PAiJpD314mvRqcSW8Wp4FIntoQXDQ1Qr1RoCipBf6Gtwx0OahrVkUYhNdVGmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Aw2VYVbXFacgTjWn2FlWAXO-dYVBJt5lkIOt5NJWNy8PK7uxPkdGZw>
 <xmx:Aw2VYfa3TxfmBs1FG0PQuhlEa6WcuGxn09c63FejQEXCayW0GucXjQ>
 <xmx:Aw2VYRD05vduqz9B17iQd6wSAoJticLR7yVNFiKNim1z27iEPRqUgA>
 <xmx:Aw2VYdNnx4D9zIP726-vbZszVfj6Ya9T_JpdBWvsuwjhqNOn0rYgDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 09:09:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/3] drm/fourcc: Add packed 10bit YUV 4:2:0 format
Date: Wed, 17 Nov 2021 15:08:58 +0100
Message-Id: <20211117140900.313181-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117140900.313181-1-maxime@cerno.tech>
References: <20211117140900.313181-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
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
index 7f652c96845b..2e6d2ecae45f 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -330,6 +330,13 @@ extern "C" {
  */
 #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
 
+/*
+ * 2 plane YCbCr MSB aligned, 3 pixels packed into 4 bytes.
+ * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
+ * index 1 = Cr:Cb plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 [2:10:10:10:2:10:10:10] little endian
+ */
+#define DRM_FORMAT_P030		fourcc_code('P', '0', '3', '0') /* 2x2 subsampled Cr:Cb plane 10 bits per channel packed */
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y
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

