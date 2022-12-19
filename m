Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F0651F1F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B3810E399;
	Tue, 20 Dec 2022 10:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE88D10E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 14:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671459814; cv=none; d=zohomail.in; s=zohoarc; 
 b=acZ1fov4ki9u2AnkKuWBzsGnuiDOCWbHLX4PdhHmIH2kGT/Gr9pjQGOFU5UwWtQkKPFYm+Q49escKKx3H2yYY/S9Q1e/LBn5IdxDXPiyA4zLcTjFvl0BiQo20zvTlw5eRRr5w5Kn9I8SWWKK7jsLxe4A0Z5tnsTBIriZ3o35ueE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671459814;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=/KkACYHujfaGKX6lGYzfdfF8MvLQer0ZrR0Xvcz+8Pg=; 
 b=G1PZhlnGUFJQfIXR3sUFFDrxr31/MdjOB6zp4QzztXRMLAdSru3jLaSO+wG9eEovnFA0UBfCyRbwIXjI9rMyEHFU6Nn+Gvi8qjd9rJWyuWUd8sMZjXnQ/GsUMBwHdZIFbj1c760h6Y/bJ5YrE587F5hYhmiJFdPMrCcv+vgcjX8=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671459814; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=/KkACYHujfaGKX6lGYzfdfF8MvLQer0ZrR0Xvcz+8Pg=;
 b=qB4uFp3H3gNfY41OgmzaL/Y9TOCV0FdF20zOKObIIaWaEK3W9aYspuPROiXBdgIy
 brEir+1l1y+CFJfptk5qaGTnWwQpbDNeD1xNtenE6SgimLLnsf8J+jh94gkp9Xl49kz
 coV4kP9qKLKtpx18WSO88sYFuOKhQka/ea8chAgs=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1671459813592928.3801402610421;
 Mon, 19 Dec 2022 19:53:33 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20221219142319.79827-1-code@siddh.me>
Subject: [PATCH] drm: Replace DRM_INFO() with pr_info()
Date: Mon, 19 Dec 2022 19:53:19 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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

Line 536 of drm_print.h says DRM_INFO() is deprecated
in favor of pr_info().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_client_modeset.c |  2 +-
 drivers/gpu/drm/drm_connector.c      |  8 ++++----
 drivers/gpu/drm/drm_drv.c            | 10 +++++-----
 drivers/gpu/drm/drm_edid_load.c      | 14 +++++++-------
 drivers/gpu/drm/drm_pci.c            |  2 +-
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_cli=
ent_modeset.c
index bbc535cc50dd..2e2891614c58 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -335,7 +335,7 @@ static bool drm_client_target_cloned(struct drm_device =
*dev,
 =09=09DRM_DEBUG_KMS("can clone using 1024x768\n");
 =09=09return true;
 =09}
-=09DRM_INFO("kms: can't enable cloning when we probably wanted to.\n");
+=09pr_info("[drm] kms: can't enable cloning when we probably wanted to.\n"=
);
 =09return false;
 }
=20
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 61c29ce74b03..26a03b70e2c6 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -165,14 +165,14 @@ static void drm_connector_get_cmdline_mode(struct drm=
_connector *connector)
 =09=09return;
=20
 =09if (mode->force) {
-=09=09DRM_INFO("forcing %s connector %s\n", connector->name,
-=09=09=09 drm_get_connector_force_name(mode->force));
+=09=09pr_info("[drm] forcing %s connector %s\n", connector->name,
+=09=09=09drm_get_connector_force_name(mode->force));
 =09=09connector->force =3D mode->force;
 =09}
=20
 =09if (mode->panel_orientation !=3D DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
-=09=09DRM_INFO("cmdline forces connector %s panel_orientation to %d\n",
-=09=09=09 connector->name, mode->panel_orientation);
+=09=09pr_info("[drm] cmdline forces connector %s panel_orientation to %d\n=
",
+=09=09=09connector->name, mode->panel_orientation);
 =09=09drm_connector_set_panel_orientation(connector,
 =09=09=09=09=09=09    mode->panel_orientation);
 =09}
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 203bf8d6c34c..1486df097908 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -898,11 +898,11 @@ int drm_dev_register(struct drm_device *dev, unsigned=
 long flags)
 =09if (drm_core_check_feature(dev, DRIVER_MODESET))
 =09=09drm_modeset_register_all(dev);
=20
-=09DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
-=09=09 driver->name, driver->major, driver->minor,
-=09=09 driver->patchlevel, driver->date,
-=09=09 dev->dev ? dev_name(dev->dev) : "virtual device",
-=09=09 dev->primary->index);
+=09pr_info("[drm] Initialized %s %d.%d.%d %s for %s on minor %d\n",
+=09=09driver->name, driver->major, driver->minor,
+=09=09driver->patchlevel, driver->date,
+=09=09dev->dev ? dev_name(dev->dev) : "virtual device",
+=09=09dev->primary->index);
=20
 =09goto out_unlock;
=20
diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_loa=
d.c
index 37d8ba3ddb46..d3cb198380c5 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -242,9 +242,9 @@ static void *edid_load(struct drm_connector *connector,=
 const char *name,
 =09=09u8 *new_edid;
=20
 =09=09edid[EDID_LENGTH-1] +=3D edid[0x7e] - valid_extensions;
-=09=09DRM_INFO("Found %d valid extensions instead of %d in EDID data "
-=09=09    "\"%s\" for connector \"%s\"\n", valid_extensions,
-=09=09    edid[0x7e], name, connector_name);
+=09=09pr_info("[drm] Found %d valid extensions instead of %d in EDID data =
"
+=09=09=09"\"%s\" for connector \"%s\"\n", valid_extensions,
+=09=09=09edid[0x7e], name, connector_name);
 =09=09edid[0x7e] =3D valid_extensions;
=20
 =09=09new_edid =3D krealloc(edid, (valid_extensions + 1) * EDID_LENGTH,
@@ -253,10 +253,10 @@ static void *edid_load(struct drm_connector *connecto=
r, const char *name,
 =09=09=09edid =3D new_edid;
 =09}
=20
-=09DRM_INFO("Got %s EDID base block and %d extension%s from "
-=09    "\"%s\" for connector \"%s\"\n", (builtin >=3D 0) ? "built-in" :
-=09    "external", valid_extensions, valid_extensions =3D=3D 1 ? "" : "s",
-=09    name, connector_name);
+=09pr_info("[drm] Got %s EDID base block and %d extension%s from "
+=09=09"\"%s\" for connector \"%s\"\n", (builtin >=3D 0) ? "built-in" :
+=09=09"external", valid_extensions, valid_extensions =3D=3D 1 ? "" : "s",
+=09=09name, connector_name);
=20
 out:
 =09release_firmware(fw);
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 39d35fc3a43b..94ee194ce927 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -262,7 +262,7 @@ void drm_legacy_pci_exit(const struct drm_driver *drive=
r,
 =09=09}
 =09=09mutex_unlock(&legacy_dev_list_lock);
 =09}
-=09DRM_INFO("Module unloaded\n");
+=09pr_info("[drm] Module unloaded\n");
 }
 EXPORT_SYMBOL(drm_legacy_pci_exit);
=20
--=20
2.35.1


