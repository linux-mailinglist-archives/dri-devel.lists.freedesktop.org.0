Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12687529DBD
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 11:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E81A1121E2;
	Tue, 17 May 2022 09:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAAB1121E2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 09:18:53 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d19so30196303lfj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zLDA8Yac8BUNeY/TEG7PHEyP7wBxLRasZIoQCiv3OnU=;
 b=mZNrloamXbBBs+eEz0EOvtajpTlc55+/9Mhx8lDR06Y3HQsqxg+SMZo+h0RqraTWWq
 jmDxqEfA/nPJ8WnXG0N4b2xhc+zVcWlZpH7VCi/kXiAHU1aC+bKAIoWa45SA8PJXN2o+
 1y48jUOFTnYpcOjf57ajHNhf54HEnXSaBeVHXGnZUbdZ5PmPWKFj+HD4nAaw5A+Hv/YP
 bQCKtUqc8wR9Bnjom1dQOLG/zpR8IVJT7v7xNM+uwK6hrSuog0Cr3iACSjYXsx8ZVZ4a
 lC05UjuNphC78TEc9G+UsR/YWeWvXakN0XeNGhk1gMYgtV1QSzO0ElWkNlxndVLzzez9
 +A+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zLDA8Yac8BUNeY/TEG7PHEyP7wBxLRasZIoQCiv3OnU=;
 b=Dx6KJLSuzWrG65x2S6NaTSorcL42O6xkqO1KjHhy+d9LM0WAksFRuon3MAuJ3hCqeT
 mFeFafAgLbCYPpdtvayL/G+aM5Iw6OLoqCi1cKHULdTCuMO6b79DNmicQGPMai7cd78l
 PV9XvzCBeHW4SVGU4+6k/vuzZttg0SYXRnEUf5WWtJfcuuOkE8EOkfYAfAaBf4qSVd5O
 z+pGlWT9j2Euan56XjK/GxOaqpRlBRl/CQ46+bGxonrmYNX1mZRig+4z9apqlymcMMWm
 8dh9u/MYIKjxGo3uEqQG8vTWJ6cU5phoNGkingXIvlgUZ/kvVoWHSfYdCBMflaJQEB5l
 OfgA==
X-Gm-Message-State: AOAM533L/WnWbxIIuKlfeyVbYLymv/K2T1+krW//Cn3CZ6ycL9PVoSv1
 p2zJb51UaIyJdDOnsKowwoxBkA==
X-Google-Smtp-Source: ABdhPJyAt1bDCMdT5rlmUOIBB7blmhLxGQFM84gh1MTiGDBY1odguv5rgqmivr4TsccY6Z3IzVKqzA==
X-Received: by 2002:a05:6512:22c4:b0:477:b100:98c4 with SMTP id
 g4-20020a05651222c400b00477b10098c4mr44073lfu.172.1652779131268; 
 Tue, 17 May 2022 02:18:51 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3498:7859:4bb:ef69?
 ([2001:861:44c0:66c0:3498:7859:4bb:ef69])
 by smtp.gmail.com with ESMTPSA id
 v16-20020ac25610000000b0047255d211c4sm133310lfd.243.2022.05.17.02.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 02:18:50 -0700 (PDT)
Message-ID: <aac61a66-e9d8-f54b-6f35-da8744a943ba@baylibre.com>
Date: Tue, 17 May 2022 11:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC v4] drm: Add initial ci/ subdirectory
Content-Language: en-US
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie
 <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220511061533.56881-1-tomeu.vizoso@collabora.com>
 <20220517081656.47625-1-tomeu.vizoso@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220517081656.47625-1-tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2022 10:16, Tomeu Vizoso wrote:
