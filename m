Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4F093BA72
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 03:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3292210E096;
	Thu, 25 Jul 2024 01:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="mzrfesd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BF510E096;
 Thu, 25 Jul 2024 01:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1721872648; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=hLBbEcnIh+1oprn+JujqfEAu3/3baKc5GVebY+RN8EM=;
 b=mzrfesd5aLDOJxX5mA9OI5VhkXvAGTgUEESGO8BBQ8Tdxnop8yQVMFjsjrcP+NMAmKqiQBf6Wxt4CIG6+vcYkn1ZIB1YfCftX0mB1N/fxib1Gxme+FWc0C45hwOjzYzbqdAKdHc/jU9Tker7oBiUEil22FCEd4crjuVfChU3z64=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R361e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033032014031;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0WBFtJ-M_1721872633; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WBFtJ-M_1721872633) by smtp.aliyun-inc.com;
 Thu, 25 Jul 2024 09:57:27 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/amd/display: remove unneeded semicolon
Date: Thu, 25 Jul 2024 09:57:12 +0800
Message-Id: <20240725015712.50237-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
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

./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:481:2-3: Unneeded semicolon.
./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:3783:168-169: Unneeded semicolon.
./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:3782:166-167: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9575
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 0b671c665373..e4a14d41fb85 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -478,7 +478,7 @@ static unsigned int dml_get_tile_block_size_bytes(enum dml2_swizzle_mode sw_mode
 	default:
 		DML2_ASSERT(0);
 		return 256;
-	};
+	}
 }
 
 static bool dml_is_vertical_rotation(enum dml2_rotation_angle Scan)
@@ -3779,8 +3779,8 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 			p->SwathHeightC[k] = MaximumSwathHeightC[k] / 2;
 			RoundedUpSwathSizeBytesY[k] = p->full_swath_bytes_l[k] / 2;
 			RoundedUpSwathSizeBytesC[k] = p->full_swath_bytes_c[k] / 2;
-			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
-			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
+			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
+			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
 		}
 
 		if (p->SwathHeightC[k] == 0)
-- 
2.32.0.3.g01195cf9f

