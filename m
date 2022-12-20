Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200AC652DEB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C4610E42A;
	Wed, 21 Dec 2022 08:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1F810E3E6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 20:17:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671567422; cv=none; d=zohomail.in; s=zohoarc; 
 b=W3TG0C5mwc50UstfFrD1pPi5pFl/Hxkb7sUPDUWfau62NiOjHd+fcqvdZbcgzDPyFxri871qTKLOw1omO8HJLhMiP0ApcnKwZEGs/DhGwc77bBlhgiUS/0IS7Lvn7iZXi6YoBbQe/FuO8YR22ZDCscrhrKwaiHjBvbXe/s18GJM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671567422;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=LTD76litxO7Vl1R0d/vvaQmA7adDzUEsOSMgqIqT3OY=; 
 b=S498jzOlL3D9SbAPFZt3EIx8FNq74pMU93AtMHqaBNtuI/3DPFocNbE26bR9GZrHkktckLHaFvkcONGQJ/aiX3tL/ueld+wE5GG11yFfi/cZ9A3VvhM4tQwImqI5IYvOfDIwbKETsmGYVw5bDVWi8W+ggb/i/LWR22EO3fB2k+A=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671567422; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=LTD76litxO7Vl1R0d/vvaQmA7adDzUEsOSMgqIqT3OY=;
 b=WDooSW9uzUeXNYK/VQeO1+f1y18bnnql5kXD5NUUY8S3LYOAI32XKeXTgfvmuGyt
 EAf5MCjaP51vZVMjtWOaqH+1OUvt64oOqrWCJSU/iu/jeEhTru8iydAcTUOEr9ftspg
 dGe8e8TUoXrwIjJK67Iev+edl5oW4vQw/ZtTiDFY=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 16715674200411002.8769542041198;
 Wed, 21 Dec 2022 01:47:00 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <9ee72a50c1293ce1aa90e650076bad55e06f1d97.1671566741.git.code@siddh.me>
Subject: [PATCH 03/10] drm: Remove usage of deprecated DRM_ERROR
Date: Wed, 21 Dec 2022 01:46:38 +0530
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

drm_print.h says DRM_ERROR is deprecated.
Thus, use newer printing macros drm_err() and pr_err().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_bridge.c         |  8 ++++----
 drivers/gpu/drm/drm_bufs.c           |  8 ++++----
 drivers/gpu/drm/drm_client_modeset.c |  4 ++--
 drivers/gpu/drm/drm_context.c        |  4 ++--
 drivers/gpu/drm/drm_crtc_helper.c    |  8 ++++----
 drivers/gpu/drm/drm_debugfs_crc.c    |  3 ++-
 drivers/gpu/drm/drm_drv.c            | 16 ++++++++--------
 drivers/gpu/drm/drm_flip_work.c      |  2 +-
 drivers/gpu/drm/drm_framebuffer.c    |  3 ++-
 drivers/gpu/drm/drm_gem.c            |  2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
 drivers/gpu/drm/drm_hashtab.c        |  4 ++--
 drivers/gpu/drm/drm_lock.c           | 16 ++++++++--------
 drivers/gpu/drm/drm_mipi_dbi.c       |  2 +-
 drivers/gpu/drm/drm_mm.c             |  8 ++++----
 drivers/gpu/drm/drm_mode_config.c    |  2 +-
 drivers/gpu/drm/drm_modeset_helper.c |  2 +-
 drivers/gpu/drm/drm_plane.c          |  2 +-
 drivers/gpu/drm/drm_scatter.c        |  9 +++++----
 drivers/gpu/drm/drm_vm.c             |  2 +-
 20 files changed, 55 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 1545c50fd1c8..20a8cde70640 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -312,11 +312,11 @@ int drm_bridge_attach(struct drm_encoder *encoder, st=
ruct drm_bridge *bridge,
 =09list_del(&bridge->chain_node);
=20
 #ifdef CONFIG_OF
-=09DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
-=09=09  bridge->of_node, encoder->name, ret);
+=09drm_err(encoder->dev, "failed to attach bridge %pOF to encoder %s: %d\n=
",
+=09=09bridge->of_node, encoder->name, ret);
 #else
