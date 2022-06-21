Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA64552BCD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE64910F496;
	Tue, 21 Jun 2022 07:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg123.qq.com [175.27.65.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A3910F917
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 06:49:29 +0000 (UTC)
X-QQ-mid: bizesmtp67t1655794159tvdomlb5
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 14:49:07 +0800 (CST)
X-QQ-SSF: 01000000007000109000B00A0000000
X-QQ-FEAT: Jd++W0FxedFbCOgIqkryRVlgpglI3RiACg/Upg/4XQ4UW2GGHJ6LvdChpNRjD
 Xu15wWAwIZyH5VmlK1N6HVhvzrDuEfbpgJGB0jsSHLPpqDy+yqj7c63FJn33Q6OZ89dyn5J
 2I03ZSgEKtS9mt3de/55s/oBoQDgFPCZg5PItGAtjgSwZxaUgeCPmTj7xtuB52onN+idHlT
 P3av2Er27nUXaMl3ifYbsjVU79VWA/ao4wNTRnKbgkYSAsLtoYqjrftC5DCNse9HHlV+GpY
 ml5ETNxBSW4nQq+RP3bFVDVl9qTpcST5zJ6P9IYqpjfSLAdkLhlITDRr0wk5P80oyrXuKkT
 cyt3wwMqWiVtB1BJ5M=
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: deller@gmx.de
Subject: [PATCH] video: fbdev: aligned '*' each line
Date: Tue, 21 Jun 2022 14:49:04 +0800
Message-Id: <20220621064904.27644-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam8
X-Mailman-Approved-At: Tue, 21 Jun 2022 07:24:08 +0000
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
Cc: jiangjian@cdjrlc.com, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consider '*' alignment in comments

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c
index 6fbfeb01b315..170463a7e1f4 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c
@@ -143,7 +143,7 @@ int hdmi_phy_configure(struct hdmi_phy_data *phy, unsigned long hfbitclk,
 	/*
 	 * In OMAP5+, the HFBITCLK must be divided by 2 before issuing the
 	 * HDMI_PHYPWRCMD_LDOON command.
-	*/
+	 */
 	if (phy_feat->bist_ctrl)
 		REG_FLD_MOD(phy->base, HDMI_TXPHY_BIST_CONTROL, 1, 11, 11);
 
-- 
2.17.1

