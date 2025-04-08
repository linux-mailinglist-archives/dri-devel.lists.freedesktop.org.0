Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C6A7F6A9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D0D10E1A4;
	Tue,  8 Apr 2025 07:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XNB0RIlT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3760910E1A4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:43:01 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso48297065e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744098180; x=1744702980;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UnGRyek4b0Q9O6DVrKIv8GSHSuD+kexCPo4NSS6OhDg=;
 b=XNB0RIlTmNB5UoCg6WW7GEMz9zXXTvpCP5VHhgHZ5mjXXOczhLylULYTzq/jIHtmIB
 qla0jZIp7yncgPI3DGXDP1k+x97nkd0Apv1OSCJJh+z0UsALBid5gQhpcP67MLMyEdXf
 JGnXYfauAZBf7qwDAZfQfOGpgYp6fWVUNJlT6zMUHg51lgOxvOnYWGTiSxnFsMo96CHX
 22PmV4uTwdFJp+pnhzjAwEpy5Y83vymWlK1nBVSgC36YVIbQZW9vUvtnwgZtam8Zq21i
 Hy5tryPgVisZhBP6ngnloM1L+2HjbTjYgZGogvf3LBdemFSKKvpdZkfvDllNKqn5YJej
 ONvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744098180; x=1744702980;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UnGRyek4b0Q9O6DVrKIv8GSHSuD+kexCPo4NSS6OhDg=;
 b=dpoG+jF4GG+WetTIkeYnMQxiNEployojanwEjhQwDo3d/grzepNJJKRkckqhWjwm9C
 vXm4lI3irFtyiWMo/K7JvJ/EivppO0cWYWy1ix5liy8Ou8/uG0Bk5c+lX/eL5b6iINbh
 CSzk7pbln7GawkjQtLgfH7tIQLFDnPDTNeny+QW97qDdRhym/YkARVg/DtP3o5S/FO9h
 lhSv0qGuerZPYc6qgDw2pJBe41rPSQb6ZDptPhrFdWTc8a3JdT1Qlg0dOx+Lt/D/3YdV
 jG4H1yD7LWJe0ElnmIXf+ypi5lUT4PXW0aKC1nlQA2vjZ8mFml7KXCzhL4ZzN2r+iwGP
 6rKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/1yBSEWFqLhlqUPDks4k1H0iTnQ6KrIdvhn3hnCliuM6JLgTi1Ysdt3xciwCvtvM+eFZ3w+zzaLc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxnkx1lWs5myiyTTlr8rtcdoL/TwjOa6Bx25Ag+4RIOfPoqC426
 Gc+aS+g7omcmIZQmtAxxrNhYvK3pA6qXk98ihoOW7nrtk2LTMLGMxPW0rf9QyaA=
X-Gm-Gg: ASbGnctiBIRYD/aG9ux7E6WLVZmhyeJk+u/4gs3/ZhenTeFTgXICDTo/ZhpOxHOX1VC
 XC7udugTckiIKxxnvOrkxLUBx5DtQ6MACH+sLbozyeN4NxAFJZWqhI76377QmRPLAeZArhMc8kl
 28n3rOxA5tlJmt9PLn97Qf86fTo+rOJdn1C6O4UpdILO3NdTmZ2WlwlasG1Jy990pZ7FB4zCwus
 fydYvzqnU4ly4Yq3eIEuSpnxrrhA7/UZvfHxz28M1PEsJUql9Pq6PKldE9leY5A1a+I7PocwH/b
 kkYEv8PGXgtuQTrIoJLEFVp/QEHiagcWXVTxog==
X-Google-Smtp-Source: AGHT+IGL45iV9q8qlh/Y51nlH28fz/uo5n75LAnwAcUwjWWcmy/4Xz7sdy2C72SYXaCiAiCukmgEsw==
X-Received: by 2002:a05:6000:2285:b0:391:3049:d58d with SMTP id
 ffacd0b85a97d-39cadc85ab6mr13296226f8f.0.1744098179869; 
 Tue, 08 Apr 2025 00:42:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec3174cf0sm157870225e9.0.2025.04.08.00.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 00:42:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:42:56 +0200
