Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A22DAB29
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA42B6E219;
	Tue, 15 Dec 2020 10:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BF66E1E8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlZgA010584
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029255;
 bh=dpSZmK9T5l1cjqkmPwMNHIn2DIsxX+Iamy41M5+pBpo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=JoYdTzegMH+4sXexj/AHDMnRZQN3655sgHneYU2iIEuELRfjKk30CpJuvch8r7BRJ
 MY6jLdtjI42tC9ujXKaoPB2P3Xapy1AszZkXsUlA2XC7VM3jhQua6Ob0tH8oz0nlX+
 E6E8C0aBC7qHZpbmJU+U1MpsyDVw56VcrmJBZI4I=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlZ03000590
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:35 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:35 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaL046467;
 Tue, 15 Dec 2020 04:47:34 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 35/84] drm/omap: panel-dsi-cm: use DEVICE_ATTR_RO
Date: Tue, 15 Dec 2020 12:46:08 +0200
Message-ID: <20201215104657.802264-36-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215104657.802264-1-tomi.valkeinen@ti.com>
References: <20201215104657.802264-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Use DEVICE_ATTR_RO helper instead of plain DEVICE_ATTR,
which makes the code a bit shorter and easier to read.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 72dce2fa8ced..95b0696436b0 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -214,7 +214,7 @@ static const struct backlight_ops dsicm_bl_ops = {
 	.update_status  = dsicm_bl_update_status,
 };
 
-static ssize_t dsicm_num_errors_show(struct device *dev,
+static ssize_t num_dsi_errors_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
@@ -234,7 +234,7 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", errors);
 }
 
-static ssize_t dsicm_hw_revision_show(struct device *dev,
+static ssize_t hw_revision_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
@@ -254,8 +254,8 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x\n", id1, id2, id3);
 }
 
-static DEVICE_ATTR(num_dsi_errors, S_IRUGO, dsicm_num_errors_show, NULL);
-static DEVICE_ATTR(hw_revision, S_IRUGO, dsicm_hw_revision_show, NULL);
+static DEVICE_ATTR_RO(num_dsi_errors);
+static DEVICE_ATTR_RO(hw_revision);
 
 static struct attribute *dsicm_attrs[] = {
 	&dev_attr_num_dsi_errors.attr,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
