Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93EE554CCF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8DB10FD93;
	Wed, 22 Jun 2022 14:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg139.qq.com [175.27.65.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1860610FD93
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:24:00 +0000 (UTC)
X-QQ-mid: bizesmtp75t1655907764tjha88os
Received: from ubuntu.localdomain ( [106.117.78.84])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 22 Jun 2022 22:22:39 +0800 (CST)
X-QQ-SSF: 01000000008000B0B000E00A0000000
X-QQ-FEAT: b/pVLV+mlKip3G7p5FLUdccNhNMJGNap4tmjqxhQsmY+xlWkotZM0d0aqBK+K
 lJAMsTjUe7vE5x0D7DMB+Z4I7e+B119gs7RsRUdmpMIaYn4tpqGQ7ZfPHDmAdeJP5MUb5Fs
 fqa1CprKk/UvQ1Wc732uV4P4xekdtdj5srB6vm8kele1ici2Cxl+h24WY/l0CfWBFOdlTVW
 mCg6BlsjbaV+5dOLhVx6dvq0dj1ECq3gId17RKqk8YYGFMw3fm39eAzySWqS2aQocU+8z4x
 Wdiudtw2c3pUWTN/FaQ0YjRvTfVl4YkOMimfC/783BdOQjk00a/3lNerlSuOmvrkP3nekdL
 4hxxxcWz3qBZd2CP1plSquggDaFqg==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] gpu/drm/radeon: Fix typo in comments
Date: Wed, 22 Jun 2022 22:22:37 +0800
Message-Id: <20220622142237.11492-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam6
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
Cc: Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 Jiang Jian <jiangjian@cdjrlc.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the repeated word 'and' from comments

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/radeon/r300_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/r300_reg.h b/drivers/gpu/drm/radeon/r300_reg.h
index 60d5413bafa1..9d341cff63ee 100644
--- a/drivers/gpu/drm/radeon/r300_reg.h
+++ b/drivers/gpu/drm/radeon/r300_reg.h
@@ -1103,7 +1103,7 @@
  * The destination register index is in FPI1 (color) and FPI3 (alpha)
  * together with enable bits.
  * There are separate enable bits for writing into temporary registers
- * (DSTC_REG_* /DSTA_REG) and and program output registers (DSTC_OUTPUT_*
+ * (DSTC_REG_* /DSTA_REG) and program output registers (DSTC_OUTPUT_*
  * /DSTA_OUTPUT). You can write to both at once, or not write at all (the
  * same index must be used for both).
  *
-- 
2.17.1

