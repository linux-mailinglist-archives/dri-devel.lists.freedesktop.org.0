Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30741D05BCD
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 20:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B8E10E7BE;
	Thu,  8 Jan 2026 19:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="beg78F61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366B210E7BC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 19:06:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1F77341785;
 Thu,  8 Jan 2026 19:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C4EC116D0;
 Thu,  8 Jan 2026 19:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767899193;
 bh=c9rs47Rq9JsGR2S4cjbA10der3BMDGHlAJIPw4Woy/o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=beg78F61TmAK6K3dtKBrNkjyd5lpZyTNJj8CUf/J2F9FZyBvg5xWeJMi9nreuQuzA
 p0ZBaRMrizyF/HWsK6KP1HIzHz5sSDGMWXd5jJarSDtnNcHN0uQoLoiTseXYqmkcfW
 DHgUxigiJLMHpFYQoYgtREOuw94Lw+TQ7NycNdM6DfWmADthvHUaxsSkI1BpuUA16s
 PM55kuiUlAu9bmO3Qjz0B3+Qr2lhsUNUW/C5+xbMh91uETQp7n4kv5JUzvXLqx1J76
 FLyVCflbn+Jq2hNriQIcMg8tXcVfs2ClTfppmxGzpN5pzlkUhHxHI2IAQgiXtA7EFO
 XonS9JmUJhprA==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 08 Jan 2026 20:04:53 +0100
Subject: [PATCH v3 5/7] sh: defconfig: remove CONFIG_LOGO_SUPERH_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-custom-logo-v3-5-5a7aada7a6d4@kernel.org>
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
In-Reply-To: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5952; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=c9rs47Rq9JsGR2S4cjbA10der3BMDGHlAJIPw4Woy/o=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJkJDFKbxB2e9Agfu71bWp/9J9OeNaEtG5LthYR3pHQJT
 bO2PGvZMZGFQYyLwVJMkWVZOSe3Qkehd9ihv5Ywc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oQ6QycDFKQBT3f6Z4X+h4s1TYu7C61y17GpVlhfstrc473Km/cXlMr2zd2K/nRVmZLh5++VRZmV
 3c4eDR9wmi8wQP+xrX1+p9G/HqyMvPhurNfMCAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

CONFIG_LOGO_SUPERH_MONO, CONFIG_LOGO_SUPERH_VGA16 and
CONFIG_LOGO_SUPERH_CLUT224 will be removed in an upcoming change but
are still referenced in some of the defconfig.

Remove all the occurrences of CONFIG_LOGO_SUPERH_*.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 arch/sh/configs/dreamcast_defconfig      | 2 --
 arch/sh/configs/ecovec24_defconfig       | 2 --
 arch/sh/configs/kfr2r09_defconfig        | 2 --
 arch/sh/configs/migor_defconfig          | 2 --
 arch/sh/configs/rts7751r2d1_defconfig    | 2 --
 arch/sh/configs/rts7751r2dplus_defconfig | 2 --
 arch/sh/configs/se7724_defconfig         | 2 --
 arch/sh/configs/se7780_defconfig         | 2 --
 arch/sh/configs/sh7785lcr_defconfig      | 3 ---
 arch/sh/configs/urquell_defconfig        | 3 ---
 10 files changed, 22 deletions(-)

diff --git a/arch/sh/configs/dreamcast_defconfig b/arch/sh/configs/dreamcast_defconfig
index 4573d5d64989..dd58797e8298 100644
--- a/arch/sh/configs/dreamcast_defconfig
+++ b/arch/sh/configs/dreamcast_defconfig
@@ -60,8 +60,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_VGA16 is not set
 # CONFIG_DNOTIFY is not set
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
diff --git a/arch/sh/configs/ecovec24_defconfig b/arch/sh/configs/ecovec24_defconfig
index 458115d83184..e751933ac840 100644
--- a/arch/sh/configs/ecovec24_defconfig
+++ b/arch/sh/configs/ecovec24_defconfig
@@ -78,8 +78,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SEQUENCER=y
diff --git a/arch/sh/configs/kfr2r09_defconfig b/arch/sh/configs/kfr2r09_defconfig
index d80e83e7ec38..056ba52600f9 100644
--- a/arch/sh/configs/kfr2r09_defconfig
+++ b/arch/sh/configs/kfr2r09_defconfig
@@ -66,8 +66,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_CLUT224 is not set
 CONFIG_USB_GADGET=y
 CONFIG_USB_CDC_COMPOSITE=m
 CONFIG_MMC=y
diff --git a/arch/sh/configs/migor_defconfig b/arch/sh/configs/migor_defconfig
index 7cdaa909ffd6..1d9d543eef4c 100644
--- a/arch/sh/configs/migor_defconfig
+++ b/arch/sh/configs/migor_defconfig
@@ -71,8 +71,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_CLUT224 is not set
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_M66592=y
 CONFIG_USB_G_SERIAL=m
diff --git a/arch/sh/configs/rts7751r2d1_defconfig b/arch/sh/configs/rts7751r2d1_defconfig
index 0c54ab2b06e6..745490d4807f 100644
--- a/arch/sh/configs/rts7751r2d1_defconfig
+++ b/arch/sh/configs/rts7751r2d1_defconfig
@@ -50,8 +50,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=m
 CONFIG_SND_YMFPCI=m
diff --git a/arch/sh/configs/rts7751r2dplus_defconfig b/arch/sh/configs/rts7751r2dplus_defconfig
index 3173b616b2cb..cd90f5354459 100644
--- a/arch/sh/configs/rts7751r2dplus_defconfig
+++ b/arch/sh/configs/rts7751r2dplus_defconfig
@@ -55,8 +55,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=m
 CONFIG_SND_YMFPCI=m
diff --git a/arch/sh/configs/se7724_defconfig b/arch/sh/configs/se7724_defconfig
index 8ca46d704c8b..9b4f8f3a1fdf 100644
--- a/arch/sh/configs/se7724_defconfig
+++ b/arch/sh/configs/se7724_defconfig
@@ -79,8 +79,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=m
 # CONFIG_SND_DRIVERS is not set
diff --git a/arch/sh/configs/se7780_defconfig b/arch/sh/configs/se7780_defconfig
index 12463b766120..13fa6a59b8f1 100644
--- a/arch/sh/configs/se7780_defconfig
+++ b/arch/sh/configs/se7780_defconfig
@@ -66,8 +66,6 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SOUND_PRIME=y
 CONFIG_HID_A4TECH=y
diff --git a/arch/sh/configs/sh7785lcr_defconfig b/arch/sh/configs/sh7785lcr_defconfig
index 2fcf50d8c820..8738c590d5a0 100644
--- a/arch/sh/configs/sh7785lcr_defconfig
+++ b/arch/sh/configs/sh7785lcr_defconfig
@@ -60,9 +60,6 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_VGA16 is not set
-# CONFIG_LOGO_SUPERH_CLUT224 is not set
 CONFIG_HID_A4TECH=y
 CONFIG_HID_APPLE=y
 CONFIG_HID_BELKIN=y
diff --git a/arch/sh/configs/urquell_defconfig b/arch/sh/configs/urquell_defconfig
index f51ff6b1ec38..e7924db29b69 100644
--- a/arch/sh/configs/urquell_defconfig
+++ b/arch/sh/configs/urquell_defconfig
@@ -86,9 +86,6 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_VGA16 is not set
-# CONFIG_LOGO_SUPERH_CLUT224 is not set
 CONFIG_HID_A4TECH=y
 CONFIG_HID_APPLE=y
 CONFIG_HID_BELKIN=y

-- 
2.52.0

