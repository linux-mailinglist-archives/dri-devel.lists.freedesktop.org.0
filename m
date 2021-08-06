Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600AA3E21F0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 04:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B187F6EB67;
	Fri,  6 Aug 2021 02:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C180A6EB67
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 02:58:04 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R931e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Ui5fk1-_1628218668; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Ui5fk1-_1628218668) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 06 Aug 2021 10:58:01 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: hjc@rock-chips.com
Cc: heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] drm/rockchip: dsi: make hstt_table static
Date: Fri,  6 Aug 2021 10:57:44 +0800
Message-Id: <1628218664-14230-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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

This symbol is not used outside of dw-mipi-dsi-rockchip.c, so marks
it static.

Fix the following sparse warning:

drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c:646:13: warning: symbol
'hstt_table' was not declared. Should it be static?

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index a2262be..12fa3db 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -643,7 +643,7 @@ struct hstt {
 }
 
 /* Table A-3 High-Speed Transition Times */
-struct hstt hstt_table[] = {
+static struct hstt hstt_table[] = {
 	HSTT(  90,  32, 20,  26, 13),
 	HSTT( 100,  35, 23,  28, 14),
 	HSTT( 110,  32, 22,  26, 13),
-- 
1.8.3.1

