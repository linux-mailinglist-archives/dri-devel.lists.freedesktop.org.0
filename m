Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0723050D46A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 21:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3127F10FED7;
	Sun, 24 Apr 2022 19:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57AB10F726
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 19:04:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 83ABB1F44DAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650827094;
 bh=H46XxB6oFHCaE4uAm7MAxT74nXXK7Q5+TkH98BogMYM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m53oTjo4v5Mah0XdA0IRsCw5H20XTxDf/JXLQOfbpKj7iI8xF7RzHj2BvvGRvbzgD
 Ec14L/kPfb7rusJ/NSVKEvCGICRc9HjiVYVYKVwnSrftKLpbSb1eUXzxcWIN/g3y/K
 MF1Q8tykMm7H3A6NRSFKqFOCg/np0Qao5vdMZVCPI6i15QrGgKA6Ug6tW5BBTu0Xv+
 DnSC2zP+PnEtN/nGXnuUlwosWv9a8vYjhst0KP08vULTNgjlN/uxat1av5tl3KI//A
 Lk8+DhR0TlHPjom/AloALVNPXCksqeTyNXIQLduah/WcF/j9W2MaxCiAlsSB7pvIGQ
 OzvZHrwMvw2OQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 10/17] drm/shmem-helper: Correct doc-comment of
 drm_gem_shmem_get_sg_table()
Date: Sun, 24 Apr 2022 22:04:17 +0300
Message-Id: <20220424190424.540501-11-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
References: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_gem_shmem_get_sg_table() never returns NULL on error, but a ERR_PTR.
Correct the doc comment which says that it returns NULL on error.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8ad0e02991ca..5c7a7106b41d 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -662,7 +662,8 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
  * drm_gem_shmem_get_pages_sgt() instead.
  *
  * Returns:
- * A pointer to the scatter/gather table of pinned pages or NULL on failure.
+ * A pointer to the scatter/gather table of pinned pages or an ERR_PTR()-encoded
+ * error code on failure.
  */
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 {
@@ -688,7 +689,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
  * drm_gem_shmem_get_sg_table() should not be directly called by drivers.
  *
  * Returns:
- * A pointer to the scatter/gather table of pinned pages or errno on failure.
+ * A pointer to the scatter/gather table of pinned pages or an ERR_PTR()-encoded
+ * error code on failure.
  */
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 {
-- 
2.35.1

