Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFBE75DF69
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 01:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B64B10E1E5;
	Sat, 22 Jul 2023 23:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8C910E1A3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 23:53:20 +0000 (UTC)
Received: from workpc.. (109-252-150-127.dynamic.spd-mgts.ru [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CA3C666070F8;
 Sun, 23 Jul 2023 00:53:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690069999;
 bh=Oubjr62/5xZD6SNVKnPrUnEgQKeBKYFs3MwTqlwxAzQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Giut13T2M38GoEvGph1zFA7Zv8w2Tht5Z7zP5mtGrCXt36/NC41R+Qinn8gtQA8nL
 Y8TvdlPOtvodnXRYkluM8uZEx6AKOkYvuI7FUodu0/Q4Pgsn5C3Bn1gtzn8uSfRnZQ
 VVzH/OUp+cyAxHUjqh15h5gCHOzPSOUU8MqMX89qPT/7Z0mQcfQy8Lgh1Yvm2aVHZg
 nX78F1q4NmbgPwglPNyBWJg1+EMjD+hixxvC51m+eTSrPVzQbFAEbGqiFsjocaQ6EN
 YtHD/aiH9hC85cWUggbv8NJmU7sWzQn7X0bNACWt6JG8fp12y6FFL69VGLZ85T7yTO
 7m+6K5lRYf5hA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v14 11/12] drm/shmem-helper: Make drm_gem_shmem_print_info()
 symbol GPL
Date: Sun, 23 Jul 2023 02:47:45 +0300
Message-ID: <20230722234746.205949-12-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make drm_gem_shmem_print_info() exported symbol GPL to make it consistent
with the rest of drm-shmem exports. It's the only remaining drm-shmem
symbol that isn't GPL.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 3dd4da18eedf..46190e70c3df 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -782,7 +782,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
 	drm_printf_indent(p, indent, "madv=%d\n", shmem->madv);
 }
-EXPORT_SYMBOL(drm_gem_shmem_print_info);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_print_info);
 
 /**
  * drm_gem_shmem_get_sg_table - Provide a scatter/gather table of pinned
-- 
2.41.0

