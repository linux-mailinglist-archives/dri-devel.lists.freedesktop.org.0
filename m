Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523435FF2C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 19:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CC210EB36;
	Fri, 14 Oct 2022 17:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D8010EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 17:10:45 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-132b8f6f1b2so6552081fac.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 10:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lvHkbVkJp6EcnRQi+5PIMElEgmgHrVtQA2UXnyTLJnE=;
 b=UigVBOMALTsPKNEDJ5HLNuYVHLL3LdbmGKmb7QccsIWD9OUI1M/d4hfnqa4j+dxasl
 k0mZMczbS3Ed3p7E6US1OI14quCpOgFMt3PF9zrQIQxDuGtqmy1kbvQdyZN7NHtwr7Sw
 HelkeT8jWTDEHWaqA4m01Vvzh1BBiuEEcQ0XVYxRjNj6DQ80oH+4CusowLliMcMuPnmN
 8vENjthImk7oxzd9mv15wldxXJgggP0XD1H8yMk5G7D6jl4MqtEVyP5Gknmkh1AaRiH/
 RkAVsgJ/8aKOvb78eA4Iy+ivCKQP0/Aw4UJElz3I13f9k+4b7h6xV17QjsTTM/W7AzwY
 8rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lvHkbVkJp6EcnRQi+5PIMElEgmgHrVtQA2UXnyTLJnE=;
 b=Ixtk+uI1LqwS61ynOdKRXtFny7rxvqwulT+k8yDHE8ofY/xRD7KTm2kCWJMai7cpPp
 SZB4te9KAmY7RAcuZfxxfxc7A0pH5mtbQLTS+yPJgZn2QByjOqOAQx878T8RXBa40RBM
 +rMZNOlxKzqqSpSzB4jV9nlu97se/feIi2i9iqkMZ953MnprdMVyLZN0arkw4HVxasoZ
 4l6PJ76M5qRr3DKegw0kwqLkaewtwQ3jTBXvL9euv+Xuw4cXBWtJxOzdIMsk8CePzj1L
 cW4Y5L1GdqNXUuXSPRojXM4et3Etua3ZfCF4sVLq8THnpkUCJBg3koh0D6DkLDIaKIx4
 glHw==
X-Gm-Message-State: ACrzQf1AN/ThNFWdcl/zZdfQWz5K+4yp6t8JwM5D8y5K6yRHKz33AcCk
 oXp8/rggmEioA94yyZsuf3a9OqTyrm9R/TxIWS8=
X-Google-Smtp-Source: AMsMyM5YRJU50ghT4+PK7ZzjpjEuEF0K9MRdSqXqrXv+y3RgpJpGuixHukGTzRdv7CkiKNlLB9FtM4jof+P+XDYdfHA=
X-Received: by 2002:a05:6870:4286:b0:132:756f:6b97 with SMTP id
 y6-20020a056870428600b00132756f6b97mr3301793oah.38.1665767443808; Fri, 14 Oct
 2022 10:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220909141528.5090-1-tomeu.vizoso@collabora.com>
 <20220912072903.14626-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20220912072903.14626-1-tomeu.vizoso@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 14 Oct 2022 10:10:50 -0700
Message-ID: <CAF6AEGsjfHSYwB0q4qKnLeMnpZigBwcFrkkLpxofKizLVArX5A@mail.gmail.com>
Subject: Re: [PATCH v9] drm: Add initial ci/ subdirectory
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 12:29 AM Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:
>
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
>   - Add Qcom USB PHYs to config as they are now =m in the defconfig
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  Documentation/gpu/automated_testing.rst       |  144 +
>  Documentation/gpu/index.rst                   |    1 +
>  MAINTAINERS                                   |    8 +
>  drivers/gpu/drm/ci/arm.config                 |   57 +
>  drivers/gpu/drm/ci/arm64.config               |  179 ++
>  drivers/gpu/drm/ci/build-igt.sh               |   43 +
>  drivers/gpu/drm/ci/build.sh                   |  158 +
>  drivers/gpu/drm/ci/build.yml                  |  110 +
>  drivers/gpu/drm/ci/check-patch.py             |   57 +
>  drivers/gpu/drm/ci/container.yml              |   54 +
>  drivers/gpu/drm/ci/gitlab-ci.yml              |  225 ++
>  drivers/gpu/drm/ci/igt_runner.sh              |   77 +
>  drivers/gpu/drm/ci/image-tags.yml             |   13 +
>  drivers/gpu/drm/ci/lava-submit.sh             |   53 +
>  drivers/gpu/drm/ci/static-checks.yml          |   12 +
>  drivers/gpu/drm/ci/test.yml                   |  322 ++
>  drivers/gpu/drm/ci/testlist.txt               | 2763 +++++++++++++++++
>  drivers/gpu/drm/ci/x86_64.config              |  105 +
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   19 +
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   15 +
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |    2 +
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |   32 +
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |    2 +
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   29 +
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |    1 +
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |    2 +
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   37 +
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   40 +
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |    2 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |    8 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   25 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |    2 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   19 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |    5 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |    8 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   30 +
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |    1 +
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   29 +
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   10 +
>  .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |   14 +
>  .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |    5 +
>  .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |    4 +
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   15 +
>  .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |    4 +
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    2 +
>  .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    4 +
>  .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |    2 +
>  .../gpu/drm/ci/xfails/msm-sc7180-fails.txt    |   21 +
>  .../gpu/drm/ci/xfails/msm-sc7180-flakes.txt   |    6 +
>  .../gpu/drm/ci/xfails/msm-sc7180-skips.txt    |   23 +
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   43 +
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   11 +
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |    2 +
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   43 +
>  .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |    2 +
>  .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   49 +
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   29 +
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   20 +
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |    5 +
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   38 +
>  .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |    0
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |    6 +
>  62 files changed, 5047 insertions(+)
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
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
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
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
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
>
[snip]
