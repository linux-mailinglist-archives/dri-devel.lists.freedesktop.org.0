Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6364554268
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAF211388A;
	Wed, 22 Jun 2022 05:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg139.qq.com [175.27.65.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B4810E27D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 18:54:30 +0000 (UTC)
X-QQ-mid: bizesmtp82t1655837655tbb8zg4g
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 22 Jun 2022 02:54:11 +0800 (CST)
X-QQ-SSF: 01000000008000B0B000B00A0000000
X-QQ-FEAT: e00egQTBacTlcDxwIZzv4cwiUY0YAZ5kptuyvGlLEHWQoXnT7viwCQeLnJBsD
 aCN96z90YuCSZ31/ZQsyYPNbZWAxLGT0d2iCvT20BTkHS1JA0E2DXKE3jB3tGm2drgSZISY
 Spf5wgKE2mL34i4Xkkwbkrjn1vyI9+PegpUGjy4cAamRlmmagAhBa2olMotGHtVILIZzwXn
 WY/y8nnWjzL2ZxqdIhwpgdptfgFTgIGY2GoBbTbbKkXMnU3z9RKrh0jVpWFzz1ufzmtqbQR
 92dYz0J/hhkMH+o3Dq/e4WtIQNNYCQAKE+gZjvG6ERpW13hxk2nRgMOo/9VLgRXZxKnmYb9
 +De5bvlNROZyY+MBq4=
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: deller@gmx.de
Subject: [PATCH] video: fbdev: omap: Remove duplicate 'the' in two places.
Date: Wed, 22 Jun 2022 02:54:09 +0800
Message-Id: <20220621185409.4859-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam6
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:39 +0000
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
Cc: linux-fbdev@vger.kernel.org, arnd@arndb.de, b.zolnierkie@samsung.com,
 tony@atomide.com, jmkrzyszt@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jiangjian@cdjrlc.com,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

file: drivers/video/fbdev/omap/sossi.c
line: 362
     * We set explicitly the the bus_pick_count as well, although
changed to
     * We set explicitly the bus_pick_count as well, although

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/video/fbdev/omap/sossi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
index c90eb8ca58af..66aff6cd1df0 100644
--- a/drivers/video/fbdev/omap/sossi.c
+++ b/drivers/video/fbdev/omap/sossi.c
@@ -359,7 +359,7 @@ static void sossi_set_bits_per_cycle(int bpc)
 	int bus_pick_count, bus_pick_width;
 
 	/*
-	 * We set explicitly the the bus_pick_count as well, although
+	 * We set explicitly the bus_pick_count as well, although
 	 * with remapping/reordering disabled it will be calculated by HW
 	 * as (32 / bus_pick_width).
 	 */
-- 
2.17.1


