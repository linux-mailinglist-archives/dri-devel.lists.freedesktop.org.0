Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE167CFFE0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 18:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3328710E52E;
	Thu, 19 Oct 2023 16:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8E310E52E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 16:45:36 +0000 (UTC)
Received: from [192.168.0.206] (unknown [179.221.49.105])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 233226607342;
 Thu, 19 Oct 2023 17:45:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697733935;
 bh=nKQH3Gkw5+XpzFXirF7iL4/r+34oiBWAqlrHag0FYYs=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Rc6A/CRcWBSucq91Z/w+tgOHGs1/5C3pygiENgC50wOeEAv/qyf5s80ZJcmNsmvBF
 hc9swWqEd4AxCetXJSfdqTQ4ct3OxPhyeHtSDK7znHl3Gpj1XRjLlUFoc9AN1m2qFH
 VP7IJK7x77+Cd2zryUTIJYaSMjgBFhD9p+m94iCG7BeSxyZnKSDf9XhRJWuUkYRxla
 oPWJEt1MvpCekwOeAhaMGJnKjLGWukZkuuR1/HDHwIsCEUraYH/znoJfnDnYwXpK+i
 w7sMLdASSd0lW/J4zb8Ca1j+XWLvlQTqSGDLwk0FRDgIkf2qpgLvb8gKR9Y0NXX21n
 LOmH+cjuPdQJA==
Message-ID: <1b43d403-765c-411f-955f-1af04def4e9f@collabora.com>
Date: Thu, 19 Oct 2023 13:45:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] drm: ci: Update xfails
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
 <20231019070650.61159-10-vignesh.raman@collabora.com>
 <33b9f155-3c7c-408b-9863-54b451cb14f2@collabora.com>
