Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLabHVTaimngOQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 08:12:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC19117B7B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 08:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5C810E4D0;
	Tue, 10 Feb 2026 07:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YRQfcy2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEA710E4D1;
 Tue, 10 Feb 2026 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770707535;
 bh=7EQaHKYvMqQs2ncZDSglhN1/GM+vn4OVGn+h9p96JJw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YRQfcy2+aSVoJcPb2x70ccCET0YAJ3pNJxnWnvTtk9U2PweMKY3lCAh4s7vwaaU1A
 Xv7aYC5kpOZC2PRaNHG/npCp9AM1rr9vf19lYFZ33dqJ94nwEfHtMDtbcy0qtB8BSS
 fVVT846VRf79zCRHnTagZnTTl9SGC6VGe4/5k+3ILd+/E2P2lCbWjKXldGIYnnT6Wi
 eR2zwX5+zpZhuV/6D/uaHG2Fs2RFQ9PS85FMGgUPJ/5iYaw+VVhlYwlblXYnEdkNHV
 Wug93wCe8G840QvAxVxSxQy2/q/3CLPgQmseuG/jp8JBtqjXGOJtQFS4EpYVedziar
 IUpT/G1O+yB9A==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 286D717E0699;
 Tue, 10 Feb 2026 08:12:10 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm/ci: uprev mesa
Date: Tue, 10 Feb 2026 12:41:32 +0530
Message-ID: <20260210071138.2256773-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210071138.2256773-1-vignesh.raman@collabora.com>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,lists.infradead.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EDC19117B7B
X-Rspamd-Action: no action

Uprev mesa to adapt to the latest changes in Mesa CI, such as:
 - LAVA overlay-based firmware handling
 - Container/job rule separation
 - Removal of the python-artifacts job
 - Use lava-job-submitter container to submit jobs
 - Use of the Alpine container for LAVA jobs
 - Various other CI improvements
 - Remove bare-metal jobs and disable apq8016 and apq8096 jobs,
   as these have been migrated to the Collabora LAVA farm
 - Fix issues with rebase with external fixes branch
 - Update expectation files

Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---

v2:
  - Merge patch to fix issues with rebase with external fixes branch
  - Remove bare-metal jobs and disable apq8016 and apq8096 jobs
  - Update expectation files

---
 drivers/gpu/drm/ci/build.sh                   |  12 +--
 drivers/gpu/drm/ci/build.yml                  |  40 +++----
 drivers/gpu/drm/ci/container.yml              |  32 ++++--
 drivers/gpu/drm/ci/gitlab-ci.yml              |  95 ++++++++++++----
 drivers/gpu/drm/ci/igt_runner.sh              |   4 +-
 drivers/gpu/drm/ci/image-tags.yml             |  22 ++--
 drivers/gpu/drm/ci/lava-submit.sh             | 101 ++++++++----------
 drivers/gpu/drm/ci/static-checks.yml          |   1 +
 drivers/gpu/drm/ci/test.yml                   |  52 +++------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  13 ++-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   7 ++
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  27 +----
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |  24 +----
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  37 ++-----
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 ++
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  22 ++--
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  27 +----
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   5 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   5 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   6 ++
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  13 +--
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  12 +--
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  35 ++++++
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   5 +-
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   5 +-
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   1 +
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  15 ++-
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 ++++
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  12 ++-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  35 ++++++
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  66 ++----------
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   2 +
 35 files changed, 398 insertions(+), 366 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index ac5e7ed195cf..4353ee0f8889 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -3,9 +3,6 @@
 
 set -ex
 
-# Clean up stale rebases that GitLab might not have removed when reusing a checkout dir
-rm -rf .git/rebase-apply
-
 . .gitlab-ci/container/container_pre_build.sh
 
 # libssl-dev was uninstalled because it was considered an ephemeral package
@@ -61,25 +58,24 @@ export PATH=$NEWPATH:$PATH
 
 git config --global user.email "fdo@example.com"
 git config --global user.name "freedesktop.org CI"
-git config --global pull.rebase true
 
 # cleanup git state on the worker
-rm -rf .git/rebase-merge
+rm -rf .git/rebase-merge .git/rebase-apply
 
 # Try to merge fixes from target repo
 if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes)" ]; then
-    git pull ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes
+    git pull --no-rebase ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes
 fi
 
 # Try to merge fixes from local repo if this isn't a merge request
 # otherwise try merging the fixes from the merge target
 if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
     if [ "$(git ls-remote --exit-code --heads origin ${TARGET_BRANCH}-external-fixes)" ]; then
-        git pull origin ${TARGET_BRANCH}-external-fixes
+        git pull --no-rebase origin ${TARGET_BRANCH}-external-fixes
     fi
 else
     if [ "$(git ls-remote --exit-code --heads ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes)" ]; then
-        git pull ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes
+        git pull --no-rebase ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes
     fi
 fi
 
diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index af27ff5de369..efbcaae49807 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -1,6 +1,6 @@
 .build:
   extends:
-    - .container+build-rules
+    - .build-rules
   stage: build-only
   artifacts:
     paths:
@@ -133,6 +133,10 @@ debian-arm32-asan:
   rules:
     - when: never
 
+debian-x86_64-msan:
+  rules:
+    - when: never
+
 debian-arm64:
   rules:
     - when: never
@@ -153,7 +157,7 @@ debian-arm64-ubsan:
   rules:
     - when: never
 
-debian-build-testing:
+debian-build-x86_64:
   rules:
     - when: never
 
@@ -177,26 +181,14 @@ debian-release:
   rules:
     - when: never
 
+debian-riscv64:
+  rules:
+    - when: never
+
 debian-s390x:
   rules:
     - when: never
 
-debian-testing:
-  rules:
-    - when: never
-
-debian-testing-asan:
-  rules:
-    - when: never
-
-debian-testing-msan:
-  rules:
-    - when: never
-
-debian-testing-ubsan:
-  rules:
-    - when: never
-
 debian-vulkan:
   rules:
     - when: never
@@ -205,6 +197,18 @@ debian-x86_32:
   rules:
     - when: never
 
+debian-x86_64:
+  rules:
+    - when: never
+
+debian-x86_64-asan:
+  rules:
+    - when: never
+
+debian-x86_64-ubsan:
+  rules:
+    - when: never
+
 fedora-release:
   rules:
     - when: never
diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/container.yml
index 5f90508578a3..ce6007a45a07 100644
--- a/drivers/gpu/drm/ci/container.yml
+++ b/drivers/gpu/drm/ci/container.yml
@@ -5,21 +5,29 @@
 
 debian/x86_64_build-base:
   variables:
-    EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libkmod2 libkmod-dev libpciaccess-dev libproc2-dev libudev-dev libunwind-dev python3-docutils bc python3-ply libssl-dev bc"
-
-debian/x86_64_test-gl:
-  variables:
-    EXTRA_LOCAL_PACKAGES: "jq libasound2 libcairo2 libdw1 libglib2.0-0 libjson-c5 libkmod-dev libkmod2 libgles2 libproc2-dev"
+    EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libkmod-dev libpciaccess-dev libproc2-dev libudev-dev libunwind-dev python3-docutils bc python3-ply libssl-dev bc"
 
 debian/arm64_build:
   variables:
