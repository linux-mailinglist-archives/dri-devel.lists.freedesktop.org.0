Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0D4791B4A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 18:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF84210E39F;
	Mon,  4 Sep 2023 16:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C509B10E3A2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 16:16:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E7DE466072BA;
 Mon,  4 Sep 2023 17:16:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693844193;
 bh=sLkmIO8lMBzqmT0rb01FcG0pHWafR6A2drXY2Umo+KA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g8G9bhr7Itw2yiIOZ6jhP+q0eWOXiZbHttQe7VB/vCthFkLlofgQagKOCmLFTwv0U
 SOm6eOBi0ox8nPbW+GoeePvOt9ZXfYxeX8CyMVwZXQ2MU+bWuExFYqwDkEyhQeF1IG
 AHYwa7shv23XMgX34ddkH6W2chOhPEu9Kp2NpB0FTLm9MH2cbU0M1ItwrK/b1V2L1b
 UqZfPblbfwASbmaroPkehJykqxMnaUkr2O01kXP/ZUx8rUBTReiwAJxKfFzYHvv+8S
 YqLFM5KgmFGNGZDbIHunCsve+uJsAR+j/e3J1S1imR2bz6ZGs8FoOW93/TVQpU3XaX
 RcCB5F2+VayBA==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm: ci: Enable new jobs
Date: Mon,  4 Sep 2023 21:45:15 +0530
Message-Id: <20230904161516.66751-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230904161516.66751-1-vignesh.raman@collabora.com>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
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
Cc: mripard@kernel.org, robdclark@google.com, daniels@collabora.com,
 emma@anholt.net, gustavo.padovan@collabora.com, linux-arm-msm@vger.kernel.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 robclark@freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the following jobs, as the issues noted in the
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

v2:
  - Reworded the commit message
  
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