Subject: [PATCH] fbdev: via: use new GPIO line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-video-v1-1-200ea4d24a29@linaro.org>
X-B4-Tracking: v=1; b=H4sIAH/T9GcC/x3MQQqAIBBA0avErBvQrIyuEi2sppqNioYE4t2Tl
 m/xf4ZIgSnC3GQIlDiysxWybWC/jb0I+aiGTnSDUEri5dntN3uM9GBImPggh+N2ymHqjdFaQG1
 9oJPf/7uspXwfzH8VZwAAAA==
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, 
 Helge Deller <deller@gmx.de>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2107;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yngfshF14pwSvzrYSNhyzUkMWDnjaEIdy0M4XDuzgqM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NOAFPzoYiBfJTd1dvJSY7THpbhM5Nui3ZcaB
 ywwwKbK9XSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TTgAAKCRARpy6gFHHX
 crk+D/9Xizg8WvZa9J61rbqYpcpvD1ujH1jEBpC2/Og+c4KsE/FYxmYpTFDxBBH9IkCNU0wZ+MW
 sXsQwo8xypAlB0Qkmn8E4YG+7VqjDpbbq00hsJNax69W+Ces/apbqznairccWCqnWraBxWjxlMA
 qmLoYtdidVEQBbYSFHmDQWFjfBYnBbxhbSSrvwpbGsJLsmTo3mtZnSTRlkOzwRxvoRcx6gAlo/l
 05ShLFNEo4ofMRbiQBiB6Q+5PNS4fCG5VqIxmFykmT9fuhZ+gGNfIdE41tX2Cu/7rdoTutaFa1c
 GlsasQIGu33rxNBj3nQRS4hmPW/uUvSe8p2/xGqZ6heD4oFMxImiaMckAdvl8ogEqULDzknduvk
 L6eeHIWdzXOqYm6uBpMmO6w9XJhcCGJf3D5O5LSSZDBWBPDR58x0xDYecnSrhoMLxcV5y8QJphB
 S/1FBPnALDBJSWI2zsF3KfzpkJFOEXE6iA6ph7u+bz+Kulgqd8oZta3LL/VVJN3kOkbQg5LhI1r
 Fs5mXSUi9X2tNacDZ/4CXZS6xYO48VRwKEQyKQntkXb9yYOi6XsQH1szvlipwTizNW88c6w5vJ5
 2qD7Pp1PSJC+CHjId8JeHhL9CGNIa4HMH+CJZEsDJsbzUX7WkEL92Z3gs3HolgyKBdH6NDFgp9G
 BtCYYpvPO2gxKfw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones.
---
 drivers/video/fbdev/via/via-gpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/via/via-gpio.c b/drivers/video/fbdev/via/via-gpio.c
index 9577c2cd52c7..27226a8f3f42 100644
--- a/drivers/video/fbdev/via/via-gpio.c
+++ b/drivers/video/fbdev/via/via-gpio.c
@@ -81,8 +81,7 @@ struct viafb_gpio_cfg {
 /*
  * GPIO access functions
  */
-static void via_gpio_set(struct gpio_chip *chip, unsigned int nr,
-			 int value)
+static int via_gpio_set(struct gpio_chip *chip, unsigned int nr, int value)
 {
 	struct viafb_gpio_cfg *cfg = gpiochip_get_data(chip);
 	u8 reg;
@@ -99,13 +98,14 @@ static void via_gpio_set(struct gpio_chip *chip, unsigned int nr,
 		reg &= ~(0x10 << gpio->vg_mask_shift);
 	via_write_reg(VIASR, gpio->vg_port_index, reg);
 	spin_unlock_irqrestore(&cfg->vdev->reg_lock, flags);
+
+	return 0;
 }
 
 static int via_gpio_dir_out(struct gpio_chip *chip, unsigned int nr,
 			    int value)
 {
-	via_gpio_set(chip, nr, value);
-	return 0;
+	return via_gpio_set(chip, nr, value);
 }
 
 /*
@@ -146,7 +146,7 @@ static struct viafb_gpio_cfg viafb_gpio_config = {
 		.label = "VIAFB onboard GPIO",
 		.owner = THIS_MODULE,
 		.direction_output = via_gpio_dir_out,
-		.set = via_gpio_set,
+		.set_rv = via_gpio_set,
 		.direction_input = via_gpio_dir_input,
 		.get = via_gpio_get,
 		.base = -1,

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250331-gpiochip-set-rv-video-6bf1584aa770

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

