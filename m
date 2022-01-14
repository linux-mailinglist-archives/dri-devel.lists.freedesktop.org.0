Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5E748E314
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 04:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5607010EB86;
	Fri, 14 Jan 2022 03:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFDB10EB7F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 03:49:01 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5D5C3831F0;
 Fri, 14 Jan 2022 04:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642132140;
 bh=ELVN1SZMQJ6dKOLNe6eMsyED/ErNiD6cJiLG4EAaF/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s9pwemXffBMkvYdPBErLiVD5fkiCPd0a6zpGOfKOj5Z4p5+mfgRTZlhSj2z9fHv4m
 9NuMKkdZAuze3vBqweGOpWEEHeEjf0N4leJyZ/mGqN+7uMIQU6fo4bLfsdWUHz446D
 iX5ez/yYMZSAdGTaUKSLcuHyyQh2DSTIKDNBvB3s7L3AydzLtLxBVwKqCNSXKPZCg8
 vpOubLZ0e7CkPo2aScQJaqz7USh3jGCUsdgP1FopUar3eYFgpUobiJ6Hf7587Iadtb
 gYAuDFotTst/5u0hvAt98e/2lXhvvcuGYe1D0SDksASD/LhwZC0reruy9tdoi1pLIK
 p9kJPCuscq4vQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/14] drm: bridge: icn6211: Set SYS_CTRL_1 to value used in
 examples
Date: Fri, 14 Jan 2022 04:48:35 +0100
Message-Id: <20220114034838.546267-11-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114034838.546267-1-marex@denx.de>
References: <20220114034838.546267-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both example code [1], [2] as well as one provided by custom panel vendor
set register SYS_CTRL_1 to 0x88. What exactly does the value mean is unknown
due to unavailable datasheet. Align this register value with example code.

[1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gpu/drm/bridge/icn6211.c
[2] https://github.com/tdjastrzebski/ICN6211-Configurator

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index e41e671fed46d..8226fefeedfc9 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -337,7 +337,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	chipone_configure_pll(icn, mode);
 
 	ICN6211_DSI(icn, SYS_CTRL(0), 0x40);
-	ICN6211_DSI(icn, SYS_CTRL(1), 0x98);
+	ICN6211_DSI(icn, SYS_CTRL(1), 0x88);
 
 	/* icn6211 specific sequence */
 	ICN6211_DSI(icn, MIPI_FORCE_0, 0x20);
-- 
2.34.1

