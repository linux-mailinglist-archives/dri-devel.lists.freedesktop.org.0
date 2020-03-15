Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EF4186053
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 23:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A646A6E191;
	Sun, 15 Mar 2020 22:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC49B6E191
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 22:55:31 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id t17so1289357qkm.6
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 15:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FxhoUoo60hHirpNjZjgUcRQ8tvG6+IwwwDsSTyR3B+w=;
 b=rgOgNSdIhvq47D9ZYw+Ow7eIUBiPyyX6RhnIosmcHYxyPQqnH8b4GFi9O9PcFXczX9
 LGeFpNfWS/ByKQQ62MSAEEXUoUv+pOFao7u1O2G5McJZlZGQOClxOWDxtcIspByC7d+M
 o8G6eJYk9yl/0R16m+yatbdvOq1yF7jR1l2BF8oQi7DpLZqD1c7ig3Z663PWbzbQ7Thd
 Rj+BGmXlkBi4zf3dPjk5pVgfANXsCH6bHVhcmMy11gPhGDyKq5hBPblh/Q0yyGMC9fd9
 5YR/q+wnbZ1UT25x3b0WqPa/Y7vXc5Hfd4Yj/2kUZU5eUcAumsGgkInOR2Ux9JmpqYrT
 y+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FxhoUoo60hHirpNjZjgUcRQ8tvG6+IwwwDsSTyR3B+w=;
 b=gXL3OSpjmUaMrJIxZlJCCh60rgnMsglbSWstYpufrm17qJfnUsVBN1xa7rRb4Bjads
 vRGBzz7J7EZAoYhKNeHbjcF/CqQGGikyIysjbelZ05Ea/qyJHZGSE1iM4E0wQAjBQTSV
 aEPfWmSY3PRxT6tixKfqKzmfo7HQZKw38NwDyul8W1EAwkKxzwp2+Ycf9WoZALQHkDmV
 geFORmCbz3wSAgwFCW1JXsCE7rYniIiqyz5gL8Xjrn277V5IvEmA2JJWdF/UTbHs9TmH
 iO2ZoM7SX0SvkuHRb4nKyw4lEkZNDMw6IXJKSt868dBD4hrIZZV+RoxnsLhq/h5DRrfY
 s0rQ==
X-Gm-Message-State: ANhLgQ2DFZsYamwMgldFTG3xZJDl64kpMU11a/VCShQNwVkJNLFvuxOL
 hZP3x9bSM924JZIwhwmfDI0f27I28TajxQ==
X-Google-Smtp-Source: ADFU+vu+A5Tb816va7urfXmHt0y45DRvzKpZRrXHsaF7iyC5SzJVpF4J5oIY4cKfFLjYuo5K4Rc+xw==
X-Received: by 2002:a37:80c7:: with SMTP id
 b190mr23288317qkd.255.1584312930898; 
 Sun, 15 Mar 2020 15:55:30 -0700 (PDT)
Received: from localhost.localdomain ([68.202.211.176])
 by smtp.gmail.com with ESMTPSA id l18sm9231602qke.132.2020.03.15.15.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 15:55:30 -0700 (PDT)
From: Daniel Rodriguez <danielcrodriguez2012@gmail.com>
To: eric@anholt.net, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/v3d: fix Kconfig ARCH_BCMSTB typo preventing compile
Date: Sun, 15 Mar 2020 22:54:55 +0000
Message-Id: <20200315225455.116260-1-danielcrodriguez2012@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniel Rodriguez <danielcrodriguez2012@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Kconfig for v3d includes a depend on ARCH_BRCMSTB. It is misspelled;
as ARCH_BCMSTB. This misspelling makes CONFIG_DRM_V3D not show up at all
on Linux menuconfig and breaks manual kernel compilation with
it manually set in .config (during compile CONFIG_DRM_V3D is transparently
removed as the non-existent depend is not satisfied)

Thus, v3d will (transparently) never compile into a kernel, even if
forcibly enabled in .config.

This patch corrects the typo, thus fixing menuconfig and kernel
compilation with v3d.

Signed-off-by: Daniel Rodriguez <danielcrodriguez2012@gmail.com>
---
 drivers/gpu/drm/v3d/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/Kconfig b/drivers/gpu/drm/v3d/Kconfig
index 9a5c44606337..e973ec487484 100644
--- a/drivers/gpu/drm/v3d/Kconfig
+++ b/drivers/gpu/drm/v3d/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_V3D
 	tristate "Broadcom V3D 3.x and newer"
-	depends on ARCH_BCM || ARCH_BCMSTB || COMPILE_TEST
+	depends on ARCH_BCM || ARCH_BRCMSTB || COMPILE_TEST
 	depends on DRM
 	depends on COMMON_CLK
 	depends on MMU
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
