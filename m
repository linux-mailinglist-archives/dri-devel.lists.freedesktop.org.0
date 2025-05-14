Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA95AB61EC
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 07:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29E010E248;
	Wed, 14 May 2025 05:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Y06gphPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F286B10E248
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 05:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747199059;
 bh=DjH1Ryu05FluAEBAD6RHIR7ooIPyVk51weM9fF2FHg0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y06gphPQaRp7CZLcFyRDCgB26+c2whwS1M+i2VeLLgDIG58+kCAgvKumtEaMG8lr3
 XyLG4MvXcO8NMEw3etzEfixFZNnz98UI+ztrBdiILRLDUlDm4o0t3SdPv1kW9YhUpV
 sfQPhuswoHo3XSKlCYYhDxOEd/D8EwMFTDUfSQaBwfkaV4LeYLdTKtjBLUvUfir4Cj
 y7g0XcxltFTjPVglpR5iY2KmLW7T2iXczvy4vqZwUxFXBF7w1XyPXNN1KoP3vt1Kaj
 25j4pdw8aEg3QJ/sL0yykQxqLhtrohch484tLQqMRhbe1ZwaIBrgVo2GZL4W3V9nw4
 SoAEtCab9+yUQ==
Received: from debian.. (unknown [171.76.80.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 29E7717E3681;
 Wed, 14 May 2025 07:04:15 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/ci: uprev mesa and ci-templates
Date: Wed, 14 May 2025 10:33:36 +0530
Message-ID: <20250514050340.1418448-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514050340.1418448-1-vignesh.raman@collabora.com>
References: <20250514050340.1418448-1-vignesh.raman@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current s3cp stopped working after the migration. Update to the
latest mesa and ci-templates to get s3cp working again and adapt to
recent changes in mesa-ci.

Acked-by: Helen Koike <helen.fornazier@gmail.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Uprev mesa and ci-templates to the latest version to get s3cp
    working again.

v3:
  - Rebase on msm-next and fix review comments in 
    https://gitlab.freedesktop.org/drm/msm/-/merge_requests/169  

---
 drivers/gpu/drm/ci/build-igt.sh   |  2 +-
 drivers/gpu/drm/ci/build.sh       |  6 ++---
 drivers/gpu/drm/ci/build.yml      | 10 +++++--
 drivers/gpu/drm/ci/container.yml  | 30 +++++----------------
 drivers/gpu/drm/ci/gitlab-ci.yml  | 45 ++++++++++++++++++++-----------
 drivers/gpu/drm/ci/igt_runner.sh  |  1 +
 drivers/gpu/drm/ci/image-tags.yml | 20 +++++---------
 drivers/gpu/drm/ci/lava-submit.sh |  6 +++--
 drivers/gpu/drm/ci/test.yml       | 31 +++++++++++----------
 9 files changed, 75 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
index caa2f4804ed5..eddb5f782a5e 100644
--- a/drivers/gpu/drm/ci/build-igt.sh
+++ b/drivers/gpu/drm/ci/build-igt.sh
@@ -71,4 +71,4 @@ tar -cf artifacts/igt.tar /igt
 # Pass needed files to the test stage
 S3_ARTIFACT_NAME="igt.tar.gz"
 gzip -c artifacts/igt.tar > ${S3_ARTIFACT_NAME}
-s3_upload ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${KERNEL_ARCH}/
+ci-fairy s3cp --token-file "${S3_JWT_FILE}" ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${KERNEL_ARCH}/${S3_ARTIFACT_NAME}
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 6fb74c51abe2..284873e94d8d 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -148,13 +148,13 @@ if [[ "$UPLOAD_TO_MINIO" = "1" ]]; then
 
     ls -l "${S3_JWT_FILE}"
     for f in $FILES_TO_UPLOAD; do
-        s3_upload /kernel/$f \
-                https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/
+        ci-fairy s3cp --token-file "${S3_JWT_FILE}" /kernel/$f \
+                https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/$f
     done
 
     S3_ARTIFACT_NAME="kernel-files.tar.zst"
     tar --zstd -cf $S3_ARTIFACT_NAME install
-    s3_upload ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/
+    ci-fairy s3cp --token-file "${S3_JWT_FILE}" ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/${S3_ARTIFACT_NAME}
 
     echo "Download vmlinux.xz from https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/vmlinux.xz"
 fi
diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index 8eb56ebcf4aa..af27ff5de369 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -13,7 +13,7 @@
     - .build
     - .use-debian/arm64_build
   tags:
-    - aarch64
+    - $FDO_RUNNER_JOB_PRIORITY_TAG_AARCH64
   variables:
     DEFCONFIG: "arch/arm/configs/multi_v7_defconfig"
     KERNEL_IMAGE_NAME: "zImage"
@@ -24,7 +24,7 @@
     - .build
     - .use-debian/arm64_build
   tags:
-    - aarch64
+    - $FDO_RUNNER_JOB_PRIORITY_TAG_AARCH64
   variables:
     DEFCONFIG: "arch/arm64/configs/defconfig"
     KERNEL_IMAGE_NAME: "Image"
@@ -44,16 +44,22 @@
 
 igt:arm32:
   extends: .build:arm32
+  variables:
+    GIT_DEPTH: 10
   script:
     - FDO_CI_CONCURRENT=${FDO_CI_CONCURRENT} bash drivers/gpu/drm/ci/build-igt.sh
 
 igt:arm64:
   extends: .build:arm64
+  variables:
+    GIT_DEPTH: 10
   script:
     - FDO_CI_CONCURRENT=${FDO_CI_CONCURRENT} bash drivers/gpu/drm/ci/build-igt.sh
 
 igt:x86_64:
   extends: .build:x86_64
+  variables:
+    GIT_DEPTH: 10
   script:
     - FDO_CI_CONCURRENT=${FDO_CI_CONCURRENT} bash drivers/gpu/drm/ci/build-igt.sh
 
diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/container.yml
index 56c95c2f91ae..5f90508578a3 100644
--- a/drivers/gpu/drm/ci/container.yml
+++ b/drivers/gpu/drm/ci/container.yml
@@ -20,31 +20,15 @@ debian/arm64_build:
     EXTRA_LOCAL_PACKAGES: "jq libasound2 libcairo2 libdw1 libglib2.0-0 libjson-c5"
 
 # Disable container jobs that we won't use
-alpine/x86_64_build:
-  rules:
-    - when: never
-
-debian/arm32_test-base:
-  rules:
-    - when: never
-
-debian/arm32_test-gl:
-  rules:
-    - when: never
-
-debian/arm32_test-vk:
-  rules:
-    - when: never
-
-debian/arm64_test-gl:
+debian/arm64_test-vk:
   rules:
     - when: never
 
-debian/arm64_test-vk:
+debian/baremetal_arm32_test-gl:
   rules:
     - when: never
 
-debian/baremetal_arm32_test:
+debian/baremetal_arm64_test-vk:
   rules:
     - when: never
 
@@ -64,19 +48,19 @@ debian/x86_64_test-android:
   rules:
     - when: never
 
-debian/x86_64_test-vk:
+debian/x86_64_test-video:
   rules:
     - when: never
 
-fedora/x86_64_build:
+debian/x86_64_test-vk:
   rules:
     - when: never
 
-debian/android_build:
+fedora/x86_64_build:
   rules:
     - when: never
 
-.debian/x86_64_test-android:
+debian/android_build:
   rules:
     - when: never
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index cffcacfd070e..d9e1042fc140 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha f73132f1215a37ce8ffc711a0136c90649aaf128
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 02337aec715c25dae7ff2479d986f831c77fe536
 
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
@@ -11,7 +11,7 @@ variables:
   DEQP_RUNNER_GIT_TAG: v0.20.0
 
   FDO_UPSTREAM_REPO: helen.fornazier/linux   # The repo where the git-archive daily runs
-  MESA_TEMPLATES_COMMIT: &ci-templates-commit d5aa3941aa03c2f716595116354fb81eb8012acb
+  MESA_TEMPLATES_COMMIT: &ci-templates-commit c6aeb16f86e32525fa630fb99c66c4f3e62fc3cb
   DRM_CI_PROJECT_URL: https://gitlab.freedesktop.org/${DRM_CI_PROJECT_PATH}
   CI_PRE_CLONE_SCRIPT: |-
           set -o xtrace
@@ -20,10 +20,8 @@ variables:
           rm download-git-cache.sh
           set +o xtrace
   S3_JWT_FILE: /s3_jwt
-  S3_JWT_HEADER_FILE: /s3_jwt_header
   S3_JWT_FILE_SCRIPT: |-
       echo -n '${S3_JWT}' > '${S3_JWT_FILE}' &&
-      echo -n "Authorization: Bearer ${S3_JWT}" > '${S3_JWT_HEADER_FILE}' &&
       unset CI_JOB_JWT S3_JWT  # Unsetting vulnerable env variables
   S3_HOST: s3.freedesktop.org
   # This bucket is used to fetch the kernel image
@@ -38,7 +36,11 @@ variables:
   JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
   KERNEL_IMAGE_BASE: https://${S3_HOST}/${S3_KERNEL_BUCKET}/${KERNEL_REPO}/${KERNEL_TAG}
   LAVA_TAGS: subset-1-gfx
-  LAVA_JOB_PRIORITY: 30
+  # Default priority for non-merge pipelines
+  FDO_RUNNER_JOB_PRIORITY_TAG_X86_64: ""  # Empty tags are ignored by gitlab
+  FDO_RUNNER_JOB_PRIORITY_TAG_X86_64_KVM: kvm
+  FDO_RUNNER_JOB_PRIORITY_TAG_AARCH64: aarch64
+  JOB_PRIORITY: 30
   ARTIFACTS_BASE_URL: https://${CI_PROJECT_ROOT_NAMESPACE}.${CI_PAGES_DOMAIN}/-/${CI_PROJECT_NAME}/-/jobs/${CI_JOB_ID}/artifacts
   # Python scripts for structured logger
   PYTHONPATH: "$PYTHONPATH:$CI_PROJECT_DIR/install"
@@ -72,16 +74,13 @@ default:
 
 
 include:
-  - project: 'freedesktop/ci-templates'
-    ref: 16bc29078de5e0a067ff84a1a199a3760d3b3811
-    file:
-      - '/templates/ci-fairy.yml'
   - project: 'freedesktop/ci-templates'
     ref: *ci-templates-commit
     file:
       - '/templates/alpine.yml'
       - '/templates/debian.yml'
       - '/templates/fedora.yml'
+      - '/templates/ci-fairy.yml'
   - project: *drm-ci-project-path
     ref: *drm-ci-commit-sha
     file:
@@ -105,6 +104,7 @@ include:
       - '/src/microsoft/ci/gitlab-ci-inc.yml'
       - '/src/nouveau/ci/gitlab-ci-inc.yml'
       - '/src/virtio/ci/gitlab-ci-inc.yml'
+      - 'docs/gitlab-ci.yml'
   - drivers/gpu/drm/ci/image-tags.yml
   - drivers/gpu/drm/ci/container.yml
   - drivers/gpu/drm/ci/static-checks.yml
@@ -116,6 +116,7 @@ include:
 stages:
   - sanity
   - container
+  - deploy
   - git-archive
   - build-for-tests
   - build-only
@@ -238,15 +239,14 @@ python-artifacts:
 
 
 # Git archive
-make git archive:
+make-git-archive:
   extends:
     - .fdo.ci-fairy
   stage: git-archive
   rules:
     - !reference [.scheduled_pipeline-rules, rules]
-  # ensure we are running on packet
   tags:
-    - packet.net
+    - $FDO_RUNNER_JOB_PRIORITY_TAG_X86_64
   script:
     # Remove drm-ci files we just added
     - rm -rf .gitlab-ci.*
@@ -258,7 +258,7 @@ make git archive:
     - tar -cvzf ../$CI_PROJECT_NAME.tar.gz .
 
     # Use id_tokens for JWT auth
-    - s3_upload ../$CI_PROJECT_NAME.tar.gz https://$S3_HOST/${S3_GITCACHE_BUCKET}/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/
+    - ci-fairy s3cp --token-file "${S3_JWT_FILE}" ../$CI_PROJECT_NAME.tar.gz https://$S3_HOST/${S3_GITCACHE_BUCKET}/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/$CI_PROJECT_NAME.tar.gz
 
 
 # Sanity checks of MR settings and commit logs
@@ -266,6 +266,8 @@ sanity:
   extends:
     - .fdo.ci-fairy
   stage: sanity
+  tags:
+    - $FDO_RUNNER_JOB_PRIORITY_TAG_X86_64
   rules:
     - if: *is-pre-merge
       when: on_success
@@ -284,7 +286,6 @@ sanity:
         DEBIAN_BUILD_TAG
         DEBIAN_PYUTILS_TAG
         DEBIAN_TEST_GL_TAG
-        KERNEL_ROOTFS_TAG
         KERNEL_TAG
         PKG_REPO_REV
       )
@@ -300,14 +301,14 @@ sanity:
     when: on_failure
     reports:
       junit: check-*.xml
-  tags:
-    - placeholder-job
 
 
 mr-label-maker-test:
   extends:
     - .fdo.ci-fairy
   stage: sanity
+  tags:
+    - $FDO_RUNNER_JOB_PRIORITY_TAG_X86_64
   rules:
     - !reference [.mr-label-maker-rules, rules]
   variables:
@@ -330,3 +331,15 @@ mr-label-maker-test:
       optional: true
     - job: toml-lint
       optional: true
+
+deploy-docs:
+   rules:
+    - when: never
+
+linkcheck-docs:
+   rules:
+    - when: never
+
+test-docs:
+   rules:
+    - when: never
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 2a0599f12c58..b24d4bc53cda 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -19,6 +19,7 @@ set +e
 cat /sys/kernel/debug/dri/*/state
 set -e
 
+mkdir -p /lib/modules
 case "$DRIVER_NAME" in
     amdgpu|vkms)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 53fe34b86578..7acc2e2a8eaa 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,24 +1,18 @@
 variables:
-   CONTAINER_TAG: "20250328-mesa-uprev"
-   DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
+   CONTAINER_TAG: "20250502-mesa-uprev"
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
-
-   DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
    DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"
 
-   KERNEL_ROOTFS_TAG: "${CONTAINER_TAG}"
+   DEBIAN_TEST_GL_TAG: "${CONTAINER_TAG}"
    # default kernel for rootfs before injecting the current kernel tree
-   KERNEL_TAG: "v6.13-rc4-mesa-5e77"
+   KERNEL_TAG: "v6.14-mesa-0bdd"
    KERNEL_REPO: "gfx-ci/linux"
-   PKG_REPO_REV: "bca9635d"
-
-   DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
-   DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
-   DEBIAN_TEST_GL_TAG: "${CONTAINER_TAG}"
+   PKG_REPO_REV: "95bf62c"
 
-   DEBIAN_PYUTILS_IMAGE: "debian/x86_64_pyutils"
    DEBIAN_PYUTILS_TAG: "${CONTAINER_TAG}"
 
+   ALPINE_X86_64_BUILD_TAG: "${CONTAINER_TAG}"
    ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
 
-   CONDITIONAL_BUILD_ANGLE_TAG: fec96cc945650c5fe9f7188cabe80d8a
+   CONDITIONAL_BUILD_ANGLE_TAG: 384145a4023315dae658259bee07c43a
+   CONDITIONAL_BUILD_PIGLIT_TAG: a19e424b8a3f020dbf1b9dd29f220a4f
diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
index a1e8b34fb2d4..a295102c3468 100755
--- a/drivers/gpu/drm/ci/lava-submit.sh
+++ b/drivers/gpu/drm/ci/lava-submit.sh
@@ -41,7 +41,6 @@ section_start prepare_rootfs "Preparing root filesystem"
 
 set -ex
 
-section_switch rootfs "Assembling root filesystem"
 ROOTFS_URL="$(get_path_to_artifact lava-rootfs.tar.zst)"
 [ $? != 1 ] || exit 1
 
@@ -54,7 +53,7 @@ cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/
 cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
 
 tar zcf job-rootfs-overlay.tar.gz -C results/job-rootfs-overlay/ .
-s3_upload job-rootfs-overlay.tar.gz "https://${JOB_ARTIFACTS_BASE}"
+ci-fairy s3cp --token-file "${S3_JWT_FILE}" job-rootfs-overlay.tar.gz "https://${JOB_ROOTFS_OVERLAY_PATH}"
 
 # Prepare env vars for upload.
 section_switch variables "Environment variables passed through to device:"
@@ -64,6 +63,9 @@ section_switch lava_submit "Submitting job for scheduling"
 
 touch results/lava.log
 tail -f results/lava.log &
+# Ensure that we are printing the commands that are being executed,
+# making it easier to debug the job in case it fails.
+set -x
 PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
 	--farm "${FARM}" \
 	--device-type "${DEVICE_TYPE}" \
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 84a25f0e783b..795a2631833b 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -24,7 +24,7 @@
 
 .lava-igt:arm32:
   extends:
-    - .lava-test:arm32
+    - .lava-arm32-test-gl
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
     DEBIAN_ARCH: "armhf"
@@ -33,15 +33,14 @@
     - testing:arm32
   needs:
     - alpine/x86_64_lava_ssh_client
-    - kernel+rootfs_arm32
-    - debian/x86_64_build
+    - debian/arm32_test-gl
     - python-artifacts
     - testing:arm32
     - igt:arm32
 
 .lava-igt:arm64:
   extends:
-    - .lava-test:arm64
+    - .lava-arm64-test-gl
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
     DEBIAN_ARCH: "arm64"
@@ -50,15 +49,14 @@
     - testing:arm64
   needs:
     - alpine/x86_64_lava_ssh_client
-    - kernel+rootfs_arm64
-    - debian/x86_64_build
+    - debian/arm64_test-gl
     - python-artifacts
     - testing:arm64
     - igt:arm64
 
 .lava-igt:x86_64:
   extends:
-    - .lava-test:x86_64
+    - .lava-x86_64-test-gl
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
     DEBIAN_ARCH: "amd64"
@@ -67,16 +65,15 @@
     - testing:x86_64
   needs:
     - alpine/x86_64_lava_ssh_client
-    - kernel+rootfs_x86_64
-    - debian/x86_64_build
+    - debian/x86_64_test-gl
     - python-artifacts
     - testing:x86_64
     - igt:x86_64
 
 .baremetal-igt-arm64:
   extends:
-    - .baremetal-test-arm64
-    - .use-debian/baremetal_arm64_test
+    - .baremetal-test-arm64-gl
+    - .use-debian/baremetal_arm64_test-gl
     - .allow_failure_lockdep
   timeout: "1h30m"
   rules:
@@ -91,7 +88,7 @@
     BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
     FARM: google
   needs:
-    - debian/baremetal_arm64_test
+    - debian/baremetal_arm64_test-gl
     - job: testing:arm64
       artifacts: false
     - igt:arm64
@@ -101,19 +98,21 @@
 .software-driver:
   stage: software-driver
   extends:
+    - .test-gl
     - .allow_failure_lockdep
   timeout: "1h30m"
   rules:
     - !reference [.scheduled_pipeline-rules, rules]
     - when: on_success
-  extends:
-    - .test-gl
   tags:
-    - kvm
+    - $FDO_RUNNER_JOB_PRIORITY_TAG_X86_64_KVM
+  before_script:
+    - !reference [default, before_script]
+    - rm -rf install
+    - tar -xf artifacts/install.tar
   script:
     - ln -sf $CI_PROJECT_DIR/install /install
     - mv install/bzImage /kernel/bzImage
-    - mkdir -p /lib/modules
     - install/crosvm-runner.sh install/igt_runner.sh
   needs:
     - debian/x86_64_test-gl
-- 
2.47.2

