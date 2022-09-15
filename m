Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D115B926B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 03:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4449610E257;
	Thu, 15 Sep 2022 01:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A15C10E257;
 Thu, 15 Sep 2022 01:58:08 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R701e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VPqLcxN_1663207084; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VPqLcxN_1663207084) by smtp.aliyun-inc.com;
 Thu, 15 Sep 2022 09:58:05 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next 1/6] drm/amd/display: clean up some inconsistent
 indentings
Date: Thu, 15 Sep 2022 09:57:57 +0800
Message-Id: <20220915015802.59967-1-yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clean up some inconsistent indentings

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2177
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 4e3356d12147..8dfe639b6508 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -1051,10 +1051,10 @@ static bool CalculatePrefetchSchedule(
 		bytes_pp = myPipe->BytePerPixelY + myPipe->BytePerPixelC;
 	/*rev 99*/
 	prefetch_bw_pr = dml_min(1, bytes_pp * myPipe->PixelClock / (double) myPipe->DPPPerPlane);
-    max_Tsw = dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) * LineTime;
+	max_Tsw = dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) * LineTime;
 	prefetch_sw_bytes = PrefetchSourceLinesY * swath_width_luma_ub * myPipe->BytePerPixelY + PrefetchSourceLinesC * swath_width_chroma_ub * myPipe->BytePerPixelC;
 	prefetch_bw_oto = dml_max(bytes_pp * myPipe->PixelClock / myPipe->DPPPerPlane, prefetch_sw_bytes / (dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) * LineTime));
-    prefetch_bw_oto = dml_max(prefetch_bw_pr, prefetch_sw_bytes / max_Tsw);
+	prefetch_bw_oto = dml_max(prefetch_bw_pr, prefetch_sw_bytes / max_Tsw);
 
 	min_Lsw = dml_max(1, dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) / max_vratio_pre);
 	Lsw_oto = dml_ceil(4 * dml_max(prefetch_sw_bytes / prefetch_bw_oto / LineTime, min_Lsw), 1) / 4;
-- 
2.20.1.7.g153144c

