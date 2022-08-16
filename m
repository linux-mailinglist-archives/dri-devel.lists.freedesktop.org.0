Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93792596A3E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 09:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0139B10FE34;
	Wed, 17 Aug 2022 07:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B213811B7C6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 13:10:28 +0000 (UTC)
X-QQ-mid: bizesmtp62t1660655421t8je3jh3
Received: from localhost.localdomain ( [182.148.12.144])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 16 Aug 2022 21:10:20 +0800 (CST)
X-QQ-SSF: 01000000002000B0D000B00A0000000
X-QQ-FEAT: ILHsT53NKPjhC6sTij/xeN8rhMmPWGvtPJWDYLMgqxtZVM17yqE/y8x0oYmur
 P3QNT5Z+NZ2Q7QT5l4tKEdo0LQ5FIjMBiHYQFqeRGLXgCYvv+5HrDPvVPYMO7AeYC2FQX5n
 n5XVMiCVIWdhxo1eP3QsY+fq8o79IPJMfNhkr9lr8DEgRvuEGlH9wfrkDNnY44bxKoK5myb
 wS3wZkQIS0ofdF2hcVsQsThYeFiGDiOE5arlFcm7csNcgcWYe7ec/znNS+g1N5WasmNvHB0
 paeFk/BJErwZyQGzBkdQu/qkJWHOKMnpNidV2BIUuCWfOHRcO1xK41gtBZqbyd34t8epPiL
 l4zgg5ap6dFjEPPNaKrfaMLwgtKLrfnGcMH8I2VjGz+cQ/gOobYAT3Gx2tVlP6NVIqmFHYJ
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: deller@gmx.de
Subject: [PATCH] video/fbdev: fix repeated words in comments
Date: Tue, 16 Aug 2022 21:10:13 +0800
Message-Id: <20220816131013.30643-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 17 Aug 2022 07:17:49 +0000
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

 Delete the redundant word 'its'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/video/fbdev/skeletonfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index 818b3a5003e1..f316ea320d29 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -97,7 +97,7 @@ static const struct fb_fix_screeninfo xxxfb_fix = {
     /*
      * 	Modern graphical hardware not only supports pipelines but some 
      *  also support multiple monitors where each display can have its  
-     *  own unique data. In this case each display could be  
+     *  own unique data. In this case each display could be
      *  represented by a separate framebuffer device thus a separate 
      *  struct fb_info. Now the struct xxx_par represents the graphics
      *  hardware state thus only one exist per card. In this case the 
-- 
2.36.1

