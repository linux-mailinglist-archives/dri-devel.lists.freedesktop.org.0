Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347BD9E36A5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E0110ECA9;
	Wed,  4 Dec 2024 09:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YAimj7nz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68EC10ECA6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:31:38 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 592F0157E;
 Wed,  4 Dec 2024 10:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733304670;
 bh=tvMPrDZtee9n82xo6aNU/4PQa7v5HzHr3u2kPTARj3M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YAimj7nzYQULQeidimnqh3H3OPPk/X99/EMoCvnDiFLidzDItFEYHZbVbX0VArFps
 7uDFveL75r5hx2mN2ZOC97wliYMGHVzJ/wcXexxGbOGK/YYGoMpAJ8bdy/VzCPISto
 YhbxPp3AxhXPgYCifSZt3FBPagnoPcwO2JcgW27k=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:05 +0200
Subject: [PATCH 05/10] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-5-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tvMPrDZtee9n82xo6aNU/4PQa7v5HzHr3u2kPTARj3M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFygysXkOjEMoy40hXOyiyvyWv/rkOZmGJNZ
 oS6zZYKsiWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcgAKCRD6PaqMvJYe
 9VIsD/oDLZF8H/FHcv6f7SUf7QmryZogfPRwUG0h3yAwM9HymRrbzwpDheUYCDmQkOzBb4oYwJs
 2q1htt2fXMOufdXbAGCJA3+rBT/6Pf2+4xPWNFVAyxWT3Qox8wk2/c1zfBHZxsioLumpDTzkwBu
 PGCAckYPjkyFCwXprXI4wj0B7NLdBULLhMz1Cj4JADP/+eaDnBw//4J+9zxC+yQE2/YdUw6Pga1
 vu1MPBu8r/Q/IBUt3aRA1GvBj6G8vKdf5p+V0CA3P5GjzvIDDIDm2if3aL6647BAu8KOoyu7MX5
 Qlamz+P/RYbp6dgeehWMx9uG3ZEEWbpmdtWmvIN8jFiM15idLIEWGabXmE7Pf/79p4ReLQTPkcL
 N0sjALOu1mbgRE6zzcqGyjrSXYAot7Ly2ZJDbG43iKCVU1TF+wP/qgrheLxpFqbk63yfQE/zYzt
 JLosv0gW5Iu1RUvPMxgPhdTZNLKLr93//BuS2tEa0KAL0tITqOUR4r4GYU1oiLXWoHtCmthfLd+
 /agfnhD/NKGO4uG6mV4NZct/35xzPKRD0FSWJTqIdQHFE79A+0dCVJNLlRjMME+Js5PRxLret0P
 0C2RdfCXaLEbw0K58Cu7W+fTFf0tcFrPEhIEc+gr432jLgF9yA8wZXJsxfzOPhlciq/6nkbe4Sn
 /tZS6FaumK2qzgw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Add X403, a 3 plane non-subsampled YCbCr format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 4 ++++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 6048e0a191dc..219113b5924c 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -331,6 +331,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .num_planes = 1, .char_per_block =  { 4, 0, 0 },
 		  .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 }, .hsub = 1,
 		  .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_X403,		.depth = 0,
+		  .num_planes = 3, .char_per_block =  { 4, 4, 4 },
+		  .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 82f255eb3d1b..097904407617 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -385,6 +385,14 @@ extern "C" {
  */
 #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
 
+/* 3 plane non-subsampled (444) YCbCr
+ * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
+ * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
+ * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
+ * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
+ */
+#define DRM_FORMAT_X403		fourcc_code('X', '4', '0', '3')
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y

-- 
2.43.0

