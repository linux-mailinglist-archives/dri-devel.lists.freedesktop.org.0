Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE498AE79A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E601133A1;
	Tue, 23 Apr 2024 13:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IWqaRjXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B81710FB8B;
 Tue, 23 Apr 2024 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y0Vvgi8E6ktN0i7qNbaOlN+09f0Xlk79VDtvAH++BVU=; b=IWqaRjXwL3sJkAeb7xQidTg4PG
 94YUkilDJu85G7uNg0Fw9hP5hjiFZ0oDMJwZTsk1ImW7+zvRPAiHBUt0pm4hHmIm4K2i9zcUrf0Mm
 lcp6rs69BrYQLoXsT0hnahpTGgkXKnkDqLwIszf4Ow6ACz/BDDrd7iZeMDeHscXSbzDblItn1JDDn
 2kk+eV9lTdAWrdgELwBdKVce3jpGa7/N0XQT0XzmtfZPMTF4vrQDrf+2y3LGlbwl+ZapMBfxknxou
 I/ZLk2bGUCm2KFuT3lEvXgCCD24a1ef4GEeMPMhrWBCTz/rKuTSaXNZgui162LXc7aP4WDonWQlh+
 WR4/A+yA==;
Received: from [179.234.232.152] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rzDJv-007aef-Hv; Tue, 23 Apr 2024 12:24:17 +0200
Message-ID: <e3a0ea8f-d306-488c-a69c-aa18078e5e03@igalia.com>
Date: Tue, 23 Apr 2024 07:24:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] drm/ci: uprev IGT and generate testlist from build
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20240423040243.448091-1-vignesh.raman@collabora.com>
 <20240423040243.448091-4-vignesh.raman@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240423040243.448091-4-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Apr 2024 13:10:36 +0000
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

On 4/23/24 01:02, Vignesh Raman wrote:
> Uprev IGT to the latest version and stop vendoring the
> testlist into the kernel. Instead, use the testlist from
> the IGT build to ensure we do not miss renamed or newly
> added tests.

Nitpick: wouldn't it be better to (1) stop vendoring the
testlist into the kernel in one patch and then (2) uprev
IGT to the latest version? I feel that this patch is changing
a lot of different stuff.

Best Regards,
- Maíra

