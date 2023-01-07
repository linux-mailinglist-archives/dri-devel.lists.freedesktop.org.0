Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B492F661071
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 18:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B7010E33C;
	Sat,  7 Jan 2023 17:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2157110E338
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 17:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1673112189; cv=none; d=zohomail.in; s=zohoarc; 
 b=Z7bQ8wXuUqTwNkY1AL0zZVXcgs48DTP2BoeYSLLys7RT1V1rrH6HBjfy/0nfZykOD2qkAKE1wlZyutbUY0JetC6IlM28cRbpB28hYxTru916NzsBs1BP7yA/9bix7g9tnrCQJBu2v0fdmbFMhNoIsFCi+Vzyv/PDar65XmvIzSM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1673112189;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=119OUosozo0U9mtWLJCKg4RIyTCQ7g7wNaZd1HAHXqM=; 
 b=DWHAETtM+NFerdqHtCGJzYmfatkTB0eH6EasaZP15uIH8T0OBZa7FFH4GOZKGuwPMidWGtZxMARlHSPin3VMmJ7xd7iujtP7gpe+320DvQdNELml10tvArGSrAvJyZC4nHpuLUksO7zOiuoDkDrM/BJnhi4HHT060FqJioWWmVk=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1673112189; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=119OUosozo0U9mtWLJCKg4RIyTCQ7g7wNaZd1HAHXqM=;
 b=X/ITyW3dgNi02SEounY9+19MjuukuDqjpMeN7/Rf8+Lqy8lYbh2cVylCfrc8Q1Gm
 QfLk5J08slCdWCFUBGUm5QitFbt/e7J87sGAuQuAWrFukNRqqcjyxyeiFmrick3njty
 hoteZHCoBLBlpkC8kWllLugKfnJtf8KZApsLu368=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1673112187699524.0762038766127;
 Sat, 7 Jan 2023 22:53:07 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Jim Cromie <jim.cromie@gmail.com>
Message-ID: <fc41b977789e60bdb1b8fcdd88d4b3f25e55c622.1673110890.git.code@siddh.me>
Subject: [PATCH v5 04/10] drm: Remove usage of deprecated DRM_ERROR
Date: Sat,  7 Jan 2023 22:52:24 +0530
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673110890.git.code@siddh.me>
References: <cover.1673110890.git.code@siddh.me>
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

