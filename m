Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5D94A2FF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 10:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52E610E125;
	Wed,  7 Aug 2024 08:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="ir9NddUu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2024 08:36:12 UTC
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D59C10E125
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 08:36:12 +0000 (UTC)
Delivered-To: daniels@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723018867; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZJElaatvcYXBycHHxoc8eo38AnN55mSSRS6EmA0oITnPEyF4ElJvKEi48h62kahLV66OxVWeh5sOElLbr1/qjU3uwcaZjtTMKAIuNPQH+ebVSEl5C52tUzQPxMRk2/XZOHBtjSDIaASffeoFNCBLt6Svi42uOBACo2Vq+MUfdnk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723018867;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9HH5J5pheMHQbYtu6UKFxGxCRC6ubAR8RRggZLYoxYE=; 
 b=CADT9bK8zL/AdnqpQnROp39dWq1es6hVB2O3INgmXoQcrn+CWwz0Rp2cQWeUpBv385OnzuDEWA7n9gwB5ClTiaT0wKcIBZ7Raci85t6p62XbSPKh8x3JrgVElFXbzaQmXe7uTSXCw0Ilz2cXLqUh+P+SLnaC2cBCmNdw/+hqfyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
 dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723018867; 
 s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9HH5J5pheMHQbYtu6UKFxGxCRC6ubAR8RRggZLYoxYE=;
 b=ir9NddUuvhMNoqJPg+jCXws4YBQz+6H5rStAtBFN0dpmqJbeqhhh/AgdQZRTjTFn
 H1vZA0xDvoKEnh3O4tWuIAg2ChnDlJig/QyauuMcd2JPE4AhW8AxgLTXTD6SGov2wFN
 7ssDQhN6QTUH9ric3prOFZumROvZKujfpz0dz/jI=
Received: by mx.zohomail.com with SMTPS id 1723018865189439.50743036529866;
 Wed, 7 Aug 2024 01:21:05 -0700 (PDT)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: uprev mesa
Date: Wed,  7 Aug 2024 13:50:18 +0530
Message-ID: <20240807082020.429434-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uprev mesa to adapt to the latest changes in mesa ci.
Project 'anholt/deqp-runner' was moved to 'mesa/deqp-runner'.
So update the link.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v1:
  - Working pipeline link,
    https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1242911

---
 drivers/gpu/drm/ci/container.yml  |  8 ++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml  | 22 ++++++++++++----------
 drivers/gpu/drm/ci/image-tags.yml |  8 ++++----
 drivers/gpu/drm/ci/lava-submit.sh |  1 +
 drivers/gpu/drm/ci/test.yml       |  4 ++--
 5 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/container.yml
index d6edf3635b23..2a94f54ce4cf 100644
--- a/drivers/gpu/drm/ci/container.yml
+++ b/drivers/gpu/drm/ci/container.yml
@@ -28,6 +28,14 @@ debian/x86_64_test-vk:
   rules:
     - when: never
 
+debian/arm64_test-vk:
+  rules:
+    - when: never
+
+debian/arm64_test-gl:
+  rules:
+    - when: never
+
 fedora/x86_64_build:
   rules:
     - when: never
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 6d2cefa7f15e..eca47d4f816f 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,13 +1,13 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha e2b9c5a9e3e4f9b532067af8022eaef8d6fc6c00
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha d9849ac46623797a9f56fb9d46dc52460ac477de
 
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
 
   IGT_VERSION: f13702b8e4e847c56da3ef6f0969065d686049c5
 
-  DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
+  DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/mesa/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
 
   FDO_UPSTREAM_REPO: helen.fornazier/linux   # The repo where the git-archive daily runs
@@ -85,22 +85,24 @@ include:
   - project: *drm-ci-project-path
     ref: *drm-ci-commit-sha
     file:
+      - '/.gitlab-ci/container/gitlab-ci.yml'
       - '/.gitlab-ci/farm-rules.yml'