> 
> Skip kms tests for panfrost driver since it is not a kms
> driver and skip driver-specific tests. Update xfails with
> the latest testlist.
> 
> Increase the timoout of i915 jobs to 2h30m since some jobs
> takes more than 2 hours to complete.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>   drivers/gpu/drm/ci/build-igt.sh               |   23 +
>   drivers/gpu/drm/ci/gitlab-ci.yml              |    2 +-
>   drivers/gpu/drm/ci/igt_runner.sh              |    9 +-
>   drivers/gpu/drm/ci/test.yml                   |    6 +-
>   drivers/gpu/drm/ci/testlist.txt               | 2761 -----------------
>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   45 +-
>   .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   15 +-
>   .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   30 +-
>   drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   27 +
>   .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |    9 +
>   drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   22 +-
>   drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   47 +-
>   drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   24 +-
>   drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |   37 +-
>   drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |    6 +
>   drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   20 +
>   drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   37 +-
>   drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   21 +-
>   drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   29 +-
>   drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |    1 -
>   drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   34 +-
>   drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   27 +-
>   drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |    6 +
>   drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   28 +-
>   drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   57 +-
>   drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   21 +-
>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   47 +-
>   .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   13 +
>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   18 +-
>   .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |    6 +
>   .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   15 +
>   .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   20 +-
>   .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |    7 +
>   .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   15 +
>   .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   25 +-
>   .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |    7 +
>   .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   15 +
>   .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    6 +-
>   .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    6 +
>   .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |  117 +-
>   .../msm-sc7180-trogdor-kingoftown-fails.txt   |   40 +-
>   .../msm-sc7180-trogdor-kingoftown-flakes.txt  |    6 +
>   .../msm-sc7180-trogdor-kingoftown-skips.txt   |   16 +
>   ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   41 +-
>   ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |   11 +
>   ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   16 +
>   .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   76 +-
>   .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   26 +-
>   .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   16 +
>   .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   54 -
>   .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   60 +-
>   .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   79 +-
>   .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   13 +-
>   .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   17 +-
>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   84 +-
>   .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   19 +-
>   56 files changed, 947 insertions(+), 3288 deletions(-)
>   delete mode 100644 drivers/gpu/drm/ci/testlist.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>   delete mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
>   delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> 
> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
> index 500fa4f5c30a..cedc62baba1e 100644
> --- a/drivers/gpu/drm/ci/build-igt.sh
> +++ b/drivers/gpu/drm/ci/build-igt.sh
> @@ -26,6 +26,29 @@ meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>   ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>   ninja -C build install
>   
> +set +ex
> +export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib64
> +while read -r line; do
> +    if [ "$line" = "TESTLIST" ] || [ "$line" = "END TESTLIST" ]; then
> +        continue
> +    fi
> +
> +    tests=$(echo "$line" | tr ' ' '\n')
> +
> +    for test in $tests; do
> +        output=$(/igt/libexec/igt-gpu-tools/"$test" --list-subtests)
> +
> +        if [ -z "$output" ]; then
> +            echo "$test"
> +        else
> +            echo "$output" | while read -r subtest; do
> +                echo "$test@$subtest"
> +            done
> +        fi
> +    done
> +done < /igt/libexec/igt-gpu-tools/test-list.txt > /igt/libexec/igt-gpu-tools/testlist.txt
> +set -ex
> +
>   mkdir -p artifacts/
>   tar -cf artifacts/igt.tar /igt
>   
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 9bf5190604a7..6cc94747d8d5 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>     TARGET_BRANCH: drm-next
>   
> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
> +  IGT_VERSION: 7d1841317c13c19c26b6352f923b205d43742c55
>   
>     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>     DEQP_RUNNER_GIT_TAG: v0.15.0
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index 7d2ba69294dd..0fd7d67f91e3 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -59,25 +59,24 @@ fi
>   
>   curl -L --retry 4 -f --retry-all-errors --retry-delay 60 -s ${FDO_HTTP_CACHE_URI:-}$PIPELINE_ARTIFACTS_BASE/$ARCH/igt.tar.gz | tar --zstd -v -x -C /
>   
> -
>   # If the job is parallel at the gitab job level, take the corresponding fraction
>   # of the caselist.
>   if [ -n "$CI_NODE_INDEX" ]; then
> -    sed -ni $CI_NODE_INDEX~$CI_NODE_TOTAL"p" /install/testlist.txt
> +    sed -ni $CI_NODE_INDEX~$CI_NODE_TOTAL"p" /igt/libexec/igt-gpu-tools/testlist.txt
>   fi
>   
>   # core_getversion checks if the driver is loaded and probed correctly
>   # so run it in all shards
> -if ! grep -q "core_getversion" /install/testlist.txt; then
> +if ! grep -q "core_getversion" /igt/libexec/igt-gpu-tools/testlist.txt; then
>       # Add the line to the file
> -    echo "core_getversion" >> /install/testlist.txt
> +    echo "core_getversion" >> /igt/libexec/igt-gpu-tools/testlist.txt
>   fi
>   
>   set +e
>   igt-runner \
>       run \
>       --igt-folder /igt/libexec/igt-gpu-tools \
> -    --caselist /install/testlist.txt \
> +    --caselist /igt/libexec/igt-gpu-tools/testlist.txt \
>       --output /results \
>       $IGT_SKIPS \
>       $IGT_FLAKES \
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 864ac3809d84..1f8cc17f2ad1 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -186,6 +186,7 @@ rockchip:rk3399:
>     extends:
>       - .lava-igt:x86_64
>     stage: i915
> +  timeout: "2h30m"
>     variables:
>       DRIVER_NAME: i915
>       DTB: ""
> @@ -196,7 +197,6 @@ i915:apl:
>     extends:
>       - .i915
>     parallel: 3
> -  timeout: "1h30m"
>     variables:
>       DEVICE_TYPE: asus-C523NA-A20057-coral
>       GPU_VERSION: apl
> @@ -206,7 +206,6 @@ i915:glk:
>     extends:
>       - .i915
>     parallel: 2
> -  timeout: "1h30m"
>     variables:
>       DEVICE_TYPE: hp-x360-12b-ca0010nr-n4020-octopus
>       GPU_VERSION: glk
> @@ -216,7 +215,6 @@ i915:amly:
>     extends:
>       - .i915
>     parallel: 2
> -  timeout: "1h30m"
>     variables:
>       DEVICE_TYPE: asus-C433TA-AJ0005-rammus
>       GPU_VERSION: amly
> @@ -235,7 +233,6 @@ i915:whl:
>     extends:
>       - .i915
>     parallel: 2
> -  timeout: "1h30m"
>     variables:
>       DEVICE_TYPE: dell-latitude-5400-8665U-sarien
>       GPU_VERSION: whl
> @@ -245,7 +242,6 @@ i915:cml:
>     extends:
>       - .i915
>     parallel: 2
> -  timeout: "1h30m"
>     variables:
>       DEVICE_TYPE: asus-C436FA-Flip-hatch
>       GPU_VERSION: cml
> diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testlist.txt
> deleted file mode 100644
> index 3377f002f8c5..000000000000
> --- a/drivers/gpu/drm/ci/testlist.txt
> +++ /dev/null
> @@ -1,2761 +0,0 @@
> -core_auth@getclient-simple
> -core_auth@getclient-master-drop
> -core_auth@basic-auth
> -core_auth@many-magics
> -core_getclient
> -core_getstats
> -core_getversion
> -core_setmaster_vs_auth
> -drm_read@invalid-buffer
> -drm_read@fault-buffer
> -drm_read@empty-block
> -drm_read@empty-nonblock
> -drm_read@short-buffer-block
> -drm_read@short-buffer-nonblock
> -drm_read@short-buffer-wakeup
> -gem_eio@throttle
> -gem_eio@create
> -gem_eio@create-ext
> -gem_eio@context-create
> -gem_eio@execbuf
> -gem_eio@banned
> -gem_eio@suspend
> -gem_eio@hibernate
> -gem_eio@in-flight-external
> -gem_eio@in-flight-suspend
> -gem_eio@reset-stress
> -gem_eio@unwedge-stress
> -gem_eio@wait-immediate
> -gem_eio@wait-wedge-immediate
> -gem_eio@in-flight-immediate
> -gem_eio@in-flight-contexts-immediate
> -gem_eio@in-flight-internal-immediate
> -gem_eio@wait-1us
> -gem_eio@wait-wedge-1us
> -gem_eio@in-flight-1us
> -gem_eio@in-flight-contexts-1us
> -gem_eio@in-flight-internal-1us
> -gem_eio@wait-10ms
> -gem_eio@wait-wedge-10ms
> -gem_eio@in-flight-10ms
> -gem_eio@in-flight-contexts-10ms
> -gem_eio@in-flight-internal-10ms
> -gem_eio@kms
> -kms_3d
> -kms_addfb_basic@unused-handle
> -kms_addfb_basic@unused-pitches
> -kms_addfb_basic@unused-offsets
> -kms_addfb_basic@unused-modifier
> -kms_addfb_basic@clobberred-modifier
> -kms_addfb_basic@invalid-smem-bo-on-discrete
> -kms_addfb_basic@legacy-format
> -kms_addfb_basic@no-handle
> -kms_addfb_basic@basic
> -kms_addfb_basic@bad-pitch-0
> -kms_addfb_basic@bad-pitch-32
> -kms_addfb_basic@bad-pitch-63
> -kms_addfb_basic@bad-pitch-128
> -kms_addfb_basic@bad-pitch-256
> -kms_addfb_basic@bad-pitch-1024
> -kms_addfb_basic@bad-pitch-999
> -kms_addfb_basic@bad-pitch-65536
> -kms_addfb_basic@invalid-get-prop-any
> -kms_addfb_basic@invalid-get-prop
> -kms_addfb_basic@invalid-set-prop-any
> -kms_addfb_basic@invalid-set-prop
> -kms_addfb_basic@master-rmfb
> -kms_addfb_basic@addfb25-modifier-no-flag
> -kms_addfb_basic@addfb25-bad-modifier
> -kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
> -kms_addfb_basic@addfb25-x-tiled-legacy
> -kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
> -kms_addfb_basic@basic-x-tiled-legacy
> -kms_addfb_basic@framebuffer-vs-set-tiling
> -kms_addfb_basic@tile-pitch-mismatch
> -kms_addfb_basic@basic-y-tiled-legacy
> -kms_addfb_basic@size-max
> -kms_addfb_basic@too-wide
> -kms_addfb_basic@too-high
> -kms_addfb_basic@bo-too-small
> -kms_addfb_basic@small-bo
> -kms_addfb_basic@bo-too-small-due-to-tiling
> -kms_addfb_basic@addfb25-y-tiled-legacy
> -kms_addfb_basic@addfb25-yf-tiled-legacy
> -kms_addfb_basic@addfb25-y-tiled-small-legacy
> -kms_addfb_basic@addfb25-4-tiled
> -kms_async_flips@async-flip-with-page-flip-events
> -kms_async_flips@alternate-sync-async-flip
> -kms_async_flips@test-time-stamp
> -kms_async_flips@test-cursor
> -kms_async_flips@invalid-async-flip
> -kms_async_flips@crc
> -kms_atomic@plane-overlay-legacy
> -kms_atomic@plane-primary-legacy
> -kms_atomic@plane-primary-overlay-mutable-zpos
> -kms_atomic@plane-immutable-zpos
> -kms_atomic@test-only
> -kms_atomic@plane-cursor-legacy
> -kms_atomic@plane-invalid-params
> -kms_atomic@plane-invalid-params-fence
> -kms_atomic@crtc-invalid-params
> -kms_atomic@crtc-invalid-params-fence
> -kms_atomic@atomic-invalid-params
> -kms_atomic@atomic-plane-damage
> -kms_atomic_interruptible@legacy-setmode
> -kms_atomic_interruptible@atomic-setmode
> -kms_atomic_interruptible@legacy-dpms
> -kms_atomic_interruptible@legacy-pageflip
> -kms_atomic_interruptible@legacy-cursor
> -kms_atomic_interruptible@universal-setplane-primary
> -kms_atomic_interruptible@universal-setplane-cursor
> -kms_atomic_transition@plane-primary-toggle-with-vblank-wait
> -kms_atomic_transition@plane-all-transition
> -kms_atomic_transition@plane-all-transition-fencing
> -kms_atomic_transition@plane-all-transition-nonblocking
> -kms_atomic_transition@plane-all-transition-nonblocking-fencing
> -kms_atomic_transition@plane-use-after-nonblocking-unbind
> -kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing
> -kms_atomic_transition@plane-all-modeset-transition
> -kms_atomic_transition@plane-all-modeset-transition-fencing
> -kms_atomic_transition@plane-all-modeset-transition-internal-panels
> -kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels
> -kms_atomic_transition@plane-toggle-modeset-transition
> -kms_atomic_transition@modeset-transition
> -kms_atomic_transition@modeset-transition-fencing
> -kms_atomic_transition@modeset-transition-nonblocking
> -kms_atomic_transition@modeset-transition-nonblocking-fencing
> -kms_big_fb@x-tiled-addfb-size-overflow
> -kms_big_fb@y-tiled-addfb-size-overflow
> -kms_big_fb@yf-tiled-addfb-size-overflow
> -kms_big_fb@4-tiled-addfb-size-overflow
> -kms_big_fb@x-tiled-addfb-size-offset-overflow
> -kms_big_fb@y-tiled-addfb-size-offset-overflow
> -kms_big_fb@yf-tiled-addfb-size-offset-overflow
> -kms_big_fb@4-tiled-addfb-size-offset-overflow
> -kms_big_fb@linear-addfb
> -kms_big_fb@x-tiled-addfb
> -kms_big_fb@y-tiled-addfb
> -kms_big_fb@yf-tiled-addfb
> -kms_big_fb@4-tiled-addfb
> -kms_big_fb@linear-8bpp-rotate-0
> -kms_big_fb@linear-8bpp-rotate-90
> -kms_big_fb@linear-8bpp-rotate-180
> -kms_big_fb@linear-8bpp-rotate-270
> -kms_big_fb@linear-16bpp-rotate-0
> -kms_big_fb@linear-16bpp-rotate-90
> -kms_big_fb@linear-16bpp-rotate-180
> -kms_big_fb@linear-16bpp-rotate-270
> -kms_big_fb@linear-32bpp-rotate-0
> -kms_big_fb@linear-32bpp-rotate-90
> -kms_big_fb@linear-32bpp-rotate-180
> -kms_big_fb@linear-32bpp-rotate-270
> -kms_big_fb@linear-64bpp-rotate-0
> -kms_big_fb@linear-64bpp-rotate-90
> -kms_big_fb@linear-64bpp-rotate-180
> -kms_big_fb@linear-64bpp-rotate-270
> -kms_big_fb@x-tiled-8bpp-rotate-0
> -kms_big_fb@x-tiled-8bpp-rotate-90
> -kms_big_fb@x-tiled-8bpp-rotate-180
> -kms_big_fb@x-tiled-8bpp-rotate-270
> -kms_big_fb@x-tiled-16bpp-rotate-0
> -kms_big_fb@x-tiled-16bpp-rotate-90
> -kms_big_fb@x-tiled-16bpp-rotate-180
> -kms_big_fb@x-tiled-16bpp-rotate-270
> -kms_big_fb@x-tiled-32bpp-rotate-0
> -kms_big_fb@x-tiled-32bpp-rotate-90
> -kms_big_fb@x-tiled-32bpp-rotate-180
> -kms_big_fb@x-tiled-32bpp-rotate-270
> -kms_big_fb@x-tiled-64bpp-rotate-0
> -kms_big_fb@x-tiled-64bpp-rotate-90
> -kms_big_fb@x-tiled-64bpp-rotate-180
> -kms_big_fb@x-tiled-64bpp-rotate-270
> -kms_big_fb@y-tiled-8bpp-rotate-0
> -kms_big_fb@y-tiled-8bpp-rotate-90
> -kms_big_fb@y-tiled-8bpp-rotate-180
> -kms_big_fb@y-tiled-8bpp-rotate-270
> -kms_big_fb@y-tiled-16bpp-rotate-0
> -kms_big_fb@y-tiled-16bpp-rotate-90
> -kms_big_fb@y-tiled-16bpp-rotate-180
> -kms_big_fb@y-tiled-16bpp-rotate-270
> -kms_big_fb@y-tiled-32bpp-rotate-0
> -kms_big_fb@y-tiled-32bpp-rotate-90
> -kms_big_fb@y-tiled-32bpp-rotate-180
> -kms_big_fb@y-tiled-32bpp-rotate-270
> -kms_big_fb@y-tiled-64bpp-rotate-0
> -kms_big_fb@y-tiled-64bpp-rotate-90
> -kms_big_fb@y-tiled-64bpp-rotate-180
> -kms_big_fb@y-tiled-64bpp-rotate-270
> -kms_big_fb@yf-tiled-8bpp-rotate-0
> -kms_big_fb@yf-tiled-8bpp-rotate-90
> -kms_big_fb@yf-tiled-8bpp-rotate-180
> -kms_big_fb@yf-tiled-8bpp-rotate-270
> -kms_big_fb@yf-tiled-16bpp-rotate-0
> -kms_big_fb@yf-tiled-16bpp-rotate-90
> -kms_big_fb@yf-tiled-16bpp-rotate-180
> -kms_big_fb@yf-tiled-16bpp-rotate-270
> -kms_big_fb@yf-tiled-32bpp-rotate-0
> -kms_big_fb@yf-tiled-32bpp-rotate-90
> -kms_big_fb@yf-tiled-32bpp-rotate-180
> -kms_big_fb@yf-tiled-32bpp-rotate-270
> -kms_big_fb@yf-tiled-64bpp-rotate-0
> -kms_big_fb@yf-tiled-64bpp-rotate-90
> -kms_big_fb@yf-tiled-64bpp-rotate-180
> -kms_big_fb@yf-tiled-64bpp-rotate-270
> -kms_big_fb@4-tiled-8bpp-rotate-0
> -kms_big_fb@4-tiled-8bpp-rotate-90
> -kms_big_fb@4-tiled-8bpp-rotate-180
> -kms_big_fb@4-tiled-8bpp-rotate-270
> -kms_big_fb@4-tiled-16bpp-rotate-0
> -kms_big_fb@4-tiled-16bpp-rotate-90
> -kms_big_fb@4-tiled-16bpp-rotate-180
> -kms_big_fb@4-tiled-16bpp-rotate-270
> -kms_big_fb@4-tiled-32bpp-rotate-0
> -kms_big_fb@4-tiled-32bpp-rotate-90
> -kms_big_fb@4-tiled-32bpp-rotate-180
> -kms_big_fb@4-tiled-32bpp-rotate-270
> -kms_big_fb@4-tiled-64bpp-rotate-0
> -kms_big_fb@4-tiled-64bpp-rotate-90
> -kms_big_fb@4-tiled-64bpp-rotate-180
> -kms_big_fb@4-tiled-64bpp-rotate-270
> -kms_big_fb@linear-max-hw-stride-32bpp-rotate-0
> -kms_big_fb@linear-max-hw-stride-32bpp-rotate-180
> -kms_big_fb@linear-max-hw-stride-64bpp-rotate-0
> -kms_big_fb@linear-max-hw-stride-64bpp-rotate-180
> -kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0
> -kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip
> -kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180
> -kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip
> -kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0
> -kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip
> -kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180
> -kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip
> -kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip
> -kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> -kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip
> -kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> -kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip
> -kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
> -kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip
> -kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> -kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0
> -kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip
> -kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180
> -kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip
> -kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0
> -kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip
> -kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180
> -kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip
> -kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip
> -kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> -kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip
> -kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> -kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip
> -kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
> -kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip
> -kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> -kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0
> -kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip
> -kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180
> -kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip
> -kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0
> -kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip
> -kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180
> -kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip
> -kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip
> -kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> -kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip
> -kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> -kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip
> -kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
> -kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip
> -kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> -kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0
> -kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip
> -kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180
> -kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip
> -kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0
> -kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip
> -kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180
> -kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip
> -kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip
> -kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> -kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip
> -kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> -kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip
> -kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
> -kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip
> -kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> -kms_big_joiner@basic
> -kms_big_joiner@invalid-modeset
> -kms_big_joiner@2x-modeset
> -kms_busy@basic
> -kms_busy@basic-hang
> -kms_busy@extended-pageflip-modeset-hang-oldfb
> -kms_busy@extended-pageflip-hang-oldfb
> -kms_busy@extended-pageflip-hang-newfb
> -kms_busy@extended-modeset-hang-oldfb
> -kms_busy@extended-modeset-hang-newfb
> -kms_busy@extended-modeset-hang-oldfb-with-reset
> -kms_busy@extended-modeset-hang-newfb-with-reset
> -kms_bw@linear-tiling-1-displays-1920x1080p
> -kms_bw@linear-tiling-1-displays-2560x1440p
> -kms_bw@linear-tiling-1-displays-3840x2160p
> -kms_bw@linear-tiling-2-displays-1920x1080p
> -kms_bw@linear-tiling-2-displays-2560x1440p
> -kms_bw@linear-tiling-2-displays-3840x2160p
> -kms_bw@linear-tiling-3-displays-1920x1080p
> -kms_bw@linear-tiling-3-displays-2560x1440p
> -kms_bw@linear-tiling-3-displays-3840x2160p
> -kms_bw@linear-tiling-4-displays-1920x1080p
> -kms_bw@linear-tiling-4-displays-2560x1440p
> -kms_bw@linear-tiling-4-displays-3840x2160p
> -kms_bw@linear-tiling-5-displays-1920x1080p
> -kms_bw@linear-tiling-5-displays-2560x1440p
> -kms_bw@linear-tiling-5-displays-3840x2160p
> -kms_bw@linear-tiling-6-displays-1920x1080p
> -kms_bw@linear-tiling-6-displays-2560x1440p
> -kms_bw@linear-tiling-6-displays-3840x2160p
> -kms_bw@linear-tiling-7-displays-1920x1080p
> -kms_bw@linear-tiling-7-displays-2560x1440p
> -kms_bw@linear-tiling-7-displays-3840x2160p
> -kms_bw@linear-tiling-8-displays-1920x1080p
> -kms_bw@linear-tiling-8-displays-2560x1440p
> -kms_bw@linear-tiling-8-displays-3840x2160p
> -kms_ccs@pipe-A-bad-pixel-format-y-tiled-ccs
> -kms_ccs@pipe-A-bad-pixel-format-yf-tiled-ccs
> -kms_ccs@pipe-A-bad-pixel-format-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-A-bad-pixel-format-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-A-bad-pixel-format-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-A-bad-pixel-format-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-A-bad-pixel-format-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-A-bad-pixel-format-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-A-bad-pixel-format-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-A-bad-pixel-format-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-A-bad-pixel-format-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-A-bad-rotation-90-y-tiled-ccs
> -kms_ccs@pipe-A-bad-rotation-90-yf-tiled-ccs
> -kms_ccs@pipe-A-bad-rotation-90-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-A-bad-rotation-90-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-A-bad-rotation-90-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-A-bad-rotation-90-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-A-bad-rotation-90-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-A-bad-rotation-90-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-A-bad-rotation-90-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-A-bad-rotation-90-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-A-bad-rotation-90-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-A-crc-primary-basic-y-tiled-ccs
> -kms_ccs@pipe-A-crc-primary-basic-yf-tiled-ccs
> -kms_ccs@pipe-A-crc-primary-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-A-crc-primary-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-A-crc-primary-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-A-crc-primary-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-A-crc-primary-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-A-crc-primary-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-A-crc-primary-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-A-crc-primary-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-A-crc-primary-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-A-crc-primary-rotation-180-y-tiled-ccs
> -kms_ccs@pipe-A-crc-primary-rotation-180-yf-tiled-ccs
> -kms_ccs@pipe-A-crc-primary-rotation-180-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-A-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-A-crc-primary-rotation-180-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-A-crc-primary-rotation-180-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-A-crc-primary-rotation-180-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-A-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-A-crc-primary-rotation-180-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-A-crc-primary-rotation-180-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-A-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-A-random-ccs-data-y-tiled-ccs
> -kms_ccs@pipe-A-random-ccs-data-yf-tiled-ccs
> -kms_ccs@pipe-A-random-ccs-data-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-A-random-ccs-data-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-A-random-ccs-data-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-A-random-ccs-data-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-A-random-ccs-data-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-A-random-ccs-data-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-A-random-ccs-data-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-A-random-ccs-data-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-A-random-ccs-data-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-A-missing-ccs-buffer-y-tiled-ccs
> -kms_ccs@pipe-A-missing-ccs-buffer-yf-tiled-ccs
> -kms_ccs@pipe-A-missing-ccs-buffer-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-A-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-A-missing-ccs-buffer-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-A-missing-ccs-buffer-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-A-missing-ccs-buffer-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-A-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-A-ccs-on-another-bo-y-tiled-ccs
> -kms_ccs@pipe-A-ccs-on-another-bo-yf-tiled-ccs
> -kms_ccs@pipe-A-ccs-on-another-bo-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-A-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-A-ccs-on-another-bo-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-A-ccs-on-another-bo-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-A-ccs-on-another-bo-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-A-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-A-bad-aux-stride-y-tiled-ccs
> -kms_ccs@pipe-A-bad-aux-stride-yf-tiled-ccs
> -kms_ccs@pipe-A-bad-aux-stride-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-A-bad-aux-stride-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-A-bad-aux-stride-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-A-bad-aux-stride-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-A-bad-aux-stride-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-A-bad-aux-stride-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-A-crc-sprite-planes-basic-y-tiled-ccs
> -kms_ccs@pipe-A-crc-sprite-planes-basic-yf-tiled-ccs
> -kms_ccs@pipe-A-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-A-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-A-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-A-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-A-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-A-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-A-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-A-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-A-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-B-bad-pixel-format-y-tiled-ccs
> -kms_ccs@pipe-B-bad-pixel-format-yf-tiled-ccs
> -kms_ccs@pipe-B-bad-pixel-format-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-B-bad-pixel-format-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-B-bad-pixel-format-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-B-bad-pixel-format-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-B-bad-pixel-format-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-B-bad-pixel-format-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-B-bad-pixel-format-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-B-bad-pixel-format-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-B-bad-pixel-format-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-B-bad-rotation-90-y-tiled-ccs
> -kms_ccs@pipe-B-bad-rotation-90-yf-tiled-ccs
> -kms_ccs@pipe-B-bad-rotation-90-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-B-bad-rotation-90-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-B-bad-rotation-90-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-B-bad-rotation-90-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-B-bad-rotation-90-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-B-bad-rotation-90-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-B-bad-rotation-90-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-B-bad-rotation-90-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-B-bad-rotation-90-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-B-crc-primary-basic-y-tiled-ccs
> -kms_ccs@pipe-B-crc-primary-basic-yf-tiled-ccs
> -kms_ccs@pipe-B-crc-primary-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-B-crc-primary-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-B-crc-primary-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-B-crc-primary-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-B-crc-primary-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-B-crc-primary-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-B-crc-primary-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-B-crc-primary-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-B-crc-primary-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-B-crc-primary-rotation-180-y-tiled-ccs
> -kms_ccs@pipe-B-crc-primary-rotation-180-yf-tiled-ccs
> -kms_ccs@pipe-B-crc-primary-rotation-180-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-B-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-B-crc-primary-rotation-180-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-B-crc-primary-rotation-180-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-B-crc-primary-rotation-180-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-B-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-B-crc-primary-rotation-180-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-B-crc-primary-rotation-180-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-B-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-B-random-ccs-data-y-tiled-ccs
> -kms_ccs@pipe-B-random-ccs-data-yf-tiled-ccs
> -kms_ccs@pipe-B-random-ccs-data-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-B-random-ccs-data-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-B-random-ccs-data-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-B-random-ccs-data-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-B-random-ccs-data-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-B-random-ccs-data-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-B-random-ccs-data-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-B-random-ccs-data-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-B-random-ccs-data-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-B-missing-ccs-buffer-y-tiled-ccs
> -kms_ccs@pipe-B-missing-ccs-buffer-yf-tiled-ccs
> -kms_ccs@pipe-B-missing-ccs-buffer-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-B-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-B-missing-ccs-buffer-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-B-missing-ccs-buffer-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-B-missing-ccs-buffer-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-B-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-B-ccs-on-another-bo-y-tiled-ccs
> -kms_ccs@pipe-B-ccs-on-another-bo-yf-tiled-ccs
> -kms_ccs@pipe-B-ccs-on-another-bo-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-B-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-B-ccs-on-another-bo-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-B-ccs-on-another-bo-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-B-ccs-on-another-bo-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-B-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-B-bad-aux-stride-y-tiled-ccs
> -kms_ccs@pipe-B-bad-aux-stride-yf-tiled-ccs
> -kms_ccs@pipe-B-bad-aux-stride-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-B-bad-aux-stride-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-B-bad-aux-stride-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-B-bad-aux-stride-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-B-bad-aux-stride-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-B-bad-aux-stride-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-B-crc-sprite-planes-basic-y-tiled-ccs
> -kms_ccs@pipe-B-crc-sprite-planes-basic-yf-tiled-ccs
> -kms_ccs@pipe-B-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-B-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-B-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-B-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-B-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-B-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-B-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-B-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-B-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-C-bad-pixel-format-y-tiled-ccs
> -kms_ccs@pipe-C-bad-pixel-format-yf-tiled-ccs
> -kms_ccs@pipe-C-bad-pixel-format-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-C-bad-pixel-format-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-C-bad-pixel-format-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-C-bad-pixel-format-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-C-bad-pixel-format-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-C-bad-pixel-format-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-C-bad-pixel-format-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-C-bad-pixel-format-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-C-bad-pixel-format-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-C-bad-rotation-90-y-tiled-ccs
> -kms_ccs@pipe-C-bad-rotation-90-yf-tiled-ccs
> -kms_ccs@pipe-C-bad-rotation-90-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-C-bad-rotation-90-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-C-bad-rotation-90-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-C-bad-rotation-90-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-C-bad-rotation-90-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-C-bad-rotation-90-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-C-bad-rotation-90-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-C-bad-rotation-90-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-C-bad-rotation-90-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-C-crc-primary-basic-y-tiled-ccs
> -kms_ccs@pipe-C-crc-primary-basic-yf-tiled-ccs
> -kms_ccs@pipe-C-crc-primary-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-C-crc-primary-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-C-crc-primary-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-C-crc-primary-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-C-crc-primary-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-C-crc-primary-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-C-crc-primary-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-C-crc-primary-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-C-crc-primary-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-C-crc-primary-rotation-180-y-tiled-ccs
> -kms_ccs@pipe-C-crc-primary-rotation-180-yf-tiled-ccs
> -kms_ccs@pipe-C-crc-primary-rotation-180-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-C-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-C-crc-primary-rotation-180-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-C-crc-primary-rotation-180-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-C-crc-primary-rotation-180-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-C-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-C-crc-primary-rotation-180-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-C-crc-primary-rotation-180-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-C-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-C-random-ccs-data-y-tiled-ccs
> -kms_ccs@pipe-C-random-ccs-data-yf-tiled-ccs
> -kms_ccs@pipe-C-random-ccs-data-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-C-random-ccs-data-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-C-random-ccs-data-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-C-random-ccs-data-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-C-random-ccs-data-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-C-random-ccs-data-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-C-random-ccs-data-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-C-random-ccs-data-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-C-random-ccs-data-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-C-missing-ccs-buffer-y-tiled-ccs
> -kms_ccs@pipe-C-missing-ccs-buffer-yf-tiled-ccs
> -kms_ccs@pipe-C-missing-ccs-buffer-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-C-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-C-missing-ccs-buffer-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-C-missing-ccs-buffer-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-C-missing-ccs-buffer-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-C-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-C-ccs-on-another-bo-y-tiled-ccs
> -kms_ccs@pipe-C-ccs-on-another-bo-yf-tiled-ccs
> -kms_ccs@pipe-C-ccs-on-another-bo-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-C-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-C-ccs-on-another-bo-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-C-ccs-on-another-bo-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-C-ccs-on-another-bo-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-C-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-C-bad-aux-stride-y-tiled-ccs
> -kms_ccs@pipe-C-bad-aux-stride-yf-tiled-ccs
> -kms_ccs@pipe-C-bad-aux-stride-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-C-bad-aux-stride-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-C-bad-aux-stride-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-C-bad-aux-stride-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-C-bad-aux-stride-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-C-bad-aux-stride-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-C-crc-sprite-planes-basic-y-tiled-ccs
> -kms_ccs@pipe-C-crc-sprite-planes-basic-yf-tiled-ccs
> -kms_ccs@pipe-C-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-C-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-C-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-C-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-C-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-C-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-C-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-C-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-C-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-D-bad-pixel-format-y-tiled-ccs
> -kms_ccs@pipe-D-bad-pixel-format-yf-tiled-ccs
> -kms_ccs@pipe-D-bad-pixel-format-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-D-bad-pixel-format-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-D-bad-pixel-format-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-D-bad-pixel-format-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-D-bad-pixel-format-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-D-bad-pixel-format-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-D-bad-pixel-format-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-D-bad-pixel-format-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-D-bad-pixel-format-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-D-bad-rotation-90-y-tiled-ccs
> -kms_ccs@pipe-D-bad-rotation-90-yf-tiled-ccs
> -kms_ccs@pipe-D-bad-rotation-90-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-D-bad-rotation-90-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-D-bad-rotation-90-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-D-bad-rotation-90-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-D-bad-rotation-90-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-D-bad-rotation-90-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-D-bad-rotation-90-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-D-bad-rotation-90-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-D-bad-rotation-90-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-D-crc-primary-basic-y-tiled-ccs
> -kms_ccs@pipe-D-crc-primary-basic-yf-tiled-ccs
> -kms_ccs@pipe-D-crc-primary-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-D-crc-primary-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-D-crc-primary-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-D-crc-primary-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-D-crc-primary-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-D-crc-primary-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-D-crc-primary-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-D-crc-primary-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-D-crc-primary-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-D-crc-primary-rotation-180-y-tiled-ccs
> -kms_ccs@pipe-D-crc-primary-rotation-180-yf-tiled-ccs
> -kms_ccs@pipe-D-crc-primary-rotation-180-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-D-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-D-crc-primary-rotation-180-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-D-crc-primary-rotation-180-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-D-crc-primary-rotation-180-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-D-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-D-crc-primary-rotation-180-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-D-crc-primary-rotation-180-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-D-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-D-random-ccs-data-y-tiled-ccs
> -kms_ccs@pipe-D-random-ccs-data-yf-tiled-ccs
> -kms_ccs@pipe-D-random-ccs-data-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-D-random-ccs-data-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-D-random-ccs-data-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-D-random-ccs-data-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-D-random-ccs-data-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-D-random-ccs-data-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-D-random-ccs-data-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-D-random-ccs-data-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-D-random-ccs-data-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-D-missing-ccs-buffer-y-tiled-ccs
> -kms_ccs@pipe-D-missing-ccs-buffer-yf-tiled-ccs
> -kms_ccs@pipe-D-missing-ccs-buffer-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-D-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-D-missing-ccs-buffer-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-D-missing-ccs-buffer-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-D-missing-ccs-buffer-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-D-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-D-ccs-on-another-bo-y-tiled-ccs
> -kms_ccs@pipe-D-ccs-on-another-bo-yf-tiled-ccs
> -kms_ccs@pipe-D-ccs-on-another-bo-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-D-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-D-ccs-on-another-bo-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-D-ccs-on-another-bo-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-D-ccs-on-another-bo-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-D-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-D-bad-aux-stride-y-tiled-ccs
> -kms_ccs@pipe-D-bad-aux-stride-yf-tiled-ccs
> -kms_ccs@pipe-D-bad-aux-stride-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-D-bad-aux-stride-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-D-bad-aux-stride-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-D-bad-aux-stride-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-D-bad-aux-stride-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-D-bad-aux-stride-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-D-crc-sprite-planes-basic-y-tiled-ccs
> -kms_ccs@pipe-D-crc-sprite-planes-basic-yf-tiled-ccs
> -kms_ccs@pipe-D-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-D-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-D-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-D-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-D-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-D-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-D-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-D-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-D-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-E-bad-pixel-format-y-tiled-ccs
> -kms_ccs@pipe-E-bad-pixel-format-yf-tiled-ccs
> -kms_ccs@pipe-E-bad-pixel-format-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-E-bad-pixel-format-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-E-bad-pixel-format-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-E-bad-pixel-format-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-E-bad-pixel-format-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-E-bad-pixel-format-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-E-bad-pixel-format-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-E-bad-pixel-format-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-E-bad-pixel-format-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-E-bad-rotation-90-y-tiled-ccs
> -kms_ccs@pipe-E-bad-rotation-90-yf-tiled-ccs
> -kms_ccs@pipe-E-bad-rotation-90-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-E-bad-rotation-90-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-E-bad-rotation-90-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-E-bad-rotation-90-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-E-bad-rotation-90-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-E-bad-rotation-90-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-E-bad-rotation-90-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-E-bad-rotation-90-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-E-bad-rotation-90-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-E-crc-primary-basic-y-tiled-ccs
> -kms_ccs@pipe-E-crc-primary-basic-yf-tiled-ccs
> -kms_ccs@pipe-E-crc-primary-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-E-crc-primary-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-E-crc-primary-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-E-crc-primary-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-E-crc-primary-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-E-crc-primary-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-E-crc-primary-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-E-crc-primary-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-E-crc-primary-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-E-crc-primary-rotation-180-y-tiled-ccs
> -kms_ccs@pipe-E-crc-primary-rotation-180-yf-tiled-ccs
> -kms_ccs@pipe-E-crc-primary-rotation-180-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-E-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-E-crc-primary-rotation-180-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-E-crc-primary-rotation-180-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-E-crc-primary-rotation-180-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-E-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-E-crc-primary-rotation-180-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-E-crc-primary-rotation-180-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-E-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-E-random-ccs-data-y-tiled-ccs
> -kms_ccs@pipe-E-random-ccs-data-yf-tiled-ccs
> -kms_ccs@pipe-E-random-ccs-data-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-E-random-ccs-data-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-E-random-ccs-data-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-E-random-ccs-data-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-E-random-ccs-data-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-E-random-ccs-data-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-E-random-ccs-data-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-E-random-ccs-data-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-E-random-ccs-data-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-E-missing-ccs-buffer-y-tiled-ccs
> -kms_ccs@pipe-E-missing-ccs-buffer-yf-tiled-ccs
> -kms_ccs@pipe-E-missing-ccs-buffer-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-E-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-E-missing-ccs-buffer-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-E-missing-ccs-buffer-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-E-missing-ccs-buffer-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-E-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-E-ccs-on-another-bo-y-tiled-ccs
> -kms_ccs@pipe-E-ccs-on-another-bo-yf-tiled-ccs
> -kms_ccs@pipe-E-ccs-on-another-bo-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-E-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-E-ccs-on-another-bo-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-E-ccs-on-another-bo-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-E-ccs-on-another-bo-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-E-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-E-bad-aux-stride-y-tiled-ccs
> -kms_ccs@pipe-E-bad-aux-stride-yf-tiled-ccs
> -kms_ccs@pipe-E-bad-aux-stride-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-E-bad-aux-stride-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-E-bad-aux-stride-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-E-bad-aux-stride-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-E-bad-aux-stride-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-E-bad-aux-stride-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-E-crc-sprite-planes-basic-y-tiled-ccs
> -kms_ccs@pipe-E-crc-sprite-planes-basic-yf-tiled-ccs
> -kms_ccs@pipe-E-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-E-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-E-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-E-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-E-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-E-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-E-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-E-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-E-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-F-bad-pixel-format-y-tiled-ccs
> -kms_ccs@pipe-F-bad-pixel-format-yf-tiled-ccs
> -kms_ccs@pipe-F-bad-pixel-format-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-F-bad-pixel-format-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-F-bad-pixel-format-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-F-bad-pixel-format-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-F-bad-pixel-format-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-F-bad-pixel-format-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-F-bad-pixel-format-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-F-bad-pixel-format-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-F-bad-pixel-format-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-F-bad-rotation-90-y-tiled-ccs
> -kms_ccs@pipe-F-bad-rotation-90-yf-tiled-ccs
> -kms_ccs@pipe-F-bad-rotation-90-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-F-bad-rotation-90-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-F-bad-rotation-90-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-F-bad-rotation-90-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-F-bad-rotation-90-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-F-bad-rotation-90-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-F-bad-rotation-90-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-F-bad-rotation-90-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-F-bad-rotation-90-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-F-crc-primary-basic-y-tiled-ccs
> -kms_ccs@pipe-F-crc-primary-basic-yf-tiled-ccs
> -kms_ccs@pipe-F-crc-primary-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-F-crc-primary-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-F-crc-primary-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-F-crc-primary-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-F-crc-primary-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-F-crc-primary-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-F-crc-primary-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-F-crc-primary-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-F-crc-primary-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-F-crc-primary-rotation-180-y-tiled-ccs
> -kms_ccs@pipe-F-crc-primary-rotation-180-yf-tiled-ccs
> -kms_ccs@pipe-F-crc-primary-rotation-180-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-F-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-F-crc-primary-rotation-180-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-F-crc-primary-rotation-180-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-F-crc-primary-rotation-180-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-F-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-F-crc-primary-rotation-180-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-F-crc-primary-rotation-180-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-F-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-F-random-ccs-data-y-tiled-ccs
> -kms_ccs@pipe-F-random-ccs-data-yf-tiled-ccs
> -kms_ccs@pipe-F-random-ccs-data-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-F-random-ccs-data-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-F-random-ccs-data-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-F-random-ccs-data-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-F-random-ccs-data-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-F-random-ccs-data-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-F-random-ccs-data-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-F-random-ccs-data-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-F-random-ccs-data-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-F-missing-ccs-buffer-y-tiled-ccs
> -kms_ccs@pipe-F-missing-ccs-buffer-yf-tiled-ccs
> -kms_ccs@pipe-F-missing-ccs-buffer-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-F-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-F-missing-ccs-buffer-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-F-missing-ccs-buffer-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-F-missing-ccs-buffer-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-F-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-F-ccs-on-another-bo-y-tiled-ccs
> -kms_ccs@pipe-F-ccs-on-another-bo-yf-tiled-ccs
> -kms_ccs@pipe-F-ccs-on-another-bo-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-F-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-F-ccs-on-another-bo-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-F-ccs-on-another-bo-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-F-ccs-on-another-bo-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-F-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-F-bad-aux-stride-y-tiled-ccs
> -kms_ccs@pipe-F-bad-aux-stride-yf-tiled-ccs
> -kms_ccs@pipe-F-bad-aux-stride-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-F-bad-aux-stride-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-F-bad-aux-stride-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-F-bad-aux-stride-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-F-bad-aux-stride-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-F-bad-aux-stride-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-F-crc-sprite-planes-basic-y-tiled-ccs
> -kms_ccs@pipe-F-crc-sprite-planes-basic-yf-tiled-ccs
> -kms_ccs@pipe-F-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-F-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-F-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-F-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-F-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-F-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-F-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-F-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-F-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-G-bad-pixel-format-y-tiled-ccs
> -kms_ccs@pipe-G-bad-pixel-format-yf-tiled-ccs
> -kms_ccs@pipe-G-bad-pixel-format-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-G-bad-pixel-format-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-G-bad-pixel-format-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-G-bad-pixel-format-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-G-bad-pixel-format-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-G-bad-pixel-format-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-G-bad-pixel-format-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-G-bad-pixel-format-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-G-bad-pixel-format-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-G-bad-rotation-90-y-tiled-ccs
> -kms_ccs@pipe-G-bad-rotation-90-yf-tiled-ccs
> -kms_ccs@pipe-G-bad-rotation-90-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-G-bad-rotation-90-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-G-bad-rotation-90-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-G-bad-rotation-90-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-G-bad-rotation-90-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-G-bad-rotation-90-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-G-bad-rotation-90-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-G-bad-rotation-90-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-G-bad-rotation-90-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-G-crc-primary-basic-y-tiled-ccs
> -kms_ccs@pipe-G-crc-primary-basic-yf-tiled-ccs
> -kms_ccs@pipe-G-crc-primary-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-G-crc-primary-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-G-crc-primary-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-G-crc-primary-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-G-crc-primary-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-G-crc-primary-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-G-crc-primary-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-G-crc-primary-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-G-crc-primary-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-G-crc-primary-rotation-180-y-tiled-ccs
> -kms_ccs@pipe-G-crc-primary-rotation-180-yf-tiled-ccs
> -kms_ccs@pipe-G-crc-primary-rotation-180-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-G-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-G-crc-primary-rotation-180-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-G-crc-primary-rotation-180-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-G-crc-primary-rotation-180-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-G-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-G-crc-primary-rotation-180-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-G-crc-primary-rotation-180-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-G-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-G-random-ccs-data-y-tiled-ccs
> -kms_ccs@pipe-G-random-ccs-data-yf-tiled-ccs
> -kms_ccs@pipe-G-random-ccs-data-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-G-random-ccs-data-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-G-random-ccs-data-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-G-random-ccs-data-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-G-random-ccs-data-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-G-random-ccs-data-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-G-random-ccs-data-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-G-random-ccs-data-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-G-random-ccs-data-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-G-missing-ccs-buffer-y-tiled-ccs
> -kms_ccs@pipe-G-missing-ccs-buffer-yf-tiled-ccs
> -kms_ccs@pipe-G-missing-ccs-buffer-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-G-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-G-missing-ccs-buffer-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-G-missing-ccs-buffer-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-G-missing-ccs-buffer-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-G-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-G-ccs-on-another-bo-y-tiled-ccs
> -kms_ccs@pipe-G-ccs-on-another-bo-yf-tiled-ccs
> -kms_ccs@pipe-G-ccs-on-another-bo-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-G-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-G-ccs-on-another-bo-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-G-ccs-on-another-bo-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-G-ccs-on-another-bo-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-G-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-G-bad-aux-stride-y-tiled-ccs
> -kms_ccs@pipe-G-bad-aux-stride-yf-tiled-ccs
> -kms_ccs@pipe-G-bad-aux-stride-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-G-bad-aux-stride-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-G-bad-aux-stride-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-G-bad-aux-stride-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-G-bad-aux-stride-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-G-bad-aux-stride-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-G-crc-sprite-planes-basic-y-tiled-ccs
> -kms_ccs@pipe-G-crc-sprite-planes-basic-yf-tiled-ccs
> -kms_ccs@pipe-G-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-G-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-G-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-G-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-G-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-G-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-G-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-G-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-G-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-H-bad-pixel-format-y-tiled-ccs
> -kms_ccs@pipe-H-bad-pixel-format-yf-tiled-ccs
> -kms_ccs@pipe-H-bad-pixel-format-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-H-bad-pixel-format-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-H-bad-pixel-format-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-H-bad-pixel-format-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-H-bad-pixel-format-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-H-bad-pixel-format-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-H-bad-pixel-format-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-H-bad-pixel-format-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-H-bad-pixel-format-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-H-bad-rotation-90-y-tiled-ccs
> -kms_ccs@pipe-H-bad-rotation-90-yf-tiled-ccs
> -kms_ccs@pipe-H-bad-rotation-90-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-H-bad-rotation-90-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-H-bad-rotation-90-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-H-bad-rotation-90-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-H-bad-rotation-90-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-H-bad-rotation-90-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-H-bad-rotation-90-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-H-bad-rotation-90-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-H-bad-rotation-90-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-H-crc-primary-basic-y-tiled-ccs
> -kms_ccs@pipe-H-crc-primary-basic-yf-tiled-ccs
> -kms_ccs@pipe-H-crc-primary-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-H-crc-primary-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-H-crc-primary-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-H-crc-primary-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-H-crc-primary-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-H-crc-primary-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-H-crc-primary-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-H-crc-primary-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-H-crc-primary-basic-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-H-crc-primary-rotation-180-y-tiled-ccs
> -kms_ccs@pipe-H-crc-primary-rotation-180-yf-tiled-ccs
> -kms_ccs@pipe-H-crc-primary-rotation-180-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-H-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-H-crc-primary-rotation-180-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-H-crc-primary-rotation-180-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-H-crc-primary-rotation-180-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-H-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-H-crc-primary-rotation-180-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-H-crc-primary-rotation-180-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-H-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-H-random-ccs-data-y-tiled-ccs
> -kms_ccs@pipe-H-random-ccs-data-yf-tiled-ccs
> -kms_ccs@pipe-H-random-ccs-data-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-H-random-ccs-data-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-H-random-ccs-data-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-H-random-ccs-data-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-H-random-ccs-data-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-H-random-ccs-data-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-H-random-ccs-data-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-H-random-ccs-data-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-H-random-ccs-data-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-H-missing-ccs-buffer-y-tiled-ccs
> -kms_ccs@pipe-H-missing-ccs-buffer-yf-tiled-ccs
> -kms_ccs@pipe-H-missing-ccs-buffer-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-H-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-H-missing-ccs-buffer-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-H-missing-ccs-buffer-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-H-missing-ccs-buffer-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-H-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-H-ccs-on-another-bo-y-tiled-ccs
> -kms_ccs@pipe-H-ccs-on-another-bo-yf-tiled-ccs
> -kms_ccs@pipe-H-ccs-on-another-bo-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-H-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-H-ccs-on-another-bo-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-H-ccs-on-another-bo-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-H-ccs-on-another-bo-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-H-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-H-bad-aux-stride-y-tiled-ccs
> -kms_ccs@pipe-H-bad-aux-stride-yf-tiled-ccs
> -kms_ccs@pipe-H-bad-aux-stride-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-H-bad-aux-stride-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-H-bad-aux-stride-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-H-bad-aux-stride-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-H-bad-aux-stride-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-H-bad-aux-stride-4-tiled-mtl-rc-ccs-cc
> -kms_ccs@pipe-H-crc-sprite-planes-basic-y-tiled-ccs
> -kms_ccs@pipe-H-crc-sprite-planes-basic-yf-tiled-ccs
> -kms_ccs@pipe-H-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs
> -kms_ccs@pipe-H-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc
> -kms_ccs@pipe-H-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
> -kms_ccs@pipe-H-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs
> -kms_ccs@pipe-H-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
> -kms_ccs@pipe-H-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc
> -kms_ccs@pipe-H-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs
> -kms_ccs@pipe-H-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
> -kms_ccs@pipe-H-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc
> -kms_cdclk@plane-scaling
> -kms_cdclk@mode-transition
> -kms_cdclk@mode-transition-all-outputs
> -kms_color@degamma
> -kms_color@gamma
> -kms_color@legacy-gamma
> -kms_color@legacy-gamma-reset
> -kms_color@ctm-red-to-blue
> -kms_color@ctm-green-to-red
> -kms_color@ctm-blue-to-red
> -kms_color@ctm-max
> -kms_color@ctm-negative
> -kms_color@ctm-0-25
> -kms_color@ctm-0-50
> -kms_color@ctm-0-75
> -kms_color@ctm-signed
> -kms_color@deep-color
> -kms_color@invalid-gamma-lut-sizes
> -kms_color@invalid-degamma-lut-sizes
> -kms_color@invalid-ctm-matrix-sizes
> -kms_concurrent@multi-plane-atomic-lowres
> -kms_content_protection@legacy
> -kms_content_protection@atomic
> -kms_content_protection@atomic-dpms
> -kms_content_protection@lic
> -kms_content_protection@type1
> -kms_content_protection@mei-interface
> -kms_content_protection@content-type-change
> -kms_content_protection@uevent
> -kms_content_protection@srm
> -kms_content_protection@dp-mst-type-0
> -kms_content_protection@dp-mst-lic-type-0
> -kms_content_protection@dp-mst-type-1
> -kms_content_protection@dp-mst-lic-type-1
> -kms_cursor_crc@cursor-size-change
> -kms_cursor_crc@cursor-alpha-opaque
> -kms_cursor_crc@cursor-alpha-transparent
> -kms_cursor_crc@cursor-dpms
> -kms_cursor_crc@cursor-suspend
> -kms_cursor_crc@cursor-onscreen-32x32
> -kms_cursor_crc@cursor-offscreen-32x32
> -kms_cursor_crc@cursor-sliding-32x32
> -kms_cursor_crc@cursor-random-32x32
> -kms_cursor_crc@cursor-rapid-movement-32x32
> -kms_cursor_crc@cursor-onscreen-32x10
> -kms_cursor_crc@cursor-offscreen-32x10
> -kms_cursor_crc@cursor-sliding-32x10
> -kms_cursor_crc@cursor-random-32x10
> -kms_cursor_crc@cursor-rapid-movement-32x10
> -kms_cursor_crc@cursor-onscreen-64x64
> -kms_cursor_crc@cursor-offscreen-64x64
> -kms_cursor_crc@cursor-sliding-64x64
> -kms_cursor_crc@cursor-random-64x64
> -kms_cursor_crc@cursor-rapid-movement-64x64
> -kms_cursor_crc@cursor-onscreen-64x21
> -kms_cursor_crc@cursor-offscreen-64x21
> -kms_cursor_crc@cursor-sliding-64x21
> -kms_cursor_crc@cursor-random-64x21
> -kms_cursor_crc@cursor-rapid-movement-64x21
> -kms_cursor_crc@cursor-onscreen-128x128
> -kms_cursor_crc@cursor-offscreen-128x128
> -kms_cursor_crc@cursor-sliding-128x128
> -kms_cursor_crc@cursor-random-128x128
> -kms_cursor_crc@cursor-rapid-movement-128x128
> -kms_cursor_crc@cursor-onscreen-128x42
> -kms_cursor_crc@cursor-offscreen-128x42
> -kms_cursor_crc@cursor-sliding-128x42
> -kms_cursor_crc@cursor-random-128x42
> -kms_cursor_crc@cursor-rapid-movement-128x42
> -kms_cursor_crc@cursor-onscreen-256x256
> -kms_cursor_crc@cursor-offscreen-256x256
> -kms_cursor_crc@cursor-sliding-256x256
> -kms_cursor_crc@cursor-random-256x256
> -kms_cursor_crc@cursor-rapid-movement-256x256
> -kms_cursor_crc@cursor-onscreen-256x85
> -kms_cursor_crc@cursor-offscreen-256x85
> -kms_cursor_crc@cursor-sliding-256x85
> -kms_cursor_crc@cursor-random-256x85
> -kms_cursor_crc@cursor-rapid-movement-256x85
> -kms_cursor_crc@cursor-onscreen-512x512
> -kms_cursor_crc@cursor-offscreen-512x512
> -kms_cursor_crc@cursor-sliding-512x512
> -kms_cursor_crc@cursor-random-512x512
> -kms_cursor_crc@cursor-rapid-movement-512x512
> -kms_cursor_crc@cursor-onscreen-512x170
> -kms_cursor_crc@cursor-offscreen-512x170
> -kms_cursor_crc@cursor-sliding-512x170
> -kms_cursor_crc@cursor-random-512x170
> -kms_cursor_crc@cursor-rapid-movement-512x170
> -kms_cursor_crc@cursor-onscreen-max-size
> -kms_cursor_crc@cursor-offscreen-max-size
> -kms_cursor_crc@cursor-sliding-max-size
> -kms_cursor_crc@cursor-random-max-size
> -kms_cursor_crc@cursor-rapid-movement-max-size
> -kms_cursor_legacy@single-bo
> -kms_cursor_legacy@single-move
> -kms_cursor_legacy@forked-bo
> -kms_cursor_legacy@forked-move
> -kms_cursor_legacy@torture-bo
> -kms_cursor_legacy@torture-move
> -kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic
> -kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic
> -kms_cursor_legacy@2x-flip-vs-cursor-legacy
> -kms_cursor_legacy@2x-flip-vs-cursor-atomic
> -kms_cursor_legacy@2x-long-flip-vs-cursor-legacy
> -kms_cursor_legacy@2x-long-flip-vs-cursor-atomic
> -kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic
> -kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic
> -kms_cursor_legacy@2x-cursor-vs-flip-legacy
> -kms_cursor_legacy@2x-long-cursor-vs-flip-legacy
> -kms_cursor_legacy@2x-cursor-vs-flip-atomic
> -kms_cursor_legacy@2x-long-cursor-vs-flip-atomic
> -kms_cursor_legacy@flip-vs-cursor-crc-legacy
> -kms_cursor_legacy@flip-vs-cursor-crc-atomic
> -kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy
> -kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic
> -kms_cursor_legacy@basic-flip-before-cursor-legacy
> -kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
> -kms_cursor_legacy@basic-flip-after-cursor-legacy
> -kms_cursor_legacy@basic-flip-before-cursor-varying-size
> -kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size
> -kms_cursor_legacy@basic-flip-after-cursor-varying-size
> -kms_cursor_legacy@short-flip-before-cursor-toggle
> -kms_cursor_legacy@short-busy-flip-before-cursor-toggle
> -kms_cursor_legacy@short-flip-after-cursor-toggle
> -kms_cursor_legacy@basic-flip-before-cursor-atomic
> -kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
> -kms_cursor_legacy@basic-flip-after-cursor-atomic
> -kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
> -kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions
> -kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
> -kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
> -kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size
> -kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
> -kms_cursor_legacy@cursor-vs-flip-legacy
> -kms_cursor_legacy@flip-vs-cursor-legacy
> -kms_cursor_legacy@cursorA-vs-flipA-legacy
> -kms_cursor_legacy@cursorA-vs-flipB-legacy
> -kms_cursor_legacy@cursorB-vs-flipA-legacy
> -kms_cursor_legacy@cursorB-vs-flipB-legacy
> -kms_cursor_legacy@cursor-vs-flip-varying-size
> -kms_cursor_legacy@flip-vs-cursor-varying-size
> -kms_cursor_legacy@cursorA-vs-flipA-varying-size
> -kms_cursor_legacy@cursorA-vs-flipB-varying-size
> -kms_cursor_legacy@cursorB-vs-flipA-varying-size
> -kms_cursor_legacy@cursorB-vs-flipB-varying-size
> -kms_cursor_legacy@cursor-vs-flip-toggle
> -kms_cursor_legacy@flip-vs-cursor-toggle
> -kms_cursor_legacy@cursorA-vs-flipA-toggle
> -kms_cursor_legacy@cursorA-vs-flipB-toggle
> -kms_cursor_legacy@cursorB-vs-flipA-toggle
> -kms_cursor_legacy@cursorB-vs-flipB-toggle
> -kms_cursor_legacy@cursor-vs-flip-atomic
> -kms_cursor_legacy@flip-vs-cursor-atomic
> -kms_cursor_legacy@cursorA-vs-flipA-atomic
> -kms_cursor_legacy@cursorA-vs-flipB-atomic
> -kms_cursor_legacy@cursorB-vs-flipA-atomic
> -kms_cursor_legacy@cursorB-vs-flipB-atomic
> -kms_cursor_legacy@cursor-vs-flip-atomic-transitions
> -kms_cursor_legacy@flip-vs-cursor-atomic-transitions
> -kms_cursor_legacy@cursorA-vs-flipA-atomic-transitions
> -kms_cursor_legacy@cursorA-vs-flipB-atomic-transitions
> -kms_cursor_legacy@cursorB-vs-flipA-atomic-transitions
> -kms_cursor_legacy@cursorB-vs-flipB-atomic-transitions
> -kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size
> -kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
> -kms_cursor_legacy@cursorA-vs-flipA-atomic-transitions-varying-size
> -kms_cursor_legacy@cursorA-vs-flipB-atomic-transitions-varying-size
> -kms_cursor_legacy@cursorB-vs-flipA-atomic-transitions-varying-size
> -kms_cursor_legacy@cursorB-vs-flipB-atomic-transitions-varying-size
> -kms_dither@fb-8bpc-vs-panel-6bpc
> -kms_dither@fb-8bpc-vs-panel-8bpc
> -kms_dp_aux_dev
> -kms_tiled_display@basic-test-pattern
> -kms_tiled_display@basic-test-pattern-with-chamelium
> -kms_draw_crc@draw-method-mmap-cpu
> -kms_draw_crc@draw-method-mmap-gtt
> -kms_draw_crc@draw-method-mmap-wc
> -kms_draw_crc@draw-method-pwrite
> -kms_draw_crc@draw-method-blt
> -kms_draw_crc@draw-method-render
> -kms_draw_crc@fill-fb
> -kms_dsc@dsc-basic
> -kms_dsc@dsc-with-formats
> -kms_dsc@dsc-with-bpc
> -kms_dsc@dsc-with-bpc-formats
> -kms_dsc@dsc-with-output-formats
> -kms_fbcon_fbt@fbc
> -kms_fbcon_fbt@psr
> -kms_fbcon_fbt@fbc-suspend
> -kms_fbcon_fbt@psr-suspend
> -kms_fence_pin_leak
> -kms_flip@nonblocking-read
> -kms_flip@wf_vblank-ts-check
> -kms_flip@2x-wf_vblank-ts-check
> -kms_flip@blocking-wf_vblank
> -kms_flip@2x-blocking-wf_vblank
> -kms_flip@absolute-wf_vblank
> -kms_flip@2x-absolute-wf_vblank
> -kms_flip@blocking-absolute-wf_vblank
> -kms_flip@2x-blocking-absolute-wf_vblank
> -kms_flip@basic-plain-flip
> -kms_flip@2x-plain-flip
> -kms_flip@busy-flip
> -kms_flip@2x-busy-flip
> -kms_flip@flip-vs-fences
> -kms_flip@2x-flip-vs-fences
> -kms_flip@plain-flip-ts-check
> -kms_flip@2x-plain-flip-ts-check
> -kms_flip@plain-flip-fb-recreate
> -kms_flip@2x-plain-flip-fb-recreate
> -kms_flip@flip-vs-rmfb
> -kms_flip@2x-flip-vs-rmfb
> -kms_flip@basic-flip-vs-dpms
> -kms_flip@2x-flip-vs-dpms
> -kms_flip@flip-vs-panning
> -kms_flip@2x-flip-vs-panning
> -kms_flip@basic-flip-vs-modeset
> -kms_flip@2x-flip-vs-modeset
> -kms_flip@flip-vs-expired-vblank
> -kms_flip@2x-flip-vs-expired-vblank
> -kms_flip@flip-vs-absolute-wf_vblank
> -kms_flip@2x-flip-vs-absolute-wf_vblank
> -kms_flip@basic-flip-vs-wf_vblank
> -kms_flip@2x-flip-vs-wf_vblank
> -kms_flip@flip-vs-blocking-wf-vblank
> -kms_flip@2x-flip-vs-blocking-wf-vblank
> -kms_flip@flip-vs-modeset-vs-hang
> -kms_flip@2x-flip-vs-modeset-vs-hang
> -kms_flip@flip-vs-panning-vs-hang
> -kms_flip@2x-flip-vs-panning-vs-hang
> -kms_flip@flip-vs-dpms-off-vs-modeset
> -kms_flip@2x-flip-vs-dpms-off-vs-modeset
> -kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset
> -kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset
> -kms_flip@dpms-off-confusion
> -kms_flip@nonexisting-fb
> -kms_flip@2x-nonexisting-fb
> -kms_flip@dpms-vs-vblank-race
> -kms_flip@2x-dpms-vs-vblank-race
> -kms_flip@modeset-vs-vblank-race
> -kms_flip@2x-modeset-vs-vblank-race
> -kms_flip@bo-too-big
> -kms_flip@flip-vs-suspend
> -kms_flip@2x-flip-vs-suspend
> -kms_flip@wf_vblank-ts-check-interruptible
> -kms_flip@2x-wf_vblank-ts-check-interruptible
> -kms_flip@absolute-wf_vblank-interruptible
> -kms_flip@2x-absolute-wf_vblank-interruptible
> -kms_flip@blocking-absolute-wf_vblank-interruptible
> -kms_flip@2x-blocking-absolute-wf_vblank-interruptible
> -kms_flip@plain-flip-interruptible
> -kms_flip@2x-plain-flip-interruptible
> -kms_flip@flip-vs-fences-interruptible
> -kms_flip@2x-flip-vs-fences-interruptible
> -kms_flip@plain-flip-ts-check-interruptible
> -kms_flip@2x-plain-flip-ts-check-interruptible
> -kms_flip@plain-flip-fb-recreate-interruptible
> -kms_flip@2x-plain-flip-fb-recreate-interruptible
> -kms_flip@flip-vs-rmfb-interruptible
> -kms_flip@2x-flip-vs-rmfb-interruptible
> -kms_flip@flip-vs-panning-interruptible
> -kms_flip@2x-flip-vs-panning-interruptible
> -kms_flip@flip-vs-expired-vblank-interruptible
> -kms_flip@2x-flip-vs-expired-vblank-interruptible
> -kms_flip@flip-vs-absolute-wf_vblank-interruptible
> -kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible
> -kms_flip@flip-vs-wf_vblank-interruptible
> -kms_flip@2x-flip-vs-wf_vblank-interruptible
> -kms_flip@flip-vs-dpms-off-vs-modeset-interruptible
> -kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible
> -kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
> -kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
> -kms_flip@dpms-off-confusion-interruptible
> -kms_flip@nonexisting-fb-interruptible
> -kms_flip@2x-nonexisting-fb-interruptible
> -kms_flip@dpms-vs-vblank-race-interruptible
> -kms_flip@2x-dpms-vs-vblank-race-interruptible
> -kms_flip@modeset-vs-vblank-race-interruptible
> -kms_flip@2x-modeset-vs-vblank-race-interruptible
> -kms_flip@bo-too-big-interruptible
> -kms_flip@flip-vs-suspend-interruptible
> -kms_flip@2x-flip-vs-suspend-interruptible
> -kms_flip_event_leak@basic
> -kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
> -kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling
> -kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling
> -kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling
> -kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
> -kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling
> -kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling
> -kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling
> -kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
> -kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling
> -kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling
> -kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling
> -kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling
> -kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
> -kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling
> -kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling
> -kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling
> -kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling
> -kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
> -kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling
> -kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
> -kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling
> -kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling
> -kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling
> -kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
> -kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling
> -kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling
> -kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling
> -kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
> -kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling
> -kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling
> -kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling
> -kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling
> -kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
> -kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling
> -kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
> -kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
> -kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling
> -kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
> -kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
> -kms_force_connector_basic@force-load-detect
> -kms_force_connector_basic@force-connector-state
> -kms_force_connector_basic@force-edid
> -kms_force_connector_basic@prune-stale-modes
> -kms_frontbuffer_tracking@fbc-1p-rte
> -kms_frontbuffer_tracking@fbc-2p-rte
> -kms_frontbuffer_tracking@psr-1p-rte
> -kms_frontbuffer_tracking@psr-2p-rte
> -kms_frontbuffer_tracking@fbcpsr-1p-rte
> -kms_frontbuffer_tracking@fbcpsr-2p-rte
> -kms_frontbuffer_tracking@drrs-1p-rte
> -kms_frontbuffer_tracking@drrs-2p-rte
> -kms_frontbuffer_tracking@fbcdrrs-1p-rte
> -kms_frontbuffer_tracking@fbcdrrs-2p-rte
> -kms_frontbuffer_tracking@psrdrrs-1p-rte
> -kms_frontbuffer_tracking@psrdrrs-2p-rte
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-rte
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-render
> -kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-plflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-pgflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-msflip-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-plflip-blt
> -kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack-mmap-gtt
> -kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move
> -kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move
> -kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-move
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-move
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-move
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-onoff
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-move
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-onoff
> -kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
> -kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@psrdrrs-1p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@psrdrrs-2p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@fbcpsrdrrs-1p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@fbcpsrdrrs-2p-pri-indfb-multidraw
> -kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt
> -kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt
> -kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-farfromfence-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence-mmap-gtt
> -kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc
> -kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite
> -kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite
> -kms_frontbuffer_tracking@fbc-rgb565-draw-blt
> -kms_frontbuffer_tracking@fbc-rgb101010-draw-blt
> -kms_frontbuffer_tracking@fbc-rgb565-draw-render
> -kms_frontbuffer_tracking@fbc-rgb101010-draw-render
> -kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu
> -kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt
> -kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc
> -kms_frontbuffer_tracking@psr-rgb565-draw-pwrite
> -kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite
> -kms_frontbuffer_tracking@psr-rgb565-draw-blt
> -kms_frontbuffer_tracking@psr-rgb101010-draw-blt
> -kms_frontbuffer_tracking@psr-rgb565-draw-render
> -kms_frontbuffer_tracking@psr-rgb101010-draw-render
> -kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt
> -kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render
> -kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render
> -kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-cpu
> -kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-gtt
> -kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc
> -kms_frontbuffer_tracking@drrs-rgb565-draw-pwrite
> -kms_frontbuffer_tracking@drrs-rgb101010-draw-pwrite
> -kms_frontbuffer_tracking@drrs-rgb565-draw-blt
> -kms_frontbuffer_tracking@drrs-rgb101010-draw-blt
> -kms_frontbuffer_tracking@drrs-rgb565-draw-render
> -kms_frontbuffer_tracking@drrs-rgb101010-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-pwrite
> -kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt
> -kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render
> -kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render
> -kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-cpu
> -kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-gtt
> -kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-wc
> -kms_frontbuffer_tracking@psrdrrs-rgb565-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-pwrite
> -kms_frontbuffer_tracking@psrdrrs-rgb565-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-blt
> -kms_frontbuffer_tracking@psrdrrs-rgb565-draw-render
> -kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-cpu
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-gtt
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-wc
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-pwrite
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-blt
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-render
> -kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-render
> -kms_frontbuffer_tracking@fbc-indfb-scaledprimary
> -kms_frontbuffer_tracking@fbc-shrfb-scaledprimary
> -kms_frontbuffer_tracking@psr-indfb-scaledprimary
> -kms_frontbuffer_tracking@psr-shrfb-scaledprimary
> -kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary
> -kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary
> -kms_frontbuffer_tracking@drrs-indfb-scaledprimary
> -kms_frontbuffer_tracking@drrs-shrfb-scaledprimary
> -kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary
> -kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary
> -kms_frontbuffer_tracking@psrdrrs-indfb-scaledprimary
> -kms_frontbuffer_tracking@psrdrrs-shrfb-scaledprimary
> -kms_frontbuffer_tracking@fbcpsrdrrs-indfb-scaledprimary
> -kms_frontbuffer_tracking@fbcpsrdrrs-shrfb-scaledprimary
> -kms_frontbuffer_tracking@fbc-modesetfrombusy
> -kms_frontbuffer_tracking@fbc-stridechange
> -kms_frontbuffer_tracking@fbc-tiling-linear
> -kms_frontbuffer_tracking@fbc-tiling-y
> -kms_frontbuffer_tracking@fbc-tiling-4
> -kms_frontbuffer_tracking@fbc-suspend
> -kms_frontbuffer_tracking@psr-modesetfrombusy
> -kms_frontbuffer_tracking@psr-slowdraw
> -kms_frontbuffer_tracking@psr-suspend
> -kms_frontbuffer_tracking@fbcpsr-modesetfrombusy
> -kms_frontbuffer_tracking@fbcpsr-stridechange
> -kms_frontbuffer_tracking@fbcpsr-tiling-linear
> -kms_frontbuffer_tracking@fbcpsr-tiling-y
> -kms_frontbuffer_tracking@fbcpsr-tiling-4
> -kms_frontbuffer_tracking@fbcpsr-slowdraw
> -kms_frontbuffer_tracking@fbcpsr-suspend
> -kms_frontbuffer_tracking@drrs-modesetfrombusy
> -kms_frontbuffer_tracking@drrs-slowdraw
> -kms_frontbuffer_tracking@drrs-suspend
> -kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy
> -kms_frontbuffer_tracking@fbcdrrs-stridechange
> -kms_frontbuffer_tracking@fbcdrrs-tiling-linear
> -kms_frontbuffer_tracking@fbcdrrs-tiling-y
> -kms_frontbuffer_tracking@fbcdrrs-tiling-4
> -kms_frontbuffer_tracking@fbcdrrs-slowdraw
> -kms_frontbuffer_tracking@fbcdrrs-suspend
> -kms_frontbuffer_tracking@psrdrrs-modesetfrombusy
> -kms_frontbuffer_tracking@psrdrrs-slowdraw
> -kms_frontbuffer_tracking@psrdrrs-suspend
> -kms_frontbuffer_tracking@fbcpsrdrrs-modesetfrombusy
> -kms_frontbuffer_tracking@fbcpsrdrrs-stridechange
> -kms_frontbuffer_tracking@fbcpsrdrrs-tiling-linear
> -kms_frontbuffer_tracking@fbcpsrdrrs-tiling-y
> -kms_frontbuffer_tracking@fbcpsrdrrs-tiling-4
> -kms_frontbuffer_tracking@fbcpsrdrrs-slowdraw
> -kms_frontbuffer_tracking@fbcpsrdrrs-suspend
> -kms_frontbuffer_tracking@basic
> -kms_getfb@getfb-handle-zero
> -kms_getfb@getfb-handle-valid
> -kms_getfb@getfb-handle-closed
> -kms_getfb@getfb-handle-not-fb
> -kms_getfb@getfb-addfb-different-handles
> -kms_getfb@getfb-repeated-different-handles
> -kms_getfb@getfb-reject-ccs
> -kms_getfb@getfb2-handle-zero
> -kms_getfb@getfb2-handle-closed
> -kms_getfb@getfb2-handle-not-fb
> -kms_getfb@getfb2-accept-ccs
> -kms_getfb@getfb2-into-addfb2
> -kms_getfb@getfb-handle-protection
> -kms_getfb@getfb2-handle-protection
> -kms_hdmi_inject@inject-4k
> -kms_hdmi_inject@inject-audio
> -kms_hdr@bpc-switch
> -kms_hdr@bpc-switch-dpms
> -kms_hdr@bpc-switch-suspend
> -kms_hdr@static-toggle
> -kms_hdr@static-toggle-dpms
> -kms_hdr@static-toggle-suspend
> -kms_hdr@static-swap
> -kms_hdr@invalid-metadata-sizes
> -kms_hdr@invalid-hdr
> -kms_invalid_mode@clock-too-high
> -kms_invalid_mode@zero-clock
> -kms_invalid_mode@int-max-clock
> -kms_invalid_mode@uint-max-clock
> -kms_invalid_mode@zero-hdisplay
> -kms_invalid_mode@zero-vdisplay
> -kms_invalid_mode@bad-hsync-start
> -kms_invalid_mode@bad-vsync-start
> -kms_invalid_mode@bad-hsync-end
> -kms_invalid_mode@bad-vsync-end
> -kms_invalid_mode@bad-htotal
> -kms_invalid_mode@bad-vtotal
> -kms_legacy_colorkey@basic
> -kms_legacy_colorkey@invalid-plane
> -kms_multipipe_modeset@basic-max-pipe-crc-check
> -kms_panel_fitting@legacy
> -kms_panel_fitting@atomic-fastset
> -kms_pipe_b_c_ivb@pipe-B-dpms-off-modeset-pipe-C
> -kms_pipe_b_c_ivb@pipe-B-double-modeset-then-modeset-pipe-C
> -kms_pipe_b_c_ivb@disable-pipe-B-enable-pipe-C
> -kms_pipe_b_c_ivb@from-pipe-C-to-B-with-3-lanes
> -kms_pipe_b_c_ivb@enable-pipe-C-while-B-has-3-lanes
> -kms_pipe_crc_basic@bad-source
> -kms_pipe_crc_basic@read-crc
> -kms_pipe_crc_basic@read-crc-frame-sequence
> -kms_pipe_crc_basic@nonblocking-crc
> -kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> -kms_pipe_crc_basic@suspend-read-crc
> -kms_pipe_crc_basic@hang-read-crc
> -kms_pipe_crc_basic@disable-crc-after-crtc
> -kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
> -kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
> -kms_plane@pixel-format
> -kms_plane@pixel-format-source-clamping
> -kms_plane@plane-position-covered
> -kms_plane@plane-position-hole
> -kms_plane@plane-position-hole-dpms
> -kms_plane@plane-panning-top-left
> -kms_plane@plane-panning-bottom-right
> -kms_plane@plane-panning-bottom-right-suspend
> -kms_plane@planar-pixel-format-settings
> -kms_plane_alpha_blend@alpha-basic
> -kms_plane_alpha_blend@alpha-7efc
> -kms_plane_alpha_blend@coverage-7efc
> -kms_plane_alpha_blend@coverage-vs-premult-vs-constant
> -kms_plane_alpha_blend@alpha-transparent-fb
> -kms_plane_alpha_blend@alpha-opaque-fb
> -kms_plane_alpha_blend@constant-alpha-min
> -kms_plane_alpha_blend@constant-alpha-mid
> -kms_plane_alpha_blend@constant-alpha-max
> -kms_plane_cursor@primary
> -kms_plane_cursor@overlay
> -kms_plane_cursor@viewport
> -kms_plane_lowres@tiling-none
> -kms_plane_lowres@tiling-x
> -kms_plane_lowres@tiling-y
> -kms_plane_lowres@tiling-yf
> -kms_plane_lowres@tiling-4
> -kms_plane_multiple@tiling-none
> -kms_plane_multiple@tiling-x
> -kms_plane_multiple@tiling-y
> -kms_plane_multiple@tiling-yf
> -kms_plane_multiple@tiling-4
> -kms_plane_scaling@plane-upscale-20x20-with-pixel-format
> -kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format
> -kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format
> -kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format
> -kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format
> -kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format
> -kms_plane_scaling@plane-upscale-20x20-with-rotation
> -kms_plane_scaling@plane-upscale-factor-0-25-with-rotation
> -kms_plane_scaling@plane-downscale-factor-0-25-with-rotation
> -kms_plane_scaling@plane-downscale-factor-0-5-with-rotation
> -kms_plane_scaling@plane-downscale-factor-0-75-with-rotation
> -kms_plane_scaling@plane-scaler-unity-scaling-with-rotation
> -kms_plane_scaling@plane-upscale-20x20-with-modifiers
> -kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers
> -kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers
> -kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers
> -kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers
> -kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers
> -kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats
> -kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation
> -kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers
> -kms_plane_scaling@planes-upscale-20x20
> -kms_plane_scaling@planes-upscale-factor-0-25
> -kms_plane_scaling@planes-scaler-unity-scaling
> -kms_plane_scaling@planes-downscale-factor-0-25
> -kms_plane_scaling@planes-downscale-factor-0-5
> -kms_plane_scaling@planes-downscale-factor-0-75
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75
> -kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25
> -kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5
> -kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75
> -kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25
> -kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5
> -kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75
> -kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20
> -kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25
> -kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling
> -kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20
> -kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25
> -kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling
> -kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20
> -kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25
> -kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling
> -kms_plane_scaling@intel-max-src-size
> -kms_plane_scaling@invalid-num-scalers
> -kms_plane_scaling@invalid-parameters
> -kms_plane_scaling@2x-scaler-multi-pipe
> -kms_prime@basic-crc-hybrid
> -kms_prime@basic-modeset-hybrid
> -kms_prime@D3hot
> -kms_prime@basic-crc-vgem
> -kms_prop_blob@basic
> -kms_prop_blob@blob-prop-core
> -kms_prop_blob@blob-prop-validate
> -kms_prop_blob@blob-prop-lifetime
> -kms_prop_blob@blob-multiple
> -kms_prop_blob@invalid-get-prop-any
> -kms_prop_blob@invalid-get-prop
> -kms_prop_blob@invalid-set-prop-any
> -kms_prop_blob@invalid-set-prop
> -kms_properties@plane-properties-legacy
> -kms_properties@plane-properties-atomic
> -kms_properties@crtc-properties-legacy
> -kms_properties@crtc-properties-atomic
> -kms_properties@connector-properties-legacy
> -kms_properties@connector-properties-atomic
> -kms_properties@invalid-properties-legacy
> -kms_properties@invalid-properties-atomic
> -kms_properties@get_properties-sanity-atomic
> -kms_properties@get_properties-sanity-non-atomic
> -kms_psr@pr-basic
> -kms_psr@pr-no-drrs
> -kms_psr@pr-primary-page-flip
> -kms_psr@pr-primary-mmap-gtt
> -kms_psr@pr-primary-mmap-cpu
> -kms_psr@pr-primary-blt
> -kms_psr@pr-primary-render
> -kms_psr@pr-sprite-mmap-gtt
> -kms_psr@pr-cursor-mmap-gtt
> -kms_psr@pr-sprite-mmap-cpu
> -kms_psr@pr-cursor-mmap-cpu
> -kms_psr@pr-sprite-blt
> -kms_psr@pr-cursor-blt
> -kms_psr@pr-sprite-render
> -kms_psr@pr-cursor-render
> -kms_psr@pr-sprite-plane-move
> -kms_psr@pr-cursor-plane-move
> -kms_psr@pr-sprite-plane-onoff
> -kms_psr@pr-cursor-plane-onoff
> -kms_psr@pr-dpms
> -kms_psr@pr-suspend
> -kms_psr@psr-basic
> -kms_psr@psr-no-drrs
> -kms_psr@psr-primary-page-flip
> -kms_psr@psr-primary-mmap-gtt
> -kms_psr@psr-primary-mmap-cpu
> -kms_psr@psr-primary-blt
> -kms_psr@psr-primary-render
> -kms_psr@psr-sprite-mmap-gtt
> -kms_psr@psr-cursor-mmap-gtt
> -kms_psr@psr-sprite-mmap-cpu
> -kms_psr@psr-cursor-mmap-cpu
> -kms_psr@psr-sprite-blt
> -kms_psr@psr-cursor-blt
> -kms_psr@psr-sprite-render
> -kms_psr@psr-cursor-render
> -kms_psr@psr-sprite-plane-move
> -kms_psr@psr-cursor-plane-move
> -kms_psr@psr-sprite-plane-onoff
> -kms_psr@psr-cursor-plane-onoff
> -kms_psr@psr-dpms
> -kms_psr@psr-suspend
> -kms_psr@psr2-basic
> -kms_psr@psr2-no-drrs
> -kms_psr@psr2-primary-page-flip
> -kms_psr@psr2-primary-mmap-gtt
> -kms_psr@psr2-primary-mmap-cpu
> -kms_psr@psr2-primary-blt
> -kms_psr@psr2-primary-render
> -kms_psr@psr2-sprite-mmap-gtt
> -kms_psr@psr2-cursor-mmap-gtt
> -kms_psr@psr2-sprite-mmap-cpu
> -kms_psr@psr2-cursor-mmap-cpu
> -kms_psr@psr2-sprite-blt
> -kms_psr@psr2-cursor-blt
> -kms_psr@psr2-sprite-render
> -kms_psr@psr2-cursor-render
> -kms_psr@psr2-sprite-plane-move
> -kms_psr@psr2-cursor-plane-move
> -kms_psr@psr2-sprite-plane-onoff
> -kms_psr@psr2-cursor-plane-onoff
> -kms_psr@psr2-dpms
> -kms_psr@psr2-suspend
> -kms_psr2_sf@primary-plane-update-sf-dmg-area
> -kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb
> -kms_psr2_sf@overlay-plane-update-sf-dmg-area
> -kms_psr2_sf@cursor-plane-update-sf
> -kms_psr2_sf@cursor-plane-move-continuous-sf
> -kms_psr2_sf@cursor-plane-move-continuous-exceed-sf
> -kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf
> -kms_psr2_sf@plane-move-sf-dmg-area
> -kms_psr2_sf@overlay-plane-move-continuous-sf
> -kms_psr2_sf@overlay-plane-move-continuous-exceed-sf
> -kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf
> -kms_psr2_sf@overlay-primary-update-sf-dmg-area
> -kms_psr2_sf@overlay-plane-update-continuous-sf
> -kms_psr2_su@page_flip-XRGB8888
> -kms_psr2_su@page_flip-NV12
> -kms_psr2_su@page_flip-P010
> -kms_psr2_su@frontbuffer-XRGB8888
> -kms_pwrite_crc
> -kms_rmfb@rmfb-ioctl
> -kms_rmfb@close-fd
> -kms_rotation_crc@primary-rotation-90
> -kms_rotation_crc@primary-rotation-180
> -kms_rotation_crc@primary-rotation-270
> -kms_rotation_crc@sprite-rotation-90
> -kms_rotation_crc@sprite-rotation-180
> -kms_rotation_crc@sprite-rotation-270
> -kms_rotation_crc@cursor-rotation-180
> -kms_rotation_crc@sprite-rotation-90-pos-100-0
> -kms_rotation_crc@bad-pixel-format
> -kms_rotation_crc@bad-tiling
> -kms_rotation_crc@primary-x-tiled-reflect-x-0
> -kms_rotation_crc@primary-x-tiled-reflect-x-180
> -kms_rotation_crc@primary-y-tiled-reflect-x-0
> -kms_rotation_crc@primary-y-tiled-reflect-x-90
> -kms_rotation_crc@primary-y-tiled-reflect-x-180
> -kms_rotation_crc@primary-y-tiled-reflect-x-270
> -kms_rotation_crc@primary-yf-tiled-reflect-x-0
> -kms_rotation_crc@primary-yf-tiled-reflect-x-90
> -kms_rotation_crc@primary-yf-tiled-reflect-x-180
> -kms_rotation_crc@primary-yf-tiled-reflect-x-270
> -kms_rotation_crc@primary-4-tiled-reflect-x-0
> -kms_rotation_crc@primary-4-tiled-reflect-x-180
> -kms_rotation_crc@multiplane-rotation
> -kms_rotation_crc@multiplane-rotation-cropping-top
> -kms_rotation_crc@multiplane-rotation-cropping-bottom
> -kms_rotation_crc@exhaust-fences
> -kms_scaling_modes@scaling-mode-full
> -kms_scaling_modes@scaling-mode-center
> -kms_scaling_modes@scaling-mode-full-aspect
> -kms_scaling_modes@scaling-mode-none
> -kms_selftest@drm_cmdline_parser
> -kms_selftest@drm_damage_helper
> -kms_selftest@drm_dp_mst_helper
> -kms_selftest@drm_format_helper
> -kms_selftest@drm_format
> -kms_selftest@drm_framebuffer
> -kms_selftest@drm_plane_helper
> -kms_setmode@basic
> -kms_setmode@basic-clone-single-crtc
> -kms_setmode@invalid-clone-single-crtc
> -kms_setmode@invalid-clone-exclusive-crtc
> -kms_setmode@clone-exclusive-crtc
> -kms_setmode@invalid-clone-single-crtc-stealing
> -kms_sysfs_edid_timing
> -kms_tv_load_detect@load-detect
> -kms_universal_plane@universal-plane-functional
> -kms_universal_plane@universal-plane-sanity
> -kms_universal_plane@disable-primary-vs-flip
> -kms_universal_plane@cursor-fb-leak
> -kms_universal_plane@universal-plane-pageflip-windowed
> -kms_vblank@invalid
> -kms_vblank@crtc-id
> -kms_vblank@accuracy-idle
> -kms_vblank@query-idle
> -kms_vblank@query-idle-hang
> -kms_vblank@query-forked
> -kms_vblank@query-forked-hang
> -kms_vblank@query-busy
> -kms_vblank@query-busy-hang
> -kms_vblank@query-forked-busy
> -kms_vblank@query-forked-busy-hang
> -kms_vblank@wait-idle
> -kms_vblank@wait-idle-hang
> -kms_vblank@wait-forked
> -kms_vblank@wait-forked-hang
> -kms_vblank@wait-busy
> -kms_vblank@wait-busy-hang
> -kms_vblank@wait-forked-busy
> -kms_vblank@wait-forked-busy-hang
> -kms_vblank@ts-continuation-idle
> -kms_vblank@ts-continuation-idle-hang
> -kms_vblank@ts-continuation-dpms-rpm
> -kms_vblank@ts-continuation-dpms-suspend
> -kms_vblank@ts-continuation-suspend
> -kms_vblank@ts-continuation-modeset
> -kms_vblank@ts-continuation-modeset-hang
> -kms_vblank@ts-continuation-modeset-rpm
> -kms_vrr@flip-basic
> -kms_vrr@flip-dpms
> -kms_vrr@flip-suspend
> -kms_vrr@flipline
> -kms_vrr@negative-basic
> -kms_writeback@writeback-pixel-formats
> -kms_writeback@writeback-invalid-parameters
> -kms_writeback@writeback-fb-id
> -kms_writeback@writeback-check-output
> -prime_mmap_kms@buffer-sharing
> -msm_shrink@copy-gpu-sanitycheck-8
> -msm_shrink@copy-gpu-sanitycheck-32
> -msm_shrink@copy-gpu-8
> -msm_shrink@copy-gpu-32
> -msm_shrink@copy-gpu-madvise-8
> -msm_shrink@copy-gpu-madvise-32
> -msm_shrink@copy-gpu-oom-8
> -msm_shrink@copy-gpu-oom-32
> -msm_shrink@copy-mmap-sanitycheck-8
> -msm_shrink@copy-mmap-sanitycheck-32
> -msm_shrink@copy-mmap-8
> -msm_shrink@copy-mmap-32
> -msm_shrink@copy-mmap-madvise-8
> -msm_shrink@copy-mmap-madvise-32
> -msm_shrink@copy-mmap-oom-8
> -msm_shrink@copy-mmap-oom-32
> -msm_shrink@copy-mmap-dmabuf-sanitycheck-8
> -msm_shrink@copy-mmap-dmabuf-sanitycheck-32
> -msm_shrink@copy-mmap-dmabuf-8
> -msm_shrink@copy-mmap-dmabuf-32
> -msm_shrink@copy-mmap-dmabuf-madvise-8
> -msm_shrink@copy-mmap-dmabuf-madvise-32
> -msm_shrink@copy-mmap-dmabuf-oom-8
> -msm_shrink@copy-mmap-dmabuf-oom-32
> -msm_mapping@ring
> -msm_mapping@sqefw
> -msm_mapping@shadow
> -msm_submitoverhead@submitbench-10-bos
> -msm_submitoverhead@submitbench-10-bos-no-implicit-sync
> -msm_submitoverhead@submitbench-100-bos
> -msm_submitoverhead@submitbench-100-bos-no-implicit-sync
> -msm_submitoverhead@submitbench-250-bos
> -msm_submitoverhead@submitbench-250-bos-no-implicit-sync
> -msm_submitoverhead@submitbench-500-bos
> -msm_submitoverhead@submitbench-500-bos-no-implicit-sync
> -msm_submitoverhead@submitbench-1000-bos
> -msm_submitoverhead@submitbench-1000-bos-no-implicit-sync
> -msm_recovery@hangcheck
> -msm_recovery@gpu-fault
> -msm_recovery@gpu-fault-parallel
> -msm_recovery@iova-fault
> -msm_submit@empty-submit
> -msm_submit@invalid-queue-submit
> -msm_submit@invalid-flags-submit
> -msm_submit@invalid-in-fence-submit
> -msm_submit@invalid-duplicate-bo-submit
> -msm_submit@invalid-cmd-idx-submit
> -msm_submit@invalid-cmd-type-submit
> -msm_submit@valid-submit
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> index ea87dc46bc2b..eb6b2ddd18ac 100644
> --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> @@ -1,27 +1,42 @@
> -kms_addfb_basic@bad-pitch-65536,Fail
> +amdgpu/amd_abm@abm_gradual,Fail
> +amdgpu/amd_abm@backlight_monotonic_abm,Fail
> +amdgpu/amd_abm@backlight_monotonic_basic,Fail
> +amdgpu/amd_assr@assr-links,Fail
> +amdgpu/amd_assr@assr-links-dpms,Fail
> +amdgpu/amd_fuzzing@cs-wait-fuzzing,Fail
> +amdgpu/amd_mall@static-screen,Crash
> +amdgpu/amd_mode_switch@mode-switch-first-last-pipe-2,Crash
> +amdgpu/amd_plane@mpo-pan-nv12,Fail
> +amdgpu/amd_plane@mpo-pan-p010,Fail
> +amdgpu/amd_plane@mpo-pan-rgb,Crash
> +amdgpu/amd_plane@mpo-scale-nv12,Fail
> +amdgpu/amd_plane@mpo-scale-p010,Fail
> +amdgpu/amd_plane@mpo-scale-rgb,Crash
> +amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
> +amdgpu/amd_vrr_range@freesync-parsing,Timeout
> +device_reset@unbind-cold-reset-rebind,Fail
> +device_reset@unbind-reset-rebind,Fail
> +dumb_buffer@invalid-bpp,Fail
>   kms_addfb_basic@bo-too-small,Fail
>   kms_addfb_basic@too-high,Fail
> -kms_async_flips@async-flip-with-page-flip-events,Fail
> -kms_async_flips@crc,Fail
> -kms_async_flips@invalid-async-flip,Fail
>   kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
>   kms_atomic_transition@plane-all-transition,Fail
>   kms_atomic_transition@plane-all-transition-nonblocking,Fail
>   kms_atomic_transition@plane-toggle-modeset-transition,Fail
>   kms_atomic_transition@plane-use-after-nonblocking-unbind,Fail
> -kms_bw@linear-tiling-1-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> -kms_color@degamma,Fail
> +kms_cursor_crc@cursor-onscreen-64x21,Fail
> +kms_cursor_crc@cursor-onscreen-64x64,Fail
> +kms_cursor_crc@cursor-random-64x21,Fail
> +kms_cursor_crc@cursor-random-64x64,Fail
>   kms_cursor_crc@cursor-size-change,Fail
> -kms_cursor_crc@pipe-A-cursor-size-change,Fail
> -kms_cursor_crc@pipe-B-cursor-size-change,Fail
> +kms_cursor_crc@cursor-sliding-64x21,Fail
> +kms_cursor_crc@cursor-sliding-64x64,Fail
> +kms_cursor_edge_walk@64x64-left-edge,Fail
>   kms_flip@flip-vs-modeset-vs-hang,Fail
>   kms_flip@flip-vs-panning-vs-hang,Fail
> -kms_hdr@bpc-switch,Fail
> -kms_hdr@bpc-switch-dpms,Fail
> +kms_lease@lease-uevent,Fail
>   kms_plane@pixel-format,Fail
> -kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
> -kms_rmfb@close-fd,Fail
> +kms_plane_cursor@primary,Fail
>   kms_rotation_crc@primary-rotation-180,Fail
> +perf@i915-ref-count,Fail
> +tools_test@tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
> index 6faf75e667d3..2f3cb518c426 100644
> --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
> @@ -1 +1,14 @@
> -kms_async_flips@async-flip-with-page-flip-events
> +# Board Name: hp-11A-G6-EE-grunt
> +# Bug Report: https://lore.kernel.org/dri-devel/903b01f7-3f0d-18b7-a4b7-301c118c9321@collabora.com/T/#u
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +device_reset@unbind-reset-rebind
> +kms_plane@pixel-format-source-clamping
> +
> +# The below test shows inconsistency across multiple runs, giving
> +# results of Pass and Fail.
> +amdgpu/amd_abm@abm_enabled
> +amdgpu/amd_plane@mpo-swizzle-toggle
> +kms_addfb_basic@bad-pitch-65536
> +kms_async_flips@crc
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> index e2c538a0f954..fb34c0f03b5d 100644
> --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> @@ -1,2 +1,30 @@
>   # Suspend to RAM seems to be broken on this machine
> -.*suspend.*
> \ No newline at end of file
> +.*suspend.*
> +
> +# Skip driver specific tests
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> +
> +# GPU reset seen and it hangs the machine
> +amdgpu/amd_deadlock@amdgpu-deadlock-sdma
> +amdgpu/amd_deadlock@amdgpu-gfx-illegal-reg-access
> +amdgpu/amd_dispatch@amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE
> +
> +# Hangs the machine and timeout occurs
> +amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
> +amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_cs
> +amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
> +amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_fence
> +
> +# Skip these tests as core_getrevision fails
> +amdgpu/amd_module_load@reload
> +core_hotunplug.*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
> index 59438e4df86e..57b9230b82b0 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
> @@ -1,3 +1,13 @@
> +core_setmaster@master-drop-set-user,Fail
> +i915_hangman@gt-engine-hang,Fail
> +i915_module_load@load,Fail
> +i915_module_load@reload,Fail
> +i915_module_load@reload-no-display,Fail
> +i915_module_load@resize-bar,Fail
> +i915_pm_rpm@gem-execbuf-stress,Timeout
> +i915_pm_rpm@module-reload,Fail
> +kms_fb_coherency@memset-crc,Crash
> +kms_flip@plain-flip-fb-recreate-interruptible,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> @@ -20,7 +30,24 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
> +kms_lease@lease-uevent,Fail
>   kms_plane_alpha_blend@alpha-basic,Fail
>   kms_plane_alpha_blend@alpha-opaque-fb,Fail
>   kms_plane_alpha_blend@alpha-transparent-fb,Fail
>   kms_plane_alpha_blend@constant-alpha-max,Fail
> +kms_pm_rpm@modeset-lpsp-stress,Timeout
> +kms_pm_rpm@modeset-stress-extra-wait,Timeout
> +kms_pm_rpm@universal-planes,Timeout
> +kms_pm_rpm@universal-planes-dpms,Timeout
> +perf@i915-ref-count,Fail
> +perf_pmu@module-unload,Fail
> +perf_pmu@rc6,Crash
> +sysfs_heartbeat_interval@long,Timeout
> +sysfs_heartbeat_interval@off,Timeout
> +sysfs_preempt_timeout@off,Timeout
> +sysfs_timeslice_duration@off,Timeout
> +xe_module_load@force-load,Fail
> +xe_module_load@load,Fail
> +xe_module_load@many-reload,Fail
> +xe_module_load@reload,Fail
> +xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
> new file mode 100644
> index 000000000000..07f9f34fc828
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
> @@ -0,0 +1,9 @@
> +# Board Name: asus-C433TA-AJ0005-rammus
> +# Bug Report: TBD
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +i915_hangman@gt-engine-error
> +kms_pm_rpm@modeset-lpsp-stress
> +kms_universal_plane@cursor-fb-leak
> +perf_pmu@frequency
> diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> index fe55540a3f9a..6e00b3950a26 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> @@ -1,4 +1,24 @@
>   # Suspend to RAM seems to be broken on this machine
>   .*suspend.*
> +
>   # This is generating kernel oops with divide error
> -kms_plane_scaling@invalid-parameters
> \ No newline at end of file
> +kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# GEM tests takes ~1000 hours, so skip it
> +gem_.*
> +
> +# Hangs the machine and timeout occurs
> +i915_pm_rc6_residency@*
> +i915_suspend@*
> +
> +# Kernel panic
> +drm_fdinfo@*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
> index 2e3b7c5dac3c..27a887c13f34 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
> @@ -1,13 +1,8 @@
> -kms_3d,Timeout
> -kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-4-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-4-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-4-displays-3840x2160p,Fail
> +i915_module_load@load,Fail
> +i915_module_load@reload,Fail
> +i915_module_load@reload-no-display,Fail
> +i915_module_load@resize-bar,Fail
> +i915_pm_rpm@gem-execbuf-stress,Timeout
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> @@ -30,18 +25,30 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
> +kms_lease@lease-uevent,Fail
>   kms_plane_alpha_blend@alpha-basic,Fail
>   kms_plane_alpha_blend@alpha-opaque-fb,Fail
>   kms_plane_alpha_blend@alpha-transparent-fb,Fail
>   kms_plane_alpha_blend@constant-alpha-max,Fail
> -kms_plane_alpha_blend@pipe-A-alpha-opaque-fb,Fail
> -kms_plane_alpha_blend@pipe-A-alpha-transparent-fb,Fail
> -kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
> -kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
> -kms_plane_alpha_blend@pipe-B-alpha-transparent-fb,Fail
> -kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
> -kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
> -kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
> -kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
> +kms_pm_backlight@basic-brightness,Fail
> +kms_pm_backlight@fade,Fail
> +kms_pm_backlight@fade-with-dpms,Fail
> +kms_pm_rpm@legacy-planes,Timeout
> +kms_pm_rpm@legacy-planes-dpms,Timeout
> +kms_pm_rpm@modeset-stress-extra-wait,Timeout
> +kms_pm_rpm@universal-planes,Timeout
> +kms_pm_rpm@universal-planes-dpms,Timeout
>   kms_sysfs_edid_timing,Fail
> +perf@i915-ref-count,Fail
> +perf@non-zero-reason,Timeout
> +perf_pmu@module-unload,Fail
> +perf_pmu@rc6,Crash
> +sysfs_heartbeat_interval@long,Timeout
> +sysfs_heartbeat_interval@off,Timeout
> +sysfs_preempt_timeout@off,Timeout
> +sysfs_timeslice_duration@off,Timeout
> +xe_module_load@force-load,Fail
> +xe_module_load@load,Fail
> +xe_module_load@many-reload,Fail
> +xe_module_load@reload,Fail
> +xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> index 3430b215c06e..832e41ac609e 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> @@ -1,6 +1,28 @@
>   # Suspend to RAM seems to be broken on this machine
>   .*suspend.*
> +
>   # This is generating kernel oops with divide error
>   kms_plane_scaling@invalid-parameters
>   # This is cascading issues
> -kms_3d
> \ No newline at end of file
> +kms_3d
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# GEM tests takes ~1000 hours, so skip it
> +gem_.*
> +
> +# Hangs the machine and timeout occurs
> +i915_pm_rc6_residency@*
> +i915_suspend@*
> +i915_pm_rpm@*
> +device_reset@*
> +
> +# Kernel panic
> +drm_fdinfo@*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> index 240ef8467c26..e265c4815c27 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> @@ -1,3 +1,14 @@
> +core_setmaster@master-drop-set-user,Fail
> +i915_module_load@load,Fail
> +i915_module_load@reload,Fail
> +i915_module_load@reload-no-display,Fail
> +i915_module_load@resize-bar,Fail
> +i915_pipe_stress@stress-xrgb8888-untiled,Fail
> +i915_pipe_stress@stress-xrgb8888-ytiled,Fail
> +i915_pm_rpm@gem-execbuf-stress,Timeout
> +i915_pm_rpm@module-reload,Fail
> +kms_fb_coherency@memset-crc,Crash
> +kms_flip@plain-flip-fb-recreate-interruptible,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> @@ -11,7 +22,6 @@ kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
> @@ -20,11 +30,36 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
> +kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt,Timeout
> +kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc,Fail
> +kms_lease@lease-uevent,Fail
>   kms_plane_alpha_blend@alpha-basic,Fail
>   kms_plane_alpha_blend@alpha-opaque-fb,Fail
>   kms_plane_alpha_blend@alpha-transparent-fb,Fail
>   kms_plane_alpha_blend@constant-alpha-max,Fail
>   kms_plane_alpha_blend@constant-alpha-min,Fail
> +kms_pm_rpm@modeset-stress-extra-wait,Timeout
> +kms_pm_rpm@universal-planes,Timeout
> +kms_psr2_sf@cursor-plane-update-sf,Fail
> +kms_psr2_sf@overlay-plane-update-continuous-sf,Fail
> +kms_psr2_sf@overlay-plane-update-sf-dmg-area,Fail
> +kms_psr2_sf@overlay-primary-update-sf-dmg-area,Fail
> +kms_psr2_sf@plane-move-sf-dmg-area,Fail
> +kms_psr2_sf@primary-plane-update-sf-dmg-area,Fail
> +kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb,Fail
>   kms_psr2_su@page_flip-NV12,Fail
>   kms_psr2_su@page_flip-P010,Fail
>   kms_setmode@basic,Fail
> +perf@i915-ref-count,Fail
> +perf_pmu@module-unload,Fail
> +perf_pmu@rc6,Crash
> +perf_pmu@rc6-suspend,Crash
> +sysfs_heartbeat_interval@long,Timeout
> +sysfs_heartbeat_interval@off,Timeout
> +sysfs_preempt_timeout@off,Timeout
> +sysfs_timeslice_duration@off,Timeout
> +xe_module_load@force-load,Fail
> +xe_module_load@load,Fail
> +xe_module_load@many-reload,Fail
> +xe_module_load@reload,Fail
> +xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> new file mode 100644
> index 000000000000..19a818b432f5
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> @@ -0,0 +1,6 @@
> +# Board Name: asus-C436FA-Flip-hatch
> +# Bug Report: TBD
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +perf_pmu@frequency
> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
> index 6d3d7ddc377f..9b38f4f63474 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
> @@ -1,2 +1,22 @@
>   # This is generating kernel oops with divide error
>   kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# GEM tests takes ~1000 hours, so skip it
> +gem_.*
> +
> +# Hangs the machine and timeout occurs
> +i915_pm_rc6_residency@*
> +i915_suspend@*
> +
> +# Kernel panic
> +drm_fdinfo@*
> +kms_frontbuffer_tracking@*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
> index 4596055d7e5e..5f34e8e18456 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
> @@ -1,5 +1,21 @@
> -kms_fbcon_fbt@fbc,Fail
> +core_setmaster@master-drop-set-user,Fail
> +i915_module_load@load,Fail
> +i915_module_load@reload,Fail
> +i915_module_load@reload-no-display,Fail
> +i915_module_load@resize-bar,Fail
> +i915_pm_rpm@gem-execbuf-stress,Timeout
> +i915_pm_rpm@module-reload,Fail
> +kms_big_fb@linear-16bpp-rotate-0,Fail
> +kms_big_fb@linear-16bpp-rotate-180,Fail
> +kms_big_fb@linear-32bpp-rotate-0,Fail
> +kms_big_fb@linear-32bpp-rotate-180,Fail
> +kms_big_fb@linear-8bpp-rotate-0,Fail
> +kms_big_fb@linear-8bpp-rotate-180,Fail
> +kms_big_fb@linear-max-hw-stride-32bpp-rotate-0,Fail
> +kms_big_fb@linear-max-hw-stride-32bpp-rotate-180,Fail
> +kms_draw_crc@draw-method-render,Fail
>   kms_flip@blocking-wf_vblank,Fail
> +kms_flip@plain-flip-fb-recreate-interruptible,Fail
>   kms_flip@wf_vblank-ts-check,Fail
>   kms_flip@wf_vblank-ts-check-interruptible,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
> @@ -26,11 +42,28 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
>   kms_frontbuffer_tracking@fbc-tiling-linear,Fail
>   kms_frontbuffer_tracking@fbcdrrs-tiling-linear,Fail
> +kms_lease@lease-uevent,Fail
>   kms_plane_alpha_blend@alpha-basic,Fail
>   kms_plane_alpha_blend@alpha-opaque-fb,Fail
>   kms_plane_alpha_blend@alpha-transparent-fb,Fail
>   kms_plane_alpha_blend@constant-alpha-max,Fail
> +kms_pm_rpm@legacy-planes,Timeout
> +kms_pm_rpm@modeset-stress-extra-wait,Timeout
> +kms_pm_rpm@universal-planes,Timeout
>   kms_rotation_crc@multiplane-rotation,Fail
>   kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
>   kms_rotation_crc@multiplane-rotation-cropping-top,Fail
> -kms_setmode@basic,Fail
> +perf@i915-ref-count,Fail
> +perf@non-zero-reason,Timeout
> +perf_pmu@frequency,Timeout
> +perf_pmu@module-unload,Fail
> +perf_pmu@rc6,Crash
> +sysfs_heartbeat_interval@long,Timeout
> +sysfs_heartbeat_interval@off,Timeout
> +sysfs_preempt_timeout@off,Timeout
> +sysfs_timeslice_duration@off,Timeout
> +xe_module_load@force-load,Fail
> +xe_module_load@load,Fail
> +xe_module_load@many-reload,Fail
> +xe_module_load@reload,Fail
> +xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> index 4c7d00ce14bc..6e00b3950a26 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> @@ -2,4 +2,23 @@
>   .*suspend.*
>   
>   # This is generating kernel oops with divide error
> -kms_plane_scaling@invalid-parameters
> \ No newline at end of file
> +kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# GEM tests takes ~1000 hours, so skip it
> +gem_.*
> +
> +# Hangs the machine and timeout occurs
> +i915_pm_rc6_residency@*
> +i915_suspend@*
> +
> +# Kernel panic
> +drm_fdinfo@*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
> index dab202716909..3f76cf9505ba 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
> @@ -1,32 +1,15 @@
> -kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-4-displays-2560x1440p,Fail
> -kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
> +i915_module_load@load,Fail
> +kms_fb_coherency@memset-crc,Crash
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
> -kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> -kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
> -kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
> -kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
> -kms_plane_alpha_blend@alpha-basic,Fail
> -kms_plane_alpha_blend@alpha-opaque-fb,Fail
> +kms_lease@lease-uevent,Fail
>   kms_plane_alpha_blend@alpha-transparent-fb,Fail
> -kms_plane_alpha_blend@constant-alpha-max,Fail
> -kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
> -kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
> -kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
> +perf@i915-ref-count,Fail
> +sysfs_preempt_timeout@off,Timeout
> +xe_module_load@many-reload,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
> deleted file mode 100644
> index a12f888530dd..000000000000
> --- a/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
> +++ /dev/null
> @@ -1 +0,0 @@
> -kms_async_flips@crc
> diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> index 4c7d00ce14bc..c5f152cb1a22 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> @@ -2,4 +2,36 @@
>   .*suspend.*
>   
>   # This is generating kernel oops with divide error
> -kms_plane_scaling@invalid-parameters
> \ No newline at end of file
> +kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# GEM tests takes ~1000 hours, so skip it
> +gem_.*
> +
> +# Hangs the machine and timeout occurs
> +i915_pm_rc6_residency@*
> +i915_suspend@*
> +
> +# Kernel panic
> +drm_fdinfo@*
> +kms_content_protection@*
> +kms_frontbuffer_tracking@*
> +kms_cursor_crc@*
> +kms_psr@*
> +kms_big_fb@*
> +api_intel_allocator@*
> +kms_bw@*
> +xe_vm@*
> +xe_exec_threads@*
> +kms_color@*
> +
> +# Test timeout
> +kms_feature_discovery@*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
> index 27bfca1c6f2c..e4cfd6a73444 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
> @@ -1,20 +1,15 @@
> -kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-4-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-4-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-4-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-5-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-5-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-5-displays-3840x2160p,Fail
> +i915_module_load@reload,Fail
> +i915_module_load@reload-no-display,Fail
> +kms_big_joiner@basic-force-joiner,Fail
> +kms_flip@absolute-wf_vblank,Fail
> +kms_flip@basic-flip-vs-dpms,Fail
> +kms_flip@blocking-absolute-wf_vblank,Fail
>   kms_flip@flip-vs-panning-vs-hang,Timeout
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
> -kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
> @@ -24,13 +19,17 @@ kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
> +kms_lease@lease-uevent,Fail
> +kms_pm_rpm@legacy-planes-dpms,Timeout
>   kms_rotation_crc@bad-pixel-format,Fail
>   kms_rotation_crc@multiplane-rotation,Fail
>   kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
>   kms_rotation_crc@multiplane-rotation-cropping-top,Fail
> +perf@i915-ref-count,Fail
> +perf_pmu@module-unload,Fail
> +perf_pmu@rc6,Crash
> +xe_module_load@force-load,Fail
> +xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
> new file mode 100644
> index 000000000000..0507ec4ac30e
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
> @@ -0,0 +1,6 @@
> +# Board Name: acer-cp514-2h-1130g7-volteer
> +# Bug Report: TBD
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +kms_cursor_edge_walk@64x64-top-bottom
> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> index 1d0621750b14..4cb2246ae314 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> @@ -8,4 +8,30 @@ gem_eio.*
>   kms_flip@absolute-wf_vblank@a-edp1
>   
>   # This is generating kernel oops with divide error
> -kms_plane_scaling@invalid-parameters
> \ No newline at end of file
> +kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# GEM tests takes ~1000 hours, so skip it
> +gem_.*
> +
> +# Hangs the machine and timeout occurs
> +i915_pm_rc6_residency@*
> +i915_suspend@*
> +kms_plane_multiple@*
> +
> +# Kernel panic
> +drm_fdinfo@*
> +
> +# Test timeout
> +kms_flip@*
> +kms_frontbuffer_tracking@*
> +sysfs_heartbeat_interval@*
> +syncobj_timeline@*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
> index 967327ddc1ac..7fa5e3445704 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
> @@ -1,14 +1,22 @@
> -kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-4-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-4-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-4-displays-3840x2160p,Fail
> -kms_fbcon_fbt@fbc,Fail
> -kms_fbcon_fbt@fbc-suspend,Fail
> +core_setmaster@master-drop-set-user,Fail
> +i915_module_load@load,Fail
> +i915_module_load@reload,Fail
> +i915_module_load@reload-no-display,Fail
> +i915_module_load@resize-bar,Fail
> +i915_pm_rpm@gem-execbuf-stress,Timeout
> +i915_pm_rpm@module-reload,Fail
> +i915_pm_rpm@system-suspend-execbuf,Timeout
> +kms_big_fb@linear-16bpp-rotate-0,Fail
> +kms_big_fb@linear-16bpp-rotate-180,Fail
> +kms_big_fb@linear-32bpp-rotate-0,Fail
> +kms_big_fb@linear-32bpp-rotate-180,Fail
> +kms_big_fb@linear-8bpp-rotate-0,Fail
> +kms_big_fb@linear-8bpp-rotate-180,Fail
> +kms_big_fb@linear-max-hw-stride-32bpp-rotate-0,Fail
> +kms_big_fb@linear-max-hw-stride-32bpp-rotate-180,Fail
> +kms_draw_crc@draw-method-render,Fail
> +kms_fb_coherency@memset-crc,Crash
> +kms_flip@plain-flip-fb-recreate-interruptible,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> @@ -31,18 +39,25 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
> -kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
>   kms_frontbuffer_tracking@fbc-tiling-linear,Fail
> +kms_lease@lease-uevent,Fail
>   kms_plane_alpha_blend@alpha-basic,Fail
>   kms_plane_alpha_blend@alpha-opaque-fb,Fail
>   kms_plane_alpha_blend@alpha-transparent-fb,Fail
>   kms_plane_alpha_blend@constant-alpha-max,Fail
> -kms_plane_alpha_blend@pipe-A-alpha-opaque-fb,Fail
> -kms_plane_alpha_blend@pipe-A-alpha-transparent-fb,Fail
> -kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
> -kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
> -kms_plane_alpha_blend@pipe-B-alpha-transparent-fb,Fail
> -kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
> -kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
> -kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
> -kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
> +kms_pm_rpm@modeset-lpsp-stress,Timeout
> +kms_pm_rpm@modeset-stress-extra-wait,Timeout
> +kms_pm_rpm@universal-planes,Timeout
> +perf@i915-ref-count,Fail
> +perf_pmu@module-unload,Fail
> +perf_pmu@rc6,Crash
> +perf_pmu@rc6-suspend,Crash
> +sysfs_heartbeat_interval@long,Timeout
> +sysfs_heartbeat_interval@off,Timeout
> +sysfs_preempt_timeout@off,Timeout
> +sysfs_timeslice_duration@off,Timeout
> +xe_module_load@force-load,Fail
> +xe_module_load@load,Fail
> +xe_module_load@many-reload,Fail
> +xe_module_load@reload,Fail
> +xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
> index f3be0888a214..e9317feddaab 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
> @@ -1,2 +1,21 @@
>   # This is generating kernel oops with divide error
> -kms_plane_scaling@invalid-parameters
> \ No newline at end of file
> +kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# GEM tests takes ~1000 hours, so skip it
> +gem_.*
> +
> +# Hangs the machine and timeout occurs
> +i915_pm_rc6_residency@*
> +i915_suspend@*
> +
> +# Kernel panic
> +drm_fdinfo@*
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> index ef0cb7c3698c..0028d9485c21 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> @@ -1,36 +1,13 @@
> +core_hotunplug,Crash
> +device_reset,Fail
> +dumb_buffer,Fail
>   kms_3d,Fail
> -kms_bw@linear-tiling-1-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-1-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> -kms_color@invalid-gamma-lut-sizes,Fail
> -kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
> -kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
> -kms_cursor_legacy@cursor-vs-flip-atomic,Fail
> -kms_cursor_legacy@cursor-vs-flip-legacy,Fail
> -kms_flip@flip-vs-modeset-vs-hang,Fail
> -kms_flip@flip-vs-panning-vs-hang,Fail
> -kms_flip@flip-vs-suspend,Fail
> -kms_flip@flip-vs-suspend-interruptible,Fail
> -kms_force_connector_basic@force-edid,Fail
> -kms_force_connector_basic@force-load-detect,Fail
> -kms_force_connector_basic@prune-stale-modes,Fail
> -kms_hdmi_inject@inject-4k,Fail
> -kms_plane_scaling@planes-upscale-20x20,Fail
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
> -kms_plane_scaling@upscale-with-modifier-20x20,Fail
> -kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
> -kms_plane_scaling@upscale-with-rotation-20x20,Fail
> -kms_properties@get_properties-sanity-atomic,Fail
> -kms_properties@plane-properties-atomic,Fail
> -kms_properties@plane-properties-legacy,Fail
> -kms_rmfb@close-fd,Fail
> -kms_selftest@drm_format,Timeout
> -kms_selftest@drm_format_helper,Timeout
> +kms_atomic_transition,Timeout
> +kms_bw,Fail
> +kms_color,Fail
> +kms_cursor_legacy,Timeout
> +kms_flip,Timeout
> +kms_lease,Fail
> +kms_properties,Fail
> +kms_rmfb,Fail
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
> new file mode 100644
> index 000000000000..12c3ac79375b
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
> @@ -0,0 +1,13 @@
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> index 67d690fc4037..e8cdeb1eb779 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> @@ -1,13 +1,5 @@
> -kms_addfb_basic@addfb25-bad-modifier,Fail
> -kms_bw@linear-tiling-1-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> -kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
> -kms_plane_cursor@overlay,Fail
> -kms_plane_cursor@primary,Fail
> -kms_plane_cursor@viewport,Fail
> -kms_plane_scaling@upscale-with-rotation-20x20,Fail
> -kms_rmfb@close-fd,Fail
> +core_hotunplug,Crash
> +dumb_buffer,Fail
> +panfrost_prime,Fail
> +panfrost_submit,Fail
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> new file mode 100644
> index 000000000000..ec0778479b28
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> @@ -0,0 +1,6 @@
> +# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
> +# Bug Report: TBD
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +core_hotunplug
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> new file mode 100644
> index 000000000000..a7039b154e72
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> @@ -0,0 +1,15 @@
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> +
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> index 56a2ae7047b4..ca52e42f0b50 100644
> --- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> @@ -1,16 +1,4 @@
> -kms_3d,Fail
> -kms_cursor_legacy@forked-bo,Fail
> -kms_cursor_legacy@forked-move,Fail
> -kms_cursor_legacy@single-bo,Fail
> -kms_cursor_legacy@single-move,Fail
> -kms_cursor_legacy@torture-bo,Fail
> -kms_cursor_legacy@torture-move,Fail
> -kms_force_connector_basic@force-edid,Fail
> -kms_hdmi_inject@inject-4k,Fail
> -kms_plane_cursor@overlay,Fail
> -kms_plane_cursor@primary,Fail
> -kms_plane_cursor@viewport,Fail
> -kms_properties@connector-properties-atomic,Fail
> -kms_properties@connector-properties-legacy,Fail
> -kms_properties@get_properties-sanity-atomic,Fail
> -kms_properties@get_properties-sanity-non-atomic,Fail
> +dumb_buffer,Fail
> +panfrost_prime,Fail
> +panfrost_submit,Fail
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
> new file mode 100644
> index 000000000000..66838e176e2f
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
> @@ -0,0 +1,7 @@
> +# Board Name: meson-g12b-a311d-khadas-vim3
> +# Bug Report: TBD
> +# Failure Rate: 50
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +core_hotunplug
> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> new file mode 100644
> index 000000000000..a7039b154e72
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> @@ -0,0 +1,15 @@
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> +
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> index 44a5c62dedad..944adc432888 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -1,19 +1,8 @@
> +device_reset,Fail
> +dumb_buffer,Fail
>   kms_3d,Fail
> -kms_addfb_basic@addfb25-bad-modifier,Fail
> -kms_cursor_legacy@all-pipes-forked-bo,Fail
> -kms_cursor_legacy@all-pipes-forked-move,Fail
> -kms_cursor_legacy@all-pipes-single-bo,Fail
> -kms_cursor_legacy@all-pipes-single-move,Fail
> -kms_cursor_legacy@all-pipes-torture-bo,Fail
> -kms_cursor_legacy@all-pipes-torture-move,Fail
> -kms_cursor_legacy@pipe-A-forked-bo,Fail
> -kms_cursor_legacy@pipe-A-forked-move,Fail
> -kms_cursor_legacy@pipe-A-single-bo,Fail
> -kms_cursor_legacy@pipe-A-single-move,Fail
> -kms_cursor_legacy@pipe-A-torture-bo,Fail
> -kms_cursor_legacy@pipe-A-torture-move,Fail
> -kms_force_connector_basic@force-edid,Fail
> -kms_hdmi_inject@inject-4k,Fail
> -kms_selftest@drm_format,Timeout
> -kms_selftest@drm_format_helper,Timeout
> -msm_mapping@ring,Fail
> +kms_addfb_basic,Fail
> +kms_force_connector_basic,Fail
> +kms_lease,Fail
> +msm_mapping,Fail
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> new file mode 100644
> index 000000000000..238325ddcef2
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> @@ -0,0 +1,7 @@
> +# Board Name: apq8016-sbc-usb-host
> +# Bug Report: TBD
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +kms_cursor_legacy
> +kms_prop_blob
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> new file mode 100644
> index 000000000000..7aa6d874972f
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> @@ -0,0 +1,15 @@
> +# Skip driver specific tests
> +^amdgpu.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> +
> +# Skip these tests as core_getrevision fails
> +core_hotunplug.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> index 88a1fc0a3b0d..7da4eca5d50a 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> @@ -1,2 +1,6 @@
> +device_reset,Fail
> +dumb_buffer,Fail
>   kms_3d,Fail
> -kms_addfb_basic@addfb25-bad-modifier,Fail
> +kms_addfb_basic,Fail
> +kms_lease,Fail
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
> new file mode 100644
> index 000000000000..e278744139d3
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
> @@ -0,0 +1,6 @@
> +# Board Name: apq8096-db820c
> +# Bug Report: TBD
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +kms_cursor_legacy
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> index cd49c8ce2059..feb133bfa5ec 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> @@ -1,2 +1,117 @@
>   # Whole machine hangs
> -kms_cursor_legacy@all-pipes-torture-move
> \ No newline at end of file
> +kms_cursor_legacy@all-pipes-torture-move
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> +
> +# Skip these tests as core_getrevision fails
> +core_hotunplug.*
> +
> +# Detected kernel soft lockup
> +# [   80.510306] [IGT] msm_mapping: starting subtest shadow
> +# [   80.518371] *** gpu fault: ttbr0=00000001021e3000 iova=0000000001074000 dir=WRITE type=PERMISSION source=1f030000 (0,0,0,0)
> +# [   84.189326] msm_mdp 901000.display-controller: RBBM | ME master split | status=0x701000B0
> +# [  106.518026] rcu: INFO: rcu_preempt self-detected stall on CPU
> +# [  106.518075] rcu: 	0-....: (1 GPs behind) idle=a9b4/1/0x4000000000000000 softirq=12019/12020 fqs=3141
> +# [  106.522827] rcu: 	(t=6500 jiffies g=23805 q=641 ncpus=2)
> +# [  106.531972] CPU: 0 PID: 76 Comm: kworker/u16:5 Tainted: G        W          6.9.0-rc2-gbe07f970bd8b #1
> +# [  106.537267] Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
> +# [  106.546387] Workqueue: ring0 drm_sched_run_job_work
> +# [  106.552539] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> +# [  106.557313] pc : __do_softirq+0xe8/0x52c
> +# [  106.564255] lr : __do_softirq+0xe4/0x52c
> +# [  106.568422] sp : ffff800080003f20
> +# [  106.572328] x29: ffff800080003f20 x28: ffff000082105280 x27: ffff800082aa0da8
> +# [  106.575543] x26: ffff80008222d008 x25: ffff0000823bef00 x24: ffff0000822fa4d0
> +# [  106.582661] x23: 0000000060000005 x22: 0000000000000200 x21: ffff800084ff3ae0
> +# [  106.589780] x20: ffff800080090178 x19: ffff800082242ec0 x18: 0000000000000006
> +# [  106.596896] x17: ffff80007b883000 x16: ffff800080000000 x15: 0000000000000001
> +# [  106.604015] x14: 00000000001d7e33 x13: 0000000000000003 x12: 0000000000000000
> +# [  106.611134] x11: 0000000000000001 x10: 0000000000000000 x9 : ffff8000837f6000
> +# [  106.618252] x8 : ffff000082105280 x7 : 000000000002d738 x6 : 00000000041f23d2
> +# [  106.625369] x5 : 0000000000000000 x4 : 0000000000000003 x3 : 0000000000000000
> +# [  106.632487] x2 : 0000000000000001 x1 : ffff80008222fad8 x0 : 000000000007aee8
> +# [  106.639607] Call trace:
> +# [  106.646719]  __do_softirq+0xe8/0x52c
> +# [  106.648977]  ____do_softirq+0x10/0x1c
> +# [  106.652797]  call_on_irq_stack+0x24/0x4c
> +# [  106.656357]  do_softirq_own_stack+0x1c/0x28
> +# [  106.660348]  __irq_exit_rcu+0x154/0x178
> +# [  106.664255]  irq_exit_rcu+0x10/0x38
> +# [  106.668074]  el1_interrupt+0x38/0x64
> +# [  106.671547]  el1h_64_irq_handler+0x18/0x24
> +# [  106.675367]  el1h_64_irq+0x64/0x68
> +# [  106.679272]  preempt_schedule_irq+0x38/0x9c
> +# [  106.682658]  el1_interrupt+0x4c/0x64
> +# [  106.686738]  el1h_64_irq_handler+0x18/0x24
> +# [  106.690557]  el1h_64_irq+0x64/0x68
> +# [  106.694463]  __pm_runtime_idle+0x0/0x8c
> +# [  106.697848]  msm_job_run+0xa4/0x120
> +# [  106.701580]  drm_sched_run_job_work+0x278/0x4d0
> +# [  106.705054]  process_one_work+0x218/0x620
> +# [  106.709568]  worker_thread+0x1ac/0x37c
> +# [  106.713734]  kthread+0x114/0x118
> +# [  106.717379]  ret_from_fork+0x10/0x20
> +# [  132.134018] watchdog: BUG: soft lockup - CPU#0 stuck for 49s! [kworker/u16:5:76]
> +# [0;31mDetected kernel soft lockup, abandoning run.[0m
> +
> +# [   77.916756] [IGT] msm_mapping: starting subtest ring
> +# [   77.921867] *** gpu fault: ttbr0=00000001021c4000 iova=0000000001003000 dir=WRITE type=PERMISSION source=1f030000 (0,0,0,0)
> +# [   77.929173] [IGT] msm_mapping: finished subtest ring, SUCCESS
> +# [   77.934458] [IGT] msm_mapping: starting subtest sqefw
> +# [   77.940278] [IGT] msm_mapping: finished subtest sqefw, SKIP
> +# [   77.945212] [IGT] msm_mapping: starting subtest shadow
> +# [   77.952360] *** gpu fault: ttbr0=00000001021c4000 iova=0000000001074000 dir=WRITE type=PERMISSION source=1f030000 (0,0,0,0)
> +# [   78.905412] sched: RT throttling activated
> +# [   81.623221] msm_mdp 901000.display-controller: RBBM | ME master split | status=0x701000B0
> +# [  103.957418] rcu: INFO: rcu_preempt self-detected stall on CPU
> +# [  103.957454] rcu: 	0-....: (1 GPs behind) idle=f884/1/0x4000000000000000 softirq=10784/10785 fqs=3131
> +# [  103.962148] rcu: 	(t=6501 jiffies g=19809 q=481 ncpus=2)
> +# [  103.971352] CPU: 0 PID: 51 Comm: kworker/u16:4 Tainted: G        W          6.9.0-rc4-gf081c1a04275 #1
> +# [  103.976644] Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
> +# [  103.985757] Workqueue: ring0 drm_sched_run_job_work
> +# [  103.991919] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> +# [  103.996693] pc : __do_softirq+0xe8/0x52c
> +# [  104.003635] lr : __do_softirq+0xe4/0x52c
> +# [  104.007802] sp : ffff800080003f20
> +# [  104.011707] x29: ffff800080003f20 x28: ffff000080355280 x27: ffff800082ab0da8
> +# [  104.014922] x26: ffff80008222d008 x25: ffff000085d07800 x24: ffff0000828030d0
> +# [  104.022040] x23: 0000000000000005 x22: 0000000000000282 x21: ffff80008428bc80
> +# [  104.029158] x20: ffff800080090178 x19: ffff800082242ec0 x18: 0000000000000000
> +# [  104.036276] x17: ffff80007b883000 x16: ffff800080000000 x15: 0000000000000001
> +# [  104.043395] x14: 000000000088353c x13: 0000000000000000 x12: 00000000000001d7
> +# [  104.050512] x11: 0000000000000001 x10: 0000000000000001 x9 : ffff800082ab51c0
> +# [  104.057631] x8 : 0000001225d30e00 x7 : 7fffffffffffffff x6 : 0000000003cb8b54
> +# [  104.064748] x5 : 0000000000000000 x4 : ffff800080000000 x3 : 0000000000000000
> +# [  104.071866] x2 : 0000000000000000 x1 : ffff800082ab3000 x0 : 0000000000000000
> +# [  104.078987] Call trace:
> +# [  104.086099]  __do_softirq+0xe8/0x52c
> +# [  104.088358]  ____do_softirq+0x10/0x1c
> +# [  104.092177]  call_on_irq_stack+0x24/0x4c
> +# [  104.095736]  do_softirq_own_stack+0x1c/0x28
> +# [  104.099729]  __irq_exit_rcu+0x154/0x178
> +# [  104.103635]  irq_exit_rcu+0x10/0x38
> +# [  104.107454]  el1_interrupt+0x38/0x64
> +# [  104.110926]  el1h_64_irq_handler+0x18/0x24
> +# [  104.114746]  el1h_64_irq+0x64/0x68
> +# [  104.118652]  hangcheck_timer_reset+0x0/0x50
> +# [  104.122037]  msm_job_run+0xa4/0x120
> +# [  104.126116]  drm_sched_run_job_work+0x278/0x4d0
> +# [  104.129590]  process_one_work+0x218/0x620
> +# [  104.134103]  worker_thread+0x1ac/0x37c
> +# [  104.138270]  kthread+0x114/0x118
> +# [  128.025415] watchdog: BUG: soft lockup - CPU#0 stuck for 49s! [kworker/u16:4:51]
> +# Detected kernel soft lockup, abandoning run.␛[0m
> +# [  128.025456] Modules linked in:
> +# [  128.031885] irq event stamp: 50
> +msm_mapping@*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> index f0576aa629e8..d09a3c8b339f 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> @@ -1,18 +1,22 @@
> -kms_color@ctm-0-25,Fail
> -kms_color@ctm-0-50,Fail
> -kms_color@ctm-0-75,Fail
> -kms_color@ctm-blue-to-red,Fail
> -kms_color@ctm-green-to-red,Fail
> -kms_color@ctm-negative,Fail
> -kms_color@ctm-red-to-blue,Fail
> -kms_color@ctm-signed,Fail
> -kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> -kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> -kms_flip@flip-vs-modeset-vs-hang,Fail
> -kms_flip@flip-vs-panning-vs-hang,Fail
> -kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> -kms_plane_alpha_blend@alpha-7efc,Fail
> -kms_plane_alpha_blend@coverage-7efc,Fail
> -kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> -kms_rmfb@close-fd,Fail
> -kms_universal_plane@universal-plane-sanity,Fail
> +device_reset,Fail
> +dumb_buffer,Fail
> +kms_atomic_transition,Timeout
> +kms_color,Timeout
> +kms_content_protection,Crash
> +kms_cursor_crc,Timeout
> +kms_cursor_edge_walk,Timeout
> +kms_display_modes,Fail
> +kms_flip,Timeout
> +kms_lease,Fail
> +kms_multipipe_modeset,Fail
> +kms_pipe_crc_basic,Fail
> +kms_plane,Timeout
> +kms_plane_alpha_blend,Timeout
> +kms_plane_lowres,Fail
> +kms_plane_multiple,Fail
> +kms_rmfb,Fail
> +kms_rotation_crc,Fail
> +kms_sequence,Timeout
> +kms_vblank,Timeout
> +msm_shrink,Timeout
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> new file mode 100644
> index 000000000000..3dce1ff8269e
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> @@ -0,0 +1,6 @@
> +# Board Name: sc7180-trogdor-kingoftown
> +# Bug Report: TBD
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +kms_cursor_legacy
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> index 327039f70252..0e49c6c368d2 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> @@ -1,2 +1,18 @@
>   # Suspend to RAM seems to be broken on this machine
>   .*suspend.*
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> +
> +# Skip these tests as core_getrevision fails
> +core_hotunplug.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> index f0576aa629e8..c84687a264d3 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> @@ -1,18 +1,23 @@
> -kms_color@ctm-0-25,Fail
> -kms_color@ctm-0-50,Fail
> -kms_color@ctm-0-75,Fail
> -kms_color@ctm-blue-to-red,Fail
> -kms_color@ctm-green-to-red,Fail
> -kms_color@ctm-negative,Fail
> -kms_color@ctm-red-to-blue,Fail
> -kms_color@ctm-signed,Fail
> -kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> -kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> -kms_flip@flip-vs-modeset-vs-hang,Fail
> -kms_flip@flip-vs-panning-vs-hang,Fail
> -kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> -kms_plane_alpha_blend@alpha-7efc,Fail
> -kms_plane_alpha_blend@coverage-7efc,Fail
> -kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> -kms_rmfb@close-fd,Fail
> -kms_universal_plane@universal-plane-sanity,Fail
> +core_setmaster_vs_auth,Fail
> +device_reset,Fail
> +dumb_buffer,Fail
> +kms_atomic_transition,Fail
> +kms_color,Fail
> +kms_content_protection,Crash
> +kms_cursor_crc,Timeout
> +kms_cursor_edge_walk,Timeout
> +kms_display_modes,Fail
> +kms_flip,Timeout
> +kms_lease,Fail
> +kms_multipipe_modeset,Fail
> +kms_pipe_crc_basic,Fail
> +kms_plane,Timeout
> +kms_plane_alpha_blend,Timeout
> +kms_plane_cursor,Fail
> +kms_plane_lowres,Fail
> +kms_plane_multiple,Fail
> +kms_prop_blob,Fail
> +kms_rotation_crc,Fail
> +kms_vblank,Timeout
> +msm_shrink,Timeout
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
> new file mode 100644
> index 000000000000..0791b4171ce0
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
> @@ -0,0 +1,11 @@
> +# Board Name: sc7180-trogdor-lazor-limozeen
> +# Bug Report: TBD
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +kms_sequence
> +kms_cursor_legacy
> +
> +# The below test shows inconsistency across multiple runs, giving
> +# results of Pass and Fail.
> +testdisplay
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> index 327039f70252..0e49c6c368d2 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> @@ -1,2 +1,18 @@
>   # Suspend to RAM seems to be broken on this machine
>   .*suspend.*
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> +
> +# Skip these tests as core_getrevision fails
> +core_hotunplug.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> index e9043a00383e..9ba4ee5d1586 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> @@ -1,60 +1,16 @@
> -kms_color@ctm-0-25,Fail
> -kms_color@ctm-0-50,Fail
> -kms_color@ctm-0-75,Fail
> -kms_color@ctm-blue-to-red,Fail
> -kms_color@ctm-green-to-red,Fail
> -kms_color@ctm-negative,Fail
> -kms_color@ctm-red-to-blue,Fail
> -kms_color@ctm-signed,Fail
> -kms_color@pipe-A-ctm-0-25,Fail
> -kms_color@pipe-A-ctm-0-5,Fail
> -kms_color@pipe-A-ctm-0-75,Fail
> -kms_color@pipe-A-ctm-blue-to-red,Fail
> -kms_color@pipe-A-ctm-green-to-red,Fail
> -kms_color@pipe-A-ctm-max,Fail
> -kms_color@pipe-A-ctm-negative,Fail
> -kms_color@pipe-A-ctm-red-to-blue,Fail
> -kms_color@pipe-A-legacy-gamma,Fail
> -kms_cursor_legacy@basic-flip-after-cursor-atomic,Fail
> -kms_cursor_legacy@basic-flip-after-cursor-varying-size,Fail
> -kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
> -kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
> -kms_cursor_legacy@cursor-vs-flip-atomic,Fail
> -kms_cursor_legacy@cursor-vs-flip-atomic-transitions,Fail
> -kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size,Fail
> -kms_cursor_legacy@cursor-vs-flip-legacy,Fail
> -kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> -kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> -kms_cursor_legacy@flip-vs-cursor-atomic,Fail
> -kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
> -kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
> -kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> -kms_flip@flip-vs-modeset-vs-hang,Fail
> -kms_flip@flip-vs-panning-vs-hang,Fail
> -kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> -kms_plane_alpha_blend@alpha-7efc,Fail
> -kms_plane_alpha_blend@coverage-7efc,Fail
> -kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> -kms_plane_alpha_blend@pipe-A-alpha-7efc,Fail
> -kms_plane_alpha_blend@pipe-A-coverage-7efc,Fail
> -kms_plane_alpha_blend@pipe-A-coverage-vs-premult-vs-constant,Fail
> -kms_plane_cursor@overlay,Fail
> -kms_plane_cursor@pipe-A-overlay-size-128,Fail
> -kms_plane_cursor@pipe-A-overlay-size-256,Fail
> -kms_plane_cursor@pipe-A-overlay-size-64,Fail
> -kms_plane_cursor@pipe-A-viewport-size-128,Fail
> -kms_plane_cursor@pipe-A-viewport-size-256,Fail
> -kms_plane_cursor@pipe-A-viewport-size-64,Fail
> -kms_plane_cursor@viewport,Fail
> -kms_plane_scaling@downscale-with-pixel-format-factor-0-25,Timeout
> -kms_plane_scaling@downscale-with-pixel-format-factor-0-5,Timeout
> -kms_plane_scaling@downscale-with-pixel-format-factor-0-75,Timeout
> -kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25,Timeout
> -kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5,Timeout
> -kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75,Timeout
> -kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats,Timeout
> -kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling,Timeout
> -kms_plane_scaling@planes-downscale-factor-0-25,Fail
> -kms_plane_scaling@scaler-with-clipping-clamping,Timeout
> -kms_plane_scaling@scaler-with-pixel-format-unity-scaling,Timeout
> -kms_rmfb@close-fd,Fail
> +device_reset,Fail
> +dumb_buffer,Fail
> +kms_atomic_transition,Timeout
> +kms_color,Timeout
> +kms_cursor_crc,Timeout
> +kms_cursor_edge_walk,Timeout
> +kms_cursor_legacy,Timeout
> +kms_flip,Timeout
> +kms_lease,Fail
> +kms_pipe_crc_basic,Fail
> +kms_plane,Timeout
> +kms_plane_alpha_blend,Fail
> +kms_plane_cursor,Fail
> +kms_rmfb,Fail
> +msm_shrink,Timeout
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> index 8a492f01eaa4..6d83ef72d532 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> @@ -1,22 +1,10 @@
> -# Board Name: msm:sdm845
> -# Bug Report: https://lore.kernel.org/dri-devel/46287831-edfa-78e8-6055-d7a08831c445@collabora.com/T/#u
> -# Failure Rate: 50
> -# IGT Version: 1.28-gd2af13d9f
> -# Linux Version: 6.7.0-rc3
> -
> +# Board Name: sdm845-cheza-r3
> +# Bug Report: TBD
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
>   # Reported by deqp-runner
> -kms_cursor_legacy@basic-flip-after-cursor-legacy
> -kms_cursor_legacy@flip-vs-cursor-toggle
> -kms_cursor_legacy@flip-vs-cursor-varying-size
> -kms_cursor_legacy@short-flip-after-cursor-toggle
> -kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
> -kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
> -msm_shrink@copy-gpu-32
> -msm_shrink@copy-gpu-oom-32
> +msm_shrink
>   
>   # The below test shows inconsistency across multiple runs, giving
> -# results of Pass and Fail alternately.
> -kms_cursor_legacy@basic-flip-before-cursor-varying-size
> -kms_cursor_legacy@flip-vs-cursor-atomic-transitions
> -kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
> -kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
> +# results of Pass and Fail.
> +kms_rmfb
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> index 618e3a3a7277..da0cf2f3e9b5 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> @@ -5,3 +5,19 @@ kms_bw.*
>   # https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/4b49f902ec6f2bb382cbbf489870573f4b43371e
>   # https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/38cdf4c5559771e2474ae0fecef8469f65147bc1
>   msm_mapping@*
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> +
> +# Skip these tests as core_getrevision fails
> +core_hotunplug.*
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> deleted file mode 100644
> index 90c63f519e9e..000000000000
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -kms_3d,Crash
> -kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-2-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> -kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> -kms_flip@flip-vs-modeset-vs-hang,Crash
> -kms_flip@flip-vs-panning-vs-hang,Crash
> -kms_force_connector_basic@force-load-detect,Fail
> -kms_invalid_mode@int-max-clock,Crash
> -kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Crash
> -kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Crash
> -kms_pipe_crc_basic@read-crc-frame-sequence,Crash
> -kms_plane@pixel-format,Crash
> -kms_plane@pixel-format-source-clamping,Crash
> -kms_plane@plane-position-hole,Crash
> -kms_plane@plane-position-hole-dpms,Crash
> -kms_plane_cursor@overlay,Crash
> -kms_plane_cursor@pipe-A-overlay-size-128,Fail
> -kms_plane_cursor@pipe-A-overlay-size-256,Fail
> -kms_plane_cursor@pipe-A-overlay-size-64,Fail
> -kms_plane_cursor@pipe-A-primary-size-128,Fail
> -kms_plane_cursor@pipe-A-primary-size-256,Fail
> -kms_plane_cursor@pipe-A-primary-size-64,Fail
> -kms_plane_cursor@pipe-A-viewport-size-128,Fail
> -kms_plane_cursor@pipe-A-viewport-size-256,Fail
> -kms_plane_cursor@pipe-A-viewport-size-64,Fail
> -kms_plane_cursor@pipe-B-overlay-size-128,Fail
> -kms_plane_cursor@pipe-B-overlay-size-256,Fail
> -kms_plane_cursor@pipe-B-overlay-size-64,Fail
> -kms_plane_cursor@pipe-B-primary-size-128,Fail
> -kms_plane_cursor@pipe-B-primary-size-256,Fail
> -kms_plane_cursor@pipe-B-primary-size-64,Fail
> -kms_plane_cursor@pipe-B-viewport-size-128,Fail
> -kms_plane_cursor@pipe-B-viewport-size-256,Fail
> -kms_plane_cursor@pipe-B-viewport-size-64,Fail
> -kms_plane_cursor@primary,Crash
> -kms_plane_cursor@viewport,Crash
> -kms_plane_lowres@tiling-none,Fail
> -kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
> -kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
> -kms_plane_scaling@upscale-with-modifier-20x20,Fail
> -kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
> -kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
> -kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
> -kms_plane_scaling@upscale-with-rotation-20x20,Fail
> -kms_prime@basic-crc,Fail
> -kms_properties@connector-properties-atomic,Crash
> -kms_properties@connector-properties-legacy,Crash
> -kms_properties@get_properties-sanity-atomic,Crash
> -kms_properties@get_properties-sanity-non-atomic,Crash
> -kms_rmfb@close-fd,Crash
> -kms_setmode@invalid-clone-single-crtc,Crash
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> index f20c3574b75a..22a643457bd9 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> @@ -1,52 +1,18 @@
>   # Suspend to RAM seems to be broken on this machine
>   .*suspend.*
>   
> -# Too unstable, machine ends up hanging after lots of Oopses
> -kms_cursor_legacy.*
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
>   
> -# Started hanging the machine on Linux 5.19-rc2:
> -#
> -# [IGT] kms_plane_lowres: executing
> -# [IGT] kms_plane_lowres: starting subtest pipe-F-tiling-y
> -# [IGT] kms_plane_lowres: exiting, ret=77
> -# Console: switching to colour frame buffer device 170x48
> -# rockchip-drm display-subsystem: [drm] *ERROR* flip_done timed out
> -# rockchip-drm display-subsystem: [drm] *ERROR* [CRTC:35:crtc-0] commit wait timed out
> -# BUG: spinlock bad magic on CPU#3, kms_plane_lowre/482
> -# 8<--- cut here ---
> -# Unable to handle kernel paging request at virtual address 7812078e
> -# [7812078e] *pgd=00000000
> -# Internal error: Oops: 5 [#1] SMP ARM
> -# Modules linked in:
> -# CPU: 3 PID: 482 Comm: kms_plane_lowre Tainted: G        W         5.19.0-rc2-323596-g00535de92171 #1
> -# Hardware name: Rockchip (Device Tree)
> -# Process kms_plane_lowre (pid: 482, stack limit = 0x1193ac2b)
> -#  spin_dump from do_raw_spin_lock+0xa4/0xe8
> -#  do_raw_spin_lock from wait_for_completion_timeout+0x2c/0x120
> -#  wait_for_completion_timeout from drm_crtc_commit_wait+0x18/0x7c
> -#  drm_crtc_commit_wait from drm_atomic_helper_wait_for_dependencies+0x44/0x168
> -#  drm_atomic_helper_wait_for_dependencies from commit_tail+0x34/0x180
> -#  commit_tail from drm_atomic_helper_commit+0x164/0x18c
> -#  drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe4
> -#  drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x284
> -#  drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x60/0x1c8
> -#  drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x40
> -#  drm_client_modeset_commit from drm_fbdev_client_restore+0x58/0x94
> -#  drm_fbdev_client_restore from drm_client_dev_restore+0x70/0xbc
> -#  drm_client_dev_restore from drm_release+0xf4/0x114
> -#  drm_release from __fput+0x74/0x240
> -#  __fput from task_work_run+0x84/0xb4
> -#  task_work_run from do_exit+0x34c/0xa20
> -#  do_exit from do_group_exit+0x34/0x98
> -#  do_group_exit from __wake_up_parent+0x0/0x18
> -# Code: e595c008 12843d19 03e00000 03093168 (15940508)
> -# ---[ end trace 0000000000000000 ]---
> -# note: kms_plane_lowre[482] exited with preempt_count 1
> -# Fixing recursive fault but reboot is needed!
> -kms_plane_lowres@pipe-F-tiling-y
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
>   
> -# Take too long, we have only two machines, and these are very flaky
> -kms_cursor_crc.*
> -
> -# Machine is hanging in this test, so skip it
> -kms_pipe_crc_basic@disable-crc-after-crtc
> \ No newline at end of file
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> index d516d9c1d546..ca52e42f0b50 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> @@ -1,75 +1,4 @@
> -kms_color@gamma,Fail
> -kms_color@legacy-gamma,Fail
> -kms_color@pipe-A-legacy-gamma,Fail
> -kms_color@pipe-B-legacy-gamma,Fail
> -kms_cursor_crc@cursor-alpha-opaque,Fail
> -kms_cursor_crc@cursor-alpha-transparent,Fail
> -kms_cursor_crc@cursor-dpms,Fail
> -kms_cursor_crc@cursor-offscreen-32x10,Fail
> -kms_cursor_crc@cursor-offscreen-32x32,Fail
> -kms_cursor_crc@cursor-offscreen-64x64,Fail
> -kms_cursor_crc@cursor-onscreen-32x10,Fail
> -kms_cursor_crc@cursor-onscreen-32x32,Fail
> -kms_cursor_crc@cursor-onscreen-64x21,Fail
> -kms_cursor_crc@cursor-onscreen-64x64,Fail
> -kms_cursor_crc@cursor-random-32x10,Fail
> -kms_cursor_crc@cursor-random-32x32,Fail
> -kms_cursor_crc@cursor-random-64x21,Fail
> -kms_cursor_crc@cursor-random-64x64,Fail
> -kms_cursor_crc@cursor-rapid-movement-32x32,Fail
> -kms_cursor_crc@cursor-rapid-movement-64x21,Fail
> -kms_cursor_crc@cursor-rapid-movement-64x64,Fail
> -kms_cursor_crc@cursor-size-change,Fail
> -kms_cursor_crc@cursor-sliding-32x10,Fail
> -kms_cursor_crc@cursor-sliding-32x32,Fail
> -kms_cursor_crc@cursor-sliding-64x21,Fail
> -kms_cursor_crc@cursor-sliding-64x64,Fail
> -kms_flip@basic-flip-vs-wf_vblank,Fail
> -kms_flip@blocking-wf_vblank,Fail
> -kms_flip@dpms-vs-vblank-race,Fail
> -kms_flip@flip-vs-absolute-wf_vblank,Fail
> -kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
> -kms_flip@flip-vs-blocking-wf-vblank,Fail
> -kms_flip@flip-vs-modeset-vs-hang,Fail
> -kms_flip@flip-vs-panning,Fail
> -kms_flip@flip-vs-panning-interruptible,Fail
> -kms_flip@flip-vs-panning-vs-hang,Fail
> -kms_flip@modeset-vs-vblank-race,Fail
> -kms_flip@plain-flip-fb-recreate,Fail
> -kms_flip@plain-flip-fb-recreate-interruptible,Fail
> -kms_flip@plain-flip-ts-check,Fail
> -kms_flip@plain-flip-ts-check-interruptible,Fail
> -kms_flip@wf_vblank-ts-check,Fail
> -kms_flip@wf_vblank-ts-check-interruptible,Fail
> -kms_invalid_mode@int-max-clock,Fail
> -kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> -kms_pipe_crc_basic@compare-crc-sanitycheck-xr24,Fail
> -kms_pipe_crc_basic@disable-crc-after-crtc,Fail
> -kms_pipe_crc_basic@nonblocking-crc,Fail
> -kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
> -kms_pipe_crc_basic@read-crc,Fail
> -kms_pipe_crc_basic@read-crc-frame-sequence,Fail
> -kms_plane@pixel-format,Fail
> -kms_plane@pixel-format-source-clamping,Fail
> -kms_plane@plane-panning-bottom-right,Fail
> -kms_plane@plane-panning-top-left,Fail
> -kms_plane@plane-position-covered,Fail
> -kms_plane@plane-position-hole,Fail
> -kms_plane@plane-position-hole-dpms,Fail
> -kms_plane_cursor@overlay,Fail
> -kms_plane_cursor@pipe-B-overlay-size-128,Fail
> -kms_plane_cursor@pipe-B-overlay-size-256,Fail
> -kms_plane_cursor@pipe-B-overlay-size-64,Fail
> -kms_plane_cursor@pipe-B-primary-size-128,Fail
> -kms_plane_cursor@pipe-B-primary-size-256,Fail
> -kms_plane_cursor@pipe-B-primary-size-64,Fail
> -kms_plane_cursor@pipe-B-viewport-size-128,Fail
> -kms_plane_cursor@pipe-B-viewport-size-256,Fail
> -kms_plane_cursor@pipe-B-viewport-size-64,Fail
> -kms_plane_cursor@primary,Fail
> -kms_plane_cursor@viewport,Fail
> -kms_plane_multiple@atomic-pipe-B-tiling-none,Fail
> -kms_plane_multiple@tiling-none,Fail
> -kms_prime@basic-crc,Fail
> -kms_rmfb@close-fd,Fail
> -kms_universal_plane@universal-plane-pipe-B-functional,Fail
> +dumb_buffer,Fail
> +panfrost_prime,Fail
> +panfrost_submit,Fail
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> index c9fdc623ab91..d322e80be34a 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> @@ -1,7 +1,6 @@
> -kms_bw@linear-tiling-2-displays-1920x1080p
> -kms_cursor_crc@cursor-offscreen-64x21
> -kms_flip@dpms-vs-vblank-race-interruptible
> -kms_flip@flip-vs-wf_vblank-interruptible
> -kms_plane_cursor@overlay
> -kms_plane_cursor@primary
> -kms_plane_cursor@viewport
> +# Board Name: rk3399-gru-kevin
> +# Bug Report: TBD
> +# IGT Version: 1.28-g7d1841317
> +# Linux Version: 6.9.0-rc4
> +# Reported by deqp-runner
> +core_hotunplug
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> index 10c3d81a919a..22a643457bd9 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> @@ -1,5 +1,18 @@
>   # Suspend to RAM seems to be broken on this machine
>   .*suspend.*
>   
> -# Too unstable, machine ends up hanging after lots of Oopses
> -kms_cursor_legacy.*
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> +
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> index 5b8cbb28b25c..4ea6f4c8fac0 100644
> --- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> @@ -1,33 +1,72 @@
> -kms_addfb_basic@addfb25-bad-modifier,Fail
>   kms_addfb_basic@bad-pitch-65536,Fail
>   kms_addfb_basic@bo-too-small,Fail
>   kms_addfb_basic@size-max,Fail
>   kms_addfb_basic@too-high,Fail
>   kms_atomic_transition@plane-primary-toggle-with-vblank-wait,Fail
>   kms_bw@linear-tiling-1-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-1-displays-2160x1440p,Fail
>   kms_bw@linear-tiling-1-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-10-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-10-displays-2160x1440p,Fail
> +kms_bw@linear-tiling-10-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-10-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-11-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-11-displays-2160x1440p,Fail
> +kms_bw@linear-tiling-11-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-11-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-12-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-12-displays-2160x1440p,Fail
> +kms_bw@linear-tiling-12-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-12-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-13-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-13-displays-2160x1440p,Fail
> +kms_bw@linear-tiling-13-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-13-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-14-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-14-displays-2160x1440p,Fail
> +kms_bw@linear-tiling-14-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-14-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-15-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-15-displays-2160x1440p,Fail
> +kms_bw@linear-tiling-15-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-15-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-16-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-16-displays-2160x1440p,Fail
> +kms_bw@linear-tiling-16-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-16-displays-3840x2160p,Fail
>   kms_bw@linear-tiling-2-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-2-displays-2160x1440p,Fail
>   kms_bw@linear-tiling-2-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-2-displays-3840x2160p,Fail
>   kms_bw@linear-tiling-3-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-3-displays-2160x1440p,Fail
>   kms_bw@linear-tiling-3-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-3-displays-3840x2160p,Fail
>   kms_bw@linear-tiling-4-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-4-displays-2160x1440p,Fail
>   kms_bw@linear-tiling-4-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-4-displays-3840x2160p,Fail
>   kms_bw@linear-tiling-5-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-5-displays-2160x1440p,Fail
>   kms_bw@linear-tiling-5-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-5-displays-3840x2160p,Fail
>   kms_bw@linear-tiling-6-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-6-displays-2160x1440p,Fail
>   kms_bw@linear-tiling-6-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-6-displays-3840x2160p,Fail
>   kms_bw@linear-tiling-7-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-7-displays-2160x1440p,Fail
>   kms_bw@linear-tiling-7-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-7-displays-3840x2160p,Fail
>   kms_bw@linear-tiling-8-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-8-displays-2160x1440p,Fail
>   kms_bw@linear-tiling-8-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-8-displays-3840x2160p,Fail
> +kms_bw@linear-tiling-9-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-9-displays-2160x1440p,Fail
> +kms_bw@linear-tiling-9-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-9-displays-3840x2160p,Fail
>   kms_flip@absolute-wf_vblank,Fail
>   kms_flip@absolute-wf_vblank-interruptible,Fail
>   kms_flip@basic-flip-vs-wf_vblank,Fail
> @@ -54,35 +93,21 @@ kms_flip@plain-flip-ts-check-interruptible,Fail
>   kms_flip@wf_vblank-ts-check,Fail
>   kms_flip@wf_vblank-ts-check-interruptible,Fail
>   kms_invalid_mode@int-max-clock,Fail
> -kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
> -kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
> -kms_plane_scaling@planes-upscale-20x20,Fail
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
> -kms_plane_scaling@upscale-with-modifier-20x20,Fail
> -kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
> -kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
> -kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
> -kms_plane_scaling@upscale-with-rotation-20x20,Fail
> -kms_selftest@drm_format,Timeout
> -kms_selftest@drm_format_helper,Timeout
> +kms_lease@cursor-implicit-plane,Fail
> +kms_lease@lease-uevent,Fail
> +kms_lease@page-flip-implicit-plane,Fail
> +kms_lease@setcrtc-implicit-plane,Fail
> +kms_lease@simple-lease,Fail
> +kms_sequence@get-busy,Fail
> +kms_sequence@get-forked,Fail
> +kms_sequence@get-forked-busy,Fail
> +kms_sequence@get-idle,Fail
> +kms_sequence@queue-busy,Fail
> +kms_sequence@queue-idle,Fail
>   kms_setmode@basic,Fail
>   kms_vblank@accuracy-idle,Fail
>   kms_vblank@crtc-id,Fail
>   kms_vblank@invalid,Fail
> -kms_vblank@pipe-A-accuracy-idle,Fail
> -kms_vblank@pipe-A-query-busy,Fail
> -kms_vblank@pipe-A-query-forked,Fail
> -kms_vblank@pipe-A-query-forked-busy,Fail
> -kms_vblank@pipe-A-query-idle,Fail
> -kms_vblank@pipe-A-ts-continuation-idle,Fail
> -kms_vblank@pipe-A-ts-continuation-modeset,Fail
> -kms_vblank@pipe-A-ts-continuation-suspend,Fail
> -kms_vblank@pipe-A-wait-busy,Fail
> -kms_vblank@pipe-A-wait-forked,Fail
> -kms_vblank@pipe-A-wait-forked-busy,Fail
> -kms_vblank@pipe-A-wait-idle,Fail
>   kms_vblank@query-busy,Fail
>   kms_vblank@query-forked,Fail
>   kms_vblank@query-forked-busy,Fail
> @@ -97,3 +122,10 @@ kms_vblank@wait-busy,Fail
>   kms_vblank@wait-forked,Fail
>   kms_vblank@wait-forked-busy,Fail
>   kms_vblank@wait-idle,Fail
> +perf@i915-ref-count,Fail
> +tools_test@tools_test,Fail
> +xe_module_load@force-load,Fail
> +xe_module_load@load,Fail
> +xe_module_load@many-reload,Fail
> +xe_module_load@reload,Fail
> +xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> index 78be18174012..1c3eb5d3b422 100644
> --- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> @@ -3,4 +3,21 @@
>   kms_cursor_legacy.*
>   
>   # Job just hangs without any output
> -kms_flip@flip-vs-suspend.*
> \ No newline at end of file
> +kms_flip@flip-vs-suspend.*
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> +
> +# Skip these tests as core_getrevision fails
> +core_hotunplug.*
