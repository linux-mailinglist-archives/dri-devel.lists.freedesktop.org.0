Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B036C0D26
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 10:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6737510E2AE;
	Mon, 20 Mar 2023 09:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587D010E2AE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 09:23:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>) id 1peBk0-0000JK-TF
 for dri-devel@lists.freedesktop.org; Mon, 20 Mar 2023 10:23:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>) id 1peBk0-005QM4-AB
 for dri-devel@lists.freedesktop.org; Mon, 20 Mar 2023 10:23:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>) id 1peBjz-006P9A-4l
 for dri-devel@lists.freedesktop.org; Mon, 20 Mar 2023 10:23:43 +0100
Resent-From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Resent-Date: Mon, 20 Mar 2023 10:23:43 +0100
Resent-Message-ID: <20230320092343.luendfkxez37snrx@pengutronix.de>
Resent-To: dri-devel@lists.freedesktop.org
Received: from localhost ([127.0.0.1] helo=metis.ext.pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <kernel-bounces@pengutronix.de>)
 id 1pdelF-0002qV-Sw; Sat, 18 Mar 2023 23:10:49 +0100
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdelE-0002pF-2f; Sat, 18 Mar 2023 23:10:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdel8-0055u4-Vi; Sat, 18 Mar 2023 23:10:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdel8-005ylC-3e; Sat, 18 Mar 2023 23:10:42 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] drm/imx/lcdc: Fix compilation with CONFIG_OF=n
Date: Sat, 18 Mar 2023 23:10:27 +0100
Message-Id: <20230318221027.260115-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=FSqiR9aBXJSUY0XVqrxMkjdZ2pbfXEE8CENvTeIZw68=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFjbRYX0RiPWm6d1O2gUlODHR2zU1s5ON7II4B
 m47kVQA9G6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBY20QAKCRCPgPtYfRL+
 TrNzB/9KqR29DhCnkJXdJ8iz8uhmOgIwhUeL7Tke1CrxC1/cMtdW7dOPbjChqmOS/rr5rkxBpjz
 rwzT1RCiIBmwL+by2mzrmSB/9b8tikAHsVs95HWfptKSBOtYkHqlfDWFpnty2ssd2YBtdcheB93
 ht9W+o///CixUMgZrcIqzmFzk4g7Jbpa5znpi8BnDiby9Ay3PWtttjbIH/mAGoe9x0xtOYkg2AO
 T+u8GwreB+Nvwo1n32qXCjIhHbhXuO+OBMR+R4MU3wU++uHLxW3KQYk3QQOgyImPdrkp7xnHXfz
 9wqYvvu2rPz1IwlcTKpkxOlORNO88Qv/jVBWPCKUrKnAfZJL
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-PTX-Original-Recipient: kernel@pengutronix.de
X-BeenThere: kernel@pengutronix.de
X-Mailman-Version: 2.1.29
Precedence: list
X-PTX-Original-Recipient: ukl@pengutronix.de
X-TUID: N4lDfT0ca2vR
Tags: inbox
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel test robot <lkp@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver needs the include <drm/drm_bridge.h>. WIth CONFIG_OF enabled
this is provided by a conditional include in <drm/drm_of.h>.

To fix building the lcdc driver with CONFIG_OF=n, include
<drm/drm_bridge.h> explicitly.

Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303190127.uylmokJl-lkp@intel.com/
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 24bc7b310367..8e6d457917da 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // SPDX-FileCopyrightText: 2020 Marian Cichy <M.Cichy@pengutronix.de>
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>

base-commit: c87e859cdeb5d106cb861326e3135c606d61f88d
-- 
2.39.2



