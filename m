Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666189057DA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 18:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2258010E8B1;
	Wed, 12 Jun 2024 16:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Mo/bT/0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A0510E8BF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718208006;
 bh=MSagVrmNL3B8Tnl3lig3C0siYySma7g+Ssqui3cTNEI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Mo/bT/0vrnH6SMvGIg9R3w5yAC9P0aT/3PRLhQ1BU3VOCv/sHkQeEyzQWE18az5ig
 urCnzZCZS7zVoVf6/DBkzro7EYAoP1C5teWxX8ZQVOywosetSCniNkkVZz5/UD/YLf
 gHA9E/bC0NSax8DcLUprrxR8y5xJl1HWmEuzHB+OC13NGvebar7BLmKL4Syczpk+L2
 PtxmltFOSX4LtJvWBp+3WTkpgFeVNz2A3dAS1zklqnzQqoNTXuKJqbBCujX7K65beG
 8jGGsbF9loud3pmJb0qCmIYvXDGtlpT/YwXy9pqRoAcxVhFhXpCzJYDEwIlNTDbgvY
 /NOSHQgeHBN0Q==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F24C378219B;
 Wed, 12 Jun 2024 16:00:00 +0000 (UTC)
Message-ID: <5f177c6c-bfc1-493e-be08-aff57802ae65@collabora.com>
Date: Wed, 12 Jun 2024 12:59:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/ci: add tests on vkms
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, daniel@ffwll.ch, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 robdclark@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, daniels@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org
References: <20240611091037.558969-1-vignesh.raman@collabora.com>
 <4e9ce9fb-426b-431b-81db-9e960b0aab91@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <4e9ce9fb-426b-431b-81db-9e960b0aab91@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 11/06/2024 07:47, Vignesh Raman wrote:
> Hi,
> 
> Successful pipeline link,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1198487

lgtm, I'm applying this tomorrow if there are no more comments.

Regards,
Helen

