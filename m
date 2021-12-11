Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEDC47171B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 23:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFFF10E2A7;
	Sat, 11 Dec 2021 22:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id A534A10E2A7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 22:19:23 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id 87B29E74225; Sat, 11 Dec 2021 23:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.1
Received: from astat.fritz.box (a89-183-15-126.net-htp.de [89.183.15.126])
 by lynxeye.de (Postfix) with ESMTPA id A443CE74023;
 Sat, 11 Dec 2021 23:18:51 +0100 (CET)
From: Lucas Stach <dev@lynxeye.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/2] drm/imx/dcss: add missing drm_bridge.h include
Date: Sat, 11 Dec 2021 23:18:47 +0100
Message-Id: <20211211221848.1665958-1-dev@lynxeye.de>
X-Mailer: git-send-email 2.31.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This has been pulled in via some other include before, which is no
longer true.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 9b84df34a6a1..96a9517021fe 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
-- 
2.31.1

