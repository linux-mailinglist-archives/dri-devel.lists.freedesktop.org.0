Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D206F399BED
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 09:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138366F418;
	Thu,  3 Jun 2021 07:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with ESMTP id 37FA46F41C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=RnDVz
 AbO2cRJX+sWSzS+CpFRQSn/Oab2RiyOduZeFgU=; b=AgVkuWvuNfM0LQxunabmt
 7qeFD2MH8AZfOZrKJqbiEq54G5YmBP+f1zqVPQoT0havmn2Gg5qXgNECNXaSp4uh
 3T59J2qWamKzn/Aa5GKnBPzI5kYQRRRSimz/Ou665guQNCc1E172hfr3JnqfixnS
 VaI4lwU4kyFJv44wl1TFwo=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp7 (Coremail) with SMTP id C8CowAA3Xk5MibhgN5zUfw--.230S2;
 Thu, 03 Jun 2021 15:48:29 +0800 (CST)
From: lijian_8010a29@163.com
To: FlorianSchandinat@gmx.de
Subject: [PATCH] video: fbdev: via: dvi.c:  Fix a typo
Date: Thu,  3 Jun 2021 15:47:31 +0800
Message-Id: <20210603074731.49717-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowAA3Xk5MibhgN5zUfw--.230S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrurW7Zr43ur15GF1xXrW8WFg_yoW8JrW5pF
 WfKF95ArWYq3WkGrsrZ3W7WFy5K3WfJFZF9Fy0k34S9w43Ar4rWr1rAFy0q3yrXFy5JFyf
 tFW2yFWUKr1xuw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jX9NsUUUUU=
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbiEQ2mUF7+3kJKIQAAs9
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lijian <lijian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lijian <lijian@yulong.com>

Change 'diplay' to 'display'.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/video/fbdev/via/dvi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/via/dvi.c b/drivers/video/fbdev/via/dvi.c
index 13147e3066eb..ba1d9dbda99a 100644
--- a/drivers/video/fbdev/via/dvi.c
+++ b/drivers/video/fbdev/via/dvi.c
@@ -398,8 +398,10 @@ void viafb_dvi_enable(void)
 		if (viaparinfo->chip_info->gfx_chip_name == UNICHROME_CLE266)
 			tmds_register_write(0x88, 0x3b);
 		else
-			/*clear CR91[5] to direct on display period
-			   in the secondary diplay path */
+			/*
+			 * clear CR91[5] to direct on display period
+			 * in the secondary display path
+			 */
 			via_write_reg_mask(VIACR, 0x91, 0x00, 0x20);
 		break;
 
@@ -411,8 +413,10 @@ void viafb_dvi_enable(void)
 		if (viaparinfo->chip_info->gfx_chip_name == UNICHROME_CLE266)
 			tmds_register_write(0x88, 0x3b);
 		else
-			/*clear CR91[5] to direct on display period
-			  in the secondary diplay path */
+			/*
+			 * clear CR91[5] to direct on display period
+			 * in the secondary display path
+			 */
 			via_write_reg_mask(VIACR, 0x91, 0x00, 0x20);
 
 		/*fix DVI cannot enable on EPIA-M board */
-- 
2.25.1

