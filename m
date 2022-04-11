Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C4C4FB122
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 02:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B5B10E433;
	Mon, 11 Apr 2022 00:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BECA10E433
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 00:47:45 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0D1F383B25;
 Mon, 11 Apr 2022 02:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649638063;
 bh=gqR9qog7g2NCP9Sv3+OOmeQcPCAZ6wAVbzxWW56gJMk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GRffyAA8YBzKLqMRS0aCK8++O78iaofVYJc2kWHOvC6aAbtjVFpnGgMVmwk5bhyig
 M2HxX+1MpdsYlJxZ23dJ7vGy+jUTAOkE4Fwo9GmYWjyZcnH7HQ7BV1ru9tSMKaNsLs
 OukzYYJpwxhHW0TviA3eNcsWcvUSN6qL4MWYPvKkDUIZlNxxq25T5Gj2SbCX5me/SK
 n8QLq7q635udGt8tWe1hNla2POJ1FmSMkw2O2bPyYRXUGPISyEJVr7oRNMBR6jY4Fm
 LljUo2xsnPbZ1Bpy1RxHgadLZ8wmHPw0VA19bTlHtaSJq1CiU2EPqb/XKhUe6S/bFh
 eCVDup6GjWPgA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel: lvds: Drop now redundant width-mm and
 height-mm check
Date: Mon, 11 Apr 2022 02:47:28 +0200
Message-Id: <20220411004728.68203-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411004728.68203-1-marex@denx.de>
References: <20220411004728.68203-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robert.foss@linaro.org,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The check for mandatory DT properties width-mm and height-mm is now
part of of_get_drm_panel_display_mode(), drop the redundant check
from this driver.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-lvds.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index eca067e785796..f11252fb00fea 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -128,18 +128,6 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 		return ret;
 	}
 
-	if (lvds->dmode.width_mm == 0) {
-		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
-			np, "width-mm");
-		return -ENODEV;
-	}
-
-	if (lvds->dmode.height_mm == 0) {
-		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
-			np, "height-mm");
-		return -ENODEV;
-	}
-
 	of_property_read_string(np, "label", &lvds->label);
 
 	ret = drm_of_lvds_get_data_mapping(np);
-- 
2.35.1

