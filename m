Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801DE4EEC68
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 13:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7538A10E2A7;
	Fri,  1 Apr 2022 11:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D4310E15A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 11:33:40 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D298483FC1;
 Fri,  1 Apr 2022 13:33:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648812819;
 bh=7mI1Xyvp7m09/oXyweASKz6IcLCF8bQJwz991pm1P9A=;
 h=From:To:Cc:Subject:Date:From;
 b=C22OKG2EXr6+mDsJBKZNnwV8A0nnXBCNjqdky7h9RxtArP3b2uIoNJtldG4bY19kT
 LXuTxfeitKwVhci6Gk2iIKYdZBfbrtLOjjci7vK7220RLJMKOV1CdzEBvZqIztIksY
 XE6qVfpHUxIVUsumoP6wxse3uxuNTmpnZv6KRydkI9JY6RXtaYGZNAmZ7hXhPzJ6zo
 jdTBp9C+D3ak97vISCokxb5OyqKBynLruKKxj5iopfJxAoUVkLDAG+eKn307Br8ohk
 /IxjAA+kgKVJmGLc1Ukz8VrTKFGJR0IVkAjiGQBeav8R6GvrrBmaI+CCpt9fK6DJzB
 QEjMom0H/PrGg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: icn6211: Drop I2C module owner assignment
Date: Fri,  1 Apr 2022 13:33:17 +0200
Message-Id: <20220401113317.7033-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The module owner = THIS_MODULE is set by I2C core, drop duplicate assignment.

Fixes: 8dde6f7452a1 ("drm: bridge: icn6211: Add I2C configuration support")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index e29de7ce78b9..2ae35c54ae97 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -686,7 +686,6 @@ static struct i2c_driver chipone_i2c_driver = {
 	.id_table = chipone_i2c_id,
 	.driver = {
 		.name = "chipone-icn6211-i2c",
-		.owner = THIS_MODULE,
 		.of_match_table = chipone_of_match,
 	},
 };
-- 
2.35.1

