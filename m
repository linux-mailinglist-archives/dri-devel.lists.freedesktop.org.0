Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIpqG+dXkmm9tAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3D81401C8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD2010E101;
	Sun, 15 Feb 2026 23:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HzV3l1UD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3694610E0CA
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 23:33:50 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-482f2599980so28751045e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 15:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771198429; x=1771803229;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uk53jnOeLmfvArEpFiciKSE6y7l3oB/rvlc5Pr3+3Y=;
 b=HzV3l1UDOVJsrD5HKpkBQdaj+xkwiqssJQxwXswcMddOpZYxMOJJydv+6JZhMvJ2WF
 lWP7f7PiJ+lAyBWvifTN5aVJw+HXNqxQYeyNW+q8/ocfZw4V+7H3ZvTkA/4pBXB3qaVV
 e9lY2/RIwJNLwFBPLebiXYgxnRtkhiGrFQBLsj/jHRxOCC5xVVOJPtExkdHMMOQpjtdU
 MTr2EI+fvNVUeoZYol+puUtVrShJdCbfJnYqG7QfvZqxZAf7syKw2zsOO6Bq5I4dQVOs
 0tm/BAZmAi6ytgCUIXazsVf0sOb71mCp+Gsl634N+KBvnljzIsTa6yVlD6+ZJUJeLme7
 8Gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771198429; x=1771803229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+uk53jnOeLmfvArEpFiciKSE6y7l3oB/rvlc5Pr3+3Y=;
 b=mpRraMVnR8IZ+ShtuZIkYJ+NfVNUZp2v6zntYIm6o4aa/ZkC8JcByuSqIIFDZzkw3j
 fX1IrD7adsqYmIV4QIqKCxj7uEIS6WmpbArmPcD27p4dhwsU01mUQFl40YULxWCZvvfv
 rnyU48JKooMe7+IlLAAOZLJ52LxG1AM7RcWachdhYsqf2JYW/UOh08c7EimgZWWRVoZT
 hUu1smo4bJqECUMvmcq+SSBcLo8tTeTRXyu/keULDraAJre04W7DaPv4Ripw4QpS2pQ4
 VJlmRWP5ehbHptv7+Pm5ouE9jLgWcOiK7qmGnEc0NFdKgjmp6PTcyjZk6tuJh/sl4yrg
 OtbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm2KjZaE3FuT1dptvLN9Ik9Kxcl1C8Rb/k2eiq3QL2V85H/OOWmdZOd5JSZvzN8RQWjcKJ6xW/tCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzX0gF6QtqN0flxhVkAh2aDJLE66Nmd0SKuUGrUVhqinpOHGBiu
 TymAcs/6ZplIOkBF0jDhCbx3Upxf6RDOFj/Lhlo4WPEc9HzyDbmEWXg4983lmuf5yec=
X-Gm-Gg: AZuq6aJlbpA8qZfVXH7BsR7TCxvOllIhPBC+pcWC6pRx540QTAvsUrvuJSeZLp8bsre
 J3nGIJv9Iqi6abC5qM2B6qTG/Hn5P6DTwf/m40QNPP5uan6EaYNRBTu/aA9A9kYY132jet7I71T
 zeEb+NebuQjlE1vZgsuJflwNWsTrc5JAqepcGl3+etUi7b84GCWF6GcrdUZj+NJ4RcMR9WtUMa/
 3dPyE/oWfz0Kuaow7iHIdgxATVg1IbZezzjhYXTPTDm1XLh6PvzK0QfKJQr6agOReKALLmWe3AF
 tj96twBmP8t5WQOorr9OkqTza1D4Ltk7SBw9Jj2enUoVmL7TcxaqQ/AnQMmJkX2epv0rzzU7OND
 4r6xs0Ni2muAF6DV38IQevaMPo6m4gZtLDQm2mqauSKPfi0KPpG2vF58Fs+dft9leJakAZLK2H9
 QYaEazM+0nbDugWUgJQwq9L24f8dTz
X-Received: by 2002:a05:600d:f:b0:483:7783:5363 with SMTP id
 5b1f17b1804b1-483778355a1mr130445345e9.26.1771198428685; 
 Sun, 15 Feb 2026 15:33:48 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4835d99497asm539810305e9.6.2026.02.15.15.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 15:33:48 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/7] fbdev: au1100fb: Make driver compilable on non-mips
 platforms
