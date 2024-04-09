Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8654C89E0FC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7500112E35;
	Tue,  9 Apr 2024 17:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694D7112E35
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 17:03:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruEsD-0003vW-AH; Tue, 09 Apr 2024 19:03:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruEsC-00BKyD-PZ; Tue, 09 Apr 2024 19:03:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1ruEsC-00H4tY-2F;
 Tue, 09 Apr 2024 19:03:04 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] drm/mediatek: Convert to platform remove callback
 returning void
Date: Tue,  9 Apr 2024 19:02:49 +0200
Message-ID: <4a64dfbfbcfdf9b7cd46bc8026223e69a4b453b4.1712681770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=VwRWky1VWOusSXnjzSNpsSphhbzVM9VxQY/a/Lo8lzk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmFXS6nWcYw968uPFOgHg0DcZpHf5segZ9N6fnT
 hpUu7WXi+CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhV0ugAKCRCPgPtYfRL+
 TuXjB/9tEi9LvW4ZGODljn+u9HTsgXsFfJmid6g+E9H5VbOBUwPZHHVgYtrUuVfrig7YSGW1NP1
 nvuIEECqnUQTP68kTSj0ZJGJB8s6qIhCfNAPsJGB2pUf7dDX+9GJlIpFYBhYUxWtKwpdbO2AV/e
 h6g/yHoPt1QP9E/0Kz9nEcfk5QmnAh/JGZqyIqhALVG106jVKvAKA0NWfmM5VWNfr9Wn6v7AIch
 +vej+ibQ59GMT2h1RwLqVN5cdXmsolveC1gX5uvVancACP7atKRuQnBCQVwoCPqV+D5orjr/KOe
 mEh3Dm/QSfRdKuGr5vOPp6k6d1BZCC7732hqFfEiXS6Jqr7+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/mediatek/mtk_padding.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index 0d6451c149b6..9f92b720aaae 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -137,10 +137,9 @@ static int mtk_padding_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_padding_remove(struct platform_device *pdev)
+static void mtk_padding_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_padding_component_ops);
-	return 0;
 }
 
 static const struct of_device_id mtk_padding_driver_dt_match[] = {
@@ -151,7 +150,7 @@ MODULE_DEVICE_TABLE(of, mtk_padding_driver_dt_match);
 
 struct platform_driver mtk_padding_driver = {
 	.probe		= mtk_padding_probe,
-	.remove		= mtk_padding_remove,
+	.remove_new	= mtk_padding_remove,
 	.driver		= {
 		.name	= "mediatek-disp-padding",
 		.owner	= THIS_MODULE,
-- 
2.43.0

