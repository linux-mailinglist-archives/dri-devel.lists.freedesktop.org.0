Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C313F03DF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482436E5A1;
	Wed, 18 Aug 2021 12:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DED96E59D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:41:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso4285413wmc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=REhMgVT+6ZjXEXXRs/yP5w88X232Fgpi2cGGVzDaXxE=;
 b=AdNRdIv77OE3YAdMkK2k6amx6PN8Ganr5o8QZM+19FIK6391iIU8yVSNCBUdp527hp
 4iGc0rBpFLJg8fw+C62V7NW1pxlL7O4a3r0TEqppoBxEPD4Pu5Z6ytnAGbol2UnsI/Wr
 vS5q54Zp69IB/88rn0zq8NOTbDUmFN1ns0oe5daUrJXIpKc0qDWOjrq+xCytz3le/3eX
 tiSOZRWS0maQC6YR/CfoWE1ytIJ2nnpsv/faO4q9BzpzeZ1wjTPdkwZB4Amj5Akc6r4O
 u5EpOe5I2ibte9oHuOPMCLKZ1+WBpDBGszOhkO/5x4yr2EJi6repnf0SjYsRMQI6tHuJ
 AlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=REhMgVT+6ZjXEXXRs/yP5w88X232Fgpi2cGGVzDaXxE=;
 b=nK4ulGhTugRwQw9p3xT1P4eu15GqScbleDLS8/8VsllgGKwtdmOBPA8kJ+tZ2wJ/KY
 Ell4WKJ4QOa/EhnkGRSQxoOMPZy58w26dHwoQU+VGzofkr6JnKKH0fak9zClPPAmopc2
 eGyjtzV4ZI7/lJuS/bnL9qvuaVa1kke8QBeqa0ZSnHlrhPlQV0ThjGosTaBIys5cFyz/
 qQjGsI8IgQRlt5Jn4jOry/xhz9JXbJUgr0uh7OJhCIhGBa4E1FH8fntVMZ1t4O+dsJKM
 pm1I5uIu2S1jd7WmBKvBHzM6bnwAN4omFJv5u4W60SuTv/6QZXKKoPPvzgjkGii2z6sz
 u8qg==
X-Gm-Message-State: AOAM532f+bqiy2c/WPy+wg35LvXDxf2X4+LpAkWmMxTpXikV8N0RQN7k
 HCAoAp49U9Xkbgb4GY4j8Yo=
X-Google-Smtp-Source: ABdhPJyLjuqtTOZTR24aWisJ8tiRhVF/w2xm59RHeKTRwyZmJd/LAAzH/sJIPkjeU3aMqeJSdVDmGQ==
X-Received: by 2002:a05:600c:2147:: with SMTP id
 v7mr8099425wml.124.1629290486739; 
 Wed, 18 Aug 2021 05:41:26 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id a11sm5720454wrq.6.2021.08.18.05.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 05:41:26 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 3/5] drm: v3d: correct reference to config ARCH_BRCMSTB
Date: Wed, 18 Aug 2021 14:41:12 +0200
Message-Id: <20210818124114.28545-4-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
References: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
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

Commit 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D
V3.x+") adds the config DRM_V3D, which depends on "ARCH_BCMSTB".

Although, a bit confusing: all Broadcom architectures in
./arch/arm/mach-bcm/Kconfig have the prefix "ARCH_BCM", except for
ARCH_BRCMSTB, i.e., the config for Broadcom BCM7XXX based boards.

So, correct the reference ARCH_BCMSTB to the intended ARCH_BRCMSTB.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
2.26.2