Date: Mon, 16 Feb 2026 00:33:20 +0100
Message-ID: <c858d7a655c5c984a03be813211e47952d963fad.1771198101.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
References: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2878;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=nodsy71+skdPZF7EJPJp2mOWEfyPOuOSUpcyMAifoE8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpklfHf6VCwf3tX/S+LU/WMTwKbeSksp6ifHEL4
 Ko4XVmBytGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZJXxwAKCRCPgPtYfRL+
 Tho0B/9qvhukL3iSwBk61XQHlxonw5P4wNdTyfGEN1nZTe+shcpBZLtIh8nAj1B14zKdEZ2aPg9
 WJNfZNE+r6xQjFJ1OP/VzxR3t5TdYiz2wRrOMWU3VaZaWYyG32m5FHcnfqSNT0SVr7VEWk+bVBV
 zhq5K97sEYcVFZjd621DxFJficmoX4CTVpIOi3nuQfZ6ccaSJDw6nZePJjU0Z+LsPrqVU2OR0ui
 sNyrCmTNIKlt7GxXRGWZwm7IeSMzOmsiwqZSCjJf2m0I01aThbHBbL6I6ZHlJDR6UxjksxYwJ6T
 fSoG2XzWgiBza1D3VZw7PEHxay7jo3IHzoxC1t0DM1sBmuBR
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 1F3D81401C8
X-Rspamd-Action: no action

The header asm/mach-au1x00/au1000.h is unused apart from pulling in
<linux/delay.h> (for mdelay()) and <linux/io.h> (for KSEG1ADDR()). Then
the only platform specific part in the driver is the usage of the KSEG1ADDR
macro, which for the non-mips case can be stubbed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/Kconfig    |  3 ++-
 drivers/video/fbdev/au1100fb.c | 12 ++++++++++--
 drivers/video/fbdev/au1100fb.h |  2 --
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 45733522ff48..ac9ac4287c6a 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1345,7 +1345,8 @@ endchoice
 
 config FB_AU1100
 	bool "Au1100 LCD Driver"
-	depends on (FB = y) && MIPS_ALCHEMY
+	depends on FB = y
+	depends on MIPS_ALCHEMY || COMPILE_TEST
 	select FB_IOMEM_HELPERS
 	help
 	  This is the framebuffer driver for the AMD Au1100 SOC.  It can drive
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 398375793f57..7611dad0d68d 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -42,6 +42,8 @@
  *  675 Mass Ave, Cambridge, MA 02139, USA.
  */
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -55,12 +57,15 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include <asm/mach-au1x00/au1000.h>
-
 #define DEBUG 0
 
 #include "au1100fb.h"
 
+#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
+/* This is only defined to be able to compile this driver on non-mips platforms */
+#define KSEG1ADDR(x) (x)
+#endif
+
 #define DRIVER_NAME "au1100fb"
 #define DRIVER_DESC "LCD controller driver for AU1100 processors"
 
@@ -332,7 +337,10 @@ static int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
 
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
+#ifndef CONFIG_S390
+	/* On s390 pgprot_val() is a function and thus not a lvalue */
 	pgprot_val(vma->vm_page_prot) |= (6 << 9); //CCA=6
+#endif
 
 	return dma_mmap_coherent(fbdev->dev, vma, fbdev->fb_mem, fbdev->fb_phys,
 			fbdev->fb_len);
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index b7bf6e005572..63aef2f52141 100644
--- a/drivers/video/fbdev/au1100fb.h
+++ b/drivers/video/fbdev/au1100fb.h
@@ -30,8 +30,6 @@
 #ifndef _AU1100LCD_H
 #define _AU1100LCD_H
 
-#include <asm/mach-au1x00/au1000.h>
-
 #define print_err(f, arg...) printk(KERN_ERR DRIVER_NAME ": " f "\n", ## arg)
 #define print_warn(f, arg...) printk(KERN_WARNING DRIVER_NAME ": " f "\n", ## arg)
 #define print_info(f, arg...) printk(KERN_INFO DRIVER_NAME ": " f "\n", ## arg)
-- 
2.47.3

