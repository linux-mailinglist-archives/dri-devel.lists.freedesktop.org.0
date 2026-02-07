Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBQ+HqFyh2nAYAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 18:13:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2C6106A13
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 18:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BA010E289;
	Sat,  7 Feb 2026 17:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sheTS8Dr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B047610E286
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 17:12:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48327b8350dso12842805e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 09:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770484378; x=1771089178;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AiB07MXR0w3Yv+4X7yqykGv069A3QBCCsoHEyXAvo3w=;
 b=sheTS8DrHHU8WyAlWWHkYN2TFMdfsdRksAFl3HaUIMGMPqQgJJyHL326pA7XADr7Wo
 9pyTCImNjU1tP4F7YFjbn5ygX4b6+UOfj9ZpcCH4Rgnpx3/0NeD1h+aUXLBoEuoBFeVS
 SWI3N4YprVwjG+qivpgnu1SIM/KeuF11aa4lCmbsE5wTfiUp74OOwOnc/fttrCWrwP/G
 vxSNjqD7FHGVR3qVTbPe3i2AYa4ORWhFxbQSFH08fdNYrb2TdTjekkdPUvVcO0kxYjok
 HwiwFrsBN9w8jZGFq5oiL7hGHEr5RK9A1vsLGkHSgY/LnO4TLARC3GBpVu3J8HFllCc2
 VfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770484378; x=1771089178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AiB07MXR0w3Yv+4X7yqykGv069A3QBCCsoHEyXAvo3w=;
 b=hWJHtN0UihtQ5ULDIUsoz0h6rmgPfLxIQ0+x9zS9Rz95PQ1LhwFw6Pw314s4bYpxaO
 tPe8RIeumWTkLh3s74N3JWq3KwPXlC8AhsApmyliTNbESDVbAeOVFijcxJwUXoaxPfdO
 5Bx+BvBr0QJiiSsZkoruZ7cSA6bup5O2m8PcVD8eZT5W1oMJgwrCcpvOD4REXKj/fZ1u
 RF2PSvdaq6rnyNVj8WcDTjV3t6SgihEACixS5yHgicPUbAAvp+kUDbdcriWMsJa/9f5b
 /dWTKiLUTlUnxm61/pqA3BaHNaiNP4DsXDt4XKpeT2tGqL8yQQqUVN73RLZZQ+tKnw+D
 Ug3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFHEFYc0I85OCFw+9VlSEkCSXasNzE4PwH4Ke2uqJmRTdh3nAODmYaLqhfAIrWzs95vQ1zHa8He/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuxBWFbp5/H558pXoEfymWyQcbOtXts2zdLaB4Aij8PD6/Y81i
 M82lyS3fCf3j/u5HRxF/URm/6FLojLR2TW5iRXceK4EXw56rb/lY4FxEjISICeqUhX0=
X-Gm-Gg: AZuq6aJc4cTIYWpeaOcvgbWI5VsrXMuhd+1KR9jKgUkvkLh4LogoF+/5sPrnfKv3GwX
 KkySNGUjUjthFIo5JxwHdAO/fCQzKk84CWaqqLfoc3uFQwfkavRr4hIBW740R+o068YXtdkTsjO
 z+ZHkzDHegGV07YYVkmbBVtTceCoUg/LfPBUcQ2/cv016/RZGM20bNJ8KVfilpmKAXGljKsthw1
 yTWeSSKPsL9ZS+CjFWfZPiDrlDe+J3R7yI4qj6dN9AHesB0KWabHC0qs7voAf4P79DogYG4a1/O
 1hkQSGvBr/JIY597KhjzuJOZbiysjxhM4LGF+YdxbIoDR36TDlg4U7VEmQjiKNh+p6lM7vJfeRq
 VrFT4y49X0gSnc4Qk3PYOu3c2fO7YH1ck+PGpPD2TeObFSJhF/RYnoMh5S2xcPtJ/nQ5DHIMzmV
 /Hi4lOuuVYbIJQN48m
X-Received: by 2002:a05:600c:5253:b0:471:114e:5894 with SMTP id
 5b1f17b1804b1-4832021c93cmr96031505e9.25.1770484378102; 
 Sat, 07 Feb 2026 09:12:58 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-483206cc543sm131926195e9.4.2026.02.07.09.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 09:12:57 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] fbdev: au1100fb: Make driver compilable on non-mips
 platforms
Date: Sat,  7 Feb 2026 18:12:37 +0100
Message-ID: <b894247689a7a920d9caa465dbcb840bca806cbf.1770483674.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
References: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=oZl+lgADvmA8kbyHw8foSoviF7bUk80UCdSGNLDQ4uE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBph3KM+wxlKuCbUdrARAzV28ZRbiKy3frerJonv
 /I4UpXIRLKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYdyjAAKCRCPgPtYfRL+
 TiZ6B/4rc42teJyAFRENb2o0jpzcl56hH0YTnc4/3umhyWIKJCIFARNgl2O8FiK35lJ+cM9Tphv
 Y+IODwwVqLpUDZGPaX6hgK8B9JilLVV6Kx9Q/sha3UJ3RjCye3LeS/37mocWhe5knb1l536Y886
 SgIwYTtFWvHi9hmPlA8/GGAO7HU8wOKegMVhR77vghyLMHiMJNAUeKkU9oAO1OBD0AUFU1LEUDa
 4FzqzGE8VSE0mV0VBls/9F02x6y2o/LkKMrCkb/M0EDQjqs8gAAy9pHFWN7Fxb5zLY5dpEMM6Xs
 z9WAmYUl0EP0EDr/jbz2kOsO1NfqR0c/KCd3/pwfUZquf7N/
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
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1C2C6106A13
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
index 45733522ff48..4514c42db9fa 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1345,7 +1345,8 @@ endchoice
 
 config FB_AU1100
 	bool "Au1100 LCD Driver"
-	depends on (FB = y) && MIPS_ALCHEMY
+	depends on FB
+	depends on MIPS_ALCHEMY || COMPILE_TEST
 	select FB_IOMEM_HELPERS
 	help
 	  This is the framebuffer driver for the AMD Au1100 SOC.  It can drive
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index a0e1aceaf9a6..758002cb5ea8 100644
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
 
@@ -331,7 +336,10 @@ static int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
 
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
+#ifndef CONFIG_S390
+	/* On s390 pgprot_val() is a function and thus not a lvalue */
 	pgprot_val(vma->vm_page_prot) |= (6 << 9); //CCA=6
+#endif
 
 	return dma_mmap_coherent(fbdev->dev, vma, fbdev->fb_mem, fbdev->fb_phys,
 			fbdev->fb_len);
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index dc53d063fcc3..998328cd16a2 100644
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

