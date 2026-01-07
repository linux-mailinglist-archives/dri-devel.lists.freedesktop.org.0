Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA4CFBFF6
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 05:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961CC10E07E;
	Wed,  7 Jan 2026 04:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LfbbO4X+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F132510E07E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 04:43:17 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-bc17d39ccd2so801315a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 20:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767760997; x=1768365797; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NLWOELcEjrI2iHJxLfRXTvBZahch6VAgebKRz7irVnw=;
 b=LfbbO4X+7+/KaaOGgQb5Am2xuVP8ynwpT27BBviNyxpVf1vgETUjbZxseLDYQ5RsDs
 k5pmfZ3clonDkE6O4BWU28WC/0Kc5dZvcZkbN+OfMh9y/h4C25pWGpsFbIcGM9ENs4lQ
 rkLy6XAZc5S0YGQpaYW/C7BxYhqRrRHDhby4s2YnXiqstxoI9IJQssVIpb/oi5JWqlxS
 5/9VJPKLj7l5jM0vX4Cu9+o2G5/nEc9U1UpMgEET/AmT1+DWFEFJo7hJIbLebigBEbn6
 f79G/PHYWua17qt+M3PhLqtKqJW4jpzfSN5f7VaTElmY4ApeMjuhis47GtvqDP6vqFrF
 ynYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767760997; x=1768365797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NLWOELcEjrI2iHJxLfRXTvBZahch6VAgebKRz7irVnw=;
 b=nIq88DQUIXWImpzkjnIm+rqCPuQY5B4U/KgL+wrKPN2dZ54DPQhRVADb/WZoOvGgSA
 peVhxU53lkbP7qXo4j9Lbye7kVCoFuIfysaYrFf6MJY4YFzMGMDEM+NWMEgJP9zDKU5g
 50CWzVzxrJX2TIxyEImDH4M5ojfkgEel4ZK5vbI0hFRm+7v7tASQN0F3qKKzWb1H8Irs
 FI5T9RiRc5Kx547ZD56qACpWtFBL27jQpYxpLZKz6cU/ZMCNugfXV80nCGod2+GLDdau
 DtA2gZPjVo2kcla73ItpdtnyvYHzWvmoqyfEWEKhVUCmdNcCOCDzGSm37azsJMUn8MMk
 hDtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPJMIVmagk5JibYzfpesf9VVuO+/ZvmiPCvIQBZqDOVvxyjHQpG5XjqTppAuQigAzh56gIFp0R9mo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/FQj9k6JaM2h8eH3m01A5Qb0/S/HXuI0cNUZzWbRx83fQCl3R
 eGhpsS2A19LQ/TXie83t89iMQ6TfJt30sF2bMRcigZMXgB07adetAA0p
X-Gm-Gg: AY/fxX58hbqGkVT+a+wgplE80Kzx07FVbLUh1vVv0YT46OnvbzBd/2zUboHcPMCiOm3
 XK5A6NgnrK1EoOX9WgVcKOtyT2qKCSltKaRTmdjUkzDGeQdkEAEz3dn0bAjXmiMnIBlMRmsASS9
 F+pfFuxeDbAQUVknEYolu6a9aF9JrWbfpWL7qiyunMvZ2ptiOn55l4askA873+Z+TESdxPVDmbl
 fUXUM4lim7OBWCXin/575cJZscOs2+YXmxbbOWavm9Tk8xGJo1SGZfUrqcz6au2RwdcdLLBNpMu
 JYNGqOR0haOMFI3B+/QN2Hwfo1qMV2zAMDQHFl4xCG5M1Yap9/YmkFPxhYfvfAd9f3sZ6oJ3T39
 Jta/npZfnHy+vdMVYkSsRBXfVR+/qvgV8CXH8pZC6FpE+MBNGFoBIIGk9fIXJQTZcWNRvFkbMK5
 sDZ9yq6fgI1gglEcScIaaqDJoX9ruu+qkRzKaRZjML9a2eqkfLNgKfWg==
X-Google-Smtp-Source: AGHT+IEF2tiwIdEjUKJoleA4BSAnBVhOgZtlhWyisn+mWM00+oMK/a966pLLKiRVpDOA/U4Wkrlj0A==
X-Received: by 2002:a05:6a21:32a0:b0:366:2677:4b38 with SMTP id
 adf61e73a8af0-3898f8f5458mr1134448637.8.1767760997324; 
 Tue, 06 Jan 2026 20:43:17 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 20:43:17 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v4 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Date: Tue,  6 Jan 2026 20:42:55 -0800
Message-ID: <20260107044258.528624-3-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107044258.528624-1-chintanlike@gmail.com>
References: <20260107044258.528624-1-chintanlike@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fbtft provides sysfs interfaces for debugging and gamma configuration,
but these are not required for the core driver.

Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
sysfs operations are skipped while the code remains buildable and
type-checked.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Helge Deller <deller@gmx.de>
Reviewed-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/Kconfig       |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c | 20 ++++++++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index c2655768209a..578412a2f379 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -2,11 +2,14 @@
 menuconfig FB_TFT
 	tristate "Support for small TFT LCD display modules"
 	depends on FB && SPI
-	depends on FB_DEVICE
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on GPIOLIB || COMPILE_TEST
 	select FB_BACKLIGHT
 	select FB_SYSMEM_HELPERS_DEFERRED
+	help
+	  Support for small TFT LCD display modules over SPI bus. FB_DEVICE
+	  is not required, but if enabled, provides sysfs interface for debugging
+	  and gamma curve configuration.
 
 if FB_TFT
 
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index e45c90a03a90..d05599d80011 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -203,14 +203,26 @@ static struct device_attribute debug_device_attr =
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
-	device_create_file(par->info->dev, &debug_device_attr);
+	struct device *dev;
+
+	dev = dev_of_fbinfo(par->info);
+	if (!dev)
+		return;
+
+	device_create_file(dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_create_file(par->info->dev, &gamma_device_attrs[0]);
+		device_create_file(dev, &gamma_device_attrs[0]);
 }
 
 void fbtft_sysfs_exit(struct fbtft_par *par)
 {
-	device_remove_file(par->info->dev, &debug_device_attr);
+	struct device *dev;
+
+	dev = dev_of_fbinfo(par->info);
+	if (!dev)
+		return;
+
+	device_remove_file(dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_remove_file(par->info->dev, &gamma_device_attrs[0]);
+		device_remove_file(dev, &gamma_device_attrs[0]);
 }
-- 
2.43.0

