Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4638E604634
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 15:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB13610EF9C;
	Wed, 19 Oct 2022 13:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35310EF9C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 13:01:01 +0000 (UTC)
X-QQ-mid: bizesmtp78t1666184348tkal0dp5
Received: from localhost.localdomain ( [182.148.15.91])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 19 Oct 2022 20:59:07 +0800 (CST)
X-QQ-SSF: 01000000008000F0I000B00A0000000
X-QQ-FEAT: bYR630AeiPgeSG88wd+uuK4XXAGFBYeXJOCjpMt6lGpBpMMIWT04kA0B1I9Q2
 xvmo5eIdJhFHBN26U5C+Z4IM0z3qREVkqGmci8Zuwx3VYD0GOw7dJ7LoBpB+kNl6vdTJMkW
 v3E5YSoV/i2ROqMKXE+AdAtpdPvCAUq60D+qvvLU6UrVHu/KFMd73TXT+iGmBPBT+/3ivQu
 pMj2A3jw/9+EIjGDW0YTT6Nm7NIs+763jvtFTj3DP+/gzmA8JRUhX1kW5Z6Grl5zeT0n26Z
 7DAI+TjZJOzl0BjOS6ZpQVtJ8UTPZwYJ15WI8ZVxH3QPa035Dc1lknwOJn/Y+lPRPi0FSZl
 nqruNkRZmq326pp8XrAS3Q9jFoBhnIuMhy61+UtM3AOWXjYiE7yDssQLCpmWA/TXv4FVLfb
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: airlied@redhat.com
Subject: [PATCH] agp/via: fix repeated words in comments
Date: Wed, 19 Oct 2022 20:59:01 +0800
Message-Id: <20221019125901.56718-1-yuanjilin@cdjrlc.com>
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'as'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/char/agp/via-agp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/agp/via-agp.c b/drivers/char/agp/via-agp.c
index b2f484f527fb..2a4befd1c438 100644
--- a/drivers/char/agp/via-agp.c
+++ b/drivers/char/agp/via-agp.c
@@ -398,7 +398,7 @@ static struct agp_device_ids via_agp_device_ids[] =
 	 * by 3D driver which wasn't available for the VT3336 and VT3364
 	 * generation until now.  Unfortunately, by testing, VT3364 works
 	 * but VT3336 doesn't. - explanation from via, just leave this as
-	 * as a placeholder to avoid future patches adding it back in.
+	 * a placeholder to avoid future patches adding it back in.
 	 */
 #if 0
 	{
-- 
2.36.1