-    EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libproc2-dev libkmod2 libkmod-dev libpciaccess-dev libudev-dev libunwind-dev python3-docutils libssl-dev crossbuild-essential-armhf libkmod-dev:armhf libproc2-dev:armhf libunwind-dev:armhf libdw-dev:armhf libpixman-1-dev:armhf libcairo-dev:armhf libudev-dev:armhf libjson-c-dev:armhf"
+    EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libproc2-dev libkmod-dev libpciaccess-dev libudev-dev libunwind-dev python3-docutils libssl-dev crossbuild-essential-armhf libkmod-dev:armhf libproc2-dev:armhf libunwind-dev:armhf libdw-dev:armhf libpixman-1-dev:armhf libcairo-dev:armhf libudev-dev:armhf libjson-c-dev:armhf"
 
-.kernel+rootfs:
+debian/x86_64_test-gl:
   variables:
-    EXTRA_LOCAL_PACKAGES: "jq libasound2 libcairo2 libdw1 libglib2.0-0 libjson-c5"
+    EXTRA_LOCAL_PACKAGES: "jq libasound2t64 libcairo2 libdw1t64 libglib2.0-0t64 libjson-c5 libkmod2 libgles2 libdrm-nouveau2 libdrm-amdgpu1"
+
+debian/arm64_test-gl:
+  variables:
+    EXTRA_LOCAL_PACKAGES: "jq libasound2t64 libcairo2 libdw1t64 libglib2.0-0t64 libjson-c5 libkmod2 libgles2 libdrm-nouveau2 libdrm-amdgpu1"
+
+debian/arm32_test-gl:
+  variables:
+    EXTRA_LOCAL_PACKAGES: "jq libasound2t64 libcairo2 libdw1t64 libglib2.0-0t64 libjson-c5 libkmod2 libgles2 libdrm-nouveau2 libdrm-amdgpu1 libunwind8"
 
 # Disable container jobs that we won't use
+alpine/x86_64_build:
+  rules:
+    - when: never
+
 debian/arm64_test-vk:
   rules:
     - when: never
@@ -28,6 +36,10 @@ debian/baremetal_arm32_test-gl:
   rules:
     - when: never
 
+debian/baremetal_arm64_test-gl:
+  rules:
+    - when: never
+
 debian/baremetal_arm64_test-vk:
   rules:
     - when: never
@@ -36,6 +48,10 @@ debian/ppc64el_build:
   rules:
     - when: never
 
+debian/riscv64_build:
+  rules:
+    - when: never
+
 debian/s390x_build:
   rules:
     - when: never
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 56638814bb28..20e8cbdc39e9 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 02337aec715c25dae7ff2479d986f831c77fe536
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 25881c701a56233dd8fc7f92db6884a73949d63d
 
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
@@ -11,7 +11,7 @@ variables:
   DEQP_RUNNER_GIT_TAG: v0.20.0
 
   FDO_UPSTREAM_REPO: helen.fornazier/linux   # The repo where the git-archive daily runs
-  MESA_TEMPLATES_COMMIT: &ci-templates-commit c6aeb16f86e32525fa630fb99c66c4f3e62fc3cb
+  MESA_TEMPLATES_COMMIT: &ci-templates-commit aec7a6ce7bb38902c70641526f6611e27141784a
   DRM_CI_PROJECT_URL: https://gitlab.freedesktop.org/${DRM_CI_PROJECT_PATH}
   CI_PRE_CLONE_SCRIPT: |-
           set -o xtrace
@@ -30,6 +30,8 @@ variables:
   S3_GITCACHE_BUCKET: git-cache
   # Bucket for the pipeline artifacts pushed to S3
   S3_ARTIFACTS_BUCKET: artifacts
+  # Base path used for various artifacts
+  S3_BASE_PATH: "${S3_HOST}/${S3_KERNEL_BUCKET}"
   # per-pipeline artifact storage on MinIO
   PIPELINE_ARTIFACTS_BASE: ${S3_HOST}/${S3_ARTIFACTS_BUCKET}/${CI_PROJECT_PATH}/${CI_PIPELINE_ID}
   # per-job artifact storage on MinIO
@@ -44,6 +46,8 @@ variables:
   ARTIFACTS_BASE_URL: https://${CI_PROJECT_ROOT_NAMESPACE}.${CI_PAGES_DOMAIN}/-/${CI_PROJECT_NAME}/-/jobs/${CI_JOB_ID}/artifacts
   # Python scripts for structured logger
   PYTHONPATH: "$PYTHONPATH:$CI_PROJECT_DIR/install"
+  # Mesa-specific variables that shouldn't be forwarded to DUTs and crosvm
+  CI_EXCLUDE_ENV_VAR_REGEX: 'SCRIPTS_DIR|RESULTS_DIR'
 
 
 default:
@@ -84,10 +88,11 @@ include:
   - project: *drm-ci-project-path
     ref: *drm-ci-commit-sha
     file:
+      - '/.gitlab-ci/bare-metal/gitlab-ci.yml'
       - '/.gitlab-ci/build/gitlab-ci.yml'
       - '/.gitlab-ci/container/gitlab-ci.yml'
       - '/.gitlab-ci/farm-rules.yml'
-      - '/.gitlab-ci/lava/lava-gitlab-ci.yml'
+      - '/.gitlab-ci/lava/gitlab-ci.yml'
       - '/.gitlab-ci/test-source-dep.yml'
       - '/.gitlab-ci/test/gitlab-ci.yml'
       - '/src/amd/ci/gitlab-ci-inc.yml'
@@ -147,10 +152,10 @@ stages:
     - if: &is-merge-attempt $GITLAB_USER_LOGIN == "marge-bot" && $CI_PIPELINE_SOURCE == "merge_request_event"
     # post-merge pipeline
     - if: &is-post-merge $GITLAB_USER_LOGIN == "marge-bot" && $CI_PIPELINE_SOURCE == "push"
-    # Pre-merge pipeline
-    - if: &is-pre-merge $CI_PIPELINE_SOURCE == "merge_request_event"
+    # Pre-merge pipeline (because merge pipelines are already caught above)
+    - if: &is-merge-request $CI_PIPELINE_SOURCE == "merge_request_event"
     # Push to a branch on a fork
-    - if: &is-fork-push $CI_PIPELINE_SOURCE == "push"
+    - if: &is-push-to-fork $CI_PIPELINE_SOURCE == "push"
     # nightly pipeline
     - if: &is-scheduled-pipeline $CI_PIPELINE_SOURCE == "schedule"
     # pipeline for direct pushes that bypassed the CI
@@ -160,17 +165,59 @@ stages:
 # Rules applied to every job in the pipeline
 .common-rules:
   rules:
-    - if: *is-fork-push
+    - if: *is-push-to-fork
       when: manual
 
-
 .never-post-merge-rules:
   rules:
     - if: *is-post-merge
       when: never
 
 
