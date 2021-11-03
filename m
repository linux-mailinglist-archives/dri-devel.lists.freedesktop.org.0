Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC1443E51
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 09:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92B072FE9;
	Wed,  3 Nov 2021 08:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 523 seconds by postgrey-1.36 at gabe;
 Wed, 03 Nov 2021 07:57:21 UTC
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFE72733BF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 07:57:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.128])
 by APP-05 (Coremail) with SMTP id zQCowACniO3EPoJhbM4sBg--.22692S2;
 Wed, 03 Nov 2021 15:48:20 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: marex@denx.de, stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Subject: [PATCH] drm: mxsfb: Check NULL pointer
Date: Wed,  3 Nov 2021 07:48:18 +0000
Message-Id: <1635925699-3414834-1-git-send-email-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: zQCowACniO3EPoJhbM4sBg--.22692S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4xJr47XFy7ur1UKw45Jrb_yoWfXwc_G3
 s5Xan7Wrs09Fn8Cr17AF18AryIyw4UZFs7Xr4Fg393Gw4fGw13Z34UCry5Zw17WFZ8ZFn8
 X3sFgFWfAr1IkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VUbhiSPUUUUU==
X-Originating-IP: [124.16.138.128]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Mailman-Approved-At: Wed, 03 Nov 2021 08:23:10 +0000
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
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As we see in the drm_connector_list_iter_next(), it could return
NULL. In order to avoid the use of the NULL pointer, it may be
better to check the return value.

Fixes: c42001e ("drm: mxsfb: Use drm_panel_bridge")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 6da9355..b875c11 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -145,6 +145,8 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	 */
 	drm_connector_list_iter_begin(drm, &iter);
 	mxsfb->connector = drm_connector_list_iter_next(&iter);
+	if (!mxsfb->connector)
+		return 1;
 	drm_connector_list_iter_end(&iter);
 
 	return 0;
-- 
2.7.4

