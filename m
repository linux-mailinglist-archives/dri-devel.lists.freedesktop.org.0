Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627FBA11CD1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8751B10E57A;
	Wed, 15 Jan 2025 09:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Dz8K2eou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D16110E570
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:04:01 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30B161590;
 Wed, 15 Jan 2025 10:03:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736931782;
 bh=VEG1ALEFNM1F93BsCWl8qDBhs0YQBurl0cCXuVBUBZM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Dz8K2eou1/Hmp8fkP5yZ9WLrsdhDWJQdEikjqJ/0bMtz0Hd7kDvW7DcXSp5HOnaED
 AhYWbEvRu815egQAnJfeV2NSoKArAw/eYflW5ylgbZx0m3bLhS+Kz9ivsGRp8JUAdb
 fswd6KXe8gRdSv6BC1QZnSJv6ilocTTLoD5GyitA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:33 +0200
Subject: [PATCH v2 04/10] drm/fourcc: Add DRM_FORMAT_Y10_LE32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=VEG1ALEFNM1F93BsCWl8qDBhs0YQBurl0cCXuVBUBZM=;
 b=owEBbAKT/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n5CbgjNwvK+aJXP/A81+nliKeov42UbIZ04
 zksUcVSn6KJAjIEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+QAKCRD6PaqMvJYe
 9VODD/jKELuauUo6+tNfgmVIAphb+SlBc+FIJtENPBhIv/FE8bHncNbGR342JtxE4ANPfJaHadD
 AylETZIafLcM+2JhY7SKpDSlkz5j8zcap+cllezIXfc4T6qMZ3q8XU90ZGwfjbssxcF+ckjCZOd
 OxBxwjiAxT6R1HLKhand0bufwvBJhFflSD6L8H56GPKt7LA+EVcL88TZlOt13nLvk10ZvUAQ9zm
 cBeMrQEBRrTOhzxQrKlHSfHTiyAitqDXN7ac/7yJV5HWsPFCjar1zz3H4TWWayIOY0/wRgEIbjl
 J55EyzYPUcOZU0ZkcXs4XSGy0SBZ6XXcTrZDWhi+91p54ltc+fGZyYIkL1UxE3q5a4yGYeJQ9sn
 qDzC66Y1e2Bdbld3l5bXkFyI2oNKzXVSpFieaNho0dpbLOj8j5Xv6HnlqsFSGKs68uLabEPPgVL
 h7bGP8bjGsJHC0Gt3Rrw9M7P9YW/9xmzBGBxHLwDcwKEWZmUvlmQdZ3+SvhhBW9FW9FmYPrelgC
 ICVdpuiqfgZkbEGPbXdStxWAMF0Mg4rFBSLd9V20Db9vLBpDs9KhlmZaj9T38Gpe3V8w2shWX/4
 q8OC81KlRh0oVV3cFqMPOBpdrBCazl+I+dcdn/0rk/UajGqZCV/ZqGr/nqoY2tfxlJf1SwW7uYZ
 YBgL8oW2RWgUW
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

Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
32-bit container.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 4 ++++
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index d721d9fdbe98..6048e0a191dc 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -327,6 +327,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
 		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
 		  .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y10_LE32,        .depth = 0,
+		  .num_planes = 1, .char_per_block =  { 4, 0, 0 },
+		  .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 }, .hsub = 1,
+		  .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f79ee3b93f09..03be2aa40265 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -408,6 +408,7 @@ extern "C" {
 /* Greyscale formats */
 
 #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
+#define DRM_FORMAT_Y10_LE32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
 
 /*
  * Format Modifiers:

-- 
2.43.0