-.container+build-rules:
+# Note: make sure the branches in this list are the same as in
+# `.build-only-delayed-rules` below.
+.container-rules:
+  rules:
+    - !reference [.common-rules, rules]
+    # Run when re-enabling a disabled farm, but not when disabling it
+    - !reference [.disable-farm-mr-rules, rules]
+    # Never run immediately after merging, as we just ran everything
+    - !reference [.never-post-merge-rules, rules]
+    # Only rebuild containers in merge pipelines if any tags have been
+    # changed, else we'll just use the already-built containers
+    - if: *is-merge-attempt
+      changes: &image_tags_path
+        - drivers/gpu/drm/ci/image-tags.yml
+      when: on_success
+    # Skip everything for pre-merge and merge pipelines which don't change
+    # anything in the build; we only do this for marge-bot and not user
+    # pipelines in a MR, because we might still need to run it to copy the
+    # container into the user's namespace.
+    - if: *is-merge-attempt
+      when: never
+    # Any MR pipeline which changes image-tags.yml needs to be able to
+    # rebuild the containers
+    - if: *is-merge-request
+      changes: *image_tags_path
+      when: manual
+    # ... however for MRs running inside the user namespace, we may need to
+    # run these jobs to copy the container images from upstream
+    - if: *is-merge-request
+      when: manual
+    # Build everything after someone bypassed the CI
+    - if: *is-direct-push
+      when: manual
+    # Scheduled pipelines reuse already-built containers
+    - if: *is-scheduled-pipeline
+      when: never
+    # Allow building everything in fork pipelines, but build nothing unless
+    # manually triggered
+    - when: manual
+
+
+# Note: make sure the branches in this list are the same as in
+# `.build-only-delayed-rules` below.
+.build-rules:
   rules:
     - !reference [.common-rules, rules]
     # Run when re-enabling a disabled farm, but not when disabling it
@@ -181,7 +228,7 @@ stages:
     - if: *is-merge-attempt
       when: on_success
     # Same as above, but for pre-merge pipelines
-    - if: *is-pre-merge
+    - if: *is-merge-request
       when: manual
     # Build everything after someone bypassed the CI
     - if: *is-direct-push
@@ -197,7 +244,7 @@ stages:
 # Repeat of the above but with `when: on_success` replaced with
 # `when: delayed` + `start_in:`, for build-only jobs.
 # Note: make sure the branches in this list are the same as in
-# `.container+build-rules` above.
+# `.build-rules` above.
 .build-only-delayed-rules:
   rules:
     - !reference [.common-rules, rules]
@@ -210,7 +257,7 @@ stages:
       when: delayed
       start_in: &build-delay 5 minutes
     # Same as above, but for pre-merge pipelines
-    - if: *is-pre-merge
+    - if: *is-merge-request
       when: manual
     # Build everything after someone bypassed the CI
     - if: *is-direct-push
@@ -237,11 +284,6 @@ stages:
       - _build/meson-logs/strace
 
 
-python-artifacts:
-  variables:
-    GIT_DEPTH: 10
-
-
 # Git archive
 make-git-archive:
   extends:
@@ -273,7 +315,7 @@ sanity:
   tags:
     - $FDO_RUNNER_JOB_PRIORITY_TAG_X86_64
   rules:
-    - if: *is-pre-merge
+    - if: *is-merge-request
       when: on_success
     - when: never
   variables:
