Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD35B863E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 12:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7E610E8E9;
	Wed, 14 Sep 2022 10:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6E010E8E9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 10:23:28 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VPn2vp8_1663151001; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VPn2vp8_1663151001) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 18:23:24 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: deller@gmx.de
Subject: [PATCH] video: fbdev: arkfb: Remove the unused function dac_read_reg()
Date: Wed, 14 Sep 2022 18:23:01 +0800
Message-Id: <20220914102301.87981-3-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220914102301.87981-1-jiapeng.chong@linux.alibaba.com>
References: <20220914102301.87981-1-jiapeng.chong@linux.alibaba.com>
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
 linux-fbdev@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function dac_read_reg() is defined in the arkfb.c file, but not
called elsewhere, so delete this unused function.

drivers/video/fbdev/arkfb.c:322:18: warning: unused function 'dac_read_reg'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2155
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/video/fbdev/arkfb.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index a317d9fe1d67..5f8fec9e5fd4 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -318,14 +318,6 @@ struct dac_info
 	void *data;
 };
 
-
-static inline u8 dac_read_reg(struct dac_info *info, u8 reg)
-{
-	u8 code[2] = {reg, 0};
-	info->dac_read_regs(info->data, code, 1);
-	return code[1];
-}
-
 static inline void dac_read_regs(struct dac_info *info, u8 *code, int count)
 {
 	info->dac_read_regs(info->data, code, count);
-- 
2.20.1.7.g153144c

