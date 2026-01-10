Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61560D0D609
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 13:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7829010E09F;
	Sat, 10 Jan 2026 12:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kxf/I2NV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D596610E09F
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 12:28:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9089860052;
 Sat, 10 Jan 2026 12:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C6AC4CEF1;
 Sat, 10 Jan 2026 12:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768048097;
 bh=1/MgxQrIKkwC3TtMydqgGCFwE1/+7INfOgmXrdvebO4=;
 h=From:Date:Subject:To:Cc:From;
 b=kxf/I2NV/xJfw/oWYpo5fhD216eu5gYNQSN5gy+psLKbcNwFQc8osmfJtxSHa89bH
 7ABbVU0HiijzYFwKmK7b2kXnP/kRnE37vHouWFZCfCMDh75756BV8sEginxiTm9zgx
 PfUE6Rj+zJbYedXfb0W3VbKODV0+9yHSKFy9V9n6BjgXYcYeQZWaPn7zDt23MboLLC
 XFZbbq6AtMsiq+LZRs8zHQCSSiQmJU/ZhFomu+SVTh3gnEOpBd5B3GivNgYnRsGWr/
 zI/mOTE56frnNZVhbcu1dO4PmR41QamCS2rpWYeyPgpkV6/JXUZ7ngn0sBuHwPTLJt
 qNfqDpJu/aIww==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Sat, 10 Jan 2026 13:23:24 +0100
Subject: [PATCH] video/logo: don't select LOGO_LINUX_MONO and
 LOGO_LINUX_VGA16 by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-mono_and_vga16_logos_default_to_no-v1-1-30f36da979b4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL5EYmkC/02Oyw6CMBBFf4XM2po+BIVfMaQpZcAm0NG2EBPCv
 1tl4/LcxT1ng4jBYYSm2CDg6qIjn0GcCrAP40dkrs8MksuKC8HZTJ608b1eRyMqPdFIUfc4mGV
 KOpH2xAY0N9WpksuSQz56Bhzc+ye5twcHfC3ZlY4ROhORWZpnl5pirc6iZsFe4D+iKXJCKaS8M
 rvERDP7qlmtZD8oURkubbMqaPf9A2j+e6TUAAAA
X-Change-ID: 20260110-mono_and_vga16_logos_default_to_no-fea83b350250
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=1/MgxQrIKkwC3TtMydqgGCFwE1/+7INfOgmXrdvebO4=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJlJrrfud58Sl+315jUxOejCecVAa40l5yZeU8GjoQ+sH
 xx6F3WnYyILgxgXg6WYIsuyck5uhY5C77BDfy1h5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Qx0gk4GLUwCm+tRDRoZVZ/21hcqYdoVMmneH7/PGmxdnhK7unHX7aGX3vO98QuveMDIcu7bZpLb
 e1N4uTGCdru7zf9n+D74eVjh1zKWncI+UjSQ3AA==
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

Nowadays, nearly all systems have a color depth of eight or more and
are thus able to display the clut224 logo. This means that the
monochrome and vga16 logos will never be displayed on an average
machine and are thus just a waste of bytes.

Set CONFIG_LOGO_LINUX_MONO and CONFIG_LOGO_LINUX_VGA16 configuration
symbols to no by default.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
To be applied on top of my previous "video/logo: allow custom boot
logo and simplify logic" series:

Link: https://lore.kernel.org/all/20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org/
---
 drivers/video/logo/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
index 34ee207e5e77..cda15b95891e 100644
--- a/drivers/video/logo/Kconfig
+++ b/drivers/video/logo/Kconfig
@@ -20,7 +20,6 @@ config FB_LOGO_EXTRA
 
 config LOGO_LINUX_MONO
 	bool "Standard black and white Linux logo"
-	default y
 
 config LOGO_LINUX_MONO_FILE
 	string "Monochrome logo .pbm file"
@@ -38,7 +37,6 @@ config LOGO_LINUX_MONO_FILE
 
 config LOGO_LINUX_VGA16
 	bool "Standard 16-color Linux logo"
-	default y
 
 config LOGO_LINUX_VGA16_FILE
 	string "16-color logo .ppm file"

---
base-commit: f10c325a345fef0a688a2bcdfab1540d1c924148
change-id: 20260110-mono_and_vga16_logos_default_to_no-fea83b350250
prerequisite-change-id: 20251227-custom-logo-932df316a02c:v3
prerequisite-patch-id: 5053eddfae57689a621f3224acc18742a25c2887
prerequisite-patch-id: 2fd02272fb8f94575c67124366f58811dcceb6ad
prerequisite-patch-id: 81d5632ac8717a56b335bb356e8fe5d9e8b1639f
prerequisite-patch-id: 268d8fb7ce93d0cb137c32b6f149fda376da37e8
prerequisite-patch-id: f6229ba399af73d57a647050a8f0f6871c4a96ef
prerequisite-patch-id: 6a6d392a9acf6eb2fe2827e3beebbc4b341f50a5
prerequisite-patch-id: 359180711835dc73be129380a5664210e19d50f1

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>

