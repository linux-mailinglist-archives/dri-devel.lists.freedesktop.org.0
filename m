Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D74754F9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFD110E241;
	Wed, 15 Dec 2021 09:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE5F10E24B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:17:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E28245C048F;
 Wed, 15 Dec 2021 04:17:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 15 Dec 2021 04:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=yNQYNQT3jqvyL
 hFPRBv6eif5kT68th4DGH6NTfW/I7Y=; b=OsPcsuDJ2+hCyYa921RvyUCKR/qyS
 ywjxb7DKI3TD81xfJhrOG4H21e67ZCW3zxInyTMYB7NoRiHt2PFo67rIZD0URW66
 qRRpJyjgziAwH4/moUQ9zWT9yWD7tW8qFrPTxEFPj4H+d73WmcwPuF5/VEza0riI
 19OAokgZGQktIPiVSqRmqEEbBriRfb/OPSwNL31fABESnNauExqm2lhHPtBoGggV
 NvnWF9dDVHF22cF8x3MoYj2JTN8scJmeRuGDn0shxsWNEymLLKwnFqx+aFQv8tq9
 okQmNcWubAWCUeqgVc0Vrt9NtGYDf8IeUM5gB0IiBBM6oBthaza8LDZIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yNQYNQT3jqvyLhFPRBv6eif5kT68th4DGH6NTfW/I7Y=; b=Z7TWu58z
 1hKwrFujdCFltU9ka0YS+5GOgDm2Z4H0mytWvyYDN1p1R3aOjFp1KAvXBW8JwbW8
 uTg8PvJyrmCYTWk4WQEbp1G0nWih+oYvGlKytGyWZexrMXiCcnnfJdL2VJDY/6+e
 BpJjxvdFTqak8AhJnXmR8fNm6pzqGq7ZnawV9Afjx0JsrCMcj1SpHGGzsYSMz8GM
 AxBINmKR8R3OwBLG+w4r7mYv7jkOUr2vrpFSY1yIxZc3Oi2TZMmEIcf++sOzKmT3
 ZqPwXQZ2W53eTXO1sE3LHyYDcy820ePvar6wmaFg3DJtVCXyId5Fz2E1kBtfyntI
 82kfYF5dReWJAw==
X-ME-Sender: <xms:urK5YZahQ0vyLc8UfZhWm0iB-uiT22LHtfgoMvo_64FuLgeA2DyIEA>
 <xme:urK5YQatNiGs1F4o4_HB_LVN0g0ibvcY3hj42Jg6beG_fUtD3qmqnmehBpe-AKUZo
 TnwuiehYpqopmMhdY0>
X-ME-Received: <xmr:urK5Yb9no_D9H-vMxn919BWlSXjXl77DTy0xbFl-ZQbZtd_Kzy6yuXCm4j_ebXjSFYKmIVMUJ4RF3NvVUbLcEMlv7nyZVTV_Q31WUpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:urK5YXoywM_78N7bqjOHVvzHuVhV4z9jx_aNRbbKMkoRUwczvOVVDw>
 <xmx:urK5YUre6rKYu9jPMHZ0A9x6BMkV2L1iGoGmvZ1OIx9_wMIf95IDPw>
 <xmx:urK5YdS91crMh4c3HcxXxa5kfznF8JpbBFTThVHL4kvOZNzO8f1EVQ>
 <xmx:urK5YQe-hzpP7Q1lhSmWgiHEr4xd19DGjgd_h82ybuNHJzeq1GomJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 04:17:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 1/3] drm/fourcc: Add packed 10bit YUV 4:2:0 format
Date: Wed, 15 Dec 2021 10:17:37 +0100
Message-Id: <20211215091739.135042-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215091739.135042-1-maxime@cerno.tech>
References: <20211215091739.135042-1-maxime@cerno.tech>
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
a 32bit word (with 2 spare bits).

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

