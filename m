Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A67847327F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C6210E79F;
	Mon, 13 Dec 2021 16:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8469910E7E1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:56:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D7EAF5C0050;
 Mon, 13 Dec 2021 11:56:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 13 Dec 2021 11:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=yNQYNQT3jqvyL
 hFPRBv6eif5kT68th4DGH6NTfW/I7Y=; b=NQFd5fQUJVgbGgpO0Vt3/r3R6KoPW
 3PlkVg+3Chu3WKnL7+M330JHOMLZgKi+m6R+jvaBKIaEDUbhultAjX14E1NeM0wk
 GWo5HCLzjCNDvzoaSVmL7PfZ3mE781QJBRmRU+zvidSboNIcB9y95CtCSQ0nbmp5
 cH1PmG8RVqvlRPL7/AEJirJ26Bb+SbhffyYe5m/CzxHhl/6x7AMzuanaWjMfOOaS
 wYgbnhaJEA7Z4XM5uizUF2RYGR4BhS48R+oEC6ET1gBg2uAq2zzVYgrFUd1q35p0
 1TP2Gj1KPcxIS1MP3dGRLo0epVzL80TxTCizFfJzDB+IdMZfiVRE2eTHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yNQYNQT3jqvyLhFPRBv6eif5kT68th4DGH6NTfW/I7Y=; b=UDzvKGtf
 a4aiGfGa0Qyia0C/Uv9C+LOAF+PtzX7htUOJz2/TfRl/KetP43W3t8JGCLeEFlmz
 mSVFQRBDs/vs9EU6VcIoD0aKflL2MnnphCSickHthBu+uS8OLtw1uS2FQgO+qcKP
 UNNScIQHRH/tLLFUyy2CoASjoIbDj3P27FnRs/v5TF3ED5El2bNY94FJohdsd15h
 DpeR0nN2OyymkH2FkWH8LfaQNOyN2Ri7i796A6wWV5d2cRGoWeG3wIQOl4VBTEjv
 Ioyj3escnxJ7cu4KQllmEc+RexB9FdmFa/WW1GC0najOy7iqs4cdGczedorgztyA
 Z2SK+H/r6hE8WQ==
X-ME-Sender: <xms:RHu3Ye3lsbJTf2yje_1YYYiLHCdjAN7OnZesLNDXzCnUchYjFyXlTw>
 <xme:RHu3YRHww67fqD3Qm6PtEK6GpEDCDpvg0hwFsIlttNLINbpx3bM_4cUX_6_O42DwX
 NSgFk3aUaxY3UYtEDw>
X-ME-Received: <xmr:RHu3YW7VKHihv_VoM7VFw12UjP8V717DsXx8Efj_VEBSPwkAf3RzrhKsNYdy87zRj0nOxTr2rlu3g_CAcnEH0N1EGByCC2gvZEndRCoT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RHu3Yf0fb0NOD9zldjvMNZjOxhR4ccz05AyjJ9S5p1SlXoYthL7OYg>
 <xmx:RHu3YRGxjawLSb-zlzusvT3uv2599dvBGJ_Bjf80VcWbQs5LDfz1HQ>
 <xmx:RHu3YY9G_D-Zl8dP7Aaabrx4NXyALvmqiEWoG2fK8aAQbEQYNw1SOA>
 <xmx:RHu3YXb1jwEUaPPsuAWl1DJ3GdlN9n-d_ecrwbO8AC6I93vBnAFObg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:56:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 1/3] drm/fourcc: Add packed 10bit YUV 4:2:0 format
Date: Mon, 13 Dec 2021 17:56:30 +0100
Message-Id: <20211213165632.255283-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213165632.255283-1-maxime@cerno.tech>
References: <20211213165632.255283-1-maxime@cerno.tech>
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