-=09DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
-=09=09  encoder->name, ret);
+=09drm_err(encoder->dev, "failed to attach bridge to encoder %s: %d\n",
+=09=09encoder->name, ret);
 #endif
=20
 =09return ret;
diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index fcca21e8efac..98aaf3379a3b 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -1474,15 +1474,15 @@ int drm_legacy_freebufs(struct drm_device *dev, voi=
d *data,
 =09=09if (copy_from_user(&idx, &request->list[i], sizeof(idx)))
 =09=09=09return -EFAULT;
 =09=09if (idx < 0 || idx >=3D dma->buf_count) {
-=09=09=09DRM_ERROR("Index %d (of %d max)\n",
-=09=09=09=09  idx, dma->buf_count - 1);
+=09=09=09drm_err(dev, "Index %d (of %d max)\n",
+=09=09=09=09idx, dma->buf_count - 1);
 =09=09=09return -EINVAL;
 =09=09}
 =09=09idx =3D array_index_nospec(idx, dma->buf_count);
 =09=09buf =3D dma->buflist[idx];
 =09=09if (buf->file_priv !=3D file_priv) {
-=09=09=09DRM_ERROR("Process %d freeing buffer not owned\n",
-=09=09=09=09  task_pid_nr(current));
+=09=09=09drm_err(dev, "Process %d freeing buffer not owned\n",
+=09=09=09=09task_pid_nr(current));
 =09=09=09return -EINVAL;
 =09=09}
 =09=09drm_legacy_free_buffer(dev, buf);
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_cli=
ent_modeset.c
index 2b76d4828c5f..c4517dea924e 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -812,7 +812,7 @@ int drm_client_modeset_probe(struct drm_client_dev *cli=
ent, unsigned int width,
 =09offsets =3D kcalloc(connector_count, sizeof(*offsets), GFP_KERNEL);
 =09enabled =3D kcalloc(connector_count, sizeof(bool), GFP_KERNEL);
 =09if (!crtcs || !modes || !enabled || !offsets) {
-=09=09DRM_ERROR("Memory allocation failed\n");
+=09=09drm_err(client->dev, "Memory allocation failed\n");
 =09=09ret =3D -ENOMEM;
 =09=09goto out;
 =09}
@@ -836,7 +836,7 @@ int drm_client_modeset_probe(struct drm_client_dev *cli=
ent, unsigned int width,
 =09=09=09=09=09      offsets, enabled, width, height) &&
 =09=09    !drm_client_target_preferred(connectors, connector_count, modes,
 =09=09=09=09=09=09 offsets, enabled, width, height))
-=09=09=09DRM_ERROR("Unable to find initial modes\n");
+=09=09=09drm_err(client->dev, "Unable to find initial modes\n");
=20
 =09=09DRM_DEBUG_KMS("picking CRTCs for %dx%d config\n",
 =09=09=09      width, height);
diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
index c6e6a3e7219a..f6d68fad8311 100644
--- a/drivers/gpu/drm/drm_context.c
+++ b/drivers/gpu/drm/drm_context.c
@@ -276,7 +276,7 @@ int drm_legacy_setsareactx(struct drm_device *dev, void=
 *data,
 static int drm_context_switch(struct drm_device * dev, int old, int new)
 {
 =09if (test_and_set_bit(0, &dev->context_flag)) {
-=09=09DRM_ERROR("Reentering -- FIXME\n");
+=09=09drm_err(dev, "Reentering -- FIXME\n");
 =09=09return -EBUSY;
 =09}
=20
@@ -307,7 +307,7 @@ static int drm_context_switch_complete(struct drm_devic=
e *dev,
 =09dev->last_context =3D new;=09/* PRE/POST: This is the _only_ writer. */
=20
 =09if (!_DRM_LOCK_IS_HELD(file_priv->master->lock.hw_lock->lock)) {
-=09=09DRM_ERROR("Lock isn't held after context switch\n");
+=09=09drm_err(dev, "Lock isn't held after context switch\n");
 =09}
=20
 =09/* If a context switch is ever initiated
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_h=
elper.c
index a209659a996c..d9599ea7058a 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -768,8 +768,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set=
,
 =09=09=09if (!drm_crtc_helper_set_mode(set->crtc, set->mode,
 =09=09=09=09=09=09      set->x, set->y,
 =09=09=09=09=09=09      save_set.fb)) {
-=09=09=09=09DRM_ERROR("failed to set mode on [CRTC:%d:%s]\n",
-=09=09=09=09=09  set->crtc->base.id, set->crtc->name);
+=09=09=09=09drm_err(dev, "failed to set mode on [CRTC:%d:%s]\n",
+=09=09=09=09=09set->crtc->base.id, set->crtc->name);
 =09=09=09=09set->crtc->primary->fb =3D save_set.fb;
 =09=09=09=09ret =3D -EINVAL;
 =09=09=09=09goto fail;
@@ -826,7 +826,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set=
,
 =09if (mode_changed &&
 =09    !drm_crtc_helper_set_mode(save_set.crtc, save_set.mode, save_set.x,
 =09=09=09=09      save_set.y, save_set.fb))
-=09=09DRM_ERROR("failed to restore config after modeset failure\n");
+=09=09pr_err("failed to restore config after modeset failure\n");
=20
 =09kfree(save_connector_encoders);
 =09kfree(save_encoder_crtcs);
@@ -996,7 +996,7 @@ void drm_helper_resume_force_mode(struct drm_device *de=
v)
=20
 =09=09/* Restoring the old config should never fail! */
 =09=09if (ret =3D=3D false)
-=09=09=09DRM_ERROR("failed to set mode on crtc %p\n", crtc);
+=09=09=09drm_err(dev, "failed to set mode on crtc %p\n", crtc);
=20
 =09=09/* Turn off outputs that were already powered off */
 =09=09if (drm_helper_choose_crtc_dpms(crtc)) {
diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugf=
s_crc.c
index bbc3bc4ba844..a59ef3f0e4a1 100644
--- a/drivers/gpu/drm/drm_debugfs_crc.c
+++ b/drivers/gpu/drm/drm_debugfs_crc.c
@@ -416,7 +416,8 @@ int drm_crtc_add_crc_entry(struct drm_crtc *crtc, bool =
has_frame,
 =09=09spin_unlock_irqrestore(&crc->lock, flags);
=20
 =09=09if (!was_overflow)
-=09=09=09DRM_ERROR("Overflow of CRC buffer, userspace reads too slow.\n");
+=09=09=09drm_err(crtc->dev,
+=09=09=09=09"Overflow of CRC buffer, userspace reads too slow.\n");
=20
 =09=09return -ENOBUFS;
 =09}
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index bc98e4bcf2c1..d66c98243623 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -177,7 +177,7 @@ static int drm_minor_register(struct drm_device *dev, u=
nsigned int type)
 =09} else {
 =09=09ret =3D drm_debugfs_init(minor, minor->index, drm_debugfs_root);
 =09=09if (ret) {
-=09=09=09DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
+=09=09=09drm_err(dev, "DRM: Failed to initialize /sys/kernel/debug/dri.\n"=
);
 =09=09=09goto err_debugfs;
 =09=09}
 =09}
@@ -425,7 +425,7 @@ void drm_put_dev(struct drm_device *dev)
 =09DRM_DEBUG("\n");
=20
 =09if (!dev) {
-=09=09DRM_ERROR("cleanup called no dev\n");
+=09=09pr_err("cleanup called no dev\n");
 =09=09return;
 =09}
=20
@@ -540,7 +540,7 @@ static struct inode *drm_fs_inode_new(void)
=20
 =09r =3D simple_pin_fs(&drm_fs_type, &drm_fs_mnt, &drm_fs_cnt);
 =09if (r < 0) {
-=09=09DRM_ERROR("Cannot mount pseudo fs: %d\n", r);
+=09=09pr_err("Cannot mount pseudo fs: %d\n", r);
 =09=09return ERR_PTR(r);
 =09}
=20
@@ -609,7 +609,7 @@ static int drm_dev_init(struct drm_device *dev,
 =09int ret;
=20
 =09if (!drm_core_init_complete) {
-=09=09DRM_ERROR("DRM core is not initialized\n");
+=09=09pr_err("DRM core is not initialized\n");
 =09=09return -ENODEV;
 =09}
=20
@@ -629,7 +629,7 @@ static int drm_dev_init(struct drm_device *dev,
 =09if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
 =09=09=09=09(drm_core_check_feature(dev, DRIVER_RENDER) ||
 =09=09=09=09drm_core_check_feature(dev, DRIVER_MODESET))) {
-=09=09DRM_ERROR("DRM driver can't be both a compute acceleration and graph=
ics driver\n");
+=09=09drm_err(dev, "DRM driver can't be both a compute acceleration and gr=
aphics driver\n");
 =09=09return -EINVAL;
 =09}
=20
@@ -652,7 +652,7 @@ static int drm_dev_init(struct drm_device *dev,
 =09inode =3D drm_fs_inode_new();
 =09if (IS_ERR(inode)) {
 =09=09ret =3D PTR_ERR(inode);
-=09=09DRM_ERROR("Cannot allocate anonymous inode: %d\n", ret);
+=09=09drm_err(dev, "Cannot allocate anonymous inode: %d\n", ret);
 =09=09goto err;
 =09}
=20
@@ -683,7 +683,7 @@ static int drm_dev_init(struct drm_device *dev,
 =09if (drm_core_check_feature(dev, DRIVER_GEM)) {
 =09=09ret =3D drm_gem_init(dev);
 =09=09if (ret) {
-=09=09=09DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n")=
;
+=09=09=09drm_err(dev, "Cannot initialize graphics execution manager (GEM)\=
n");
 =09=09=09goto err;
 =09=09}
 =09}
@@ -1094,7 +1094,7 @@ static int __init drm_core_init(void)
=20
 =09ret =3D drm_sysfs_init();
 =09if (ret < 0) {
-=09=09DRM_ERROR("Cannot create DRM class: %d\n", ret);
+=09=09pr_err("Cannot create DRM class: %d\n", ret);
 =09=09goto error;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_wor=
k.c
index 060b753881a2..37976b8a5e2f 100644
--- a/drivers/gpu/drm/drm_flip_work.c
+++ b/drivers/gpu/drm/drm_flip_work.c
@@ -82,7 +82,7 @@ void drm_flip_work_queue(struct drm_flip_work *work, void=
 *val)
 =09if (task) {
 =09=09drm_flip_work_queue_task(work, task);
 =09} else {
-=09=09DRM_ERROR("%s could not allocate task!\n", work->name);
+=09=09pr_err("%s could not allocate task!\n", work->name);
 =09=09work->func(work, val);
 =09}
 }
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index 2dd97473ca10..5aea791f4341 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1070,7 +1070,8 @@ static void legacy_remove_fb(struct drm_framebuffer *=
fb)
=20
 =09=09=09/* should turn off the crtc */
 =09=09=09if (drm_crtc_force_disable(crtc))
-=09=09=09=09DRM_ERROR("failed to reset crtc %p when fb was deleted\n", crt=
c);
+=09=09=09=09drm_err(dev, "failed to reset crtc %p when fb was deleted\n",
+=09=09=09=09=09crtc);
 =09=09}
 =09}
=20
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index b8db675e7fb5..3c99610afc0a 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -101,7 +101,7 @@ drm_gem_init(struct drm_device *dev)
 =09vma_offset_manager =3D drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 =09=09=09=09=09  GFP_KERNEL);
 =09if (!vma_offset_manager) {
-=09=09DRM_ERROR("out of memory\n");
+=09=09drm_err(dev, "out of memory\n");
 =09=09return -ENOMEM;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem=
_dma_helper.c
index 1e658c448366..1ba551b0ab97 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -583,7 +583,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_devic=
e *dev,
=20
 =09ret =3D dma_buf_vmap_unlocked(attach->dmabuf, &map);
 =09if (ret) {
-=09=09DRM_ERROR("Failed to vmap PRIME buffer\n");
+=09=09drm_err(dev, "Failed to vmap PRIME buffer\n");
 =09=09return ERR_PTR(ret);
 =09}
=20
diff --git a/drivers/gpu/drm/drm_hashtab.c b/drivers/gpu/drm/drm_hashtab.c
index 60afa1865559..924bf36b18db 100644
--- a/drivers/gpu/drm/drm_hashtab.c
+++ b/drivers/gpu/drm/drm_hashtab.c
@@ -53,7 +53,7 @@ int drm_ht_create(struct drm_open_hash *ht, unsigned int =
order)
 =09else
 =09=09ht->table =3D vzalloc(array_size(size, sizeof(*ht->table)));
 =09if (!ht->table) {
-=09=09DRM_ERROR("Out of memory for hash table\n");
+=09=09pr_err("Out of memory for hash table\n");
 =09=09return -ENOMEM;
 =09}
 =09return 0;
@@ -157,7 +157,7 @@ int drm_ht_just_insert_please(struct drm_open_hash *ht,=
 struct drm_hash_item *it
 =09} while(ret && (unshifted_key !=3D first));
=20
 =09if (ret) {
-=09=09DRM_ERROR("Available key bit space exhausted\n");
+=09=09pr_err("Available key bit space exhausted\n");
 =09=09return -EINVAL;
 =09}
 =09return 0;
diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
index 1efbd5389d89..0bca8b175616 100644
--- a/drivers/gpu/drm/drm_lock.c
+++ b/drivers/gpu/drm/drm_lock.c
@@ -79,8 +79,8 @@ int drm_lock_take(struct drm_lock_data *lock_data,
 =09if (_DRM_LOCKING_CONTEXT(old) =3D=3D context) {
 =09=09if (old & _DRM_LOCK_HELD) {
 =09=09=09if (context !=3D DRM_KERNEL_CONTEXT) {
-=09=09=09=09DRM_ERROR("%d holds heavyweight lock\n",
-=09=09=09=09=09  context);
+=09=09=09=09pr_err("%d holds heavyweight lock\n",
+=09=09=09=09       context);
 =09=09=09}
 =09=09=09return 0;
 =09=09}
@@ -142,8 +142,8 @@ static int drm_legacy_lock_free(struct drm_lock_data *l=
ock_data,
 =09} while (prev !=3D old);
=20
 =09if (_DRM_LOCK_IS_HELD(old) && _DRM_LOCKING_CONTEXT(old) !=3D context) {
-=09=09DRM_ERROR("%d freed heavyweight lock held by %d\n",
-=09=09=09  context, _DRM_LOCKING_CONTEXT(old));
+=09=09pr_err("%d freed heavyweight lock held by %d\n",
+=09=09       context, _DRM_LOCKING_CONTEXT(old));
 =09=09return 1;
 =09}
 =09wake_up_interruptible(&lock_data->lock_queue);
@@ -175,8 +175,8 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
 =09++file_priv->lock_count;
=20
 =09if (lock->context =3D=3D DRM_KERNEL_CONTEXT) {
-=09=09DRM_ERROR("Process %d using kernel context %d\n",
-=09=09=09  task_pid_nr(current), lock->context);
+=09=09pr_err("Process %d using kernel context %d\n",
+=09=09       task_pid_nr(current), lock->context);
 =09=09return -EINVAL;
 =09}
=20
@@ -263,8 +263,8 @@ int drm_legacy_unlock(struct drm_device *dev, void *dat=
a, struct drm_file *file_
 =09=09return -EOPNOTSUPP;
=20
 =09if (lock->context =3D=3D DRM_KERNEL_CONTEXT) {
-=09=09DRM_ERROR("Process %d using kernel context %d\n",
-=09=09=09  task_pid_nr(current), lock->context);
+=09=09pr_err("Process %d using kernel context %d\n",
+=09=09       task_pid_nr(current), lock->context);
 =09=09return -EINVAL;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.=
c
index a6ac56580876..24af507bb687 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -527,7 +527,7 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev =
*dbidev,
 =09drm_mode_copy(&dbidev->mode, mode);
 =09ret =3D mipi_dbi_rotate_mode(&dbidev->mode, rotation);
 =09if (ret) {
-=09=09DRM_ERROR("Illegal rotation value %u\n", rotation);
+=09=09drm_err(drm, "Illegal rotation value %u\n", rotation);
 =09=09return -EINVAL;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8257f9d4f619..753ce00f4ee7 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -126,14 +126,14 @@ static void show_leaks(struct drm_mm *mm)
=20
 =09list_for_each_entry(node, drm_mm_nodes(mm), node_list) {
 =09=09if (!node->stack) {
-=09=09=09DRM_ERROR("node [%08llx + %08llx]: unknown owner\n",
-=09=09=09=09  node->start, node->size);
+=09=09=09pr_err("node [%08llx + %08llx]: unknown owner\n",
+=09=09=09       node->start, node->size);
 =09=09=09continue;
 =09=09}
=20
 =09=09stack_depot_snprint(node->stack, buf, BUFSZ, 0);
-=09=09DRM_ERROR("node [%08llx + %08llx]: inserted at\n%s",
-=09=09=09  node->start, node->size, buf);
+=09=09pr_err("node [%08llx + %08llx]: inserted at\n%s",
+=09=09       node->start, node->size, buf);
 =09}
=20
 =09kfree(buf);
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_c=
onfig.c
index 688c8afe0bf1..5dab605520b1 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -505,7 +505,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 =09if (WARN_ON(!list_empty(&dev->mode_config.connector_list))) {
 =09=09drm_connector_list_iter_begin(dev, &conn_iter);
 =09=09drm_for_each_connector_iter(connector, &conn_iter)
-=09=09=09DRM_ERROR("connector %s leaked!\n", connector->name);
+=09=09=09drm_err(dev, "connector %s leaked!\n", connector->name);
 =09=09drm_connector_list_iter_end(&conn_iter);
 =09}
=20
diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_mod=
eset_helper.c
index f858dfedf2cf..e26b0285dde6 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -235,7 +235,7 @@ int drm_mode_config_helper_resume(struct drm_device *de=
v)
=20
 =09ret =3D drm_atomic_helper_resume(dev, dev->mode_config.suspend_state);
 =09if (ret)
-=09=09DRM_ERROR("Failed to resume (%d)\n", ret);
+=09=09drm_err(dev, "Failed to resume (%d)\n", ret);
 =09dev->mode_config.suspend_state =3D NULL;
=20
 =09drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 33357629a7f5..a650f06e4cea 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -606,7 +606,7 @@ void drm_plane_force_disable(struct drm_plane *plane)
 =09plane->old_fb =3D plane->fb;
 =09ret =3D plane->funcs->disable_plane(plane, NULL);
 =09if (ret) {
-=09=09DRM_ERROR("failed to disable plane with busy fb\n");
+=09=09drm_err(plane->dev, "failed to disable plane with busy fb\n");
 =09=09plane->old_fb =3D NULL;
 =09=09return;
 =09}
diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
index f4e6184d1877..5b0b2140d535 100644
--- a/drivers/gpu/drm/drm_scatter.c
+++ b/drivers/gpu/drm/drm_scatter.c
@@ -170,9 +170,10 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *=
data,
 =09=09=09     j++, tmp++) {
 =09=09=09=09if (*tmp !=3D 0xcafebabe && error =3D=3D 0) {
 =09=09=09=09=09error =3D 1;
-=09=09=09=09=09DRM_ERROR("Scatter allocation error, "
-=09=09=09=09=09=09  "pagelist does not match "
-=09=09=09=09=09=09  "virtual mapping\n");
+=09=09=09=09=09drm_err(dev,
+=09=09=09=09=09=09"Scatter allocation error, "
+=09=09=09=09=09=09"pagelist does not match "
+=09=09=09=09=09=09"virtual mapping\n");
 =09=09=09=09}
 =09=09=09}
 =09=09=09tmp =3D page_address(entry->pagelist[i]);
@@ -183,7 +184,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *d=
ata,
 =09=09=09}
 =09=09}
 =09=09if (error =3D=3D 0)
-=09=09=09DRM_ERROR("Scatter allocation matches pagelist\n");
+=09=09=09drm_err(dev, "Scatter allocation matches pagelist\n");
 =09}
 #endif
=20
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index f024dc93939e..cdb956af2079 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -547,7 +547,7 @@ static int drm_mmap_locked(struct file *filp, struct vm=
_area_struct *vma)
 =09=09return drm_mmap_dma(filp, vma);
=20
 =09if (drm_ht_find_item(&dev->map_hash, vma->vm_pgoff, &hash)) {
-=09=09DRM_ERROR("Could not find map\n");
+=09=09drm_err(dev, "Could not find map\n");
 =09=09return -EINVAL;
 =09}
=20
--=20
2.35.1


