Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E519B894328
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 19:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2115210F313;
	Mon,  1 Apr 2024 17:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Od2BR8PC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC26410F313
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 17:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FmT/246q2v4RRcdH4pcSl1aosdjsTKWCAVsj0OC9Dks=; b=Od2BR8PCSY9h5KHAo5CL8wu6ZX
 FjTkf1FQdjKl4ym2ZbNe5X9hmzFiKhNgqJakJcv3NZC2aCi5LZGV0ED0hHLaHU9kvlTq5aq4KusJc
 EMBftNoxAwz6WCu+i6OJBBmDFK/RmrAW4rxTJstU9ObaNCaeMt851toFBVIAzxoaGOnAXrm3da5G1
 IHzDZSMTfCKJt+F9im9wEtnTq7AhYM6QNCTTKDerxtPX9XXQCWCuQZlyySk+o0S6iSXnQZC8YjjqT
 TIgFIvDtUVH0kNZSzNkFBcDWxIgclMqd//ogRRIv5IfoOdw3N/ND1LTic+YPTTU7vRB0QDg8zZ4iV
 xpxt3JDQ==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rrL15-0006D0-3m; Mon, 01 Apr 2024 19:00:15 +0200
Message-ID: <db70b74c-1b7c-463f-a783-a289caf59fa5@igalia.com>
Date: Mon, 1 Apr 2024 14:00:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] drm/ci: add tests on vkms
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, emma@anholt.net, robdclark@gmail.com,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, mairacanal@riseup.net,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
 <20240401061235.192713-11-vignesh.raman@collabora.com>
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
In-Reply-To: <20240401061235.192713-11-vignesh.raman@collabora.com>
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

