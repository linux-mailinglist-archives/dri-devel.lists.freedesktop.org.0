Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC020A7175C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C2E10E6C6;
	Wed, 26 Mar 2025 13:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eSYLKTt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E2B10E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:23:22 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D28D11D9;
 Wed, 26 Mar 2025 14:21:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742995294;
 bh=RuiwkWYkXDPZIyqS2srDTuseW4wRtdGOjSjDtskjiwI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eSYLKTt8O32894iqX/Hoqr49QlQLFyG0/wiGIdhT+9tiE+X9/X+LV9JRyMzzUx187
 snu2MfZWclN7MxmzCAjzGYwKLH0W4biifXKjjERNRWjfixwC8tyfwh/mpq5A9HJtcu
 KiaJbbhcZHk6rGZSuPbzIija54HQ91ivP6hnUg60=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:48 +0200
Subject: [PATCH v4 05/11] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-5-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=RuiwkWYkXDPZIyqS2srDTuseW4wRtdGOjSjDtskjiwI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//Bs2/DMsm0t+zsYTdQ7Dcu7n+xbEHvoo0jv
 I7PQSKvvUWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wQAKCRD6PaqMvJYe
 9VTOD/9jFgKgiTf0yGGG6QkDGvB2kB3FBx1D4T8EqaQKRDlJBrDiFvZiUnwrbwlrL66fMlHPBBw
 /Kkc3ysttJiQzXAS3L4QVnLV6k9X0atU/7ibDNZo55HERe3pNOOXCkRa+ZwVKSt9viL7oS1AVNM
 NpE15l3DGxqSp6Vxrj/T9EQdwsXFyQ1tS9NGYH9lf9Zbk6iPJ3DzlsVbf0tQSPyIIGkfeZFO9xj
 kUXudD+uNvYJn4XXl+hW4aXeUGVGxDfqJny8FblYXbhMl5WPLkdPk1r4PWIrwf/+3yaW4uyPJZO
 L1zzbeGTvrDam9gYqQhaZ2bO4LbIdYWp3+HIOVAJjqSkNlqm7SwYhToJUp8uqxa51VytWVbQvsP
 EEFJ2k6QqpeTGlFuaUKgF3gbedkXfTHGjvzTAg/3bke3BxWyEh3n2tUTyG/heshlbAQDafR6uJ8
 fIB7zUmpsjWm7gXWCm0ID+vfwyf/agz+6agZ2bSJZ2DO/H5rT9Szru3Kp57fH8hb9VBZbYsH88P
 Ykpow683tzybEeGhT30YmF+bNktP6IoPwWLMuXmgjRx8YWpHHJxqFavyIjmBvLhoT+BiRLWiZA8
 g1j25Dfk9PKQhNU6h4oe6vUDi+9GS+VA+n85Q96j7n4KOVYwcDWkRCGOH+fXd4ciBjdWpMKPzVn
 vFeC4HrV0kFgGyw==
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
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 11 insertions(+)

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
index f6316adbeb97..10d77f6f6e95 100644
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

