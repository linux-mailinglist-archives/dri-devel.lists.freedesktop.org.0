Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D156A55B4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 10:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475F910E662;
	Tue, 28 Feb 2023 09:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9C710E65F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 09:25:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1677576324; cv=none; d=zohomail.in; s=zohoarc; 
 b=asf91VN0x3p5nULdmL/FkbpAhbeCcQ3j1OAe4D7xjncbfp1g1P9a77uFRFBzq/0kUyXzVkuAS22VEfTI3HnHeMo5CxpFUvIB5FeQYo27R2UcXSomBbxQLwbBOfS5s/JSTZfAIARHhzD0j5qdiTseGvr8RHioOIFA96lL9ptnnG0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1677576324;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=Y64ntFBkLjZ0E6rkb81rQzfqJquSTywmmGSYOvhB7GY=; 
 b=LyrHaJrK0Sfqtp0k1FNSKORFic63H1oKelEeRx17MoE6YBMCUquapA/RlTQgecN1u5qreyd8DOkuzDTjm4pvbkiVb90BdX2wxJCEeGt/TCyKL1vqJ8O1+DTZdec+K7bner6l35R0UPB3Pjztu1naYI/Lyvx4PdlXp/OZYqFI/Qc=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677576324; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Y64ntFBkLjZ0E6rkb81rQzfqJquSTywmmGSYOvhB7GY=;
 b=j+z7h/Mi3UhM8W7gOoW9S9Q397QHwUAP4Orm9BtMY58zCcW7FDIXcIu38UTa2PnF
 wEJxd/gQosx4ftOZ8kLc9m93yc54rc3mJO4LcJeq+oPsgQwg2hjxkzB0IBf7Vl4HYn6
 Kn9xMtxu2XDnfAUOSKmGhbvw9V2SvIK0SBVt2y8Y=
Received: from kampyooter.. (106.213.255.81 [106.213.255.81]) by mx.zoho.in
 with SMTPS id 1677576322236206.29584254968302;
 Tue, 28 Feb 2023 14:55:22 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jim Cromie <jim.cromie@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Upadhyay <usuraj35@gmail.com>
Message-ID: <e427dcb5cff953ace36df3225b8444da5cd83f8b.1677574322.git.code@siddh.me>
Subject: [PATCH v8 1/8] Revert "drm: mipi-dsi: Convert logging to drm_*
 functions."
Date: Tue, 28 Feb 2023 14:55:05 +0530
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1677574322.git.code@siddh.me>
References: <cover.1677574322.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 1040e424353f5f4d39f6f3aa8723eb3bd6ea6446.

It used an incorrect way to use drm_* functions. Only drm_device ptrs
should be passed, but the mentioned commit passed mipi_dsi_host ptr.
It worked by accident due to macro magic.

Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.=
c
index 4bc15fbd009d..398fac95dfc0 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -33,7 +33,6 @@
=20
 #include <drm/display/drm_dsc.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_print.h>
=20
 #include <video/mipi_display.h>
=20
@@ -156,18 +155,19 @@ static int mipi_dsi_device_add(struct mipi_dsi_device=
 *dsi)
 static struct mipi_dsi_device *
 of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *nod=
e)
 {
+=09struct device *dev =3D host->dev;
 =09struct mipi_dsi_device_info info =3D { };
 =09int ret;
 =09u32 reg;
=20
 =09if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {
-=09=09drm_err(host, "modalias failure on %pOF\n", node);
+=09=09dev_err(dev, "modalias failure on %pOF\n", node);
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
 =09ret =3D of_property_read_u32(node, "reg", &reg);
 =09if (ret) {
-=09=09drm_err(host, "device node %pOF has no valid reg property: %d\n",
+=09=09dev_err(dev, "device node %pOF has no valid reg property: %d\n",
 =09=09=09node, ret);
 =09=09return ERR_PTR(-EINVAL);
 =09}
@@ -202,21 +202,22 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *h=
ost,
 =09=09=09      const struct mipi_dsi_device_info *info)
 {
 =09struct mipi_dsi_device *dsi;
+=09struct device *dev =3D host->dev;
 =09int ret;
=20
 =09if (!info) {
-=09=09drm_err(host, "invalid mipi_dsi_device_info pointer\n");
+=09=09dev_err(dev, "invalid mipi_dsi_device_info pointer\n");
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
 =09if (info->channel > 3) {
-=09=09drm_err(host, "invalid virtual channel: %u\n", info->channel);
+=09=09dev_err(dev, "invalid virtual channel: %u\n", info->channel);
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
 =09dsi =3D mipi_dsi_device_alloc(host);
 =09if (IS_ERR(dsi)) {
-=09=09drm_err(host, "failed to allocate DSI device %ld\n",
+=09=09dev_err(dev, "failed to allocate DSI device %ld\n",
 =09=09=09PTR_ERR(dsi));
 =09=09return dsi;
 =09}
@@ -227,7 +228,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *hos=
t,
=20
 =09ret =3D mipi_dsi_device_add(dsi);
 =09if (ret) {
-=09=09drm_err(host, "failed to add DSI device %d\n", ret);
+=09=09dev_err(dev, "failed to add DSI device %d\n", ret);
 =09=09kfree(dsi);
 =09=09return ERR_PTR(ret);
 =09}
--=20
2.39.2


