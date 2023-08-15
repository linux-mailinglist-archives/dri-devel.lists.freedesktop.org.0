Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925F477CCBC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 14:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E8710E243;
	Tue, 15 Aug 2023 12:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A42C10E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692102826; x=1723638826;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WBeGNFXesVdT1uLKnbbL2aHU9gVF8QXIRmrGB5ba0gc=;
 b=n0KCW/mhKO7c1Kn0iS+fZGv86YQGYZBB61hCtmC21aFJPtgF+HW/08XM
 FMks8Uv63vpA+B0GpM3KecfYB8aZjkZfgu2j4gxnQqmmLwJjmGz01QH1/
 VwQc6oIEgxwOnt8d74uj1sLgq2+xO7CuikSRWwqn3pkUq4Wey1lJMAryc
 /TA6ceogQ0DoHm4JUKBuoVFOMbcpZtXDzcMXyhxAnDlJ53cawsglJv4tQ
 dMZC5Jtf41+Bf3lvrkdcx2jk2Kg1cXMFXTSmb+VYgRC+mz0/IdJEVCwvn
 b0nhgkXArZmQ+KkbY9heRBdYFwIISGCmzmxrWDMp6Tr0G8PHSyJc+8ie7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371173362"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="371173362"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 05:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857431561"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="857431561"
Received: from cristina-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.75])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 05:33:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
Subject: Re: [PULL for v6.6] drm-misc-next
In-Reply-To: <871qg4cwq9.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <389b-64db6700-1-3dc04b80@31442286> <871qg4cwq9.fsf@intel.com>
Date: Tue, 15 Aug 2023 15:33:38 +0300
Message-ID: <87y1icbi3h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Maxime Ripard <mripard@kernel.org>, daniels@collabora.com,
 robdclark@google.com, david.heidelberg@collabora.com, daniel.vetter@ffwll.ch,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gustavo.padovan@collabora.com, anholt@google.com, robclark@freedesktop.org,
 emma@anholt.net, airlied@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Aug 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 15 Aug 2023, "Helen Mae Koike Fornazier" <helen.koike@collabora.com> wrote:
>> On Tuesday, August 15, 2023 06:12 -03, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>>> On Mon, 14 Aug 2023, Helen Koike <helen.koike@collabora.com> wrote:
>>> > The following changes since commit f5d8f9c0d8b4bc8ad7e7b23a9f4d116e99202dd3:
>>> >
>>> >   drm/panel: JDI LT070ME05000 simplify with dev_err_probe() (2023-08-14 14:44:30 +0200)
>>> >
>>> > are available in the Git repository at:
>>> >
>>> >   git@gitlab.freedesktop.org:helen.fornazier/linux.git tags/drm-ci-v13-drm-misc
>>> >
>>> > for you to fetch changes up to 60242246bc906a37a7eae2094633a38bda7d45e6:
>>> >
>>> >   drm: Add initial ci/ subdirectory (2023-08-14 20:47:37 -0300)
>>> >
>>> > ----------------------------------------------------------------
>>> > drm-ci for drm-misc-next
>>> 
>>> FYI, usually the subject indicates the source or what to pull, not the
>>> destination. Was confused here for a bit. ;)
>>
>> Thanks for the info! Should I re-send this one?
>
> Nah. But is this supposed to be pulled into drm-misc-next, or directly
> to drm-next? If the former, it'll help to Cc the maintainers! (Done
> now.)

Scratch that, and read Thomas' reply instead. ;)

BR,
Jani.


