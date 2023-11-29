Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837187FD687
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7D210E534;
	Wed, 29 Nov 2023 12:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38A410E51A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:19:23 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 344CA6607325;
 Wed, 29 Nov 2023 12:19:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701260362;
 bh=O5ckehyI20/PoLmFk+FV3fLp1KbSS4iwwIAE9XfLTh4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R+WiHN3gCDt6vq+jDhSG7b8yQDkYWemthE6ABt1fa9Hazyp8zqJeM9wW/w/uz0cQz
 Eg0iMzsj7MsUCs1wGKkd96wLK/MK8PGYXoH6h6DDbJlUFg5fGLhwbiEjKGT+KCblyo
 jSTXJKUt4qpVLqzzHFCQvxQnKuYOQv+4Jux+uFCjOGlJx+aP1fQD3bJaq15aG6bpAU
 tVJtDMOzdUyMqCRp0Z9K1e2KzqOEbWlgzwSJlI/kXrgDLibdWeZS6KYc6JhyGxqXkm
 daUeCsjPUoRUMXm8KmxDRzzxTORlSZrjoAKfBiSHZKE/OCrninnhKiVE/9FEwCrwrZ
 D+UWU24o7lXgg==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v6 07/10] drm: ci: virtio: Make artifacts available
Date: Wed, 29 Nov 2023 17:48:38 +0530
Message-Id: <20231129121841.253223-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129121841.253223-1-vignesh.raman@collabora.com>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There were no artifacts available for virtio job.
So make the artifacts available in the pipeline job.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to make artifacts available for virtio jobs

v6:
  - No changes

---
 drivers/gpu/drm/ci/test.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index e0fdc55c9b69..2c9a1838e728 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -329,6 +329,8 @@ virtio_gpu:none:
   script:
     - ln -sf $CI_PROJECT_DIR/install /install
     - mv install/bzImage /lava-files/bzImage
+    - mkdir -p $CI_PROJECT_DIR/results
+    - ln -sf $CI_PROJECT_DIR/results /results
     - install/crosvm-runner.sh install/igt_runner.sh
   needs:
     - debian/x86_64_test-gl
-- 
2.40.1

