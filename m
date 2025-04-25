Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54157A9C68E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 13:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B044810E95E;
	Fri, 25 Apr 2025 11:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OMFSGv9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B8D10E948
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 11:01:56 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 639DA1461;
 Fri, 25 Apr 2025 13:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745578913;
 bh=tdd9lkiGoaVd6ucp66g4WEGJfe6pqa+nOOZgE8LvFtc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OMFSGv9O6cS1Hq8I8umwHQj8luFlpEFgBePOp20bpUq98WMoSzFVfT9dC8tY0YpDE
 VOvKJjmtz58or2tjDYl4Z7SZeIfVvs26+Br7ZZ/oMdF7rCPOncmzEtl99XLueCsmKz
 +3MTEsBi/Or5IGvcEdJZQ2hnkZjl9U2H6qf/Yqjk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:25 +0300
Subject: [PATCH v5 05/11] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-5-c74263231630@ideasonboard.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
In-Reply-To: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tdd9lkiGoaVd6ucp66g4WEGJfe6pqa+nOOZgE8LvFtc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2ubStUlMvUTWN2lQdY+G3N5uk8u9/eNnoz7G
 ijc00q48V2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrmwAKCRD6PaqMvJYe
 9YLUD/441Dd9YRCps+eJUZX/oONod0ns6gX6L8kLr1q/BvQ0dUPSyVqhytIyeeu8Elyth/cNGAM
 DJp2ZmLJPQ2lZsnFb1ezvbZGodz0aD6WdR7iMWheKIsp3q5qqkbvzgs1tisVtSmJqgi5tLUtPqr
 gkcnDW/spN9KZhoxVTwDu1kqacgNBhut3z3WmSrneg5lcokEys7bOFUg6juw04xdxBrRNnu7voO
 7ciVCR/30+N38TmI26LDPjRdtyJcfVGbPb/m4G8Y0Fq9Lf45cXsHln13SKz44kPkLwcThsHPTZA
 eZOzWFtmNQzcayfMvlUMTHkEV3I/56OMvhFALHcxZPXABb35+SyXFlYNitqpeT/CHKZ7WUyNeHS
 nhPB/m0fyifErsUXoAoGUfWkrdmuRzSpvyan1Rch1hh56FQPaD7TvtDOJ9fZIWxtqVFDEs5Vauh
 UVmGTI+IMmjdXT2t8ejkOHrHhMQGhRmsfwpUxYg6W2MFhf9y4769CWwWS3ruFmJStZApSH6Dnkg
 wBx8iOLRAIEM1hiVfYjRTg9ghUB7Pmo3hlXjB7l2SqSv/csjdFU6c3qpbMSEn6qUSRKLPaea+1C
 wyH18Sxydq8y65uvRPis3dC2+LCHlwz1ODakH6WMVro2IbfBTReop/rlpfm9dGAnP6edVlA5Thp
 XJReaH/blEK0+oA==
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

Add X403, a 3 plane 10 bits per component non-subsampled YCbCr format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e5f04f7ec164..60684f99f4a7 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -356,6 +356,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
 		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
 		  .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_X403,		.depth = 0,  .num_planes = 3,
+		  .char_per_block = { 4, 4, 4 }, .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index fceb7a2dfeb4..df3dbc36c26b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -385,6 +385,15 @@ extern "C" {
  */
 #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
 
+/*
+ * 3 plane non-subsampled (444) YCbCr
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

