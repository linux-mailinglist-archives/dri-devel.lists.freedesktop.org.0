Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17251788728
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0E710E66A;
	Fri, 25 Aug 2023 12:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDE310E66B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:25:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.83.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 45CC9660728F;
 Fri, 25 Aug 2023 13:25:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692966340;
 bh=rgpvSeZGKF3SGFM/V9KInphj6CaJZryw7a6Wsi7NMHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YUsazqsdd7YYCLplGD/KDgVV9qU8B7rbCgTNMJwelCqQvmG/vZMNdJXYqZEECL/nL
 EOVV27wzXS6bnAmH2uFcQXqMxz+Dmmq1srKqTdUThEhbUieSsk4iR17OP1aPOn4l0+
 a5EflmDqvEa2IEboOYZ3DW1zpi9qiaY6mrO0BDCzsyuYe3gv+j0z5FLJtXhPKUOeQ7
 +bYxU8nK3WN/ucLD9QwgOKn2nMrdDM3qO5Xb5g+FNzQv78xls3x6jMwOttal7xKcOe
 kQAtjS5VksTlpXSkYKKQ08dDod9zl4c/GXZnUHqwxSYvaCcSAdecYRLqqlEUHutoWK
 uN3CmS1+MkWKg==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm: ci: Remove rules
Date: Fri, 25 Aug 2023 17:54:35 +0530
Message-Id: <20230825122435.316272-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230825122435.316272-1-vignesh.raman@collabora.com>
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com,
 corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the rules from the following jobs, as the issues noted in the
TODO comments have been resolved. This will ensure that these jobs
are now included and executed as part of the CI/CD pipeline.

msm:apq8016:
TODO: current issue: it is not fiding the NFS root. Fix and remove this rule.

mediatek:mt8173:
TODO: current issue: device is hanging. Fix and remove this rule.

virtio_gpu:none:
TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 drivers/gpu/drm/ci/test.yml      | 9 ---------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 2c4df53f5dfe..d2aac4404914 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -248,4 +248,4 @@ sanity:
 
 # Jobs that need to pass before spending hardware resources on further testing
 .required-for-hardware-jobs:
-  needs: []
\ No newline at end of file
+  needs: []
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index d85add39f425..1771af21e2d9 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -108,9 +108,6 @@ msm:apq8016:
     RUNNER_TAG: google-freedreno-db410c
   script:
     - ./install/bare-metal/fastboot.sh
-  rules:
-    # TODO: current issue: it is not fiding the NFS root. Fix and remove this rule.
-    - when: never
 
 msm:apq8096:
   extends:
@@ -273,9 +270,6 @@ mediatek:mt8173:
     DEVICE_TYPE: mt8173-elm-hana
     GPU_VERSION: mt8173
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
-  rules:
-    # TODO: current issue: device is hanging. Fix and remove this rule.
-    - when: never
 
 mediatek:mt8183:
   extends:
@@ -333,6 +327,3 @@ virtio_gpu:none:
     - debian/x86_64_test-gl
     - testing:x86_64
     - igt:x86_64
-  rules:
-    # TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.
-    - when: never
\ No newline at end of file
-- 
2.40.1

