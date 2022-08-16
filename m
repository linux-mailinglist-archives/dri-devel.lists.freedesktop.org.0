Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA1D596A3A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 09:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE7210FE55;
	Wed, 17 Aug 2022 07:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE5DA9A77
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 13:07:30 +0000 (UTC)
X-QQ-mid: bizesmtp71t1660655241t7fl0map
Received: from localhost.localdomain ( [182.148.12.144])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 16 Aug 2022 21:07:20 +0800 (CST)
X-QQ-SSF: 01000000002000B0D000B00A0000000
X-QQ-FEAT: l4gSQpGTOtI0BKbfVAZxeeRY2o4rsA1a0pvReYuYto+AzVQKRo71QCbcqjKpx
 I/PcN2w109n/+rRkOZxFZq7em4kCCiJ5gnzwspaNRYubmGh3zLV79/IEI2m0f3ulCpGTsmU
 GnHsOgeem3jkwLsy51wqyhBXzADEv/sbOhFes8uZXwJKRl8wso7wH4hUwbI015g2lwEf6Ip
 HAApvn45wEUOGgIOH95BHmFCcaNKVnraxQUBlEo0S2gfBfxAxUmDrnzkM6+BAHzJRMYhzuY
 H3r3YQPLGyz+aeH9bwTg6DnbXAgls3a7Eg6qqKYHcGcmfP7j45GwfwspQaCpcYSF43ri6X8
 R6jjvuStlv9OBlYdF03PNxr4WBz+pNeYAnqlKs9P51oQxYnkLfYb11YtSQdpA==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: deller@gmx.de
Subject: [PATCH] video/fbdev: fix repeated words in comments
Date: Tue, 16 Aug 2022 21:07:13 +0800
Message-Id: <20220816130713.28597-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 17 Aug 2022 07:17:49 +0000
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
Cc: linux-fbdev@vger.kernel.org, Jilin Yuan <yuanjilin@cdjrlc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'set'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/video/fbdev/ssd1307fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 5c765655d000..52e4ed9da78c 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -450,7 +450,7 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 	if (ret < 0)
 		return ret;
 
-	/* Set Set Area Color Mode ON/OFF & Low Power Display Mode */
+	/* Set Area Color Mode ON/OFF & Low Power Display Mode */
 	if (par->area_color_enable || par->low_power) {
 		u32 mode;
 
-- 
2.36.1

