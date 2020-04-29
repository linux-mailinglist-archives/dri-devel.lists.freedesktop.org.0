Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB04C1BE283
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 17:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4616EF2E;
	Wed, 29 Apr 2020 15:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730636EF2E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 15:24:02 +0000 (UTC)
IronPort-SDR: Ifo5tT+2fZ94vJVLzzmlL8mbvQ8E6S3LfC9n4NXe4xp6U8wedCG9KOsQoQS7JNMlLKgghR3ZXJ
 /CRpGgR/c0oQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 08:24:01 -0700
IronPort-SDR: nzjsFNvyy0S34GwpF+Xrz29llLwpQocp/mXmhP+dHU8ltQNSUMd1DID1/PelAguNsVyShwFMEp
 7TuvsaWEtEqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="367837819"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga001.fm.intel.com with ESMTP; 29 Apr 2020 08:24:00 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 29 Apr 2020 08:24:00 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.13]) by
 FMSMSX126.amr.corp.intel.com ([169.254.1.251]) with mapi id 14.03.0439.000;
 Wed, 29 Apr 2020 08:24:00 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@redhat.com"
 <airlied@redhat.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "kraxel@redhat.com" <kraxel@redhat.com>, "noralf@tronnes.org"
 <noralf@tronnes.org>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "john.p.donnelly@oracle.com" <john.p.donnelly@oracle.com>
Subject: RE: [PATCH 03/17] drm/mgag200: Embed connector instance in struct
 mga_device
Thread-Topic: [PATCH 03/17] drm/mgag200: Embed connector instance in struct
 mga_device
Thread-Index: AQHWHjMWQFnzS05a7Uq9hitlU0zHwKiQNgQA
Date: Wed, 29 Apr 2020 15:24:00 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E86630102137539@FMSMSX108.amr.corp.intel.com>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-4-tzimmermann@suse.de>
In-Reply-To: <20200429143238.10115-4-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Thomas Zimmermann
>Sent: Wednesday, April 29, 2020 10:32 AM
>To: airlied@redhat.com; daniel@ffwll.ch; kraxel@redhat.com;
>noralf@tronnes.org; sam@ravnborg.org; john.p.donnelly@oracle.com
>Cc: Thomas Zimmermann <tzimmermann@suse.de>; dri-
>devel@lists.freedesktop.org
>Subject: [PATCH 03/17] drm/mgag200: Embed connector instance in struct
>mga_device
>
>Storing the connector instance in struct mga_device avoids some
>dynamic memory allocation. Done im preparation of converting

s/im/in/

You might also want to comment that you clean up the i2c info on
error.

Straight forward replacement of pointer with an embedded data structure:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>mgag200 to simple-KMS helpers.
>
>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>---
> drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 +
> drivers/gpu/drm/mgag200/mgag200_mode.c | 54 ++++++++++++++-----------
>-
> 2 files changed, 31 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h
>b/drivers/gpu/drm/mgag200/mgag200_drv.h
>index de3181bd63ca0..09b43a0ff6bbf 100644
>--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>@@ -164,6 +164,7 @@ struct mga_device {
> 	/* SE model number stored in reg 0x1e24 */
> 	u32 unique_rev_id;
>
>+	struct mga_connector connector;
> 	struct drm_encoder encoder;
> };
>
>diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c
>b/drivers/gpu/drm/mgag200/mgag200_mode.c
>index ce41bebfdd1a2..eaa3fca7216ac 100644
>--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>@@ -1444,6 +1444,10 @@ static void mga_crtc_init(struct mga_device
>*mdev)
> 	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
> }
>
>+/*
>+ * Connector
>+ */
>+
> static int mga_vga_get_modes(struct drm_connector *connector)
> {
> 	struct mga_connector *mga_connector =
>to_mga_connector(connector);
>@@ -1568,7 +1572,6 @@ static void mga_connector_destroy(struct
>drm_connector *connector)
> 	struct mga_connector *mga_connector =
>to_mga_connector(connector);
> 	mgag200_i2c_destroy(mga_connector->i2c);
> 	drm_connector_cleanup(connector);
>-	kfree(connector);
> }
>
> static const struct drm_connector_helper_funcs
>mga_vga_connector_helper_funcs = {
>@@ -1582,37 +1585,39 @@ static const struct drm_connector_funcs
>mga_vga_connector_funcs = {
> 	.destroy = mga_connector_destroy,
> };
>
>-static struct drm_connector *mga_vga_init(struct drm_device *dev)
>+static int mgag200_vga_connector_init(struct mga_device *mdev)
> {
>-	struct drm_connector *connector;
>-	struct mga_connector *mga_connector;
>-
>-	mga_connector = kzalloc(sizeof(struct mga_connector),
>GFP_KERNEL);
>-	if (!mga_connector)
>-		return NULL;
>-
>-	connector = &mga_connector->base;
>-	mga_connector->i2c = mgag200_i2c_create(dev);
>-	if (!mga_connector->i2c)
>-		DRM_ERROR("failed to add ddc bus\n");
>+	struct drm_device *dev = mdev->dev;
>+	struct mga_connector *mconnector = &mdev->connector;
>+	struct drm_connector *connector = &mconnector->base;
>+	struct mga_i2c_chan *i2c;
>+	int ret;
>
>-	drm_connector_init_with_ddc(dev, connector,
>-				    &mga_vga_connector_funcs,
>-				    DRM_MODE_CONNECTOR_VGA,
>-				    &mga_connector->i2c->adapter);
>+	i2c = mgag200_i2c_create(dev);
>+	if (!i2c)
>+		drm_warn(dev, "failed to add DDC bus\n");
>
>+	ret = drm_connector_init_with_ddc(dev, connector,
>+					  &mga_vga_connector_funcs,
>+					  DRM_MODE_CONNECTOR_VGA,
>+					  &i2c->adapter);
>+	if (ret)
>+		goto err_mgag200_i2c_destroy;
> 	drm_connector_helper_add(connector,
>&mga_vga_connector_helper_funcs);
>
>-	drm_connector_register(connector);
>+	mconnector->i2c = i2c;
>
>-	return connector;
>-}
>+	return 0;
>
>+err_mgag200_i2c_destroy:
>+	mgag200_i2c_destroy(i2c);
>+	return ret;
>+}
>
> int mgag200_modeset_init(struct mga_device *mdev)
> {
> 	struct drm_encoder *encoder = &mdev->encoder;
>-	struct drm_connector *connector;
>+	struct drm_connector *connector = &mdev->connector.base;
> 	int ret;
>
> 	mdev->dev->mode_config.max_width =
>MGAG200_MAX_FB_WIDTH;
>@@ -1632,9 +1637,10 @@ int mgag200_modeset_init(struct mga_device
>*mdev)
> 	}
> 	encoder->possible_crtcs = 0x1;
>
>-	connector = mga_vga_init(mdev->dev);
>-	if (!connector) {
>-		DRM_ERROR("mga_vga_init failed\n");
>+	ret = mgag200_vga_connector_init(mdev);
>+	if (ret) {
>+		drm_err(mdev->dev,
>+			"mga_vga_connector_init() failed, error %d\n", ret);
> 		return -1;
> 	}
>
>--
>2.26.0
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
