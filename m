Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8B765C6A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 21:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9B210E5EB;
	Thu, 27 Jul 2023 19:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616E910E5EE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 19:49:54 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5221b90f763so1719347a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 12:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690487392; x=1691092192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojkcqNP3uNOpjlJhJHIBQRfHAVcUXxAGMw8NVAHP+Aw=;
 b=I7XbOwk9ivyvO02VJOEgZz8t6BFEFy+fODHwc2cu5KkKlIVGnd/zMdTBD0S1ssLnWX
 byXU2HxeC38ySEEvcOfdacZKANB/U+rFesxnDxrouuEcqneXSYUu0HEcNNmf/oCIIQBl
 /Nj1IiX0c2HXOCT3UPUbV1jsrgss1xp7gu6tRVR3juTLQ9jCug15ExCKMv9RapobxkKR
 bZNntp5mlPkkOvpjMjQaXRB2GvMYkvRqFtDFm/ZqslSI9AL304KAnR/sorjwrHJHG6ui
 5ev1hADND1vGVccUiVbhstBkd0kK6cgv/FUP0jCJyvX7IgX5RfAjfsn8q59fFkDr+Ur0
 Wh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690487392; x=1691092192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ojkcqNP3uNOpjlJhJHIBQRfHAVcUXxAGMw8NVAHP+Aw=;
 b=ACFxJ4HcOLlw45wuJG4W6UShHuCNy3VbsRM4VDzPSBYZMDAeC+OIUMh3FcebDd/bh4
 XHYvZ5H2FM7aw8P+iptFV7JoRzoeBYN4LftsKOFefg/Bbgp4LwFkV47LpVpU9121w5ry
 5GYtqLisjb/Q5OMFm9nU16LlRoV8bdQTlJ7GYY6m1/W4dXg1ChpEC/NYrOGwWibBpQJL
 4MDNfD4EE1jB9TfsJC3D14J2QQL0En0iuOcS19PJdfFS0bfBc/Diu/qBI2eCqYjwq1A/
 m1IpK0VfjgmguvUNE2MEj236FHMUFRnH0d9bxrcBryR3G/Hy/iZGNrOMAXin4bwgnYba
 TfKA==
X-Gm-Message-State: ABy/qLbI2wZ1OyzSRriWjpdwgPC/5g2uSlDIp0vZRbBE3aS4DHjrUJNi
 1W+6yl7K6BWRMaRqafV6RnZd/zqtYNcbOx6vWog=
X-Google-Smtp-Source: APBJJlFeqJRN1XqDEqH2Iu9+gzDYkOMaNfSFN4sliyp+zjGW1ZWr8bfuziJzJ6mQ5c0KNfcSeEbK68Ks+WIdLDMHaSg=
X-Received: by 2002:a05:6402:1003:b0:51d:9905:6f60 with SMTP id
 c3-20020a056402100300b0051d99056f60mr4563edu.41.1690487392315; Thu, 27 Jul
 2023 12:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230720152737.102382-1-helen.koike@collabora.com>
In-Reply-To: <20230720152737.102382-1-helen.koike@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 27 Jul 2023 12:49:39 -0700
Message-ID: <CAF6AEGtXL5vjp3Uup6Mk19MiY8E26-tpyXVmxXYhMd3fiadykQ@mail.gmail.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
To: Helen Koike <helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com, mripard@kernel.org,
 anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 8:27=E2=80=AFAM Helen Koike <helen.koike@collabora.=
