Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7379F90FE5E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACC410E866;
	Thu, 20 Jun 2024 08:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="GFVwhq9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D345B10E84E;
 Thu, 20 Jun 2024 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1718871066; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=gLiv3pyD1fElUB0wAQIjj/qFPDkPz4q0no5seMRSoi8=;
 b=GFVwhq9v8AwXDI8sGyvgk9tgICkaugROqblE1QHhymgASGU9fn6sa9B8wKZqryYPEcCoGX8NcS5vaLx0RrW5of5JXZQ2c94yWPVQjEsAhsqz5svAqN+Odcpq3IyPkTUBh4p0A8L7MxXLyMq5gkLKUXSKfDi8O4pqpMlCmB43z3g=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033032014031;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0W8qf3Sp_1718871054; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W8qf3Sp_1718871054) by smtp.aliyun-inc.com;
 Thu, 20 Jun 2024 16:11:05 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/amd/display: Remove redundant code and semicolons
Date: Thu, 20 Jun 2024 16:10:52 +0800
Message-Id: <20240620081052.56439-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c:3171:2-3: Unneeded semicolon.
./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c:3185:2-3: Unneeded semicolon.
./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c:3200:2-3: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9365
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../dml21/src/dml2_core/dml2_core_shared.c    | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
index cfa4c4475821..1a9895b1833f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
@@ -3142,62 +3142,62 @@ static unsigned int dml_get_tile_block_size_bytes(enum dml2_swizzle_mode sw_mode
 {
 	switch (sw_mode) {
 	case (dml2_sw_linear):
-		return 256; break;
+		return 256;
 	case (dml2_sw_256b_2d):
-		return 256; break;
+		return 256;
 	case (dml2_sw_4kb_2d):
-		return 4096; break;
+		return 4096;
 	case (dml2_sw_64kb_2d):
-		return 65536; break;
+		return 65536;
 	case (dml2_sw_256kb_2d):
-		return 262144; break;
+		return 262144;
 	case (dml2_gfx11_sw_linear):
-		return 256; break;
+		return 256;
 	case (dml2_gfx11_sw_64kb_d):
-		return 65536; break;
+		return 65536;
 	case (dml2_gfx11_sw_64kb_d_t):
-		return 65536; break;
+		return 65536;
 	case (dml2_gfx11_sw_64kb_d_x):
-		return 65536; break;
+		return 65536;
 	case (dml2_gfx11_sw_64kb_r_x):
-		return 65536; break;
+		return 65536;
 	case (dml2_gfx11_sw_256kb_d_x):
-		return 262144; break;
+		return 262144;
 	case (dml2_gfx11_sw_256kb_r_x):
-		return 262144; break;
+		return 262144;
 	default:
 		DML2_ASSERT(0);
 		return 256;
-	};
+	}
 }
 
 const char *dml2_core_internal_bw_type_str(enum dml2_core_internal_bw_type bw_type)
 {
 	switch (bw_type) {
 	case (dml2_core_internal_bw_sdp):
-		return("dml2_core_internal_bw_sdp"); break;
+		return("dml2_core_internal_bw_sdp");
 	case (dml2_core_internal_bw_dram):
-		return("dml2_core_internal_bw_dram"); break;
+		return("dml2_core_internal_bw_dram");
 	case (dml2_core_internal_bw_max):
-		return("dml2_core_internal_bw_max"); break;
+		return("dml2_core_internal_bw_max");
 	default:
-		return("dml2_core_internal_bw_unknown"); break;
-	};
+		return("dml2_core_internal_bw_unknown");
+	}
 }
 
 const char *dml2_core_internal_soc_state_type_str(enum dml2_core_internal_soc_state_type dml2_core_internal_soc_state_type)
 {
 	switch (dml2_core_internal_soc_state_type) {
 	case (dml2_core_internal_soc_state_sys_idle):
-		return("dml2_core_internal_soc_state_sys_idle"); break;
+		return("dml2_core_internal_soc_state_sys_idle");
 	case (dml2_core_internal_soc_state_sys_active):
-		return("dml2_core_internal_soc_state_sys_active"); break;
+		return("dml2_core_internal_soc_state_sys_active");
 	case (dml2_core_internal_soc_state_svp_prefetch):
-		return("dml2_core_internal_soc_state_svp_prefetch"); break;
+		return("dml2_core_internal_soc_state_svp_prefetch");
 	case dml2_core_internal_soc_state_max:
 	default:
-		return("dml2_core_internal_soc_state_unknown"); break;
-	};
+		return("dml2_core_internal_soc_state_unknown");
+	}
 }
 
 static bool dml_is_vertical_rotation(enum dml2_rotation_angle Scan)
-- 
2.20.1.7.g153144c

