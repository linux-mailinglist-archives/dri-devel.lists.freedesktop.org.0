Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0BB554274
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB51113897;
	Wed, 22 Jun 2022 05:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg136.qq.com [106.55.201.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F6610FC76
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 18:55:58 +0000 (UTC)
X-QQ-mid: bizesmtp81t1655837745tf77ccv4
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 22 Jun 2022 02:55:40 +0800 (CST)
X-QQ-SSF: 01000000008000B0B000B00A0000000
X-QQ-FEAT: OgQh5dxRN5wbavA1GfzuufKZqLUg4wAI9+JIV47vYKEuw9sHuek563x2EmWfR
 kUKQViagBIljkrsybiRSNkrMi6wkuyggXAxdkvDVJtwanDJJ8c8QRNHn2z1Ot0T9EvTHnPW
 M2UkZD8DJRDIA9R830uknoMgoCkgyQfYIXib8KN8Y43WCgQVDTgKM4pzuDn1YettdaXVutc
 0K/I0zkp+PKvgPqGjTXeEYgQhN7TwPhP3D910qO+BIQ9NKmMm4f/gSIGFAPwVp4FHM5WCPD
 DAtYyuHoD86E9umdDIYD668uz5v8lsQSQe7vZUuQ9d/ssCeeueTkIRukdpENqNDc6HfONnM
 kjmHDaXMESyv6oqCY0=
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: deller@gmx.de
Subject: [PATCH] video: fbdev: omap: Remove duplicate 'the' in two places.
Date: Wed, 22 Jun 2022 02:55:38 +0800
Message-Id: <20220621185538.6072-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
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
Cc: linux-fbdev@vger.kernel.org, arnd@arndb.de, tony@atomide.com,
 jmkrzyszt@gmail.com, linux-kernel@vger.kernel.org,
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

