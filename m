Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D6D68E61B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 03:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93A310E68A;
	Wed,  8 Feb 2023 02:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7979C10E696
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 02:34:42 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Vb9eBbP_1675823672; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Vb9eBbP_1675823672) by smtp.aliyun-inc.com;
 Wed, 08 Feb 2023 10:34:38 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: hjc@rock-chips.com
Subject: [PATCH] drm/rockchip: dsi: Remove the unused function dsi_read()
Date: Wed,  8 Feb 2023 10:34:29 +0800
Message-Id: <20230208023429.73696-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function dsi_read is defined in the dw-mipi-dsi-rockchip.c file, but
not called elsewhere, so remove this unused function.

drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c:362:19: warning: unused function 'dsi_read'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3984
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 7901c3babc8c..917e79951aac 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -359,11 +359,6 @@ static inline void dsi_write(struct dw_mipi_dsi_rockchip *dsi, u32 reg, u32 val)
 	writel(val, dsi->base + reg);
 }
 
-static inline u32 dsi_read(struct dw_mipi_dsi_rockchip *dsi, u32 reg)
-{
-	return readl(dsi->base + reg);
-}
-
 static void dw_mipi_dsi_phy_write(struct dw_mipi_dsi_rockchip *dsi,
 				  u8 test_code,
 				  u8 test_data)
-- 
2.20.1.7.g153144c

