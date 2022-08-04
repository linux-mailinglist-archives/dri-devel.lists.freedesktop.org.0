Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B372589C82
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 15:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EFB95517;
	Thu,  4 Aug 2022 13:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (unknown [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A385D9689B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 11:41:20 +0000 (UTC)
X-QQ-mid: bizesmtp67t1659613271t140a8dx
Received: from localhost.localdomain ( [182.148.15.41])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 04 Aug 2022 19:41:09 +0800 (CST)
X-QQ-SSF: 01000000008000F0U000B00A0000020
X-QQ-FEAT: +ynUkgUhZJmfUsNY6zyWY0zSIo92eFhWB88/1NsF7UywBdgFClzWaBKOcoifk
 alSqGnyAD6LCGZF9V+wwv0+ypevb1PjAfoZXzXDUb7M+6F3XS32c2N/52O091ahd4NzKUDP
 E72L061Po/ZHyln4wSEq1r2r6FurplUSDfyT/dICRdBpYQUE9mOwxOUc9lgIs4lHgWC8Wfx
 2uLwjgN6tpso8eZqexs4kXcdVxHfJCw7fPQySCDpGu6zYU9N6XFO/PEfk46amBi23ST5sGw
 GPfTt/C/LVvOfKKLjCcaEclBYitK6V5MXDG6Uhjik/HFt7qw/MnrQxrMZeX/5Bzt8QETmnW
 TM+L1sJyrO5bwgPDxvXL2tRXVFv4nMQH9ZA4Wzn18jeytmkuRcxifxohrrhhA==
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: thierry.reding@gmail.com
Subject: [PATCH] drm/panel: nt35510: Fix comment typo
Date: Thu,  4 Aug 2022 19:41:05 +0800
Message-Id: <20220804114105.41326-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Thu, 04 Aug 2022 13:20:57 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Wang <wangborong@cdjrlc.com>,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `the' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 40ea41b0a5dd..4085822f619a 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -231,7 +231,7 @@ struct nt35510_config {
 	 * bits 0..2 in the lower nibble controls HCK, the booster clock
 	 * frequency, the values are the same as for PCK in @bt1ctr.
 	 * bits 4..5 in the upper nibble controls BTH, the boosting
-	 * amplification for the the step-up circuit.
+	 * amplification for the step-up circuit.
 	 * 0 = AVDD + VDDB
 	 * 1 = AVDD - AVEE
 	 * 2 = AVDD - AVEE + VDDB
-- 
2.35.1


