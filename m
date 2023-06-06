Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FD725839
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C972910E45F;
	Wed,  7 Jun 2023 08:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CB410E220
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 11:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686048331; cv=none; d=zohomail.in; s=zohoarc; 
 b=HJfp1jjV8pp9vs+t7hkwlG9Kx7BVZ9Ap5d9rQdvYyFfb7Kq3uLK9oST2JFa3l85m6KUkm404jkKGA4o+GJdXiNFs4Td9q0NSt+Mag+by5fk7FP7+2sF35APG+De5dH6JbmBk9VBclXka94G/yxQOTgmfinHYfGRSQuWESHsfQF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686048331;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=PEHqKnuOJrKl1u5nUwlpoAtIMJXyDd2fpZkEHcGqRl0=; 
 b=G2zYTmDkp1DpJ6WkrFOlYuu6/mzKeJEhC2WDRe+DwkgIxxyeBQSGaq1VSc1/smr59ktVSUxcIA5IaScHW50DUutvePwqDRVJuixFlCbM24+aVmQ22sVLkvZ5DN/j7Q+MoVZVB8Wd1X84vSnFaAHYR79k3LH0/fVsK0aNjNdsCEw=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686048331; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=PEHqKnuOJrKl1u5nUwlpoAtIMJXyDd2fpZkEHcGqRl0=;
 b=llf/bAIDtg5lnjKluqj8OoIZREW1I2t1CIjsq3lprL6CbboN02J2KMBqL0HdkJyr
 DZUKvtJIZcBnlClaiQfD/fY9WihIr8RptYvEgK+8HN1cElEKdrjGpH1GcZQuygUZMxS
 9fB48hGa6VHgLakeyYHX5z3mVrAo4Uln9fUvw62I=
Received: from kampyooter.. (122.176.141.156 [122.176.141.156]) by mx.zoho.in
 with SMTPS id 1686048328461439.7904058464494;
 Tue, 6 Jun 2023 16:15:28 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <bff523677c65a4a6b1c06152b154cf5651f51d68.1686047727.git.code@siddh.me>
Subject: [PATCH v9 1/8] Revert "drm: mipi-dsi: Convert logging to drm_*
 functions."
Date: Tue,  6 Jun 2023 16:15:15 +0530
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1686047727.git.code@siddh.me>
References: <cover.1686047727.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 1040e424353f5f4d39f6f3aa8723eb3bd6ea6446.

It used an incorrect way to use drm_* functions. Only drm_device ptrs
should be passed, but the mentioned commit passed mipi_dsi_host ptr.
It worked by accident due to macro magic.

Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.=
c
index 3fd6c733ff4e..a37af4edf394 100644
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
 =09if (of_alias_from_compatible(node, info.type, sizeof(info.type)) < 0) {
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