>
> BR,
> Jani.
>
>
>>
>> Regards,
>> Helen
>>
>>> 
>>> BR,
>>> Jani.
>>> 
>>> >
>>> > Here is the patch that adds a ci/ subdirectory to drm and allows
>>> > developers to easily execute tests.
>>> >
>>> > Developers can easily execute several tests on different devices
>>> > by just pushing their branch to their fork in a repository hosted
>>> > on gitlab.freedesktop.org which has an infrastructure to run jobs
>>> > in several runners and farms with different devices.
>>> >
>>> > The patch was acked and tested by others.
>>> >
>>> > Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>> >
>>> > ----------------------------------------------------------------
>>> > Tomeu Vizoso (1):
>>> >       drm: Add initial ci/ subdirectory
>>> >
>>> >  Documentation/gpu/automated_testing.rst            |  144 +
>>> >  Documentation/gpu/index.rst                        |    1 +
>>> >  MAINTAINERS                                        |    8 +
>>> >  drivers/gpu/drm/ci/arm.config                      |   69 +
>>> >  drivers/gpu/drm/ci/arm64.config                    |  199 ++
>>> >  drivers/gpu/drm/ci/build-igt.sh                    |   35 +
>>> >  drivers/gpu/drm/ci/build.sh                        |  157 ++
>>> >  drivers/gpu/drm/ci/build.yml                       |  110 +
>>> >  drivers/gpu/drm/ci/check-patch.py                  |   57 +
>>> >  drivers/gpu/drm/ci/container.yml                   |   65 +
>>> >  drivers/gpu/drm/ci/gitlab-ci.yml                   |  251 ++
>>> >  drivers/gpu/drm/ci/igt_runner.sh                   |   77 +
>>> >  drivers/gpu/drm/ci/image-tags.yml                  |   15 +
>>> >  drivers/gpu/drm/ci/lava-submit.sh                  |   57 +
>>> >  drivers/gpu/drm/ci/static-checks.yml               |   12 +
>>> >  drivers/gpu/drm/ci/test.yml                        |  335 +++
>>> >  drivers/gpu/drm/ci/testlist.txt                    | 2912 ++++++++++++++++++++
>>> >  drivers/gpu/drm/ci/x86_64.config                   |  111 +
>>> >  drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |   19 +
>>> >  drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |   21 +
>>> >  drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |    2 +
>>> >  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |   17 +
>>> >  drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |   32 +
>>> >  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |    4 +
>>> >  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |   58 +
>>> >  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |    1 +
>>> >  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt       |    6 +
>>> >  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |   18 +
>>> >  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |   38 +
>>> >  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |    2 +
>>> >  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |   19 +
>>> >  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |   41 +
>>> >  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |    5 +
>>> >  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |   25 +
>>> >  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt      |   26 +
>>> >  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |    5 +
>>> >  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |   37 +
>>> >  drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt      |    5 +
>>> >  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |   11 +
>>> >  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |   48 +
>>> >  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |    1 +
>>> >  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt       |    2 +
>>> >  .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   29 +
>>> >  .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |    0
>>> >  .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   10 +
>>> >  .../gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt   |   14 +
>>> >  drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |   12 +
>>> >  drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt    |    4 +
>>> >  drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   15 +
>>> >  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt   |    4 +
>>> >  drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |    2 +
>>> >  drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt   |    4 +
>>> >  drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |    2 +
>>> >  drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt     |   25 +
>>> >  drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt    |    7 +
>>> >  drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt     |   23 +
>>> >  drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   68 +
>>> >  drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |   11 +
>>> >  drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |    2 +
>>> >  .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |   48 +
>>> >  .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |    9 +
>>> >  .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |   52 +
>>> >  .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |   36 +
>>> >  .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |   24 +
>>> >  .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |    5 +
>>> >  .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |   38 +
>>> >  .../gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt   |    0
>>> >  .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |    6 +
>>> >  68 files changed, 5508 insertions(+)
>>> >  create mode 100644 Documentation/gpu/automated_testing.rst
>>> >  create mode 100644 drivers/gpu/drm/ci/arm.config
>>> >  create mode 100644 drivers/gpu/drm/ci/arm64.config
>>> >  create mode 100644 drivers/gpu/drm/ci/build-igt.sh
>>> >  create mode 100644 drivers/gpu/drm/ci/build.sh
>>> >  create mode 100644 drivers/gpu/drm/ci/build.yml
>>> >  create mode 100755 drivers/gpu/drm/ci/check-patch.py
>>> >  create mode 100644 drivers/gpu/drm/ci/container.yml
>>> >  create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
>>> >  create mode 100755 drivers/gpu/drm/ci/igt_runner.sh
>>> >  create mode 100644 drivers/gpu/drm/ci/image-tags.yml
>>> >  create mode 100755 drivers/gpu/drm/ci/lava-submit.sh
>>> >  create mode 100644 drivers/gpu/drm/ci/static-checks.yml
>>> >  create mode 100644 drivers/gpu/drm/ci/test.yml
>>> >  create mode 100644 drivers/gpu/drm/ci/testlist.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/x86_64.config
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
>>> >  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
>>> 
>>> -- 
>>> Jani Nikula, Intel Open Source Graphics Center
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
