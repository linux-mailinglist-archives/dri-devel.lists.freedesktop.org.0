Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E94725854
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC8110E486;
	Wed,  7 Jun 2023 08:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E9F10E14B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 18:30:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686076233; cv=none; d=zohomail.in; s=zohoarc; 
 b=bZW3/WGCfuumu8W4M1K/uLEafX1IfLI/WEXH5AmQ46sAWtZy2Bys4tX8rHLaVpYv6a2drqEtIBQb4/1Qwv5ISXHZQMBsid4FUcyUOAMBzrnBZm2hMlPUCoKaql2EZ0tB993H5ixnph5nrmw7JXnmuYt1ViHQRWEG/spvLSvD718=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686076233;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=xl4O/nBW/TeUPKSNvnMq+HaBVHdPkTU4hMluwC6pfD8=; 
 b=DkxeTXAYjM3ZdfiEv4lK2l/IIbmeZAyOPYFMaF7aHJDMXcZslN368+U1PYXPXA/GSm1QXRuOmIlqqybSmozzzPboHzuhASVOtmtP7leIvgEPNyPOYb2H7wRPw+9+XrSJrrmPg6ZEL+aPGrKG42GbZAS99pFdmFFkf/7Aj/rdtZI=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686076233; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=xl4O/nBW/TeUPKSNvnMq+HaBVHdPkTU4hMluwC6pfD8=;
 b=vKf3UJeCqpdVH6CwRM1vhYLV2scUa7Rml7ARCfhc0OCKS9D+Qvvo6ULxy6oZRgtz
 9hmxn5qtpbkpM2gmH2vN31pIUm/LFfRsvwu2ndrDlJBYuanFS4f7wqTmawNyEgDDMy5
 IdUo99UBt3IaGqeuBiJyU+kMrdyNttvuSP9pFJ1Q=
Received: from kampyooter.. (122.176.141.156 [122.176.141.156]) by mx.zoho.in
 with SMTPS id 16860762309911009.4921086079817;
 Wed, 7 Jun 2023 00:00:30 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <35def11d3722b361bc394c3d297adea922db5fd9.1686075579.git.code@siddh.me>
Subject: [PATCH v10 9/9] drm: Remove superfluous print statements in DRM core
Date: Wed,  7 Jun 2023 00:00:10 +0530
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1686075579.git.code@siddh.me>
References: <cover.1686075579.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:26 +0000
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

There are a couple of superfluous print statements using the drm_*
macros, which do stuff like printing newlines, print OOM messages
(OOM while allocating memory is already supposed to be noisy), and
printing strings like "Initialised" with no extra info whatsoever.

Thus, remove a couple of these superfluous strings.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_client_modeset.c | 3 ---
 drivers/gpu/drm/drm_context.c        | 1 -
 drivers/gpu/drm/drm_crtc_helper.c    | 2 --
 drivers/gpu/drm/drm_drv.c            | 7 -------
 drivers/gpu/drm/drm_file.c           | 2 --
 drivers/gpu/drm/drm_gem.c            | 1 -
 drivers/gpu/drm/drm_hashtab.c        | 1 -
 drivers/gpu/drm/drm_legacy_misc.c    | 1 -
 drivers/gpu/drm/drm_mipi_dbi.c       | 2 --
 drivers/gpu/drm/drm_pci.c            | 6 ------
 drivers/gpu/drm/drm_scatter.c        | 2 --
 11 files changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_cli=