com> wrote:
>
> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>
> Developers can easily execute several tests on different devices
> by just pushing their branch to their fork in a repository hosted
> on gitlab.freedesktop.org which has an infrastructure to run jobs
> in several runners and farms with different devices.
>
> There are also other automated tools that uprev dependencies,
> monitor the infra, and so on that are already used by the Mesa
> project, and we can reuse them too.
>
> Also, store expectations about what the DRM drivers are supposed
> to pass in the IGT test suite. By storing the test expectations
> along with the code, we can make sure both stay in sync with each
> other so we can know when a code change breaks those expectations.
>
> Also, include a configuration file that points to the out-of-tree
> CI scripts.
>
> This will allow all contributors to drm to reuse the infrastructure
> already in gitlab.freedesktop.org to test the driver on several
> generations of the hardware.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> ---
>
> Hello,
>
> I'm re-spining this patch sent originally by Tomeu.
>
> This is meant to be an auxiliary tool where developers and
> maintainers can just submit their code to fdo and see if
> tests passes, than they can decide if it is worthy merging
> it or not.
>
> This tool has proven its value on the Mesa community
> and it can bring a lot of value here too.
>
> Please review and let me know your thoughts.
>
> You can also see this patch on
> https://gitlab.freedesktop.org/helen.fornazier/linux/-/tree/drm-ci-tests
>
> Thanks!
>
> v2:
>   - Fix names of result expectation files to match SoC
>   - Don't execute tests that are going to skip on all boards
>
> v3:
>   - Remove tracking of dmesg output during test execution
>
> v4:
>   - Move up to drivers/gpu/drm
>   - Add support for a bunch of other drivers
>   - Explain how to incorporate fixes for CI from a
>     ${TARGET_BRANCH}-external-fixes branch
>   - Remove tests that pass from expected results file, to reduce the
>     size of in-tree files
>   - Add docs about how to deal with outages in automated testing labs
>   - Specify the exact SHA of the CI scripts to be used
>
> v5:
>   - Remove unneeded skips from Meson expectations file
>   - Use a more advanced runner that detects flakes automatically
>   - Use a more succint format for the expectations
>   - Run many more tests (and use sharding to finish in time)
>   - Use skip lists to avoid hanging machines
>   - Add some build testing
>   - Build IGT in each pipeline for faster uprevs
>   - List failures in the GitLab UI
>
> v6:
>   - Rebase on top of latest drm-next
>   - Lower priority of LAVA jobs to not impact Mesa CI as much
>   - Update docs
>
> v7:
>   - Rebase on top of latest drm-next
>
> v8:
>   - Move all files specific to testing the kernel into the kernel tree
>     (thus I have dropped the r-bs I had collected so far)
>   - Uprev Gitlab CI infrastructure scripts to the latest from Mesa
>   - Add MAINTAINERS entry
>   - Fix boot on MT8173 by adding some Kconfigs that are now needed
>   - Link to the docs from index.rst and hard-wrap the file
>
> v9:
>   - Only automatically run the pipelines for merge requests
>   - Switch to zstd for the build artifacts to align with Mesa
>   - Add Qcom USB PHYs to config as they are now =3Dm in the defconfig
>
> v10:
>   - Include ci yml files from mesa/mesa (where the development is
>     current active) instead of a spin off project.
>   - Uprev Gitlab CI infrastructure scripts to the latest from Mesa
>   - Update MAINTAINERS entry
>   - Uprev igt tool
>   - add LAVA_JOB_PRIORITY: 30
>   - pipeline example:
>   https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/940506
> ---
>  Documentation/gpu/automated_testing.rst       |  144 +
>  Documentation/gpu/index.rst                   |    1 +
>  MAINTAINERS                                   |    8 +
>  drivers/gpu/drm/ci/arm.config                 |   69 +
>  drivers/gpu/drm/ci/arm64.config               |  199 ++
>  drivers/gpu/drm/ci/build-igt.sh               |   35 +
>  drivers/gpu/drm/ci/build.sh                   |  157 +
>  drivers/gpu/drm/ci/build.yml                  |  110 +
>  drivers/gpu/drm/ci/check-patch.py             |   57 +
>  drivers/gpu/drm/ci/container.yml              |   61 +
>  drivers/gpu/drm/ci/gitlab-ci.yml              |  252 ++
>  drivers/gpu/drm/ci/igt_runner.sh              |   77 +
>  drivers/gpu/drm/ci/image-tags.yml             |   15 +
>  drivers/gpu/drm/ci/lava-submit.sh             |   57 +
>  drivers/gpu/drm/ci/static-checks.yml          |   12 +
>  drivers/gpu/drm/ci/test.yml                   |  335 ++
>  drivers/gpu/drm/ci/testlist.txt               | 2912 +++++++++++++++++
>  drivers/gpu/drm/ci/x86_64.config              |  111 +
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   22 +
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   19 +
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |    2 +
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   17 +
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |   32 +
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |    4 +
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   57 +
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |    1 +
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |    4 +
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |   18 +
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   37 +
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |    2 +
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   18 +
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   41 +
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |    5 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   26 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   25 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |    5 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   37 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |    5 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   11 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   47 +
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |    1 +
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |    2 +
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   29 +
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |    0
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   10 +
>  .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |   14 +
>  .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   12 +
>  .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |    4 +
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   15 +
>  .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |    4 +
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    2 +
>  .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    4 +
>  .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |    2 +
>  .../gpu/drm/ci/xfails/msm-sc7180-fails.txt    |   25 +
>  .../gpu/drm/ci/xfails/msm-sc7180-flakes.txt   |    7 +
>  .../gpu/drm/ci/xfails/msm-sc7180-skips.txt    |   23 +
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   68 +
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   11 +
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |    2 +
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   49 +
>  .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |    8 +
>  .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   52 +
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   39 +
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   23 +
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |    5 +
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   38 +
>  .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |    0
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |    6 +
>  test                                          |    0
>  69 files changed, 5502 insertions(+)
>  create mode 100644 Documentation/gpu/automated_testing.rst
>  create mode 100644 drivers/gpu/drm/ci/arm.config
>  create mode 100644 drivers/gpu/drm/ci/arm64.config
>  create mode 100644 drivers/gpu/drm/ci/build-igt.sh
>  create mode 100644 drivers/gpu/drm/ci/build.sh
>  create mode 100644 drivers/gpu/drm/ci/build.yml
>  create mode 100755 drivers/gpu/drm/ci/check-patch.py
>  create mode 100644 drivers/gpu/drm/ci/container.yml
>  create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
>  create mode 100755 drivers/gpu/drm/ci/igt_runner.sh
>  create mode 100644 drivers/gpu/drm/ci/image-tags.yml
>  create mode 100755 drivers/gpu/drm/ci/lava-submit.sh
>  create mode 100644 drivers/gpu/drm/ci/static-checks.yml
>  create mode 100644 drivers/gpu/drm/ci/test.yml
>  create mode 100644 drivers/gpu/drm/ci/testlist.txt
>  create mode 100644 drivers/gpu/drm/ci/x86_64.config
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
>  create mode 100644 test
>

[snip]

> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab=
-ci.yml
> new file mode 100644
> index 000000000000..32d8e2258eb6
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -0,0 +1,252 @@
> +variables:
> +  # Change this to use your fork of drm-ci

nit, I think this comment mostly doesn't make sense since everyone
would be using the same version of this gitlab-ci.yml, Ie. we can't
have msm and nouveau and intel and so on with there own conflicting
patches on gitlab-ci.yml

I did run into a bit of a chicken vs. egg problem with testing the "in
tree" version (compared to earlier versions which kept most of the yml
and scripts in a separate tree), is that it actually requires this
commit to exist in the branch you want to run CI on.  My earlier
workaround of pulling the drm/ci commit in via
${branchname}-external-fixes no longer works.

BR,
-R
