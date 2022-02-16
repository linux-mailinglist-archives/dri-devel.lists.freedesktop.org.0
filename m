Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54044B8396
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5530C10E73A;
	Wed, 16 Feb 2022 09:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CAC10E71D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:04:31 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7534:e0be:5adf:2691])
 by laurent.telenet-ops.be with bizsmtp
 id vl4V2600c18GbK101l4VCJ; Wed, 16 Feb 2022 10:04:30 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nKGEf-000wtW-FS; Wed, 16 Feb 2022 10:04:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nKFqO-00CDww-3p; Wed, 16 Feb 2022 09:39:24 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux/fb.h: Spelling s/palette/palette/
Date: Wed, 16 Feb 2022 09:39:22 +0100
Message-Id: <20220216083922.2913515-1-geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a misspelling of "palette" in a comment.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/uapi/linux/fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/fb.h b/include/uapi/linux/fb.h
index 4c14e8be7267761b..3a49913d006c9bf6 100644
--- a/include/uapi/linux/fb.h
+++ b/include/uapi/linux/fb.h
@@ -182,7 +182,7 @@ struct fb_fix_screeninfo {
  *
  * For pseudocolor: offset and length should be the same for all color
  * components. Offset specifies the position of the least significant bit
- * of the pallette index in a pixel value. Length indicates the number
+ * of the palette index in a pixel value. Length indicates the number
  * of available palette entries (i.e. # of entries = 1 << length).
  */
 struct fb_bitfield {
-- 
2.25.1

