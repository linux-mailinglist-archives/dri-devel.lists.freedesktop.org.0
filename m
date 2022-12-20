Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC9C652DF9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED1810E441;
	Wed, 21 Dec 2022 08:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD69310E3EA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 20:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671567418; cv=none; d=zohomail.in; s=zohoarc; 
 b=RxpB9Qx89WiayJO/tFTPgNV32PzkUlETnWLKRcX8u+AnwyHQhTCH2R615iv8lwMrDhB37f8aU36eP5vpVIMtCQJx6fpK8QFoCq8MkqeLvexDTL0yi7HQbbDcxNnNQok9bQpkoGh/MLRIdrY8HUQ++SwNeg6X9WGCe5l+e7eBXWQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671567418;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=8orTNZ7jH2IbVd6BJiHzi5ZaE1cvsLVmvg/u/utvjZI=; 
 b=C09vsTbVxoiz51tNkaCe9OVR6oEz8Uo1uolntirF0lnQjckcj73wq4LtU1Oqlhuo8cdyMW2DhnhT2YDiIpzvKSPT+bBgWFBzgCrroU66oMk7kyJ2REtff4aqhkJNHbCarqysbeGmpQTIuFIsQjftL9valWwvcEM2pLdNIz5hfdY=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671567418; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=8orTNZ7jH2IbVd6BJiHzi5ZaE1cvsLVmvg/u/utvjZI=;
 b=ANsucVNkTucFGn5//1vyncsUXHFq8K2uGUNYDW9fTXlRST1JWlOTtrjrEC7PpM4A
 amC2C8LflBqaWhOjzt2X3rnGnxGYDt1U4VEiQS4NZyvdC5xvDh3Z4X9QPfU9plwurgR
 2vSsWR2GGHhCTWX/BCaswIN+eHAcsCtOFU08zs3I=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1671567418345814.024395625998;
 Wed, 21 Dec 2022 01:46:58 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <da27fd5d4725a8becd426c01ba5652a44cf62ce5.1671566741.git.code@siddh.me>
Subject: [PATCH 01/10] drm: Remove usage of deprecated DRM_INFO
Date: Wed, 21 Dec 2022 01:46:36 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1671566741.git.code@siddh.me>
References: <cover.1671566741.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 21 Dec 2022 08:29:21 +0000
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

drm_print.h says DRM_INFO is deprecated.
Thus, use newer printing macros drm_info() and pr_info().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_client_modeset.c | 2 +-
 drivers/gpu/drm/drm_connector.c      | 7 ++++---
 drivers/gpu/drm/drm_drv.c            | 2 +-
 drivers/gpu/drm/drm_pci.c            | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_cli=
ent_modeset.c
index d553e793e673..2b76d4828c5f 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -335,7 +335,7 @@ static bool drm_client_target_cloned(struct drm_device =
*dev,
 =09=09DRM_DEBUG_KMS("can clone using 1024x768\n");
 =09=09return true;
 =09}
-=09DRM_INFO("kms: can't enable cloning when we probably wanted to.\n");
+=09drm_info(dev, "kms: can't enable cloning when we probably wanted to.\n"=
);
 =09return false;
 }
=20
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 547356e00341..34c26b2a974e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -165,13 +165,14 @@ static void drm_connector_get_cmdline_mode(struct drm=
_connector *connector)
 =09=09return;
=20
 =09if (mode->force) {
-=09=09DRM_INFO("forcing %s connector %s\n", connector->name,
-=09=09=09 drm_get_connector_force_name(mode->force));
+=09=09drm_info(connector->dev, "forcing %s connector %s\n",
+=09=09=09 connector->name, drm_get_connector_force_name(mode->force));
 =09=09connector->force =3D mode->force;
 =09}
=20
 =09if (mode->panel_orientation !=3D DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
-=09=09DRM_INFO("cmdline forces connector %s panel_orientation to %d\n",
+=09=09drm_info(connector->dev,
+=09=09=09 "cmdline forces connector %s panel_orientation to %d\n",
 =09=09=09 connector->name, mode->panel_orientation);
 =09=09drm_connector_set_panel_orientation(connector,
 =09=09=09=09=09=09    mode->panel_orientation);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 73b845a75d52..bc98e4bcf2c1 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -938,7 +938,7 @@ int drm_dev_register(struct drm_device *dev, unsigned l=
ong flags)
 =09if (drm_core_check_feature(dev, DRIVER_MODESET))
 =09=09drm_modeset_register_all(dev);
=20
-=09DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
+=09drm_info(dev, "Initialized %s %d.%d.%d %s for %s on minor %d\n",
 =09=09 driver->name, driver->major, driver->minor,
 =09=09 driver->patchlevel, driver->date,
 =09=09 dev->dev ? dev_name(dev->dev) : "virtual device",
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 39d35fc3a43b..18cf7fa23698 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -262,7 +262,7 @@ void drm_legacy_pci_exit(const struct drm_driver *drive=
r,
 =09=09}
 =09=09mutex_unlock(&legacy_dev_list_lock);
 =09}
-=09DRM_INFO("Module unloaded\n");
+=09pr_info("Module unloaded\n");
 }
 EXPORT_SYMBOL(drm_legacy_pci_exit);
=20
--=20
2.35.1


