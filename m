Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF9E60C43A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E80A10E137;
	Tue, 25 Oct 2022 06:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Mon, 24 Oct 2022 22:13:02 UTC
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634A610E011
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 22:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1666649582; x=1698185582;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0cV7u0byH1oznhMhm2wA0Pfvx4bod3Hg47fUJWigOMA=;
 b=IQ/zfmgUKRakwcudg1sJhe1Xa/VtTx9dmSAo3mnR2+y+HaM3Aky9WwDP
 cSsCxOrYhq0lw5gdDrNdKMboZG3vwzXfQWid/N62HFoWHPaJwzdn7ir+U
 8Sqmd+hR9YFPI7rmTIiEKM6eSYx91SMPAqEca9/Yc2Jia7a7nRZIR9cSU 0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Oct 2022 15:06:56 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 15:06:56 -0700
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 24 Oct
 2022 15:06:55 -0700
Message-ID: <b3358afc-fe5b-eea6-2269-b040c1b55441@quicinc.com>
Date: Mon, 24 Oct 2022 15:06:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v9] drm: Add initial ci/ subdirectory
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet
 <corbet@lwn.net>, Carlo Caione <carlo@caione.org>, Kevin Hilman
 <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Clark <robdclark@chromium.org>
References: <20220909141528.5090-1-tomeu.vizoso@collabora.com>
 <20220912072903.14626-1-tomeu.vizoso@collabora.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220912072903.14626-1-tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:01 +0000
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/12/2022 12:29 AM, Tomeu Vizoso wrote:
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
> v5:
>    - Remove unneeded skips from Meson expectations file
>    - Use a more advanced runner that detects flakes automatically
>    - Use a more succint format for the expectations
>    - Run many more tests (and use sharding to finish in time)
>    - Use skip lists to avoid hanging machines
>    - Add some build testing
>    - Build IGT in each pipeline for faster uprevs
>    - List failures in the GitLab UI
> 
> v6:
>    - Rebase on top of latest drm-next
>    - Lower priority of LAVA jobs to not impact Mesa CI as much
>    - Update docs
> 
> v7:
>    - Rebase on top of latest drm-next
> 
> v8:
>    - Move all files specific to testing the kernel into the kernel tree
>      (thus I have dropped the r-bs I had collected so far)
>    - Uprev Gitlab CI infrastructure scripts to the latest from Mesa
>    - Add MAINTAINERS entry
>    - Fix boot on MT8173 by adding some Kconfigs that are now needed
>    - Link to the docs from index.rst and hard-wrap the file
> 
> v9:
>    - Only automatically run the pipelines for merge requests
>    - Switch to zstd for the build artifacts to align with Mesa
>    - Add Qcom USB PHYs to config as they are now =m in the defconfig
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   Documentation/gpu/automated_testing.rst       |  144 +
>   Documentation/gpu/index.rst                   |    1 +
>   MAINTAINERS                                   |    8 +
>   drivers/gpu/drm/ci/arm.config                 |   57 +
>   drivers/gpu/drm/ci/arm64.config               |  179 ++
>   drivers/gpu/drm/ci/build-igt.sh               |   43 +
>   drivers/gpu/drm/ci/build.sh                   |  158 +
>   drivers/gpu/drm/ci/build.yml                  |  110 +
>   drivers/gpu/drm/ci/check-patch.py             |   57 +
>   drivers/gpu/drm/ci/container.yml              |   54 +
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  225 ++
>   drivers/gpu/drm/ci/igt_runner.sh              |   77 +
>   drivers/gpu/drm/ci/image-tags.yml             |   13 +
>   drivers/gpu/drm/ci/lava-submit.sh             |   53 +
>   drivers/gpu/drm/ci/static-checks.yml          |   12 +
>   drivers/gpu/drm/ci/test.yml                   |  322 ++
>   drivers/gpu/drm/ci/testlist.txt               | 2763 +++++++++++++++++
>   drivers/gpu/drm/ci/x86_64.config              |  105 +
>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   19 +
>   .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   15 +
>   .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |    2 +
>   .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |   32 +
>   drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |    2 +
>   drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   29 +
>   drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |    1 +
>   drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |    2 +
>   drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   37 +
>   drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   40 +
>   drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |    2 +
>   drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |    8 +
>   drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   25 +
>   drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |    2 +
>   drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   19 +
>   drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |    5 +
>   drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |    8 +
>   drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   30 +
>   drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |    1 +
>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   29 +
>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   10 +
>   .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |   14 +
>   .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |    5 +
>   .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |    4 +
>   .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   15 +
>   .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |    4 +
>   .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    2 +
>   .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    4 +
>   .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |    2 +
>   .../gpu/drm/ci/xfails/msm-sc7180-fails.txt    |   21 +
>   .../gpu/drm/ci/xfails/msm-sc7180-flakes.txt   |    6 +
>   .../gpu/drm/ci/xfails/msm-sc7180-skips.txt    |   23 +
>   .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   43 +
>   .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   11 +
>   .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |    2 +
>   .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   43 +
>   .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |    2 +
>   .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   49 +
>   .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   29 +
>   .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   20 +
>   .../drm/ci/xfails/rockchip-rk3399-skips.txt   |    5 +
>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   38 +
>   .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |    0
>   .../drm/ci/xfails/virtio_gpu-none-skips.txt   |    6 +
>   62 files changed, 5047 insertions(+)
>   create mode 100644 Documentation/gpu/automated_testing.rst
>   create mode 100644 drivers/gpu/drm/ci/arm.config
>   create mode 100644 drivers/gpu/drm/ci/arm64.config
>   create mode 100644 drivers/gpu/drm/ci/build-igt.sh
>   create mode 100644 drivers/gpu/drm/ci/build.sh
>   create mode 100644 drivers/gpu/drm/ci/build.yml
>   create mode 100755 drivers/gpu/drm/ci/check-patch.py
>   create mode 100644 drivers/gpu/drm/ci/container.yml
>   create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
>   create mode 100755 drivers/gpu/drm/ci/igt_runner.sh
>   create mode 100644 drivers/gpu/drm/ci/image-tags.yml
>   create mode 100755 drivers/gpu/drm/ci/lava-submit.sh
>   create mode 100644 drivers/gpu/drm/ci/static-checks.yml
>   create mode 100644 drivers/gpu/drm/ci/test.yml
>   create mode 100644 drivers/gpu/drm/ci/testlist.txt
>   create mode 100644 drivers/gpu/drm/ci/x86_64.config
>   create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> new file mode 100644
> index 000000000000..1b87b802ac7f
> --- /dev/null
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -0,0 +1,144 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +=========================================
> +Automated testing of the DRM subsystem
> +=========================================
> +
> +Introduction
> +============
> +
> +Making sure that changes to the core or drivers don't introduce regressions can
> +be very time-consuming when lots of different hardware configurations need to
> +be tested. Moreover, it isn't practical for each person interested in this
> +testing to have to acquire and maintain what can be a considerable amount of
> +hardware.
> +
> +Also, it is desirable for developers to check for regressions in their code by
> +themselves, instead of relying on the maintainers to find them and then
> +reporting back.
> +
> +There are facilities in gitlab.freedesktop.org to automatically test Mesa that
> +can be used as well for testing the DRM subsystem. This document explains how
> +people interested in testing it can use this shared infrastructure to save
> +quite some time and effort.
> +
> +
> +Relevant files
> +==============
> +
> +drivers/gpu/drm/ci/gitlab-ci.yml
> +--------------------------------
> +
> +This is the root configuration file for GitLab CI. Among other less interesting
> +bits, it specifies the specific version of the scripts to be used. There are
> +some variables that can be modified to change the behavior of the pipeline:
> +
> +DRM_CI_PROJECT_PATH
> +    Repository that contains the Mesa software infrastructure for CI
> +
> +DRM_CI_COMMIT_SHA
> +    A particular revision to use from that repository
> +
> +UPSTREAM_REPO
> +    URL to git repository containing the target branch
> +
> +TARGET_BRANCH
> +    Branch to which this branch is to be merged into
> +
> +IGT_VERSION
> +    Revision of igt-gpu-tools being used, from
> +    https://gitlab.freedesktop.org/drm/igt-gpu-tools
> +
> +drivers/gpu/drm/ci/testlist.txt
> +-------------------------------
> +
> +IGT tests to be run on all drivers (unless mentioned in a driver's *-skips.txt
> +file, see below).
> +
> +drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-fails.txt
> +----------------------------------------------------------
> +
> +Lists the known failures for a given driver on a specific hardware revision.
> +
> +drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-flakes.txt
> +-----------------------------------------------------------
> +
> +Lists the tests that for a given driver on a specific hardware revision are
> +known to behave unreliably. These tests won't cause a job to fail regardless of
> +the result. They will still be run.
> +
> +drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
> +-----------------------------------------------------------
> +
> +Lists the tests that won't be run for a given driver on a specific hardware
> +revision. These are usually tests that interfere with the running of the test
> +list due to hanging the machine, causing OOM, taking too long, etc.
> +
> +
> +How to enable automated testing on your tree
> +============================================
> +
> +1. Create a Linux tree in https://gitlab.freedesktop.org/ if you don't have one
> +yet
> +
> +2. In your kernel repo's configuration (eg.
> +https://gitlab.freedesktop.org/janedoe/linux/-/settings/ci_cd), change the
> +CI/CD configuration file from .gitlab-ci.yml to
> +drivers/gpu/drm/ci/gitlab-ci.yml.
> +
> +3. Next time you push to this repository, you will see a CI pipeline being
> +created (eg. https://gitlab.freedesktop.org/janedoe/linux/-/pipelines)
> +
> +4. The various jobs will be run and when the pipeline is finished, all jobs
> +should be green unless a regression has been found.
> +
> +
> +How to update test expectations
> +===============================
> +
> +If your changes to the code fix any tests, you will have to remove one or more
> +lines from one or more of the files in
> +drivers/gpu/drm/ci/${DRIVER_NAME}_*_fails.txt, for each of the test platforms
> +affected by the change.
> +
> +
> +How to expand coverage
> +======================
> +
> +If your code changes make it possible to run more tests (by solving reliability
> +issues, for example), you can remove tests from the flakes and/or skips lists,
> +and then the expected results if there are any known failures.
> +
> +If there is a need for updating the version of IGT being used (maybe you have
> +added more tests to it), update the IGT_VERSION variable at the top of the
> +gitlab-ci.yml file.
> +
> +
> +How to test your changes to the scripts
> +=======================================
> +
> +For testing changes to the scripts in the drm-ci repo, change the
> +DRM_CI_PROJECT_PATH and DRM_CI_COMMIT_SHA variables in
> +drivers/gpu/drm/ci/gitlab-ci.yml to match your fork of the project (eg.
> +janedoe/drm-ci). This fork needs to be in https://gitlab.freedesktop.org/.
> +
> +
> +How to incorporate external fixes in your testing
> +=================================================
> +
> +Often, regressions in other trees will prevent testing changes local to the
> +tree under test. These fixes will be automatically merged in during the build
> +jobs from a branch in the target tree that is named as
> +${TARGET_BRANCH}-external-fixes.
> +
> +If the pipeline is not in a merge request and a branch with the same name
> +exists in the local tree, commits from that branch will be merged in as well.
> +
> +
> +How to deal with automated testing labs that may be down
> +========================================================
> +
> +If a hardware farm is down and thus causing pipelines to fail that would
> +otherwise pass, one can disable all jobs that would be submitted to that farm
> +by editing the file at
> +https://gitlab.freedesktop.org/gfx-ci/lab-status/-/blob/main/lab-status.yml.
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index b99dede9a5b1..23fe6600d1e9 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -17,6 +17,7 @@ Linux GPU Driver Developer's Guide
>      backlight
>      vga-switcheroo
>      vgaarbiter
> +   automated_testing
>      todo
>      rfc/index
>   
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d7f64dc0efe..6703681e2ad6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7075,6 +7075,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	drivers/gpu/drm/scheduler/
>   F:	include/drm/gpu_scheduler.h
>   
> +DRM AUTOMATED TESTING
> +M:	Tomeu Vizoso <tomeu.vizoso@collabora.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/gpu/automated_testing.rst
> +F:	drivers/gpu/drm/ci/
> +
>   DSBR100 USB FM RADIO DRIVER
>   M:	Alexey Klimov <klimov.linux@gmail.com>
>   L:	linux-media@vger.kernel.org
> diff --git a/drivers/gpu/drm/ci/arm.config b/drivers/gpu/drm/ci/arm.config
> new file mode 100644
> index 000000000000..21a5c7c23d58
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/arm.config
> @@ -0,0 +1,57 @@
> +CONFIG_LOCALVERSION_AUTO=y
> +CONFIG_DEBUG_KERNEL=y
> +
> +# abootimg with a 'dummy' rootfs fails with root=/dev/nfs
> +CONFIG_BLK_DEV_INITRD=n
> +
> +CONFIG_DEVFREQ_GOV_PERFORMANCE=y
> +CONFIG_DEVFREQ_GOV_POWERSAVE=y
> +CONFIG_DEVFREQ_GOV_USERSPACE=y
> +CONFIG_DEVFREQ_GOV_PASSIVE=y
> +CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
> +
> +CONFIG_DRM=y
> +CONFIG_DRM_ETNAVIV=y
> +CONFIG_DRM_ROCKCHIP=y
> +CONFIG_DRM_PANFROST=y
> +CONFIG_DRM_LIMA=y
> +CONFIG_DRM_PANEL_SIMPLE=y
> +CONFIG_PWM_CROS_EC=y
> +CONFIG_BACKLIGHT_PWM=y
> +
> +CONFIG_ROCKCHIP_CDN_DP=n
> +
> +CONFIG_SPI_ROCKCHIP=y
> +CONFIG_PWM_ROCKCHIP=y
> +CONFIG_PHY_ROCKCHIP_DP=y
> +CONFIG_DWMAC_ROCKCHIP=y
> +
> +CONFIG_MFD_RK808=y
> +CONFIG_REGULATOR_RK808=y
> +CONFIG_RTC_DRV_RK808=y
> +CONFIG_COMMON_CLK_RK808=y
> +
> +CONFIG_REGULATOR_FAN53555=y
> +CONFIG_REGULATOR=y
> +
> +CONFIG_REGULATOR_VCTRL=y
> +
> +CONFIG_KASAN=n
> +CONFIG_KASAN_INLINE=n
> +CONFIG_STACKTRACE=n
> +
> +CONFIG_TMPFS=y
> +
> +CONFIG_PROVE_LOCKING=n
> +CONFIG_DEBUG_LOCKDEP=n
> +CONFIG_SOFTLOCKUP_DETECTOR=n
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=n
> +
> +CONFIG_FW_LOADER_COMPRESS=y
> +
> +CONFIG_USB_USBNET=y
> +CONFIG_NETDEVICES=y
> +CONFIG_USB_NET_DRIVERS=y
> +CONFIG_USB_RTL8152=y
> +CONFIG_USB_NET_AX8817X=y
> +CONFIG_USB_NET_SMSC95XX=y
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> new file mode 100644
> index 000000000000..d1219501d3f8
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -0,0 +1,179 @@
> +CONFIG_LOCALVERSION_AUTO=y
> +CONFIG_DEBUG_KERNEL=y
> +
> +# abootimg with a 'dummy' rootfs fails with root=/dev/nfs
> +CONFIG_BLK_DEV_INITRD=n
> +
> +CONFIG_DEVFREQ_GOV_PERFORMANCE=y
> +CONFIG_DEVFREQ_GOV_POWERSAVE=y
> +CONFIG_DEVFREQ_GOV_USERSPACE=y
> +CONFIG_DEVFREQ_GOV_PASSIVE=y
> +
> +CONFIG_DRM=y
> +CONFIG_DRM_ROCKCHIP=y
> +CONFIG_DRM_PANFROST=y
> +CONFIG_DRM_LIMA=y
> +CONFIG_DRM_PANEL_SIMPLE=y
> +CONFIG_DRM_PANEL_EDP=y
> +CONFIG_DRM_MSM=y
> +CONFIG_DRM_I2C_ADV7511=y
> +CONFIG_PWM_CROS_EC=y
> +CONFIG_BACKLIGHT_PWM=y
> +
> +CONFIG_ROCKCHIP_CDN_DP=n
> +
> +CONFIG_SPI_ROCKCHIP=y
> +CONFIG_PWM_ROCKCHIP=y
> +CONFIG_PHY_ROCKCHIP_DP=y
> +CONFIG_DWMAC_ROCKCHIP=y
> +CONFIG_STMMAC_ETH=y
> +CONFIG_TYPEC_FUSB302=y
> +CONFIG_TYPEC=y
> +CONFIG_TYPEC_TCPM=y
> +
> +# MSM platform bits
> +
> +# For CONFIG_QCOM_LMH
> +CONFIG_OF=y
> +
> +CONFIG_QCOM_COMMAND_DB=y
> +CONFIG_QCOM_RPMHPD=y
> +CONFIG_QCOM_RPMPD=y
> +CONFIG_SDM_GPUCC_845=y
> +CONFIG_SDM_VIDEOCC_845=y
> +CONFIG_SDM_DISPCC_845=y
> +CONFIG_SDM_LPASSCC_845=y
> +CONFIG_SDM_CAMCC_845=y
> +CONFIG_RESET_QCOM_PDC=y
> +CONFIG_DRM_TI_SN65DSI86=y
> +CONFIG_I2C_QCOM_GENI=y
> +CONFIG_SPI_QCOM_GENI=y
> +CONFIG_PHY_QCOM_QUSB2=y
> +CONFIG_PHY_QCOM_QMP=y
> +CONFIG_QCOM_CLK_APCC_MSM8996=y
> +CONFIG_QCOM_LLCC=y
> +CONFIG_QCOM_LMH=y
> +CONFIG_QCOM_SPMI_TEMP_ALARM=y
> +CONFIG_QCOM_WDT=y
> +CONFIG_POWER_RESET_QCOM_PON=y
> +CONFIG_RTC_DRV_PM8XXX=y
> +CONFIG_INTERCONNECT=y
> +CONFIG_INTERCONNECT_QCOM=y
> +CONFIG_INTERCONNECT_QCOM_SDM845=y
> +CONFIG_INTERCONNECT_QCOM_MSM8916=y
> +CONFIG_INTERCONNECT_QCOM_OSM_L3=y
> +CONFIG_INTERCONNECT_QCOM_SC7180=y
> +CONFIG_CRYPTO_DEV_QCOM_RNG=y
> +CONFIG_SC_DISPCC_7180=y
> +CONFIG_SC_GPUCC_7180=y
> +CONFIG_PHY_QCOM_USB_HS=y
> +CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
> +CONFIG_PHY_QCOM_USB_HS_28NM=y
> +CONFIG_PHY_QCOM_USB_SS=y
> +
> +# db410c ethernet
> +CONFIG_USB_RTL8152=y
> +# db820c ethernet
> +CONFIG_ATL1C=y
> +
> +CONFIG_ARCH_ALPINE=n
> +CONFIG_ARCH_BCM2835=n
> +CONFIG_ARCH_BCM_IPROC=n
> +CONFIG_ARCH_BERLIN=n
> +CONFIG_ARCH_BRCMSTB=n
> +CONFIG_ARCH_EXYNOS=n
> +CONFIG_ARCH_K3=n
> +CONFIG_ARCH_LAYERSCAPE=n
> +CONFIG_ARCH_LG1K=n
> +CONFIG_ARCH_HISI=n
> +CONFIG_ARCH_MVEBU=n
> +CONFIG_ARCH_SEATTLE=n
> +CONFIG_ARCH_SYNQUACER=n
> +CONFIG_ARCH_RENESAS=n
> +CONFIG_ARCH_R8A774A1=n
> +CONFIG_ARCH_R8A774C0=n
> +CONFIG_ARCH_R8A7795=n
> +CONFIG_ARCH_R8A7796=n
> +CONFIG_ARCH_R8A77965=n
> +CONFIG_ARCH_R8A77970=n
> +CONFIG_ARCH_R8A77980=n
> +CONFIG_ARCH_R8A77990=n
> +CONFIG_ARCH_R8A77995=n
> +CONFIG_ARCH_STRATIX10=n
> +CONFIG_ARCH_TEGRA=n
> +CONFIG_ARCH_SPRD=n
> +CONFIG_ARCH_THUNDER=n
> +CONFIG_ARCH_THUNDER2=n
> +CONFIG_ARCH_UNIPHIER=n
> +CONFIG_ARCH_VEXPRESS=n
> +CONFIG_ARCH_XGENE=n
> +CONFIG_ARCH_ZX=n
> +CONFIG_ARCH_ZYNQMP=n
> +
> +# Strip out some stuff we don't need for graphics testing, to reduce
> +# the build.
> +CONFIG_CAN=n
> +CONFIG_WIRELESS=n
> +CONFIG_RFKILL=n
> +CONFIG_WLAN=n
> +
> +CONFIG_REGULATOR_FAN53555=y
> +CONFIG_REGULATOR=y
> +
> +CONFIG_REGULATOR_VCTRL=y
> +
> +CONFIG_KASAN=n
> +CONFIG_KASAN_INLINE=n
> +CONFIG_STACKTRACE=n
> +
> +CONFIG_TMPFS=y
> +
> +CONFIG_PROVE_LOCKING=n
> +CONFIG_DEBUG_LOCKDEP=n
> +CONFIG_SOFTLOCKUP_DETECTOR=y
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> +
> +CONFIG_DETECT_HUNG_TASK=y
> +
> +CONFIG_FW_LOADER_COMPRESS=y
> +CONFIG_FW_LOADER_USER_HELPER=n
> +
> +CONFIG_USB_USBNET=y
> +CONFIG_NETDEVICES=y
> +CONFIG_USB_NET_DRIVERS=y
> +CONFIG_USB_RTL8152=y
> +CONFIG_USB_NET_AX8817X=y
> +CONFIG_USB_NET_SMSC95XX=y
> +
> +# For amlogic
> +CONFIG_MESON_GXL_PHY=y
> +CONFIG_MDIO_BUS_MUX_MESON_G12A=y
> +CONFIG_DRM_MESON=y
> +
> +# For Mediatek
> +CONFIG_DRM_MEDIATEK=y
> +CONFIG_PWM_MEDIATEK=y
> +CONFIG_DRM_MEDIATEK_HDMI=y
> +CONFIG_GNSS=y
> +CONFIG_GNSS_MTK_SERIAL=y
> +CONFIG_HW_RANDOM=y
> +CONFIG_HW_RANDOM_MTK=y
> +CONFIG_MTK_DEVAPC=y
> +CONFIG_PWM_MTK_DISP=y
> +CONFIG_MTK_CMDQ=y
> +CONFIG_REGULATOR_DA9211=y
> +CONFIG_ARM_MEDIATEK_CPUFREQ=y
> +CONFIG_RTC_DRV_MT6397=y
> +
> +# For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
> +CONFIG_ARCH_TEGRA=y
> +CONFIG_DRM_NOUVEAU=m
> +CONFIG_DRM_TEGRA=m
> +CONFIG_R8169=y
> +CONFIG_STAGING=y
> +CONFIG_DRM_TEGRA_STAGING=y
> +CONFIG_TEGRA_HOST1X=y
> +CONFIG_ARM_TEGRA_DEVFREQ=y
> +CONFIG_TEGRA_SOCTHERM=y
> +CONFIG_DRM_TEGRA_DEBUG=y
> +CONFIG_PWM_TEGRA=y
> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
> new file mode 100644
> index 000000000000..8bc2c7334f3f
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/build-igt.sh
> @@ -0,0 +1,43 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +
> +set -ex
> +
> +git clone https://gitlab.freedesktop.org/drm/igt-gpu-tools.git --single-branch --no-checkout
> +cd igt-gpu-tools
> +git checkout $IGT_VERSION
> +
> +if [[ "$KERNEL_ARCH" = "arm" ]]; then
> +    . ../.gitlab-ci/container/create-cross-file.sh armhf
> +    EXTRA_MESON_ARGS="--cross-file /cross_file-armhf.txt"
> +fi
> +
> +MESON_OPTIONS="-Doverlay=disabled                    \
> +               -Dchamelium=disabled                  \
> +               -Dvalgrind=disabled                   \
> +               -Dman=enabled                         \
> +               -Dtests=enabled                       \
> +               -Drunner=enabled                      \
> +               -Dlibunwind=enabled                   \
> +               -Dprefix=/igt"
> +
> +# TODO: Remove this once https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1009805 is fixed and libjson-c-dev:armhf is installed in debian/arm-build
> +if [[ "$KERNEL_ARCH" = "arm" ]]; then
> +    cp /usr/lib/aarch64-linux-gnu/pkgconfig/json-c.pc /usr/lib/arm-linux-gnueabihf/pkgconfig/json-c.pc
> +    sed -i 's/aarch64-linux-gnu/arm-linux-gnueabihf/g' /usr/lib/arm-linux-gnueabihf/pkgconfig/json-c.pc
> +    ln -s /usr/lib/arm-linux-gnueabihf/libjson-c.so.5.1.0 /usr/lib/arm-linux-gnueabihf/libjson-c.so
> +fi
> +
> +mkdir -p /igt
> +meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
> +ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> +ninja -C build install
> +
> +mkdir -p artifacts/
> +tar -cf artifacts/igt.tar /igt
> +
> +# Pass needed files to the test stage
> +MINIO_ARTIFACT_NAME="igt.tar.gz"
> +gzip -c artifacts/igt.tar > ${MINIO_ARTIFACT_NAME}
> +ci-fairy minio login --token-file "${CI_JOB_JWT_FILE}"
> +ci-fairy minio cp ${MINIO_ARTIFACT_NAME} minio://${PIPELINE_ARTIFACTS_BASE}/${KERNEL_ARCH}/${MINIO_ARTIFACT_NAME}
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> new file mode 100644
> index 000000000000..4a93cab34342
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -0,0 +1,158 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +
> +set -ex
> +
> +# Clean up stale rebases that GitLab might not have removed when reusing a checkout dir
> +rm -rf .git/rebase-apply
> +
> +. .gitlab-ci/container/container_pre_build.sh
> +
> +# libssl-dev was uninstalled because it was considered an ephemeral package
> +apt-get update
> +apt-get install -y libssl-dev
> +
> +if [[ "$KERNEL_ARCH" = "arm64" ]]; then
> +    GCC_ARCH="aarch64-linux-gnu"
> +    DEBIAN_ARCH="arm64"
> +    DEVICE_TREES="arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/apq8016-sbc.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/apq8096-db820c.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb"
> +elif [[ "$KERNEL_ARCH" = "arm" ]]; then
> +    GCC_ARCH="arm-linux-gnueabihf"
> +    DEBIAN_ARCH="armhf"
> +    DEVICE_TREES="arch/arm/boot/dts/rk3288-veyron-jaq.dtb"
> +    DEVICE_TREES+=" arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dtb"
> +    DEVICE_TREES+=" arch/arm/boot/dts/imx6q-cubox-i.dtb"
> +    apt-get install -y libssl-dev:armhf
> +else
> +    GCC_ARCH="x86_64-linux-gnu"
> +    DEBIAN_ARCH="amd64"
> +    DEVICE_TREES=""
> +fi
> +
> +export ARCH=${KERNEL_ARCH}
> +export CROSS_COMPILE="${GCC_ARCH}-"
> +
> +# The kernel doesn't like the gold linker (or the old lld in our debians).
> +# Sneak in some override symlinks during kernel build until we can update
> +# debian.
> +mkdir -p ld-links
> +for i in /usr/bin/*-ld /usr/bin/ld; do
> +    i=`basename $i`
> +    ln -sf /usr/bin/$i.bfd ld-links/$i
> +done
> +export PATH=`pwd`/ld-links:$PATH
> +
> +git config --global user.email "fdo@example.com"
> +git config --global user.name "freedesktop.org CI"
> +
> +# Try to merge fixes from target repo
> +if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes)" ]; then
> +    git pull ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes
> +fi
> +
> +# Try to merge fixes from local repo if this isn't a merge request
> +if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
> +    if [ "$(git ls-remote --exit-code --heads origin ${TARGET_BRANCH}-external-fixes)" ]; then
> +        git pull origin ${TARGET_BRANCH}-external-fixes
> +    fi
> +fi
> +
> +for opt in $ENABLE_KCONFIGS; do
> +  echo CONFIG_$opt=y >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
> +done
> +for opt in $DISABLE_KCONFIGS; do
> +  echo CONFIG_$opt=n >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
> +done
> +
> +if [[ -n "${MERGE_FRAGMENT}" ]]; then
> +    ./scripts/kconfig/merge_config.sh ${DEFCONFIG} drivers/gpu/drm/ci/${MERGE_FRAGMENT}
> +else
> +    make `basename ${DEFCONFIG}`
> +fi
> +
> +make ${KERNEL_IMAGE_NAME}
> +
> +mkdir -p /lava-files/
> +for image in ${KERNEL_IMAGE_NAME}; do
> +    cp arch/${KERNEL_ARCH}/boot/${image} /lava-files/.
> +done
> +
> +if [[ -n ${DEVICE_TREES} ]]; then
> +    make dtbs
> +    cp ${DEVICE_TREES} /lava-files/.
> +fi
> +
> +if [[ ${DEBIAN_ARCH} = "amd64" ]]; then
> +    make modules
> +    mkdir -p install/modules/
> +    INSTALL_MOD_PATH=install/modules/ make modules_install
> +fi
> +
> +if [[ ${DEBIAN_ARCH} = "arm64" ]]; then
> +    make Image.lzma
> +    mkimage \
> +        -f auto \
> +        -A arm \
> +        -O linux \
> +        -d arch/arm64/boot/Image.lzma \
> +        -C lzma\
> +        -b arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb \
> +        /lava-files/cheza-kernel
> +    KERNEL_IMAGE_NAME+=" cheza-kernel"
> +
> +    # Make a gzipped copy of the Image for db410c.
> +    gzip -k /lava-files/Image
> +    KERNEL_IMAGE_NAME+=" Image.gz"
> +fi
> +
> +# Pass needed files to the test stage
> +mkdir -p install
> +cp -rfv .gitlab-ci/* install/.
> +cp -rfv install/common install/ci-common
> +cp -rfv drivers/gpu/drm/ci/* install/.
> +
> +. .gitlab-ci/container/container_post_build.sh
> +
> +if [[ "$UPLOAD_TO_MINIO" = "1" ]]; then
> +    xz -7 -c -T${FDO_CI_CONCURRENT:-4} vmlinux > /lava-files/vmlinux.xz
> +    ci-fairy minio login --token-file "${CI_JOB_JWT_FILE}"
> +    FILES_TO_UPLOAD="$KERNEL_IMAGE_NAME vmlinux.xz"
> +
> +    if [[ -n $DEVICE_TREES ]]; then
> +        FILES_TO_UPLOAD="$FILES_TO_UPLOAD $(basename -a $DEVICE_TREES)"
> +    fi
> +
> +    for f in $FILES_TO_UPLOAD; do
> +        ci-fairy minio cp /lava-files/$f \
> +                minio://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/$f
> +    done
> +
> +    MINIO_ARTIFACT_NAME="kernel-files.tar.zst"
> +    tar --zstd -cf $MINIO_ARTIFACT_NAME install
> +    ci-fairy minio login --token-file "${CI_JOB_JWT_FILE}"
> +    ci-fairy minio cp ${MINIO_ARTIFACT_NAME} minio://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/${MINIO_ARTIFACT_NAME}
> +
> +    echo "Download vmlinux.xz from https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/vmlinux.xz"
> +fi
> +
> +mkdir -p artifacts/install/lib
> +mv install/* artifacts/install/.
> +rm -rf artifacts/install/modules
> +ln -s common artifacts/install/ci-common
> +
> +for image in ${KERNEL_IMAGE_NAME}; do
> +    cp /lava-files/$image artifacts/install/.
> +done
> +
> +tar -C artifacts -cf artifacts/install.tar install
> +rm -rf artifacts/install
> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> new file mode 100644
> index 000000000000..08cc817d9a07
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/build.yml
> @@ -0,0 +1,110 @@
> +.build:
> +  extends:
> +    - .build-rules
> +  stage: build
> +  artifacts:
> +    paths:
> +      - artifacts
> +  script:
> +    - FDO_CI_CONCURRENT=${FDO_CI_CONCURRENT} bash drivers/gpu/drm/ci/build.sh
> +
> +.build:armhf:
> +  extends:
> +    - .build
> +    - .use-debian/arm_build
> +  tags:
> +    - aarch64
> +  variables:
> +    DEFCONFIG: "arch/arm/configs/multi_v7_defconfig"
> +    KERNEL_IMAGE_NAME: "zImage"
> +    KERNEL_ARCH: "arm"
> +
> +.build:arm64:
> +  extends:
> +    - .build
> +    - .use-debian/arm_build
> +  tags:
> +    - aarch64
> +  variables:
> +    DEFCONFIG: "arch/arm64/configs/defconfig"
> +    KERNEL_IMAGE_NAME: "Image"
> +    KERNEL_ARCH: "arm64"
> +
> +.build:amd64:
> +  extends:
> +    - .build
> +    - .use-debian/x86_build
> +  variables:
> +    DEFCONFIG: "arch/x86/configs/x86_64_defconfig"
> +    KERNEL_IMAGE_NAME: "bzImage"
> +    KERNEL_ARCH: "x86_64"
> +
> +
> +# Build IGT for testing on devices
> +
> +igt:armhf:
> +  extends: .build:armhf
> +  script:
> +    - FDO_CI_CONCURRENT=${FDO_CI_CONCURRENT} bash drivers/gpu/drm/ci/build-igt.sh
> +
> +igt:arm64:
> +  extends: .build:arm64
> +  script:
> +    - FDO_CI_CONCURRENT=${FDO_CI_CONCURRENT} bash drivers/gpu/drm/ci/build-igt.sh
> +
> +igt:amd64:
> +  extends: .build:amd64
> +  script:
> +    - FDO_CI_CONCURRENT=${FDO_CI_CONCURRENT} bash drivers/gpu/drm/ci/build-igt.sh
> +
> +# Build kernels for testing on devices
> +
> +testing:armhf:
> +  extends: .build:armhf
> +  variables:
> +    # Would be good to have DEBUG_KMEMLEAK, but it doesn't work well with any of
> +    # PROVE_LOCKING and KASAN as of 5.17.
> +    #
> +    # db410c and db820c don't boot with KASAN_INLINE, probably due to the kernel
> +    # becoming too big for their bootloaders.
> +    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
> +    UPLOAD_TO_MINIO: 1
> +    MERGE_FRAGMENT: arm.config
> +
> +testing:arm64:
> +  extends: .build:arm64
> +  variables:
> +    # Would be good to have DEBUG_KMEMLEAK, but it doesn't work well with any of
> +    # PROVE_LOCKING and KASAN as of 5.17.
> +    #
> +    # db410c and db820c don't boot with KASAN_INLINE, probably due to the kernel
> +    # becoming too big for their bootloaders.
> +    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
> +    UPLOAD_TO_MINIO: 1
> +    MERGE_FRAGMENT: arm64.config
> +
> +testing:amd64:
> +  extends: .build:amd64
> +  variables:
> +    # Would be good to have DEBUG_KMEMLEAK, but it doesn't work well with any of
> +    # PROVE_LOCKING and KASAN as of 5.17.
> +    #
> +    # db410c and db820c don't boot with KASAN_INLINE, probably due to the kernel
> +    # becoming too big for their bootloaders.
> +    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
> +    UPLOAD_TO_MINIO: 1
> +    MERGE_FRAGMENT: x86_64.config
> +
> +
> +# Jobs for build-testing different configurations
> +
> +build:armhf:
> +  extends: .build:armhf
> +
> +build-nodebugfs:arm64:
> +  extends: .build:arm64
> +  variables:
> +    DISABLE_KCONFIGS: "DEBUG_FS"
> +
> +build:x86_64:
> +  extends: .build:amd64
> diff --git a/drivers/gpu/drm/ci/check-patch.py b/drivers/gpu/drm/ci/check-patch.py
> new file mode 100755
> index 000000000000..a5f399a20e25
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/check-patch.py
> @@ -0,0 +1,57 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# check-patch.py: run checkpatch.pl across all commits in a branch
> +#
> +# Based on qemu/.gitlab-ci.d/check-patch.py
> +#
> +# Copyright (C) 2020 Red Hat, Inc.
> +# Copyright (C) 2022 Collabora Ltd.
> +
> +import os
> +import os.path
> +import sys
> +import subprocess
> +
> +repourl = "https://gitlab.freedesktop.org/%s.git" % os.environ["CI_MERGE_REQUEST_PROJECT_PATH"]
> +
> +# GitLab CI environment does not give us any direct info about the
> +# base for the user's branch. We thus need to figure out a common
> +# ancestor between the user's branch and current git master.
> +os.environ["GIT_DEPTH"] = "1000"
> +subprocess.call(["git", "remote", "remove", "check-patch"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
> +subprocess.check_call(["git", "remote", "add", "check-patch", repourl])
> +subprocess.check_call(["git", "fetch", "check-patch", os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"]],
> +                      stdout=subprocess.DEVNULL,
> +                      stderr=subprocess.DEVNULL)
> +
> +ancestor = subprocess.check_output(["git", "merge-base",
> +                                    "check-patch/%s" % os.environ["CI_MERGE_REQUEST_TARGET_BRANCH_NAME"], "HEAD"],
> +                                   universal_newlines=True)
> +
> +ancestor = ancestor.strip()
> +
> +log = subprocess.check_output(["git", "log", "--format=%H %s",
> +                               ancestor + "..."],
> +                              universal_newlines=True)
> +
> +subprocess.check_call(["git", "remote", "rm", "check-patch"])
> +
> +if log == "":
> +    print("\nNo commits since %s, skipping checks\n" % ancestor)
> +    sys.exit(0)
> +
> +errors = False
> +
> +print("\nChecking all commits since %s...\n" % ancestor, flush=True)
> +
> +ret = subprocess.run(["scripts/checkpatch.pl",
> +                      "--terse",
> +                      "--types", os.environ["CHECKPATCH_TYPES"],
> +                      "--git", ancestor + "..."])
> +
> +if ret.returncode != 0:
> +    print("    ❌ FAIL one or more commits failed scripts/checkpatch.pl")
> +    sys.exit(1)
> +
> +sys.exit(0)
> diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/container.yml
> new file mode 100644
> index 000000000000..af2416a84daf
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/container.yml
> @@ -0,0 +1,54 @@
> +.container:
> +  variables:
> +    CI_REPOSITORY_URL: ${DRM_CI_PROJECT_URL}.git # So ci-templates clones drm-ci instead of the repo to test
> +    CI_COMMIT_SHA: ${DRM_CI_COMMIT_SHA}
> +
> +debian/x86_build-base:
> +  variables:
> +    EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libkmod-dev libpciaccess-dev libprocps-dev libudev-dev libunwind-dev python3-docutils bc curl python3-ply libssl-dev"
> +
> +debian/x86_test-gl:
> +  variables:
> +    EXTRA_EPHEMERAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libkmod-dev libpciaccess-dev libprocps-dev libunwind-dev python3-docutils"
> +    EXTRA_LOCAL_PACKAGES: "jq libasound2 libcairo2 libdw1 libglib2.0-0 libgsl25 libjson-c5 libkmod2 libprocps8 curl libgles2"
> +
> +debian/arm_build:
> +  variables:
> +    EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libkmod-dev libpciaccess-dev libprocps-dev libudev-dev libunwind-dev python3-docutils curl libssl-dev crossbuild-essential-armhf libkmod-dev:armhf libcairo-dev:armhf libdw-dev:armhf libjson-c5:armhf libkmod-dev:armhf libpciaccess-dev:armhf libprocps-dev:armhf libudev-dev:armhf libunwind-dev:armhf"
> +
> +debian/arm_test:
> +  variables:
> +    EXTRA_LOCAL_PACKAGES: "curl"
> +
> +.kernel+rootfs:
> +  variables:
> +    EXTRA_LOCAL_PACKAGES: "jq libasound2 libcairo2 libdw1 libglib2.0-0 libgsl25 libjson-c5 libprocps8"
> +
> +# Disable container jobs that we won't use
> +debian/x86_test-vk:
> +  rules:
> +    - when: never
> +
> +fedora/x86_build:
> +  rules:
> +    - when: never
> +
> +debian/android_build:
> +  rules:
> +    - when: never
> +
> +windows_build_vs2019:
> +  rules:
> +    - when: never
> +
> +windows_test_vs2019:
> +  rules:
> +    - when: never
> +
> +debian/x86_build-mingw:
> +   rules:
> +    - when: never
> +
> +windows_vs2019:
> +   rules:
> +    - when: never
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> new file mode 100644
> index 000000000000..8b83d0c4a8c4
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -0,0 +1,225 @@
> +variables:
> +  # Change this to use your fork of drm-ci
> +  DRM_CI_PROJECT_PATH: &drm-ci-project-path gfx-ci/drm-ci
> +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 09eb70d72f13755b646a20dcd1e7971d69c0a2da
> +
> +  UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
> +  TARGET_BRANCH: drm-next
> +
> +  IGT_VERSION: cffa5fffe9acddf49565b4caeeb5e3355ff2ea44
> +
> +  DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
> +  DEQP_RUNNER_GIT_TAG: v0.15.0
> +
> +  FDO_UPSTREAM_REPO: tomeu/linux   # The repo where the git-archive daily runs
> +  MESA_TEMPLATES_COMMIT: &ci-templates-commit d5aa3941aa03c2f716595116354fb81eb8012acb
> +  DRM_CI_PROJECT_URL: https://gitlab.freedesktop.org/${DRM_CI_PROJECT_PATH}
> +  CI_PRE_CLONE_SCRIPT: |-
> +          set -o xtrace
> +          wget -q -O download-git-cache.sh ${DRM_CI_PROJECT_URL}/-/raw/${DRM_CI_COMMIT_SHA}/.gitlab-ci/download-git-cache.sh
> +          bash download-git-cache.sh
> +          rm download-git-cache.sh
> +          set +o xtrace
> +  MINIO_HOST: minio-packet.freedesktop.org
> +  # per-pipeline artifact storage on MinIO
> +  PIPELINE_ARTIFACTS_BASE: ${MINIO_HOST}/artifacts/${CI_PROJECT_PATH}/${CI_PIPELINE_ID}
> +  # per-job artifact storage on MinIO
> +  JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
> +
> +default:
> +  before_script:
> +    - echo -e "\e[0Ksection_start:$(date +%s):unset_env_vars_section[collapsed=true]\r\e[0KUnsetting vulnerable environment variables"
> +    - export CI_JOB_JWT_FILE="${CI_JOB_JWT_FILE:-$(mktemp)}"
> +    - echo -n "${CI_JOB_JWT}" > "${CI_JOB_JWT_FILE}"
> +    - unset CI_JOB_JWT
> +    - echo -e "\e[0Ksection_end:$(date +%s):unset_env_vars_section\r\e[0K"
> +
> +    - echo -e "\e[0Ksection_start:$(date +%s):drm_ci_download_section[collapsed=true]\r\e[0KDownloading drm-ci from $DRM_CI_PROJECT_URL/-/archive/$DRM_CI_COMMIT_SHA/drm-ci-$DRM_CI_COMMIT_SHA.tar.gz"
> +    - cd $CI_PROJECT_DIR
> +    - curl --output - $DRM_CI_PROJECT_URL/-/archive/$DRM_CI_COMMIT_SHA/drm-ci-$DRM_CI_COMMIT_SHA.tar.gz | tar -xz
> +    - mv drm-ci-$DRM_CI_COMMIT_SHA/.gitlab-ci* .
> +    - rm -rf drm-ci-$DRM_CI_COMMIT_SHA/
> +    - echo -e "\e[0Ksection_end:$(date +%s):drm_ci_download_section\r\e[0K"
> +
> +  after_script:
> +    - >
> +      set +x
> +
> +      test -e "${CI_JOB_JWT_FILE}" &&
> +      export CI_JOB_JWT="$(<${CI_JOB_JWT_FILE})" &&
> +      rm "${CI_JOB_JWT_FILE}"
> +
> +include:
> +  - project: 'freedesktop/ci-templates'
> +    ref: 34f4ade99434043f88e164933f570301fd18b125
> +    file:
> +      - '/templates/ci-fairy.yml'
> +  - project: 'freedesktop/ci-templates'
> +    ref: *ci-templates-commit
> +    file:
> +      - '/templates/debian.yml'
> +      - '/templates/fedora.yml'
> +  - project: *drm-ci-project-path
> +    ref: *drm-ci-commit-sha
> +    file:
> +      - '/.gitlab-ci/container/gitlab-ci.yml'
> +      - '/.gitlab-ci/test/gitlab-ci.yml'
> +      - '/.gitlab-ci/lava/lava-gitlab-ci.yml'
> +  - drivers/gpu/drm/ci/image-tags.yml
> +  - drivers/gpu/drm/ci/container.yml
> +  - drivers/gpu/drm/ci/static-checks.yml
> +  - drivers/gpu/drm/ci/build.yml
> +  - drivers/gpu/drm/ci/test.yml
> +  - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-status.yml'
> +
> +
> +stages:
> +  - sanity
> +  - container
> +  - git-archive
> +  - build
> +  - amdgpu
> +  - i915
> +  - mediatek
> +  - meson
> +  - msm
> +  - rockchip
> +  - virtio-gpu
> +
> +# YAML anchors for rule conditions
> +# --------------------------------
> +.rules-anchors:
> +  rules:
> +    # Pipeline for forked project branch
> +    - if: &is-forked-branch '$CI_COMMIT_BRANCH && $CI_PROJECT_NAMESPACE != "mesa"'
> +      when: manual
> +    # Forked project branch / pre-merge pipeline not for Marge bot
> +    - if: &is-forked-branch-or-pre-merge-not-for-marge '$CI_PROJECT_NAMESPACE != "mesa" || ($GITLAB_USER_LOGIN != "marge-bot" && $CI_PIPELINE_SOURCE == "merge_request_event")'
> +      when: manual
> +    # Pipeline runs for the main branch of the upstream Mesa project
> +    - if: &is-mesa-main '$CI_PROJECT_NAMESPACE == "mesa" && $CI_COMMIT_REF_NAME == $CI_DEFAULT_BRANCH && $CI_COMMIT_BRANCH'
> +      when: always
> +    # Post-merge pipeline
> +    - if: &is-post-merge '$CI_PROJECT_NAMESPACE == "mesa" && $CI_COMMIT_BRANCH'
> +      when: on_success
> +    # Post-merge pipeline, not for Marge Bot
> +    - if: &is-post-merge-not-for-marge '$CI_PROJECT_NAMESPACE == "mesa" && $GITLAB_USER_LOGIN != "marge-bot" && $CI_COMMIT_BRANCH'
> +      when: on_success
> +    # Pre-merge pipeline
> +    - if: &is-pre-merge '$CI_PIPELINE_SOURCE == "merge_request_event"'
> +      when: on_success
> +    # Pre-merge pipeline for Marge Bot
> +    - if: &is-pre-merge-for-marge '$GITLAB_USER_LOGIN == "marge-bot" && $CI_PIPELINE_SOURCE == "merge_request_event"'
> +      when: on_success
> +
> +# Rule to filter for only scheduled pipelines.
> +.scheduled_pipeline-rules:
> +  rules:
> +    - if: &is-scheduled-pipeline '$CI_PIPELINE_SOURCE == "schedule"'
> +      when: on_success
> +
> +# Generic rule to not run the job during scheduled pipelines. Jobs that aren't
> +# something like a nightly run should include this rule.
> +.no_scheduled_pipelines-rules:
> +  rules:
> +    - if: *is-scheduled-pipeline
> +      when: never
> +
> +# When to automatically run the CI for build jobs
> +.build-rules:
> +  rules:
> +    - !reference [.no_scheduled_pipelines-rules, rules]
> +    # Run automatically once all dependency jobs have passed
> +    - when: on_success
> +
> +
> +.ci-deqp-artifacts:
> +  artifacts:
> +    name: "mesa_${CI_JOB_NAME}"
> +    when: always
> +    untracked: false
> +    paths:
> +      # Watch out!  Artifacts are relative to the build dir.
> +      # https://gitlab.com/gitlab-org/gitlab-ce/commit/8788fb925706cad594adf6917a6c5f6587dd1521
> +      - artifacts
> +      - _build/meson-logs/*.txt
> +      - _build/meson-logs/strace
> +
> +
> +.container-rules:
> +  rules:
> +    - !reference [.no_scheduled_pipelines-rules, rules]
> +    # Run pipeline by default in the main project if any CI pipeline
> +    # configuration files were changed, to ensure docker images are up to date
> +    - if: *is-post-merge
> +      changes:
> +      - drivers/gpu/drm/ci/**/*
> +      when: on_success
> +    # Run pipeline by default if it was triggered by Marge Bot, is for a
> +    # merge request, and any files affecting the pipeline were changed
> +    - if: *is-pre-merge-for-marge
> +      when: on_success
> +    # Run pipeline by default in the main project if it was not triggered by
> +    # Marge Bot, and any files affecting the pipeline were changed
> +    - if: *is-post-merge-not-for-marge
> +      when: on_success
> +    # Allow triggering jobs manually in other cases
> +    - when: manual
> +
> +
> +
> +# Git archive
> +
> +make git archive:
> +  extends:
> +    - .fdo.ci-fairy
> +  stage: git-archive
> +  rules:
> +    - !reference [.scheduled_pipeline-rules, rules]
> +  # ensure we are running on packet
> +  tags:
> +    - packet.net
> +  script:
> +    # Remove drm-ci files we just added
> +    - rm -rf .gitlab-ci.*
> +
> +    # Compactify the .git directory
> +    - git gc --aggressive
> +    # compress the current folder
> +    - tar -cvzf ../$CI_PROJECT_NAME.tar.gz .
> +
> +    # login with the JWT token file
> +    - ci-fairy minio login --token-file "${CI_JOB_JWT_FILE}"
> +    - ci-fairy minio cp ../$CI_PROJECT_NAME.tar.gz minio://$MINIO_HOST/git-cache/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/$CI_PROJECT_NAME.tar.gz
> +
> +
> +# Sanity checks of MR settings and commit logs
> +sanity:
> +  extends:
> +    - .fdo.ci-fairy
> +  stage: sanity
> +  rules:
> +    - if: *is-pre-merge
> +      when: on_success
> +    # Other cases default to never
> +  variables:
> +    GIT_STRATEGY: none
> +  script:
> +    # ci-fairy check-commits --junit-xml=check-commits.xml
> +    - ci-fairy check-merge-request --require-allow-collaboration --junit-xml=check-merge-request.xml
> +  artifacts:
> +    when: on_failure
> +    reports:
> +      junit: check-*.xml
> +
> +# Rules for tests that should not block merging, but should be available to
> +# optionally run with the "play" button in the UI in pre-merge non-marge
> +# pipelines.  This should appear in "extends:" after any includes of
> +# test-source-dep.yml rules, so that these rules replace those.
> +.test-manual-mr:
> +  rules:
> +    - !reference [.no_scheduled_pipelines-rules, rules]
> +    - if: *is-forked-branch-or-pre-merge-not-for-marge
> +      when: manual
> +  variables:
> +    JOB_TIMEOUT: 80
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> new file mode 100755
> index 000000000000..5bfa78f03d00
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -0,0 +1,77 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: MIT
> +
> +set -ex
> +
> +export IGT_FORCE_DRIVER=${DRIVER_NAME}
> +export PATH=$PATH:/igt/bin/
> +export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu/:/igt/lib/x86_64-linux-gnu:/igt/lib
> +
> +# Uncomment the below to debug problems with driver probing
> +: '
> +ls -l /dev/dri/
> +cat /sys/kernel/debug/devices_deferred
> +cat /sys/kernel/debug/device_component/*
> +'
> +
> +# Dump drm state to confirm that kernel was able to find a connected display:
> +# TODO this path might not exist for all drivers.. maybe run modetest instead?
> +set +e
> +cat /sys/kernel/debug/dri/*/state
> +set -e
> +
> +# Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
> +if [ "$IGT_FORCE_DRIVER" = "amdgpu" ]; then
> +    mv /install/modules/lib/modules/* /lib/modules/.
> +    modprobe amdgpu
> +fi
> +
> +if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
> +    IGT_SKIPS="--skips /install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt"
> +fi
> +
> +if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-flakes.txt" ]; then
> +    IGT_FLAKES="--flakes /install/xfails/$DRIVER_NAME-$GPU_VERSION-flakes.txt"
> +fi
> +
> +if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-fails.txt" ]; then
> +    IGT_FAILS="--baseline /install/xfails/$DRIVER_NAME-$GPU_VERSION-fails.txt"
> +fi
> +
> +if [ "`uname -m`" = "aarch64" ]; then
> +    ARCH="arm64"
> +elif [ "`uname -m`" = "armv7l" ]; then
> +    ARCH="arm"
> +else
> +    ARCH="x86_64"
> +fi
> +
> +wget -S --progress=dot:giga -O- ${FDO_HTTP_CACHE_URI:-}$PIPELINE_ARTIFACTS_BASE/$ARCH/igt.tar.gz | tar -xz -C /
> +
> +set +e
> +igt-runner \
> +    run \
> +    --igt-folder /igt/libexec/igt-gpu-tools \
> +    --caselist /install/testlist.txt \
> +    --output /results \
> +    $IGT_SKIPS \
> +    $IGT_FLAKES \
> +    $IGT_FAILS \
> +    --fraction-start $CI_NODE_INDEX \
> +    --fraction $CI_NODE_TOTAL \
> +    --jobs 1
> +ret=$?
> +set -e
> +
> +deqp-runner junit \
> +   --testsuite IGT \
> +   --results /results/failures.csv \
> +   --output /results/junit.xml \
> +   --limit 50 \
> +   --template "See https://$CI_PROJECT_ROOT_NAMESPACE.pages.freedesktop.org/-/$CI_PROJECT_NAME/-/jobs/$CI_JOB_ID/artifacts/results/{{testcase}}.xml"
> +
> +# Store the results also in the simpler format used by the runner in ChromeOS CI
> +#sed -r 's/(dmesg-warn|pass)/success/g' /results/results.txt > /results/results_simple.txt
> +
> +cd $oldpath
> +exit $ret
> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
> new file mode 100644
> index 000000000000..6d6773554028
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/image-tags.yml
> @@ -0,0 +1,13 @@
> +variables:
> +   CONTAINER_TAG: "2022-09-08-mesa-uprev"
> +   DEBIAN_X86_BUILD_BASE_IMAGE: "debian/x86_build-base"
> +   DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
> +
> +   DEBIAN_X86_BUILD_IMAGE_PATH: "debian/x86_build"
> +   DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"
> +
> +   KERNEL_ROOTFS_TAG: "${CONTAINER_TAG}"
> +
> +   DEBIAN_X86_TEST_BASE_IMAGE: "debian/x86_test-base"
> +   DEBIAN_X86_TEST_IMAGE_PATH: "debian/x86_test-gl"
> +   DEBIAN_X86_TEST_GL_TAG: "${CONTAINER_TAG}"
> diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
> new file mode 100755
> index 000000000000..3dec17dbdd30
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/lava-submit.sh
> @@ -0,0 +1,53 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +
> +set -e
> +set -x
> +
> +# Try to use the kernel and rootfs built in mainline first, so we're more
> +# likely to hit cache
> +if wget -q --method=HEAD "https://${BASE_SYSTEM_MAINLINE_HOST_PATH}/done"; then
> +	BASE_SYSTEM_HOST_PATH="${BASE_SYSTEM_MAINLINE_HOST_PATH}"
> +else
> +	BASE_SYSTEM_HOST_PATH="${BASE_SYSTEM_FORK_HOST_PATH}"
> +fi
> +
> +rm -rf results
> +mkdir -p results/job-rootfs-overlay/
> +
> +cp artifacts/ci-common/capture-devcoredump.sh results/job-rootfs-overlay/
> +cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/
> +cp artifacts/ci-common/intel-gpu-freq.sh results/job-rootfs-overlay/
> +
> +# Prepare env vars for upload.
> +KERNEL_IMAGE_BASE_URL="https://${BASE_SYSTEM_HOST_PATH}" \
> +	artifacts/ci-common/generate-env.sh > results/job-rootfs-overlay/set-job-env-vars.sh
> +
> +tar zcf job-rootfs-overlay.tar.gz -C results/job-rootfs-overlay/ .
> +ci-fairy minio login --token-file "${CI_JOB_JWT_FILE}"
> +ci-fairy minio cp job-rootfs-overlay.tar.gz "minio://${JOB_ROOTFS_OVERLAY_PATH}"
> +
> +touch results/lava.log
> +tail -f results/lava.log &
> +
> +PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
> +	--dump-yaml \
> +	--pipeline-info "$CI_JOB_NAME: $CI_PIPELINE_URL on $CI_COMMIT_REF_NAME ${CI_NODE_INDEX}/${CI_NODE_TOTAL}" \
> +	--rootfs-url-prefix "https://${BASE_SYSTEM_HOST_PATH}" \
> +	--kernel-url-prefix "https://${PIPELINE_ARTIFACTS_BASE}/${ARCH}" \
> +	--build-url "${FDO_HTTP_CACHE_URI:-}https://${PIPELINE_ARTIFACTS_BASE}/${ARCH}/kernel-files.tar.zst" \
> +	--job-rootfs-overlay-url "${FDO_HTTP_CACHE_URI:-}https://${JOB_ROOTFS_OVERLAY_PATH}" \
> +	--job-timeout ${JOB_TIMEOUT:-30} \
> +	--first-stage-init artifacts/ci-common/init-stage1.sh \
> +	--ci-project-dir ${CI_PROJECT_DIR} \
> +	--device-type ${DEVICE_TYPE} \
> +	--dtb ${DTB} \
> +	--jwt-file "${CI_JOB_JWT_FILE}" \
> +	--kernel-image-name ${KERNEL_IMAGE_NAME} \
> +	--kernel-image-type "${KERNEL_IMAGE_TYPE}" \
> +	--boot-method ${BOOT_METHOD} \
> +	--visibility-group ${VISIBILITY_GROUP} \
> +	--priority 50 \
> +    --lava-tags "${LAVA_TAGS}" \
> +    --mesa-job-name "$CI_JOB_NAME" \
> +    >> results/lava.log
> diff --git a/drivers/gpu/drm/ci/static-checks.yml b/drivers/gpu/drm/ci/static-checks.yml
> new file mode 100644
> index 000000000000..213177081914
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/static-checks.yml
> @@ -0,0 +1,12 @@
> +check-patch:
> +  extends:
> +    - .build
> +    - .use-debian/x86_build
> +  script:
> +    - drivers/gpu/drm/ci/check-patch.py
> +  variables:
> +    CHECKPATCH_TYPES: "BAD_SIGN_OFF,BAD_STABLE_ADDRESS_STYLE,COMMIT_COMMENT_SYMBOL,COMMIT_MESSAGE,EMAIL_SUBJECT,FROM_SIGN_OFF_MISMATCH,MISSING_SIGN_OFF,NO_AUTHOR_SIGN_OFF,DIFF_IN_COMMIT_MSG,GERRIT_CHANGE_ID,GIT_COMMIT_ID,UNKNOWN_COMMIT_ID,CODE_INDENT,BIT_MACRO,DOS_LINE_ENDINGS"
> +  rules:
> +    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
> +      when: on_success
> +    # Other cases default to never
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> new file mode 100644
> index 000000000000..399f0db01aeb
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -0,0 +1,322 @@
> +.test-rules:
> +  rules:
> +    - if: '$FD_FARM == "offline" && $RUNNER_TAG =~ /^google-freedreno-/'
> +      when: never
> +    - if: '$COLLABORA_FARM == "offline" && $RUNNER_TAG =~ /^mesa-ci-x86-64-lava-/'
> +      when: never
> +    - !reference [.no_scheduled_pipelines-rules, rules]
> +    - when: on_success
> +
> +.lava-test:
> +  extends:
> +    - .test-rules
> +  script:
> +    # Note: Build dir (and thus install) may be dirty due to GIT_STRATEGY
> +    - rm -rf install
> +    - tar -xf artifacts/install.tar
> +    - mv install/* artifacts/.
> +    # Override it with our lava-submit.sh script
> +    - ./artifacts/lava-submit.sh
> +
> +.lava-igt:armhf:
> +  extends:
> +    - .lava-test:armhf
> +  variables:
> +    HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
> +    ARCH: "armhf"
> +  dependencies:
> +    - testing:armhf
> +  needs:
> +    - kernel+rootfs_armhf
> +    - debian/x86_build
> +    - testing:armhf
> +    - igt:armhf
> +
> +.lava-igt:arm64:
> +  extends:
> +    - .lava-test:arm64
> +  variables:
> +    HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
> +    ARCH: "arm64"
> +  dependencies:
> +    - testing:arm64
> +  needs:
> +    - kernel+rootfs_arm64
> +    - debian/x86_build
> +    - testing:arm64
> +    - igt:arm64
> +
> +.lava-igt:amd64:
> +  extends:
> +    - .lava-test:amd64
> +  variables:
> +    HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
> +    ARCH: "amd64"
> +  dependencies:
> +    - testing:amd64
> +  needs:
> +    - kernel+rootfs_amd64
> +    - debian/x86_build
> +    - testing:amd64
> +    - igt:amd64
> +
> +.baremetal-igt-arm64:
> +  extends:
> +    - .baremetal-test-arm64
> +    - .use-debian/arm_test
> +    - .test-rules
> +  variables:
> +    FDO_CI_CONCURRENT: 10
> +    HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
> +    MINIO_ARTIFACT_NAME: "arm64/kernel-files"
> +    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/Image.gz
> +    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
> +  needs:
> +    - debian/arm_test
> +    - job: testing:arm64
> +      artifacts: false
> +    - igt:arm64
> +  tags:
> +    - $RUNNER_TAG
> +
> +msm:sc7180:
> +  extends:
> +    - .lava-igt:arm64
> +  stage: msm
> +  parallel: 2
> +  variables:
> +    DRIVER_NAME: msm
> +    DEVICE_TYPE: sc7180-trogdor-lazor-limozeen
> +    DTB: sc7180-trogdor-lazor-limozeen-nots-r5
> +    BOOT_METHOD: depthcharge
> +    KERNEL_IMAGE_TYPE: ""
> +    GPU_VERSION: sc7180
> +    RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-lazor-limozeen
> +
> +msm:apq8016:
> +  extends:
> +    - .baremetal-igt-arm64
> +  stage: msm
> +  variables:
> +    DRIVER_NAME: msm
> +    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc.dtb
> +    GPU_VERSION: apq8016
> +    RUNNER_TAG: google-freedreno-db410c
> +  script:
> +    - ./install/bare-metal/fastboot.sh
> +
> +msm:apq8096:
> +  extends:
> +    - .baremetal-igt-arm64
> +  stage: msm
> +  variables:
> +    DRIVER_NAME: msm
> +    BM_KERNEL_EXTRA_ARGS: maxcpus=2
> +    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8096-db820c.dtb
> +    GPU_VERSION: apq8096
> +    RUNNER_TAG: google-freedreno-db820c
> +  script:
> +    - ./install/bare-metal/fastboot.sh
> +
> +msm:sdm845:
> +  extends:
> +    - .baremetal-igt-arm64
> +  stage: msm
> +  parallel: 2
> +  variables:
> +    DRIVER_NAME: msm
> +    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
> +    GPU_VERSION: sdm845
> +    RUNNER_TAG: google-freedreno-cheza
> +  script:
> +    - ./install/bare-metal/cros-servo.sh
> +
> +rockchip:rk3288:
> +  extends:
> +    - .lava-igt:armhf
> +  stage: rockchip
> +  variables:
> +    DRIVER_NAME: rockchip
> +    DEVICE_TYPE: rk3288-veyron-jaq
> +    DTB: ${DEVICE_TYPE}
> +    BOOT_METHOD: depthcharge
> +    KERNEL_IMAGE_TYPE: "zimage"
> +    GPU_VERSION: rk3288
> +    RUNNER_TAG: mesa-ci-x86-64-lava-rk3288-veyron-jaq
> +
> +rockchip:rk3399:
> +  extends:
> +    - .lava-igt:arm64
> +  stage: rockchip
> +  parallel: 2
> +  variables:
> +    DRIVER_NAME: rockchip
> +    DEVICE_TYPE: rk3399-gru-kevin
> +    DTB: ${DEVICE_TYPE}
> +    BOOT_METHOD: depthcharge
> +    KERNEL_IMAGE_TYPE: ""
> +    GPU_VERSION: rk3399
> +    RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
> +
> +.i915:
> +  extends:
> +    - .lava-igt:amd64
> +  stage: i915
> +  variables:
> +    DRIVER_NAME: i915
> +    DTB: ""
> +    BOOT_METHOD: depthcharge
> +    KERNEL_IMAGE_TYPE: ""
> +
> +i915:apl:
> +  extends:
> +    - .i915
> +  parallel: 6
> +  variables:
> +    DEVICE_TYPE: asus-C523NA-A20057-coral
> +    GPU_VERSION: apl
> +    RUNNER_TAG: mesa-ci-x86-64-lava-asus-C523NA-A20057-coral
> +
> +i915:glk:
> +  extends:
> +    - .i915
> +  parallel: 3
> +  variables:
> +    DEVICE_TYPE: hp-x360-12b-ca0010nr-n4020-octopus
> +    GPU_VERSION: glk
> +    RUNNER_TAG: mesa-ci-x86-64-lava-hp-x360-12b-ca0010nr-n4020-octopus
> +
> +i915:amly:
> +  extends:
> +    - .i915
> +  parallel: 5
> +  variables:
> +    DEVICE_TYPE: asus-C433TA-AJ0005-rammus
> +    GPU_VERSION: amly
> +    RUNNER_TAG: mesa-ci-x86-64-lava-asus-C433TA-AJ0005-rammus
> +
> +i915:kbl:
> +  extends:
> +    - .i915
> +  parallel: 3
> +  variables:
> +    DEVICE_TYPE: hp-x360-14-G1-sona
> +    GPU_VERSION: kbl
> +    RUNNER_TAG: mesa-ci-x86-64-lava-hp-x360-14-G1-sona
> +
> +i915:whl:
> +  extends:
> +    - .i915
> +  parallel: 5
> +  variables:
> +    DEVICE_TYPE: dell-latitude-5400-8665U-sarien
> +    GPU_VERSION: whl
> +    RUNNER_TAG: mesa-ci-x86-64-lava-dell-latitude-5400-8665U-sarien
> +
> +i915:cml:
> +  extends:
> +    - .i915
> +  parallel: 4
> +  variables:
> +    DEVICE_TYPE: asus-C436FA-Flip-hatch
> +    GPU_VERSION: cml
> +    RUNNER_TAG: mesa-ci-x86-64-lava-asus-C436FA-flip-hatch
> +
> +i915:tgl:
> +  extends:
> +    - .i915
> +  parallel: 4
> +  variables:
> +    DEVICE_TYPE: asus-cx9400-volteer
> +    GPU_VERSION: tgl
> +    RUNNER_TAG: mesa-ci-x86-64-lava-asus-cx9400-volteer
> +
> +.amdgpu:
> +  extends:
> +    - .lava-igt:amd64
> +  stage: amdgpu
> +  variables:
> +    DRIVER_NAME: amdgpu
> +    DTB: ""
> +    BOOT_METHOD: depthcharge
> +    KERNEL_IMAGE_TYPE: ""
> +
> +amdgpu:stoney:
> +  extends:
> +    - .amdgpu
> +  variables:
> +    DEVICE_TYPE: hp-11A-G6-EE-grunt
> +    GPU_VERSION: stoney
> +    RUNNER_TAG: mesa-ci-x86-64-lava-hp-11A-G6-EE-grunt
> +
> +.mediatek:
> +  extends:
> +    - .lava-igt:arm64
> +  stage: mediatek
> +  variables:
> +    DRIVER_NAME: mediatek
> +    DTB: ${DEVICE_TYPE}
> +    BOOT_METHOD: depthcharge
> +    KERNEL_IMAGE_TYPE: ""
> +
> +mediatek:mt8173:
> +  extends:
> +    - .mediatek
> +  variables:
> +    DEVICE_TYPE: mt8173-elm-hana
> +    GPU_VERSION: mt8173
> +    RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
> +
> +mediatek:mt8183:
> +  extends:
> +    - .mediatek
> +  variables:
> +    DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
> +    GPU_VERSION: mt8183
> +    RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
> +
> +# drm-mtk doesn't even probe yet in mainline for mt8192
> +.mediatek:mt8192:
> +  extends:
> +    - .mediatek
> +  variables:
> +    DEVICE_TYPE: mt8192-asurada-spherion-r0
> +    GPU_VERSION: mt8192
> +    RUNNER_TAG: mesa-ci-x86-64-lava-mt8192-asurada-spherion-r0
> +
> +.meson:
> +  extends:
> +    - .lava-igt:arm64
> +  stage: meson
> +  variables:
> +    DRIVER_NAME: meson
> +    DTB: ${DEVICE_TYPE}
> +    BOOT_METHOD: u-boot
> +    KERNEL_IMAGE_TYPE: "image"
> +
> +meson:g12b:
> +  extends:
> +    - .meson
> +  variables:
> +    DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
> +    GPU_VERSION: g12b
> +    RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
> +
> +virtio_gpu:none:
> +  stage: virtio-gpu
> +  variables:
> +    CROSVM_GALLIUM_DRIVER: llvmpipe
> +    DRIVER_NAME: virtio_gpu
> +    GPU_VERSION: none
> +  extends:
> +    - .test-gl
> +  tags:
> +    - kvm
> +  script:
> +    - ln -sf $CI_PROJECT_DIR/install /install
> +    - mv install/bzImage /lava-files/bzImage
> +    - install/crosvm-runner.sh install/igt_runner.sh
> +  needs:
> +    - debian/x86_test-gl
> +    - testing:amd64
> +    - igt:amd64
> diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testlist.txt
> new file mode 100644
> index 000000000000..e90c3cfe5eed
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/testlist.txt
> @@ -0,0 +1,2763 @@
> +core_auth@basic-auth
> +core_auth@getclient-master-drop
> +core_auth@getclient-simple
> +core_auth@many-magics
> +core_getclient
> +core_getstats
> +core_getversion
> +core_setmaster_vs_auth
> +drm_read@empty-block
> +drm_read@empty-nonblock
> +drm_read@fault-buffer
> +drm_read@invalid-buffer
> +drm_read@short-buffer-block
> +drm_read@short-buffer-nonblock
> +gem_eio@banned
> +gem_eio@context-create
> +gem_eio@create
> +gem_eio@create-ext
> +gem_eio@execbuf
> +gem_eio@hibernate
> +gem_eio@in-flight-10ms
> +gem_eio@in-flight-1us
> +gem_eio@in-flight-contexts-10ms
> +gem_eio@in-flight-contexts-1us
> +gem_eio@in-flight-contexts-immediate
> +gem_eio@in-flight-external
> +gem_eio@in-flight-immediate
> +gem_eio@in-flight-internal-10ms
> +gem_eio@in-flight-internal-1us
> +gem_eio@in-flight-internal-immediate
> +gem_eio@kms
> +gem_eio@reset-stress
> +gem_eio@throttle
> +gem_eio@unwedge-stress
> +gem_eio@wait-10ms
> +gem_eio@wait-1us
> +gem_eio@wait-immediate
> +gem_eio@wait-wedge-10ms
> +gem_eio@wait-wedge-1us
> +gem_eio@wait-wedge-immediate
> +kms_3d
> +kms_addfb_basic@addfb25-4-tiled
> +kms_addfb_basic@addfb25-bad-modifier
> +kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
> +kms_addfb_basic@addfb25-modifier-no-flag
> +kms_addfb_basic@addfb25-x-tiled-legacy
> +kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
> +kms_addfb_basic@addfb25-yf-tiled-legacy
> +kms_addfb_basic@addfb25-y-tiled-legacy
> +kms_addfb_basic@addfb25-y-tiled-small-legacy
> +kms_addfb_basic@bad-pitch-0
> +kms_addfb_basic@bad-pitch-1024
> +kms_addfb_basic@bad-pitch-128
> +kms_addfb_basic@bad-pitch-256
> +kms_addfb_basic@bad-pitch-32
> +kms_addfb_basic@bad-pitch-63
> +kms_addfb_basic@bad-pitch-65536
> +kms_addfb_basic@bad-pitch-999
> +kms_addfb_basic@basic
> +kms_addfb_basic@basic-x-tiled-legacy
> +kms_addfb_basic@basic-y-tiled-legacy
> +kms_addfb_basic@bo-too-small
> +kms_addfb_basic@bo-too-small-due-to-tiling
> +kms_addfb_basic@clobberred-modifier
> +kms_addfb_basic@framebuffer-vs-set-tiling
> +kms_addfb_basic@invalid-get-prop
> +kms_addfb_basic@invalid-get-prop-any
> +kms_addfb_basic@invalid-set-prop
> +kms_addfb_basic@invalid-set-prop-any
> +kms_addfb_basic@invalid-smem-bo-on-discrete
> +kms_addfb_basic@legacy-format
> +kms_addfb_basic@master-rmfb
> +kms_addfb_basic@no-handle
> +kms_addfb_basic@size-max
> +kms_addfb_basic@small-bo
> +kms_addfb_basic@tile-pitch-mismatch
> +kms_addfb_basic@too-high
> +kms_addfb_basic@too-wide
> +kms_addfb_basic@unused-handle
> +kms_addfb_basic@unused-modifier
> +kms_addfb_basic@unused-offsets
> +kms_addfb_basic@unused-pitches
> +kms_async_flips@alternate-sync-async-flip
> +kms_async_flips@async-flip-with-page-flip-events
> +kms_async_flips@crc
> +kms_async_flips@invalid-async-flip
> +kms_async_flips@test-cursor
> +kms_async_flips@test-time-stamp
> +kms_atomic@atomic-invalid-params
> +kms_atomic@atomic_plane_damage
> +kms_atomic@crtc-invalid-params
> +kms_atomic@crtc-invalid-params-fence
> +kms_atomic_interruptible@atomic-setmode
> +kms_atomic_interruptible@legacy-cursor
> +kms_atomic_interruptible@legacy-dpms
> +kms_atomic_interruptible@legacy-pageflip
> +kms_atomic_interruptible@legacy-setmode
> +kms_atomic_interruptible@universal-setplane-cursor
> +kms_atomic_interruptible@universal-setplane-primary
> +kms_atomic@plane-cursor-legacy
> +kms_atomic@plane-immutable-zpos
> +kms_atomic@plane-invalid-params
> +kms_atomic@plane-invalid-params-fence
> +kms_atomic@plane-overlay-legacy
> +kms_atomic@plane-primary-legacy
> +kms_atomic@plane-primary-overlay-mutable-zpos
> +kms_atomic@test-only
> +kms_atomic_transition@plane-all-modeset-transition
> +kms_atomic_transition@plane-all-modeset-transition-fencing
> +kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels
> +kms_atomic_transition@plane-all-transition-fencing
> +kms_atomic_transition@plane-all-transition-nonblocking-fencing
> +kms_atomic_transition@plane-primary-toggle-with-vblank-wait
> +kms_atomic_transition@plane-use-after-nonblocking-unbind
> +kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing
> +kms_big_fb@4-tiled-16bpp-rotate-0
> +kms_big_fb@4-tiled-16bpp-rotate-180
> +kms_big_fb@4-tiled-16bpp-rotate-270
> +kms_big_fb@4-tiled-16bpp-rotate-90
> +kms_big_fb@4-tiled-32bpp-rotate-0
> +kms_big_fb@4-tiled-32bpp-rotate-180
> +kms_big_fb@4-tiled-32bpp-rotate-270
> +kms_big_fb@4-tiled-32bpp-rotate-90
> +kms_big_fb@4-tiled-64bpp-rotate-0
> +kms_big_fb@4-tiled-64bpp-rotate-180
> +kms_big_fb@4-tiled-64bpp-rotate-270
> +kms_big_fb@4-tiled-64bpp-rotate-90
> +kms_big_fb@4-tiled-8bpp-rotate-0
> +kms_big_fb@4-tiled-8bpp-rotate-180
> +kms_big_fb@4-tiled-8bpp-rotate-270
> +kms_big_fb@4-tiled-8bpp-rotate-90
> +kms_big_fb@4-tiled-addfb
> +kms_big_fb@4-tiled-addfb-size-offset-overflow
> +kms_big_fb@4-tiled-addfb-size-overflow
> +kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0
> +kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip
> +kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip
> +kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> +kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180
> +kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip
> +kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip
> +kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> +kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0
> +kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip
> +kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip
> +kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
> +kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180
> +kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip
> +kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip
> +kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> +kms_big_fb@linear-16bpp-rotate-180
> +kms_big_fb@linear-16bpp-rotate-270
> +kms_big_fb@linear-16bpp-rotate-90
> +kms_big_fb@linear-32bpp-rotate-270
> +kms_big_fb@linear-32bpp-rotate-90
> +kms_big_fb@linear-64bpp-rotate-0
> +kms_big_fb@linear-64bpp-rotate-180
> +kms_big_fb@linear-64bpp-rotate-270
> +kms_big_fb@linear-64bpp-rotate-90
> +kms_big_fb@linear-8bpp-rotate-0
> +kms_big_fb@linear-8bpp-rotate-180
> +kms_big_fb@linear-8bpp-rotate-270
> +kms_big_fb@linear-8bpp-rotate-90
> +kms_big_fb@linear-addfb
> +kms_big_fb@linear-max-hw-stride-32bpp-rotate-0
> +kms_big_fb@linear-max-hw-stride-32bpp-rotate-180
> +kms_big_fb@linear-max-hw-stride-64bpp-rotate-0
> +kms_big_fb@linear-max-hw-stride-64bpp-rotate-180
> +kms_big_fb@x-tiled-16bpp-rotate-0
> +kms_big_fb@x-tiled-16bpp-rotate-270
> +kms_big_fb@x-tiled-16bpp-rotate-90
> +kms_big_fb@x-tiled-32bpp-rotate-270
> +kms_big_fb@x-tiled-32bpp-rotate-90
> +kms_big_fb@x-tiled-64bpp-rotate-0
> +kms_big_fb@x-tiled-64bpp-rotate-180
> +kms_big_fb@x-tiled-64bpp-rotate-270
> +kms_big_fb@x-tiled-64bpp-rotate-90
> +kms_big_fb@x-tiled-8bpp-rotate-0
> +kms_big_fb@x-tiled-8bpp-rotate-180
> +kms_big_fb@x-tiled-8bpp-rotate-270
> +kms_big_fb@x-tiled-8bpp-rotate-90
> +kms_big_fb@x-tiled-addfb
> +kms_big_fb@x-tiled-addfb-size-offset-overflow
> +kms_big_fb@x-tiled-addfb-size-overflow
> +kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0
> +kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip
> +kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip
> +kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> +kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180
> +kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip
> +kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip
> +kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> +kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0
> +kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip
> +kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip
> +kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
> +kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180
> +kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip
> +kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip
> +kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> +kms_big_fb@yf-tiled-16bpp-rotate-180
> +kms_big_fb@yf-tiled-16bpp-rotate-270
> +kms_big_fb@yf-tiled-16bpp-rotate-90
> +kms_big_fb@yf-tiled-64bpp-rotate-0
> +kms_big_fb@yf-tiled-64bpp-rotate-180
> +kms_big_fb@yf-tiled-64bpp-rotate-270
> +kms_big_fb@yf-tiled-64bpp-rotate-90
> +kms_big_fb@yf-tiled-8bpp-rotate-0
> +kms_big_fb@yf-tiled-8bpp-rotate-180
> +kms_big_fb@yf-tiled-8bpp-rotate-270
> +kms_big_fb@yf-tiled-8bpp-rotate-90
> +kms_big_fb@yf-tiled-addfb
> +kms_big_fb@yf-tiled-addfb-size-offset-overflow
> +kms_big_fb@yf-tiled-addfb-size-overflow
> +kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0
> +kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip
> +kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip
> +kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> +kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180
> +kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip
> +kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip
> +kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> +kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0
> +kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip
> +kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip
> +kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
> +kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180
> +kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip
> +kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip
> +kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> +kms_big_fb@y-tiled-16bpp-rotate-0
> +kms_big_fb@y-tiled-16bpp-rotate-180
> +kms_big_fb@y-tiled-16bpp-rotate-270
> +kms_big_fb@y-tiled-16bpp-rotate-90
> +kms_big_fb@y-tiled-64bpp-rotate-0
> +kms_big_fb@y-tiled-64bpp-rotate-180
> +kms_big_fb@y-tiled-64bpp-rotate-270
> +kms_big_fb@y-tiled-64bpp-rotate-90
> +kms_big_fb@y-tiled-8bpp-rotate-0
> +kms_big_fb@y-tiled-8bpp-rotate-180
> +kms_big_fb@y-tiled-8bpp-rotate-270
> +kms_big_fb@y-tiled-8bpp-rotate-90
> +kms_big_fb@y-tiled-addfb
> +kms_big_fb@y-tiled-addfb-size-offset-overflow
> +kms_big_fb@y-tiled-addfb-size-overflow
> +kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0
> +kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip
> +kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip
> +kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> +kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180
> +kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip
> +kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip
> +kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> +kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0
> +kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip
> +kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip
> +kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
> +kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180
> +kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip
> +kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip
> +kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> +kms_big_joiner@2x-modeset
> +kms_big_joiner@basic
> +kms_big_joiner@invalid-modeset
> +kms_busy@basic
> +kms_busy@basic-hang
> +kms_busy@extended-pageflip-hang-oldfb
> +kms_bw@linear-tiling-1-displays-1920x1080p
> +kms_bw@linear-tiling-1-displays-2560x1440p
> +kms_bw@linear-tiling-1-displays-3840x2160p
> +kms_bw@linear-tiling-2-displays-1920x1080p
> +kms_bw@linear-tiling-2-displays-2560x1440p
> +kms_bw@linear-tiling-2-displays-3840x2160p
> +kms_bw@linear-tiling-3-displays-1920x1080p
> +kms_bw@linear-tiling-3-displays-2560x1440p
> +kms_bw@linear-tiling-3-displays-3840x2160p
> +kms_bw@linear-tiling-4-displays-1920x1080p
> +kms_bw@linear-tiling-4-displays-2560x1440p
> +kms_bw@linear-tiling-4-displays-3840x2160p
> +kms_bw@linear-tiling-5-displays-1920x1080p
> +kms_bw@linear-tiling-5-displays-2560x1440p
> +kms_bw@linear-tiling-5-displays-3840x2160p
> +kms_bw@linear-tiling-6-displays-1920x1080p
> +kms_bw@linear-tiling-6-displays-2560x1440p
> +kms_bw@linear-tiling-6-displays-3840x2160p
> +kms_ccs@pipe-A-bad-aux-stride-yf_tiled_ccs
> +kms_ccs@pipe-A-bad-aux-stride-y_tiled_ccs
> +kms_ccs@pipe-A-bad-aux-stride-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-A-bad-aux-stride-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-A-bad-aux-stride-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-A-bad-pixel-format-yf_tiled_ccs
> +kms_ccs@pipe-A-bad-pixel-format-y_tiled_ccs
> +kms_ccs@pipe-A-bad-pixel-format-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-A-bad-pixel-format-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-A-bad-pixel-format-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-A-bad-rotation-90-yf_tiled_ccs
> +kms_ccs@pipe-A-bad-rotation-90-y_tiled_ccs
> +kms_ccs@pipe-A-bad-rotation-90-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-A-bad-rotation-90-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-A-bad-rotation-90-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-A-ccs-on-another-bo-yf_tiled_ccs
> +kms_ccs@pipe-A-ccs-on-another-bo-y_tiled_ccs
> +kms_ccs@pipe-A-ccs-on-another-bo-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-A-ccs-on-another-bo-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-A-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-A-crc-primary-basic-yf_tiled_ccs
> +kms_ccs@pipe-A-crc-primary-basic-y_tiled_ccs
> +kms_ccs@pipe-A-crc-primary-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-A-crc-primary-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-A-crc-primary-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-A-crc-primary-rotation-180-yf_tiled_ccs
> +kms_ccs@pipe-A-crc-primary-rotation-180-y_tiled_ccs
> +kms_ccs@pipe-A-crc-primary-rotation-180-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-A-crc-primary-rotation-180-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-A-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-A-crc-sprite-planes-basic-yf_tiled_ccs
> +kms_ccs@pipe-A-crc-sprite-planes-basic-y_tiled_ccs
> +kms_ccs@pipe-A-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-A-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-A-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-A-missing-ccs-buffer-yf_tiled_ccs
> +kms_ccs@pipe-A-missing-ccs-buffer-y_tiled_ccs
> +kms_ccs@pipe-A-missing-ccs-buffer-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-A-missing-ccs-buffer-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-A-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-A-random-ccs-data-yf_tiled_ccs
> +kms_ccs@pipe-A-random-ccs-data-y_tiled_ccs
> +kms_ccs@pipe-A-random-ccs-data-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-A-random-ccs-data-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-A-random-ccs-data-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-B-bad-aux-stride-yf_tiled_ccs
> +kms_ccs@pipe-B-bad-aux-stride-y_tiled_ccs
> +kms_ccs@pipe-B-bad-aux-stride-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-B-bad-aux-stride-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-B-bad-aux-stride-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-B-bad-pixel-format-yf_tiled_ccs
> +kms_ccs@pipe-B-bad-pixel-format-y_tiled_ccs
> +kms_ccs@pipe-B-bad-pixel-format-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-B-bad-pixel-format-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-B-bad-pixel-format-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-B-bad-rotation-90-yf_tiled_ccs
> +kms_ccs@pipe-B-bad-rotation-90-y_tiled_ccs
> +kms_ccs@pipe-B-bad-rotation-90-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-B-bad-rotation-90-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-B-bad-rotation-90-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-B-ccs-on-another-bo-yf_tiled_ccs
> +kms_ccs@pipe-B-ccs-on-another-bo-y_tiled_ccs
> +kms_ccs@pipe-B-ccs-on-another-bo-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-B-ccs-on-another-bo-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-B-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-B-crc-primary-basic-yf_tiled_ccs
> +kms_ccs@pipe-B-crc-primary-basic-y_tiled_ccs
> +kms_ccs@pipe-B-crc-primary-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-B-crc-primary-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-B-crc-primary-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-B-crc-primary-rotation-180-yf_tiled_ccs
> +kms_ccs@pipe-B-crc-primary-rotation-180-y_tiled_ccs
> +kms_ccs@pipe-B-crc-primary-rotation-180-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-B-crc-primary-rotation-180-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-B-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-B-crc-sprite-planes-basic-yf_tiled_ccs
> +kms_ccs@pipe-B-crc-sprite-planes-basic-y_tiled_ccs
> +kms_ccs@pipe-B-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-B-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-B-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-B-missing-ccs-buffer-yf_tiled_ccs
> +kms_ccs@pipe-B-missing-ccs-buffer-y_tiled_ccs
> +kms_ccs@pipe-B-missing-ccs-buffer-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-B-missing-ccs-buffer-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-B-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-B-random-ccs-data-yf_tiled_ccs
> +kms_ccs@pipe-B-random-ccs-data-y_tiled_ccs
> +kms_ccs@pipe-B-random-ccs-data-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-B-random-ccs-data-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-B-random-ccs-data-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-C-bad-aux-stride-yf_tiled_ccs
> +kms_ccs@pipe-C-bad-aux-stride-y_tiled_ccs
> +kms_ccs@pipe-C-bad-aux-stride-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-C-bad-aux-stride-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-C-bad-aux-stride-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-C-bad-pixel-format-yf_tiled_ccs
> +kms_ccs@pipe-C-bad-pixel-format-y_tiled_ccs
> +kms_ccs@pipe-C-bad-pixel-format-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-C-bad-pixel-format-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-C-bad-pixel-format-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-C-bad-rotation-90-yf_tiled_ccs
> +kms_ccs@pipe-C-bad-rotation-90-y_tiled_ccs
> +kms_ccs@pipe-C-bad-rotation-90-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-C-bad-rotation-90-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-C-bad-rotation-90-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-C-ccs-on-another-bo-yf_tiled_ccs
> +kms_ccs@pipe-C-ccs-on-another-bo-y_tiled_ccs
> +kms_ccs@pipe-C-ccs-on-another-bo-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-C-ccs-on-another-bo-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-C-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-C-crc-primary-basic-yf_tiled_ccs
> +kms_ccs@pipe-C-crc-primary-basic-y_tiled_ccs
> +kms_ccs@pipe-C-crc-primary-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-C-crc-primary-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-C-crc-primary-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-C-crc-primary-rotation-180-yf_tiled_ccs
> +kms_ccs@pipe-C-crc-primary-rotation-180-y_tiled_ccs
> +kms_ccs@pipe-C-crc-primary-rotation-180-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-C-crc-primary-rotation-180-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-C-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-C-crc-sprite-planes-basic-yf_tiled_ccs
> +kms_ccs@pipe-C-crc-sprite-planes-basic-y_tiled_ccs
> +kms_ccs@pipe-C-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-C-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-C-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-C-missing-ccs-buffer-yf_tiled_ccs
> +kms_ccs@pipe-C-missing-ccs-buffer-y_tiled_ccs
> +kms_ccs@pipe-C-missing-ccs-buffer-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-C-missing-ccs-buffer-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-C-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-C-random-ccs-data-yf_tiled_ccs
> +kms_ccs@pipe-C-random-ccs-data-y_tiled_ccs
> +kms_ccs@pipe-C-random-ccs-data-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-C-random-ccs-data-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-C-random-ccs-data-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-D-bad-aux-stride-yf_tiled_ccs
> +kms_ccs@pipe-D-bad-aux-stride-y_tiled_ccs
> +kms_ccs@pipe-D-bad-aux-stride-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-D-bad-aux-stride-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-D-bad-aux-stride-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-D-bad-pixel-format-yf_tiled_ccs
> +kms_ccs@pipe-D-bad-pixel-format-y_tiled_ccs
> +kms_ccs@pipe-D-bad-pixel-format-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-D-bad-pixel-format-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-D-bad-pixel-format-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-D-bad-rotation-90-yf_tiled_ccs
> +kms_ccs@pipe-D-bad-rotation-90-y_tiled_ccs
> +kms_ccs@pipe-D-bad-rotation-90-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-D-bad-rotation-90-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-D-bad-rotation-90-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-D-ccs-on-another-bo-yf_tiled_ccs
> +kms_ccs@pipe-D-ccs-on-another-bo-y_tiled_ccs
> +kms_ccs@pipe-D-ccs-on-another-bo-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-D-ccs-on-another-bo-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-D-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-D-crc-primary-basic-yf_tiled_ccs
> +kms_ccs@pipe-D-crc-primary-basic-y_tiled_ccs
> +kms_ccs@pipe-D-crc-primary-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-D-crc-primary-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-D-crc-primary-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-D-crc-primary-rotation-180-yf_tiled_ccs
> +kms_ccs@pipe-D-crc-primary-rotation-180-y_tiled_ccs
> +kms_ccs@pipe-D-crc-primary-rotation-180-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-D-crc-primary-rotation-180-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-D-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-D-crc-sprite-planes-basic-yf_tiled_ccs
> +kms_ccs@pipe-D-crc-sprite-planes-basic-y_tiled_ccs
> +kms_ccs@pipe-D-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-D-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-D-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-D-missing-ccs-buffer-yf_tiled_ccs
> +kms_ccs@pipe-D-missing-ccs-buffer-y_tiled_ccs
> +kms_ccs@pipe-D-missing-ccs-buffer-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-D-missing-ccs-buffer-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-D-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-D-random-ccs-data-yf_tiled_ccs
> +kms_ccs@pipe-D-random-ccs-data-y_tiled_ccs
> +kms_ccs@pipe-D-random-ccs-data-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-D-random-ccs-data-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-D-random-ccs-data-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-E-bad-aux-stride-yf_tiled_ccs
> +kms_ccs@pipe-E-bad-aux-stride-y_tiled_ccs
> +kms_ccs@pipe-E-bad-aux-stride-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-E-bad-aux-stride-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-E-bad-aux-stride-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-E-bad-pixel-format-yf_tiled_ccs
> +kms_ccs@pipe-E-bad-pixel-format-y_tiled_ccs
> +kms_ccs@pipe-E-bad-pixel-format-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-E-bad-pixel-format-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-E-bad-pixel-format-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-E-bad-rotation-90-yf_tiled_ccs
> +kms_ccs@pipe-E-bad-rotation-90-y_tiled_ccs
> +kms_ccs@pipe-E-bad-rotation-90-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-E-bad-rotation-90-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-E-bad-rotation-90-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-E-ccs-on-another-bo-yf_tiled_ccs
> +kms_ccs@pipe-E-ccs-on-another-bo-y_tiled_ccs
> +kms_ccs@pipe-E-ccs-on-another-bo-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-E-ccs-on-another-bo-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-E-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-E-crc-primary-basic-yf_tiled_ccs
> +kms_ccs@pipe-E-crc-primary-basic-y_tiled_ccs
> +kms_ccs@pipe-E-crc-primary-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-E-crc-primary-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-E-crc-primary-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-E-crc-primary-rotation-180-yf_tiled_ccs
> +kms_ccs@pipe-E-crc-primary-rotation-180-y_tiled_ccs
> +kms_ccs@pipe-E-crc-primary-rotation-180-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-E-crc-primary-rotation-180-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-E-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-E-crc-sprite-planes-basic-yf_tiled_ccs
> +kms_ccs@pipe-E-crc-sprite-planes-basic-y_tiled_ccs
> +kms_ccs@pipe-E-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-E-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-E-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-E-missing-ccs-buffer-yf_tiled_ccs
> +kms_ccs@pipe-E-missing-ccs-buffer-y_tiled_ccs
> +kms_ccs@pipe-E-missing-ccs-buffer-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-E-missing-ccs-buffer-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-E-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-E-random-ccs-data-yf_tiled_ccs
> +kms_ccs@pipe-E-random-ccs-data-y_tiled_ccs
> +kms_ccs@pipe-E-random-ccs-data-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-E-random-ccs-data-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-E-random-ccs-data-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-F-bad-aux-stride-yf_tiled_ccs
> +kms_ccs@pipe-F-bad-aux-stride-y_tiled_ccs
> +kms_ccs@pipe-F-bad-aux-stride-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-F-bad-aux-stride-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-F-bad-aux-stride-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-F-bad-pixel-format-yf_tiled_ccs
> +kms_ccs@pipe-F-bad-pixel-format-y_tiled_ccs
> +kms_ccs@pipe-F-bad-pixel-format-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-F-bad-pixel-format-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-F-bad-pixel-format-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-F-bad-rotation-90-yf_tiled_ccs
> +kms_ccs@pipe-F-bad-rotation-90-y_tiled_ccs
> +kms_ccs@pipe-F-bad-rotation-90-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-F-bad-rotation-90-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-F-bad-rotation-90-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-F-ccs-on-another-bo-yf_tiled_ccs
> +kms_ccs@pipe-F-ccs-on-another-bo-y_tiled_ccs
> +kms_ccs@pipe-F-ccs-on-another-bo-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-F-ccs-on-another-bo-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-F-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-F-crc-primary-basic-yf_tiled_ccs
> +kms_ccs@pipe-F-crc-primary-basic-y_tiled_ccs
> +kms_ccs@pipe-F-crc-primary-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-F-crc-primary-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-F-crc-primary-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-F-crc-primary-rotation-180-yf_tiled_ccs
> +kms_ccs@pipe-F-crc-primary-rotation-180-y_tiled_ccs
> +kms_ccs@pipe-F-crc-primary-rotation-180-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-F-crc-primary-rotation-180-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-F-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-F-crc-sprite-planes-basic-yf_tiled_ccs
> +kms_ccs@pipe-F-crc-sprite-planes-basic-y_tiled_ccs
> +kms_ccs@pipe-F-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-F-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-F-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-F-missing-ccs-buffer-yf_tiled_ccs
> +kms_ccs@pipe-F-missing-ccs-buffer-y_tiled_ccs
> +kms_ccs@pipe-F-missing-ccs-buffer-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-F-missing-ccs-buffer-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-F-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc
> +kms_ccs@pipe-F-random-ccs-data-yf_tiled_ccs
> +kms_ccs@pipe-F-random-ccs-data-y_tiled_ccs
> +kms_ccs@pipe-F-random-ccs-data-y_tiled_gen12_mc_ccs
> +kms_ccs@pipe-F-random-ccs-data-y_tiled_gen12_rc_ccs
> +kms_ccs@pipe-F-random-ccs-data-y_tiled_gen12_rc_ccs_cc
> +kms_cdclk@mode-transition
> +kms_cdclk@plane-scaling
> +kms_color@pipe-A-ctm-0-25
> +kms_color@pipe-A-ctm-0-5
> +kms_color@pipe-A-ctm-0-75
> +kms_color@pipe-A-ctm-blue-to-red
> +kms_color@pipe-A-ctm-green-to-red
> +kms_color@pipe-A-ctm-max
> +kms_color@pipe-A-ctm-negative
> +kms_color@pipe-A-ctm-red-to-blue
> +kms_color@pipe-A-deep-color
> +kms_color@pipe-A-degamma
> +kms_color@pipe-A-gamma
> +kms_color@pipe-A-invalid-ctm-matrix-sizes
> +kms_color@pipe-A-invalid-degamma-lut-sizes
> +kms_color@pipe-A-invalid-gamma-lut-sizes
> +kms_color@pipe-A-legacy-gamma
> +kms_color@pipe-A-legacy-gamma-reset
> +kms_color@pipe-B-ctm-0-25
> +kms_color@pipe-B-ctm-0-5
> +kms_color@pipe-B-ctm-0-75
> +kms_color@pipe-B-ctm-blue-to-red
> +kms_color@pipe-B-ctm-green-to-red
> +kms_color@pipe-B-ctm-max
> +kms_color@pipe-B-ctm-negative
> +kms_color@pipe-B-ctm-red-to-blue
> +kms_color@pipe-B-deep-color
> +kms_color@pipe-B-degamma
> +kms_color@pipe-B-gamma
> +kms_color@pipe-B-invalid-ctm-matrix-sizes
> +kms_color@pipe-B-invalid-degamma-lut-sizes
> +kms_color@pipe-B-invalid-gamma-lut-sizes
> +kms_color@pipe-B-legacy-gamma
> +kms_color@pipe-B-legacy-gamma-reset
> +kms_color@pipe-C-ctm-0-25
> +kms_color@pipe-C-ctm-0-5
> +kms_color@pipe-C-ctm-0-75
> +kms_color@pipe-C-ctm-blue-to-red
> +kms_color@pipe-C-ctm-green-to-red
> +kms_color@pipe-C-ctm-max
> +kms_color@pipe-C-ctm-negative
> +kms_color@pipe-C-ctm-red-to-blue
> +kms_color@pipe-C-deep-color
> +kms_color@pipe-C-degamma
> +kms_color@pipe-C-gamma
> +kms_color@pipe-C-invalid-ctm-matrix-sizes
> +kms_color@pipe-C-invalid-degamma-lut-sizes
> +kms_color@pipe-C-invalid-gamma-lut-sizes
> +kms_color@pipe-C-legacy-gamma
> +kms_color@pipe-C-legacy-gamma-reset
> +kms_color@pipe-D-ctm-0-25
> +kms_color@pipe-D-ctm-0-5
> +kms_color@pipe-D-ctm-0-75
> +kms_color@pipe-D-ctm-blue-to-red
> +kms_color@pipe-D-ctm-green-to-red
> +kms_color@pipe-D-ctm-max
> +kms_color@pipe-D-ctm-negative
> +kms_color@pipe-D-ctm-red-to-blue
> +kms_color@pipe-D-deep-color
> +kms_color@pipe-D-degamma
> +kms_color@pipe-D-gamma
> +kms_color@pipe-D-invalid-ctm-matrix-sizes
> +kms_color@pipe-D-invalid-degamma-lut-sizes
> +kms_color@pipe-D-invalid-gamma-lut-sizes
> +kms_color@pipe-D-legacy-gamma
> +kms_color@pipe-D-legacy-gamma-reset
> +kms_color@pipe-E-ctm-0-25
> +kms_color@pipe-E-ctm-0-5
> +kms_color@pipe-E-ctm-0-75
> +kms_color@pipe-E-ctm-blue-to-red
> +kms_color@pipe-E-ctm-green-to-red
> +kms_color@pipe-E-ctm-max
> +kms_color@pipe-E-ctm-negative
> +kms_color@pipe-E-ctm-red-to-blue
> +kms_color@pipe-E-deep-color
> +kms_color@pipe-E-degamma
> +kms_color@pipe-E-gamma
> +kms_color@pipe-E-invalid-ctm-matrix-sizes
> +kms_color@pipe-E-invalid-degamma-lut-sizes
> +kms_color@pipe-E-invalid-gamma-lut-sizes
> +kms_color@pipe-E-legacy-gamma
> +kms_color@pipe-E-legacy-gamma-reset
> +kms_color@pipe-F-ctm-0-25
> +kms_color@pipe-F-ctm-0-5
> +kms_color@pipe-F-ctm-0-75
> +kms_color@pipe-F-ctm-blue-to-red
> +kms_color@pipe-F-ctm-green-to-red
> +kms_color@pipe-F-ctm-max
> +kms_color@pipe-F-ctm-negative
> +kms_color@pipe-F-ctm-red-to-blue
> +kms_color@pipe-F-deep-color
> +kms_color@pipe-F-degamma
> +kms_color@pipe-F-gamma
> +kms_color@pipe-F-invalid-ctm-matrix-sizes
> +kms_color@pipe-F-invalid-degamma-lut-sizes
> +kms_color@pipe-F-invalid-gamma-lut-sizes
> +kms_color@pipe-F-legacy-gamma
> +kms_color@pipe-F-legacy-gamma-reset
> +kms_concurrent@pipe-A
> +kms_concurrent@pipe-B
> +kms_concurrent@pipe-C
> +kms_concurrent@pipe-D
> +kms_concurrent@pipe-E
> +kms_concurrent@pipe-F
> +kms_content_protection@atomic
> +kms_content_protection@atomic-dpms
> +kms_content_protection@content_type_change
> +kms_content_protection@dp-mst-lic-type-0
> +kms_content_protection@dp-mst-lic-type-1
> +kms_content_protection@dp-mst-type-0
> +kms_content_protection@dp-mst-type-1
> +kms_content_protection@legacy
> +kms_content_protection@LIC
> +kms_content_protection@mei_interface
> +kms_content_protection@srm
> +kms_content_protection@type1
> +kms_content_protection@uevent
> +kms_cursor_crc@pipe-A-cursor-128x128-offscreen
> +kms_cursor_crc@pipe-A-cursor-128x128-onscreen
> +kms_cursor_crc@pipe-A-cursor-128x128-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-128x128-sliding
> +kms_cursor_crc@pipe-A-cursor-128x42-offscreen
> +kms_cursor_crc@pipe-A-cursor-128x42-onscreen
> +kms_cursor_crc@pipe-A-cursor-128x42-random
> +kms_cursor_crc@pipe-A-cursor-128x42-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-128x42-sliding
> +kms_cursor_crc@pipe-A-cursor-256x256-offscreen
> +kms_cursor_crc@pipe-A-cursor-256x256-onscreen
> +kms_cursor_crc@pipe-A-cursor-256x256-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-256x256-sliding
> +kms_cursor_crc@pipe-A-cursor-256x85-offscreen
> +kms_cursor_crc@pipe-A-cursor-256x85-onscreen
> +kms_cursor_crc@pipe-A-cursor-256x85-random
> +kms_cursor_crc@pipe-A-cursor-256x85-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-256x85-sliding
> +kms_cursor_crc@pipe-A-cursor-32x10-offscreen
> +kms_cursor_crc@pipe-A-cursor-32x10-onscreen
> +kms_cursor_crc@pipe-A-cursor-32x10-random
> +kms_cursor_crc@pipe-A-cursor-32x10-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-32x10-sliding
> +kms_cursor_crc@pipe-A-cursor-32x32-offscreen
> +kms_cursor_crc@pipe-A-cursor-32x32-onscreen
> +kms_cursor_crc@pipe-A-cursor-32x32-random
> +kms_cursor_crc@pipe-A-cursor-32x32-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-32x32-sliding
> +kms_cursor_crc@pipe-A-cursor-512x170-offscreen
> +kms_cursor_crc@pipe-A-cursor-512x170-onscreen
> +kms_cursor_crc@pipe-A-cursor-512x170-random
> +kms_cursor_crc@pipe-A-cursor-512x170-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-512x170-sliding
> +kms_cursor_crc@pipe-A-cursor-512x512-offscreen
> +kms_cursor_crc@pipe-A-cursor-512x512-onscreen
> +kms_cursor_crc@pipe-A-cursor-512x512-random
> +kms_cursor_crc@pipe-A-cursor-512x512-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-512x512-sliding
> +kms_cursor_crc@pipe-A-cursor-64x21-offscreen
> +kms_cursor_crc@pipe-A-cursor-64x21-onscreen
> +kms_cursor_crc@pipe-A-cursor-64x21-random
> +kms_cursor_crc@pipe-A-cursor-64x21-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-64x21-sliding
> +kms_cursor_crc@pipe-A-cursor-64x64-offscreen
> +kms_cursor_crc@pipe-A-cursor-64x64-onscreen
> +kms_cursor_crc@pipe-A-cursor-64x64-random
> +kms_cursor_crc@pipe-A-cursor-64x64-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-64x64-sliding
> +kms_cursor_crc@pipe-A-cursor-alpha-opaque
> +kms_cursor_crc@pipe-A-cursor-alpha-transparent
> +kms_cursor_crc@pipe-A-cursor-dpms
> +kms_cursor_crc@pipe-A-cursor-max-size-offscreen
> +kms_cursor_crc@pipe-A-cursor-max-size-onscreen
> +kms_cursor_crc@pipe-A-cursor-max-size-random
> +kms_cursor_crc@pipe-A-cursor-max-size-rapid-movement
> +kms_cursor_crc@pipe-A-cursor-max-size-sliding
> +kms_cursor_crc@pipe-A-cursor-size-change
> +kms_cursor_crc@pipe-B-cursor-128x128-offscreen
> +kms_cursor_crc@pipe-B-cursor-128x128-onscreen
> +kms_cursor_crc@pipe-B-cursor-128x128-random
> +kms_cursor_crc@pipe-B-cursor-128x128-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-128x128-sliding
> +kms_cursor_crc@pipe-B-cursor-128x42-offscreen
> +kms_cursor_crc@pipe-B-cursor-128x42-onscreen
> +kms_cursor_crc@pipe-B-cursor-128x42-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-128x42-sliding
> +kms_cursor_crc@pipe-B-cursor-256x256-offscreen
> +kms_cursor_crc@pipe-B-cursor-256x256-onscreen
> +kms_cursor_crc@pipe-B-cursor-256x256-random
> +kms_cursor_crc@pipe-B-cursor-256x256-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-256x256-sliding
> +kms_cursor_crc@pipe-B-cursor-256x85-offscreen
> +kms_cursor_crc@pipe-B-cursor-256x85-onscreen
> +kms_cursor_crc@pipe-B-cursor-256x85-random
> +kms_cursor_crc@pipe-B-cursor-256x85-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-256x85-sliding
> +kms_cursor_crc@pipe-B-cursor-32x10-offscreen
> +kms_cursor_crc@pipe-B-cursor-32x10-onscreen
> +kms_cursor_crc@pipe-B-cursor-32x10-random
> +kms_cursor_crc@pipe-B-cursor-32x10-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-32x10-sliding
> +kms_cursor_crc@pipe-B-cursor-32x32-offscreen
> +kms_cursor_crc@pipe-B-cursor-32x32-onscreen
> +kms_cursor_crc@pipe-B-cursor-32x32-random
> +kms_cursor_crc@pipe-B-cursor-32x32-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-32x32-sliding
> +kms_cursor_crc@pipe-B-cursor-512x170-offscreen
> +kms_cursor_crc@pipe-B-cursor-512x170-onscreen
> +kms_cursor_crc@pipe-B-cursor-512x170-random
> +kms_cursor_crc@pipe-B-cursor-512x170-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-512x170-sliding
> +kms_cursor_crc@pipe-B-cursor-512x512-offscreen
> +kms_cursor_crc@pipe-B-cursor-512x512-onscreen
> +kms_cursor_crc@pipe-B-cursor-512x512-random
> +kms_cursor_crc@pipe-B-cursor-512x512-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-512x512-sliding
> +kms_cursor_crc@pipe-B-cursor-64x21-offscreen
> +kms_cursor_crc@pipe-B-cursor-64x21-onscreen
> +kms_cursor_crc@pipe-B-cursor-64x21-random
> +kms_cursor_crc@pipe-B-cursor-64x21-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-64x64-offscreen
> +kms_cursor_crc@pipe-B-cursor-64x64-onscreen
> +kms_cursor_crc@pipe-B-cursor-64x64-random
> +kms_cursor_crc@pipe-B-cursor-64x64-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-64x64-sliding
> +kms_cursor_crc@pipe-B-cursor-alpha-opaque
> +kms_cursor_crc@pipe-B-cursor-alpha-transparent
> +kms_cursor_crc@pipe-B-cursor-dpms
> +kms_cursor_crc@pipe-B-cursor-max-size-offscreen
> +kms_cursor_crc@pipe-B-cursor-max-size-onscreen
> +kms_cursor_crc@pipe-B-cursor-max-size-random
> +kms_cursor_crc@pipe-B-cursor-max-size-rapid-movement
> +kms_cursor_crc@pipe-B-cursor-max-size-sliding
> +kms_cursor_crc@pipe-B-cursor-size-change
> +kms_cursor_crc@pipe-C-cursor-128x128-offscreen
> +kms_cursor_crc@pipe-C-cursor-128x128-onscreen
> +kms_cursor_crc@pipe-C-cursor-128x128-random
> +kms_cursor_crc@pipe-C-cursor-128x128-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-128x128-sliding
> +kms_cursor_crc@pipe-C-cursor-128x42-offscreen
> +kms_cursor_crc@pipe-C-cursor-128x42-onscreen
> +kms_cursor_crc@pipe-C-cursor-128x42-random
> +kms_cursor_crc@pipe-C-cursor-128x42-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-128x42-sliding
> +kms_cursor_crc@pipe-C-cursor-256x256-offscreen
> +kms_cursor_crc@pipe-C-cursor-256x256-onscreen
> +kms_cursor_crc@pipe-C-cursor-256x256-random
> +kms_cursor_crc@pipe-C-cursor-256x256-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-256x256-sliding
> +kms_cursor_crc@pipe-C-cursor-256x85-offscreen
> +kms_cursor_crc@pipe-C-cursor-256x85-onscreen
> +kms_cursor_crc@pipe-C-cursor-256x85-random
> +kms_cursor_crc@pipe-C-cursor-256x85-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-256x85-sliding
> +kms_cursor_crc@pipe-C-cursor-32x10-offscreen
> +kms_cursor_crc@pipe-C-cursor-32x10-onscreen
> +kms_cursor_crc@pipe-C-cursor-32x10-random
> +kms_cursor_crc@pipe-C-cursor-32x10-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-32x10-sliding
> +kms_cursor_crc@pipe-C-cursor-32x32-offscreen
> +kms_cursor_crc@pipe-C-cursor-32x32-onscreen
> +kms_cursor_crc@pipe-C-cursor-32x32-random
> +kms_cursor_crc@pipe-C-cursor-32x32-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-32x32-sliding
> +kms_cursor_crc@pipe-C-cursor-512x170-offscreen
> +kms_cursor_crc@pipe-C-cursor-512x170-onscreen
> +kms_cursor_crc@pipe-C-cursor-512x170-random
> +kms_cursor_crc@pipe-C-cursor-512x170-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-512x170-sliding
> +kms_cursor_crc@pipe-C-cursor-512x512-offscreen
> +kms_cursor_crc@pipe-C-cursor-512x512-onscreen
> +kms_cursor_crc@pipe-C-cursor-512x512-random
> +kms_cursor_crc@pipe-C-cursor-512x512-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-512x512-sliding
> +kms_cursor_crc@pipe-C-cursor-64x21-offscreen
> +kms_cursor_crc@pipe-C-cursor-64x21-onscreen
> +kms_cursor_crc@pipe-C-cursor-64x21-random
> +kms_cursor_crc@pipe-C-cursor-64x21-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-64x21-sliding
> +kms_cursor_crc@pipe-C-cursor-64x64-offscreen
> +kms_cursor_crc@pipe-C-cursor-64x64-onscreen
> +kms_cursor_crc@pipe-C-cursor-64x64-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-64x64-sliding
> +kms_cursor_crc@pipe-C-cursor-alpha-opaque
> +kms_cursor_crc@pipe-C-cursor-alpha-transparent
> +kms_cursor_crc@pipe-C-cursor-dpms
> +kms_cursor_crc@pipe-C-cursor-max-size-offscreen
> +kms_cursor_crc@pipe-C-cursor-max-size-onscreen
> +kms_cursor_crc@pipe-C-cursor-max-size-random
> +kms_cursor_crc@pipe-C-cursor-max-size-rapid-movement
> +kms_cursor_crc@pipe-C-cursor-max-size-sliding
> +kms_cursor_crc@pipe-C-cursor-size-change
> +kms_cursor_crc@pipe-D-cursor-128x128-offscreen
> +kms_cursor_crc@pipe-D-cursor-128x128-onscreen
> +kms_cursor_crc@pipe-D-cursor-128x128-random
> +kms_cursor_crc@pipe-D-cursor-128x128-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-128x128-sliding
> +kms_cursor_crc@pipe-D-cursor-128x42-offscreen
> +kms_cursor_crc@pipe-D-cursor-128x42-onscreen
> +kms_cursor_crc@pipe-D-cursor-128x42-random
> +kms_cursor_crc@pipe-D-cursor-128x42-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-128x42-sliding
> +kms_cursor_crc@pipe-D-cursor-256x256-offscreen
> +kms_cursor_crc@pipe-D-cursor-256x256-onscreen
> +kms_cursor_crc@pipe-D-cursor-256x256-random
> +kms_cursor_crc@pipe-D-cursor-256x256-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-256x256-sliding
> +kms_cursor_crc@pipe-D-cursor-256x85-offscreen
> +kms_cursor_crc@pipe-D-cursor-256x85-onscreen
> +kms_cursor_crc@pipe-D-cursor-256x85-random
> +kms_cursor_crc@pipe-D-cursor-256x85-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-256x85-sliding
> +kms_cursor_crc@pipe-D-cursor-32x10-offscreen
> +kms_cursor_crc@pipe-D-cursor-32x10-onscreen
> +kms_cursor_crc@pipe-D-cursor-32x10-random
> +kms_cursor_crc@pipe-D-cursor-32x10-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-32x10-sliding
> +kms_cursor_crc@pipe-D-cursor-32x32-offscreen
> +kms_cursor_crc@pipe-D-cursor-32x32-onscreen
> +kms_cursor_crc@pipe-D-cursor-32x32-random
> +kms_cursor_crc@pipe-D-cursor-32x32-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-32x32-sliding
> +kms_cursor_crc@pipe-D-cursor-512x170-offscreen
> +kms_cursor_crc@pipe-D-cursor-512x170-onscreen
> +kms_cursor_crc@pipe-D-cursor-512x170-random
> +kms_cursor_crc@pipe-D-cursor-512x170-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-512x170-sliding
> +kms_cursor_crc@pipe-D-cursor-512x512-offscreen
> +kms_cursor_crc@pipe-D-cursor-512x512-onscreen
> +kms_cursor_crc@pipe-D-cursor-512x512-random
> +kms_cursor_crc@pipe-D-cursor-512x512-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-512x512-sliding
> +kms_cursor_crc@pipe-D-cursor-64x21-offscreen
> +kms_cursor_crc@pipe-D-cursor-64x21-onscreen
> +kms_cursor_crc@pipe-D-cursor-64x21-random
> +kms_cursor_crc@pipe-D-cursor-64x21-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-64x21-sliding
> +kms_cursor_crc@pipe-D-cursor-64x64-offscreen
> +kms_cursor_crc@pipe-D-cursor-64x64-onscreen
> +kms_cursor_crc@pipe-D-cursor-64x64-random
> +kms_cursor_crc@pipe-D-cursor-64x64-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-64x64-sliding
> +kms_cursor_crc@pipe-D-cursor-alpha-opaque
> +kms_cursor_crc@pipe-D-cursor-alpha-transparent
> +kms_cursor_crc@pipe-D-cursor-dpms
> +kms_cursor_crc@pipe-D-cursor-max-size-offscreen
> +kms_cursor_crc@pipe-D-cursor-max-size-onscreen
> +kms_cursor_crc@pipe-D-cursor-max-size-random
> +kms_cursor_crc@pipe-D-cursor-max-size-rapid-movement
> +kms_cursor_crc@pipe-D-cursor-max-size-sliding
> +kms_cursor_crc@pipe-D-cursor-size-change
> +kms_cursor_crc@pipe-D-cursor-suspend
> +kms_cursor_crc@pipe-E-cursor-128x128-offscreen
> +kms_cursor_crc@pipe-E-cursor-128x128-onscreen
> +kms_cursor_crc@pipe-E-cursor-128x128-random
> +kms_cursor_crc@pipe-E-cursor-128x128-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-128x128-sliding
> +kms_cursor_crc@pipe-E-cursor-128x42-offscreen
> +kms_cursor_crc@pipe-E-cursor-128x42-onscreen
> +kms_cursor_crc@pipe-E-cursor-128x42-random
> +kms_cursor_crc@pipe-E-cursor-128x42-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-128x42-sliding
> +kms_cursor_crc@pipe-E-cursor-256x256-offscreen
> +kms_cursor_crc@pipe-E-cursor-256x256-onscreen
> +kms_cursor_crc@pipe-E-cursor-256x256-random
> +kms_cursor_crc@pipe-E-cursor-256x256-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-256x256-sliding
> +kms_cursor_crc@pipe-E-cursor-256x85-offscreen
> +kms_cursor_crc@pipe-E-cursor-256x85-onscreen
> +kms_cursor_crc@pipe-E-cursor-256x85-random
> +kms_cursor_crc@pipe-E-cursor-256x85-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-256x85-sliding
> +kms_cursor_crc@pipe-E-cursor-32x10-offscreen
> +kms_cursor_crc@pipe-E-cursor-32x10-onscreen
> +kms_cursor_crc@pipe-E-cursor-32x10-random
> +kms_cursor_crc@pipe-E-cursor-32x10-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-32x10-sliding
> +kms_cursor_crc@pipe-E-cursor-32x32-offscreen
> +kms_cursor_crc@pipe-E-cursor-32x32-onscreen
> +kms_cursor_crc@pipe-E-cursor-32x32-random
> +kms_cursor_crc@pipe-E-cursor-32x32-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-32x32-sliding
> +kms_cursor_crc@pipe-E-cursor-512x170-offscreen
> +kms_cursor_crc@pipe-E-cursor-512x170-onscreen
> +kms_cursor_crc@pipe-E-cursor-512x170-random
> +kms_cursor_crc@pipe-E-cursor-512x170-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-512x170-sliding
> +kms_cursor_crc@pipe-E-cursor-512x512-offscreen
> +kms_cursor_crc@pipe-E-cursor-512x512-onscreen
> +kms_cursor_crc@pipe-E-cursor-512x512-random
> +kms_cursor_crc@pipe-E-cursor-512x512-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-512x512-sliding
> +kms_cursor_crc@pipe-E-cursor-64x21-offscreen
> +kms_cursor_crc@pipe-E-cursor-64x21-onscreen
> +kms_cursor_crc@pipe-E-cursor-64x21-random
> +kms_cursor_crc@pipe-E-cursor-64x21-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-64x21-sliding
> +kms_cursor_crc@pipe-E-cursor-64x64-offscreen
> +kms_cursor_crc@pipe-E-cursor-64x64-onscreen
> +kms_cursor_crc@pipe-E-cursor-64x64-random
> +kms_cursor_crc@pipe-E-cursor-64x64-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-64x64-sliding
> +kms_cursor_crc@pipe-E-cursor-alpha-opaque
> +kms_cursor_crc@pipe-E-cursor-alpha-transparent
> +kms_cursor_crc@pipe-E-cursor-dpms
> +kms_cursor_crc@pipe-E-cursor-max-size-offscreen
> +kms_cursor_crc@pipe-E-cursor-max-size-onscreen
> +kms_cursor_crc@pipe-E-cursor-max-size-random
> +kms_cursor_crc@pipe-E-cursor-max-size-rapid-movement
> +kms_cursor_crc@pipe-E-cursor-max-size-sliding
> +kms_cursor_crc@pipe-E-cursor-size-change
> +kms_cursor_crc@pipe-E-cursor-suspend
> +kms_cursor_crc@pipe-F-cursor-128x128-offscreen
> +kms_cursor_crc@pipe-F-cursor-128x128-onscreen
> +kms_cursor_crc@pipe-F-cursor-128x128-random
> +kms_cursor_crc@pipe-F-cursor-128x128-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-128x128-sliding
> +kms_cursor_crc@pipe-F-cursor-128x42-offscreen
> +kms_cursor_crc@pipe-F-cursor-128x42-onscreen
> +kms_cursor_crc@pipe-F-cursor-128x42-random
> +kms_cursor_crc@pipe-F-cursor-128x42-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-128x42-sliding
> +kms_cursor_crc@pipe-F-cursor-256x256-offscreen
> +kms_cursor_crc@pipe-F-cursor-256x256-onscreen
> +kms_cursor_crc@pipe-F-cursor-256x256-random
> +kms_cursor_crc@pipe-F-cursor-256x256-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-256x256-sliding
> +kms_cursor_crc@pipe-F-cursor-256x85-offscreen
> +kms_cursor_crc@pipe-F-cursor-256x85-onscreen
> +kms_cursor_crc@pipe-F-cursor-256x85-random
> +kms_cursor_crc@pipe-F-cursor-256x85-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-256x85-sliding
> +kms_cursor_crc@pipe-F-cursor-32x10-offscreen
> +kms_cursor_crc@pipe-F-cursor-32x10-onscreen
> +kms_cursor_crc@pipe-F-cursor-32x10-random
> +kms_cursor_crc@pipe-F-cursor-32x10-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-32x10-sliding
> +kms_cursor_crc@pipe-F-cursor-32x32-offscreen
> +kms_cursor_crc@pipe-F-cursor-32x32-onscreen
> +kms_cursor_crc@pipe-F-cursor-32x32-random
> +kms_cursor_crc@pipe-F-cursor-32x32-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-32x32-sliding
> +kms_cursor_crc@pipe-F-cursor-512x170-offscreen
> +kms_cursor_crc@pipe-F-cursor-512x170-onscreen
> +kms_cursor_crc@pipe-F-cursor-512x170-random
> +kms_cursor_crc@pipe-F-cursor-512x170-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-512x170-sliding
> +kms_cursor_crc@pipe-F-cursor-512x512-offscreen
> +kms_cursor_crc@pipe-F-cursor-512x512-onscreen
> +kms_cursor_crc@pipe-F-cursor-512x512-random
> +kms_cursor_crc@pipe-F-cursor-512x512-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-512x512-sliding
> +kms_cursor_crc@pipe-F-cursor-64x21-offscreen
> +kms_cursor_crc@pipe-F-cursor-64x21-onscreen
> +kms_cursor_crc@pipe-F-cursor-64x21-random
> +kms_cursor_crc@pipe-F-cursor-64x21-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-64x21-sliding
> +kms_cursor_crc@pipe-F-cursor-64x64-offscreen
> +kms_cursor_crc@pipe-F-cursor-64x64-onscreen
> +kms_cursor_crc@pipe-F-cursor-64x64-random
> +kms_cursor_crc@pipe-F-cursor-64x64-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-64x64-sliding
> +kms_cursor_crc@pipe-F-cursor-alpha-opaque
> +kms_cursor_crc@pipe-F-cursor-alpha-transparent
> +kms_cursor_crc@pipe-F-cursor-dpms
> +kms_cursor_crc@pipe-F-cursor-max-size-offscreen
> +kms_cursor_crc@pipe-F-cursor-max-size-onscreen
> +kms_cursor_crc@pipe-F-cursor-max-size-random
> +kms_cursor_crc@pipe-F-cursor-max-size-rapid-movement
> +kms_cursor_crc@pipe-F-cursor-max-size-sliding
> +kms_cursor_crc@pipe-F-cursor-size-change
> +kms_cursor_crc@pipe-F-cursor-suspend
> +kms_cursor_legacy@2x-cursor-vs-flip-atomic
> +kms_cursor_legacy@2x-cursor-vs-flip-legacy
> +kms_cursor_legacy@2x-flip-vs-cursor-atomic
> +kms_cursor_legacy@2x-flip-vs-cursor-legacy
> +kms_cursor_legacy@2x-long-cursor-vs-flip-atomic
> +kms_cursor_legacy@2x-long-cursor-vs-flip-legacy
> +kms_cursor_legacy@2x-long-flip-vs-cursor-atomic
> +kms_cursor_legacy@2x-long-flip-vs-cursor-legacy
> +kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic
> +kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic
> +kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
> +kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
> +kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size
> +kms_cursor_legacy@basic-flip-after-cursor-atomic
> +kms_cursor_legacy@basic-flip-after-cursor-legacy
> +kms_cursor_legacy@basic-flip-after-cursor-varying-size
> +kms_cursor_legacy@basic-flip-before-cursor-atomic
> +kms_cursor_legacy@basic-flip-before-cursor-legacy
> +kms_cursor_legacy@basic-flip-before-cursor-varying-size
> +kms_cursor_legacy@cursorA-vs-flipB-atomic
> +kms_cursor_legacy@cursorA-vs-flipB-atomic-transitions
> +kms_cursor_legacy@cursorA-vs-flipB-atomic-transitions-varying-size
> +kms_cursor_legacy@cursorA-vs-flipB-legacy
> +kms_cursor_legacy@cursorA-vs-flipB-toggle
> +kms_cursor_legacy@cursorA-vs-flipB-varying-size
> +kms_cursor_legacy@cursorB-vs-flipA-atomic
> +kms_cursor_legacy@cursorB-vs-flipA-atomic-transitions
> +kms_cursor_legacy@cursorB-vs-flipA-atomic-transitions-varying-size
> +kms_cursor_legacy@cursorB-vs-flipA-legacy
> +kms_cursor_legacy@cursorB-vs-flipA-toggle
> +kms_cursor_legacy@cursorB-vs-flipA-varying-size
> +kms_cursor_legacy@cursorB-vs-flipB-atomic
> +kms_cursor_legacy@cursorB-vs-flipB-atomic-transitions
> +kms_cursor_legacy@cursorB-vs-flipB-atomic-transitions-varying-size
> +kms_cursor_legacy@cursorB-vs-flipB-legacy
> +kms_cursor_legacy@cursorB-vs-flipB-toggle
> +kms_cursor_legacy@cursorB-vs-flipB-varying-size
> +kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic
> +kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy
> +kms_cursor_legacy@flip-vs-cursor-crc-atomic
> +kms_cursor_legacy@flip-vs-cursor-crc-legacy
> +kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic
> +kms_cursor_legacy@pipe-E-forked-bo
> +kms_cursor_legacy@pipe-E-forked-move
> +kms_cursor_legacy@pipe-E-single-bo
> +kms_cursor_legacy@pipe-E-single-move
> +kms_cursor_legacy@pipe-E-torture-bo
> +kms_cursor_legacy@pipe-E-torture-move
> +kms_cursor_legacy@pipe-F-forked-bo
> +kms_cursor_legacy@pipe-F-forked-move
> +kms_cursor_legacy@pipe-F-single-bo
> +kms_cursor_legacy@pipe-F-single-move
> +kms_cursor_legacy@pipe-F-torture-bo
> +kms_cursor_legacy@pipe-F-torture-move
> +kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions
> +kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size
> +kms_cursor_legacy@short-busy-flip-before-cursor-toggle
> +kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
> +kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
> +kms_cursor_legacy@short-flip-after-cursor-toggle
> +kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
> +kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
> +kms_cursor_legacy@short-flip-before-cursor-toggle
> +kms_dither@FB-8BPC-Vs-Panel-6BPC
> +kms_dither@FB-8BPC-Vs-Panel-8BPC
> +kms_dp_aux_dev
> +kms_dp_tiled_display@basic-test-pattern
> +kms_draw_crc@draw-method-rgb565-blt-4tiled
> +kms_draw_crc@draw-method-rgb565-blt-untiled
> +kms_draw_crc@draw-method-rgb565-blt-xtiled
> +kms_draw_crc@draw-method-rgb565-blt-ytiled
> +kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled
> +kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled
> +kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled
> +kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled
> +kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled
> +kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled
> +kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled
> +kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled
> +kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled
> +kms_draw_crc@draw-method-rgb565-mmap-wc-untiled
> +kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled
> +kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled
> +kms_draw_crc@draw-method-rgb565-pwrite-4tiled
> +kms_draw_crc@draw-method-rgb565-pwrite-untiled
> +kms_draw_crc@draw-method-rgb565-pwrite-xtiled
> +kms_draw_crc@draw-method-rgb565-pwrite-ytiled
> +kms_draw_crc@draw-method-rgb565-render-4tiled
> +kms_draw_crc@draw-method-rgb565-render-untiled
> +kms_draw_crc@draw-method-rgb565-render-xtiled
> +kms_draw_crc@draw-method-rgb565-render-ytiled
> +kms_draw_crc@draw-method-xrgb2101010-blt-4tiled
> +kms_draw_crc@draw-method-xrgb2101010-blt-untiled
> +kms_draw_crc@draw-method-xrgb2101010-blt-xtiled
> +kms_draw_crc@draw-method-xrgb2101010-blt-ytiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled
> +kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled
> +kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled
> +kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled
> +kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled
> +kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled
> +kms_draw_crc@draw-method-xrgb2101010-render-4tiled
> +kms_draw_crc@draw-method-xrgb2101010-render-untiled
> +kms_draw_crc@draw-method-xrgb2101010-render-xtiled
> +kms_draw_crc@draw-method-xrgb2101010-render-ytiled
> +kms_draw_crc@draw-method-xrgb8888-blt-4tiled
> +kms_draw_crc@draw-method-xrgb8888-blt-untiled
> +kms_draw_crc@draw-method-xrgb8888-blt-xtiled
> +kms_draw_crc@draw-method-xrgb8888-blt-ytiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled
> +kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled
> +kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled
> +kms_draw_crc@draw-method-xrgb8888-pwrite-untiled
> +kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled
> +kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled
> +kms_draw_crc@draw-method-xrgb8888-render-4tiled
> +kms_draw_crc@draw-method-xrgb8888-render-untiled
> +kms_draw_crc@draw-method-xrgb8888-render-xtiled
> +kms_draw_crc@draw-method-xrgb8888-render-ytiled
> +kms_draw_crc@fill-fb
> +kms_dsc@basic-dsc-enable
> +kms_dsc@XRGB8888-dsc-compression
> +kms_fbcon_fbt@fbc
> +kms_fbcon_fbt@fbc-suspend
> +kms_fbcon_fbt@psr
> +kms_fbcon_fbt@psr-suspend
> +kms_fence_pin_leak
> +kms_flip@2x-absolute-wf_vblank
> +kms_flip@2x-absolute-wf_vblank-interruptible
> +kms_flip@2x-blocking-absolute-wf_vblank
> +kms_flip@2x-blocking-absolute-wf_vblank-interruptible
> +kms_flip@2x-blocking-wf_vblank
> +kms_flip@2x-busy-flip
> +kms_flip@2x-dpms-vs-vblank-race
> +kms_flip@2x-dpms-vs-vblank-race-interruptible
> +kms_flip@2x-flip-vs-absolute-wf_vblank
> +kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible
> +kms_flip@2x-flip-vs-blocking-wf-vblank
> +kms_flip@2x-flip-vs-dpms
> +kms_flip@2x-flip-vs-dpms-off-vs-modeset
> +kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible
> +kms_flip@2x-flip-vs-expired-vblank
> +kms_flip@2x-flip-vs-expired-vblank-interruptible
> +kms_flip@2x-flip-vs-fences
> +kms_flip@2x-flip-vs-fences-interruptible
> +kms_flip@2x-flip-vs-modeset
> +kms_flip@2x-flip-vs-modeset-vs-hang
> +kms_flip@2x-flip-vs-panning
> +kms_flip@2x-flip-vs-panning-interruptible
> +kms_flip@2x-flip-vs-panning-vs-hang
> +kms_flip@2x-flip-vs-rmfb
> +kms_flip@2x-flip-vs-rmfb-interruptible
> +kms_flip@2x-flip-vs-suspend
> +kms_flip@2x-flip-vs-suspend-interruptible
> +kms_flip@2x-flip-vs-wf_vblank
> +kms_flip@2x-flip-vs-wf_vblank-interruptible
> +kms_flip@2x-modeset-vs-vblank-race
> +kms_flip@2x-modeset-vs-vblank-race-interruptible
> +kms_flip@2x-nonexisting-fb
> +kms_flip@2x-nonexisting-fb-interruptible
> +kms_flip@2x-plain-flip
> +kms_flip@2x-plain-flip-fb-recreate
> +kms_flip@2x-plain-flip-fb-recreate-interruptible
> +kms_flip@2x-plain-flip-interruptible
> +kms_flip@2x-plain-flip-ts-check
> +kms_flip@2x-plain-flip-ts-check-interruptible
> +kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset
> +kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
> +kms_flip@2x-wf_vblank-ts-check
> +kms_flip@2x-wf_vblank-ts-check-interruptible
> +kms_flip@basic-plain-flip
> +kms_flip@busy-flip
> +kms_flip_event_leak
> +kms_flip@nonblocking-read
> +kms_flip@nonexisting-fb
> +kms_flip@nonexisting-fb-interruptible
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
> +kms_force_connector_basic@force-connector-state
> +kms_force_connector_basic@force-edid
> +kms_force_connector_basic@force-load-detect
> +kms_force_connector_basic@prune-stale-modes
> +kms_frontbuffer_tracking@basic
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@drrs-1p-rte
> +kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@drrs-2p-rte
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move
> +kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt
> +kms_frontbuffer_tracking@drrs-indfb-scaledprimary
> +kms_frontbuffer_tracking@drrs-modesetfrombusy
> +kms_frontbuffer_tracking@drrs-rgb101010-draw-blt
> +kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-rgb101010-draw-pwrite
> +kms_frontbuffer_tracking@drrs-rgb101010-draw-render
> +kms_frontbuffer_tracking@drrs-rgb565-draw-blt
> +kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-cpu
> +kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-gtt
> +kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc
> +kms_frontbuffer_tracking@drrs-rgb565-draw-pwrite
> +kms_frontbuffer_tracking@drrs-rgb565-draw-render
> +kms_frontbuffer_tracking@drrs-shrfb-scaledprimary
> +kms_frontbuffer_tracking@drrs-slowdraw
> +kms_frontbuffer_tracking@drrs-suspend
> +kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbc-1p-rte
> +kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbc-2p-rte
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbcdrrs-1p-rte
> +kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbcdrrs-2p-rte
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-badstride
> +kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary
> +kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy
> +kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt
> +kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-pwrite
> +kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render
> +kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary
> +kms_frontbuffer_tracking@fbcdrrs-slowdraw
> +kms_frontbuffer_tracking@fbcdrrs-stridechange
> +kms_frontbuffer_tracking@fbcdrrs-suspend
> +kms_frontbuffer_tracking@fbcdrrs-tiling-4
> +kms_frontbuffer_tracking@fbcdrrs-tiling-linear
> +kms_frontbuffer_tracking@fbcdrrs-tiling-y
> +kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt
> +kms_frontbuffer_tracking@fbc-indfb-scaledprimary
> +kms_frontbuffer_tracking@fbc-modesetfrombusy
> +kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsr-1p-rte
> +kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsr-2p-rte
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte
> +kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-rte
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-move
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-move
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-badstride
> +kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-indfb-scaledprimary
> +kms_frontbuffer_tracking@fbcpsrdrrs-modesetfrombusy
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-blt
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-render
> +kms_frontbuffer_tracking@fbcpsrdrrs-shrfb-scaledprimary
> +kms_frontbuffer_tracking@fbcpsrdrrs-slowdraw
> +kms_frontbuffer_tracking@fbcpsrdrrs-stridechange
> +kms_frontbuffer_tracking@fbcpsrdrrs-suspend
> +kms_frontbuffer_tracking@fbcpsrdrrs-tiling-4
> +kms_frontbuffer_tracking@fbcpsrdrrs-tiling-linear
> +kms_frontbuffer_tracking@fbcpsrdrrs-tiling-y
> +kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary
> +kms_frontbuffer_tracking@fbcpsr-modesetfrombusy
> +kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render
> +kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt
> +kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc
> +kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite
> +kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render
> +kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary
> +kms_frontbuffer_tracking@fbcpsr-stridechange
> +kms_frontbuffer_tracking@fbcpsr-tiling-4
> +kms_frontbuffer_tracking@fbcpsr-tiling-linear
> +kms_frontbuffer_tracking@fbcpsr-tiling-y
> +kms_frontbuffer_tracking@fbc-rgb101010-draw-blt
> +kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite
> +kms_frontbuffer_tracking@fbc-rgb101010-draw-render
> +kms_frontbuffer_tracking@fbc-rgb565-draw-blt
> +kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu
> +kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt
> +kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc
> +kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite
> +kms_frontbuffer_tracking@fbc-rgb565-draw-render
> +kms_frontbuffer_tracking@fbc-shrfb-scaledprimary
> +kms_frontbuffer_tracking@fbc-stridechange
> +kms_frontbuffer_tracking@fbc-tiling-4
> +kms_frontbuffer_tracking@fbc-tiling-linear
> +kms_frontbuffer_tracking@fbc-tiling-y
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@psr-1p-rte
> +kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@psr-2p-rte
> +kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move
> +kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move
> +kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-1p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@psrdrrs-1p-rte
> +kms_frontbuffer_tracking@psrdrrs-2p-pri-indfb-multidraw
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-move
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-move
> +kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@psrdrrs-2p-rte
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-move
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-onoff
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-msflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-pgflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-plflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-msflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-pgflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-plflip-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-render
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-fullscreen
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-move
> +kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-onoff
> +kms_frontbuffer_tracking@psrdrrs-farfromfence-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-indfb-scaledprimary
> +kms_frontbuffer_tracking@psrdrrs-modesetfrombusy
> +kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-render
> +kms_frontbuffer_tracking@psrdrrs-rgb565-draw-blt
> +kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu
> +kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-gtt
> +kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc
> +kms_frontbuffer_tracking@psrdrrs-rgb565-draw-pwrite
> +kms_frontbuffer_tracking@psrdrrs-rgb565-draw-render
> +kms_frontbuffer_tracking@psrdrrs-shrfb-scaledprimary
> +kms_frontbuffer_tracking@psrdrrs-slowdraw
> +kms_frontbuffer_tracking@psrdrrs-suspend
> +kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt
> +kms_frontbuffer_tracking@psr-indfb-scaledprimary
> +kms_frontbuffer_tracking@psr-modesetfrombusy
> +kms_frontbuffer_tracking@psr-rgb101010-draw-blt
> +kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite
> +kms_frontbuffer_tracking@psr-rgb101010-draw-render
> +kms_frontbuffer_tracking@psr-rgb565-draw-blt
> +kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu
> +kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt
> +kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc
> +kms_frontbuffer_tracking@psr-rgb565-draw-pwrite
> +kms_frontbuffer_tracking@psr-rgb565-draw-render
> +kms_frontbuffer_tracking@psr-shrfb-scaledprimary
> +kms_frontbuffer_tracking@psr-suspend
> +kms_getfb@getfb2-accept-ccs
> +kms_getfb@getfb2-handle-closed
> +kms_getfb@getfb2-handle-not-fb
> +kms_getfb@getfb2-handle-protection
> +kms_getfb@getfb2-handle-zero
> +kms_getfb@getfb2-into-addfb2
> +kms_getfb@getfb-addfb-different-handles
> +kms_getfb@getfb-handle-closed
> +kms_getfb@getfb-handle-not-fb
> +kms_getfb@getfb-handle-protection
> +kms_getfb@getfb-handle-valid
> +kms_getfb@getfb-handle-zero
> +kms_getfb@getfb-reject-ccs
> +kms_getfb@getfb-repeated-different-handles
> +kms_hdmi_inject@inject-audio
> +kms_hdr@bpc-switch
> +kms_hdr@bpc-switch-dpms
> +kms_hdr@bpc-switch-suspend
> +kms_hdr@static-swap
> +kms_hdr@static-toggle
> +kms_hdr@static-toggle-dpms
> +kms_hdr@static-toggle-suspend
> +kms_invalid_mode@bad-hsync-end
> +kms_invalid_mode@bad-hsync-start
> +kms_invalid_mode@bad-htotal
> +kms_invalid_mode@bad-vsync-end
> +kms_invalid_mode@bad-vsync-start
> +kms_invalid_mode@bad-vtotal
> +kms_invalid_mode@clock-too-high
> +kms_invalid_mode@int-max-clock
> +kms_invalid_mode@uint-max-clock
> +kms_invalid_mode@zero-clock
> +kms_invalid_mode@zero-hdisplay
> +kms_invalid_mode@zero-vdisplay
> +kms_legacy_colorkey
> +kms_multipipe_modeset@basic-max-pipe-crc-check
> +kms_panel_fitting@atomic-fastset
> +kms_panel_fitting@legacy
> +kms_pipe_b_c_ivb@disable-pipe-B-enable-pipe-C
> +kms_pipe_b_c_ivb@enable-pipe-C-while-B-has-3-lanes
> +kms_pipe_b_c_ivb@from-pipe-C-to-B-with-3-lanes
> +kms_pipe_b_c_ivb@pipe-B-double-modeset-then-modeset-pipe-C
> +kms_pipe_b_c_ivb@pipe-B-dpms-off-modeset-pipe-C
> +kms_pipe_crc_basic@bad-source
> +kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-A
> +kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-B
> +kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-C
> +kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-D
> +kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-E
> +kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-F
> +kms_pipe_crc_basic@disable-crc-after-crtc-pipe-A
> +kms_pipe_crc_basic@disable-crc-after-crtc-pipe-B
> +kms_pipe_crc_basic@disable-crc-after-crtc-pipe-C
> +kms_pipe_crc_basic@disable-crc-after-crtc-pipe-D
> +kms_pipe_crc_basic@disable-crc-after-crtc-pipe-E
> +kms_pipe_crc_basic@disable-crc-after-crtc-pipe-F
> +kms_pipe_crc_basic@hang-read-crc-pipe-A
> +kms_pipe_crc_basic@hang-read-crc-pipe-B
> +kms_pipe_crc_basic@hang-read-crc-pipe-C
> +kms_pipe_crc_basic@hang-read-crc-pipe-D
> +kms_pipe_crc_basic@hang-read-crc-pipe-E
> +kms_pipe_crc_basic@hang-read-crc-pipe-F
> +kms_pipe_crc_basic@nonblocking-crc-pipe-A
> +kms_pipe_crc_basic@nonblocking-crc-pipe-A-frame-sequence
> +kms_pipe_crc_basic@nonblocking-crc-pipe-B
> +kms_pipe_crc_basic@nonblocking-crc-pipe-B-frame-sequence
> +kms_pipe_crc_basic@nonblocking-crc-pipe-C
> +kms_pipe_crc_basic@nonblocking-crc-pipe-C-frame-sequence
> +kms_pipe_crc_basic@nonblocking-crc-pipe-D
> +kms_pipe_crc_basic@nonblocking-crc-pipe-D-frame-sequence
> +kms_pipe_crc_basic@nonblocking-crc-pipe-E
> +kms_pipe_crc_basic@nonblocking-crc-pipe-E-frame-sequence
> +kms_pipe_crc_basic@nonblocking-crc-pipe-F
> +kms_pipe_crc_basic@nonblocking-crc-pipe-F-frame-sequence
> +kms_pipe_crc_basic@read-crc-pipe-A
> +kms_pipe_crc_basic@read-crc-pipe-A-frame-sequence
> +kms_pipe_crc_basic@read-crc-pipe-B
> +kms_pipe_crc_basic@read-crc-pipe-B-frame-sequence
> +kms_pipe_crc_basic@read-crc-pipe-C
> +kms_pipe_crc_basic@read-crc-pipe-C-frame-sequence
> +kms_pipe_crc_basic@read-crc-pipe-D
> +kms_pipe_crc_basic@read-crc-pipe-D-frame-sequence
> +kms_pipe_crc_basic@read-crc-pipe-E
> +kms_pipe_crc_basic@read-crc-pipe-E-frame-sequence
> +kms_pipe_crc_basic@read-crc-pipe-F
> +kms_pipe_crc_basic@read-crc-pipe-F-frame-sequence
> +kms_pipe_crc_basic@suspend-read-crc-pipe-A
> +kms_pipe_crc_basic@suspend-read-crc-pipe-B
> +kms_pipe_crc_basic@suspend-read-crc-pipe-C
> +kms_pipe_crc_basic@suspend-read-crc-pipe-D
> +kms_pipe_crc_basic@suspend-read-crc-pipe-E
> +kms_pipe_crc_basic@suspend-read-crc-pipe-F
> +kms_plane_alpha_blend@pipe-A-alpha-7efc
> +kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-A-constant-alpha-max
> +kms_plane_alpha_blend@pipe-A-constant-alpha-mid
> +kms_plane_alpha_blend@pipe-A-constant-alpha-min
> +kms_plane_alpha_blend@pipe-A-coverage-vs-premult-vs-constant
> +kms_plane_alpha_blend@pipe-B-alpha-7efc
> +kms_plane_alpha_blend@pipe-B-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-B-constant-alpha-max
> +kms_plane_alpha_blend@pipe-B-constant-alpha-mid
> +kms_plane_alpha_blend@pipe-B-constant-alpha-min
> +kms_plane_alpha_blend@pipe-B-coverage-vs-premult-vs-constant
> +kms_plane_alpha_blend@pipe-C-alpha-7efc
> +kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-C-constant-alpha-max
> +kms_plane_alpha_blend@pipe-C-constant-alpha-mid
> +kms_plane_alpha_blend@pipe-C-constant-alpha-min
> +kms_plane_alpha_blend@pipe-C-coverage-vs-premult-vs-constant
> +kms_plane_alpha_blend@pipe-D-alpha-7efc
> +kms_plane_alpha_blend@pipe-D-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-D-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-D-constant-alpha-max
> +kms_plane_alpha_blend@pipe-D-constant-alpha-mid
> +kms_plane_alpha_blend@pipe-D-constant-alpha-min
> +kms_plane_alpha_blend@pipe-D-coverage-vs-premult-vs-constant
> +kms_plane_alpha_blend@pipe-E-alpha-7efc
> +kms_plane_alpha_blend@pipe-E-alpha-basic
> +kms_plane_alpha_blend@pipe-E-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-E-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-E-constant-alpha-max
> +kms_plane_alpha_blend@pipe-E-constant-alpha-mid
> +kms_plane_alpha_blend@pipe-E-constant-alpha-min
> +kms_plane_alpha_blend@pipe-E-coverage-7efc
> +kms_plane_alpha_blend@pipe-E-coverage-vs-premult-vs-constant
> +kms_plane_alpha_blend@pipe-F-alpha-7efc
> +kms_plane_alpha_blend@pipe-F-alpha-basic
> +kms_plane_alpha_blend@pipe-F-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-F-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-F-constant-alpha-max
> +kms_plane_alpha_blend@pipe-F-constant-alpha-mid
> +kms_plane_alpha_blend@pipe-F-constant-alpha-min
> +kms_plane_alpha_blend@pipe-F-coverage-7efc
> +kms_plane_alpha_blend@pipe-F-coverage-vs-premult-vs-constant
> +kms_plane_cursor@pipe-A-overlay-size-128
> +kms_plane_cursor@pipe-A-overlay-size-256
> +kms_plane_cursor@pipe-A-overlay-size-64
> +kms_plane_cursor@pipe-A-primary-size-128
> +kms_plane_cursor@pipe-A-primary-size-256
> +kms_plane_cursor@pipe-A-primary-size-64
> +kms_plane_cursor@pipe-A-viewport-size-128
> +kms_plane_cursor@pipe-A-viewport-size-256
> +kms_plane_cursor@pipe-A-viewport-size-64
> +kms_plane_cursor@pipe-B-overlay-size-128
> +kms_plane_cursor@pipe-B-overlay-size-256
> +kms_plane_cursor@pipe-B-overlay-size-64
> +kms_plane_cursor@pipe-B-primary-size-128
> +kms_plane_cursor@pipe-B-primary-size-256
> +kms_plane_cursor@pipe-B-primary-size-64
> +kms_plane_cursor@pipe-B-viewport-size-128
> +kms_plane_cursor@pipe-B-viewport-size-256
> +kms_plane_cursor@pipe-B-viewport-size-64
> +kms_plane_cursor@pipe-C-overlay-size-128
> +kms_plane_cursor@pipe-C-overlay-size-256
> +kms_plane_cursor@pipe-C-overlay-size-64
> +kms_plane_cursor@pipe-C-primary-size-128
> +kms_plane_cursor@pipe-C-primary-size-256
> +kms_plane_cursor@pipe-C-primary-size-64
> +kms_plane_cursor@pipe-C-viewport-size-128
> +kms_plane_cursor@pipe-C-viewport-size-256
> +kms_plane_cursor@pipe-C-viewport-size-64
> +kms_plane_cursor@pipe-D-overlay-size-128
> +kms_plane_cursor@pipe-D-overlay-size-256
> +kms_plane_cursor@pipe-D-overlay-size-64
> +kms_plane_cursor@pipe-D-primary-size-128
> +kms_plane_cursor@pipe-D-primary-size-256
> +kms_plane_cursor@pipe-D-primary-size-64
> +kms_plane_cursor@pipe-D-viewport-size-128
> +kms_plane_cursor@pipe-D-viewport-size-256
> +kms_plane_cursor@pipe-D-viewport-size-64
> +kms_plane_cursor@pipe-E-overlay-size-128
> +kms_plane_cursor@pipe-E-overlay-size-256
> +kms_plane_cursor@pipe-E-overlay-size-64
> +kms_plane_cursor@pipe-E-primary-size-128
> +kms_plane_cursor@pipe-E-primary-size-256
> +kms_plane_cursor@pipe-E-primary-size-64
> +kms_plane_cursor@pipe-E-viewport-size-128
> +kms_plane_cursor@pipe-E-viewport-size-256
> +kms_plane_cursor@pipe-E-viewport-size-64
> +kms_plane_cursor@pipe-F-overlay-size-128
> +kms_plane_cursor@pipe-F-overlay-size-256
> +kms_plane_cursor@pipe-F-overlay-size-64
> +kms_plane_cursor@pipe-F-primary-size-128
> +kms_plane_cursor@pipe-F-primary-size-256
> +kms_plane_cursor@pipe-F-primary-size-64
> +kms_plane_cursor@pipe-F-viewport-size-128
> +kms_plane_cursor@pipe-F-viewport-size-256
> +kms_plane_cursor@pipe-F-viewport-size-64
> +kms_plane_lowres@pipe-A-tiling-4
> +kms_plane_lowres@pipe-A-tiling-none
> +kms_plane_lowres@pipe-A-tiling-x
> +kms_plane_lowres@pipe-A-tiling-y
> +kms_plane_lowres@pipe-A-tiling-yf
> +kms_plane_lowres@pipe-B-tiling-4
> +kms_plane_lowres@pipe-B-tiling-none
> +kms_plane_lowres@pipe-B-tiling-x
> +kms_plane_lowres@pipe-B-tiling-y
> +kms_plane_lowres@pipe-B-tiling-yf
> +kms_plane_lowres@pipe-C-tiling-4
> +kms_plane_lowres@pipe-C-tiling-none
> +kms_plane_lowres@pipe-C-tiling-x
> +kms_plane_lowres@pipe-C-tiling-y
> +kms_plane_lowres@pipe-C-tiling-yf
> +kms_plane_lowres@pipe-D-tiling-4
> +kms_plane_lowres@pipe-D-tiling-none
> +kms_plane_lowres@pipe-D-tiling-x
> +kms_plane_lowres@pipe-D-tiling-y
> +kms_plane_lowres@pipe-D-tiling-yf
> +kms_plane_lowres@pipe-E-tiling-4
> +kms_plane_lowres@pipe-E-tiling-none
> +kms_plane_lowres@pipe-E-tiling-x
> +kms_plane_lowres@pipe-E-tiling-y
> +kms_plane_lowres@pipe-E-tiling-yf
> +kms_plane_lowres@pipe-F-tiling-4
> +kms_plane_lowres@pipe-F-tiling-none
> +kms_plane_lowres@pipe-F-tiling-x
> +kms_plane_lowres@pipe-F-tiling-y
> +kms_plane_lowres@pipe-F-tiling-yf
> +kms_plane_multiple@atomic-pipe-A-tiling-4
> +kms_plane_multiple@atomic-pipe-A-tiling-none
> +kms_plane_multiple@atomic-pipe-A-tiling-x
> +kms_plane_multiple@atomic-pipe-A-tiling-y
> +kms_plane_multiple@atomic-pipe-A-tiling-yf
> +kms_plane_multiple@atomic-pipe-B-tiling-4
> +kms_plane_multiple@atomic-pipe-B-tiling-none
> +kms_plane_multiple@atomic-pipe-B-tiling-x
> +kms_plane_multiple@atomic-pipe-B-tiling-y
> +kms_plane_multiple@atomic-pipe-B-tiling-yf
> +kms_plane_multiple@atomic-pipe-C-tiling-4
> +kms_plane_multiple@atomic-pipe-C-tiling-none
> +kms_plane_multiple@atomic-pipe-C-tiling-x
> +kms_plane_multiple@atomic-pipe-C-tiling-y
> +kms_plane_multiple@atomic-pipe-C-tiling-yf
> +kms_plane_multiple@atomic-pipe-D-tiling-4
> +kms_plane_multiple@atomic-pipe-D-tiling-none
> +kms_plane_multiple@atomic-pipe-D-tiling-x
> +kms_plane_multiple@atomic-pipe-D-tiling-y
> +kms_plane_multiple@atomic-pipe-D-tiling-yf
> +kms_plane_multiple@atomic-pipe-E-tiling-4
> +kms_plane_multiple@atomic-pipe-E-tiling-none
> +kms_plane_multiple@atomic-pipe-E-tiling-x
> +kms_plane_multiple@atomic-pipe-E-tiling-y
> +kms_plane_multiple@atomic-pipe-E-tiling-yf
> +kms_plane_multiple@atomic-pipe-F-tiling-4
> +kms_plane_multiple@atomic-pipe-F-tiling-none
> +kms_plane_multiple@atomic-pipe-F-tiling-x
> +kms_plane_multiple@atomic-pipe-F-tiling-y
> +kms_plane_multiple@atomic-pipe-F-tiling-yf
> +kms_plane@plane-panning-bottom-right
> +kms_plane@plane-panning-top-left
> +kms_plane_scaling@2x-scaler-multi-pipe
> +kms_plane_scaling@downscale-with-modifier-factor-0-25
> +kms_plane_scaling@downscale-with-rotation-factor-0-25
> +kms_plane_scaling@invalid-num-scalers
> +kms_plane_scaling@planes-downscale-factor-0-25
> +kms_plane_scaling@planes-downscale-factor-0-5
> +kms_plane_scaling@planes-downscale-factor-0-75
> +kms_plane_scaling@planes-scaling-unity-scaling
> +kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25
> +kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5
> +kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75
> +kms_plane_scaling@planes-upscale-20x20
> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25
> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75
> +kms_plane_scaling@planes-upscale-factor-0-25
> +kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25
> +kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5
> +kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75
> +kms_plane_scaling@upscale-with-modifier-20x20
> +kms_plane_scaling@upscale-with-modifier-factor-0-25
> +kms_plane_scaling@upscale-with-pixel-format-20x20
> +kms_plane_scaling@upscale-with-pixel-format-factor-0-25
> +kms_plane_scaling@upscale-with-rotation-20x20
> +kms_prime@basic-crc
> +kms_prop_blob@basic
> +kms_prop_blob@blob-multiple
> +kms_prop_blob@blob-prop-core
> +kms_prop_blob@blob-prop-lifetime
> +kms_prop_blob@blob-prop-validate
> +kms_prop_blob@invalid-get-prop
> +kms_prop_blob@invalid-get-prop-any
> +kms_prop_blob@invalid-set-prop
> +kms_prop_blob@invalid-set-prop-any
> +kms_properties@connector-properties-atomic
> +kms_properties@crtc-properties-atomic
> +kms_properties@crtc-properties-legacy
> +kms_properties@get_properties-sanity-atomic
> +kms_properties@get_properties-sanity-non-atomic
> +kms_properties@invalid-properties-atomic
> +kms_properties@invalid-properties-legacy
> +kms_properties@plane-properties-atomic
> +kms_properties@plane-properties-legacy
> +kms_psr2_sf@cursor-plane-move-continuous-sf
> +kms_psr2_sf@cursor-plane-update-sf
> +kms_psr2_sf@overlay-plane-move-continuous-sf
> +kms_psr2_sf@overlay-plane-update-continuous-sf
> +kms_psr2_sf@overlay-plane-update-sf-dmg-area
> +kms_psr2_sf@overlay-primary-update-sf-dmg-area
> +kms_psr2_sf@plane-move-sf-dmg-area
> +kms_psr2_sf@primary-plane-update-sf-dmg-area
> +kms_psr2_su@frontbuffer-XRGB8888
> +kms_psr2_su@page_flip-NV12
> +kms_psr2_su@page_flip-P010
> +kms_psr2_su@page_flip-XRGB8888
> +kms_psr@basic
> +kms_psr@cursor_blt
> +kms_psr@cursor_mmap_cpu
> +kms_psr@cursor_mmap_gtt
> +kms_psr@cursor_plane_move
> +kms_psr@cursor_plane_onoff
> +kms_psr@cursor_render
> +kms_psr@dpms
> +kms_psr@no_drrs
> +kms_psr@primary_blt
> +kms_psr@primary_mmap_cpu
> +kms_psr@primary_mmap_gtt
> +kms_psr@primary_page_flip
> +kms_psr@primary_render
> +kms_psr@psr2_basic
> +kms_psr@psr2_cursor_blt
> +kms_psr@psr2_cursor_mmap_cpu
> +kms_psr@psr2_cursor_mmap_gtt
> +kms_psr@psr2_cursor_plane_move
> +kms_psr@psr2_cursor_plane_onoff
> +kms_psr@psr2_cursor_render
> +kms_psr@psr2_dpms
> +kms_psr@psr2_no_drrs
> +kms_psr@psr2_primary_blt
> +kms_psr@psr2_primary_mmap_cpu
> +kms_psr@psr2_primary_mmap_gtt
> +kms_psr@psr2_primary_page_flip
> +kms_psr@psr2_primary_render
> +kms_psr@psr2_sprite_blt
> +kms_psr@psr2_sprite_mmap_cpu
> +kms_psr@psr2_sprite_mmap_gtt
> +kms_psr@psr2_sprite_plane_move
> +kms_psr@psr2_sprite_plane_onoff
> +kms_psr@psr2_sprite_render
> +kms_psr@psr2_suspend
> +kms_psr@sprite_blt
> +kms_psr@sprite_mmap_cpu
> +kms_psr@sprite_mmap_gtt
> +kms_psr@sprite_plane_move
> +kms_psr@sprite_plane_onoff
> +kms_psr@sprite_render
> +kms_psr@suspend
> +kms_pwrite_crc
> +kms_rmfb@close-fd
> +kms_rmfb@rmfb-ioctl
> +kms_rotation_crc@bad-pixel-format
> +kms_rotation_crc@bad-tiling
> +kms_rotation_crc@cursor-rotation-180
> +kms_rotation_crc@exhaust-fences
> +kms_rotation_crc@primary-4-tiled-reflect-x-0
> +kms_rotation_crc@primary-4-tiled-reflect-x-180
> +kms_rotation_crc@primary-rotation-180
> +kms_rotation_crc@primary-x-tiled-reflect-x-0
> +kms_rotation_crc@primary-x-tiled-reflect-x-180
> +kms_rotation_crc@primary-yf-tiled-reflect-x-0
> +kms_rotation_crc@primary-yf-tiled-reflect-x-180
> +kms_rotation_crc@primary-yf-tiled-reflect-x-270
> +kms_rotation_crc@primary-yf-tiled-reflect-x-90
> +kms_rotation_crc@primary-y-tiled-reflect-x-0
> +kms_rotation_crc@primary-y-tiled-reflect-x-180
> +kms_rotation_crc@primary-y-tiled-reflect-x-270
> +kms_rotation_crc@primary-y-tiled-reflect-x-90
> +kms_rotation_crc@sprite-rotation-180
> +kms_scaling_modes@scaling-mode-center
> +kms_scaling_modes@scaling-mode-full
> +kms_scaling_modes@scaling-mode-full-aspect
> +kms_scaling_modes@scaling-mode-none
> +kms_selftest@all
> +kms_setmode@basic-clone-single-crtc
> +kms_setmode@clone-exclusive-crtc
> +kms_setmode@invalid-clone-exclusive-crtc
> +kms_setmode@invalid-clone-single-crtc
> +kms_setmode@invalid-clone-single-crtc-stealing
> +kms_sysfs_edid_timing
> +kms_tv_load_detect@load-detect
> +kms_universal_plane@cursor-fb-leak-pipe-A
> +kms_universal_plane@cursor-fb-leak-pipe-B
> +kms_universal_plane@cursor-fb-leak-pipe-C
> +kms_universal_plane@cursor-fb-leak-pipe-D
> +kms_universal_plane@cursor-fb-leak-pipe-E
> +kms_universal_plane@cursor-fb-leak-pipe-F
> +kms_universal_plane@disable-primary-vs-flip-pipe-A
> +kms_universal_plane@disable-primary-vs-flip-pipe-B
> +kms_universal_plane@disable-primary-vs-flip-pipe-C
> +kms_universal_plane@disable-primary-vs-flip-pipe-D
> +kms_universal_plane@disable-primary-vs-flip-pipe-E
> +kms_universal_plane@disable-primary-vs-flip-pipe-F
> +kms_universal_plane@universal-plane-gen9-features-pipe-A
> +kms_universal_plane@universal-plane-gen9-features-pipe-B
> +kms_universal_plane@universal-plane-gen9-features-pipe-C
> +kms_universal_plane@universal-plane-gen9-features-pipe-D
> +kms_universal_plane@universal-plane-gen9-features-pipe-E
> +kms_universal_plane@universal-plane-gen9-features-pipe-F
> +kms_universal_plane@universal-plane-pipe-A-functional
> +kms_universal_plane@universal-plane-pipe-A-sanity
> +kms_universal_plane@universal-plane-pipe-B-functional
> +kms_universal_plane@universal-plane-pipe-B-sanity
> +kms_universal_plane@universal-plane-pipe-C-functional
> +kms_universal_plane@universal-plane-pipe-C-sanity
> +kms_universal_plane@universal-plane-pipe-D-functional
> +kms_universal_plane@universal-plane-pipe-D-sanity
> +kms_universal_plane@universal-plane-pipe-E-functional
> +kms_universal_plane@universal-plane-pipe-E-sanity
> +kms_universal_plane@universal-plane-pipe-F-functional
> +kms_universal_plane@universal-plane-pipe-F-sanity
> +kms_vblank@crtc-id
> +kms_vblank@invalid
> +kms_vblank@pipe-A-accuracy-idle
> +kms_vblank@pipe-A-query-busy
> +kms_vblank@pipe-A-query-forked
> +kms_vblank@pipe-A-query-forked-busy
> +kms_vblank@pipe-A-query-idle
> +kms_vblank@pipe-A-ts-continuation-idle
> +kms_vblank@pipe-A-ts-continuation-modeset
> +kms_vblank@pipe-A-ts-continuation-suspend
> +kms_vblank@pipe-A-wait-busy
> +kms_vblank@pipe-A-wait-forked
> +kms_vblank@pipe-A-wait-forked-busy
> +kms_vblank@pipe-A-wait-idle
> +kms_vblank@pipe-B-accuracy-idle
> +kms_vblank@pipe-B-query-busy
> +kms_vblank@pipe-B-query-forked
> +kms_vblank@pipe-B-query-forked-busy
> +kms_vblank@pipe-B-query-idle
> +kms_vblank@pipe-B-ts-continuation-dpms-suspend
> +kms_vblank@pipe-B-ts-continuation-idle
> +kms_vblank@pipe-B-ts-continuation-modeset
> +kms_vblank@pipe-B-ts-continuation-suspend
> +kms_vblank@pipe-B-wait-busy
> +kms_vblank@pipe-B-wait-forked
> +kms_vblank@pipe-B-wait-forked-busy
> +kms_vblank@pipe-B-wait-idle
> +kms_vblank@pipe-C-accuracy-idle
> +kms_vblank@pipe-C-query-busy
> +kms_vblank@pipe-C-query-forked
> +kms_vblank@pipe-C-query-forked-busy
> +kms_vblank@pipe-C-query-idle
> +kms_vblank@pipe-C-ts-continuation-dpms-suspend
> +kms_vblank@pipe-C-ts-continuation-idle
> +kms_vblank@pipe-C-ts-continuation-modeset
> +kms_vblank@pipe-C-ts-continuation-suspend
> +kms_vblank@pipe-C-wait-busy
> +kms_vblank@pipe-C-wait-forked
> +kms_vblank@pipe-C-wait-forked-busy
> +kms_vblank@pipe-C-wait-idle
> +kms_vblank@pipe-D-accuracy-idle
> +kms_vblank@pipe-D-query-busy
> +kms_vblank@pipe-D-query-forked
> +kms_vblank@pipe-D-query-forked-busy
> +kms_vblank@pipe-D-query-idle
> +kms_vblank@pipe-D-ts-continuation-dpms-suspend
> +kms_vblank@pipe-D-ts-continuation-idle
> +kms_vblank@pipe-D-ts-continuation-modeset
> +kms_vblank@pipe-D-ts-continuation-suspend
> +kms_vblank@pipe-D-wait-busy
> +kms_vblank@pipe-D-wait-forked
> +kms_vblank@pipe-D-wait-forked-busy
> +kms_vblank@pipe-D-wait-idle
> +kms_vblank@pipe-E-accuracy-idle
> +kms_vblank@pipe-E-query-busy
> +kms_vblank@pipe-E-query-busy-hang
> +kms_vblank@pipe-E-query-forked
> +kms_vblank@pipe-E-query-forked-busy
> +kms_vblank@pipe-E-query-forked-busy-hang
> +kms_vblank@pipe-E-query-forked-hang
> +kms_vblank@pipe-E-query-idle
> +kms_vblank@pipe-E-query-idle-hang
> +kms_vblank@pipe-E-ts-continuation-dpms-rpm
> +kms_vblank@pipe-E-ts-continuation-dpms-suspend
> +kms_vblank@pipe-E-ts-continuation-idle
> +kms_vblank@pipe-E-ts-continuation-idle-hang
> +kms_vblank@pipe-E-ts-continuation-modeset
> +kms_vblank@pipe-E-ts-continuation-modeset-hang
> +kms_vblank@pipe-E-ts-continuation-modeset-rpm
> +kms_vblank@pipe-E-ts-continuation-suspend
> +kms_vblank@pipe-E-wait-busy
> +kms_vblank@pipe-E-wait-busy-hang
> +kms_vblank@pipe-E-wait-forked
> +kms_vblank@pipe-E-wait-forked-busy
> +kms_vblank@pipe-E-wait-forked-busy-hang
> +kms_vblank@pipe-E-wait-forked-hang
> +kms_vblank@pipe-E-wait-idle
> +kms_vblank@pipe-E-wait-idle-hang
> +kms_vblank@pipe-F-accuracy-idle
> +kms_vblank@pipe-F-query-busy
> +kms_vblank@pipe-F-query-busy-hang
> +kms_vblank@pipe-F-query-forked
> +kms_vblank@pipe-F-query-forked-busy
> +kms_vblank@pipe-F-query-forked-busy-hang
> +kms_vblank@pipe-F-query-forked-hang
> +kms_vblank@pipe-F-query-idle
> +kms_vblank@pipe-F-query-idle-hang
> +kms_vblank@pipe-F-ts-continuation-dpms-rpm
> +kms_vblank@pipe-F-ts-continuation-dpms-suspend
> +kms_vblank@pipe-F-ts-continuation-idle
> +kms_vblank@pipe-F-ts-continuation-idle-hang
> +kms_vblank@pipe-F-ts-continuation-modeset
> +kms_vblank@pipe-F-ts-continuation-modeset-hang
> +kms_vblank@pipe-F-ts-continuation-modeset-rpm
> +kms_vblank@pipe-F-ts-continuation-suspend
> +kms_vblank@pipe-F-wait-busy
> +kms_vblank@pipe-F-wait-busy-hang
> +kms_vblank@pipe-F-wait-forked
> +kms_vblank@pipe-F-wait-forked-busy
> +kms_vblank@pipe-F-wait-forked-busy-hang
> +kms_vblank@pipe-F-wait-forked-hang
> +kms_vblank@pipe-F-wait-idle
> +kms_vblank@pipe-F-wait-idle-hang
> +kms_vrr@flip-basic
> +kms_vrr@flip-dpms
> +kms_vrr@flipline
> +kms_vrr@flip-suspend
> +kms_writeback@writeback-check-output
> +kms_writeback@writeback-fb-id
> +kms_writeback@writeback-invalid-parameters
> +kms_writeback@writeback-pixel-formats
> +prime_mmap_kms@buffer-sharing
> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> new file mode 100644
> index 000000000000..8f2cec020bed
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/x86_64.config
> @@ -0,0 +1,105 @@
> +CONFIG_LOCALVERSION_AUTO=y
> +CONFIG_DEBUG_KERNEL=y
> +
> +CONFIG_PWM=y
> +CONFIG_PM_DEVFREQ=y
> +CONFIG_OF=y
> +CONFIG_CROS_EC=y
> +
> +# abootimg with a 'dummy' rootfs fails with root=/dev/nfs
> +CONFIG_BLK_DEV_INITRD=n
> +
> +CONFIG_DEVFREQ_GOV_PERFORMANCE=y
> +CONFIG_DEVFREQ_GOV_POWERSAVE=y
> +CONFIG_DEVFREQ_GOV_USERSPACE=y
> +CONFIG_DEVFREQ_GOV_PASSIVE=y
> +
> +CONFIG_DRM=y
> +CONFIG_DRM_PANEL_SIMPLE=y
> +CONFIG_PWM_CROS_EC=y
> +CONFIG_BACKLIGHT_PWM=y
> +
> +# Strip out some stuff we don't need for graphics testing, to reduce
> +# the build.
> +CONFIG_CAN=n
> +CONFIG_WIRELESS=n
> +CONFIG_RFKILL=n
> +CONFIG_WLAN=n
> +
> +CONFIG_REGULATOR_FAN53555=y
> +CONFIG_REGULATOR=y
> +
> +CONFIG_REGULATOR_VCTRL=y
> +
> +CONFIG_KASAN=n
> +CONFIG_KASAN_INLINE=n
> +CONFIG_STACKTRACE=n
> +
> +CONFIG_TMPFS=y
> +
> +CONFIG_PROVE_LOCKING=n
> +CONFIG_DEBUG_LOCKDEP=n
> +CONFIG_SOFTLOCKUP_DETECTOR=y
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> +
> +CONFIG_DETECT_HUNG_TASK=y
> +
> +CONFIG_USB_USBNET=y
> +CONFIG_NETDEVICES=y
> +CONFIG_USB_NET_DRIVERS=y
> +CONFIG_USB_RTL8152=y
> +CONFIG_USB_NET_AX8817X=y
> +CONFIG_USB_NET_SMSC95XX=y
> +CONFIG_USB_GADGET=y
> +CONFIG_USB_ETH=y
> +
> +CONFIG_FW_LOADER_COMPRESS=y
> +
> +# options for AMD devices
> +CONFIG_X86_AMD_PLATFORM_DEVICE=y
> +CONFIG_ACPI_VIDEO=y
> +CONFIG_X86_AMD_FREQ_SENSITIVITY=y
> +CONFIG_PINCTRL=y
> +CONFIG_PINCTRL_AMD=y
> +CONFIG_DRM_AMDGPU=m
> +CONFIG_DRM_AMDGPU_SI=y
> +CONFIG_DRM_AMDGPU_USERPTR=y
> +CONFIG_DRM_AMD_ACP=n
> +CONFIG_ACPI_WMI=y
> +CONFIG_MXM_WMI=y
> +CONFIG_PARPORT=y
> +CONFIG_PARPORT_PC=y
> +CONFIG_PARPORT_SERIAL=y
> +CONFIG_SERIAL_8250_DW=y
> +CONFIG_CHROME_PLATFORMS=y
> +CONFIG_KVM_AMD=m
> +
> +#options for Intel devices
> +CONFIG_MFD_INTEL_LPSS_PCI=y
> +CONFIG_KVM_INTEL=m
> +
> +#options for KVM guests
> +CONFIG_FUSE_FS=y
> +CONFIG_HYPERVISOR_GUEST=y
> +CONFIG_KVM=y
> +CONFIG_KVM_GUEST=y
> +CONFIG_VIRT_DRIVERS=y
> +CONFIG_VIRTIO_FS=y
> +CONFIG_DRM_VIRTIO_GPU=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_VIRTIO_NET=y
> +CONFIG_VIRTIO_CONSOLE=y
> +CONFIG_PARAVIRT=y
> +CONFIG_VIRTIO_BLK=y
> +CONFIG_VIRTUALIZATION=y
> +CONFIG_VIRTIO=y
> +CONFIG_VIRTIO_PCI=y
> +CONFIG_VIRTIO_MMIO=y
> +CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
> +CONFIG_CRYPTO_DEV_VIRTIO=y
> +CONFIG_HW_RANDOM_VIRTIO=y
> +CONFIG_BLK_MQ_VIRTIO=y
> +CONFIG_TUN=y
> +CONFIG_VSOCKETS=y
> +CONFIG_VIRTIO_VSOCKETS=y
> +CONFIG_VHOST_VSOCK=m
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> new file mode 100644
> index 000000000000..b596e5bf5348
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> @@ -0,0 +1,19 @@
> +kms_bw@linear-tiling-1-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> +kms_cursor_crc@pipe-A-cursor-size-change,Fail
> +kms_cursor_crc@pipe-B-cursor-size-change,Fail
> +kms_hdr@bpc-switch,Fail
> +kms_hdr@bpc-switch-dpms,Fail
> +kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
> +kms_rotation_crc@primary-rotation-180,Fail
> +kms_universal_plane@disable-primary-vs-flip-pipe-B,Fail
> +kms_async_flips@alternate-sync-async-flip,Fail
> +kms_async_flips@async-flip-with-page-flip-events,Fail
> +kms_async_flips@crc,Fail
> +kms_async_flips@invalid-async-flip,Fail
> +kms_async_flips@test-cursor,Fail
> +kms_async_flips@test-time-stamp,Fail
> +kms_addfb_basic@bad-pitch-65536,Fail
> +kms_addfb_basic@bo-too-small,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
> new file mode 100644
> index 000000000000..200706d8742b
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
> @@ -0,0 +1,15 @@
> +kms_addfb_basic@too-high
> +kms_atomic_transition@plane-all-modeset-transition-internal-panels
> +kms_atomic_transition@plane-all-transition
> +kms_atomic_transition@plane-use-after-nonblocking-unbind
> +kms_bw@linear-tiling-1-displays-1920x1080p
> +kms_bw@linear-tiling-2-displays-1920x1080p
> +kms_bw@linear-tiling-2-displays-2560x1440p
> +kms_bw@linear-tiling-3-displays-2560x1440p
> +kms_bw@linear-tiling-3-displays-3840x2160p
> +kms_cursor_crc@pipe-A-cursor-alpha-opaque
> +kms_cursor_crc@pipe-B-cursor-alpha-opaque
> +kms_plane_multiple@atomic-pipe-B-tiling-none
> +kms_plane@pixel-format
> +kms_plane_scaling@downscale-with-rotation-factor-0-5
> +kms_universal_plane@disable-primary-vs-flip-pipe-A
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> new file mode 100644
> index 000000000000..e2c538a0f954
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> @@ -0,0 +1,2 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
> new file mode 100644
> index 000000000000..67d78f10b671
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
> @@ -0,0 +1,32 @@
> +kms_bw@linear-tiling-2-displays-1920x1080p
> +kms_bw@linear-tiling-2-displays-2560x1440p
> +kms_bw@linear-tiling-2-displays-3840x2160p
> +kms_bw@linear-tiling-3-displays-1920x1080p
> +kms_bw@linear-tiling-3-displays-2560x1440p
> +kms_bw@linear-tiling-3-displays-3840x2160p
> +kms_bw@linear-tiling-4-displays-1920x1080p
> +kms_bw@linear-tiling-4-displays-2560x1440p
> +kms_bw@linear-tiling-4-displays-3840x2160p
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
> +kms_plane_alpha_blend@pipe-A-alpha-basic
> +kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-A-constant-alpha-max
> +kms_plane_alpha_blend@pipe-B-alpha-basic
> +kms_plane_alpha_blend@pipe-B-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-B-constant-alpha-max
> +kms_plane_alpha_blend@pipe-C-alpha-basic
> +kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-C-constant-alpha-max
> +kms_sysfs_edid_timing
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> new file mode 100644
> index 000000000000..e2c538a0f954
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> @@ -0,0 +1,2 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
> new file mode 100644
> index 000000000000..a077f29d5cba
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
> @@ -0,0 +1,29 @@
> +kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-4-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-4-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-4-displays-3840x2160p,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
> +kms_plane_alpha_blend@pipe-A-alpha-opaque-fb,Fail
> +kms_plane_alpha_blend@pipe-A-alpha-transparent-fb,Fail
> +kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
> +kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
> +kms_plane_alpha_blend@pipe-B-alpha-transparent-fb,Fail
> +kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
> +kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
> +kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
> +kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
> +kms_sysfs_edid_timing,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
> new file mode 100644
> index 000000000000..618bbe6bb793
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
> @@ -0,0 +1 @@
> +kms_frontbuffer_tracking@fbc-tiling-linear
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> new file mode 100644
> index 000000000000..e2c538a0f954
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> @@ -0,0 +1,2 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> new file mode 100644
> index 000000000000..13ba297273d0
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> @@ -0,0 +1,37 @@
> +kms_bw@linear-tiling-2-displays-1920x1080p
> +kms_bw@linear-tiling-2-displays-2560x1440p
> +kms_bw@linear-tiling-2-displays-3840x2160p
> +kms_bw@linear-tiling-3-displays-1920x1080p
> +kms_bw@linear-tiling-3-displays-2560x1440p
> +kms_bw@linear-tiling-3-displays-3840x2160p
> +kms_bw@linear-tiling-4-displays-1920x1080p
> +kms_bw@linear-tiling-4-displays-2560x1440p
> +kms_bw@linear-tiling-4-displays-3840x2160p
> +kms_flip@flip-vs-suspend
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
> +kms_hdr@bpc-switch-suspend
> +kms_plane_alpha_blend@pipe-A-alpha-basic
> +kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-A-constant-alpha-max
> +kms_plane_alpha_blend@pipe-B-alpha-basic
> +kms_plane_alpha_blend@pipe-B-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-B-constant-alpha-max
> +kms_plane_alpha_blend@pipe-C-alpha-basic
> +kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-C-constant-alpha-max
> +kms_psr2_su@page_flip-NV12
> +kms_psr2_su@page_flip-P010
> +kms_setmode@basic
> +kms_draw_crc@draw-method-xrgb8888-render-xtiled
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
> new file mode 100644
> index 000000000000..aedb3d2ef885
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
> @@ -0,0 +1,40 @@
> +kms_bw@linear-tiling-1-displays-3840x2160p
> +kms_bw@linear-tiling-2-displays-1920x1080p
> +kms_bw@linear-tiling-2-displays-2560x1440p
> +kms_bw@linear-tiling-2-displays-3840x2160p
> +kms_bw@linear-tiling-3-displays-1920x1080p
> +kms_bw@linear-tiling-3-displays-2560x1440p
> +kms_bw@linear-tiling-3-displays-3840x2160p
> +kms_bw@linear-tiling-4-displays-1920x1080p
> +kms_bw@linear-tiling-4-displays-2560x1440p
> +kms_bw@linear-tiling-4-displays-3840x2160p
> +kms_flip@blocking-wf_vblank
> +kms_flip@wf_vblank-ts-check
> +kms_flip@wf_vblank-ts-check-interruptible
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
> +kms_frontbuffer_tracking@fbc-tiling-linear
> +kms_plane_alpha_blend@pipe-A-alpha-basic
> +kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-A-constant-alpha-max
> +kms_plane_alpha_blend@pipe-B-alpha-basic
> +kms_plane_alpha_blend@pipe-B-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-B-constant-alpha-max
> +kms_plane_alpha_blend@pipe-C-alpha-basic
> +kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-C-constant-alpha-max
> +kms_rotation_crc@multiplane-rotation
> +kms_rotation_crc@multiplane-rotation-cropping-bottom
> +kms_rotation_crc@multiplane-rotation-cropping-top
> +kms_setmode@basic
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> new file mode 100644
> index 000000000000..e2c538a0f954
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> @@ -0,0 +1,2 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
> new file mode 100644
> index 000000000000..f81f065e27e8
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
> @@ -0,0 +1,8 @@
> +kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-4-displays-2560x1440p,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
> +kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
> +kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
> +kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
> new file mode 100644
> index 000000000000..752d0d9a5280
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
> @@ -0,0 +1,25 @@
> +kms_bw@linear-tiling-2-displays-1920x1080p
> +kms_bw@linear-tiling-2-displays-3840x2160p
> +kms_bw@linear-tiling-3-displays-1920x1080p
> +kms_bw@linear-tiling-3-displays-2560x1440p
> +kms_bw@linear-tiling-3-displays-3840x2160p
> +kms_bw@linear-tiling-4-displays-1920x1080p
> +kms_bw@linear-tiling-4-displays-3840x2160p
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
> +kms_plane_alpha_blend@pipe-A-alpha-basic
> +kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-B-alpha-basic
> +kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
> +kms_plane_alpha_blend@pipe-B-constant-alpha-max
> +kms_plane_alpha_blend@pipe-C-alpha-basic
> +kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
> +kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
> +kms_sysfs_edid_timing
> +kms_async_flips@crc
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> new file mode 100644
> index 000000000000..e2c538a0f954
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> @@ -0,0 +1,2 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
> new file mode 100644
> index 000000000000..270644ce220c
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
> @@ -0,0 +1,19 @@
> +kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-4-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-4-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-4-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-5-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-5-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-5-displays-3840x2160p,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
> +kms_rotation_crc@bad-pixel-format,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
> new file mode 100644
> index 000000000000..e23d369bec89
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
> @@ -0,0 +1,5 @@
> +kms_draw_crc@.*
> +kms_flip@blocking-absolute-wf_vblank
> +kms_flip@bo-too-big-interruptible
> +kms_flip@flip-vs-rmfb-interruptible
> +kms_flip@busy-flip
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> new file mode 100644
> index 000000000000..14f33c7ba03b
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> @@ -0,0 +1,8 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> +
> +# GPU hangs, then the whole machine
> +gem_eio.*
> +
> +# Whole machine hangs
> +kms_flip@absolute-wf_vblank@a-edp1
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
> new file mode 100644
> index 000000000000..dbfedfa5d63f
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
> @@ -0,0 +1,30 @@
> +kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-4-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-4-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-4-displays-3840x2160p,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
> +kms_frontbuffer_tracking@fbc-tiling-linear,Fail
> +kms_plane_alpha_blend@pipe-A-alpha-opaque-fb,Fail
> +kms_plane_alpha_blend@pipe-A-alpha-transparent-fb,Fail
> +kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
> +kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
> +kms_plane_alpha_blend@pipe-B-alpha-transparent-fb,Fail
> +kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
> +kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
> +kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
> +kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
> +kms_sysfs_edid_timing,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
> new file mode 100644
> index 000000000000..6bcac5b84fbb
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
> @@ -0,0 +1 @@
> +kms_flip@flip-vs-suspend
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> new file mode 100644
> index 000000000000..7f74fb9afc99
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> @@ -0,0 +1,29 @@
> +kms_3d,Fail
> +kms_addfb_basic@addfb25-bad-modifier,Fail
> +kms_bw@linear-tiling-1-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-1-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> +kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
> +kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
> +kms_force_connector_basic@force-connector-state,Fail
> +kms_force_connector_basic@force-edid,Fail
> +kms_force_connector_basic@force-load-detect,Fail
> +kms_force_connector_basic@prune-stale-modes,Fail
> +kms_invalid_mode@int-max-clock,Fail
> +kms_plane_scaling@planes-upscale-20x20,Fail
> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
> +kms_plane_scaling@upscale-with-modifier-20x20,Fail
> +kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
> +kms_plane_scaling@upscale-with-rotation-20x20,Fail
> +kms_properties@get_properties-sanity-atomic,Fail
> +kms_properties@plane-properties-atomic,Fail
> +kms_properties@plane-properties-legacy,Fail
> +kms_rmfb@close-fd,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> new file mode 100644
> index 000000000000..6ff81d00e84e
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> @@ -0,0 +1,10 @@
> +kms_addfb_basic@addfb25-bad-modifier,Fail
> +kms_bw@linear-tiling-1-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> +kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
> +kms_plane_scaling@upscale-with-rotation-20x20,Fail
> +kms_rmfb@close-fd,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> new file mode 100644
> index 000000000000..208890b79eb0
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> @@ -0,0 +1,14 @@
> +core_setmaster_vs_auth
> +kms_bw@linear-tiling-1-displays-1920x1080p
> +kms_bw@linear-tiling-1-displays-3840x2160p
> +kms_bw@linear-tiling-3-displays-1920x1080p
> +kms_cursor_legacy@cursor-vs-flip-atomic
> +kms_plane_scaling@invalid-num-scalers
> +kms_plane_scaling@planes-upscale-20x20
> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
> +kms_plane_scaling@upscale-with-modifier-20x20
> +kms_plane_scaling@upscale-with-pixel-format-20x20
> +kms_prop_blob@invalid-set-prop-any
> +kms_properties@get_properties-sanity-atomic
> +kms_properties@plane-properties-atomic
> +kms_properties@plane-properties-legacy
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> new file mode 100644
> index 000000000000..345e1426b3a3
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> @@ -0,0 +1,5 @@
> +kms_3d,Fail
> +kms_addfb_basic@addfb25-bad-modifier,Fail
> +kms_properties@connector-properties-atomic,Fail
> +kms_properties@get_properties-sanity-atomic,Fail
> +kms_properties@get_properties-sanity-non-atomic,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
> new file mode 100644
> index 000000000000..b63329d06767
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
> @@ -0,0 +1,4 @@
> +kms_force_connector_basic@force-connector-state
> +kms_force_connector_basic@force-edid
> +kms_force_connector_basic@force-load-detect
> +kms_force_connector_basic@prune-stale-modes
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> new file mode 100644
> index 000000000000..16c2dfab3f16
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -0,0 +1,15 @@
> +kms_3d,Fail
> +kms_addfb_basic@addfb25-bad-modifier,Fail
> +kms_cursor_legacy@all-pipes-forked-move,Fail
> +kms_cursor_legacy@all-pipes-torture-bo,Fail
> +kms_cursor_legacy@all-pipes-forked-bo,Fail
> +kms_cursor_legacy@all-pipes-single-bo,Fail
> +kms_cursor_legacy@all-pipes-single-move,Fail
> +kms_cursor_legacy@all-pipes-torture-move,Fail
> +kms_cursor_legacy@pipe-A-forked-bo,Fail
> +kms_cursor_legacy@pipe-A-forked-move,Fail
> +kms_cursor_legacy@pipe-A-single-bo,Fail
> +kms_cursor_legacy@pipe-A-single-move,Fail
> +kms_cursor_legacy@pipe-A-torture-bo,Fail
> +kms_cursor_legacy@pipe-A-torture-move,Fail
> +kms_hdmi_inject@inject-4k,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> new file mode 100644
> index 000000000000..b63329d06767
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> @@ -0,0 +1,4 @@
> +kms_force_connector_basic@force-connector-state
> +kms_force_connector_basic@force-edid
> +kms_force_connector_basic@force-load-detect
> +kms_force_connector_basic@prune-stale-modes
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> new file mode 100644
> index 000000000000..88a1fc0a3b0d
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> @@ -0,0 +1,2 @@
> +kms_3d,Fail
> +kms_addfb_basic@addfb25-bad-modifier,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
> new file mode 100644
> index 000000000000..b63329d06767
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
> @@ -0,0 +1,4 @@
> +kms_force_connector_basic@force-connector-state
> +kms_force_connector_basic@force-edid
> +kms_force_connector_basic@force-load-detect
> +kms_force_connector_basic@prune-stale-modes
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> new file mode 100644
> index 000000000000..cd49c8ce2059
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> @@ -0,0 +1,2 @@
> +# Whole machine hangs
> +kms_cursor_legacy@all-pipes-torture-move
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
> new file mode 100644
> index 000000000000..cfa25fe97498
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
> @@ -0,0 +1,21 @@
> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> +kms_cursor_legacy@cursorA-vs-flipA-atomic-transitions,Crash
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail
> +kms_plane@plane-position-covered,Fail
> +kms_plane@plane-position-hole,Fail
> +kms_plane@plane-position-hole-dpms,Fail
> +kms_plane_alpha_blend@pipe-A-alpha-7efc,Fail
> +kms_plane_alpha_blend@pipe-A-coverage-7efc,Fail
> +kms_plane_alpha_blend@pipe-A-coverage-vs-premult-vs-constant,Fail
> +kms_plane_alpha_blend@pipe-B-alpha-7efc,Fail
> +kms_plane_alpha_blend@pipe-B-alpha-basic,Fail
> +kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
> +kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
> +kms_plane_alpha_blend@pipe-B-constant-alpha-mid,Fail
> +kms_plane_alpha_blend@pipe-B-coverage-7efc,Fail
> +kms_plane_alpha_blend@pipe-B-coverage-vs-premult-vs-constant,Fail
> +kms_rmfb@close-fd,Fail
> +kms_rotation_crc@primary-rotation-180,Fail
> +kms_universal_plane@disable-primary-vs-flip-pipe-B,Fail
> +kms_universal_plane@disable-primary-vs-flip-pipe-b,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
> new file mode 100644
> index 000000000000..b01aa5b35dce
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
> @@ -0,0 +1,6 @@
> +# Test ends up reading CRC from frame before cursor update
> +# sometimes.. tbd if this is a kernel CRC bug or a test
> +# bug
> +kms_cursor_crc@.*
> +
> +kms_plane_multiple@atomic-pipe-A-tiling-none
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
> new file mode 100644
> index 000000000000..410e0eeb3161
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
> @@ -0,0 +1,23 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> +
> +# Test incorrectly assumes that CTM support implies gamma/degamma
> +# LUT support.  None of the subtests handle the case of only having
> +# CTM support
> +kms_color.*
> +
> +# 4k@60 is not supported on this hw, but driver doesn't handle it
> +# too gracefully.. https://gitlab.freedesktop.org/drm/msm/-/issues/15
> +kms_bw@linear-tiling-.*-displays-3840x2160p
> +
> +# Until igt fix lands: https://patchwork.freedesktop.org/patch/493175/
> +kms_bw@linear-tiling-2.*
> +kms_bw@linear-tiling-3.*
> +kms_bw@linear-tiling-4.*
> +kms_bw@linear-tiling-5.*
> +kms_bw@linear-tiling-6.*
> +
> +# igt fix posted: https://patchwork.freedesktop.org/patch/499926/
> +# failure mode is flakey due to randomization but fails frequently
> +# enough to be detected as a Crash or occasionally UnexpectedPass.
> +kms_plane_multiple@atomic-pipe-A-tiling-none
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> new file mode 100644
> index 000000000000..e07bb8c4216c
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> @@ -0,0 +1,43 @@
> +kms_color@pipe-A-ctm-0-25,Fail
> +kms_color@pipe-A-ctm-0-5,Fail
> +kms_color@pipe-A-ctm-0-75,Fail
> +kms_color@pipe-A-ctm-blue-to-red,Fail
> +kms_color@pipe-A-ctm-green-to-red,Fail
> +kms_color@pipe-A-ctm-max,Fail
> +kms_color@pipe-A-ctm-negative,Fail
> +kms_color@pipe-A-ctm-red-to-blue,Fail
> +kms_color@pipe-A-legacy-gamma,Fail
> +kms_cursor_legacy@basic-flip-after-cursor-atomic,Fail
> +kms_cursor_legacy@basic-flip-after-cursor-legacy,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
> +kms_cursor_legacy@cursor-vs-flip-atomic,Fail
> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions,Fail
> +kms_cursor_legacy@cursor-vs-flip-legacy,Fail
> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> +kms_cursor_legacy@flip-vs-cursor-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
> +kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> +kms_cursor_legacy@short-flip-after-cursor-atomic-transitions,Fail
> +kms_cursor_legacy@short-flip-after-cursor-toggle,Fail
> +kms_cursor_legacy@short-flip-before-cursor-atomic-transitions,Fail
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail
> +kms_plane_alpha_blend@pipe-A-alpha-7efc,Fail
> +kms_plane_alpha_blend@pipe-A-coverage-7efc,Fail
> +kms_plane_alpha_blend@pipe-A-coverage-vs-premult-vs-constant,Fail
> +kms_plane_cursor@pipe-A-overlay-size-128,Fail
> +kms_plane_cursor@pipe-A-overlay-size-256,Fail
> +kms_plane_cursor@pipe-A-overlay-size-64,Fail
> +kms_plane_cursor@pipe-A-viewport-size-128,Fail
> +kms_plane_cursor@pipe-A-viewport-size-256,Fail
> +kms_plane_cursor@pipe-A-viewport-size-64,Fail
> +kms_plane_scaling@downscale-with-pixel-format-factor-0-25,Timeout
> +kms_plane_scaling@downscale-with-pixel-format-factor-0-5,Timeout
> +kms_plane_scaling@downscale-with-pixel-format-factor-0-75,Timeout
> +kms_plane_scaling@invalid-num-scalers,Fail
> +kms_plane_scaling@planes-downscale-factor-0-25,Fail
> +kms_plane_scaling@scaler-with-clipping-clamping,Timeout
> +kms_plane_scaling@scaler-with-pixel-format-unity-scaling,Timeout
> +kms_rmfb@close-fd,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> new file mode 100644
> index 000000000000..ceccd9947c82
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> @@ -0,0 +1,11 @@
> +# Test ends up reading CRC from frame before cursor update
> +# sometimes.. tbd if this is a kernel CRC bug or a test
> +# bug
> +kms_cursor_crc@.*
> +
> +kms_cursor_legacy@flip-vs-cursor-toggle
> +kms_cursor_legacy@pipe-A-forked-bo
> +kms_cursor_legacy@pipe-A-forked-move
> +kms_cursor_legacy@short-flip-before-cursor-toggle
> +
> +kms_flip@dpms-vs-vblank-race-interruptible
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> new file mode 100644
> index 000000000000..42675f1c6d76
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> @@ -0,0 +1,2 @@
> +# Hangs machine
> +kms_bw.*
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> new file mode 100644
> index 000000000000..0a2f5c04857a
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> @@ -0,0 +1,43 @@
> +kms_3d,Fail
> +kms_addfb_basic@addfb25-bad-modifier,Fail
> +kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> +kms_force_connector_basic@force-connector-state,Fail
> +kms_force_connector_basic@force-edid,Fail
> +kms_force_connector_basic@force-load-detect,Fail
> +kms_force_connector_basic@prune-stale-modes,Fail
> +kms_invalid_mode@int-max-clock,Fail
> +kms_plane_cursor@pipe-A-overlay-size-128,Fail
> +kms_plane_cursor@pipe-A-overlay-size-256,Fail
> +kms_plane_cursor@pipe-A-overlay-size-64,Fail
> +kms_plane_cursor@pipe-A-primary-size-128,Fail
> +kms_plane_cursor@pipe-A-primary-size-256,Fail
> +kms_plane_cursor@pipe-A-primary-size-64,Fail
> +kms_plane_cursor@pipe-A-viewport-size-128,Fail
> +kms_plane_cursor@pipe-A-viewport-size-256,Fail
> +kms_plane_cursor@pipe-A-viewport-size-64,Fail
> +kms_plane_cursor@pipe-B-overlay-size-128,Fail
> +kms_plane_cursor@pipe-B-overlay-size-256,Fail
> +kms_plane_cursor@pipe-B-overlay-size-64,Fail
> +kms_plane_cursor@pipe-B-primary-size-128,Fail
> +kms_plane_cursor@pipe-B-primary-size-256,Fail
> +kms_plane_cursor@pipe-B-primary-size-64,Fail
> +kms_plane_cursor@pipe-B-viewport-size-128,Fail
> +kms_plane_cursor@pipe-B-viewport-size-256,Fail
> +kms_plane_cursor@pipe-B-viewport-size-64,Fail
> +kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
> +kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
> +kms_plane_scaling@upscale-with-modifier-20x20,Fail
> +kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
> +kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
> +kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
> +kms_plane_scaling@upscale-with-rotation-20x20,Fail
> +kms_prime@basic-crc,Fail
> +kms_properties@connector-properties-atomic,Fail
> +kms_properties@get_properties-sanity-atomic,Fail
> +kms_properties@get_properties-sanity-non-atomic,Fail
> +kms_rmfb@close-fd,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
> new file mode 100644
> index 000000000000..1f20b75a19fa
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
> @@ -0,0 +1,2 @@
> +kms_cursor_crc@.*
> +kms_pipe_crc_basic@.*
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> new file mode 100644
> index 000000000000..223937ae7948
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> @@ -0,0 +1,49 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> +
> +# Too unstable, machine ends up hanging after lots of Oopses
> +kms_cursor_legacy.*
> +
> +# Started hanging the machine on Linux 5.19-rc2:
> +#
> +# [IGT] kms_plane_lowres: executing
> +# [IGT] kms_plane_lowres: starting subtest pipe-F-tiling-y
> +# [IGT] kms_plane_lowres: exiting, ret=77
> +# Console: switching to colour frame buffer device 170x48
> +# rockchip-drm display-subsystem: [drm] *ERROR* flip_done timed out
> +# rockchip-drm display-subsystem: [drm] *ERROR* [CRTC:35:crtc-0] commit wait timed out
> +# BUG: spinlock bad magic on CPU#3, kms_plane_lowre/482
> +# 8<--- cut here ---
> +# Unable to handle kernel paging request at virtual address 7812078e
> +# [7812078e] *pgd=00000000
> +# Internal error: Oops: 5 [#1] SMP ARM
> +# Modules linked in:
> +# CPU: 3 PID: 482 Comm: kms_plane_lowre Tainted: G        W         5.19.0-rc2-323596-g00535de92171 #1
> +# Hardware name: Rockchip (Device Tree)
> +# Process kms_plane_lowre (pid: 482, stack limit = 0x1193ac2b)
> +#  spin_dump from do_raw_spin_lock+0xa4/0xe8
> +#  do_raw_spin_lock from wait_for_completion_timeout+0x2c/0x120
> +#  wait_for_completion_timeout from drm_crtc_commit_wait+0x18/0x7c
> +#  drm_crtc_commit_wait from drm_atomic_helper_wait_for_dependencies+0x44/0x168
> +#  drm_atomic_helper_wait_for_dependencies from commit_tail+0x34/0x180
> +#  commit_tail from drm_atomic_helper_commit+0x164/0x18c
> +#  drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe4
> +#  drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x284
> +#  drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x60/0x1c8
> +#  drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x40
> +#  drm_client_modeset_commit from drm_fbdev_client_restore+0x58/0x94
> +#  drm_fbdev_client_restore from drm_client_dev_restore+0x70/0xbc
> +#  drm_client_dev_restore from drm_release+0xf4/0x114
> +#  drm_release from __fput+0x74/0x240
> +#  __fput from task_work_run+0x84/0xb4
> +#  task_work_run from do_exit+0x34c/0xa20
> +#  do_exit from do_group_exit+0x34/0x98
> +#  do_group_exit from __wake_up_parent+0x0/0x18
> +# Code: e595c008 12843d19 03e00000 03093168 (15940508)
> +# ---[ end trace 0000000000000000 ]---
> +# note: kms_plane_lowre[482] exited with preempt_count 1
> +# Fixing recursive fault but reboot is needed!
> +kms_plane_lowres@pipe-F-tiling-y
> +
> +# Take too long, we have only two machines, and these are very flaky
> +kms_cursor_crc.*
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> new file mode 100644
> index 000000000000..ebaa2f96e76b
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> @@ -0,0 +1,29 @@
> +kms_addfb_basic@addfb25-bad-modifier,Fail
> +kms_color@pipe-A-legacy-gamma,Fail
> +kms_color@pipe-B-legacy-gamma,Fail
> +kms_invalid_mode@int-max-clock,Fail
> +kms_plane@plane-panning-bottom-right,Fail
> +kms_plane@plane-panning-top-left,Fail
> +kms_plane_cursor@pipe-B-overlay-size-128,Fail
> +kms_plane_cursor@pipe-B-overlay-size-256,Fail
> +kms_plane_cursor@pipe-B-overlay-size-64,Fail
> +kms_plane_cursor@pipe-B-primary-size-128,Fail
> +kms_plane_cursor@pipe-B-primary-size-256,Fail
> +kms_plane_cursor@pipe-B-primary-size-64,Fail
> +kms_plane_cursor@pipe-B-viewport-size-128,Fail
> +kms_plane_cursor@pipe-B-viewport-size-256,Fail
> +kms_plane_cursor@pipe-B-viewport-size-64,Fail
> +kms_plane_multiple@atomic-pipe-B-tiling-none,Fail
> +kms_prime@basic-crc,Fail
> +kms_rmfb@close-fd,Fail
> +kms_universal_plane@universal-plane-pipe-B-functional,Fail
> +kms_vblank@pipe-A-query-forked,Fail
> +kms_vblank@pipe-A-query-idle,Fail
> +kms_vblank@pipe-A-wait-busy,Fail
> +kms_vblank@pipe-A-wait-forked,Fail
> +kms_vblank@pipe-A-wait-forked-busy,Fail
> +kms_vblank@pipe-B-query-forked,Fail
> +kms_vblank@pipe-B-query-idle,Fail
> +kms_vblank@pipe-B-wait-busy,Fail
> +kms_vblank@pipe-B-wait-forked,Fail
> +kms_vblank@pipe-B-wait-forked-busy,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> new file mode 100644
> index 000000000000..5808ccee025d
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> @@ -0,0 +1,20 @@
> +kms_cursor_crc@.*
> +kms_pipe_crc_basic@.*
> +
> +kms_flip@flip-vs-expired-vblank
> +kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-A
> +kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-B
> +kms_plane_multiple@atomic-pipe-A-tiling-none
> +kms_plane_multiple@atomic-pipe-B-tiling-none
> +kms_plane@plane-position-hole
> +kms_sequence@get-forked
> +kms_sequence@get-forked-busy
> +kms_setmode@basic
> +kms_vblank@pipe-A-accuracy-idle
> +kms_vblank@pipe-A-query-busy
> +kms_vblank@pipe-A-query-forked-busy
> +kms_vblank@pipe-A-wait-idle
> +kms_vblank@pipe-B-accuracy-idle
> +kms_vblank@pipe-B-query-busy
> +kms_vblank@pipe-B-query-forked-busy
> +kms_vblank@pipe-B-wait-idle
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> new file mode 100644
> index 000000000000..10c3d81a919a
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> @@ -0,0 +1,5 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> +
> +# Too unstable, machine ends up hanging after lots of Oopses
> +kms_cursor_legacy.*
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> new file mode 100644
> index 000000000000..2178bdd064dd
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> @@ -0,0 +1,38 @@
> +kms_addfb_basic@addfb25-bad-modifier,Fail
> +kms_addfb_basic@bad-pitch-65536,Fail
> +kms_addfb_basic@bo-too-small,Fail
> +kms_addfb_basic@size-max,Fail
> +kms_addfb_basic@too-high,Fail
> +kms_atomic_transition@plane-primary-toggle-with-vblank-wait,Fail
> +kms_bw@linear-tiling-1-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-1-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> +kms_invalid_mode@int-max-clock,Fail
> +kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
> +kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
> +kms_plane_scaling@planes-upscale-20x20,Fail
> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
> +kms_plane_scaling@upscale-with-modifier-20x20,Fail
> +kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
> +kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
> +kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
> +kms_plane_scaling@upscale-with-rotation-20x20,Fail
> +kms_vblank@crtc-id,Fail
> +kms_vblank@invalid,Fail
> +kms_vblank@pipe-A-accuracy-idle,Fail
> +kms_vblank@pipe-A-query-busy,Fail
> +kms_vblank@pipe-A-query-forked,Fail
> +kms_vblank@pipe-A-query-forked-busy,Fail
> +kms_vblank@pipe-A-query-idle,Fail
> +kms_vblank@pipe-A-ts-continuation-idle,Fail
> +kms_vblank@pipe-A-ts-continuation-modeset,Fail
> +kms_vblank@pipe-A-ts-continuation-suspend,Fail
> +kms_vblank@pipe-A-wait-busy,Fail
> +kms_vblank@pipe-A-wait-forked,Fail
> +kms_vblank@pipe-A-wait-forked-busy,Fail
> +kms_vblank@pipe-A-wait-idle,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
> new file mode 100644
> index 000000000000..e69de29bb2d1
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> new file mode 100644
> index 000000000000..78be18174012
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> @@ -0,0 +1,6 @@
> +# Hits a "refcount_t: underflow; use-after-free" in virtio_gpu_fence_event_process
> +# When run in a particular order with other tests
> +kms_cursor_legacy.*
> +
> +# Job just hangs without any output
> +kms_flip@flip-vs-suspend.*
> \ No newline at end of file
> -- 
> 2.31.1
> 
