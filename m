Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6350F4CCAC2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6810E3E4;
	Fri,  4 Mar 2022 00:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9F110E343
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 00:25:43 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D82D883CAF;
 Fri,  4 Mar 2022 01:25:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646353542;
 bh=AsgdthmxAh+f9qrGwlDWrhk4iPmxEj4EXUKftNhin2U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ciui1u+EnteVPWv80IvuFtXB7mUhk5tZukMH3CTrNzf+sniaJ1UNu04X8BcIbgx8y
 49lfnfhapsDCXFs2CU/JSfFNvyqX4tdmF8Na9PZYnD+/HbEKVa2Z3ncZNTct2d2LwQ
 yVM4O9v4+FE0E0FQ7I4c6LgK4jhdENUcJG8rMMV0CEtVqykz6vl0YA2zBH+gMNgBi+
 gLsy5ZlM6BjZrOrrTUHLks50iN9TATYtcE2eTYOMftrp9KSo6X3bT9wugKgyQZ6DxZ
 XdErOw19nnbHh2UhpJcquUSXKzmYfi2Ds5zxF/5PW0z0MdZUl/GX+ln1Qt6M1hNXic
 sG7jwQG/LmZJQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 09/13] drm: bridge: icn6211: Set SYS_CTRL_1 to value used
 in examples
Date: Fri,  4 Mar 2022 01:25:04 +0100
Message-Id: <20220304002508.75676-10-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304002508.75676-1-marex@denx.de>
References: <20220304002508.75676-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both example code [1], [2] as well as one provided by custom panel vendor
set register SYS_CTRL_1 to 0x88. What exactly does the value mean is unknown
due to unavailable datasheet. Align this register value with example code.

[1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gpu/drm/bridge/icn6211.c
[2] https://github.com/tdjastrzebski/ICN6211-Configurator

Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
V3: Add AB from Maxime
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 1a3afefcc9e80..095002a40d0e8 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -314,7 +314,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	chipone_configure_pll(icn, mode);
 
 	ICN6211_DSI(icn, SYS_CTRL(0), 0x40);
-	ICN6211_DSI(icn, SYS_CTRL(1), 0x98);
+	ICN6211_DSI(icn, SYS_CTRL(1), 0x88);
 
 	/* icn6211 specific sequence */
 	ICN6211_DSI(icn, MIPI_FORCE_0, 0x20);
-- 
2.34.1