> 
> Regards,
> Vignesh
> 
> On 11/06/24 14:40, Vignesh Raman wrote:
>> Add job that runs igt on top of vkms.
>>
>> Acked-by: Maíra Canal <mcanal@igalia.com>
>> Acked-by: Helen Koike <helen.koike@collabora.com>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> ---
>>
>> v2:
>> - do not mv modules to /lib/modules in the job definition, leave it to
>>    crosvm-runner.sh
>>
>> v3:
>> - Enable CONFIG_DRM_VKMS in x86_64.config and update xfails
>>
>> v4:
>> - Build vkms as module and test with latest IGT.
>>    This patch depends on 
>> https://lore.kernel.org/dri-devel/20240130150340.687871-1-vignesh.raman@collabora.com/
>>
>> v5:
>> - Test with the updated IGT and update xfails
>>
>> ---
>>   MAINTAINERS                                   |  1 +
>>   drivers/gpu/drm/ci/build.sh                   |  1 -
>>   drivers/gpu/drm/ci/gitlab-ci.yml              |  1 +
>>   drivers/gpu/drm/ci/igt_runner.sh              |  6 +-
>>   drivers/gpu/drm/ci/image-tags.yml             |  2 +-
>>   drivers/gpu/drm/ci/test.yml                   | 24 ++++++-
>>   drivers/gpu/drm/ci/x86_64.config              |  1 +
>>   drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 57 ++++++++++++++++
>>   .../gpu/drm/ci/xfails/vkms-none-flakes.txt    | 15 +++++
>>   drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 67 +++++++++++++++++++
>>   10 files changed, 169 insertions(+), 6 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8aee861d18f9..94065f5028cf 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7036,6 +7036,7 @@ L:    dri-devel@lists.freedesktop.org
>>   S:    Maintained
>>   T:    git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>   F:    Documentation/gpu/vkms.rst
>> +F:    drivers/gpu/drm/ci/xfails/vkms*
>>   F:    drivers/gpu/drm/vkms/
>>   DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU
>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
>> index a67871fdcd3f..e938074ac8e7 100644
>> --- a/drivers/gpu/drm/ci/build.sh
>> +++ b/drivers/gpu/drm/ci/build.sh
>> @@ -157,7 +157,6 @@ fi
>>   mkdir -p artifacts/install/lib
>>   mv install/* artifacts/install/.
>> -rm -rf artifacts/install/modules
>>   ln -s common artifacts/install/ci-common
>>   cp .config artifacts/${CI_JOB_NAME}_config
>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml 
>> b/drivers/gpu/drm/ci/gitlab-ci.yml
>> index 1b29c3b6406b..80fb0f57ae46 100644
>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>> @@ -123,6 +123,7 @@ stages:
>>     - msm
>>     - rockchip
>>     - virtio-gpu
>> +  - software-driver
>>   # YAML anchors for rule conditions
>>   # --------------------------------
>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh 
>> b/drivers/gpu/drm/ci/igt_runner.sh
>> index d49ad434b580..79f41d7da772 100755
>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>> @@ -30,10 +30,10 @@ case "$DRIVER_NAME" in
>>               export IGT_FORCE_DRIVER="panfrost"
>>           fi
>>           ;;
>> -    amdgpu)
>> +    amdgpu|vkms)
>>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't 
>> have the module in /lib
>> -        mv /install/modules/lib/modules/* /lib/modules/.
>> -        modprobe amdgpu
>> +        mv /install/modules/lib/modules/* /lib/modules/. || true
>> +        modprobe --first-time $DRIVER_NAME
>>           ;;
>>   esac
>> diff --git a/drivers/gpu/drm/ci/image-tags.yml 
>> b/drivers/gpu/drm/ci/image-tags.yml
>> index 60323ebc7304..13eda37bdf05 100644
>> --- a/drivers/gpu/drm/ci/image-tags.yml
>> +++ b/drivers/gpu/drm/ci/image-tags.yml
>> @@ -4,7 +4,7 @@ variables:
>>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>>      DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
>> -   DEBIAN_BUILD_TAG: "2023-10-08-config"
>> +   DEBIAN_BUILD_TAG: "2024-06-10-vkms"
>>      KERNEL_ROOTFS_TAG: "2023-10-06-amd"
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 322cce714657..ee908b66aad2 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -338,7 +338,7 @@ meson:g12b:
>>       RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
>>   virtio_gpu:none:
>> -  stage: virtio-gpu
>> +  stage: software-driver
>>     variables:
>>       CROSVM_GALLIUM_DRIVER: llvmpipe
>>       DRIVER_NAME: virtio_gpu
>> @@ -358,3 +358,25 @@ virtio_gpu:none:
>>       - debian/x86_64_test-gl
>>       - testing:x86_64
>>       - igt:x86_64
>> +
>> +vkms:none:
>> +  stage: software-driver
>> +  variables:
>> +    DRIVER_NAME: vkms
>> +    GPU_VERSION: none
>> +  extends:
>> +    - .test-gl
>> +    - .test-rules
>> +  tags:
>> +    - kvm
>> +  script:
>> +    - ln -sf $CI_PROJECT_DIR/install /install
>> +    - mv install/bzImage /lava-files/bzImage
>> +    - mkdir -p /lib/modules
>> +    - mkdir -p $CI_PROJECT_DIR/results
>> +    - ln -sf $CI_PROJECT_DIR/results /results
>> +    - ./install/crosvm-runner.sh ./install/igt_runner.sh
>> +  needs:
>> +    - debian/x86_64_test-gl
>> +    - testing:x86_64
>> +    - igt:x86_64
>> diff --git a/drivers/gpu/drm/ci/x86_64.config 
>> b/drivers/gpu/drm/ci/x86_64.config
>> index 1cbd49a5b23a..8eaba388b141 100644
>> --- a/drivers/gpu/drm/ci/x86_64.config
>> +++ b/drivers/gpu/drm/ci/x86_64.config
>> @@ -24,6 +24,7 @@ CONFIG_DRM=y
>>   CONFIG_DRM_PANEL_SIMPLE=y
>>   CONFIG_PWM_CROS_EC=y
>>   CONFIG_BACKLIGHT_PWM=y
>> +CONFIG_DRM_VKMS=m
>>   # Strip out some stuff we don't need for graphics testing, to reduce
>>   # the build.
>> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
>> new file mode 100644
>> index 000000000000..691c383b21a0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
>> @@ -0,0 +1,57 @@
>> +core_hotunplug@hotrebind,Fail
>> +core_hotunplug@hotrebind-lateclose,Fail
>> +core_hotunplug@hotreplug,Fail
>> +core_hotunplug@hotreplug-lateclose,Fail
>> +core_hotunplug@hotunbind-rebind,Fail
>> +core_hotunplug@hotunplug-rescan,Fail
>> +core_hotunplug@unbind-rebind,Fail
>> +core_hotunplug@unplug-rescan,Fail
>> +device_reset@cold-reset-bound,Fail
>> +device_reset@reset-bound,Fail
>> +device_reset@unbind-cold-reset-rebind,Fail
>> +device_reset@unbind-reset-rebind,Fail
>> +dumb_buffer@invalid-bpp,Fail
>> +kms_content_protection@atomic,Crash
>> +kms_content_protection@atomic-dpms,Crash
>> +kms_content_protection@content-type-change,Crash
>> +kms_content_protection@lic-type-0,Crash
>> +kms_content_protection@lic-type-1,Crash
>> +kms_content_protection@srm,Crash
>> +kms_content_protection@type1,Crash
>> +kms_content_protection@uevent,Crash
>> +kms_cursor_crc@cursor-rapid-movement-128x128,Fail
>> +kms_cursor_crc@cursor-rapid-movement-128x42,Fail
>> +kms_cursor_crc@cursor-rapid-movement-256x256,Fail
>> +kms_cursor_crc@cursor-rapid-movement-256x85,Fail
>> +kms_cursor_crc@cursor-rapid-movement-32x10,Fail
>> +kms_cursor_crc@cursor-rapid-movement-32x32,Fail
>> +kms_cursor_crc@cursor-rapid-movement-512x170,Fail
>> +kms_cursor_crc@cursor-rapid-movement-512x512,Fail
>> +kms_cursor_crc@cursor-rapid-movement-64x21,Fail
>> +kms_cursor_crc@cursor-rapid-movement-64x64,Fail
>> +kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
>> +kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
>> +kms_cursor_legacy@cursor-vs-flip-atomic,Fail
>> +kms_cursor_legacy@cursor-vs-flip-legacy,Fail
>> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>> +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>> +kms_cursor_legacy@flip-vs-cursor-atomic,Fail
>> +kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
>> +kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
>> +kms_cursor_legacy@flip-vs-cursor-legacy,Fail
>> +kms_flip@flip-vs-modeset-vs-hang,Fail
>> +kms_flip@flip-vs-panning-vs-hang,Fail
>> +kms_flip@flip-vs-suspend,Timeout
>> +kms_flip@flip-vs-suspend-interruptible,Timeout
>> +kms_flip@plain-flip-fb-recreate,Fail
>> +kms_lease@lease-uevent,Fail
>> +kms_pipe_crc_basic@nonblocking-crc,Fail
>> +kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
>> +kms_writeback@writeback-check-output,Fail
>> +kms_writeback@writeback-check-output-XRGB2101010,Fail
>> +kms_writeback@writeback-fb-id,Fail
>> +kms_writeback@writeback-fb-id-XRGB2101010,Fail
>> +kms_writeback@writeback-invalid-parameters,Fail
>> +kms_writeback@writeback-pixel-formats,Fail
>> +perf@i915-ref-count,Fail
>> +tools_test@tools_test,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt 
>> b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
>> new file mode 100644
>> index 000000000000..56484a30aff5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
>> @@ -0,0 +1,15 @@
>> +# Board Name: vkms
>> +# Bug Report: 
>> https://lore.kernel.org/dri-devel/61ed26af-062c-443c-9df2-d1ee319f3fb0@collabora.com/T/#u
>> +# Failure Rate: 50
>> +# IGT Version: 1.28-g0df7b9b97
>> +# Linux Version: 6.9.0-rc7
>> +kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic
>> +kms_flip@basic-flip-vs-wf_vblank
>> +kms_flip@flip-vs-expired-vblank-interruptible
>> +kms_flip@flip-vs-wf_vblank-interruptible
>> +kms_flip@plain-flip-fb-recreate-interruptible
>> +kms_flip@plain-flip-ts-check
>> +kms_flip@plain-flip-ts-check-interruptible
>> +kms_flip@flip-vs-absolute-wf_vblank
>> +kms_flip@flip-vs-absolute-wf_vblank-interruptible
>> +kms_flip@flip-vs-blocking-wf-vblank
>> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
>> new file mode 100644
>> index 000000000000..5a9093ddb613
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
>> @@ -0,0 +1,67 @@
>> +# keeps printing vkms_vblank_simulate: vblank timer overrun and never 
>> ends
>> +kms_invalid_mode@int-max-clock
>> +
>> +# Kernel panic
>> +kms_cursor_crc@cursor-rapid-movement-32x10
>> +# Oops: 0000 [#1] PREEMPT SMP NOPTI
>> +# CPU: 0 PID: 2635 Comm: kworker/u8:13 Not tainted 
>> 6.9.0-rc7-g40935263a1fd #1
>> +# Hardware name: ChromiumOS crosvm, BIOS 0
>> +# Workqueue: vkms_composer vkms_composer_worker [vkms]
>> +# RIP: 0010:compose_active_planes+0x1c7/0x4e0 [vkms]
>> +# Code: c9 0f 84 6a 01 00 00 8b 42 30 2b 42 28 41 39 c5 0f 8c 6f 01 
>> 00 00 49 83 c7 01 49 39 df 74 3b 4b 8b 34 fc 48 8b 96 48 01 00 00 <8b> 
>> 42 78 89 c1 83 e1 0a a8 20 74 b1 45 89 f5 41 f7 d5 44 03 6a 34
>> +# RSP: 0018:ffffbb4700c17d58 EFLAGS: 00010246
>> +# RAX: 0000000000000400 RBX: 0000000000000002 RCX: 0000000000000002
>> +# RDX: 0000000000000000 RSI: ffffa2ad0788c000 RDI: 00000000fff479a8
>> +# RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
>> +# R10: ffffa2ad0bb14000 R11: 0000000000000000 R12: ffffa2ad03e21700
>> +# R13: 0000000000000003 R14: 0000000000000004 R15: 0000000000000000
>> +# FS:  0000000000000000(0000) GS:ffffa2ad2bc00000(0000) 
>> knlGS:0000000000000000
>> +# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> +# CR2: 0000000000000078 CR3: 000000010bd30000 CR4: 0000000000350ef0
>> +# Call Trace:
>> +#  <TASK>
>> +#  ? __die+0x1e/0x60
>> +#  ? page_fault_oops+0x17b/0x490
>> +#  ? exc_page_fault+0x6d/0x230
>> +#  ? asm_exc_page_fault+0x26/0x30
>> +#  ? compose_active_planes+0x1c7/0x4e0 [vkms]
>> +#  ? compose_active_planes+0x2a3/0x4e0 [vkms]
>> +#  ? srso_return_thunk+0x5/0x5f
>> +#  vkms_composer_worker+0x205/0x240 [vkms]
>> +#  process_one_work+0x1f4/0x6b0
>> +#  ? lock_is_held_type+0x9e/0x110
>> +#  worker_thread+0x17e/0x350
>> +#  ? __pfx_worker_thread+0x10/0x10
>> +#  kthread+0xce/0x100
>> +#  ? __pfx_kthread+0x10/0x10
>> +#  ret_from_fork+0x2f/0x50
>> +#  ? __pfx_kthread+0x10/0x10
>> +#  ret_from_fork_asm+0x1a/0x30
>> +#  </TASK>
>> +# Modules linked in: vkms
>> +# CR2: 0000000000000078
>> +# ---[ end trace 0000000000000000 ]---
>> +# RIP: 0010:compose_active_planes+0x1c7/0x4e0 [vkms]
>> +# Code: c9 0f 84 6a 01 00 00 8b 42 30 2b 42 28 41 39 c5 0f 8c 6f 01 
>> 00 00 49 83 c7 01 49 39 df 74 3b 4b 8b 34 fc 48 8b 96 48 01 00 00 <8b> 
>> 42 78 89 c1 83 e1 0a a8 20 74 b1 45 89 f5 41 f7 d5 44 03 6a 34
>> +# RSP: 0018:ffffbb4700c17d58 EFLAGS: 00010246
>> +# RAX: 0000000000000400 RBX: 0000000000000002 RCX: 0000000000000002
>> +# RDX: 0000000000000000 RSI: ffffa2ad0788c000 RDI: 00000000fff479a8
>> +# RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
>> +# R10: ffffa2ad0bb14000 R11: 0000000000000000 R12: ffffa2ad03e21700
>> +# R13: 0000000000000003 R14: 0000000000000004 R15: 0000000000000000
>> +# FS:  0000000000000000(0000) GS:ffffa2ad2bc00000(0000) 
>> knlGS:0000000000000000
>> +# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> +xe_.*
