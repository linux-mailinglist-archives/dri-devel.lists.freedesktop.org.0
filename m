Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A256534B04
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 09:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1871810EBF3;
	Thu, 26 May 2022 07:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com
 [203.205.221.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B12D10EBF3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1653551649; bh=UYm+Zzu0KW5HQ6B+dONAyaSiXcCUBm200sPlaOTCuCc=;
 h=From:To:Cc:Subject:Date;
 b=Jl+qZN1YIwznIlrwDwmfrtltxr7d4ofg+Jgz7g1jx37DUOm63vzNe0jnLTvs5+kER
 Eil+/6qVnYJqP2Ky1BgdUgpI7hHaa6coARhqpJmj1WNJecG365lbyF1qPvap4Mephz
 DpmYIswcypt/sXW2c6wDOKgKhtAjF/Rz0M6jAya8=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszc7.qq.com (NewEsmtp) with SMTP
 id D879029F; Thu, 26 May 2022 15:54:07 +0800
X-QQ-mid: xmsmtpt1653551647tmcnmnref
Message-ID: <tencent_B911291E6CAE98AAB4FAB36F70E58811000A@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoZqEVtNILMccamHt6PDPaUF72J5fSZ0Y5CmwbyXn9ml6CeA5C/7
 X9JrHQMYgyrIFZiZgkInydUVIK1dziXatVb7IaD9xpkvsnKfNXvFHp/9KxacHE1dgCYa72HOFFZH
 PScvOKR1W2IWu05gr9s0lJ6ztaWxcqXvvSyNUSqgbAeB5+xYGA2N6j6ZJz9WCpc7SglG1khc0GFa
 K1j64FepozGMXPshfT6BuzAt6DzlljwxMAm1DIfaJe8wgMk05hrmAPq6ZpV9fexoEx9Cvo5oNttB
 bBfErL43smkmLJiN62+czvhCyxF9LJRWLABgV7gwRUFZhtiVvNtnVPeTIt6CioXrL1CdaFiHrSTT
 6ay+cS+FxJp1nq2/lIPoOFuMQDsKV64j69fmSbtMDHmaBtbLBRuD2q9zpla3lSHdD2E0CLitevCW
 YwLv9U2sgezszhhc4orrym8lS7M9mO6PNoltk1O7IuTZ4wR3/8eeS5kE1KEMQ4qgonr41Rg5r3b0
 BejkgCYz9MX0RXs1Geo0vJUxHKQ54Mtl/XawKzm/c5G1XKU1ntW4Q5Ptt1OG9vm0EyO10/W2Y7MF
 EroTWfhgw06SLdmlnv3H8mzleplrHk/xUNl4w9XtNH9Muj29l17/adAznQijD2VcMFUTixQCgIou
 2qIcojkVgSAzkFV/O+aZBsZCYbc6bgF28GTcWAWBF+AdAtO4tx12CvT0Z8NYUwHmGUutJK1F37SK
 r6xCG0Yqiu7bO4KKtS6ocAPaW4wKcViMHnl9hyjCBNHR4dEoiN5vlfdMSZeZZ7QYbKa9KLRFb+Gr
 G3azmaLlkje9J1mHZ8hrhshbyQ7QulLGKhWEkKogrIJHC12abc689488u61zetQKtcUZ6NgeAjsI
 fMdGINKLz37776nLtkQmQ=
From: 1064094935@qq.com
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] video: fbdev: Fix spelling typo in comments
Date: Thu, 26 May 2022 15:53:29 +0800
X-OQ-MSGID: <20220526075329.1159476-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 pengfuyuan <pengfuyuan@kylinos.cn>, Mark Brown <broonie@kernel.org>,
 k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: pengfuyuan <pengfuyuan@kylinos.cn>

Fix spelling typo in comments.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/video/fbdev/controlfb.c | 2 +-
 drivers/video/fbdev/da8xx-fb.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index aba46118b208..50fdb373e92f 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -282,7 +282,7 @@ static void control_set_hardware(struct fb_info_control *p, struct fb_par_contro
 }
 
 /* Work out which banks of VRAM we have installed. */
-/* danj: I guess the card just ignores writes to nonexistant VRAM... */
+/* danj: I guess the card just ignores writes to nonexistent VRAM... */
 
 static void __init find_vram_size(struct fb_info_control *p)
 {
diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index ae76a2111c77..7acd495928ef 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -358,7 +358,7 @@ static void lcd_blit(int load_mode, struct da8xx_fb_par *par)
 	lcd_enable_raster();
 }
 
-/* Configure the Burst Size and fifo threhold of DMA */
+/* Configure the Burst Size and fifo threshold of DMA */
 static int lcd_cfg_dma(int burst_size, int fifo_th)
 {
 	u32 reg;
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
