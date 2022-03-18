Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5184DE153
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 19:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140D310E33A;
	Fri, 18 Mar 2022 18:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2333310E70B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 18:48:17 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8EA7E83260;
 Fri, 18 Mar 2022 19:48:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647629295;
 bh=2Ucoynhr6uCIzrqSg2Z4jHU+U/BmctDazs8XBsIxe3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DGb60r2LFoRLAN7c+z9xhjB7x3pt/54UN590UBsXUODYQhMeY0bE/M+at78tqKqjt
 Nn8nTHzRKpac4oYou44nBts4i3NEyZUpHW/loEqU5MnEIyaAY0KHMjqbNYYhHIRF6r
 szFhwvJvtLvqyFHwJNIUPzDlUeKXEWHKJYwK2/Qgdvh6m9lq6yRj6qzUmG5RLmTXXm
 0M+N6FM/4NN8g4LGriCzHoWMwRCxxDJHz3Jk6EPQH8nQ1NJFzko7tu36wasx3nlBkc
 D22UQUT4RJ2GTpby8f5+JDNmUaknjGle4dQKEjNEAuxSLpECnjK8klGCKpMxhwp8+m
 tYg+8wxg/iPDw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/11] drm: bridge: icn6211: Set SYS_CTRL_1 to value used
 in examples
Date: Fri, 18 Mar 2022 19:47:51 +0100
Message-Id: <20220318184755.113152-8-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318184755.113152-1-marex@denx.de>
References: <20220318184755.113152-1-marex@denx.de>
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
V4: No change
V5: No change
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 4d6baef7ce16c..b2faad4cb8a6d 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -308,7 +308,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	chipone_configure_pll(icn, mode);
 
 	ICN6211_DSI(icn, SYS_CTRL(0), 0x40);
-	ICN6211_DSI(icn, SYS_CTRL(1), 0x98);
+	ICN6211_DSI(icn, SYS_CTRL(1), 0x88);
 
 	/* icn6211 specific sequence */
 	ICN6211_DSI(icn, MIPI_FORCE_0, 0x20);
-- 
2.35.1

