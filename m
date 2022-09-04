Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BFB5ACA9F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838AB10E16C;
	Mon,  5 Sep 2022 06:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D90D10E0E4
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Sep 2022 15:55:40 +0000 (UTC)
X-QQ-mid: bizesmtp86t1662306931tqenw327
Received: from localhost.localdomain ( [182.148.14.80])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 04 Sep 2022 23:55:29 +0800 (CST)
X-QQ-SSF: 01000000002000C0C000B00A0000000
X-QQ-FEAT: cGHDSTRkEGTN3g6tOlY56dy8LcXEPHgjMg9VAeJ5rPJWyK4sTJG5tpbxhSQa9
 DcWyXh8LSrFj2thO/vu58b7YAf6yHy8TlMyFKvs3xLRfDHFWAzPapJd9l7TlADRHdf0pRmu
 W64ktJ0k9d49gzSZyJwSqKT4o05S5DZRH0CYDX/heuy7do30ex6STNrY98bHNges+qrrUOy
 tR8CpAZyKoWY2keR0gbROBICO5VvabQhhoei/BnDpWWDUU0SFdq55RC4R7T04IOrif2EHEv
 5Y4VddaaWXZyM4vkcgerg/iEI3cLjtzD7sxCMbQ4y+eGtEm4zxLCultX7HKj0aFqx6j99S2
 KDRw1KqlWbhrPaAvVAbN8Hl3f3VALHChMDqgyPrUqmocoveRj+Z0v2kWjqSEw==
X-QQ-GoodBg: 0
From: Shaomin Deng <dengshaomin@cdjrlc.com>
To: thomas@winischhofer.net,
	deller@gmx.de,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] video: Delete unneeded word in comments
Date: Sun,  4 Sep 2022 11:55:28 -0400
Message-Id: <20220904155528.28270-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Mon, 05 Sep 2022 06:28:39 +0000
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
Cc: Shaomin Deng <dengshaomin@cdjrlc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the unneeded word "the" in sis_accel.c.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 drivers/video/fbdev/sis/sis_accel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sis/sis_accel.c b/drivers/video/fbdev/sis/sis_accel.c
index 1914ab5a5a91..5850e4325f07 100644
--- a/drivers/video/fbdev/sis/sis_accel.c
+++ b/drivers/video/fbdev/sis/sis_accel.c
@@ -202,7 +202,7 @@ SiS310SubsequentScreenToScreenCopy(struct sis_video_info *ivideo, int src_x, int
 	 * and destination blitting areas overlap and
 	 * adapt the bitmap addresses synchronously
 	 * if the coordinates exceed the valid range.
-	 * The the areas do not overlap, we do our
+	 * The areas do not overlap, we do our
 	 * normal check.
 	 */
 	if((mymax - mymin) < height) {
-- 
2.35.1

