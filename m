Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A16047F0C8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 20:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947FB10E46F;
	Fri, 24 Dec 2021 19:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ixit.cz [94.230.151.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D1710E46F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 19:52:44 +0000 (UTC)
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id F02902243C;
 Fri, 24 Dec 2021 20:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1640375562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/2lZIXod9c78gAdTent65VLevGXFn3pcJz5ryneQs9U=;
 b=aIJM/pxUvAhaX9p6OcavlXfgnoT3i9a38Ety/HbEzn81zknw0ZCmaqcGFOgTCj8NzFt/ct
 bSoTapM+DQBVAcW3h5QN1lTJ+VpFcwa5u8ovnFbK02oEhg8XJJKylo7y98NKy2hrw9pzrc
 AXXAMjcsEFxk+YIY4Oct6YxxqPspl9w=
From: David Heidelberg <david@ixit.cz>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: JDI LT070ME05000 drop broken link
Date: Fri, 24 Dec 2021 20:52:40 +0100
Message-Id: <20211224195240.78008-1-david@ixit.cz>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org, ~okias/devicetree@lists.sr.ht,
 David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Link is no longer functional and web.archive.org doesn't provide PDF
with detail information.

Some informations can be found from web.archive.org here:
https://web.archive.org/web/20170629205602/http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 3c86ad262d5e..ea0e7221e706 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -5,10 +5,6 @@
  *
  * Copyright (C) 2016 Linaro Ltd
  * Author: Sumit Semwal <sumit.semwal@linaro.org>
- *
- * From internet archives, the panel for Nexus 7 2nd Gen, 2013 model is a
- * JDI model LT070ME05000, and its data sheet is at:
- * http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet
  */
 
 #include <linux/backlight.h>
-- 
2.34.1