@@ -284,7 +326,6 @@ sanity:
     - |
       set -eu
       image_tags=(
-        ALPINE_X86_64_LAVA_SSH_TAG
         CONTAINER_TAG
         DEBIAN_BASE_TAG
         DEBIAN_BUILD_TAG
@@ -347,3 +388,19 @@ linkcheck-docs:
 test-docs:
    rules:
     - when: never
+
+.ci-tron-x86_64-test-vk:
+   rules:
+    - when: never
+
+.ci-tron-x86_64-test-gl-manual:
+   rules:
+    - when: never
+
+.ci-tron-arm64-test-gl:
+   rules:
+    - when: never
+
+.ci-tron-x86_64-test-gl:
+   rules:
+    - when: never
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index b24d4bc53cda..1c01bda52237 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -1,6 +1,8 @@
-#!/bin/sh
+#!/usr/bin/env bash
 # SPDX-License-Identifier: MIT
 
+. "${SCRIPTS_DIR}/setup-test-env.sh"
+
 set -ex
 
 export IGT_FORCE_DRIVER=${DRIVER_NAME}
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 7acc2e2a8eaa..7c43ae22bfd3 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,18 +1,22 @@
 variables:
-   CONTAINER_TAG: "20250502-mesa-uprev"
-   DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
+   CONTAINER_TAG: "20260108-mesa-igt"
+
+   DEBIAN_BUILD_BASE_TAG: "${CONTAINER_TAG}"
    DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"
+   DEBIAN_TEST_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_TEST_GL_TAG: "${CONTAINER_TAG}"
    # default kernel for rootfs before injecting the current kernel tree
-   KERNEL_TAG: "v6.14-mesa-0bdd"
+   KERNEL_TAG: "v6.16-mesa-9d85"
    KERNEL_REPO: "gfx-ci/linux"
-   PKG_REPO_REV: "95bf62c"
-
-   DEBIAN_PYUTILS_TAG: "${CONTAINER_TAG}"
+   PKG_REPO_REV: "0d2527f6"
+   FIRMWARE_TAG: "8fc31b97"
+   FIRMWARE_REPO: "gfx-ci/firmware"
 
    ALPINE_X86_64_BUILD_TAG: "${CONTAINER_TAG}"
-   ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
 
-   CONDITIONAL_BUILD_ANGLE_TAG: 384145a4023315dae658259bee07c43a
-   CONDITIONAL_BUILD_PIGLIT_TAG: a19e424b8a3f020dbf1b9dd29f220a4f
+   CONDITIONAL_BUILD_ANGLE_TAG: efd57e99d51361944f87b9466356b0ce
+   CONDITIONAL_BUILD_CROSVM_TAG: 4079babd375b09761d59eacb25a0598a
+   CONDITIONAL_BUILD_PIGLIT_TAG: 21ab2c66f54777163dd038dc4cfcfde6
+
+   CROSVM_TAG: ${CONDITIONAL_BUILD_CROSVM_TAG}
diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
index a295102c3468..405055aa9cc4 100755
--- a/drivers/gpu/drm/ci/lava-submit.sh
+++ b/drivers/gpu/drm/ci/lava-submit.sh
@@ -3,27 +3,18 @@
 # shellcheck disable=SC2086 # we want word splitting
 # shellcheck disable=SC1091 # paths only become valid at runtime
 
+# shellcheck disable=SC1090
+source "${FDO_CI_BASH_HELPERS}"
+
+fdo_log_section_start_collapsed prepare_rootfs "Preparing root filesystem"
+
+set -ex
+
 # If we run in the fork (not from mesa or Marge-bot), reuse mainline kernel and rootfs, if exist.
-_check_artifact_path() {
-	_url="https://${1}/${2}"
-	if curl -s -o /dev/null -I -L -f --retry 4 --retry-delay 15 "${_url}"; then
-		echo -n "${_url}"
-	fi
-}
-
-get_path_to_artifact() {
-	_mainline_artifact="$(_check_artifact_path ${BASE_SYSTEM_MAINLINE_HOST_PATH} ${1})"
-	if [ -n "${_mainline_artifact}" ]; then
-		echo -n "${_mainline_artifact}"
-		return
-	fi
-	_fork_artifact="$(_check_artifact_path ${BASE_SYSTEM_FORK_HOST_PATH} ${1})"
-	if [ -n "${_fork_artifact}" ]; then
-		echo -n "${_fork_artifact}"
-		return
-	fi
+ROOTFS_URL="$(fdo_find_s3_path "$LAVA_ROOTFS_PATH")" ||
+{
 	set +x
-	error "Sorry, I couldn't find a viable built path for ${1} in either mainline or a fork." >&2
+	fdo_log_section_error "Sorry, I couldn't find a viable built path for ${LAVA_ROOTFS_PATH} in either mainline or a fork." >&2
 	echo "" >&2
 	echo "If you're working on CI, this probably means that you're missing a dependency:" >&2
 	echo "this job ran ahead of the job which was supposed to upload that artifact." >&2
@@ -35,38 +26,51 @@ get_path_to_artifact() {
 	exit 1
 }
 
-. "${SCRIPTS_DIR}/setup-test-env.sh"
-
-section_start prepare_rootfs "Preparing root filesystem"
-
-set -ex
-
-ROOTFS_URL="$(get_path_to_artifact lava-rootfs.tar.zst)"
-[ $? != 1 ] || exit 1
-
 rm -rf results
-mkdir -p results/job-rootfs-overlay/
+mkdir results
 
-artifacts/ci-common/export-gitlab-job-env-for-dut.sh \
-    > results/job-rootfs-overlay/set-job-env-vars.sh
-cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/
-cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
+fdo_filter_env_vars > dut-env-vars.sh
+# Set SCRIPTS_DIR to point to the Mesa install we download for the DUT
+echo "export SCRIPTS_DIR='$CI_PROJECT_DIR/install'" >> dut-env-vars.sh
 
-tar zcf job-rootfs-overlay.tar.gz -C results/job-rootfs-overlay/ .
-ci-fairy s3cp --token-file "${S3_JWT_FILE}" job-rootfs-overlay.tar.gz "https://${JOB_ROOTFS_OVERLAY_PATH}"
+fdo_log_section_end prepare_rootfs
 
 # Prepare env vars for upload.
-section_switch variables "Environment variables passed through to device:"
-cat results/job-rootfs-overlay/set-job-env-vars.sh
+fdo_log_section_start_collapsed variables "Environment variables passed through to device:"
+cat dut-env-vars.sh
+fdo_log_section_end variables
 
-section_switch lava_submit "Submitting job for scheduling"
+fdo_log_section_start_collapsed lava_submit "Submitting job for scheduling"
 
 touch results/lava.log
 tail -f results/lava.log &
 # Ensure that we are printing the commands that are being executed,
 # making it easier to debug the job in case it fails.
 set -x
-PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
+
+# List of optional overlays
+LAVA_EXTRA_OVERLAYS=()
+if [ -n "${LAVA_FIRMWARE:-}" ]; then
+    for fw in $LAVA_FIRMWARE; do
+        LAVA_EXTRA_OVERLAYS+=(
+            - append-overlay
+              --name=linux-firmware
+              --url="https://${S3_BASE_PATH}/${FIRMWARE_REPO}/${fw}-${FIRMWARE_TAG}.tar"
+              --path="/"
+              --format=tar
+        )
+    done
+fi
+LAVA_EXTRA_OVERLAYS+=(
+    - append-overlay \
+      --name=kernel-build \
+      --url="${FDO_HTTP_CACHE_URI:-}https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/kernel-files.tar.zst" \
+      --compression=zstd \
+      --path="${CI_PROJECT_DIR}" \
+      --format=tar \
+)
+
+lava-job-submitter \
 	--farm "${FARM}" \
 	--device-type "${DEVICE_TYPE}" \
 	--boot-method "${BOOT_METHOD}" \
@@ -75,9 +79,8 @@ PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
 	--pipeline-info "$CI_JOB_NAME: $CI_PIPELINE_URL on $CI_COMMIT_REF_NAME ${CI_NODE_INDEX}/${CI_NODE_TOTAL}" \
 	--rootfs-url "${ROOTFS_URL}" \
 	--kernel-url-prefix "https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}" \
-	--kernel-external "${EXTERNAL_KERNEL_TAG}" \
-	--first-stage-init artifacts/ci-common/init-stage1.sh \
 	--dtb-filename "${DTB}" \
+	--env-file dut-env-vars.sh \
 	--jwt-file "${S3_JWT_FILE}" \
 	--kernel-image-name "${KERNEL_IMAGE_NAME}" \
 	--kernel-image-type "${KERNEL_IMAGE_TYPE}" \
@@ -86,20 +89,10 @@ PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
 	--mesa-job-name "$CI_JOB_NAME" \
 	--structured-log-file "results/lava_job_detail.json" \
 	--ssh-client-image "${LAVA_SSH_CLIENT_IMAGE}" \
+	--project-dir "${CI_PROJECT_DIR}" \
 	--project-name "${CI_PROJECT_NAME}" \
-	--starting-section "${CURRENT_SECTION}" \
+	--starting-section lava_submit \
 	--job-submitted-at "${CI_JOB_STARTED_AT}" \
-	- append-overlay \
-		--name=kernel-build \
-		--url="${FDO_HTTP_CACHE_URI:-}https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/kernel-files.tar.zst" \
-		--compression=zstd \
-		--path="${CI_PROJECT_DIR}" \
-		--format=tar \
-	- append-overlay \
-		--name=job-overlay \
-		--url="https://${JOB_ROOTFS_OVERLAY_PATH}" \
-		--compression=gz \
-		--path="/" \
-		--format=tar \
+	"${LAVA_EXTRA_OVERLAYS[@]}" \
 	- submit \
 	>> results/lava.log
diff --git a/drivers/gpu/drm/ci/static-checks.yml b/drivers/gpu/drm/ci/static-checks.yml
index 13ffa827b7fa..712d3efe99c6 100644
--- a/drivers/gpu/drm/ci/static-checks.yml
+++ b/drivers/gpu/drm/ci/static-checks.yml
@@ -1,4 +1,5 @@
 check-patch:
+  stage: static-checks
   extends:
     - .build
     - .use-debian/x86_64_build
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index af094153d987..c314926e3693 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -7,13 +7,16 @@
 
 .lava-test:
   extends:
-    - .container+build-rules
+    - .build-rules
     - .allow_failure_lockdep
   timeout: "1h30m"
   rules:
     - !reference [.scheduled_pipeline-rules, rules]
     - !reference [.collabora-farm-rules, rules]
     - when: on_success
+  before_script:
+    #  lava-submit.sh is a part of the archive, unlike Mesa CI
+    - eval "$S3_JWT_FILE_SCRIPT"
   script:
     # Note: Build dir (and thus install) may be dirty due to GIT_STRATEGY
     - rm -rf install
@@ -32,9 +35,7 @@
   dependencies:
     - testing:arm32
   needs:
-    - alpine/x86_64_lava_ssh_client
     - debian/arm32_test-gl
-    - python-artifacts
     - testing:arm32
     - igt:arm32
 
@@ -48,9 +49,7 @@
   dependencies:
     - testing:arm64
   needs:
-    - alpine/x86_64_lava_ssh_client
     - debian/arm64_test-gl
-    - python-artifacts
     - testing:arm64
     - igt:arm64
 
@@ -64,37 +63,10 @@
   dependencies:
     - testing:x86_64
   needs:
-    - alpine/x86_64_lava_ssh_client
     - debian/x86_64_test-gl
-    - python-artifacts
     - testing:x86_64
     - igt:x86_64
 
-.baremetal-igt-arm64:
-  extends:
-    - .baremetal-test-arm64-gl
-    - .use-debian/baremetal_arm64_test-gl
-    - .allow_failure_lockdep
-  timeout: "1h30m"
-  rules:
-    - !reference [.scheduled_pipeline-rules, rules]
-    - !reference [.google-freedreno-farm-rules, rules]
-    - when: on_success
-  variables:
-    FDO_CI_CONCURRENT: 10
-    HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
-    S3_ARTIFACT_NAME: "arm64/kernel-files"
-    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/Image.gz
-    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
-    FARM: google
-  needs:
-    - debian/baremetal_arm64_test-gl
-    - job: testing:arm64
-      artifacts: false
-    - igt:arm64
-  tags:
-    - $RUNNER_TAG
-
 .software-driver:
   stage: software-driver
   extends:
@@ -110,6 +82,7 @@
     - !reference [default, before_script]
     - rm -rf install
     - tar -xf artifacts/install.tar
+    - mkdir -p /kernel
   script:
     - ln -sf $CI_PROJECT_DIR/install /install
     - mv install/bzImage /kernel/bzImage
@@ -127,6 +100,7 @@
     DRIVER_NAME: msm
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: qcom-lava
 
 msm:sc7180-trogdor-lazor-limozeen:
   extends:
@@ -148,9 +122,7 @@ msm:sc7180-trogdor-kingoftown:
     GPU_VERSION: ${DEVICE_TYPE}
     RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
 
-msm:apq8016:
-  extends:
-    - .baremetal-igt-arm64
+.msm:apq8016:
   stage: msm
   variables:
     DEVICE_TYPE: apq8016-sbc-usb-host
@@ -165,9 +137,7 @@ msm:apq8016:
   script:
     - ./install/bare-metal/fastboot.sh || exit $?
 
-msm:apq8096:
-  extends:
-    - .baremetal-igt-arm64
+.msm:apq8096:
   stage: msm
   variables:
     DEVICE_TYPE: apq8096-db820c
@@ -194,11 +164,14 @@ msm:sm8350-hdk:
     KERNEL_IMAGE_NAME: "Image.gz"
     KERNEL_IMAGE_TYPE: ""
     RUNNER_TAG: mesa-ci-x86-64-lava-sm8350-hdk
+    LAVA_FIRMWARE: qcom-lava
+    LAVA_FASTBOOT_CMD: "set_active a"
 
 .rockchip-device:
   variables:
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
+    LAVA_FIRMWARE: arm
 
 .rockchip-display:
   stage: rockchip
@@ -255,6 +228,7 @@ panfrost:rk3399:
     DTB: ""
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: i915
 
 i915:apl:
   extends:
@@ -337,6 +311,7 @@ i915:jsl:
     DTB: ""
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: amdgpu-lava
 
 amdgpu:stoney:
   extends:
@@ -355,6 +330,7 @@ amdgpu:stoney:
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: arm
 
 .mediatek-display:
   stage: mediatek
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index f44dbce3151a..442d3bc3d90b 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -3,9 +3,10 @@ amdgpu/amd_abm@abm_gradual,Fail
 amdgpu/amd_abm@backlight_monotonic_abm,Fail
 amdgpu/amd_abm@backlight_monotonic_basic,Fail
 amdgpu/amd_abm@dpms_cycle,Fail
-amdgpu/amd_assr@assr-links,Fail
 amdgpu/amd_assr@assr-links-dpms,Fail
-amdgpu/amd_mall@static-screen,Crash
+amdgpu/amd_assr@assr-links,Fail
+amdgpu/amd_basic@cs-gfx-with-IP-GFX,Fail
+amdgpu/amd_basic@cs-multi-fence-with-IP-GFX,Fail
 amdgpu/amd_mode_switch@mode-switch-first-last-pipe-2,Crash
 amdgpu/amd_plane@mpo-pan-nv12,Fail
 amdgpu/amd_plane@mpo-pan-p010,Fail
@@ -13,11 +14,13 @@ amdgpu/amd_plane@mpo-pan-rgb,Crash
 amdgpu/amd_plane@mpo-scale-nv12,Fail
 amdgpu/amd_plane@mpo-scale-p010,Fail
 amdgpu/amd_plane@mpo-scale-rgb,Crash
-amdgpu/amd_plane@mpo-swizzle-toggle,Fail
+amdgpu/amd_plane@mpo-swizzle-toggle,Crash
 amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
+core_setmaster@master-drop-set-user,Fail
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@too-high,Fail
+kms_async_flips@basic-modeset-with-all-modifiers-formats,Crash
 kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
 kms_atomic_transition@plane-all-transition,Fail
 kms_atomic_transition@plane-all-transition-nonblocking,Fail
@@ -33,8 +36,10 @@ kms_cursor_crc@cursor-sliding-64x64,Fail
 kms_cursor_edge_walk@64x64-left-edge,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
+kms_invalid_mode@int-max-clock,Fail
+kms_invalid_mode@overflow-vrefresh,Fail
 kms_lease@lease-uevent,Fail
-kms_plane@pixel-format,Fail
 kms_plane_cursor@primary,Fail
+kms_plane@pixel-format,Fail
 kms_rotation_crc@primary-rotation-180,Fail
 perf@i915-ref-count,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index adffb011298a..8b81af104b30 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -32,3 +32,10 @@ kms_async_flips@async-flip-with-page-flip-events-atomic
 # IGT Version: 1.29-g33adea9eb
 # Linux Version: 6.13.0-rc2
 kms_async_flips@crc-atomic
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://gitlab.freedesktop.org/drm/amd/-/issues/4406
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_async_flips@alternate-sync-async-flip
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
index 8e2b5504004e..ff0c10626004 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
@@ -1,43 +1,18 @@
-core_setmaster_vs_auth,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
-kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
-kms_fb_coherency@memset-crc,Crash
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
-kms_prop_blob@invalid-set-prop-any,Fail
-kms_properties@connector-properties-legacy,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
 kms_universal_plane@disable-primary-vs-flip,Timeout
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
index 7353ab11e940..032f7adeeff2 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
@@ -1,29 +1,9 @@
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_flip@flip-vs-wf_vblank-interruptible,Fail
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index 6fef7c1e56ea..351cb06228ff 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,4 +1,5 @@
-core_setmaster_vs_auth,Fail
+api_intel_bb@intel-bb-blit-none,Timeout
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -8,18 +9,15 @@ i915_pipe_stress@stress-xrgb8888-ytiled,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
 i915_pm_rpm@system-suspend-execbuf,Timeout
-kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
-kms_cursor_crc@cursor-suspend,Timeout
-kms_fb_coherency@memset-crc,Crash
 kms_flip@busy-flip,Timeout
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
@@ -31,39 +29,18 @@ kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_lease@lease-uevent,Fail
-kms_pipe_stress@stress-xrgb8888-untiled,Fail
-kms_pipe_stress@stress-xrgb8888-ytiled,Fail
-kms_plane_alpha_blend@alpha-basic,Fail
-kms_plane_alpha_blend@alpha-opaque-fb,Fail
-kms_plane_alpha_blend@alpha-transparent-fb,Fail
-kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
-kms_prop_blob@invalid-set-prop-any,Fail
-kms_properties@connector-properties-legacy,Timeout
+kms_pm_rpm@basic-rte,Fail
 kms_psr2_sf@cursor-plane-update-sf,Fail
 kms_psr2_sf@overlay-plane-update-continuous-sf,Fail
 kms_psr2_sf@overlay-plane-update-sf-dmg-area,Fail
 kms_psr2_sf@overlay-primary-update-sf-dmg-area,Fail
 kms_psr2_sf@plane-move-sf-dmg-area,Fail
-kms_psr2_sf@primary-plane-update-sf-dmg-area,Fail
 kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb,Fail
-kms_psr2_sf@psr2-cursor-plane-update-sf,Fail
-kms_psr2_sf@psr2-overlay-plane-update-continuous-sf,Fail
-kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area,Fail
-kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area,Fail
-kms_psr2_sf@psr2-plane-move-sf-dmg-area,Fail
-kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area,Fail
-kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb,Fail
-kms_psr2_su@page_flip-NV12,Fail
-kms_psr2_su@page_flip-P010,Fail
-kms_setmode@basic,Fail
-kms_universal_plane@disable-primary-vs-flip,Timeout
+kms_psr2_sf@primary-plane-update-sf-dmg-area,Fail
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
index 5343cc1c8696..5e5b9901a08e 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
@@ -32,3 +32,10 @@ kms_async_flips@crc
 # IGT Version: 1.29-g33adea9eb
 # Linux Version: 6.13.0-rc2
 gen9_exec_parse@unaligned-access
+
+# Board Name: asus-C436FA-Flip-hatch
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14625
+# Failure Rate: 100
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+perf_pmu@most-busy-check-all
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
index 8adf5f0a6e80..5d79b65cd354 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
@@ -4,41 +4,31 @@ i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
+kms_dirtyfb@default-dirtyfb-ioctl,Fail
 kms_dirtyfb@drrs-dirtyfb-ioctl,Fail
+kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
 kms_flip@blocking-wf_vblank,Fail
-kms_flip@wf_vblank-ts-check,Fail
-kms_flip@wf_vblank-ts-check-interruptible,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
+kms_flip@wf_vblank-ts-check,Fail
+kms_flip@wf_vblank-ts-check-interruptible,Fail
+kms_frontbuffer_tracking@fbcdrrs-tiling-linear,Fail
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
 kms_prop_blob@invalid-set-prop-any,Fail
 kms_properties@connector-properties-legacy,Timeout
 kms_rotation_crc@multiplane-rotation,Fail
-kms_rotation_crc@multiplane-rotation-cropping-top,Fail
 kms_universal_plane@disable-primary-vs-flip,Timeout
 perf@non-zero-reason,Timeout
 sysfs_heartbeat_interval@long,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
index 57453e340040..9ad246917598 100644
--- a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
@@ -1,45 +1,24 @@
+core_setmaster@master-drop-set-root,Fail
 drm_fdinfo@busy-check-all,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
+i915_pm_rpm@module-reload,Fail
 kms_flip@dpms-off-confusion,Fail
-kms_flip@nonexisting-fb,Fail
-kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,UnexpectedImprovement(Skip)
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_lease@lease-uevent,Fail
 kms_pm_rpm@modeset-stress-extra-wait,Timeout
-kms_rotation_crc@bad-pixel-format,Fail
 kms_rotation_crc@multiplane-rotation,Fail
-kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
-kms_rotation_crc@multiplane-rotation-cropping-top,Fail
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
-perf_pmu@most-busy-idle-check-all,Fail
 perf_pmu@rc6,Crash
-prime_busy@before-wait,Fail
 sysfs_heartbeat_interval@long,Timeout
 sysfs_heartbeat_interval@off,Timeout
 sysfs_preempt_timeout@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
index 117098bc95d9..f37302331516 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
@@ -1,11 +1,12 @@
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
@@ -17,6 +18,8 @@ perf@i915-ref-count,Fail
 perf_pmu@busy-accuracy-50,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
+prime_busy@after-wait,Fail
+prime_busy@before,Fail
 sysfs_heartbeat_interval@long,Timeout
 sysfs_heartbeat_interval@off,Timeout
 sysfs_preempt_timeout@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
index 462c050a8b2d..102c4b3eef4d 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
@@ -1,14 +1,14 @@
 api_intel_allocator@reopen,Timeout
 api_intel_bb@destroy-bb,Timeout
 core_hotunplug@hotrebind-lateclose,Timeout
+core_setmaster@master-drop-set-user,Fail
+drm_read@short-buffer-block,Timeout
 dumb_buffer@map-valid,Timeout
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
-i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rps@engine-order,Timeout
-i915_pm_rps@waitboost,Fail
 kms_lease@lease-uevent,Fail
 kms_rotation_crc@multiplane-rotation,Fail
 perf@i915-ref-count,Fail
@@ -17,7 +17,6 @@ perf_pmu@enable-race,Timeout
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
 perf_pmu@semaphore-wait-idle,Timeout
-prime_busy@before,Fail
 prime_mmap@test_refcounting,Timeout
 sriov_basic@enable-vfs-bind-unbind-each-numvfs-all,Timeout
 syncobj_basic@illegal-fd-to-handle,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
new file mode 100644
index 000000000000..9738006e3759
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: acer-cp514-2h-1130g7-volteer
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14624
+# Failure Rate: 100
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+perf@gen12-unprivileged-single-ctx-counters
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
index 0f167cfd503c..3bb5496036d8 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
@@ -6,17 +6,17 @@ i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
 i915_pm_rpm@system-suspend-execbuf,Timeout
-kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
-kms_cursor_crc@cursor-suspend,Timeout
+kms_dirtyfb@default-dirtyfb-ioctl,Fail
+kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
 kms_fb_coherency@memset-crc,Crash
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
@@ -26,10 +26,9 @@ kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
@@ -37,8 +36,6 @@ kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
 kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
 kms_prop_blob@invalid-set-prop-any,Fail
 kms_properties@connector-properties-legacy,Timeout
 kms_universal_plane@disable-primary-vs-flip,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index 592d7d69e6fc..31b8a0b27e13 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -1,7 +1,8 @@
+core_setmaster@master-drop-set-root,Fail
+core_setmaster@master-drop-set-shared-fd,Fail
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
-kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
 kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
-kms_bw@connected-linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@connected-linear-tiling-2-displays-1920x1080p,Fail
 kms_bw@connected-linear-tiling-2-displays-2160x1440p,Fail
 kms_bw@connected-linear-tiling-2-displays-2560x1440p,Fail
@@ -14,9 +15,7 @@ kms_bw@linear-tiling-2-displays-1920x1080p,Fail
 kms_bw@linear-tiling-2-displays-2160x1440p,Fail
 kms_bw@linear-tiling-2-displays-2560x1440p,Fail
 kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_color@invalid-gamma-lut-sizes,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic,Fail
-kms_cursor_legacy@cursor-vs-flip-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-atomic,Fail
 kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-toggle,Fail
@@ -24,9 +23,9 @@ kms_cursor_legacy@flip-vs-cursor-varying-size,Fail
 kms_flip@basic-plain-flip,Fail
 kms_flip@dpms-off-confusion,Fail
 kms_flip@dpms-off-confusion-interruptible,Fail
-kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
 kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
 kms_flip@flip-vs-expired-vblank,Fail
 kms_flip@flip-vs-expired-vblank-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
@@ -40,5 +39,4 @@ kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-interruptible,Fail
 kms_flip@plain-flip-ts-check,Fail
 kms_flip@plain-flip-ts-check-interruptible,Fail
-kms_invalid_mode@overflow-vrefresh,Fail
 kms_lease@lease-uevent,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
index 443596d9e662..6f4d41e16e19 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
@@ -53,3 +53,38 @@ kms_bw@connected-linear-tiling-1-displays-2160x1440p
 # IGT Version: 1.30-g04bedb923
 # Linux Version: 6.14.0-rc4
 kms_flip@flip-vs-wf_vblank-interruptible
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/7559dd68-c9dd-410f-880f-201679e2dd54@collabora.com/T/#u
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@blocking-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/953ab66e-9dda-4003-9b98-9e0d81e18a1f@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@busy-flip
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/6ab7f59c-042e-4c7a-baaa-86c7d47ab308@collabora.com/
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-rmfb
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/30b3f8b0-3409-4329-bb60-b6287e1a439d@collabora.com/
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_atomic_transition@plane-all-modeset-transition-internal-panels
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/4c9e1501-52cd-4659-a894-8a2ac58c3996@collabora.com/
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@absolute-wf_vblank
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index ae36a39619c6..2daf4ab879a9 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
@@ -14,8 +15,8 @@ kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_lease@lease-uevent,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index ae36a39619c6..2daf4ab879a9 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
@@ -14,8 +15,8 @@ kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_lease@lease-uevent,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
index 8d26b23133aa..f387c73193c6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
 kms_cursor_legacy@forked-bo,Fail
 kms_cursor_legacy@forked-move,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
index abd1ccb71561..cc5f7fe98dd7 100644
--- a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
@@ -1,2 +1,3 @@
+core_setmaster@master-drop-set-user,Fail
 panfrost/panfrost_prime@gem-prime-import,Fail
 panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
index 8330b934602a..8d0b7682e640 100644
--- a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
@@ -1,2 +1,3 @@
+core_setmaster@master-drop-set-user,Crash
 panfrost/panfrost_prime@gem-prime-import,Crash
 panfrost/panfrost_submit@pan-submit-error-bad-requirements,Crash
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
index abd1ccb71561..cc5f7fe98dd7 100644
--- a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
@@ -1,2 +1,3 @@
+core_setmaster@master-drop-set-user,Fail
 panfrost/panfrost_prime@gem-prime-import,Fail
 panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 61122ea7f008..526f582038d3 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -2,8 +2,17 @@ core_setmaster@master-drop-set-root,Crash
 core_setmaster@master-drop-set-shared-fd,Crash
 core_setmaster@master-drop-set-user,Crash
 core_setmaster_vs_auth,Crash
-dumb_buffer@create-clear,Crash
 fbdev@pan,Crash
-kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
-kms_prop_blob@invalid-set-prop,Crash
+kms_cursor_crc@cursor-dpms,Crash
+kms_cursor_crc@cursor-sliding-32x32,Crash
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Crash
+kms_cursor_legacy@cursor-vs-flip-atomic,Crash
+kms_flip@basic-flip-vs-wf_vblank,Crash
+kms_flip@flip-vs-panning-vs-hang,Crash
+kms_flip@plain-flip-fb-recreate-interruptible,Crash
+kms_pipe_crc_basic@read-crc-frame-sequence,Crash
+kms_plane_cursor@overlay,Crash
+kms_plane_cursor@viewport,Crash
 kms_prop_blob@invalid-set-prop-any,Crash
+kms_prop_blob@invalid-set-prop,Crash
+kms_properties@get_properties-sanity-non-atomic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
index cd0b27d8b636..34f43e95a51b 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
@@ -32,3 +32,24 @@ kms_flip@plain-flip-ts-check
 # IGT Version: 1.28-ga73311079
 # Linux Version: 6.11.0-rc2
 kms_cursor_crc@cursor-alpha-opaque
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report: https://lore.kernel.org/dri-devel/acfd5838-d861-4dd9-97c3-99fffc9bfa04@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-absolute-wf_vblank
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report: https://lore.kernel.org/dri-devel/81e13fcc-d916-4eb8-91cd-f74f64f53f72@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-dpms-on-nop-interruptible
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report: https://lore.kernel.org/dri-devel/10c5abab-c8fe-4eff-8eed-009038436b49@collabora.com/T/#u
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@plain-flip-fb-recreate
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index 45dd8d493f6e..5110ce2dc56e 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -1,9 +1,9 @@
-dumb_buffer@create-clear,Crash
+core_setmaster@master-drop-set-user,Fail
 kms_atomic_transition@modeset-transition,Fail
 kms_atomic_transition@modeset-transition-fencing,Fail
 kms_atomic_transition@plane-toggle-modeset-transition,Fail
-kms_color@gamma,Fail
-kms_color@legacy-gamma,Fail
+kms_cursor_crc@async-cursor-crc-framebuffer-change,Fail
+kms_cursor_crc@async-cursor-crc-position-change,Fail
 kms_cursor_crc@cursor-alpha-opaque,Fail
 kms_cursor_crc@cursor-alpha-transparent,Fail
 kms_cursor_crc@cursor-dpms,Fail
@@ -41,8 +41,11 @@ kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
 kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic,Fail
+kms_flip@basic-flip-vs-dpms,Fail
 kms_flip@basic-flip-vs-wf_vblank,Fail
 kms_flip@blocking-wf_vblank,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning,Fail
 kms_flip@flip-vs-panning-interruptible,Fail
@@ -51,7 +54,6 @@ kms_flip@modeset-vs-vblank-race,Fail
 kms_flip@plain-flip-fb-recreate,Fail
 kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-ts-check,Fail
-kms_flip@plain-flip-ts-check-interruptible,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_invalid_mode@int-max-clock,Fail
 kms_invalid_mode@overflow-vrefresh,Fail
@@ -64,11 +66,11 @@ kms_pipe_crc_basic@nonblocking-crc,Fail
 kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
 kms_pipe_crc_basic@read-crc,Fail
 kms_pipe_crc_basic@read-crc-frame-sequence,Fail
+kms_plane_cursor@primary,Fail
 kms_plane@pixel-format,Fail
 kms_plane@pixel-format-source-clamping,Fail
 kms_plane@plane-panning-bottom-right,Fail
 kms_plane@plane-panning-top-left,Fail
 kms_plane@plane-position-covered,Fail
 kms_plane@plane-position-hole,Fail
-kms_plane_cursor@primary,Fail
 kms_universal_plane@universal-plane-functional,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
index b467991d4094..918dd33c2092 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
@@ -144,3 +144,38 @@ kms_bw@connected-linear-tiling-1-displays-2160x1440p
 # IGT Version: 1.30-g04bedb923
 # Linux Version: 6.14.0-rc4
 kms_bw@linear-tiling-1-displays-3840x2160p
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/7b6e2e3b-2ea2-4cd7-92a5-68d23a63e426@collabora.com/T/#u
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_color@gamma
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/e29c2892-08f2-423f-af72-e4d8b207fd1c@collabora.com/T/#u
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_bw@connected-linear-tiling-1-displays-3840x2160p
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/ad9ce463-c803-4502-ae89-381a6b6eb19f@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_color@legacy-gamma
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/59724e10-12ca-4481-b0e4-72d7b6e4dae0@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@plain-flip-ts-check-interruptible
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/d790db5f-a1ba-47f9-9af0-d3287ef3274c@collabora.com/T/#u
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_bw@linear-tiling-2-displays-3840x2160p
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
index 9749ddb75121..62cb7b94f3fd 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
@@ -2,11 +2,6 @@ kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@size-max,Fail
 kms_addfb_basic@too-high,Fail
-kms_atomic_transition@plane-primary-toggle-with-vblank-wait,Fail
-kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
-kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
-kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
-kms_bw@connected-linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@connected-linear-tiling-10-displays-1920x1080p,Fail
 kms_bw@connected-linear-tiling-10-displays-2160x1440p,Fail
 kms_bw@connected-linear-tiling-10-displays-2560x1440p,Fail
@@ -35,6 +30,10 @@ kms_bw@connected-linear-tiling-16-displays-1920x1080p,Fail
 kms_bw@connected-linear-tiling-16-displays-2160x1440p,Fail
 kms_bw@connected-linear-tiling-16-displays-2560x1440p,Fail
 kms_bw@connected-linear-tiling-16-displays-3840x2160p,Fail
+kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
+kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@connected-linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@connected-linear-tiling-2-displays-1920x1080p,Fail
 kms_bw@connected-linear-tiling-2-displays-2160x1440p,Fail
 kms_bw@connected-linear-tiling-2-displays-2560x1440p,Fail
@@ -67,10 +66,6 @@ kms_bw@connected-linear-tiling-9-displays-1920x1080p,Fail
 kms_bw@connected-linear-tiling-9-displays-2160x1440p,Fail
 kms_bw@connected-linear-tiling-9-displays-2560x1440p,Fail
 kms_bw@connected-linear-tiling-9-displays-3840x2160p,Fail
-kms_bw@linear-tiling-1-displays-1920x1080p,Fail
-kms_bw@linear-tiling-1-displays-2160x1440p,Fail
-kms_bw@linear-tiling-1-displays-2560x1440p,Fail
-kms_bw@linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@linear-tiling-10-displays-1920x1080p,Fail
 kms_bw@linear-tiling-10-displays-2160x1440p,Fail
 kms_bw@linear-tiling-10-displays-2560x1440p,Fail
@@ -99,6 +94,10 @@ kms_bw@linear-tiling-16-displays-1920x1080p,Fail
 kms_bw@linear-tiling-16-displays-2160x1440p,Fail
 kms_bw@linear-tiling-16-displays-2560x1440p,Fail
 kms_bw@linear-tiling-16-displays-3840x2160p,Fail
+kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-2160x1440p,Fail
+kms_bw@linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@linear-tiling-2-displays-1920x1080p,Fail
 kms_bw@linear-tiling-2-displays-2160x1440p,Fail
 kms_bw@linear-tiling-2-displays-2560x1440p,Fail
@@ -131,60 +130,11 @@ kms_bw@linear-tiling-9-displays-1920x1080p,Fail
 kms_bw@linear-tiling-9-displays-2160x1440p,Fail
 kms_bw@linear-tiling-9-displays-2560x1440p,Fail
 kms_bw@linear-tiling-9-displays-3840x2160p,Fail
-kms_flip@absolute-wf_vblank,Fail
-kms_flip@absolute-wf_vblank-interruptible,Fail
-kms_flip@basic-flip-vs-wf_vblank,Fail
-kms_flip@blocking-absolute-wf_vblank,Fail
-kms_flip@blocking-absolute-wf_vblank-interruptible,Fail
-kms_flip@blocking-wf_vblank,Fail
-kms_flip@busy-flip,Fail
-kms_flip@dpms-vs-vblank-race,Fail
-kms_flip@dpms-vs-vblank-race-interruptible,Fail
-kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
-kms_flip@flip-vs-blocking-wf-vblank,Fail
-kms_flip@flip-vs-expired-vblank,Fail
-kms_flip@flip-vs-expired-vblank-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
-kms_flip@flip-vs-wf_vblank-interruptible,Fail
-kms_flip@modeset-vs-vblank-race,Fail
-kms_flip@modeset-vs-vblank-race-interruptible,Fail
-kms_flip@plain-flip-fb-recreate,Fail
-kms_flip@plain-flip-fb-recreate-interruptible,Fail
-kms_flip@plain-flip-ts-check,Fail
-kms_flip@plain-flip-ts-check-interruptible,Fail
-kms_flip@wf_vblank-ts-check,Fail
-kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_invalid_mode@int-max-clock,Fail
 kms_invalid_mode@overflow-vrefresh,Fail
-kms_lease@cursor-implicit-plane,Fail
 kms_lease@lease-uevent,Fail
-kms_lease@page-flip-implicit-plane,Fail
-kms_lease@setcrtc-implicit-plane,Fail
-kms_lease@simple-lease,Fail
-kms_sequence@get-busy,Fail
-kms_sequence@get-forked,Fail
-kms_sequence@get-forked-busy,Fail
-kms_sequence@get-idle,Fail
-kms_sequence@queue-busy,Fail
-kms_sequence@queue-idle,Fail
-kms_setmode@basic,Fail
-kms_vblank@accuracy-idle,Fail
-kms_vblank@crtc-id,Fail
-kms_vblank@invalid,Fail
-kms_vblank@query-busy,Fail
-kms_vblank@query-forked,Fail
-kms_vblank@query-forked-busy,Fail
-kms_vblank@query-idle,Fail
-kms_vblank@ts-continuation-dpms-rpm,Fail
 kms_vblank@ts-continuation-dpms-suspend,Fail
-kms_vblank@ts-continuation-idle,Fail
-kms_vblank@ts-continuation-modeset,Fail
-kms_vblank@ts-continuation-modeset-rpm,Fail
 kms_vblank@ts-continuation-suspend,Fail
-kms_vblank@wait-busy,Fail
-kms_vblank@wait-forked,Fail
-kms_vblank@wait-forked-busy,Fail
-kms_vblank@wait-idle,Fail
 perf@i915-ref-count,Fail
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
index 6ebcc7d89fbd..029bd4956e85 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -16,6 +16,8 @@ kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
 kms_lease@lease-uevent,Fail
+kms_plane@pixel-format-source-clamping,Timeout
+kms_plane@pixel-format,Timeout
 kms_writeback@writeback-check-output,Fail
 kms_writeback@writeback-check-output-XRGB2101010,Fail
 kms_writeback@writeback-fb-id,Fail
-- 
2.47.3

