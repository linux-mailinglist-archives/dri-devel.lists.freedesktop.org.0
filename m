Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23557529C18
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 10:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240F8112F42;
	Tue, 17 May 2022 08:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C19112F42
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 08:17:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t6so23629106wra.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 01:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/P2ql3DnCqHYhdB6jkHTAa5UBBStedB7icXL+Ta+W0s=;
 b=LqJYZ0iEnsJQigfmSyYa87FIoF8X0q2fKIozV3D//DgYdDiuUBuQvVVM8Xr9RF3YCW
 ezvvUTCqNEtXEtsMw+m0u9V/r/trXOS/1TPzW1xjwAFErWVlTyPZcecBDcUr4SGYbsUj
 d805R4Uek4A7YGF5C42wPVlOWjFFcQD40WasVllVJvO44M+YTv0NFmRnWNaKdoKSjgBB
 AwRnA+w4g1/ifUsB/Cz3gYBj6/DLsFoam4lw2ECcVqGugNm4G3jrjgFkgwKvLYFk9God
 AsO+vWz8GujfbxNxkQ/8MRjBhk1hasCjvWG2+KZCXojTos80Epn1dQ9P1UUEPZcb8n0d
 flAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/P2ql3DnCqHYhdB6jkHTAa5UBBStedB7icXL+Ta+W0s=;
 b=iAtE3YUDPhxTMNqjyTv6e1IlBqxP9DmZm03HnLW+21i4F57dP+3w7wz8wy+4QNMl4d
 J82AihE1fp9Ts2+OaBjeOndDCfOZHvSjVtTObfmuObMp/QI96f9j9UtiLZ7fgQs58O2k
 /hQiVTzCIVGjgAakSjy94l4p70hfPGqh9m2G4+ed75hloHlMNCerUPhlMchX0L8XdCKP
 XEYAlnawe48C8P7mcIz/tyVi/3Na+aLakrr84s8n+picsYZW4+STikafOI690iThvj8n
 ccROAX52nGKYoSm6HKITnex5YPk6Yn2JQoNLUKVqcjZZGaO3nq+BaX1HZwHOAXBxtna+
 kkUA==
X-Gm-Message-State: AOAM5314dv9Z3grxPeJTAbzUvv7xKBq9Z4V5rR32DevZaj+RP7J3ZQq1
 Nf4855197QhOylO6Aqt+690=
X-Google-Smtp-Source: ABdhPJw4mBE6IF2ymjEOcZ5xuF5Xi3Lju5Kuo8K2zaPd2JVUaszxWUnlM5qw8jHddOa41f4S2QztFw==
X-Received: by 2002:a5d:5984:0:b0:20c:7de2:5416 with SMTP id
 n4-20020a5d5984000000b0020c7de25416mr17166232wri.30.1652775430000; 
 Tue, 17 May 2022 01:17:10 -0700 (PDT)
Received: from cizrna.home (cst-prg-46-129.cust.vodafone.cz. [46.135.46.129])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adfbb05000000b0020d00174eabsm8219172wrg.94.2022.05.17.01.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 01:17:09 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RFC v4] drm: Add initial ci/ subdirectory
Date: Tue, 17 May 2022 10:16:54 +0200
Message-Id: <20220517081656.47625-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220511061533.56881-1-tomeu.vizoso@collabora.com>
References: <20220511061533.56881-1-tomeu.vizoso@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

And use it to store expectations about what the DRM drivers are
supposed to pass in the IGT test suite.

Also include a configuration file that points to the out-of-tree CI
scripts.

By storing the test expectations along the code we can make sure both
stay in sync with each other, and so we can know when a code change
breaks those expectations.

This will allow all contributors to drm to reuse the infrastructure
already in gitlab.freedesktop.org to test the driver on several
generations of the hardware.

v2:
  - Fix names of result expectation files to match SoC
  - Don't execute tests that are going to skip on all boards

v3:
  - Remove tracking of dmesg output during test execution

