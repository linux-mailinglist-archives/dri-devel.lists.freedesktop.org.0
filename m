Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E2332F2D9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A9B6EC13;
	Fri,  5 Mar 2021 18:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C6E6EC15
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 18:39:44 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id d13so3984461edp.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 10:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vj0fR0Hv68keiBerGEZYm4j5yOSf6bjnsnQtt9w94hk=;
 b=I5pYnbMlKeDeCDB02kLVpDRlSoszuEhN46XklEhNp0i5VoztFotrZFPataFwQ9/G1h
 xxM+sVa9t134rnWSwJzg380KeaJSYcWDzJtNmMHycZ/z/lPiuqBeBjYVcuyxLZbzaPev
 IiiVtgBUl/a/5uTbR0JbfU+p44Cd0MOT4ajcoTNsHPvPBaNkLKETIe6JHb0KE1Cv6CNe
 VosCzuvOce/XE82mppCqA5GbIU1aaHPYWe7HmyZH/mMkmmfr3zWtInHCSaWXBWFFllfQ
 m/1Gv6G8MMlwKHx+3a4xCbfshZ9vXeA7cMHGNyccW6oWoS/uQTD0o5VDx+GqzYDfYZYP
 3RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vj0fR0Hv68keiBerGEZYm4j5yOSf6bjnsnQtt9w94hk=;
 b=eqDN3KvRh//1/6p6HW8I3vkSNdcTtMgG1Co0crsju+c2jEvEjk7EQNsDgm5DomAzjx
 gl7swt7SLSQEkojyP8sxvCwPizzV3XYybulLd0OAeXiThy2b53AIRrf3LJbD1JxQEvuy
 iD2RW8W/Mt8VwHQSpcoIKAPGSy1LTa6Do8jktc3LJVKn9vZDB9ITqA7f92lEG3ulRZUw
 apvWM4dhPuwVM3Ed3nqjyfVdJiJOTK89Pk+BIiwAXRUBCvI/CzN4DTZM7epZnbUTif2u
 /BZYWwQdkt3UgATWNasy/R6ga8GNJuuiKzlTiK9XwyPRKnmoGsGiXSK9Ew1OZ8mIUClD
 cAQQ==
X-Gm-Message-State: AOAM531fiWjEBsGV3/q0t4H7Sxk7ojvyfvX9DhqoxkhHaDmVvXg1Z6F4
 EbP/ROAUBKQylAagzrHMZ12baOVi9HNxmg==
X-Google-Smtp-Source: ABdhPJwGAzsAAqA4EE0xVB7Wy2nLESquIY3Pc0XL21zHXY/3rsG7/17j+Pe8EUPUWNYxgGUsP8OcyA==
X-Received: by 2002:a05:6402:215:: with SMTP id
 t21mr10491472edv.363.1614969583148; 
 Fri, 05 Mar 2021 10:39:43 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net.
 [82.24.248.100])
 by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 10:39:42 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] ARM: configs: at91: sama5: update with savedefconfig
Date: Fri,  5 Mar 2021 18:39:23 +0000
Message-Id: <20210305183924.1754026-7-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

While enabling an extra config, I've noticed that savedefconfig produced
a notable delta. Split out the no-op changes for clarity sake.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 arch/arm/configs/sama5_defconfig | 48 ++++++++++++--------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 5f6297e6c549..0dca50c64503 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -1,7 +1,6 @@
 # CONFIG_LOCALVERSION_AUTO is not set
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
-CONFIG_FHANDLE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
@@ -9,29 +8,26 @@ CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EMBEDDED=y
 CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_FORCE_LOAD=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
 CONFIG_ARCH_AT91=y
 CONFIG_SOC_SAMA5D2=y
 CONFIG_SOC_SAMA5D3=y
 CONFIG_SOC_SAMA5D4=y
 # CONFIG_ATMEL_CLOCKSOURCE_PIT is not set
