Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 121CEA32949
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D2E10E8E8;
	Wed, 12 Feb 2025 14:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EvWUgpGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C746010E8E0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:56:54 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6108196C;
 Wed, 12 Feb 2025 15:55:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739372132;
 bh=SLMxDmiALWt+ezVaQr2cgceFWKVtJ/2zGn+XyPZTV/Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EvWUgpGXCzSg2TYZONLLRHNUlpXgPY+uBnbz1VR6wVfo6+VKgmdoNn+7/K8x5RG3O
 8T2oJB9ou5XDQz1OP2DTVsSbXHmfZ2BY62YyzBk+zI0XICwuKILg19AIaC6h+wjqc8
 ofDoSnxGbA6wEyBHfgpRk3xaTQAueq0CQxBtsbGc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:09 +0200
Subject: [PATCH v3 05/11] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-5-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SLMxDmiALWt+ezVaQr2cgceFWKVtJ/2zGn+XyPZTV/Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLaq/duQ8VCpeME8vpjSo6TOBzCN9hsAwJWsz
 a+ygeLSTC+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qgAKCRD6PaqMvJYe
 9ZPQD/9CbD3USTDGOb8HO4RH1Inbyx5zZ9rUuGku5DQ4n2YCZryPN77kQ8HS5a4MVITPShfu2zW
 69N721YwLctW2qVH7T/eGj26TDZ2b7P0d2qdEPxdZk37Bm+9730gs/CxxBfmXlAS8gM/OpEheAc
 ekkJ4W0UVByP9PZMsuHIa3FsAnvX6LRyrAWRNujk7Gh9OxOgYKE9U2Ig40k+AlPs3ktStH+wIpC
 +A+GpwzNI073ai3m5OjSQt2K93uJhtUXHbRTP2j+hoLkxzdoD7NFVVqat5L2QA+4Vq19U42MWT1
 Nya4633gg2wmWYzfDFeei0PLjlSKjqZJwPuMtIwgNtFCQZl4e2MFUhPSdrcLDnYVhfxNhsWn5Ce
 csYFPGjODmi1Ee6/ebJy7xuWnDSqepEK/re/RR2cXXDtBjKGaaHLQrY5mII0xZsM4AEOjhU91Hb
 8F/vzaFju4peoP1iwFvm22Sptgw9FtNR+XiqII/Wd08AAu+BxDAkeZBE6pCj+kwtEgrc2AU5beH
 Xcnm9u+r5WwJ7SrUuEiTFKZeNo3rNz8ylN9YauYEjD8AUytQexwZ82wpSzYjTRfWWHj+fatLQRi
 fp+gdgLoKou2vItGF/NC6j6AYnEpCGtf1ZBbVYN9DZbCklaQ1ejteRzxSAuSHpKlOpfKUMJ31iz
 ifpjCsKvYAWHhag==
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
index 155482d9a409..cc7e1ef4ef21 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -359,6 +359,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
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
index e87349d46325..f936cac2aebc 100644
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

