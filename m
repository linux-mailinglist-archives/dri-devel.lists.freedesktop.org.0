Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BB61911A7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 14:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1636E48E;
	Tue, 24 Mar 2020 13:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7AB6E48D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:45:22 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200324134519euoutp023c410bf7946c28e3f60db8c62a3333d7~-QWpxPaEH2969629696euoutp02h
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:45:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200324134519euoutp023c410bf7946c28e3f60db8c62a3333d7~-QWpxPaEH2969629696euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585057519;
 bh=yXh2RcsZrYf2EbSKBQkmhmg+sHAmDch+gTjfbijzcbQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=neABOikZ4nqsjyc3v6hvgQtqmQ2T7Pn78RypvHTWVVwjUAvxGDZLNXV8t58n49P8H
 Wg9nZwftKX1VBfeCnc+qk1rBPCy73yrKhD+7j302fhWOJIkmuz5CBt8shrZjcsXF2j
 qIJXH8PVM/uuPdQliVV4SC0hGJmYuZmb4y2cePTw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200324134518eucas1p186a71391f432238701705559ec0af916~-QWpdBeby1322113221eucas1p1X;
 Tue, 24 Mar 2020 13:45:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C3.05.61286.EEE0A7E5; Tue, 24
 Mar 2020 13:45:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200324134518eucas1p16e1a39c14dfd101f5a6d86218a9e19af~-QWpKax371592915929eucas1p1R;
 Tue, 24 Mar 2020 13:45:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200324134518eusmtrp1d4ce6f0970fcaf01bbce7bfa205456c3~-QWpJuYsM2608326083eusmtrp1k;
 Tue, 24 Mar 2020 13:45:18 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-48-5e7a0eeedb29
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F8.56.07950.EEE0A7E5; Tue, 24
 Mar 2020 13:45:18 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200324134518eusmtip2036fcadcccc7c972512ce3d33fbd27af~-QWo2jwJP2918929189eusmtip2h;
 Tue, 24 Mar 2020 13:45:18 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] video: fbdev: controlfb: fix sparse warning about
 using incorrect type
