Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE490E4F6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 09:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CFC10EAB2;
	Wed, 19 Jun 2024 07:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LnNYC5Lg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3407310EAB2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1718783686; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=153sJGUDwz+Ma4rWOSNrBYcbULlbrmUWxTCNDx3aNXY=;
 b=LnNYC5LgI/V4tqPw91mimusWZdLEhQKmmJhdArpWeUfwKSrDtfXGzrkYKtnCFwaKODDy4PrUdsxMgzvdr9LIDNm0gnAQ77b096xnG6KzZsnTDYxcgN+kmu2lJa8KxPdNyGCJLn/e2AOlrzFfg/h/8SJ6KhLxKnz/zFholjDGcgg=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R511e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067110;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0W8nMtNe_1718783676; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W8nMtNe_1718783676) by smtp.aliyun-inc.com;
 Wed, 19 Jun 2024 15:54:44 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: laurent.pinchart@ideasonboard.com
Cc: kieran.bingham+renesas@ideasonboard.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm: Remove unused function rcar_cmm_write
Date: Wed, 19 Jun 2024 15:54:36 +0800
Message-Id: <20240619075436.86407-1-jiapeng.chong@linux.alibaba.com>
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

The function are defined in the rcar_cmm.c file, but not called
elsewhere, so delete the unused function.

drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: warning: unused function 'rcar_cmm_read'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9364
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
index 26a2f5ad8ee5..883b960e9acc 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
@@ -32,11 +32,6 @@ struct rcar_cmm {
 	} lut;
 };
 
-static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
-{
-	return ioread32(rcmm->base + reg);
-}
-
 static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 data)
 {
 	iowrite32(data, rcmm->base + reg);
-- 
2.20.1.7.g153144c

