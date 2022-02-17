Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703624B94F9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 01:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC02F10E6A5;
	Thu, 17 Feb 2022 00:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449E510E672
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:25:57 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AF4BA8382C;
 Thu, 17 Feb 2022 01:25:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645057556;
 bh=VQYE2PR8YgOZV4U2WdOKPJV66i3iqQVUFKVAlKBX7Lg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c4EY8CuBM3Mrc9yDcGEkKq+MMh04Iht+3zVtGEFIgWQ/HD6LgWocnrERxSM+AoYqs
 qfz7l2bWcRP9ajBA/mrfurMfjvfQwRvy4RBeXYT/hT5FEYx3Sors55E37jBJQvu6Ou
 EDF9nYSfopTvONZINaC2ByB2zVVBKCfpnLl7b3a2LpF9kB9jA6wlknalJ+HCg7bJIT
 Yb8JgSWo7UU6e1uxQD2Q1s7P7WcWF1VbAbIvmzF8PiPo5PGCBjBBxDE/ZU8yPXWgeX
 SiT1ehrBeF8a37ug8mMsMd6A3nVXlundudHR8avt1pIDxfMslyFO4A4o4y5eWgi8VC
 lUHROMrSsCebg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 08/12] drm: bridge: icn6211: Set SYS_CTRL_1 to value used
 in examples
Date: Thu, 17 Feb 2022 01:25:26 +0100
Message-Id: <20220217002530.396563-9-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217002530.396563-1-marex@denx.de>
References: <20220217002530.396563-1-marex@denx.de>
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
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both example code [1], [2] as well as one provided by custom panel vendor
set register SYS_CTRL_1 to 0x88. What exactly does the value mean is unknown
due to unavailable datasheet. Align this register value with example code.

[1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gpu/drm/bridge/icn6211.c
[2] https://github.com/tdjastrzebski/ICN6211-Configurator

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index f475426507f19..07e698dc38cb4 100644
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

