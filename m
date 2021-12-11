Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB7047171D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 23:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C1F10E329;
	Sat, 11 Dec 2021 22:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id A6B5910E2B4
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 22:19:23 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id 03A4BE74217; Sat, 11 Dec 2021 23:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.1
Received: from astat.fritz.box (a89-183-15-126.net-htp.de [89.183.15.126])
 by lynxeye.de (Postfix) with ESMTPA id DB3F6E74214;
 Sat, 11 Dec 2021 23:18:51 +0100 (CET)
From: Lucas Stach <dev@lynxeye.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] drm/imx/dcss: select DRM_KMS_HELPER
Date: Sat, 11 Dec 2021 23:18:48 +0100
Message-Id: <20211211221848.1665958-2-dev@lynxeye.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211211221848.1665958-1-dev@lynxeye.de>
References: <20211211221848.1665958-1-dev@lynxeye.de>
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

DCSS can not be built without the DRM_KMS_HELPERs being available.
Select this symbol to disallow this invalid configuration.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 drivers/gpu/drm/imx/dcss/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 2b17a964ff05..4c2158dc5540 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -1,6 +1,7 @@
 config DRM_IMX_DCSS
 	tristate "i.MX8MQ DCSS"
 	select IMX_IRQSTEER
+	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select VIDEOMODE_HELPERS
 	depends on DRM && ARCH_MXC && ARM64
-- 
2.31.1