In-Reply-To: <33b9f155-3c7c-408b-9863-54b451cb14f2@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, david.heidelberg@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 gustavo.padovan@collabora.com, linux-mediatek@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/10/2023 13:42, Helen Koike wrote:
> 
> 
> On 19/10/2023 04:06, Vignesh Raman wrote:
>> Update msm-apq8016-fails, mediatek-mt8173-fails and
>> virtio_gpu-none-fails to include the tests which fail.
>> Update mediatek-mt8173-flakes to include the tests which flakes.
>> Update virtio_gpu-none-skips to include the tests that need to be 
>> skipped.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - No changes
>>
>> v3:
>>    - No changes
>>
>> v4:
>>    - No changes
>>
>> v5:
>>    - Generate fails and flakes file with the updated xfails script - 
>> https://www.spinics.net/lists/kernel/msg4959630.html
>>
>> ---
>>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  24 +-
>>   .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   9 +
>>   .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  17 +-
>>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  65 +-
>>   .../drm/ci/xfails/virtio_gpu-none-skips.txt   | 632 +++++++++++++++++-
>>   5 files changed, 682 insertions(+), 65 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>>
>> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>> index 671916067dba..d2261a40db11 100644
>> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>> @@ -1,5 +1,7 @@
>> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013011
>> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1012894
>> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1012949
>>   kms_3d,Fail
>> -kms_addfb_basic@addfb25-bad-modifier,Fail
>>   kms_bw@linear-tiling-1-displays-1920x1080p,Fail
>>   kms_bw@linear-tiling-1-displays-2560x1440p,Fail
>>   kms_bw@linear-tiling-1-displays-3840x2160p,Fail
>> @@ -9,20 +11,22 @@ kms_bw@linear-tiling-2-displays-3840x2160p,Fail
>>   kms_bw@linear-tiling-3-displays-1920x1080p,Fail
>>   kms_bw@linear-tiling-3-displays-2560x1440p,Fail
>>   kms_bw@linear-tiling-3-displays-3840x2160p,Fail
>> -kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
>> -kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
>> -kms_force_connector_basic@force-connector-state,Fail
>> -kms_force_connector_basic@force-edid,Fail
>> -kms_force_connector_basic@force-load-detect,Fail
>> -kms_force_connector_basic@prune-stale-modes,Fail
>> +kms_color@invalid-gamma-lut-sizes,Fail
>> +kms_cursor_legacy@cursor-vs-flip-atomic,Fail
>> +kms_cursor_legacy@cursor-vs-flip-legacy,Fail
>> +kms_flip@flip-vs-modeset-vs-hang,Fail
>> +kms_flip@flip-vs-panning-vs-hang,Fail
>> +kms_flip@flip-vs-suspend,Fail
>> +kms_flip@flip-vs-suspend-interruptible,Fail
>> +kms_hdmi_inject@inject-4k,Fail
>>   kms_invalid_mode@int-max-clock,Fail
>> +kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20,Fail
>> +kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20,Fail
>> +kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20,Fail
>>   kms_plane_scaling@planes-upscale-20x20,Fail
>>   kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
>>   kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
>>   kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
>> -kms_plane_scaling@upscale-with-modifier-20x20,Fail
>> -kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
>> -kms_plane_scaling@upscale-with-rotation-20x20,Fail
>>   kms_properties@get_properties-sanity-atomic,Fail
>>   kms_properties@plane-properties-atomic,Fail
>>   kms_properties@plane-properties-legacy,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt 
>> b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>> new file mode 100644
>> index 000000000000..8b12e97d59f3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>> @@ -0,0 +1,9 @@
>> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013138
>> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1012894
>> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013011
>> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013055
>> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions
>> +kms_force_connector_basic@force-edid
>> +kms_force_connector_basic@prune-stale-modes
>> +kms_prop_blob@invalid-set-prop
>> +kms_prop_blob@invalid-set-prop-any
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> index 9981682feab2..dcc49d560cef 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> @@ -1,15 +1,8 @@
>> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1012932
>> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1012894
>>   kms_3d,Fail
>>   kms_addfb_basic@addfb25-bad-modifier,Fail
>> -kms_cursor_legacy@all-pipes-forked-bo,Fail
>> -kms_cursor_legacy@all-pipes-forked-move,Fail
>> -kms_cursor_legacy@all-pipes-single-bo,Fail
>> -kms_cursor_legacy@all-pipes-single-move,Fail
>> -kms_cursor_legacy@all-pipes-torture-bo,Fail
>> -kms_cursor_legacy@all-pipes-torture-move,Fail
>> -kms_cursor_legacy@pipe-A-forked-bo,Fail
>> -kms_cursor_legacy@pipe-A-forked-move,Fail
>> -kms_cursor_legacy@pipe-A-single-bo,Fail
>> -kms_cursor_legacy@pipe-A-single-move,Fail
>> -kms_cursor_legacy@pipe-A-torture-bo,Fail
>> -kms_cursor_legacy@pipe-A-torture-move,Fail
>> +kms_cursor_legacy@forked-bo,Fail
>> +kms_cursor_legacy@forked-move,Fail
>> +kms_force_connector_basic@force-edid,Fail
>>   kms_hdmi_inject@inject-4k,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
>> index 9586b2339f6f..4281bc25303f 100644
>> --- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
>> @@ -1,38 +1,27 @@
>> -kms_addfb_basic@addfb25-bad-modifier,Fail
>> -kms_addfb_basic@bad-pitch-65536,Fail
>> -kms_addfb_basic@bo-too-small,Fail
>> -kms_addfb_basic@size-max,Fail
>> -kms_addfb_basic@too-high,Fail
>> -kms_atomic_transition@plane-primary-toggle-with-vblank-wait,Fail
>> -kms_bw@linear-tiling-1-displays-1920x1080p,Fail
>> -kms_bw@linear-tiling-1-displays-2560x1440p,Fail
>> -kms_bw@linear-tiling-1-displays-3840x2160p,Fail
>> -kms_bw@linear-tiling-2-displays-1920x1080p,Fail
>> -kms_bw@linear-tiling-2-displays-2560x1440p,Fail
>> -kms_bw@linear-tiling-2-displays-3840x2160p,Fail
>> -kms_invalid_mode@int-max-clock,Fail
>> -kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
>> -kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
>> -kms_plane_scaling@planes-upscale-20x20,Fail
>> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
>> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
>> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
>> -kms_plane_scaling@upscale-with-modifier-20x20,Fail
>> -kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
>> -kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
>> -kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
>> -kms_plane_scaling@upscale-with-rotation-20x20,Fail
>> -kms_vblank@crtc-id,Fail
>> -kms_vblank@invalid,Fail
>> -kms_vblank@pipe-A-accuracy-idle,Fail
>> -kms_vblank@pipe-A-query-busy,Fail
>> -kms_vblank@pipe-A-query-forked,Fail
>> -kms_vblank@pipe-A-query-forked-busy,Fail
>> -kms_vblank@pipe-A-query-idle,Fail
>> -kms_vblank@pipe-A-ts-continuation-idle,Fail
>> -kms_vblank@pipe-A-ts-continuation-modeset,Fail
>> -kms_vblank@pipe-A-ts-continuation-suspend,Fail
>> -kms_vblank@pipe-A-wait-busy,Fail
>> -kms_vblank@pipe-A-wait-forked,Fail
>> -kms_vblank@pipe-A-wait-forked-busy,Fail
>> -kms_vblank@pipe-A-wait-idle,Fail
>> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013138
>> +kms_flip@absolute-wf_vblank,Fail
>> +kms_flip@absolute-wf_vblank-interruptible,Fail
>> +kms_flip@basic-flip-vs-wf_vblank,Fail
>> +kms_flip@blocking-absolute-wf_vblank,Fail
>> +kms_flip@blocking-absolute-wf_vblank-interruptible,Fail
>> +kms_flip@blocking-wf_vblank,Fail
>> +kms_flip@busy-flip,Fail
>> +kms_flip@dpms-vs-vblank-race,Fail
>> +kms_flip@dpms-vs-vblank-race-interruptible,Fail
>> +kms_flip@flip-vs-absolute-wf_vblank,Fail
>> +kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
>> +kms_flip@flip-vs-blocking-wf-vblank,Fail
>> +kms_flip@flip-vs-expired-vblank,Fail
>> +kms_flip@flip-vs-expired-vblank-interruptible,Fail
>> +kms_flip@flip-vs-modeset-vs-hang,Fail
>> +kms_flip@flip-vs-panning-vs-hang,Fail
>> +kms_flip@flip-vs-wf_vblank-interruptible,Fail
>> +kms_flip@modeset-vs-vblank-race,Fail
>> +kms_flip@modeset-vs-vblank-race-interruptible,Fail
>> +kms_flip@plain-flip-fb-recreate,Fail
>> +kms_flip@plain-flip-fb-recreate-interruptible,Fail
>> +kms_flip@plain-flip-ts-check,Fail
>> +kms_flip@plain-flip-ts-check-interruptible,Fail
>> +kms_flip@wf_vblank-ts-check,Fail
>> +kms_flip@wf_vblank-ts-check-interruptible,Fail
>> +kms_setmode@basic,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
>> index 78be18174012..e40bd2cac849 100644
>> --- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
>> @@ -1,6 +1,628 @@
>> -# Hits a "refcount_t: underflow; use-after-free" in 
>> virtio_gpu_fence_event_process
>> -# When run in a particular order with other tests
>> -kms_cursor_legacy.*
>> -
>>   # Job just hangs without any output
>> -kms_flip@flip-vs-suspend.*
>> \ No newline at end of file
>> +kms_flip@flip-vs-suspend.*
>> +
>> +# Some tests crashes with malloc error and IGT tests floods
>> +# the CI log with error messages and we end up with a warning message
>> +# Job's log exceeded limit of 4194304 bytes.
>> +# Job execution will continue but no more output will be collected.
>> +# Below is the error log:
>> +# malloc(): corrupted top size
>> +# Received signal SIGABRT.
>> +# Stack trace:
>> +#  #0 [fatal_sig_handler+0x17b]
>> +#  #1 [__sigaction+0x40]
>> +#  #2 [pthread_key_delete+0x14c]
>> +#  #3 [gsignal+0x12]
>> +#  #4 [abort+0xd3]
>> +#  #5 [__fsetlocking+0x290]
>> +#  #6 [timer_settime+0x37a]
>> +#  #7 [__default_morecore+0x1f1b]
>> +#  #8 [__libc_calloc+0x161]
>> +#  #9 [drmModeGetPlaneResources+0x44]
>> +#  #10 [igt_display_require+0x194]
>> +#  #11 [__igt_unique____real_main1356+0x93c]
>> +#  #12 [main+0x3f]
>> +#  #13 [__libc_init_first+0x8a]
>> +#  #14 [__libc_start_main+0x85]
>> +#  #15 [_start+0x21]
>> +# malloc(): corrupted top size
>> +# So skip these tests until the issue is fixed.
>> +drm_read@empty-block
>> +drm_read@empty-nonblock
>> +drm_read@fault-buffer
>> +drm_read@invalid-buffer
>> +drm_read@short-buffer-block
>> +drm_read@short-buffer-nonblock
>> +drm_read@short-buffer-wakeup
>> +kms_addfb_basic@addfb25-4-tiled
>> +kms_addfb_basic@addfb25-bad-modifier
>> +kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
>> +kms_addfb_basic@addfb25-modifier-no-flag
>> +kms_addfb_basic@addfb25-x-tiled-legacy
>> +kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
>> +kms_addfb_basic@addfb25-y-tiled-legacy
>> +kms_addfb_basic@addfb25-y-tiled-small-legacy
>> +kms_addfb_basic@addfb25-yf-tiled-legacy
>> +kms_addfb_basic@bad-pitch-0
>> +kms_addfb_basic@bad-pitch-1024
>> +kms_addfb_basic@bad-pitch-128
>> +kms_addfb_basic@bad-pitch-256
>> +kms_addfb_basic@bad-pitch-32
>> +kms_addfb_basic@bad-pitch-63
>> +kms_addfb_basic@bad-pitch-65536
>> +kms_addfb_basic@bad-pitch-999
>> +kms_addfb_basic@basic
>> +kms_addfb_basic@basic-x-tiled-legacy
>> +kms_addfb_basic@basic-y-tiled-legacy
>> +kms_addfb_basic@bo-too-small
>> +kms_addfb_basic@bo-too-small-due-to-tiling
>> +kms_addfb_basic@clobberred-modifier
>> +kms_addfb_basic@framebuffer-vs-set-tiling
>> +kms_addfb_basic@invalid-get-prop
>> +kms_addfb_basic@invalid-get-prop-any
>> +kms_addfb_basic@invalid-set-prop
>> +kms_addfb_basic@invalid-set-prop-any
>> +kms_addfb_basic@invalid-smem-bo-on-discrete
>> +kms_addfb_basic@legacy-format
>> +kms_addfb_basic@master-rmfb
>> +kms_addfb_basic@no-handle
>> +kms_addfb_basic@size-max
>> +kms_addfb_basic@small-bo
>> +kms_addfb_basic@tile-pitch-mismatch
>> +kms_addfb_basic@too-high
>> +kms_addfb_basic@too-wide
>> +kms_addfb_basic@unused-handle
>> +kms_addfb_basic@unused-modifier
>> +kms_addfb_basic@unused-offsets
>> +kms_addfb_basic@unused-pitches
>> +kms_async_flips@alternate-sync-async-flip
>> +kms_async_flips@async-flip-with-page-flip-events
>> +kms_async_flips@crc
>> +kms_async_flips@invalid-async-flip
>> +kms_async_flips@test-cursor
>> +kms_async_flips@test-time-stamp
>> +kms_atomic@atomic-invalid-params
>> +kms_atomic@atomic_plane_damage
>> +kms_atomic@crtc-invalid-params
>> +kms_atomic@crtc-invalid-params-fence
>> +kms_atomic@plane-cursor-legacy
>> +kms_atomic@plane-immutable-zpos
>> +kms_atomic@plane-invalid-params
>> +kms_atomic@plane-invalid-params-fence
>> +kms_atomic@plane-overlay-legacy
>> +kms_atomic@plane-primary-legacy
>> +kms_atomic@plane-primary-overlay-mutable-zpos
>> +kms_atomic@test-only
>> +kms_atomic_interruptible@atomic-setmode
>> +kms_atomic_interruptible@legacy-cursor
>> +kms_atomic_interruptible@legacy-dpms
>> +kms_atomic_interruptible@legacy-pageflip
>> +kms_atomic_interruptible@legacy-setmode
>> +kms_atomic_interruptible@universal-setplane-cursor
>> +kms_atomic_interruptible@universal-setplane-primary
>> +kms_atomic_transition@modeset-transition
>> +kms_atomic_transition@modeset-transition-fencing
>> +kms_atomic_transition@modeset-transition-nonblocking
>> +kms_atomic_transition@modeset-transition-nonblocking-fencing
>> +kms_atomic_transition@plane-all-modeset-transition
>> +kms_atomic_transition@plane-all-modeset-transition-fencing
>> +kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels
>> +kms_atomic_transition@plane-all-modeset-transition-internal-panels
>> +kms_atomic_transition@plane-all-transition
>> +kms_atomic_transition@plane-all-transition-fencing
>> +kms_atomic_transition@plane-all-transition-nonblocking
>> +kms_atomic_transition@plane-all-transition-nonblocking-fencing
>> +kms_atomic_transition@plane-primary-toggle-with-vblank-wait
>> +kms_atomic_transition@plane-toggle-modeset-transition
>> +kms_atomic_transition@plane-use-after-nonblocking-unbind
>> +kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing
>> +kms_bw@linear-tiling-1-displays-1920x1080p
>> +kms_bw@linear-tiling-1-displays-2560x1440p
>> +kms_bw@linear-tiling-1-displays-3840x2160p
>> +kms_bw@linear-tiling-2-displays-1920x1080p
>> +kms_bw@linear-tiling-2-displays-2560x1440p
>> +kms_bw@linear-tiling-2-displays-3840x2160p
>> +kms_bw@linear-tiling-3-displays-1920x1080p
>> +kms_bw@linear-tiling-3-displays-2560x1440p
>> +kms_bw@linear-tiling-3-displays-3840x2160p
>> +kms_bw@linear-tiling-4-displays-1920x1080p
>> +kms_bw@linear-tiling-4-displays-2560x1440p
>> +kms_bw@linear-tiling-4-displays-3840x2160p
>> +kms_bw@linear-tiling-5-displays-1920x1080p
>> +kms_bw@linear-tiling-5-displays-2560x1440p
>> +kms_bw@linear-tiling-5-displays-3840x2160p
>> +kms_bw@linear-tiling-6-displays-1920x1080p
>> +kms_bw@linear-tiling-6-displays-2560x1440p
>> +kms_bw@linear-tiling-6-displays-3840x2160p
>> +kms_bw@linear-tiling-7-displays-1920x1080p
>> +kms_bw@linear-tiling-7-displays-2560x1440p
>> +kms_bw@linear-tiling-7-displays-3840x2160p
>> +kms_bw@linear-tiling-8-displays-1920x1080p
>> +kms_bw@linear-tiling-8-displays-2560x1440p
>> +kms_bw@linear-tiling-8-displays-3840x2160p
>> +kms_color@ctm-0-25
>> +kms_color@ctm-0-50
>> +kms_color@ctm-0-75
>> +kms_color@ctm-blue-to-red
>> +kms_color@ctm-green-to-red
>> +kms_color@ctm-max
>> +kms_color@ctm-negative
>> +kms_color@ctm-red-to-blue
>> +kms_color@ctm-signed
>> +kms_color@deep-color
>> +kms_color@degamma
>> +kms_color@gamma
>> +kms_color@invalid-ctm-matrix-sizes
>> +kms_color@invalid-degamma-lut-sizes
>> +kms_color@invalid-gamma-lut-sizes
>> +kms_color@legacy-gamma
>> +kms_color@legacy-gamma-reset
>> +kms_concurrent@pipe-A
>> +kms_concurrent@pipe-B
>> +kms_concurrent@pipe-C
>> +kms_concurrent@pipe-D
>> +kms_concurrent@pipe-E
>> +kms_concurrent@pipe-F
>> +kms_concurrent@pipe-G
>> +kms_concurrent@pipe-H
>> +kms_content_protection@LIC
>> +kms_content_protection@atomic
>> +kms_content_protection@atomic-dpms
>> +kms_content_protection@content_type_change
>> +kms_content_protection@dp-mst-lic-type-0
>> +kms_content_protection@dp-mst-lic-type-1
>> +kms_content_protection@dp-mst-type-0
>> +kms_content_protection@dp-mst-type-1
>> +kms_content_protection@legacy
>> +kms_content_protection@mei_interface
>> +kms_content_protection@srm
>> +kms_content_protection@type1
>> +kms_content_protection@uevent
>> +kms_cursor_crc@cursor-alpha-opaque
>> +kms_cursor_crc@cursor-alpha-transparent
>> +kms_cursor_crc@cursor-dpms
>> +kms_cursor_crc@cursor-offscreen-128x128
>> +kms_cursor_crc@cursor-offscreen-128x42
>> +kms_cursor_crc@cursor-offscreen-256x256
>> +kms_cursor_crc@cursor-offscreen-256x85
>> +kms_cursor_crc@cursor-offscreen-32x10
>> +kms_cursor_crc@cursor-offscreen-32x32
>> +kms_cursor_crc@cursor-offscreen-512x170
>> +kms_cursor_crc@cursor-offscreen-512x512
>> +kms_cursor_crc@cursor-offscreen-64x21
>> +kms_cursor_crc@cursor-offscreen-64x64
>> +kms_cursor_crc@cursor-offscreen-max-size
>> +kms_cursor_crc@cursor-onscreen-128x128
>> +kms_cursor_crc@cursor-onscreen-128x42
>> +kms_cursor_crc@cursor-onscreen-256x256
>> +kms_cursor_crc@cursor-onscreen-256x85
>> +kms_cursor_crc@cursor-onscreen-32x10
>> +kms_cursor_crc@cursor-onscreen-32x32
>> +kms_cursor_crc@cursor-onscreen-512x170
>> +kms_cursor_crc@cursor-onscreen-512x512
>> +kms_cursor_crc@cursor-onscreen-64x21
>> +kms_cursor_crc@cursor-onscreen-64x64
>> +kms_cursor_crc@cursor-onscreen-max-size
>> +kms_cursor_crc@cursor-random-128x128
>> +kms_cursor_crc@cursor-random-128x42
>> +kms_cursor_crc@cursor-random-256x256
>> +kms_cursor_crc@cursor-random-256x85
>> +kms_cursor_crc@cursor-random-32x10
>> +kms_cursor_crc@cursor-random-32x32
>> +kms_cursor_crc@cursor-random-512x170
>> +kms_cursor_crc@cursor-random-512x512
>> +kms_cursor_crc@cursor-random-64x21
>> +kms_cursor_crc@cursor-random-64x64
>> +kms_cursor_crc@cursor-random-max-size
>> +kms_cursor_crc@cursor-rapid-movement-128x128
>> +kms_cursor_crc@cursor-rapid-movement-128x42
>> +kms_cursor_crc@cursor-rapid-movement-256x256
>> +kms_cursor_crc@cursor-rapid-movement-256x85
>> +kms_cursor_crc@cursor-rapid-movement-32x10
>> +kms_cursor_crc@cursor-rapid-movement-32x32
>> +kms_cursor_crc@cursor-rapid-movement-512x170
>> +kms_cursor_crc@cursor-rapid-movement-512x512
>> +kms_cursor_crc@cursor-rapid-movement-64x21
>> +kms_cursor_crc@cursor-rapid-movement-64x64
>> +kms_cursor_crc@cursor-rapid-movement-max-size
>> +kms_cursor_crc@cursor-size-change
>> +kms_cursor_crc@cursor-sliding-128x128
>> +kms_cursor_crc@cursor-sliding-128x42
>> +kms_cursor_crc@cursor-sliding-256x256
>> +kms_cursor_crc@cursor-sliding-256x85
>> +kms_cursor_crc@cursor-sliding-32x10
>> +kms_cursor_crc@cursor-sliding-32x32
>> +kms_cursor_crc@cursor-sliding-512x170
>> +kms_cursor_crc@cursor-sliding-512x512
>> +kms_cursor_crc@cursor-sliding-64x21
>> +kms_cursor_crc@cursor-sliding-64x64
>> +kms_cursor_crc@cursor-sliding-max-size
>> +kms_cursor_crc@cursor-suspend
>> +kms_cursor_legacy@2x-cursor-vs-flip-atomic
>> +kms_cursor_legacy@2x-cursor-vs-flip-legacy
>> +kms_cursor_legacy@2x-flip-vs-cursor-atomic
>> +kms_cursor_legacy@2x-flip-vs-cursor-legacy
>> +kms_cursor_legacy@2x-long-cursor-vs-flip-atomic
>> +kms_cursor_legacy@2x-long-cursor-vs-flip-legacy
>> +kms_cursor_legacy@2x-long-flip-vs-cursor-atomic
>> +kms_cursor_legacy@2x-long-flip-vs-cursor-legacy
>> +kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic
>> +kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic
>> +kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
>> +kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
>> +kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size
>> +kms_cursor_legacy@basic-flip-after-cursor-atomic
>> +kms_cursor_legacy@basic-flip-after-cursor-legacy
>> +kms_cursor_legacy@basic-flip-after-cursor-varying-size
>> +kms_cursor_legacy@basic-flip-before-cursor-atomic
>> +kms_cursor_legacy@basic-flip-before-cursor-legacy
>> +kms_cursor_legacy@basic-flip-before-cursor-varying-size
>> +kms_cursor_legacy@cursor-vs-flip-atomic
>> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions
>> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size
>> +kms_cursor_legacy@cursor-vs-flip-legacy
>> +kms_cursor_legacy@cursor-vs-flip-toggle
>> +kms_cursor_legacy@cursor-vs-flip-varying-size
>> +kms_cursor_legacy@cursorA-vs-flipA-atomic
>> +kms_cursor_legacy@cursorA-vs-flipA-atomic-transitions
>> +kms_cursor_legacy@cursorA-vs-flipA-atomic-transitions-varying-size
>> +kms_cursor_legacy@cursorA-vs-flipA-legacy
>> +kms_cursor_legacy@cursorA-vs-flipA-toggle
>> +kms_cursor_legacy@cursorA-vs-flipA-varying-size
>> +kms_cursor_legacy@cursorA-vs-flipB-atomic
>> +kms_cursor_legacy@cursorA-vs-flipB-atomic-transitions
>> +kms_cursor_legacy@cursorA-vs-flipB-atomic-transitions-varying-size
>> +kms_cursor_legacy@cursorA-vs-flipB-legacy
>> +kms_cursor_legacy@cursorA-vs-flipB-toggle
>> +kms_cursor_legacy@cursorA-vs-flipB-varying-size
>> +kms_cursor_legacy@cursorB-vs-flipA-atomic
>> +kms_cursor_legacy@cursorB-vs-flipA-atomic-transitions
>> +kms_cursor_legacy@cursorB-vs-flipA-atomic-transitions-varying-size
>> +kms_cursor_legacy@cursorB-vs-flipA-legacy
>> +kms_cursor_legacy@cursorB-vs-flipA-toggle
>> +kms_cursor_legacy@cursorB-vs-flipA-varying-size
>> +kms_cursor_legacy@cursorB-vs-flipB-atomic
>> +kms_cursor_legacy@cursorB-vs-flipB-atomic-transitions
>> +kms_cursor_legacy@cursorB-vs-flipB-atomic-transitions-varying-size
>> +kms_cursor_legacy@cursorB-vs-flipB-legacy
>> +kms_cursor_legacy@cursorB-vs-flipB-toggle
>> +kms_cursor_legacy@cursorB-vs-flipB-varying-size
>> +kms_cursor_legacy@flip-vs-cursor-atomic
>> +kms_cursor_legacy@flip-vs-cursor-atomic-transitions
>> +kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
>> +kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic
>> +kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy
>> +kms_cursor_legacy@flip-vs-cursor-crc-atomic
>> +kms_cursor_legacy@flip-vs-cursor-crc-legacy
>> +kms_cursor_legacy@flip-vs-cursor-legacy
>> +kms_cursor_legacy@flip-vs-cursor-toggle
>> +kms_cursor_legacy@flip-vs-cursor-varying-size
>> +kms_cursor_legacy@forked-bo
>> +kms_cursor_legacy@forked-move
>> +kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic
>> +kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic
>> +kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions
>> +kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size
>> +kms_cursor_legacy@short-busy-flip-before-cursor-toggle
>> +kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
>> +kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
>> +kms_cursor_legacy@short-flip-after-cursor-toggle
>> +kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
>> +kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
>> +kms_cursor_legacy@short-flip-before-cursor-toggle
>> +kms_cursor_legacy@single-bo
>> +kms_cursor_legacy@single-move
>> +kms_cursor_legacy@torture-bo
>> +kms_cursor_legacy@torture-move
>> +kms_dither@FB-8BPC-Vs-Panel-6BPC
>> +kms_dither@FB-8BPC-Vs-Panel-8BPC
>> +kms_flip_event_leak@basic
>> +kms_getfb@getfb-handle-not-fb
>> +kms_getfb@getfb2-handle-not-fb
>> +kms_hdr@bpc-switch
>> +kms_hdr@bpc-switch-dpms
>> +kms_hdr@bpc-switch-suspend
>> +kms_hdr@invalid-hdr
>> +kms_hdr@invalid-metadata-sizes
>> +kms_hdr@static-swap
>> +kms_hdr@static-toggle
>> +kms_hdr@static-toggle-dpms
>> +kms_hdr@static-toggle-suspend
>> +kms_invalid_mode@bad-hsync-end
>> +kms_invalid_mode@bad-hsync-start
>> +kms_invalid_mode@bad-htotal
>> +kms_invalid_mode@bad-vsync-end
>> +kms_invalid_mode@bad-vsync-start
>> +kms_invalid_mode@bad-vtotal
>> +kms_invalid_mode@clock-too-high
>> +kms_invalid_mode@int-max-clock
>> +kms_invalid_mode@uint-max-clock
>> +kms_invalid_mode@zero-clock
>> +kms_invalid_mode@zero-hdisplay
>> +kms_invalid_mode@zero-vdisplay
>> +kms_panel_fitting@atomic-fastset
>> +kms_panel_fitting@legacy
>> +kms_plane_cursor@overlay
>> +kms_plane_cursor@primary
>> +kms_plane_cursor@viewport
>> +kms_plane_scaling@2x-scaler-multi-pipe
>> +kms_plane_scaling@intel-max-src-size
>> +kms_plane_scaling@invalid-num-scalers
>> +kms_plane_scaling@invalid-parameters
>> +kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25
>> +kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5
>> +kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75
>> +kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25
>> +kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5
>> +kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75
>> +kms_plane_scaling@plane-downscale-with-rotation-factor-0-25
>> +kms_plane_scaling@plane-downscale-with-rotation-factor-0-5
>> +kms_plane_scaling@plane-downscale-with-rotation-factor-0-75
>> +kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers
>> +kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats
>> +kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation
>> +kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling
>> +kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling
>> +kms_plane_scaling@plane-scaler-with-rotation-unity-scaling
>> +kms_plane_scaling@plane-upscale-with-modifiers-20x20
>> +kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25
>> +kms_plane_scaling@plane-upscale-with-pixel-format-20x20
>> +kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25
>> +kms_plane_scaling@plane-upscale-with-rotation-20x20
>> +kms_plane_scaling@plane-upscale-with-rotation-factor-0-25
>> +kms_plane_scaling@planes-downscale-factor-0-25
>> +kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling
>> +kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20
>> +kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25
>> +kms_plane_scaling@planes-downscale-factor-0-5
>> +kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling
>> +kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20
>> +kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25
>> +kms_plane_scaling@planes-downscale-factor-0-75
>> +kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling
>> +kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20
>> +kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25
>> +kms_plane_scaling@planes-scaler-unity-scaling
>> +kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25
>> +kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5
>> +kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75
>> +kms_plane_scaling@planes-upscale-20x20
>> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25
>> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
>> +kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75
>> +kms_plane_scaling@planes-upscale-factor-0-25
>> +kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25
>> +kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5
>> +kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75
>> +kms_prime@D3hot
>> +kms_prime@basic-crc-hybrid
>> +kms_prime@basic-crc-vgem
>> +kms_prime@basic-modeset-hybrid
>> +kms_properties@connector-properties-atomic
>> +kms_properties@connector-properties-legacy
>> +kms_properties@crtc-properties-atomic
>> +kms_properties@crtc-properties-legacy
>> +kms_properties@get_properties-sanity-atomic
>> +kms_properties@get_properties-sanity-non-atomic
>> +kms_properties@invalid-properties-atomic
>> +kms_properties@invalid-properties-legacy
>> +kms_properties@plane-properties-atomic
>> +kms_properties@plane-properties-legacy
>> +kms_rmfb@close-fd
>> +kms_rmfb@rmfb-ioctl
>> +kms_scaling_modes@scaling-mode-center
>> +kms_scaling_modes@scaling-mode-full
>> +kms_scaling_modes@scaling-mode-full-aspect
>> +kms_scaling_modes@scaling-mode-none
>> +kms_tiled_display@basic-test-pattern
>> +kms_tiled_display@basic-test-pattern-with-chamelium
>> +kms_vblank@crtc-id
>> +kms_vblank@invalid
>> +kms_vblank@pipe-A-accuracy-idle
>> +kms_vblank@pipe-A-query-busy
>> +kms_vblank@pipe-A-query-busy-hang
>> +kms_vblank@pipe-A-query-forked
>> +kms_vblank@pipe-A-query-forked-busy
>> +kms_vblank@pipe-A-query-forked-busy-hang
>> +kms_vblank@pipe-A-query-forked-hang
>> +kms_vblank@pipe-A-query-idle
>> +kms_vblank@pipe-A-query-idle-hang
>> +kms_vblank@pipe-A-ts-continuation-dpms-rpm
>> +kms_vblank@pipe-A-ts-continuation-dpms-suspend
>> +kms_vblank@pipe-A-ts-continuation-idle
>> +kms_vblank@pipe-A-ts-continuation-idle-hang
>> +kms_vblank@pipe-A-ts-continuation-modeset
>> +kms_vblank@pipe-A-ts-continuation-modeset-hang
>> +kms_vblank@pipe-A-ts-continuation-modeset-rpm
>> +kms_vblank@pipe-A-ts-continuation-suspend
>> +kms_vblank@pipe-A-wait-busy
>> +kms_vblank@pipe-A-wait-busy-hang
>> +kms_vblank@pipe-A-wait-forked
>> +kms_vblank@pipe-A-wait-forked-busy
>> +kms_vblank@pipe-A-wait-forked-busy-hang
>> +kms_vblank@pipe-A-wait-forked-hang
>> +kms_vblank@pipe-A-wait-idle
>> +kms_vblank@pipe-A-wait-idle-hang
>> +kms_vblank@pipe-B-accuracy-idle
>> +kms_vblank@pipe-B-query-busy
>> +kms_vblank@pipe-B-query-busy-hang
>> +kms_vblank@pipe-B-query-forked
>> +kms_vblank@pipe-B-query-forked-busy
>> +kms_vblank@pipe-B-query-forked-busy-hang
>> +kms_vblank@pipe-B-query-forked-hang
>> +kms_vblank@pipe-B-query-idle
>> +kms_vblank@pipe-B-query-idle-hang
>> +kms_vblank@pipe-B-ts-continuation-dpms-rpm
>> +kms_vblank@pipe-B-ts-continuation-dpms-suspend
>> +kms_vblank@pipe-B-ts-continuation-idle
>> +kms_vblank@pipe-B-ts-continuation-idle-hang
>> +kms_vblank@pipe-B-ts-continuation-modeset
>> +kms_vblank@pipe-B-ts-continuation-modeset-hang
>> +kms_vblank@pipe-B-ts-continuation-modeset-rpm
>> +kms_vblank@pipe-B-ts-continuation-suspend
>> +kms_vblank@pipe-B-wait-busy
>> +kms_vblank@pipe-B-wait-busy-hang
>> +kms_vblank@pipe-B-wait-forked
>> +kms_vblank@pipe-B-wait-forked-busy
>> +kms_vblank@pipe-B-wait-forked-busy-hang
>> +kms_vblank@pipe-B-wait-forked-hang
>> +kms_vblank@pipe-B-wait-idle
>> +kms_vblank@pipe-B-wait-idle-hang
>> +kms_vblank@pipe-C-accuracy-idle
>> +kms_vblank@pipe-C-query-idle
>> +kms_vblank@pipe-C-query-busy
>> +kms_vblank@pipe-C-query-busy-hang
>> +kms_vblank@pipe-C-query-forked
>> +kms_vblank@pipe-C-query-forked-busy
>> +kms_vblank@pipe-C-query-forked-busy-hang
>> +kms_vblank@pipe-C-query-forked-hang
>> +kms_vblank@pipe-C-ts-continuation-dpms-rpm
>> +kms_vblank@pipe-C-ts-continuation-dpms-suspend
>> +kms_vblank@pipe-C-ts-continuation-idle
>> +kms_vblank@pipe-C-ts-continuation-idle-hang
>> +kms_vblank@pipe-C-ts-continuation-modeset
>> +kms_vblank@pipe-C-ts-continuation-modeset-hang
>> +kms_vblank@pipe-C-ts-continuation-modeset-rpm
>> +kms_vblank@pipe-C-ts-continuation-suspend
>> +kms_vblank@pipe-C-wait-busy
>> +kms_vblank@pipe-C-wait-busy-hang
>> +kms_vblank@pipe-C-wait-forked
>> +kms_vblank@pipe-C-wait-forked-busy
>> +kms_vblank@pipe-C-wait-forked-busy-hang
>> +kms_vblank@pipe-C-wait-forked-hang
>> +kms_vblank@pipe-C-wait-idle
>> +kms_vblank@pipe-C-wait-idle-hang
>> +kms_vblank@pipe-D-accuracy-idle
>> +kms_vblank@pipe-D-query-busy
>> +kms_vblank@pipe-D-query-busy-hang
>> +kms_vblank@pipe-D-query-forked
>> +kms_vblank@pipe-D-query-forked-busy
>> +kms_vblank@pipe-D-query-forked-busy-hang
>> +kms_vblank@pipe-D-query-forked-hang
>> +kms_vblank@pipe-D-query-idle
>> +kms_vblank@pipe-D-query-idle-hang
>> +kms_vblank@pipe-D-ts-continuation-dpms-rpm
>> +kms_vblank@pipe-D-ts-continuation-dpms-suspend
>> +kms_vblank@pipe-D-ts-continuation-idle
>> +kms_vblank@pipe-D-ts-continuation-idle-hang
>> +kms_vblank@pipe-D-ts-continuation-modeset
>> +kms_vblank@pipe-D-ts-continuation-modeset-hang
>> +kms_vblank@pipe-D-ts-continuation-modeset-rpm
>> +kms_vblank@pipe-D-ts-continuation-suspend
>> +kms_vblank@pipe-D-wait-busy
>> +kms_vblank@pipe-D-wait-busy-hang
>> +kms_vblank@pipe-D-wait-forked
>> +kms_vblank@pipe-D-wait-forked-busy
>> +kms_vblank@pipe-D-wait-forked-busy-hang
>> +kms_vblank@pipe-D-wait-forked-hang
>> +kms_vblank@pipe-D-wait-idle
>> +kms_vblank@pipe-D-wait-idle-hang
>> +kms_vblank@pipe-E-accuracy-idle
>> +kms_vblank@pipe-E-query-busy
>> +kms_vblank@pipe-E-query-busy-hang
>> +kms_vblank@pipe-E-query-forked
>> +kms_vblank@pipe-E-query-forked-busy
>> +kms_vblank@pipe-E-query-forked-busy-hang
>> +kms_vblank@pipe-E-query-forked-hang
>> +kms_vblank@pipe-E-query-idle
>> +kms_vblank@pipe-E-query-idle-hang
>> +kms_vblank@pipe-E-ts-continuation-dpms-rpm
>> +kms_vblank@pipe-E-ts-continuation-dpms-suspend
>> +kms_vblank@pipe-E-ts-continuation-idle
>> +kms_vblank@pipe-E-ts-continuation-idle-hang
>> +kms_vblank@pipe-E-ts-continuation-modeset
>> +kms_vblank@pipe-E-ts-continuation-modeset-hang
>> +kms_vblank@pipe-E-ts-continuation-modeset-rpm
>> +kms_vblank@pipe-E-ts-continuation-suspend
>> +kms_vblank@pipe-E-wait-busy
>> +kms_vblank@pipe-E-wait-busy-hang
>> +kms_vblank@pipe-E-wait-forked
>> +kms_vblank@pipe-E-wait-forked-busy
>> +kms_vblank@pipe-E-wait-forked-busy-hang
>> +kms_vblank@pipe-E-wait-forked-hang
>> +kms_vblank@pipe-E-wait-idle
>> +kms_vblank@pipe-E-wait-idle-hang
>> +kms_vblank@pipe-F-accuracy-idle
>> +kms_vblank@pipe-F-query-busy
>> +kms_vblank@pipe-F-query-busy-hang
>> +kms_vblank@pipe-F-query-forked
>> +kms_vblank@pipe-F-query-forked-busy
>> +kms_vblank@pipe-F-query-forked-busy-hang
>> +kms_vblank@pipe-F-query-forked-hang
>> +kms_vblank@pipe-F-query-idle
>> +kms_vblank@pipe-F-query-idle-hang
>> +kms_vblank@pipe-F-ts-continuation-dpms-rpm
>> +kms_vblank@pipe-F-ts-continuation-dpms-suspend
>> +kms_vblank@pipe-F-ts-continuation-idle
>> +kms_vblank@pipe-F-ts-continuation-idle-hang
>> +kms_vblank@pipe-F-ts-continuation-modeset
>> +kms_vblank@pipe-F-ts-continuation-modeset-hang
>> +kms_vblank@pipe-F-ts-continuation-modeset-rpm
>> +kms_vblank@pipe-F-ts-continuation-suspend
>> +kms_vblank@pipe-F-wait-busy
>> +kms_vblank@pipe-F-wait-busy-hang
>> +kms_vblank@pipe-F-wait-forked
>> +kms_vblank@pipe-F-wait-forked-busy
>> +kms_vblank@pipe-F-wait-forked-busy-hang
>> +kms_vblank@pipe-F-wait-forked-hang
>> +kms_vblank@pipe-F-wait-idle
>> +kms_vblank@pipe-F-wait-idle-hang
>> +kms_vblank@pipe-G-accuracy-idle
>> +kms_vblank@pipe-G-query-busy
>> +kms_vblank@pipe-G-query-busy-hang
>> +kms_vblank@pipe-G-query-forked
>> +kms_vblank@pipe-G-query-forked-busy
>> +kms_vblank@pipe-G-query-forked-busy-hang
>> +kms_vblank@pipe-G-query-forked-hang
>> +kms_vblank@pipe-G-query-idle
>> +kms_vblank@pipe-G-query-idle-hang
>> +kms_vblank@pipe-G-ts-continuation-dpms-rpm
>> +kms_vblank@pipe-G-ts-continuation-dpms-suspend
>> +kms_vblank@pipe-G-ts-continuation-idle
>> +kms_vblank@pipe-G-ts-continuation-idle-hang
>> +kms_vblank@pipe-G-ts-continuation-modeset
>> +kms_vblank@pipe-G-ts-continuation-modeset-hang
>> +kms_vblank@pipe-G-ts-continuation-modeset-rpm
>> +kms_vblank@pipe-G-ts-continuation-suspend
>> +kms_vblank@pipe-G-wait-busy
>> +kms_vblank@pipe-G-wait-busy-hang
>> +kms_vblank@pipe-G-wait-forked
>> +kms_vblank@pipe-G-wait-forked-busy
>> +kms_vblank@pipe-G-wait-forked-busy-hang
>> +kms_vblank@pipe-G-wait-forked-hang
>> +kms_vblank@pipe-G-wait-idle
>> +kms_vblank@pipe-G-wait-idle-hang
>> +kms_vblank@pipe-H-accuracy-idle
>> +kms_vblank@pipe-H-query-busy
>> +kms_vblank@pipe-H-query-busy-hang
>> +kms_vblank@pipe-H-query-forked
>> +kms_vblank@pipe-H-query-forked-busy
>> +kms_vblank@pipe-H-query-forked-busy-hang
>> +kms_vblank@pipe-H-query-forked-hang
>> +kms_vblank@pipe-H-query-idle
>> +kms_vblank@pipe-H-query-idle-hang
>> +kms_vblank@pipe-H-ts-continuation-dpms-rpm
>> +kms_vblank@pipe-H-ts-continuation-dpms-suspend
>> +kms_vblank@pipe-H-ts-continuation-idle
>> +kms_vblank@pipe-H-ts-continuation-idle-hang
>> +kms_vblank@pipe-H-ts-continuation-modeset
>> +kms_vblank@pipe-H-ts-continuation-modeset-hang
>> +kms_vblank@pipe-H-ts-continuation-modeset-rpm
>> +kms_vblank@pipe-H-ts-continuation-suspend
>> +kms_vblank@pipe-H-wait-busy
>> +kms_vblank@pipe-H-wait-busy-hang
>> +kms_vblank@pipe-H-wait-forked
>> +kms_vblank@pipe-H-wait-forked-busy
>> +kms_vblank@pipe-H-wait-forked-busy-hang
>> +kms_vblank@pipe-H-wait-forked-hang
>> +kms_vblank@pipe-H-wait-idle
>> +kms_vblank@pipe-H-wait-idle-hang
>> +kms_vrr@flip-basic
>> +kms_vrr@flip-dpms
>> +kms_vrr@flip-suspend
>> +kms_vrr@flipline
>> +kms_vrr@negative-basic
>> +kms_writeback@writeback-check-output
>> +kms_writeback@writeback-fb-id
>> +kms_writeback@writeback-invalid-parameters
>> +kms_writeback@writeback-pixel-formats
> 
> I wonder if we could just do
> 
> drm_read.*
> kms_addfb_basic.*
> kms_atomic.*
> kms_bw.*
> kms_color.*
> kms_concurrent.*
> kms_content_protection.*
> kms_cursor_crc.*
> kms_cursor_legacy.*
> 
> ... (and so on)
> 
> to simplify this list (in case most of the tests with that prefix are 
> provoking that issue).
> 
> Regards,
> Helen

Sorry, I just saw Daniel's reply about Valgrind, agreed there (so just 
ignore my comment above).

Regards,
Helen