+      - '/.gitlab-ci/lava/lava-gitlab-ci.yml'
       - '/.gitlab-ci/test-source-dep.yml'
-      - '/.gitlab-ci/container/gitlab-ci.yml'
       - '/.gitlab-ci/test/gitlab-ci.yml'
-      - '/.gitlab-ci/lava/lava-gitlab-ci.yml'
-      - '/src/microsoft/ci/gitlab-ci-inc.yml'
-      - '/src/gallium/drivers/zink/ci/gitlab-ci-inc.yml'
+      - '/src/amd/ci/gitlab-ci-inc.yml'
+      - '/src/freedreno/ci/gitlab-ci-inc.yml'
       - '/src/gallium/drivers/crocus/ci/gitlab-ci-inc.yml'
-      - '/src/gallium/drivers/softpipe/ci/gitlab-ci-inc.yml'
       - '/src/gallium/drivers/llvmpipe/ci/gitlab-ci-inc.yml'
-      - '/src/gallium/drivers/virgl/ci/gitlab-ci-inc.yml'
       - '/src/gallium/drivers/nouveau/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/drivers/softpipe/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/drivers/virgl/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/drivers/zink/ci/gitlab-ci-inc.yml'
       - '/src/gallium/frontends/lavapipe/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/frontends/rusticl/ci/gitlab-ci.yml'
       - '/src/intel/ci/gitlab-ci-inc.yml'
-      - '/src/freedreno/ci/gitlab-ci-inc.yml'
-      - '/src/amd/ci/gitlab-ci-inc.yml'
+      - '/src/microsoft/ci/gitlab-ci-inc.yml'
+      - '/src/nouveau/ci/gitlab-ci-inc.yml'
       - '/src/virtio/ci/gitlab-ci-inc.yml'
   - drivers/gpu/drm/ci/image-tags.yml
   - drivers/gpu/drm/ci/container.yml
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 13eda37bdf05..2c340d063a96 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,15 +1,15 @@
 variables:
-   CONTAINER_TAG: "2024-05-09-mesa-uprev"
+   CONTAINER_TAG: "2024-08-07-mesa-uprev"
    DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
-   DEBIAN_BUILD_TAG: "2024-06-10-vkms"
+   DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"
 
-   KERNEL_ROOTFS_TAG: "2023-10-06-amd"
+   KERNEL_ROOTFS_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
    DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
-   DEBIAN_X86_64_TEST_GL_TAG: "${CONTAINER_TAG}"
+   DEBIAN_TEST_GL_TAG: "${CONTAINER_TAG}"
 
    ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
index 0707fa706a48..6add15083c78 100755
--- a/drivers/gpu/drm/ci/lava-submit.sh
+++ b/drivers/gpu/drm/ci/lava-submit.sh
@@ -44,6 +44,7 @@ PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
 	--first-stage-init artifacts/ci-common/init-stage1.sh \
 	--ci-project-dir "${CI_PROJECT_DIR}" \
 	--device-type "${DEVICE_TYPE}" \
+	--farm "${FARM}" \
 	--dtb-filename "${DTB}" \
 	--jwt-file "${S3_JWT_FILE}" \
 	--kernel-image-name "${KERNEL_IMAGE_NAME}" \
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index b22b2cf8f06f..b6f428cdaf94 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -69,7 +69,7 @@
 .baremetal-igt-arm64:
   extends:
     - .baremetal-test-arm64
-    - .use-debian/arm64_test
+    - .use-debian/baremetal_arm64_test
     - .test-rules
   variables:
     FDO_CI_CONCURRENT: 10
@@ -79,7 +79,7 @@
     BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
     FARM: google
   needs:
-    - debian/arm64_test
+    - debian/baremetal_arm64_test
     - job: testing:arm64
       artifacts: false
     - igt:arm64
-- 
2.43.0