> And use it to store expectations about what the DRM drivers are
> supposed to pass in the IGT test suite.
> 
> Also include a configuration file that points to the out-of-tree CI
> scripts.
> 
> By storing the test expectations along the code we can make sure both
> stay in sync with each other, and so we can know when a code change
> breaks those expectations.
> 
> This will allow all contributors to drm to reuse the infrastructure
> already in gitlab.freedesktop.org to test the driver on several
> generations of the hardware.
> 
> v2:
>    - Fix names of result expectation files to match SoC
>    - Don't execute tests that are going to skip on all boards
> 
> v3:
>    - Remove tracking of dmesg output during test execution
> 
> v4:
>    - Move up to drivers/gpu/drm
>    - Add support for a bunch of other drivers
>    - Explain how to incorporate fixes for CI from a
>      ${TARGET_BRANCH}-external-fixes branch
>    - Remove tests that pass from expected results file, to reduce the
>      size of in-tree files
>    - Add docs about how to deal with outages in automated testing labs
>    - Specify the exact SHA of the CI scripts to be used
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>   Documentation/gpu/automated_testing.rst       |  84 +++++++
>   drivers/gpu/drm/ci/amdgpu.testlist            | 130 +++++++++++
>   drivers/gpu/drm/ci/amdgpu_stoney_results.txt  |  17 ++
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  13 ++
>   drivers/gpu/drm/ci/i915.testlist              | 219 ++++++++++++++++++
>   drivers/gpu/drm/ci/i915_amly_results.txt      |   9 +
>   drivers/gpu/drm/ci/i915_apl_results.txt       |   9 +
>   drivers/gpu/drm/ci/i915_cml_results.txt       |  10 +
>   drivers/gpu/drm/ci/i915_glk_results.txt       |  13 ++
>   drivers/gpu/drm/ci/i915_kbl_results.txt       |   9 +
>   drivers/gpu/drm/ci/i915_tgl_results.txt       |  12 +
>   drivers/gpu/drm/ci/i915_whl_results.txt       |   9 +
>   drivers/gpu/drm/ci/mediatek.testlist          | 102 ++++++++
>   .../gpu/drm/ci/mediatek_mt8173_results.txt    |  11 +
>   .../gpu/drm/ci/mediatek_mt8183_results.txt    |  11 +
>   .../gpu/drm/ci/mediatek_mt8192_results.txt    |  11 +
>   drivers/gpu/drm/ci/meson.testlist             |  71 ++++++
>   drivers/gpu/drm/ci/meson_g12b_results.txt     |  11 +
>   drivers/gpu/drm/ci/msm.testlist               | 144 ++++++++++++
>   drivers/gpu/drm/ci/msm_apq8016_results.txt    |  77 ++++++
>   drivers/gpu/drm/ci/msm_apq8096_results.txt    |  76 ++++++
>   drivers/gpu/drm/ci/msm_sc7180_results.txt     |  18 ++
>   drivers/gpu/drm/ci/msm_sdm845_results.txt     |  33 +++
>   drivers/gpu/drm/ci/rockchip.testlist          | 188 +++++++++++++++
>   .../gpu/drm/ci/rockchip_rk3288_results.txt    |  11 +
>   .../gpu/drm/ci/rockchip_rk3399_results.txt    |  14 ++
>   drivers/gpu/drm/ci/virtio_gpu.testlist        |  92 ++++++++
>   drivers/gpu/drm/ci/virtio_gpu_results.txt     |  28 +++
>   28 files changed, 1432 insertions(+)
>   create mode 100644 Documentation/gpu/automated_testing.rst
>   create mode 100644 drivers/gpu/drm/ci/amdgpu.testlist
>   create mode 100644 drivers/gpu/drm/ci/amdgpu_stoney_results.txt
>   create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
>   create mode 100644 drivers/gpu/drm/ci/i915.testlist
>   create mode 100644 drivers/gpu/drm/ci/i915_amly_results.txt
>   create mode 100644 drivers/gpu/drm/ci/i915_apl_results.txt
>   create mode 100644 drivers/gpu/drm/ci/i915_cml_results.txt
>   create mode 100644 drivers/gpu/drm/ci/i915_glk_results.txt
>   create mode 100644 drivers/gpu/drm/ci/i915_kbl_results.txt
>   create mode 100644 drivers/gpu/drm/ci/i915_tgl_results.txt
>   create mode 100644 drivers/gpu/drm/ci/i915_whl_results.txt
>   create mode 100644 drivers/gpu/drm/ci/mediatek.testlist
>   create mode 100644 drivers/gpu/drm/ci/mediatek_mt8173_results.txt
>   create mode 100644 drivers/gpu/drm/ci/mediatek_mt8183_results.txt
>   create mode 100644 drivers/gpu/drm/ci/mediatek_mt8192_results.txt
>   create mode 100644 drivers/gpu/drm/ci/meson.testlist
>   create mode 100644 drivers/gpu/drm/ci/meson_g12b_results.txt
>   create mode 100644 drivers/gpu/drm/ci/msm.testlist
>   create mode 100644 drivers/gpu/drm/ci/msm_apq8016_results.txt
>   create mode 100644 drivers/gpu/drm/ci/msm_apq8096_results.txt
>   create mode 100644 drivers/gpu/drm/ci/msm_sc7180_results.txt
>   create mode 100644 drivers/gpu/drm/ci/msm_sdm845_results.txt
>   create mode 100644 drivers/gpu/drm/ci/rockchip.testlist
>   create mode 100644 drivers/gpu/drm/ci/rockchip_rk3288_results.txt
>   create mode 100644 drivers/gpu/drm/ci/rockchip_rk3399_results.txt
>   create mode 100644 drivers/gpu/drm/ci/virtio_gpu.testlist
>   create mode 100644 drivers/gpu/drm/ci/virtio_gpu_results.txt
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> new file mode 100644
> index 000000000000..61003ecc7b6e
> --- /dev/null
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -0,0 +1,84 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +=========================================
> +Automated testing of the DRM subsystem
> +=========================================
> +
> +
> +Introduction
> +============
> +
> +Making sure that changes to the core or drivers don't introduce regressions can be very time consuming when lots of different hardware configurations need to be tested. Moreover, it isn't practical for each person interested in this testing to have to acquire and maintain what can be a considerable amount of hardware.
> +
> +Also, it is desirable for developers to check for regressions in their code by themselves, instead of relying on the maintainers finding them and then reporting back.
> +
> +There are facilities in gitlab.freedesktop.org to automatically test Mesa that can be used as well for testing the DRM subsystem. This document explains how people interested in testing it can use this shared infrastructure to save quite some time and effort.
> +
> +
> +Relevant files
> +==============
> +
> +drivers/gpu/drm/ci/gitlab-ci.yml
> +--------------------------------
> +
> +Specifies the specific version of the scripts to be used. GitLab CI will use the values defined in this file to fetch the right scripts.
> +
> +
> +drivers/gpu/drm/ci/${DRIVER_NAME}.testlist
> +------------------------------------------
> +
> +Specifies the tests that the current code is expected to be able to reliably run for ${DRIVER_NAME}. These tests are expected to not hang the DUT (Device Under Testing) when running on the revision they belong to, and to give consistent results.
> +
> +
> +drivers/gpu/drm/ci/${DRIVER_NAME}_*_results.txt
> +----------------------------------------
> +
> +Specifies the expected results of running this specific kernel revision on a given hardware configuration.
> +
> +
> +How to enable automated testing on your tree
> +============================================
> +
> +1. Create a Linux tree in https://gitlab.freedesktop.org/ if you don't have one yet
> +
> +2. In your kernel repo's configuration (eg. https://gitlab.freedesktop.org/tomeu/linux/-/settings/ci_cd), change the CI/CD configuration file from .gitlab-ci.yml to drivers/gpu/drm/ci/gitlab-ci.yml.
> +
> +3. Next time you push to this repository, you will see a CI pipeline being created (eg. https://gitlab.freedesktop.org/tomeu/linux/-/pipelines)
> +
> +4. The various jobs will be run and when the pipeline is finished, all jobs should be green unless a regression has been found.
> +
> +
> +How to update test expectations
> +===============================
> +
> +If your changes to the code fix any tests, you will have to update one or more of the files in drivers/gpu/drm/ci/${DRIVER_NAME}_*_results.txt, for each of the test platforms affected by the change.
> +
> +If you have run a pipeline and it failed because of a mismatched test result, you will have been offered a patch at the end of the run that you can apply after reviewing it.
> +
> +
> +How to expand coverage
> +======================
> +
> +If your code changes makes it possible to run more tests (by solving reliability issues, for example), more tests can be added to this list, and then the expected results updated with the patch file that will be printed at the end of each job.
> +
> +If there is a need for updating the version of IGT being used (maybe you have added more tests to it), follow the instructions at https://gitlab.freedesktop.org/gfx-ci/drm-ci/-/tree/main#upreving-igt.
> +
> +
> +How to test your changes to the scripts
> +==========================================
> +
> +For testing changes to the scripts in the drm-ci repo, change the DRM_CI_PROJECT_PATH variable in drivers/gpu/drm/ci/gitlab-ci.yml to match your fork of the project (eg. tomeu/drm-ci). This fork needs to be in https://gitlab.freedesktop.org/.
> +
> +
> +How to incorporate external fixes in your testing
> +=================================================
> +
> +Often, regressions in other trees will prevent testing changes local to the tree under test. These fixes will be automatically merged in during the build jobs from a branch in the target tree that is named as ${TARGET_BRANCH}-external-fixes.
> +
> +If the pipeline is not in a merge request and a branch with the same name exists in the local tree, commits from that branch will be merged in as well.
> +
> +
> +How to deal with automated testing labs that may be down
> +========================================================
> +
> +If a hardware farm is down and thus causing pipelines to fail that would otherwise pass, one can disable all jobs that would be submitted to that farm by editing the file at https://gitlab.freedesktop.org/gfx-ci/lab-status/-/blob/main/lab-status.yml.


[..]

> diff --git a/drivers/gpu/drm/ci/meson.testlist b/drivers/gpu/drm/ci/meson.testlist
> new file mode 100644
> index 000000000000..23744b3a2fb0
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/meson.testlist
> @@ -0,0 +1,71 @@
> +# Keep alphabetically sorted by default
> +
> +igt@core_auth@getclient-simple
> +igt@core_auth@getclient-master-drop
> +igt@core_auth@basic-auth
> +igt@core_auth@many-magics
> +igt@core_getclient
> +igt@core_getstats
> +igt@core_getversion
> +igt@core_setmaster_vs_auth
> +igt@drm_read@invalid-buffer
> +igt@kms_addfb_basic@unused-handle
> +igt@kms_addfb_basic@unused-pitches
> +igt@kms_addfb_basic@unused-offsets
> +igt@kms_addfb_basic@unused-modifier
> +igt@kms_addfb_basic@legacy-format
> +igt@kms_addfb_basic@no-handle
> +igt@kms_addfb_basic@basic
> +igt@kms_addfb_basic@bad-pitch-0
> +igt@kms_addfb_basic@bad-pitch-32
> +igt@kms_addfb_basic@bad-pitch-63
> +igt@kms_addfb_basic@bad-pitch-128
> +igt@kms_addfb_basic@bad-pitch-256
> +igt@kms_addfb_basic@bad-pitch-1024
> +igt@kms_addfb_basic@bad-pitch-999
> +igt@kms_addfb_basic@bad-pitch-65536
> +igt@kms_addfb_basic@size-max
> +igt@kms_addfb_basic@too-wide
> +igt@kms_addfb_basic@too-high
> +igt@kms_addfb_basic@bo-too-small
> +igt@kms_addfb_basic@small-bo
> +igt@kms_addfb_basic@addfb25-modifier-no-flag
> +igt@kms_addfb_basic@addfb25-bad-modifier
> +igt@kms_addfb_basic@invalid-get-prop-any
> +igt@kms_addfb_basic@invalid-get-prop
> +igt@kms_addfb_basic@invalid-set-prop-any
> +igt@kms_addfb_basic@invalid-set-prop
> +igt@kms_addfb_basic@master-rmfb
> +igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
> +igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
> +igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
> +igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
> +igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
> +igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
> +igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
> +igt@kms_content_protection@LIC
> +igt@kms_getfb@getfb-handle-zero
> +igt@kms_getfb@getfb-handle-valid
> +igt@kms_getfb@getfb-handle-closed
> +igt@kms_getfb@getfb-handle-not-fb
> +igt@kms_getfb@getfb-addfb-different-handles
> +igt@kms_getfb@getfb-repeated-different-handles
> +igt@kms_getfb@getfb2-handle-zero
> +igt@kms_getfb@getfb2-handle-closed
> +igt@kms_getfb@getfb2-handle-not-fb
> +igt@kms_getfb@getfb2-into-addfb2
> +igt@kms_getfb@getfb-handle-protection
> +igt@kms_getfb@getfb2-handle-protection
> +igt@kms_hdmi_inject@inject-4k
> +igt@kms_prop_blob@basic
> +igt@kms_prop_blob@blob-prop-core
> +igt@kms_prop_blob@blob-prop-validate
> +igt@kms_prop_blob@blob-prop-lifetime
> +igt@kms_prop_blob@blob-multiple
> +igt@kms_prop_blob@invalid-get-prop-any
> +igt@kms_prop_blob@invalid-get-prop
> +igt@kms_prop_blob@invalid-set-prop-any
> +igt@kms_prop_blob@invalid-set-prop
> +igt@kms_setmode@basic@pipe-a-edp-1
> +igt@kms_setmode@basic@pipe-b-edp-1
> +igt@kms_sysfs_edid_timing
> diff --git a/drivers/gpu/drm/ci/meson_g12b_results.txt b/drivers/gpu/drm/ci/meson_g12b_results.txt
> new file mode 100644
> index 000000000000..6997a75aa1ef
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/meson_g12b_results.txt
> @@ -0,0 +1,11 @@
> +igt@drm_read@invalid-buffer,fail
> +igt@kms_addfb_basic@addfb25-bad-modifier,fail
> +igt@kms_atomic_interruptible@legacy-setmode,skip
> +igt@kms_atomic_interruptible@atomic-setmode,skip
> +igt@kms_atomic_interruptible@legacy-dpms,skip
> +igt@kms_atomic_interruptible@legacy-pageflip,skip
> +igt@kms_atomic_interruptible@legacy-cursor,skip
> +igt@kms_atomic_interruptible@universal-setplane-primary,skip
> +igt@kms_atomic_interruptible@universal-setplane-cursor,skip
> +igt@kms_content_protection@lic,skip
> +igt@kms_setmode@basic,skip

Can't those be removed from testlist instead ?
I suppose those should not skip, right ?

Anyway, this is great, please take my
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
for stuff related to the meson driver.

Neil

[..]