drm_print.h says DRM_ERROR is deprecated in favor of drm_err().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_bridge.c         |  8 ++++----
 drivers/gpu/drm/drm_bufs.c           |  8 ++++----
 drivers/gpu/drm/drm_client_modeset.c |  4 ++--
 drivers/gpu/drm/drm_context.c        |  4 ++--
 drivers/gpu/drm/drm_crtc_helper.c    |  8 ++++----
 drivers/gpu/drm/drm_debugfs_crc.c    |  3 ++-
 drivers/gpu/drm/drm_drv.c            | 14 +++++++-------
 drivers/gpu/drm/drm_flip_work.c      |  2 +-
 drivers/gpu/drm/drm_framebuffer.c    |  3 ++-
 drivers/gpu/drm/drm_gem.c            |  2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
 drivers/gpu/drm/drm_hashtab.c        |  4 ++--
 drivers/gpu/drm/drm_lock.c           | 16 ++++++++--------
 drivers/gpu/drm/drm_mipi_dbi.c       |  2 +-
 drivers/gpu/drm/drm_mipi_dsi.c       | 12 ++++++------
 drivers/gpu/drm/drm_mm.c             |  8 ++++----
 drivers/gpu/drm/drm_mode_config.c    |  2 +-
 drivers/gpu/drm/drm_modes.c          | 26 +++++++++++++-------------
 drivers/gpu/drm/drm_modeset_helper.c |  2 +-
 drivers/gpu/drm/drm_plane.c          |  2 +-
 drivers/gpu/drm/drm_scatter.c        |  9 +++++----
 drivers/gpu/drm/drm_vm.c             |  2 +-
 22 files changed, 73 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c3d69af02e79..3d27f08db74d 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -351,11 +351,11 @@ int drm_bridge_attach(struct drm_encoder *encoder, st=
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
index ae19734974b5..e2403b8c6347 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -808,7 +808,7 @@ int drm_client_modeset_probe(struct drm_client_dev *cli=
ent, unsigned int width,
 =09offsets =3D kcalloc(connector_count, sizeof(*offsets), GFP_KERNEL);
 =09enabled =3D kcalloc(connector_count, sizeof(bool), GFP_KERNEL);
 =09if (!crtcs || !modes || !enabled || !offsets) {
-=09=09DRM_ERROR("Memory allocation failed\n");
+=09=09drm_err(client->dev, "Memory allocation failed\n");
 =09=09ret =3D -ENOMEM;
 =09=09goto out;
 =09}
@@ -832,7 +832,7 @@ int drm_client_modeset_probe(struct drm_client_dev *cli=
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
index a209659a996c..b74b4301a471 100644
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
+=09=09drm_err(dev, "failed to restore config after modeset failure\n");
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
index dfb73c9d7930..5802d714ad8d 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -163,7 +163,7 @@ static int drm_minor_register(struct drm_device *dev, u=
nsigned int type)
=20
 =09ret =3D drm_debugfs_init(minor, minor->index, drm_debugfs_root);
 =09if (ret) {
-=09=09DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
+=09=09drm_err(dev, "DRM: Failed to initialize /sys/kernel/debug/dri.\n");
 =09=09goto err_debugfs;
 =09}
=20
@@ -402,7 +402,7 @@ void drm_put_dev(struct drm_device *dev)
 =09DRM_DEBUG("\n");
=20
 =09if (!dev) {
-=09=09DRM_ERROR("cleanup called no dev\n");
+=09=09drm_err(NULL, "cleanup called no dev\n");
 =09=09return;
 =09}
=20
@@ -517,7 +517,7 @@ static struct inode *drm_fs_inode_new(void)
=20
 =09r =3D simple_pin_fs(&drm_fs_type, &drm_fs_mnt, &drm_fs_cnt);
 =09if (r < 0) {
-=09=09DRM_ERROR("Cannot mount pseudo fs: %d\n", r);
+=09=09drm_err(NULL, "Cannot mount pseudo fs: %d\n", r);
 =09=09return ERR_PTR(r);
 =09}
=20
@@ -587,7 +587,7 @@ static int drm_dev_init(struct drm_device *dev,
 =09int ret;
=20
 =09if (!drm_core_init_complete) {
-=09=09DRM_ERROR("DRM core is not initialized\n");
+=09=09drm_err(NULL, "DRM core is not initialized\n");
 =09=09return -ENODEV;
 =09}
=20
@@ -625,7 +625,7 @@ static int drm_dev_init(struct drm_device *dev,
 =09inode =3D drm_fs_inode_new();
 =09if (IS_ERR(inode)) {
 =09=09ret =3D PTR_ERR(inode);
-=09=09DRM_ERROR("Cannot allocate anonymous inode: %d\n", ret);
+=09=09drm_err(dev, "Cannot allocate anonymous inode: %d\n", ret);
 =09=09goto err;
 =09}
=20
@@ -650,7 +650,7 @@ static int drm_dev_init(struct drm_device *dev,
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
@@ -1054,7 +1054,7 @@ static int __init drm_core_init(void)
=20
 =09ret =3D drm_sysfs_init();
 =09if (ret < 0) {
-=09=09DRM_ERROR("Cannot create DRM class: %d\n", ret);
+=09=09drm_err(NULL, "Cannot create DRM class: %d\n", ret);
 =09=09goto error;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_wor=
k.c
index 060b753881a2..8cbf325a0414 100644
--- a/drivers/gpu/drm/drm_flip_work.c
+++ b/drivers/gpu/drm/drm_flip_work.c
@@ -82,7 +82,7 @@ void drm_flip_work_queue(struct drm_flip_work *work, void=
 *val)
 =09if (task) {
 =09=09drm_flip_work_queue_task(work, task);
 =09} else {
-=09=09DRM_ERROR("%s could not allocate task!\n", work->name);
+=09=09drm_err(NULL, "%s could not allocate task!\n", work->name);
 =09=09work->func(work, val);
 =09}
 }
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index aff3746dedfb..b21071919644 100644
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
index 59a0bb5ebd85..c14bff925a12 100644
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
index 60afa1865559..a1ebf8e056c7 100644
--- a/drivers/gpu/drm/drm_hashtab.c
+++ b/drivers/gpu/drm/drm_hashtab.c
@@ -53,7 +53,7 @@ int drm_ht_create(struct drm_open_hash *ht, unsigned int =
order)
 =09else
 =09=09ht->table =3D vzalloc(array_size(size, sizeof(*ht->table)));
 =09if (!ht->table) {
-=09=09DRM_ERROR("Out of memory for hash table\n");
+=09=09drm_err(NULL, "Out of memory for hash table\n");
 =09=09return -ENOMEM;
 =09}
 =09return 0;
@@ -157,7 +157,7 @@ int drm_ht_just_insert_please(struct drm_open_hash *ht,=
 struct drm_hash_item *it
 =09} while(ret && (unshifted_key !=3D first));
=20
 =09if (ret) {
-=09=09DRM_ERROR("Available key bit space exhausted\n");
+=09=09drm_err(NULL, "Available key bit space exhausted\n");
 =09=09return -EINVAL;
 =09}
 =09return 0;
diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
index 1efbd5389d89..411f75a1ee14 100644
--- a/drivers/gpu/drm/drm_lock.c
+++ b/drivers/gpu/drm/drm_lock.c
@@ -79,8 +79,8 @@ int drm_lock_take(struct drm_lock_data *lock_data,
 =09if (_DRM_LOCKING_CONTEXT(old) =3D=3D context) {
 =09=09if (old & _DRM_LOCK_HELD) {
 =09=09=09if (context !=3D DRM_KERNEL_CONTEXT) {
-=09=09=09=09DRM_ERROR("%d holds heavyweight lock\n",
-=09=09=09=09=09  context);
+=09=09=09=09drm_err(NULL, "%d holds heavyweight lock\n",
+=09=09=09=09=09context);
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
+=09=09drm_err(NULL, "%d freed heavyweight lock held by %d\n",
+=09=09=09context, _DRM_LOCKING_CONTEXT(old));
 =09=09return 1;
 =09}
 =09wake_up_interruptible(&lock_data->lock_queue);
@@ -175,8 +175,8 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
 =09++file_priv->lock_count;
=20
 =09if (lock->context =3D=3D DRM_KERNEL_CONTEXT) {
-=09=09DRM_ERROR("Process %d using kernel context %d\n",
-=09=09=09  task_pid_nr(current), lock->context);
+=09=09drm_err(dev, "Process %d using kernel context %d\n",
+=09=09=09task_pid_nr(current), lock->context);
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
+=09=09drm_err(dev, "Process %d using kernel context %d\n",
+=09=09=09task_pid_nr(current), lock->context);
 =09=09return -EINVAL;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.=
c
index c871d9f096b8..58ff9503a403 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -603,7 +603,7 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev =
*dbidev,
 =09drm_mode_copy(&dbidev->mode, mode);
 =09ret =3D mipi_dbi_rotate_mode(&dbidev->mode, rotation);
 =09if (ret) {
-=09=09DRM_ERROR("Illegal rotation value %u\n", rotation);
+=09=09drm_err(drm, "Illegal rotation value %u\n", rotation);
 =09=09return -EINVAL;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.=
c
index 497ef4b6a90a..d9d70601ccb4 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -161,13 +161,13 @@ of_mipi_dsi_device_add(struct mipi_dsi_host *host, st=
ruct device_node *node)
 =09u32 reg;
=20
 =09if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {
-=09=09drm_err(host, "modalias failure on %pOF\n", node);
+=09=09drm_err(host->dev, "modalias failure on %pOF\n", node);
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
 =09ret =3D of_property_read_u32(node, "reg", &reg);
 =09if (ret) {
-=09=09drm_err(host, "device node %pOF has no valid reg property: %d\n",
+=09=09drm_err(host->dev, "device node %pOF has no valid reg property: %d\n=
",
 =09=09=09node, ret);
 =09=09return ERR_PTR(-EINVAL);
 =09}
@@ -205,18 +205,18 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *h=
ost,
 =09int ret;
=20
 =09if (!info) {
-=09=09drm_err(host, "invalid mipi_dsi_device_info pointer\n");
+=09=09drm_err(host->dev, "invalid mipi_dsi_device_info pointer\n");
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
 =09if (info->channel > 3) {
-=09=09drm_err(host, "invalid virtual channel: %u\n", info->channel);
+=09=09drm_err(host->dev, "invalid virtual channel: %u\n", info->channel);
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
 =09dsi =3D mipi_dsi_device_alloc(host);
 =09if (IS_ERR(dsi)) {
-=09=09drm_err(host, "failed to allocate DSI device %ld\n",
+=09=09drm_err(host->dev, "failed to allocate DSI device %ld\n",
 =09=09=09PTR_ERR(dsi));
 =09=09return dsi;
 =09}
@@ -227,7 +227,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *hos=
t,
=20
 =09ret =3D mipi_dsi_device_add(dsi);
 =09if (ret) {
-=09=09drm_err(host, "failed to add DSI device %d\n", ret);
+=09=09drm_err(host->dev, "failed to add DSI device %d\n", ret);
 =09=09kfree(dsi);
 =09=09return ERR_PTR(ret);
 =09}
diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8257f9d4f619..0a8d62c8f359 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -126,14 +126,14 @@ static void show_leaks(struct drm_mm *mm)
=20
 =09list_for_each_entry(node, drm_mm_nodes(mm), node_list) {
 =09=09if (!node->stack) {
-=09=09=09DRM_ERROR("node [%08llx + %08llx]: unknown owner\n",
-=09=09=09=09  node->start, node->size);
+=09=09=09drm_err(NULL, "node [%08llx + %08llx]: unknown owner\n",
+=09=09=09=09node->start, node->size);
 =09=09=09continue;
 =09=09}
=20
 =09=09stack_depot_snprint(node->stack, buf, BUFSZ, 0);
-=09=09DRM_ERROR("node [%08llx + %08llx]: inserted at\n%s",
-=09=09=09  node->start, node->size, buf);
+=09=09drm_err(NULL, "node [%08llx + %08llx]: inserted at\n%s",
+=09=09=09node->start, node->size, buf);
 =09}
=20
 =09kfree(buf);
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_c=
onfig.c
index 87eb591fe9b5..b86473ab9ff7 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -513,7 +513,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 =09if (WARN_ON(!list_empty(&dev->mode_config.connector_list))) {
 =09=09drm_connector_list_iter_begin(dev, &conn_iter);
 =09=09drm_for_each_connector_iter(connector, &conn_iter)
-=09=09=09DRM_ERROR("connector %s leaked!\n", connector->name);
+=09=09=09drm_err(dev, "connector %s leaked!\n", connector->name);
 =09=09drm_connector_list_iter_end(&conn_iter);
 =09}
=20
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index be030f4a5311..cc6d1f216e78 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -372,8 +372,8 @@ static int fill_analog_mode(struct drm_device *dev,
 =09if (!bt601 &&
 =09    (hact_duration_ns < params->hact_ns.min ||
 =09     hact_duration_ns > params->hact_ns.max)) {
-=09=09DRM_ERROR("Invalid horizontal active area duration: %uns (min: %u, m=
ax %u)\n",
-=09=09=09  hact_duration_ns, params->hact_ns.min, params->hact_ns.max);
+=09=09drm_err(dev, "Invalid horizontal active area duration: %uns (min: %u=
, max %u)\n",
+=09=09=09hact_duration_ns, params->hact_ns.min, params->hact_ns.max);
 =09=09return -EINVAL;
 =09}
=20
@@ -384,8 +384,8 @@ static int fill_analog_mode(struct drm_device *dev,
 =09if (!bt601 &&
 =09    (hblk_duration_ns < params->hblk_ns.min ||
 =09     hblk_duration_ns > params->hblk_ns.max)) {
-=09=09DRM_ERROR("Invalid horizontal blanking duration: %uns (min: %u, max =
%u)\n",
-=09=09=09  hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);
+=09=09drm_err(dev, "Invalid horizontal blanking duration: %uns (min: %u, m=
ax %u)\n",
+=09=09=09hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);
 =09=09return -EINVAL;
 =09}
=20
@@ -396,8 +396,8 @@ static int fill_analog_mode(struct drm_device *dev,
 =09if (!bt601 &&
 =09    (hslen_duration_ns < params->hslen_ns.min ||
 =09     hslen_duration_ns > params->hslen_ns.max)) {
-=09=09DRM_ERROR("Invalid horizontal sync duration: %uns (min: %u, max %u)\=
n",
-=09=09=09  hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);
+=09=09drm_err(dev, "Invalid horizontal sync duration: %uns (min: %u, max %=
u)\n",
+=09=09=09hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);
 =09=09return -EINVAL;
 =09}
=20
@@ -408,7 +408,7 @@ static int fill_analog_mode(struct drm_device *dev,
 =09if (!bt601 &&
 =09    (porches_duration_ns > (params->hfp_ns.max + params->hbp_ns.max) ||
 =09     porches_duration_ns < (params->hfp_ns.min + params->hbp_ns.min))) =
{
-=09=09DRM_ERROR("Invalid horizontal porches duration: %uns\n", porches_dur=
ation_ns);
+=09=09drm_err(dev, "Invalid horizontal porches duration: %uns\n", porches_=
duration_ns);
 =09=09return -EINVAL;
 =09}
=20
@@ -430,8 +430,8 @@ static int fill_analog_mode(struct drm_device *dev,
 =09if (!bt601 &&
 =09    (hfp_duration_ns < params->hfp_ns.min ||
 =09     hfp_duration_ns > params->hfp_ns.max)) {
-=09=09DRM_ERROR("Invalid horizontal front porch duration: %uns (min: %u, m=
ax %u)\n",
-=09=09=09  hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);
+=09=09drm_err(dev, "Invalid horizontal front porch duration: %uns (min: %u=
, max %u)\n",
+=09=09=09hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);
 =09=09return -EINVAL;
 =09}
=20
@@ -442,8 +442,8 @@ static int fill_analog_mode(struct drm_device *dev,
 =09if (!bt601 &&
 =09    (hbp_duration_ns < params->hbp_ns.min ||
 =09     hbp_duration_ns > params->hbp_ns.max)) {
-=09=09DRM_ERROR("Invalid horizontal back porch duration: %uns (min: %u, ma=
x %u)\n",
-=09=09=09  hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);
+=09=09drm_err(dev, "Invalid horizontal back porch duration: %uns (min: %u,=
 max %u)\n",
+=09=09=09hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);
 =09=09return -EINVAL;
 =09}
=20
@@ -494,8 +494,8 @@ static int fill_analog_mode(struct drm_device *dev,
=20
 =09vtotal =3D vactive + vfp + vslen + vbp;
 =09if (params->num_lines !=3D vtotal) {
-=09=09DRM_ERROR("Invalid vertical total: %upx (expected %upx)\n",
-=09=09=09  vtotal, params->num_lines);
+=09=09drm_err(dev, "Invalid vertical total: %upx (expected %upx)\n",
+=09=09=09vtotal, params->num_lines);
 =09=09return -EINVAL;
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
index 24e7998d1731..fc11efd5e560 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -611,7 +611,7 @@ void drm_plane_force_disable(struct drm_plane *plane)
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
2.39.0


