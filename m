Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A549DCB7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF2F10E5D0;
	Thu, 27 Jan 2022 08:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1309 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jan 2022 07:14:31 UTC
Received: from smtpproxy21.qq.com (smtpbg701.qq.com [203.205.195.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A30510E3DC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 07:14:31 +0000 (UTC)
X-QQ-mid: bizesmtp8t1643267659tsk8ug4cr
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 27 Jan 2022 15:14:13 +0800 (CST)
X-QQ-SSF: 0140000000000090E000B00A0000000
X-QQ-FEAT: dpyQmELDBxGvNdU0KB4Xg+n+Lv+9csg8IUk4o9MWAPMY5ySR7qLyOnQ9sTfn2
 JAbXJQVhjmHkMFGiOASypaYE9RHGJjDZGQYuRjYkJ0jz3riPJQodtwdqAuBiCgfeg2/ioUS
 ZetmAlPo0ZnCdtGODTYQ1QATtgMw+rDZ2f4Dq9FsVsFEMpNVCk+P6KJsqXzvHJovmV6hBbw
 FMwhNEwSI+h5D+e8u6cv7x8eF0OgAc6b3nka9DkSUP2Zpo4X/pRqZg4DRuHfbaviFYHheMQ
 Zx1Q9lan1shvbcT9X35TVA2cIBFoGDpONhPD+2YPrv3WNjDErU0FEkPSa+njS0abkywDO5i
 DYRVVvC9RK3MP7LEqJDZglWqohnrNLG8cIYw7zP
X-QQ-GoodBg: 2
From: tangmeng <tangmeng@uniontech.com>
To: jsarha@ti.com, tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tilcdc: Fix typo in comment
Date: Thu, 27 Jan 2022 15:14:12 +0800
Message-Id: <20220127071412.31021-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Thu, 27 Jan 2022 08:44:34 +0000
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
Cc: tangmeng <tangmeng@uniontech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace disbale with disable

Signed-off-by: tangmeng <tangmeng@uniontech.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 29890d704cb4..b986946b3b10 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -996,7 +996,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 	if (stat & LCDC_FRAME_DONE) {
 		tilcdc_crtc->frame_done = true;
 		wake_up(&tilcdc_crtc->frame_done_wq);
-		/* rev 1 lcdc appears to hang if irq is not disbaled here */
+		/* rev 1 lcdc appears to hang if irq is not disabled here */
 		if (priv->rev == 1)
 			tilcdc_clear(dev, LCDC_RASTER_CTRL_REG,
 				     LCDC_V1_FRAME_DONE_INT_ENA);
-- 
2.20.1