ent_modeset.c
index 4e08ae688b83..e241f9aa5a16 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -793,8 +793,6 @@ int drm_client_modeset_probe(struct drm_client_dev *cli=
ent, unsigned int width,
 =09int i, ret =3D 0;
 =09bool *enabled;
=20
-=09drm_dbg_kms(dev, "\n");
-
 =09if (!width)
 =09=09width =3D dev->mode_config.max_width;
 =09if (!height)
@@ -824,7 +822,6 @@ int drm_client_modeset_probe(struct drm_client_dev *cli=
ent, unsigned int width,
 =09offsets =3D kcalloc(connector_count, sizeof(*offsets), GFP_KERNEL);
 =09enabled =3D kcalloc(connector_count, sizeof(bool), GFP_KERNEL);
 =09if (!crtcs || !modes || !enabled || !offsets) {
-=09=09drm_err(client->dev, "Memory allocation failed\n");
 =09=09ret =3D -ENOMEM;
 =09=09goto out;
 =09}
diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
index 8b7b925aee97..c8373294cce0 100644
--- a/drivers/gpu/drm/drm_context.c
+++ b/drivers/gpu/drm/drm_context.c
@@ -382,7 +382,6 @@ int drm_legacy_addctx(struct drm_device *dev, void *dat=
a,
=20
 =09ctx_entry =3D kmalloc(sizeof(*ctx_entry), GFP_KERNEL);
 =09if (!ctx_entry) {
-=09=09drm_dbg_core(dev, "out of memory\n");
 =09=09return -ENOMEM;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_h=
elper.c
index 59e7b86eab93..fcf539439880 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -567,8 +567,6 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set=
,
 =09int ret;
 =09int i;
=20
-=09drm_dbg_kms(NULL, "\n");
-
 =09BUG_ON(!set);
 =09BUG_ON(!set->crtc);
 =09BUG_ON(!set->crtc->helper_private);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7adf10cc6e67..86b0df358184 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -166,8 +166,6 @@ static int drm_minor_register(struct drm_device *dev, u=
nsigned int type)
 =09unsigned long flags;
 =09int ret;
=20
-=09drm_dbg_core(dev, "\n");
-
 =09minor =3D *drm_minor_get_slot(dev, type);
 =09if (!minor)
 =09=09return 0;
@@ -422,8 +420,6 @@ void drm_minor_release(struct drm_minor *minor)
  */
 void drm_put_dev(struct drm_device *dev)
 {
-=09drm_dbg_core(NULL, "\n");
-
 =09if (!dev) {
 =09=09drm_err(NULL, "cleanup called no dev\n");
 =09=09return;
@@ -1030,8 +1026,6 @@ static int drm_stub_open(struct inode *inode, struct =
file *filp)
 =09struct drm_minor *minor;
 =09int err;
=20
-=09drm_dbg_core(NULL, "\n");
-
 =09minor =3D drm_minor_acquire(iminor(inode));
 =09if (IS_ERR(minor))
 =09=09return PTR_ERR(minor);
@@ -1099,7 +1093,6 @@ static int __init drm_core_init(void)
=20
 =09drm_core_init_complete =3D true;
=20
-=09drm_dbg_core(NULL, "Initialized\n");
 =09return 0;
=20
 error:
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 883d83bc0e3d..24c78f7ec101 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -454,8 +454,6 @@ EXPORT_SYMBOL(drm_open);
=20
 void drm_lastclose(struct drm_device * dev)
 {
-=09drm_dbg_core(dev, "\n");
-
 =09if (dev->driver->lastclose)
 =09=09dev->driver->lastclose(dev);
 =09drm_dbg_core(dev, "driver lastclose completed\n");
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 3d88f0483fdf..43326cb4b4f6 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -101,7 +101,6 @@ drm_gem_init(struct drm_device *dev)
 =09vma_offset_manager =3D drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 =09=09=09=09=09  GFP_KERNEL);
 =09if (!vma_offset_manager) {
-=09=09drm_err(dev, "out of memory\n");
 =09=09return -ENOMEM;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_hashtab.c b/drivers/gpu/drm/drm_hashtab.c
index 357f20d73b43..acc40d3ebb2a 100644
--- a/drivers/gpu/drm/drm_hashtab.c
+++ b/drivers/gpu/drm/drm_hashtab.c
@@ -53,7 +53,6 @@ int drm_ht_create(struct drm_open_hash *ht, unsigned int =
order)
 =09else
 =09=09ht->table =3D vzalloc(array_size(size, sizeof(*ht->table)));
 =09if (!ht->table) {
-=09=09drm_err(NULL, "Out of memory for hash table\n");
 =09=09return -ENOMEM;
 =09}
 =09return 0;
diff --git a/drivers/gpu/drm/drm_legacy_misc.c b/drivers/gpu/drm/drm_legacy=
_misc.c
index ad0eef292cb0..69a51f5150e3 100644
--- a/drivers/gpu/drm/drm_legacy_misc.c
+++ b/drivers/gpu/drm/drm_legacy_misc.c
@@ -70,7 +70,6 @@ int drm_legacy_setup(struct drm_device * dev)
 =09=09return ret;
=20
=20
-=09drm_dbg_core(dev, "\n");
 =09return 0;
 }
=20
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.=
c
index 793fdd7da1d0..286cfafd022e 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -409,8 +409,6 @@ void mipi_dbi_pipe_disable(struct drm_simple_display_pi=
pe *pipe)
 {
 =09struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(pipe->crtc.dev);
=20
-=09drm_dbg_kms(&dbidev->drm, "\n");
-
 =09if (dbidev->backlight)
 =09=09backlight_disable(dbidev->backlight);
 =09else
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 485ec407a115..5cdfcd38174e 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -155,8 +155,6 @@ static int drm_legacy_get_pci_dev(struct pci_dev *pdev,
 =09if (IS_ERR(dev))
 =09=09return PTR_ERR(dev);
=20
-=09drm_dbg_core(dev, "\n");
-
 =09ret =3D pci_enable_device(pdev);
 =09if (ret)
 =09=09goto err_free;
@@ -203,8 +201,6 @@ int drm_legacy_pci_init(const struct drm_driver *driver=
,
 =09const struct pci_device_id *pid;
 =09int i;
=20
-=09drm_dbg_core(NULL, "\n");
-
 =09if (WARN_ON(!(driver->driver_features & DRIVER_LEGACY)))
 =09=09return -EINVAL;
=20
@@ -247,8 +243,6 @@ void drm_legacy_pci_exit(const struct drm_driver *drive=
r,
 {
 =09struct drm_device *dev, *tmp;
=20
-=09drm_dbg_core(NULL, "\n");
-
 =09if (!(driver->driver_features & DRIVER_LEGACY)) {
 =09=09WARN_ON(1);
 =09} else {
diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
index 08b3eb586484..59f755bf6ce9 100644
--- a/drivers/gpu/drm/drm_scatter.c
+++ b/drivers/gpu/drm/drm_scatter.c
@@ -82,8 +82,6 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *dat=
a,
 =09struct drm_sg_mem *entry;
 =09unsigned long pages, i, j;
=20
-=09drm_dbg_core(dev, "\n");
-
 =09if (!drm_core_check_feature(dev, DRIVER_LEGACY))
 =09=09return -EOPNOTSUPP;
=20
--=20
2.39.2


