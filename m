Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42696508AA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 09:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851C610E212;
	Mon, 19 Dec 2022 08:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9E610E212
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:42:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7BhD-0005YY-6F; Mon, 19 Dec 2022 09:40:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7BhB-000I8q-VN; Mon, 19 Dec 2022 09:40:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7BhB-006Gg0-8J; Mon, 19 Dec 2022 09:40:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emma Anholt <emma@anholt.net>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/vc4: dsi: Drop unused i2c include
Date: Mon, 19 Dec 2022 09:40:23 +0100
Message-Id: <20221219084023.1402282-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=670;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=hadv7ZR8i0L+jzyfPS4jD4+wIbYe3uCq0SXRYNxxRpI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjoCN0s0IcjB7n2BDNP+PsQ8yBFhucrwhLN+PT3TXK
 ToCJa1yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY6AjdAAKCRDB/BR4rcrsCTYPB/
 4xHxN17lHl4g/6G4DFGfu1AEIeKO7qwXstjvawpTM9b+/rSIZcAgEzo8vvmpqf0v5j0a59P0FQRo3n
 D57ADowbuCSjYEyngb5EihocF+Zo8KCSzrDWhdIJ4IeyAY2/aiCq+5D+49UuYY6nRY6ermsbu56fJu
 zbiz92Cejw81TVZJCMDhZBq8DsdqYBSt2yVwNW4PMvfcfMd8WMW88IyElTArxzaRHFabEmSAHV6/uc
 bsiErTjpWwxcMadZmCxSXRgsdcwX64OTSJ0JmAbx36z4YoZ0M6vCGZp6LCPi1XqmXKBQ3gHqVnjJMU
 1Bh+G4Klfqq3QnqIWJ8pt1cTQZvQda
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver doesn't make use of any symbol provided by <linux/i2c.h>. So
drop the include.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 878e05d79e81..08e95c1d4a04 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -24,7 +24,6 @@
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
-#include <linux/i2c.h>
 #include <linux/io.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
-- 
2.38.1