On 4/1/24 03:12, Vignesh Raman wrote:
> Add job that runs igt on top of vkms.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Acked-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
> 
> v4:
>    - New patch in the series.
>      https://lore.kernel.org/lkml/20240201065346.801038-1-vignesh.raman@collabora.com/
> 
> v5:
>    - No changes.
> 
> ---
>   MAINTAINERS                                   |  2 ++
>   drivers/gpu/drm/ci/build.sh                   |  1 -
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  3 +-
>   drivers/gpu/drm/ci/igt_runner.sh              |  6 ++--
>   drivers/gpu/drm/ci/image-tags.yml             |  2 +-
>   drivers/gpu/drm/ci/test.yml                   | 24 +++++++++++++-
>   drivers/gpu/drm/ci/x86_64.config              |  1 +
>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  1 -
>   drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 33 +++++++++++++++++++
>   .../gpu/drm/ci/xfails/vkms-none-flakes.txt    | 20 +++++++++++
>   drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 23 +++++++++++++
>   11 files changed, 108 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 333704ceefb6..c78c825508ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6962,6 +6962,8 @@ L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/gpu/vkms.rst
> +F:	drivers/gpu/drm/ci/testlist.txt
> +F:	drivers/gpu/drm/ci/xfails/vkms*
>   F:	drivers/gpu/drm/vkms/
>   
>   DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 8a3baa003904..95493df9cdc2 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -156,7 +156,6 @@ fi
>   
>   mkdir -p artifacts/install/lib
>   mv install/* artifacts/install/.
> -rm -rf artifacts/install/modules
>   ln -s common artifacts/install/ci-common
>   cp .config artifacts/${CI_JOB_NAME}_config
>   
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 5b5d4a324659..df762d03533f 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -114,6 +114,7 @@ stages:
>     - panfrost
>     - powervr
>     - virtio-gpu
> +  - software-driver
>   
>   # YAML anchors for rule conditions
>   # --------------------------------
> @@ -269,4 +270,4 @@ sanity:
>   
>   # Jobs that need to pass before spending hardware resources on further testing
>   .required-for-hardware-jobs:
> -  needs: []
> \ No newline at end of file
> +  needs: []
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index ce6e22369d4d..c89acb974645 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -20,10 +20,10 @@ cat /sys/kernel/debug/dri/*/state
>   set -e
>   
>   case "$DRIVER_NAME" in
> -    amdgpu)
> +    amdgpu|vkms)
>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
> -        mv /install/modules/lib/modules/* /lib/modules/.
> -        modprobe amdgpu
> +        mv /install/modules/lib/modules/* /lib/modules/. || true
> +        modprobe --first-time $DRIVER_NAME
>           ;;
>   esac
>   
> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
> index cf07c3e09b8c..bf861ab8b9c2 100644
> --- a/drivers/gpu/drm/ci/image-tags.yml
> +++ b/drivers/gpu/drm/ci/image-tags.yml
> @@ -4,7 +4,7 @@ variables:
>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>   
>      DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
> -   DEBIAN_BUILD_TAG: "2023-10-08-config"
> +   DEBIAN_BUILD_TAG: "2024-01-29-vkms"
>   
>      KERNEL_ROOTFS_TAG: "2023-10-06-amd"
>      PKG_REPO_REV: "67f2c46b"
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 8c90ae5a51e6..8fed797a26b9 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -411,7 +411,7 @@ panfrost:g12b:
>       - .panfrost-gpu
>   
>   virtio_gpu:none:
> -  stage: virtio-gpu
> +  stage: software-driver
>     variables:
>       CROSVM_GALLIUM_DRIVER: llvmpipe
>       DRIVER_NAME: virtio_gpu
> @@ -431,3 +431,25 @@ virtio_gpu:none:
>       - debian/x86_64_test-gl
>       - testing:x86_64
>       - igt:x86_64
> +
> +vkms:none:
> +  stage: software-driver
> +  variables:
> +    DRIVER_NAME: vkms
> +    GPU_VERSION: none
> +  extends:
> +    - .test-gl
> +    - .test-rules
> +  tags:
> +    - kvm
> +  script:
> +    - ln -sf $CI_PROJECT_DIR/install /install
> +    - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p /lib/modules
> +    - mkdir -p $CI_PROJECT_DIR/results
> +    - ln -sf $CI_PROJECT_DIR/results /results
> +    - ./install/crosvm-runner.sh ./install/igt_runner.sh
> +  needs:
> +    - debian/x86_64_test-gl
> +    - testing:x86_64
> +    - igt:x86_64
> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> index 1cbd49a5b23a..8eaba388b141 100644
> --- a/drivers/gpu/drm/ci/x86_64.config
> +++ b/drivers/gpu/drm/ci/x86_64.config
> @@ -24,6 +24,7 @@ CONFIG_DRM=y
>   CONFIG_DRM_PANEL_SIMPLE=y
>   CONFIG_PWM_CROS_EC=y
>   CONFIG_BACKLIGHT_PWM=y
> +CONFIG_DRM_VKMS=m
>   
>   # Strip out some stuff we don't need for graphics testing, to reduce
>   # the build.
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> index 007f21e56d89..f82d437909b5 100644
> --- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> @@ -41,7 +41,6 @@ kms_flip@flip-vs-absolute-wf_vblank,Fail
>   kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
>   kms_flip@flip-vs-blocking-wf-vblank,Fail
>   kms_flip@flip-vs-expired-vblank,Fail
> -kms_flip@flip-vs-expired-vblank-interruptible,Fail
>   kms_flip@flip-vs-modeset-vs-hang,Fail
>   kms_flip@flip-vs-panning-vs-hang,Fail
>   kms_flip@flip-vs-wf_vblank-interruptible,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
> new file mode 100644
> index 000000000000..ef6101d2c356
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
> @@ -0,0 +1,33 @@
> +kms_cursor_crc@cursor-rapid-movement-128x128,Fail
> +kms_cursor_crc@cursor-rapid-movement-128x42,Fail
> +kms_cursor_crc@cursor-rapid-movement-256x256,Fail
> +kms_cursor_crc@cursor-rapid-movement-256x85,Fail
> +kms_cursor_crc@cursor-rapid-movement-32x10,Fail
> +kms_cursor_crc@cursor-rapid-movement-32x32,Fail
> +kms_cursor_crc@cursor-rapid-movement-512x170,Fail
> +kms_cursor_crc@cursor-rapid-movement-512x512,Fail
> +kms_cursor_crc@cursor-rapid-movement-64x21,Fail
> +kms_cursor_crc@cursor-rapid-movement-64x64,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
> +kms_cursor_legacy@cursor-vs-flip-atomic,Fail
> +kms_cursor_legacy@cursor-vs-flip-legacy,Fail
> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_cursor_legacy@flip-vs-cursor-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
> +kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> +kms_flip@flip-vs-modeset-vs-hang,Fail
> +kms_flip@flip-vs-panning-vs-hang,Fail
> +kms_pipe_crc_basic@nonblocking-crc,Fail
> +kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
> +kms_pipe_crc_basic@suspend-read-crc,Fail
> +kms_plane@plane-panning-bottom-right-suspend,Fail
> +kms_universal_plane@universal-plane-pipe-A-sanity,Fail
> +kms_universal_plane@universal-plane-sanity,Fail
> +kms_vblank@pipe-A-ts-continuation-dpms-suspend,Fail
> +kms_writeback@writeback-check-output,Fail
> +kms_writeback@writeback-fb-id,Fail
> +kms_writeback@writeback-invalid-parameters,Fail
> +kms_writeback@writeback-pixel-formats,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> new file mode 100644
> index 000000000000..7b52dab45457
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> @@ -0,0 +1,20 @@
> +# Board Name: vkms
> +# Bug Report: https://lore.kernel.org/dri-devel/005da8f1-8050-bffd-653c-2a87ae6376f7@collabora.com/T/#u
> +# IGT Version: 1.28-gb0cc8160e
> +# Linux Version: 6.7.0-rc3
> +# Failure Rate: 50
> +
> +# Reported by deqp-runner
> +kms_cursor_legacy@cursorA-vs-flipA-legacy
> +kms_cursor_legacy@cursorA-vs-flipA-varying-size
> +kms_flip@flip-vs-expired-vblank-interruptible
> +kms_flip@flip-vs-expired-vblank
> +kms_flip@plain-flip-fb-recreate
> +kms_flip@plain-flip-fb-recreate-interruptible
> +kms_flip@plain-flip-ts-check-interruptible
> +
> +# The below test shows inconsistency across multiple runs,
> +# giving results of Pass and Fail alternately.
> +kms_cursor_legacy@cursorA-vs-flipA-toggle
> +kms_pipe_crc_basic@nonblocking-crc
> +kms_flip@plain-flip-ts-check
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> new file mode 100644
> index 000000000000..723de920dc37
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> @@ -0,0 +1,23 @@
> +# Hits:
> +# rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> +# rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P749/1:b..l
> +kms_prop_blob@invalid-get-prop
> +
> +# keeps printing vkms_vblank_simulate: vblank timer overrun and never ends
> +kms_invalid_mode@int-max-clock
> +
> +# Suspend seems to be broken
> +.*suspend.*
> +
> +# Hangs machine and timeout occurs
> +kms_flip@flip-vs-absolute-wf_vblank-interruptible
> +kms_invalid_mode@zero-hdisplay
> +kms_invalid_mode@bad-vtotal
> +kms_cursor_crc.*
> +
> +# Skip hw specific tests
> +msm_.*
> +amdgpu/amd_.*
> +panfrost_.*
> +v3d_.*
> +vc4_.*
