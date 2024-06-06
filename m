Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF08FEF02
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 16:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540D110E983;
	Thu,  6 Jun 2024 14:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YtRrkQHK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A44A10E730;
 Thu,  6 Jun 2024 14:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717685287;
 bh=dQuMVnPcFvL2rm7IsOiVG0+PEE/oKkyHvTcPJNmZa+0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YtRrkQHKb+X7xskObtg8FVCsFdwW8ShtHfCWtk4KRWoyx36T/q0AyGDwcPLitgXD0
 juSSzZ3cVZnQbEDdzMDSSm8xGeGxl3vLT/L53APO2Uo9mJm74o3YO7FrEl2BM+EyDS
 RHflhbHlPHGWQ7EThEjdeN/fGUeVCYOlIKGO8DrwcAr/iYf/5sLnc4QHnStmIq0v0h
 xLL7JMpSpaAnGsWurIR2SiEcuC0uSUEfaXkzCyK0B0+QnKCJRPycr/Fv0n4gXpkoOX
 CpotkDssPI/ghb/8UWFmzZvE0qBspVDQY2C+F0VYLb5GEI9kUvXljorsWjykBsbJu8
 LAPtwkBjkdYrA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 233DF37821F4;
 Thu,  6 Jun 2024 14:48:01 +0000 (UTC)
Message-ID: <da1366fa-4d48-4227-ae4b-4b39a6607973@collabora.com>
Date: Thu, 6 Jun 2024 11:47:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] drm/ci: uprev mesa/IGT and generate testlist
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240529024049.356327-1-vignesh.raman@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28/05/2024 23:40, Vignesh Raman wrote:
> Uprev mesa and IGT to the latest version and stop vendoring the
> testlist into the kernel. Instead, use the testlist from the
> IGT build to ensure we do not miss renamed or newly added tests.
> Update the xfails with the latest testlist run.
> 
> Add farm variable and update device type variable.
> 
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1187556
> 
> Vignesh Raman (6):
>    drm/ci: uprev mesa version
>    drm/ci: add farm variable
>    drm/ci: generate testlist from build
>    drm/ci: uprev IGT
>    drm/ci: skip driver specific tests
>    drm/ci: update xfails for the new testlist
> 
>   drivers/gpu/drm/ci/build-igt.sh               |   41 +-
>   drivers/gpu/drm/ci/build.sh                   |    6 +-
>   drivers/gpu/drm/ci/container.yml              |   12 +-
>   drivers/gpu/drm/ci/gitlab-ci.yml              |   46 +-
>   drivers/gpu/drm/ci/igt_runner.sh              |    9 +-
>   drivers/gpu/drm/ci/image-tags.yml             |    2 +-
>   drivers/gpu/drm/ci/lava-submit.sh             |    4 +-
>   drivers/gpu/drm/ci/test.yml                   |   17 +-
>   drivers/gpu/drm/ci/testlist.txt               | 2761 -----------------
>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   41 +-
>   .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |    7 +
>   .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   33 +-
>   drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   31 +
>   .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |    9 +
>   drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   22 +-
>   drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   46 +-
>   drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |    6 +
>   drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   26 +-
>   drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |   38 +
>   drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |    6 +
>   drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   23 +
>   drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   41 +-
>   drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |    7 +
>   drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   26 +-
>   drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   42 +-
>   drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |    7 +-
>   drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   36 +-
>   drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   77 +-
>   drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   28 +-
>   drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   63 +-
>   drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |    6 +
>   drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   22 +-
>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   30 +-
>   .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   11 +
>   .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   16 +
>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   21 +-
>   .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   18 +
>   .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   24 +-
>   .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   18 +
>   .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   12 +-
>   .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   15 +
>   .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    7 +
>   .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    6 +
>   .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   26 +-
>   .../msm-sc7180-trogdor-kingoftown-fails.txt   |  175 +-
>   .../msm-sc7180-trogdor-kingoftown-flakes.txt  |    8 +
>   .../msm-sc7180-trogdor-kingoftown-skips.txt   |   19 +
>   ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |  175 +-
>   ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |    6 +
>   ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   16 +
>   .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   38 +-
>   .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   25 +-
>   .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   19 +
>   .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   62 +-
>   .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   21 +-
>   .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   83 +-
>   .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   13 +-
>   .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   19 +
>   drivers/gpu/drm/ci/xfails/update-xfails.py    |    4 +-
>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   94 +-
>   .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   20 +-
>   61 files changed, 1348 insertions(+), 3194 deletions(-)
>   delete mode 100644 drivers/gpu/drm/ci/testlist.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
> 


Applied to drm-misc-next

Thanks
Helen