v4:
  - Move up to drivers/gpu/drm
  - Add support for a bunch of other drivers
  - Explain how to incorporate fixes for CI from a
    ${TARGET_BRANCH}-external-fixes branch
  - Remove tests that pass from expected results file, to reduce the
    size of in-tree files
  - Add docs about how to deal with outages in automated testing labs
  - Specify the exact SHA of the CI scripts to be used

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 Documentation/gpu/automated_testing.rst       |  84 +++++++
 drivers/gpu/drm/ci/amdgpu.testlist            | 130 +++++++++++
 drivers/gpu/drm/ci/amdgpu_stoney_results.txt  |  17 ++
 drivers/gpu/drm/ci/gitlab-ci.yml              |  13 ++
 drivers/gpu/drm/ci/i915.testlist              | 219 ++++++++++++++++++
 drivers/gpu/drm/ci/i915_amly_results.txt      |   9 +
 drivers/gpu/drm/ci/i915_apl_results.txt       |   9 +
 drivers/gpu/drm/ci/i915_cml_results.txt       |  10 +
 drivers/gpu/drm/ci/i915_glk_results.txt       |  13 ++
 drivers/gpu/drm/ci/i915_kbl_results.txt       |   9 +
 drivers/gpu/drm/ci/i915_tgl_results.txt       |  12 +
 drivers/gpu/drm/ci/i915_whl_results.txt       |   9 +
 drivers/gpu/drm/ci/mediatek.testlist          | 102 ++++++++
 .../gpu/drm/ci/mediatek_mt8173_results.txt    |  11 +
 .../gpu/drm/ci/mediatek_mt8183_results.txt    |  11 +
 .../gpu/drm/ci/mediatek_mt8192_results.txt    |  11 +
 drivers/gpu/drm/ci/meson.testlist             |  71 ++++++
 drivers/gpu/drm/ci/meson_g12b_results.txt     |  11 +
 drivers/gpu/drm/ci/msm.testlist               | 144 ++++++++++++
 drivers/gpu/drm/ci/msm_apq8016_results.txt    |  77 ++++++
 drivers/gpu/drm/ci/msm_apq8096_results.txt    |  76 ++++++
 drivers/gpu/drm/ci/msm_sc7180_results.txt     |  18 ++
 drivers/gpu/drm/ci/msm_sdm845_results.txt     |  33 +++
 drivers/gpu/drm/ci/rockchip.testlist          | 188 +++++++++++++++
 .../gpu/drm/ci/rockchip_rk3288_results.txt    |  11 +
 .../gpu/drm/ci/rockchip_rk3399_results.txt    |  14 ++
 drivers/gpu/drm/ci/virtio_gpu.testlist        |  92 ++++++++
 drivers/gpu/drm/ci/virtio_gpu_results.txt     |  28 +++
 28 files changed, 1432 insertions(+)
 create mode 100644 Documentation/gpu/automated_testing.rst
 create mode 100644 drivers/gpu/drm/ci/amdgpu.testlist
 create mode 100644 drivers/gpu/drm/ci/amdgpu_stoney_results.txt
 create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
 create mode 100644 drivers/gpu/drm/ci/i915.testlist
 create mode 100644 drivers/gpu/drm/ci/i915_amly_results.txt
 create mode 100644 drivers/gpu/drm/ci/i915_apl_results.txt
 create mode 100644 drivers/gpu/drm/ci/i915_cml_results.txt
 create mode 100644 drivers/gpu/drm/ci/i915_glk_results.txt
 create mode 100644 drivers/gpu/drm/ci/i915_kbl_results.txt
 create mode 100644 drivers/gpu/drm/ci/i915_tgl_results.txt
 create mode 100644 drivers/gpu/drm/ci/i915_whl_results.txt
 create mode 100644 drivers/gpu/drm/ci/mediatek.testlist
 create mode 100644 drivers/gpu/drm/ci/mediatek_mt8173_results.txt
 create mode 100644 drivers/gpu/drm/ci/mediatek_mt8183_results.txt
 create mode 100644 drivers/gpu/drm/ci/mediatek_mt8192_results.txt
 create mode 100644 drivers/gpu/drm/ci/meson.testlist
 create mode 100644 drivers/gpu/drm/ci/meson_g12b_results.txt
 create mode 100644 drivers/gpu/drm/ci/msm.testlist
 create mode 100644 drivers/gpu/drm/ci/msm_apq8016_results.txt
 create mode 100644 drivers/gpu/drm/ci/msm_apq8096_results.txt
 create mode 100644 drivers/gpu/drm/ci/msm_sc7180_results.txt
 create mode 100644 drivers/gpu/drm/ci/msm_sdm845_results.txt
 create mode 100644 drivers/gpu/drm/ci/rockchip.testlist
 create mode 100644 drivers/gpu/drm/ci/rockchip_rk3288_results.txt
 create mode 100644 drivers/gpu/drm/ci/rockchip_rk3399_results.txt
 create mode 100644 drivers/gpu/drm/ci/virtio_gpu.testlist
 create mode 100644 drivers/gpu/drm/ci/virtio_gpu_results.txt

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
new file mode 100644
index 000000000000..61003ecc7b6e
--- /dev/null
+++ b/Documentation/gpu/automated_testing.rst
@@ -0,0 +1,84 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=========================================
+Automated testing of the DRM subsystem
+=========================================
+
+
+Introduction
+============
+
+Making sure that changes to the core or drivers don't introduce regressions can be very time consuming when lots of different hardware configurations need to be tested. Moreover, it isn't practical for each person interested in this testing to have to acquire and maintain what can be a considerable amount of hardware.
+
+Also, it is desirable for developers to check for regressions in their code by themselves, instead of relying on the maintainers finding them and then reporting back.
+
+There are facilities in gitlab.freedesktop.org to automatically test Mesa that can be used as well for testing the DRM subsystem. This document explains how people interested in testing it can use this shared infrastructure to save quite some time and effort.
+
+
+Relevant files
+==============
+
+drivers/gpu/drm/ci/gitlab-ci.yml
+--------------------------------
+
+Specifies the specific version of the scripts to be used. GitLab CI will use the values defined in this file to fetch the right scripts.
+
+
+drivers/gpu/drm/ci/${DRIVER_NAME}.testlist
+------------------------------------------
+
+Specifies the tests that the current code is expected to be able to reliably run for ${DRIVER_NAME}. These tests are expected to not hang the DUT (Device Under Testing) when running on the revision they belong to, and to give consistent results.
+
+
+drivers/gpu/drm/ci/${DRIVER_NAME}_*_results.txt
+----------------------------------------
+
+Specifies the expected results of running this specific kernel revision on a given hardware configuration.
+
+
+How to enable automated testing on your tree
+============================================
+
+1. Create a Linux tree in https://gitlab.freedesktop.org/ if you don't have one yet
+
+2. In your kernel repo's configuration (eg. https://gitlab.freedesktop.org/tomeu/linux/-/settings/ci_cd), change the CI/CD configuration file from .gitlab-ci.yml to drivers/gpu/drm/ci/gitlab-ci.yml.
+
+3. Next time you push to this repository, you will see a CI pipeline being created (eg. https://gitlab.freedesktop.org/tomeu/linux/-/pipelines)
+
+4. The various jobs will be run and when the pipeline is finished, all jobs should be green unless a regression has been found.
+
+
+How to update test expectations
+===============================
+
+If your changes to the code fix any tests, you will have to update one or more of the files in drivers/gpu/drm/ci/${DRIVER_NAME}_*_results.txt, for each of the test platforms affected by the change.
+
+If you have run a pipeline and it failed because of a mismatched test result, you will have been offered a patch at the end of the run that you can apply after reviewing it.
+
+
+How to expand coverage
+======================
+
+If your code changes makes it possible to run more tests (by solving reliability issues, for example), more tests can be added to this list, and then the expected results updated with the patch file that will be printed at the end of each job.
+
+If there is a need for updating the version of IGT being used (maybe you have added more tests to it), follow the instructions at https://gitlab.freedesktop.org/gfx-ci/drm-ci/-/tree/main#upreving-igt.
+
+
+How to test your changes to the scripts
+==========================================
+
+For testing changes to the scripts in the drm-ci repo, change the DRM_CI_PROJECT_PATH variable in drivers/gpu/drm/ci/gitlab-ci.yml to match your fork of the project (eg. tomeu/drm-ci). This fork needs to be in https://gitlab.freedesktop.org/.
+
+
+How to incorporate external fixes in your testing
+=================================================
+
+Often, regressions in other trees will prevent testing changes local to the tree under test. These fixes will be automatically merged in during the build jobs from a branch in the target tree that is named as ${TARGET_BRANCH}-external-fixes.
+
+If the pipeline is not in a merge request and a branch with the same name exists in the local tree, commits from that branch will be merged in as well.
+
+
+How to deal with automated testing labs that may be down
+========================================================
+
+If a hardware farm is down and thus causing pipelines to fail that would otherwise pass, one can disable all jobs that would be submitted to that farm by editing the file at https://gitlab.freedesktop.org/gfx-ci/lab-status/-/blob/main/lab-status.yml.
diff --git a/drivers/gpu/drm/ci/amdgpu.testlist b/drivers/gpu/drm/ci/amdgpu.testlist
new file mode 100644
index 000000000000..c311ad590e2f
--- /dev/null
+++ b/drivers/gpu/drm/ci/amdgpu.testlist
@@ -0,0 +1,130 @@
+# Keep alphabetically sorted by default
+
+igt@core_auth@getclient-simple
+igt@core_auth@getclient-master-drop
+igt@core_auth@basic-auth
+igt@core_auth@many-magics
+igt@core_getclient
+igt@core_getstats
+igt@core_getversion
+igt@core_setmaster_vs_auth
+igt@drm_read@invalid-buffer
+igt@drm_read@fault-buffer
+igt@drm_read@empty-block
+igt@drm_read@empty-nonblock
+igt@drm_read@short-buffer-block
+igt@drm_read@short-buffer-nonblock
+igt@drm_read@short-buffer-wakeup
+igt@kms_addfb_basic@legacy-format
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@master-rmfb
+igt@kms_atomic@plane-primary-legacy
+igt@kms_atomic@plane-immutable-zpos
+igt@kms_atomic@test-only
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@atomic-invalid-params
+igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
+igt@kms_content_protection@LIC
+igt@kms_flip_event_leak
+igt@kms_getfb@getfb-handle-zero
+igt@kms_getfb@getfb-handle-valid
+igt@kms_getfb@getfb-handle-closed
+igt@kms_getfb@getfb-handle-not-fb
+igt@kms_getfb@getfb-addfb-different-handles
+igt@kms_getfb@getfb-repeated-different-handles
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection
+igt@kms_getfb@getfb2-handle-protection
+igt@kms_hdr@bpc-switch
+igt@kms_hdr@bpc-switch-dpms
+igt@kms_pipe_crc_basic@bad-source
+igt@kms_pipe_crc_basic@read-crc-pipe-a
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
+igt@kms_pipe_crc_basic@read-crc-pipe-b
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
+igt@kms_plane_lowres@pipe-a-tiling-none
+igt@kms_plane_lowres@pipe-b-tiling-none
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_rmfb@rmfb-ioctl
+igt@kms_rmfb@close-fd
+
+# Flaky on Stoney
+# [drm] REG_WAIT timeout 10us * 3500 tries - dce_mi_free_dmif line:782
+# igt@kms_rotation_crc@primary-rotation-180
+
+
+# Get a warning some times on Stoney
+# igt@kms_setmode@basic@pipe-a-edp-1
+# igt@kms_setmode@basic@pipe-b-edp-1
+
+igt@kms_sysfs_edid_timing
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
+igt@kms_vblank@invalid
+igt@kms_vblank@crtc-id
+igt@kms_vblank@pipe-a-query-idle
+igt@kms_vblank@pipe-a-query-forked
+igt@kms_vblank@pipe-a-query-busy
+igt@kms_vblank@pipe-a-query-forked-busy
+igt@kms_vblank@pipe-a-wait-idle
+igt@kms_vblank@pipe-a-wait-forked
+igt@kms_vblank@pipe-a-wait-busy
+igt@kms_vblank@pipe-a-wait-forked-busy
+igt@kms_vblank@pipe-a-ts-continuation-idle
+igt@kms_vblank@pipe-a-ts-continuation-modeset
+igt@kms_vblank@pipe-b-accuracy-idle
+igt@kms_vblank@pipe-b-query-idle
+igt@kms_vblank@pipe-b-query-forked
+igt@kms_vblank@pipe-b-query-busy
+igt@kms_vblank@pipe-b-query-forked-busy
+igt@kms_vblank@pipe-b-wait-idle
+igt@kms_vblank@pipe-b-wait-forked
+igt@kms_vblank@pipe-b-wait-busy
+igt@kms_vblank@pipe-b-wait-forked-busy
+igt@kms_vblank@pipe-b-ts-continuation-idle
+igt@kms_vblank@pipe-b-ts-continuation-modeset
diff --git a/drivers/gpu/drm/ci/amdgpu_stoney_results.txt b/drivers/gpu/drm/ci/amdgpu_stoney_results.txt
new file mode 100644
index 000000000000..8f9fb6201011
--- /dev/null
+++ b/drivers/gpu/drm/ci/amdgpu_stoney_results.txt
@@ -0,0 +1,17 @@
+igt@kms_addfb_basic@bad-pitch-65536,fail
+igt@kms_addfb_basic@too-high,fail
+igt@kms_addfb_basic@bo-too-small,fail
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_hdr@bpc-switch@bpc-switch-edp-1-pipe-a,skip
+igt@kms_hdr@bpc-switch-dpms@bpc-switch-dpms-edp-1-pipe-a,skip
+igt@kms_plane_lowres@pipe-a-tiling-none,incomplete
+igt@kms_plane_lowres@pipe-b-tiling-none,incomplete
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,fail
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,fail
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
new file mode 100644
index 000000000000..e7464d8d442e
--- /dev/null
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -0,0 +1,13 @@
+variables:
+  # Change this to use your fork of drm-ci
+  DRM_CI_PROJECT_PATH: &drm-ci-project-path gfx-ci/drm-ci
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 6e01c5e9f0eea910e9fb7ce475cdef6cc719caf3
+
+  UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
+  TARGET_BRANCH: drm-next
+
+include:
+  - project: *drm-ci-project-path
+    ref: *drm-ci-commit-sha
+    file:
+      - '.gitlab-ci.yml'
diff --git a/drivers/gpu/drm/ci/i915.testlist b/drivers/gpu/drm/ci/i915.testlist
new file mode 100644
index 000000000000..92fa28e77f5d
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915.testlist
@@ -0,0 +1,219 @@
+# Keep alphabetically sorted by default
+
+igt@core_auth@getclient-simple
+igt@core_auth@getclient-master-drop
+igt@core_auth@basic-auth
+igt@core_auth@many-magics
+igt@core_getclient
+igt@core_getstats
+igt@core_getversion
+igt@core_setmaster_vs_auth
+igt@drm_read@invalid-buffer
+igt@drm_read@fault-buffer
+igt@drm_read@empty-block
+igt@drm_read@empty-nonblock
+igt@drm_read@short-buffer-block
+igt@drm_read@short-buffer-nonblock
+igt@drm_read@short-buffer-wakeup
+igt@kms_addfb_basic@unused-handle
+igt@kms_addfb_basic@unused-pitches
+igt@kms_addfb_basic@unused-offsets
+igt@kms_addfb_basic@unused-modifier
+igt@kms_addfb_basic@clobberred-modifier
+igt@kms_addfb_basic@legacy-format
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@bo-too-small-due-to-tiling
+igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
+igt@kms_addfb_basic@addfb25-x-tiled-legacy
+igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
+igt@kms_addfb_basic@addfb25-y-tiled-legacy
+igt@kms_addfb_basic@addfb25-yf-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+igt@kms_addfb_basic@addfb25-4-tiled
+igt@kms_addfb_basic@basic-x-tiled-legacy
+igt@kms_addfb_basic@framebuffer-vs-set-tiling
+igt@kms_addfb_basic@tile-pitch-mismatch
+igt@kms_addfb_basic@basic-y-tiled-legacy
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@master-rmfb
+igt@kms_atomic@plane-overlay-legacy
+igt@kms_atomic@plane-primary-legacy
+igt@kms_atomic@plane-immutable-zpos
+igt@kms_atomic@test-only
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@atomic-invalid-params
+igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
+igt@kms_content_protection@LIC
+igt@kms_flip_event_leak
+igt@kms_getfb@getfb-handle-zero
+igt@kms_getfb@getfb-handle-valid
+igt@kms_getfb@getfb-handle-closed
+igt@kms_getfb@getfb-handle-not-fb
+igt@kms_getfb@getfb-addfb-different-handles
+igt@kms_getfb@getfb-repeated-different-handles
+igt@kms_getfb@getfb-reject-ccs
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-accept-ccs
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection
+igt@kms_getfb@getfb2-handle-protection
+igt@kms_hdmi_inject@inject-4k
+igt@kms_hdr@bpc-switch
+igt@kms_hdr@bpc-switch-dpms
+igt@kms_pipe_crc_basic@bad-source
+igt@kms_pipe_crc_basic@read-crc-pipe-a
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
+igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
+igt@kms_pipe_crc_basic@read-crc-pipe-b
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
+igt@kms_pipe_crc_basic@hang-read-crc-pipe-b
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
+igt@kms_pipe_crc_basic@read-crc-pipe-c
+igt@kms_pipe_crc_basic@read-crc-pipe-c-frame-sequence
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c
+igt@kms_pipe_crc_basic@hang-read-crc-pipe-c
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_rmfb@rmfb-ioctl
+igt@kms_rmfb@close-fd
+igt@kms_rotation_crc@primary-rotation-90
+igt@kms_rotation_crc@primary-rotation-180
+igt@kms_rotation_crc@primary-rotation-270
+igt@kms_rotation_crc@sprite-rotation-90
+igt@kms_rotation_crc@sprite-rotation-180
+igt@kms_rotation_crc@sprite-rotation-270
+igt@kms_rotation_crc@cursor-rotation-180
+igt@kms_rotation_crc@sprite-rotation-90-pos-100-0
+igt@kms_rotation_crc@bad-pixel-format
+igt@kms_rotation_crc@bad-tiling
+igt@kms_rotation_crc@multiplane-rotation
+igt@kms_rotation_crc@multiplane-rotation-cropping-top
+igt@kms_rotation_crc@multiplane-rotation-cropping-bottom
+igt@kms_rotation_crc@exhaust-fences
+igt@kms_setmode@basic@pipe-b-edp-1
+igt@kms_sysfs_edid_timing
+igt@kms_universal_plane@universal-plane-pipe-a-functional
+igt@kms_universal_plane@universal-plane-pipe-a-sanity
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
+igt@kms_universal_plane@cursor-fb-leak-pipe-a
+igt@kms_universal_plane@universal-plane-gen9-features-pipe-a
+igt@kms_universal_plane@universal-plane-pipe-b-functional
+igt@kms_universal_plane@universal-plane-pipe-b-sanity
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
+igt@kms_universal_plane@cursor-fb-leak-pipe-b
+igt@kms_universal_plane@universal-plane-gen9-features-pipe-b
+igt@kms_universal_plane@universal-plane-pipe-c-functional
+igt@kms_universal_plane@universal-plane-pipe-c-sanity
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-c
+igt@kms_universal_plane@cursor-fb-leak-pipe-c
+igt@kms_universal_plane@universal-plane-gen9-features-pipe-c
+igt@kms_vblank@invalid
+igt@kms_vblank@crtc-id
+igt@kms_vblank@pipe-a-query-idle
+igt@kms_vblank@pipe-a-query-idle-hang
+igt@kms_vblank@pipe-a-query-forked
+igt@kms_vblank@pipe-a-query-forked-hang
+igt@kms_vblank@pipe-a-query-busy
+igt@kms_vblank@pipe-a-query-busy-hang
+igt@kms_vblank@pipe-a-query-forked-busy
+igt@kms_vblank@pipe-a-query-forked-busy-hang
+igt@kms_vblank@pipe-a-wait-idle
+igt@kms_vblank@pipe-a-wait-idle-hang
+igt@kms_vblank@pipe-a-wait-forked
+igt@kms_vblank@pipe-a-wait-forked-hang
+igt@kms_vblank@pipe-a-wait-busy
+igt@kms_vblank@pipe-a-wait-busy-hang
+igt@kms_vblank@pipe-a-wait-forked-busy
+igt@kms_vblank@pipe-a-wait-forked-busy-hang
+igt@kms_vblank@pipe-a-ts-continuation-idle
+igt@kms_vblank@pipe-a-ts-continuation-idle-hang
+igt@kms_vblank@pipe-a-ts-continuation-modeset
+igt@kms_vblank@pipe-a-ts-continuation-modeset-hang
+igt@kms_vblank@pipe-b-accuracy-idle
+igt@kms_vblank@pipe-b-query-idle
+igt@kms_vblank@pipe-b-query-idle-hang
+igt@kms_vblank@pipe-b-query-forked
+igt@kms_vblank@pipe-b-query-forked-hang
+igt@kms_vblank@pipe-b-query-busy
+igt@kms_vblank@pipe-b-query-busy-hang
+igt@kms_vblank@pipe-b-query-forked-busy
+igt@kms_vblank@pipe-b-query-forked-busy-hang
+igt@kms_vblank@pipe-b-wait-idle
+igt@kms_vblank@pipe-b-wait-idle-hang
+igt@kms_vblank@pipe-b-wait-forked
+igt@kms_vblank@pipe-b-wait-forked-hang
+igt@kms_vblank@pipe-b-wait-busy
+igt@kms_vblank@pipe-b-wait-busy-hang
+igt@kms_vblank@pipe-b-wait-forked-busy
+igt@kms_vblank@pipe-b-wait-forked-busy-hang
+igt@kms_vblank@pipe-b-ts-continuation-idle
+igt@kms_vblank@pipe-b-ts-continuation-idle-hang
+igt@kms_vblank@pipe-b-ts-continuation-modeset
+igt@kms_vblank@pipe-b-ts-continuation-modeset-hang
+igt@kms_vblank@pipe-c-accuracy-idle
+igt@kms_vblank@pipe-c-query-idle
+igt@kms_vblank@pipe-c-query-idle-hang
+igt@kms_vblank@pipe-c-query-forked
+igt@kms_vblank@pipe-c-query-forked-hang
+igt@kms_vblank@pipe-c-query-busy
+igt@kms_vblank@pipe-c-query-busy-hang
+igt@kms_vblank@pipe-c-query-forked-busy
+igt@kms_vblank@pipe-c-query-forked-busy-hang
+igt@kms_vblank@pipe-c-wait-idle
+igt@kms_vblank@pipe-c-wait-idle-hang
+igt@kms_vblank@pipe-c-wait-forked
+igt@kms_vblank@pipe-c-wait-forked-hang
+igt@kms_vblank@pipe-c-wait-busy
+igt@kms_vblank@pipe-c-wait-busy-hang
+igt@kms_vblank@pipe-c-wait-forked-busy
+igt@kms_vblank@pipe-c-wait-forked-busy-hang
+igt@kms_vblank@pipe-c-ts-continuation-idle
+igt@kms_vblank@pipe-c-ts-continuation-idle-hang
+igt@kms_vblank@pipe-c-ts-continuation-modeset
+igt@kms_vblank@pipe-c-ts-continuation-modeset-hang
diff --git a/drivers/gpu/drm/ci/i915_amly_results.txt b/drivers/gpu/drm/ci/i915_amly_results.txt
new file mode 100644
index 000000000000..2937755a9901
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915_amly_results.txt
@@ -0,0 +1,9 @@
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_sysfs_edid_timing,fail
diff --git a/drivers/gpu/drm/ci/i915_apl_results.txt b/drivers/gpu/drm/ci/i915_apl_results.txt
new file mode 100644
index 000000000000..2937755a9901
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915_apl_results.txt
@@ -0,0 +1,9 @@
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_sysfs_edid_timing,fail
diff --git a/drivers/gpu/drm/ci/i915_cml_results.txt b/drivers/gpu/drm/ci/i915_cml_results.txt
new file mode 100644
index 000000000000..e19c38f6b154
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915_cml_results.txt
@@ -0,0 +1,10 @@
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_hdmi_inject@inject-4k,skip
+igt@kms_setmode@basic@pipe-b-edp-1,fail
diff --git a/drivers/gpu/drm/ci/i915_glk_results.txt b/drivers/gpu/drm/ci/i915_glk_results.txt
new file mode 100644
index 000000000000..cb5b1ad47183
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915_glk_results.txt
@@ -0,0 +1,13 @@
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_hdmi_inject@inject-4k,skip
+igt@kms_rotation_crc@multiplane-rotation,fail
+igt@kms_rotation_crc@multiplane-rotation-cropping-top,fail
+igt@kms_rotation_crc@multiplane-rotation-cropping-bottom,fail
+igt@kms_setmode@basic@pipe-b-edp-1,fail
diff --git a/drivers/gpu/drm/ci/i915_kbl_results.txt b/drivers/gpu/drm/ci/i915_kbl_results.txt
new file mode 100644
index 000000000000..2937755a9901
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915_kbl_results.txt
@@ -0,0 +1,9 @@
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_sysfs_edid_timing,fail
diff --git a/drivers/gpu/drm/ci/i915_tgl_results.txt b/drivers/gpu/drm/ci/i915_tgl_results.txt
new file mode 100644
index 000000000000..e8b70ddd96c7
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915_tgl_results.txt
@@ -0,0 +1,12 @@
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_rotation_crc@bad-pixel-format,fail
+igt@kms_rotation_crc@multiplane-rotation,fail
+igt@kms_rotation_crc@multiplane-rotation-cropping-top,fail
+igt@kms_rotation_crc@multiplane-rotation-cropping-bottom,fail
diff --git a/drivers/gpu/drm/ci/i915_whl_results.txt b/drivers/gpu/drm/ci/i915_whl_results.txt
new file mode 100644
index 000000000000..2937755a9901
--- /dev/null
+++ b/drivers/gpu/drm/ci/i915_whl_results.txt
@@ -0,0 +1,9 @@
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_sysfs_edid_timing,fail
diff --git a/drivers/gpu/drm/ci/mediatek.testlist b/drivers/gpu/drm/ci/mediatek.testlist
new file mode 100644
index 000000000000..dd1ad1801b0b
--- /dev/null
+++ b/drivers/gpu/drm/ci/mediatek.testlist
@@ -0,0 +1,102 @@
+# Keep alphabetically sorted by default
+
+igt@core_auth@getclient-simple
+igt@core_auth@getclient-master-drop
+igt@core_auth@basic-auth
+igt@core_auth@many-magics
+igt@core_getclient
+igt@core_getstats
+igt@core_getversion
+igt@core_setmaster_vs_auth
+igt@drm_read@invalid-buffer
+igt@drm_read@fault-buffer
+igt@drm_read@empty-block
+igt@drm_read@empty-nonblock
+igt@drm_read@short-buffer-block
+igt@drm_read@short-buffer-nonblock
+igt@drm_read@short-buffer-wakeup
+igt@kms_addfb_basic@unused-handle
+igt@kms_addfb_basic@unused-pitches
+igt@kms_addfb_basic@unused-offsets
+igt@kms_addfb_basic@unused-modifier
+igt@kms_addfb_basic@legacy-format
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@master-rmfb
+igt@kms_atomic@plane-overlay-legacy
+igt@kms_atomic@plane-primary-legacy
+igt@kms_atomic@test-only
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@atomic-invalid-params
+igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
+igt@kms_content_protection@LIC
+igt@kms_flip_event_leak
+igt@kms_getfb@getfb-handle-zero
+igt@kms_getfb@getfb-handle-valid
+igt@kms_getfb@getfb-handle-closed
+igt@kms_getfb@getfb-handle-not-fb
+igt@kms_getfb@getfb-addfb-different-handles
+igt@kms_getfb@getfb-repeated-different-handles
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection
+igt@kms_getfb@getfb2-handle-protection
+
+# Flaky on mt8173
+# igt@kms_hdmi_inject@inject-4k
+
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_rmfb@rmfb-ioctl
+igt@kms_rmfb@close-fd
+igt@kms_setmode@basic@pipe-a-edp-1
+igt@kms_setmode@basic@pipe-b-edp-1
+igt@kms_sysfs_edid_timing
+igt@kms_vblank@invalid
+igt@kms_vblank@crtc-id
+igt@kms_vblank@pipe-a-query-idle
+igt@kms_vblank@pipe-a-query-forked
+igt@kms_vblank@pipe-a-query-busy
+igt@kms_vblank@pipe-a-query-forked-busy
+igt@kms_vblank@pipe-a-wait-idle
+igt@kms_vblank@pipe-a-wait-forked
+igt@kms_vblank@pipe-a-wait-busy
+igt@kms_vblank@pipe-a-wait-forked-busy
+igt@kms_vblank@pipe-a-ts-continuation-idle
+igt@kms_vblank@pipe-a-ts-continuation-modeset
diff --git a/drivers/gpu/drm/ci/mediatek_mt8173_results.txt b/drivers/gpu/drm/ci/mediatek_mt8173_results.txt
new file mode 100644
index 000000000000..74fd881fdd87
--- /dev/null
+++ b/drivers/gpu/drm/ci/mediatek_mt8173_results.txt
@@ -0,0 +1,11 @@
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_rmfb@close-fd,fail
+igt@kms_setmode@basic,skip
diff --git a/drivers/gpu/drm/ci/mediatek_mt8183_results.txt b/drivers/gpu/drm/ci/mediatek_mt8183_results.txt
new file mode 100644
index 000000000000..74fd881fdd87
--- /dev/null
+++ b/drivers/gpu/drm/ci/mediatek_mt8183_results.txt
@@ -0,0 +1,11 @@
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_rmfb@close-fd,fail
+igt@kms_setmode@basic,skip
diff --git a/drivers/gpu/drm/ci/mediatek_mt8192_results.txt b/drivers/gpu/drm/ci/mediatek_mt8192_results.txt
new file mode 100644
index 000000000000..74fd881fdd87
--- /dev/null
+++ b/drivers/gpu/drm/ci/mediatek_mt8192_results.txt
@@ -0,0 +1,11 @@
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_rmfb@close-fd,fail
+igt@kms_setmode@basic,skip
diff --git a/drivers/gpu/drm/ci/meson.testlist b/drivers/gpu/drm/ci/meson.testlist
new file mode 100644
index 000000000000..23744b3a2fb0
--- /dev/null
+++ b/drivers/gpu/drm/ci/meson.testlist
@@ -0,0 +1,71 @@
+# Keep alphabetically sorted by default
+
+igt@core_auth@getclient-simple
+igt@core_auth@getclient-master-drop
+igt@core_auth@basic-auth
+igt@core_auth@many-magics
+igt@core_getclient
+igt@core_getstats
+igt@core_getversion
+igt@core_setmaster_vs_auth
+igt@drm_read@invalid-buffer
+igt@kms_addfb_basic@unused-handle
+igt@kms_addfb_basic@unused-pitches
+igt@kms_addfb_basic@unused-offsets
+igt@kms_addfb_basic@unused-modifier
+igt@kms_addfb_basic@legacy-format
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@master-rmfb
+igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
+igt@kms_content_protection@LIC
+igt@kms_getfb@getfb-handle-zero
+igt@kms_getfb@getfb-handle-valid
+igt@kms_getfb@getfb-handle-closed
+igt@kms_getfb@getfb-handle-not-fb
+igt@kms_getfb@getfb-addfb-different-handles
+igt@kms_getfb@getfb-repeated-different-handles
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection
+igt@kms_getfb@getfb2-handle-protection
+igt@kms_hdmi_inject@inject-4k
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_setmode@basic@pipe-a-edp-1
+igt@kms_setmode@basic@pipe-b-edp-1
+igt@kms_sysfs_edid_timing
diff --git a/drivers/gpu/drm/ci/meson_g12b_results.txt b/drivers/gpu/drm/ci/meson_g12b_results.txt
new file mode 100644
index 000000000000..6997a75aa1ef
--- /dev/null
+++ b/drivers/gpu/drm/ci/meson_g12b_results.txt
@@ -0,0 +1,11 @@
+igt@drm_read@invalid-buffer,fail
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_setmode@basic,skip
diff --git a/drivers/gpu/drm/ci/msm.testlist b/drivers/gpu/drm/ci/msm.testlist
new file mode 100644
index 000000000000..568051b1dc91
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm.testlist
@@ -0,0 +1,144 @@
+# Keep alphabetically sorted by default
+
+igt@core_auth@getclient-simple
+igt@core_auth@getclient-master-drop
+igt@core_auth@basic-auth
+igt@core_auth@many-magics
+igt@core_getclient
+igt@core_getstats
+igt@core_getversion
+igt@core_setmaster_vs_auth
+igt@drm_read@invalid-buffer
+igt@drm_read@fault-buffer
+igt@drm_read@empty-block
+igt@drm_read@empty-nonblock
+igt@drm_read@short-buffer-block
+igt@drm_read@short-buffer-nonblock
+igt@drm_read@short-buffer-wakeup
+igt@kms_addfb_basic@unused-handle
+igt@kms_addfb_basic@unused-pitches
+igt@kms_addfb_basic@unused-offsets
+igt@kms_addfb_basic@unused-modifier
+igt@kms_addfb_basic@legacy-format
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@master-rmfb
+igt@kms_atomic@plane-overlay-legacy
+igt@kms_atomic@plane-primary-legacy
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+igt@kms_atomic@plane-immutable-zpos
+igt@kms_atomic@test-only
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@atomic-invalid-params
+igt@kms_atomic@atomic_plane_damage
+igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
+igt@kms_content_protection@LIC
+igt@kms_flip_event_leak
+igt@kms_getfb@getfb-handle-zero
+igt@kms_getfb@getfb-handle-valid
+igt@kms_getfb@getfb-handle-closed
+igt@kms_getfb@getfb-handle-not-fb
+igt@kms_getfb@getfb-addfb-different-handles
+igt@kms_getfb@getfb-repeated-different-handles
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection
+igt@kms_getfb@getfb2-handle-protection
+igt@kms_hdmi_inject@inject-4k
+igt@kms_multipipe_modeset@basic-max-pipe-crc-check
+igt@kms_pipe_crc_basic@bad-source
+igt@kms_pipe_crc_basic@read-crc-pipe-a
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
+igt@kms_pipe_crc_basic@read-crc-pipe-b
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_rmfb@rmfb-ioctl
+igt@kms_rmfb@close-fd
+igt@kms_setmode@basic@pipe-a-edp-1
+igt@kms_setmode@basic@pipe-b-edp-1
+igt@msm_mapping@ring
+igt@msm_mapping@sqefw
+igt@msm_mapping@shadow
+igt@msm_recovery@hangcheck
+igt@msm_recovery@gpu-fault
+igt@msm_recovery@iova-fault
+igt@msm_submit@empty-submit
+igt@msm_submit@invalid-queue-submit
+igt@msm_submit@invalid-flags-submit
+igt@msm_submit@invalid-in-fence-submit
+igt@msm_submit@invalid-duplicate-bo-submit
+igt@msm_submit@invalid-cmd-idx-submit
+igt@msm_submit@invalid-cmd-type-submit
+igt@msm_submit@valid-submit
+igt@kms_sysfs_edid_timing
+igt@kms_universal_plane@universal-plane-pipe-a-functional
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
+igt@kms_vblank@invalid
+igt@kms_vblank@crtc-id
+igt@kms_vblank@pipe-a-query-idle
+igt@kms_vblank@pipe-a-query-forked
+igt@kms_vblank@pipe-a-query-busy
+igt@kms_vblank@pipe-a-query-forked-busy
+igt@kms_vblank@pipe-a-wait-idle
+igt@kms_vblank@pipe-a-wait-forked
+igt@kms_vblank@pipe-a-wait-busy
+igt@kms_vblank@pipe-a-wait-forked-busy
+igt@kms_vblank@pipe-a-ts-continuation-idle
+igt@kms_vblank@pipe-a-ts-continuation-modeset
+igt@kms_vblank@pipe-b-accuracy-idle
+igt@kms_vblank@pipe-b-query-idle
+igt@kms_vblank@pipe-b-query-forked
+igt@kms_vblank@pipe-b-query-busy
+igt@kms_vblank@pipe-b-query-forked-busy
+igt@kms_vblank@pipe-b-wait-idle
+igt@kms_vblank@pipe-b-wait-forked
+igt@kms_vblank@pipe-b-wait-busy
+igt@kms_vblank@pipe-b-wait-forked-busy
+igt@kms_vblank@pipe-b-ts-continuation-idle
+igt@kms_vblank@pipe-b-ts-continuation-modeset
diff --git a/drivers/gpu/drm/ci/msm_apq8016_results.txt b/drivers/gpu/drm/ci/msm_apq8016_results.txt
new file mode 100644
index 000000000000..b9f664b43220
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm_apq8016_results.txt
@@ -0,0 +1,77 @@
+igt@drm_read@invalid-buffer,skip
+igt@drm_read@fault-buffer,skip
+igt@drm_read@empty-block,skip
+igt@drm_read@empty-nonblock,skip
+igt@drm_read@short-buffer-block,skip
+igt@drm_read@short-buffer-nonblock,skip
+igt@drm_read@short-buffer-wakeup,skip
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_atomic@plane-overlay-legacy,skip
+igt@kms_atomic@plane-primary-legacy,skip
+igt@kms_atomic@plane-primary-overlay-mutable-zpos,skip
+igt@kms_atomic@plane-immutable-zpos,skip
+igt@kms_atomic@test-only,skip
+igt@kms_atomic@plane-cursor-legacy,skip
+igt@kms_atomic@plane-invalid-params,skip
+igt@kms_atomic@crtc-invalid-params,skip
+igt@kms_atomic@atomic-invalid-params,skip
+igt@kms_atomic@atomic_plane_damage,skip
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_flip_event_leak,skip
+igt@kms_hdmi_inject@inject-4k,fail
+igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
+igt@kms_pipe_crc_basic@bad-source,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-a,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,skip
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,skip
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
+igt@kms_rmfb@rmfb-ioctl,skip
+igt@kms_rmfb@close-fd,skip
+igt@kms_setmode@basic,skip
+igt@msm_mapping@ring,fail
+igt@msm_mapping@sqefw,skip
+igt@msm_mapping@shadow,skip
+igt@msm_recovery@hangcheck,skip
+igt@msm_recovery@gpu-fault,skip
+igt@msm_recovery@iova-fault,skip
+igt@kms_universal_plane@universal-plane-pipe-a-functional,skip
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,skip
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
+igt@kms_vblank@invalid,skip
+igt@kms_vblank@crtc-id,skip
+igt@kms_vblank@pipe-a-query-idle,skip
+igt@kms_vblank@pipe-a-query-forked,skip
+igt@kms_vblank@pipe-a-query-busy,skip
+igt@kms_vblank@pipe-a-query-forked-busy,skip
+igt@kms_vblank@pipe-a-wait-idle,skip
+igt@kms_vblank@pipe-a-wait-forked,skip
+igt@kms_vblank@pipe-a-wait-busy,skip
+igt@kms_vblank@pipe-a-wait-forked-busy,skip
+igt@kms_vblank@pipe-a-ts-continuation-idle,skip
+igt@kms_vblank@pipe-a-ts-continuation-modeset,skip
+igt@kms_vblank@pipe-b-accuracy-idle,skip
+igt@kms_vblank@pipe-b-query-idle,skip
+igt@kms_vblank@pipe-b-query-forked,skip
+igt@kms_vblank@pipe-b-query-busy,skip
+igt@kms_vblank@pipe-b-query-forked-busy,skip
+igt@kms_vblank@pipe-b-wait-idle,skip
+igt@kms_vblank@pipe-b-wait-forked,skip
+igt@kms_vblank@pipe-b-wait-busy,skip
+igt@kms_vblank@pipe-b-wait-forked-busy,skip
+igt@kms_vblank@pipe-b-ts-continuation-idle,skip
+igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
diff --git a/drivers/gpu/drm/ci/msm_apq8096_results.txt b/drivers/gpu/drm/ci/msm_apq8096_results.txt
new file mode 100644
index 000000000000..c3896d752bb8
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm_apq8096_results.txt
@@ -0,0 +1,76 @@
+igt@drm_read@invalid-buffer,skip
+igt@drm_read@fault-buffer,skip
+igt@drm_read@empty-block,skip
+igt@drm_read@empty-nonblock,skip
+igt@drm_read@short-buffer-block,skip
+igt@drm_read@short-buffer-nonblock,skip
+igt@drm_read@short-buffer-wakeup,skip
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_atomic@plane-overlay-legacy,skip
+igt@kms_atomic@plane-primary-legacy,skip
+igt@kms_atomic@plane-primary-overlay-mutable-zpos,skip
+igt@kms_atomic@plane-immutable-zpos,skip
+igt@kms_atomic@test-only,skip
+igt@kms_atomic@plane-cursor-legacy,skip
+igt@kms_atomic@plane-invalid-params,skip
+igt@kms_atomic@crtc-invalid-params,skip
+igt@kms_atomic@atomic-invalid-params,skip
+igt@kms_atomic@atomic_plane_damage,skip
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_flip_event_leak,skip
+igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
+igt@kms_pipe_crc_basic@bad-source,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-a,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,skip
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,skip
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
+igt@kms_rmfb@rmfb-ioctl,skip
+igt@kms_rmfb@close-fd,skip
+igt@kms_setmode@basic,skip
+igt@msm_mapping@ring,fail
+igt@msm_mapping@sqefw,skip
+igt@msm_mapping@shadow,skip
+igt@msm_recovery@hangcheck,skip
+igt@msm_recovery@gpu-fault,skip
+igt@msm_recovery@iova-fault,skip
+igt@kms_universal_plane@universal-plane-pipe-a-functional,skip
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,skip
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
+igt@kms_vblank@invalid,skip
+igt@kms_vblank@crtc-id,skip
+igt@kms_vblank@pipe-a-query-idle,skip
+igt@kms_vblank@pipe-a-query-forked,skip
+igt@kms_vblank@pipe-a-query-busy,skip
+igt@kms_vblank@pipe-a-query-forked-busy,skip
+igt@kms_vblank@pipe-a-wait-idle,skip
+igt@kms_vblank@pipe-a-wait-forked,skip
+igt@kms_vblank@pipe-a-wait-busy,skip
+igt@kms_vblank@pipe-a-wait-forked-busy,skip
+igt@kms_vblank@pipe-a-ts-continuation-idle,skip
+igt@kms_vblank@pipe-a-ts-continuation-modeset,skip
+igt@kms_vblank@pipe-b-accuracy-idle,skip
+igt@kms_vblank@pipe-b-query-idle,skip
+igt@kms_vblank@pipe-b-query-forked,skip
+igt@kms_vblank@pipe-b-query-busy,skip
+igt@kms_vblank@pipe-b-query-forked-busy,skip
+igt@kms_vblank@pipe-b-wait-idle,skip
+igt@kms_vblank@pipe-b-wait-forked,skip
+igt@kms_vblank@pipe-b-wait-busy,skip
+igt@kms_vblank@pipe-b-wait-forked-busy,skip
+igt@kms_vblank@pipe-b-ts-continuation-idle,skip
+igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
diff --git a/drivers/gpu/drm/ci/msm_sc7180_results.txt b/drivers/gpu/drm/ci/msm_sc7180_results.txt
new file mode 100644
index 000000000000..ca801d6ad2e7
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm_sc7180_results.txt
@@ -0,0 +1,18 @@
+igt@kms_atomic@plane-overlay-legacy,skip
+igt@kms_atomic@plane-primary-overlay-mutable-zpos,skip
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_hdmi_inject@inject-4k,skip
+igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
+igt@kms_rmfb@close-fd,fail
+igt@msm_mapping@ring,fail
+igt@msm_mapping@sqefw,fail
+igt@msm_mapping@shadow,fail
+igt@kms_universal_plane@universal-plane-pipe-a-functional,skip
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,fail
diff --git a/drivers/gpu/drm/ci/msm_sdm845_results.txt b/drivers/gpu/drm/ci/msm_sdm845_results.txt
new file mode 100644
index 000000000000..eaf5fe125fbd
--- /dev/null
+++ b/drivers/gpu/drm/ci/msm_sdm845_results.txt
@@ -0,0 +1,33 @@
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_hdmi_inject@inject-4k,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
+igt@kms_rmfb@close-fd,fail
+igt@kms_setmode@basic,skip
+igt@msm_mapping@ring,fail
+igt@msm_mapping@sqefw,fail
+igt@msm_mapping@shadow,fail
+igt@kms_universal_plane@universal-plane-pipe-a-functional,fail
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
+igt@kms_vblank@pipe-b-accuracy-idle,skip
+igt@kms_vblank@pipe-b-query-idle,skip
+igt@kms_vblank@pipe-b-query-forked,skip
+igt@kms_vblank@pipe-b-query-busy,skip
+igt@kms_vblank@pipe-b-query-forked-busy,skip
+igt@kms_vblank@pipe-b-wait-idle,skip
+igt@kms_vblank@pipe-b-wait-forked,skip
+igt@kms_vblank@pipe-b-wait-busy,skip
+igt@kms_vblank@pipe-b-wait-forked-busy,skip
+igt@kms_vblank@pipe-b-ts-continuation-idle,skip
+igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
diff --git a/drivers/gpu/drm/ci/rockchip.testlist b/drivers/gpu/drm/ci/rockchip.testlist
new file mode 100644
index 000000000000..c261e0677200
--- /dev/null
+++ b/drivers/gpu/drm/ci/rockchip.testlist
@@ -0,0 +1,188 @@
+# Keep alphabetically sorted by default
+
+igt@core_auth@getclient-simple
+igt@core_auth@getclient-master-drop
+igt@core_auth@basic-auth
+igt@core_auth@many-magics
+igt@core_getclient
+igt@core_getstats
+igt@core_getversion
+igt@core_setmaster_vs_auth
+igt@drm_read@invalid-buffer
+igt@drm_read@fault-buffer
+igt@drm_read@empty-block
+igt@drm_read@empty-nonblock
+igt@drm_read@short-buffer-block
+igt@drm_read@short-buffer-nonblock
+igt@drm_read@short-buffer-wakeup
+igt@kms_addfb_basic@unused-handle
+igt@kms_addfb_basic@unused-pitches
+igt@kms_addfb_basic@unused-offsets
+igt@kms_addfb_basic@unused-modifier
+igt@kms_addfb_basic@legacy-format
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@master-rmfb
+igt@kms_atomic@plane-overlay-legacy
+
+# Occasional dmesg-warn on rk3288
+# rockchip-dp ff970000.dp: AUX CH cmd reply timeout!
+# igt@kms_atomic@plane-primary-legacy
+
+
+# Machine hangs on rk3399
+# igt@kms_atomic@plane-immutable-zpos
+
+igt@kms_atomic@test-only
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@atomic-invalid-params
+igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
+igt@kms_content_protection@LIC
+igt@kms_flip_event_leak
+igt@kms_getfb@getfb-handle-zero
+igt@kms_getfb@getfb-handle-valid
+igt@kms_getfb@getfb-handle-closed
+igt@kms_getfb@getfb-handle-not-fb
+igt@kms_getfb@getfb-addfb-different-handles
+igt@kms_getfb@getfb-repeated-different-handles
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection
+igt@kms_getfb@getfb2-handle-protection
+igt@kms_hdmi_inject@inject-4k
+igt@kms_pipe_crc_basic@bad-source
+
+# Machine hangs on rk3399
+# igt@kms_pipe_crc_basic@read-crc-pipe-a
+# igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
+# igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
+# igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
+# igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
+# igt@kms_pipe_crc_basic@read-crc-pipe-b
+# igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence
+# igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
+# igt@kms_pipe_crc_basic@hang-read-crc-pipe-b
+# igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
+# igt@kms_pipe_crc_basic@read-crc-pipe-c
+# igt@kms_pipe_crc_basic@read-crc-pipe-c-frame-sequence
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence
+# igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c
+# igt@kms_pipe_crc_basic@hang-read-crc-pipe-c
+# igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c
+# igt@kms_pipe_crc_basic@read-crc-pipe-d
+# igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence
+# igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d
+# igt@kms_pipe_crc_basic@hang-read-crc-pipe-d
+# igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d
+# igt@kms_pipe_crc_basic@read-crc-pipe-e
+# igt@kms_pipe_crc_basic@read-crc-pipe-e-frame-sequence
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e-frame-sequence
+# igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e
+# igt@kms_pipe_crc_basic@hang-read-crc-pipe-e
+# igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-e
+# igt@kms_pipe_crc_basic@read-crc-pipe-f
+# igt@kms_pipe_crc_basic@read-crc-pipe-f-frame-sequence
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f
+# igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f-frame-sequence
+# igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f
+# igt@kms_pipe_crc_basic@hang-read-crc-pipe-f
+# igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-f
+
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_rmfb@rmfb-ioctl
+igt@kms_rmfb@close-fd
+
+# Machine hangs on rk3399
+# igt@kms_rotation_crc@primary-x-tiled-reflect-x-0
+# igt@kms_rotation_crc@primary-y-tiled-reflect-x-0
+# igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0
+# igt@kms_rotation_crc@primary-4-tiled-reflect-x-0
+# igt@kms_rotation_crc@primary-4-tiled-reflect-x-180
+
+
+# Flaky on rk3399
+# igt@kms_setmode@basic@pipe-a-edp-1
+# igt@kms_setmode@basic@pipe-b-edp-1
+
+igt@kms_sysfs_edid_timing
+igt@kms_universal_plane@universal-plane-pipe-a-functional
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
+
+# Machine hangs on rk3399 after a load of the following:
+# rockchip-dp ff970000.edp: CR Max reached (5,0,0)
+# rockchip-dp ff970000.edp: LT CR failed!
+# rockchip-dp ff970000.edp: eDP link training failed (-5)
+# rockchip-dp ff970000.edp: unable to do link train, ret=-5
+# [drm:analogix_dp_bridge_atomic_enable] *ERROR* dp commit error, ret = -5
+#
+# igt@kms_universal_plane@universal-plane-pipe-b-functional
+
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
+igt@kms_vblank@invalid
+igt@kms_vblank@crtc-id
+igt@kms_vblank@pipe-a-query-idle
+igt@kms_vblank@pipe-a-query-forked
+igt@kms_vblank@pipe-a-query-busy
+igt@kms_vblank@pipe-a-query-forked-busy
+igt@kms_vblank@pipe-a-wait-idle
+igt@kms_vblank@pipe-a-wait-forked
+igt@kms_vblank@pipe-a-wait-busy
+igt@kms_vblank@pipe-a-wait-forked-busy
+igt@kms_vblank@pipe-a-ts-continuation-idle
+igt@kms_vblank@pipe-a-ts-continuation-modeset
+igt@kms_vblank@pipe-b-accuracy-idle
+igt@kms_vblank@pipe-b-query-idle
+igt@kms_vblank@pipe-b-query-forked
+igt@kms_vblank@pipe-b-query-busy
+igt@kms_vblank@pipe-b-query-forked-busy
+igt@kms_vblank@pipe-b-wait-idle
+igt@kms_vblank@pipe-b-wait-forked
+igt@kms_vblank@pipe-b-wait-busy
+igt@kms_vblank@pipe-b-wait-forked-busy
+igt@kms_vblank@pipe-b-ts-continuation-idle
+igt@kms_vblank@pipe-b-ts-continuation-modeset
diff --git a/drivers/gpu/drm/ci/rockchip_rk3288_results.txt b/drivers/gpu/drm/ci/rockchip_rk3288_results.txt
new file mode 100644
index 000000000000..c6bec0324414
--- /dev/null
+++ b/drivers/gpu/drm/ci/rockchip_rk3288_results.txt
@@ -0,0 +1,11 @@
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_hdmi_inject@inject-4k,fail
+igt@kms_rmfb@close-fd,fail
diff --git a/drivers/gpu/drm/ci/rockchip_rk3399_results.txt b/drivers/gpu/drm/ci/rockchip_rk3399_results.txt
new file mode 100644
index 000000000000..c6d9208c2754
--- /dev/null
+++ b/drivers/gpu/drm/ci/rockchip_rk3399_results.txt
@@ -0,0 +1,14 @@
+igt@drm_read@short-buffer-wakeup,fail
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_atomic@plane-overlay-legacy,skip
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_hdmi_inject@inject-4k,skip
+igt@kms_rmfb@close-fd,fail
+igt@kms_universal_plane@universal-plane-pipe-a-functional,skip
diff --git a/drivers/gpu/drm/ci/virtio_gpu.testlist b/drivers/gpu/drm/ci/virtio_gpu.testlist
new file mode 100644
index 000000000000..d0df58d23dae
--- /dev/null
+++ b/drivers/gpu/drm/ci/virtio_gpu.testlist
@@ -0,0 +1,92 @@
+# Keep alphabetically sorted by default
+
+igt@core_auth@getclient-simple
+igt@core_auth@getclient-master-drop
+igt@core_auth@basic-auth
+igt@core_auth@many-magics
+igt@core_getclient
+igt@core_getstats
+igt@core_getversion
+igt@core_setmaster_vs_auth
+igt@kms_addfb_basic@unused-handle
+igt@kms_addfb_basic@unused-pitches
+igt@kms_addfb_basic@unused-offsets
+igt@kms_addfb_basic@unused-modifier
+igt@kms_addfb_basic@legacy-format
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@master-rmfb
+igt@kms_atomic@plane-primary-legacy
+igt@kms_atomic@test-only
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@atomic-invalid-params
+igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
+igt@kms_content_protection@LIC
+igt@kms_flip_event_leak
+igt@kms_getfb@getfb-handle-zero
+igt@kms_getfb@getfb-handle-valid
+igt@kms_getfb@getfb-handle-closed
+igt@kms_getfb@getfb-handle-not-fb
+igt@kms_getfb@getfb-addfb-different-handles
+igt@kms_getfb@getfb-repeated-different-handles
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection
+igt@kms_getfb@getfb2-handle-protection
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_rmfb@rmfb-ioctl
+igt@kms_rmfb@close-fd
+igt@kms_setmode@basic@pipe-a-edp-1
+igt@kms_setmode@basic@pipe-b-edp-1
+igt@kms_sysfs_edid_timing
+igt@kms_vblank@invalid
+igt@kms_vblank@crtc-id
+igt@kms_vblank@pipe-a-query-idle
+igt@kms_vblank@pipe-a-query-forked
+igt@kms_vblank@pipe-a-query-busy
+igt@kms_vblank@pipe-a-query-forked-busy
+igt@kms_vblank@pipe-a-wait-idle
+igt@kms_vblank@pipe-a-wait-forked
+igt@kms_vblank@pipe-a-wait-busy
+igt@kms_vblank@pipe-a-wait-forked-busy
+igt@kms_vblank@pipe-a-ts-continuation-idle
+igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm
+igt@kms_vblank@pipe-a-ts-continuation-modeset
+igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm
diff --git a/drivers/gpu/drm/ci/virtio_gpu_results.txt b/drivers/gpu/drm/ci/virtio_gpu_results.txt
new file mode 100644
index 000000000000..1453f49880dd
--- /dev/null
+++ b/drivers/gpu/drm/ci/virtio_gpu_results.txt
@@ -0,0 +1,28 @@
+igt@kms_addfb_basic@bad-pitch-65536,fail
+igt@kms_addfb_basic@size-max,fail
+igt@kms_addfb_basic@too-high,fail
+igt@kms_addfb_basic@bo-too-small,fail
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_setmode@basic,skip
+igt@kms_vblank@invalid,fail
+igt@kms_vblank@crtc-id,fail
+igt@kms_vblank@pipe-a-query-idle,fail
+igt@kms_vblank@pipe-a-query-forked,fail
+igt@kms_vblank@pipe-a-query-busy,fail
+igt@kms_vblank@pipe-a-query-forked-busy,fail
+igt@kms_vblank@pipe-a-wait-idle,fail
+igt@kms_vblank@pipe-a-wait-forked,fail
+igt@kms_vblank@pipe-a-wait-busy,fail
+igt@kms_vblank@pipe-a-wait-forked-busy,fail
+igt@kms_vblank@pipe-a-ts-continuation-idle,fail
+igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm,fail
+igt@kms_vblank@pipe-a-ts-continuation-modeset,fail
+igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm,fail
-- 
2.31.1

