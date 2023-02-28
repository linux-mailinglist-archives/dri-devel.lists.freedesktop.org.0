Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BF46A55BB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 10:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2340810E668;
	Tue, 28 Feb 2023 09:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A25210E665
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 09:25:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1677576326; cv=none; d=zohomail.in; s=zohoarc; 
 b=CaQ3oCAE80NJEq2uz+ehV1dPFx9wNIjOit1oWZm+xlWmVglBhUPI4xppx+gkV+Ue9H+rN0W5+QYZfqi4mSuNOoHrj3TAPrtq/ejnbSjn1/Lc1napM8J8YQPaHLHCoxVinUJrO8HVf26TvU6G6tmlRo1Rgt75cTLaYfTJZyvW/Ns=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1677576326;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=6CLCmJmHWwtI4U9t4pv3KYlKSLZ4OYzXEltpQk2xids=; 
 b=UoAokj8V4J5AaAlxtQ7owXBjMLTC/H92zQlqtmyFOnNozZDaOU50FpqUPwuEwgn7hNPGLai7rLVMZ2G4QnbmHfYjFgN6mn+UIzAJ23MKWQqiwCSimFoFmNBJKQxZmrlB52kZPDC8nN2Fwujy5Hf5E9bSsR43hymD4yj8A+FdNMc=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677576326; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=6CLCmJmHWwtI4U9t4pv3KYlKSLZ4OYzXEltpQk2xids=;
 b=cpJ2uwfaiMwY9Yx0sxTvyAywY6LFNWuVxLjEF1rIDVEqKJhpVmP3HHBa7iVWdSQN
 OLH5W74uCjCfzE4UGO8HqI+kLieEbN1Q9+QRhpZtrX+z0csNY1FrZp5Y55g9DEvpk1j
 xN2RWpdwxrKhCIFUZwe/kxrM+yi6QZx3snrAAmSU=
Received: from kampyooter.. (106.213.255.81 [106.213.255.81]) by mx.zoho.in
 with SMTPS id 1677576324632539.3145603358423;
 Tue, 28 Feb 2023 14:55:24 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jim Cromie <jim.cromie@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Upadhyay <usuraj35@gmail.com>
Message-ID: <b6fe10df4a4a6b2fc29a71904a8eaca851c43f0b.1677574322.git.code@siddh.me>
Subject: [PATCH v8 3/8] drm: Remove usage of deprecated DRM_INFO
Date: Tue, 28 Feb 2023 14:55:07 +0530
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

drm_print.h says DRM_INFO is deprecated in favor of drm_info().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_client_modeset.c | 2 +-
 drivers/gpu/drm/drm_connector.c      | 7 ++++---
 drivers/gpu/drm/drm_drv.c            | 2 +-
 drivers/gpu/drm/drm_pci.c            | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_cli=
ent_modeset.c
index 1b12a3c201a3..ae19734974b5 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -331,7 +331,7 @@ static bool drm_client_target_cloned(struct drm_device =
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
index ca5fb54b7aab..cd1a23fc82e1 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -168,13 +168,14 @@ static void drm_connector_get_cmdline_mode(struct drm=
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
index c6eb8972451a..b08b502285c7 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -941,7 +941,7 @@ int drm_dev_register(struct drm_device *dev, unsigned l=
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
index 39d35fc3a43b..7dfb837d1325 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -262,7 +262,7 @@ void drm_legacy_pci_exit(const struct drm_driver *drive=
r,
 =09=09}
 =09=09mutex_unlock(&legacy_dev_list_lock);
 =09}
-=09DRM_INFO("Module unloaded\n");
+=09drm_info(NULL, "Module unloaded\n");
 }
 EXPORT_SYMBOL(drm_legacy_pci_exit);
=20
--=20
2.39.2