-CONFIG_AEABI=y
 CONFIG_UACCESS_WITH_MEMCPY=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_CMDLINE="console=ttyS0,115200 initrd=0x21100000,25165824 root=/dev/ram0 rw"
 CONFIG_KEXEC=y
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_PM_DEBUG=y
 CONFIG_PM_ADVANCED_DEBUG=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -41,13 +37,7 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
-# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET6_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET6_XFRM_MODE_BEET is not set
 CONFIG_IPV6_SIT_6RD=y
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
@@ -68,7 +58,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_ATMEL=y
 CONFIG_MTD_SPI_NOR=y
@@ -87,8 +76,8 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
 CONFIG_NET_DSA_MICROCHIP_KSZ9477=m
 CONFIG_NET_DSA_MICROCHIP_KSZ9477_SPI=m
-CONFIG_MACB=y
 # CONFIG_NET_VENDOR_BROADCOM is not set
+CONFIG_MACB=y
 # CONFIG_NET_VENDOR_CIRRUS is not set
 # CONFIG_NET_VENDOR_FARADAY is not set
 # CONFIG_NET_VENDOR_INTEL is not set
@@ -103,7 +92,9 @@ CONFIG_MACB=y
 CONFIG_MICREL_PHY=y
 CONFIG_LIBERTAS_THINFIRM=m
 CONFIG_LIBERTAS_THINFIRM_USB=m
-CONFIG_RTL8187=m
+CONFIG_MWIFIEX=m
+CONFIG_MWIFIEX_SDIO=m
+CONFIG_MWIFIEX_USB=m
 CONFIG_RT2X00=m
 CONFIG_RT2500USB=m
 CONFIG_RT73USB=m
@@ -111,10 +102,7 @@ CONFIG_RT2800USB=m
 CONFIG_RT2800USB_RT53XX=y
 CONFIG_RT2800USB_RT55XX=y
 CONFIG_RT2800USB_UNKNOWN=y
-CONFIG_MWIFIEX=m
-CONFIG_MWIFIEX_SDIO=m
-CONFIG_MWIFIEX_USB=m
-# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_RTL8187=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 CONFIG_KEYBOARD_QT1070=y
@@ -136,9 +124,9 @@ CONFIG_SPI_ATMEL=y
 CONFIG_SPI_GPIO=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_SAMA5D2_PIOBU=m
+CONFIG_POWER_RESET=y
 CONFIG_POWER_SUPPLY=y
 CONFIG_BATTERY_ACT8945A=y
-CONFIG_POWER_RESET=y
 CONFIG_SENSORS_JC42=m
 CONFIG_WATCHDOG=y
 CONFIG_AT91SAM9X_WATCHDOG=y
@@ -177,11 +165,11 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_ATMEL_SOC=y
 CONFIG_SND_ATMEL_SOC_WM8904=y
-# CONFIG_HID_GENERIC is not set
 CONFIG_SND_ATMEL_SOC_CLASSD=y
 CONFIG_SND_ATMEL_SOC_PDMIC=y
 CONFIG_SND_ATMEL_SOC_TSE850_PCM5142=m
 CONFIG_SND_ATMEL_SOC_I2S=y
+# CONFIG_HID_GENERIC is not set
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_EHCI_HCD=y
@@ -235,14 +223,14 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_DEV_ATMEL_AES=y
+CONFIG_CRYPTO_DEV_ATMEL_TDES=y
+CONFIG_CRYPTO_DEV_ATMEL_SHA=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_MEMORY_INIT=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_USER=y
-CONFIG_CRYPTO_USER_API_HASH=m
-CONFIG_CRYPTO_USER_API_SKCIPHER=m
-CONFIG_CRYPTO_DEV_ATMEL_AES=y
-CONFIG_CRYPTO_DEV_ATMEL_TDES=y
-CONFIG_CRYPTO_DEV_ATMEL_SHA=y
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
