Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B18604617
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 14:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2B010F219;
	Wed, 19 Oct 2022 12:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE7D10E998
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 12:57:56 +0000 (UTC)
X-QQ-mid: bizesmtp82t1666184265ts1d409a
Received: from localhost.localdomain ( [182.148.15.91])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 19 Oct 2022 20:57:44 +0800 (CST)
X-QQ-SSF: 01000000008000F0I000B00A0000000
X-QQ-FEAT: k8Irs33ik7sILmaHIJIKazcpedYQTXSyVb7gcd1y8saozIYNH5bXRuhnQO5B8
 SWZ9upd814P4xShyibxu61MWNqCE8tch/gIjSZItSK0/xuHX4awzX672bkvgOXGzhe4vIkX
 RvejmXyU5Es4iw7TyTMNh7yFak8YB0eUd8pH5ajNJTF77j5d5lLdBU00yvQ2HHcQVmxzjH/
 4G3B/HzwGa4Je/LB/JW3rv7FIwybuXP0JrSU9QiCfVGHJ53Wta/9gTphZ9Eb6wkkds4CrS4
 f7TAdFrPppanMdIb4x3L7yTFytEOLJW3QcFIPJVCmcaid10Dl03duaerDT6isFmidbTFNF5
 E8JlTxslIHR2Q2Uo85eGpOuhSE2ojkhg8mro1igmXXsRUDL/h9OurpYGMDdIlnN7ley0iGk
 oNDHIOIswnM=
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: thomas@winischhofer.net,
	deller@gmx.de
Subject: [PATCH] video: fix repeated words in comments
Date: Wed, 19 Oct 2022 20:57:38 +0800
Message-Id: <20221019125738.54964-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
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

Delete the redundant word 'the'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
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
2.36.1