Date: Tue, 24 Mar 2020 14:45:03 +0100
Message-Id: <20200324134508.25120-2-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200324134508.25120-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87rv+KriDP4cMra4te4cq8XGGetZ
 La58fc9mcaLvA6vF5V1z2CxW/NzK6MDmcb/7OJPHkmlX2Tz6tqxi9Pi8SS6AJYrLJiU1J7Ms
 tUjfLoEr48/E2ILdXBW3LvSzNzC+5uhi5OSQEDCR6JrXyt7FyMUhJLCCUaL/ViMLhPOFUWL+
 20+sEM5nRom/n6YzwrQ0/JrODJFYziixeco7hJaXC9YxgVSxCVhJTGxfBdYhIpAgsWL6DDCb
 WSBF4sOW/2A1wkDxXTNvs4LYLAKqEl2T3wMdwsHBK2ArsWBVOMQyeYmt3z6BlXAK2En0TjvE
 DGLzCghKnJz5hAVipLxE89bZYAdJCPxnk7h5ZCkzRLOLxJs3V5kgbGGJV8e3sEPYMhKnJ/ew
 QDSsA3qt4wVU93ZGieWT/7FBVFlL3Dn3iw3kImYBTYn1u/Qhwo4SxybNYQUJSwjwSdx4Kwhx
 BJ/EpG2gUAEJ80p0tAlBVKtJbFi2gQ1mbdfOlVCneUj8vjCBfQKj4iwk78xC8s4shL0LGJlX
 MYqnlhbnpqcWG+allusVJ+YWl+al6yXn525iBKaV0/+Of9rB+PVS0iFGAQ5GJR5ejYeVcUKs
 iWXFlbmHGCU4mJVEeDenVsQJ8aYkVlalFuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1
 ILUIJsvEwSnVwFiQk7ntVrlbz/ddR35I/7r7fcFM4XW738jsFEx0ufTJjL8+QmmfnMLRNr+Z
 zMHp5VHrZaJdlq4KZJUT8l2Vesx6gk2ezzIGlr0rt3zexF90uvdrg8dDdbv2RZ1KOqurTpyT
 dudck9sy3/igpr+Xd+DSKyerVtqbbeSZFTOpYWP+HZVt4tr765RYijMSDbWYi4oTAZkCy+An
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsVy+t/xe7rv+KriDN4cULG4te4cq8XGGetZ
 La58fc9mcaLvA6vF5V1z2CxW/NzK6MDmcb/7OJPHkmlX2Tz6tqxi9Pi8SS6AJUrPpii/tCRV
 ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv48/E2ILdXBW3LvSz
 NzC+5uhi5OSQEDCRaPg1nRnEFhJYyiix76xDFyMHUFxG4vj6MogSYYk/17rYuhi5gEo+MUpM
 P/sIrJ5NwEpiYvsqRhBbRCBJorPhJFicWSBNYtLZu0wgtrBAnMTaTYfZQWwWAVWJrsnv2UHm
 8wrYSixYFQ4xX15i67dPrCA2p4CdRO+0Q1Dn2Eq8W38cbDyvgKDEyZlPWCDGy0s0b53NPIFR
 YBaS1CwkqQWMTKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECA3/bsZ9bdjB2vQs+xCjAwajE
 w6vxsDJOiDWxrLgy9xCjBAezkgjv5tSKOCHelMTKqtSi/Pii0pzU4kOMpkA/TGSWEk3OB0Zl
 Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRq2KNUWX/bKZL4uf
 KWwPL1q3hUUlP7dz3qPMWVPKXn4p9XGOddJb/yeotYc763uVFXOLqcXPQ+3FixcdUi871W15
 YlnqcoOYNMPdS7q/1Kuxi1pff3o8YSVbQ1Z89pmTettkfO5oaSTdytcqCI4uPS0hfynRxaBE
 cd6B6jXr98m9eRSSMXGJEktxRqKhFnNRcSIAlQpAI5ICAAA=
X-CMS-MailID: 20200324134518eucas1p16e1a39c14dfd101f5a6d86218a9e19af
X-Msg-Generator: CA
X-RootMTR: 20200324134518eucas1p16e1a39c14dfd101f5a6d86218a9e19af
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324134518eucas1p16e1a39c14dfd101f5a6d86218a9e19af
References: <20200324134508.25120-1-b.zolnierkie@samsung.com>
 <CGME20200324134518eucas1p16e1a39c14dfd101f5a6d86218a9e19af@eucas1p1.samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 b.zolnierkie@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use in_le32() instead of le32_to_cpup() to fix sparse warning about
improper type of the argument.

Also add missing inline keyword to control_par_to_var() definition
(to match function prototype).

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/controlfb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 38b61cdb5ca4..9625792f4413 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -313,7 +313,7 @@ static int controlfb_blank(int blank_mode, struct fb_info *info)
 		container_of(info, struct fb_info_control, info);
 	unsigned ctrl;
 
-	ctrl = le32_to_cpup(CNTRL_REG(p,ctrl));
+	ctrl = in_le32(CNTRL_REG(p, ctrl));
 	if (blank_mode > 0)
 		switch (blank_mode) {
 		case FB_BLANK_VSYNC_SUSPEND:
@@ -952,7 +952,8 @@ static int control_var_to_par(struct fb_var_screeninfo *var,
  * Convert hardware data in par to an fb_var_screeninfo
  */
 
-static void control_par_to_var(struct fb_par_control *par, struct fb_var_screeninfo *var)
+static inline void control_par_to_var(struct fb_par_control *par,
+	struct fb_var_screeninfo *var)
 {
 	struct control_regints *rv;
 	
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
