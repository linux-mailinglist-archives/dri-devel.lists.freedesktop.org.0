Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7603AFFFA1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1303A10E8AC;
	Thu, 10 Jul 2025 10:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XuviOK6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C509E10E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752144574;
 bh=6eCyQRGUL84zvCp0r/7JvZNwmMn+HX4Mb1TJDE3F9Wg=;
 h=Date:To:Cc:From:Subject:From;
 b=XuviOK6SBd2NvqMbB2L6+gu9vU3NmambBlBUx0FGqVrbYsdYcqmU28Pr3MWUO6R3o
 6Oir2TVfotwjcaQLnNCHkMoPa8smRsz1gjumj/H1DUYXG0oFP0S1GhSfiLKCMnZ3cc
 aJ9uONWY7gPE52f3OR5+zsRrN4s36z+FVorr2LWvtcATAy4Fq6ScnF/9Jcil2HBYog
 qbCqW601yIBf4IxJmHfxl3avVAhBnVUOeMdEnvuH5rdB3NpH7eZCSvVaMCLUyoQWio
 ti5fU/6NJ/ZOV6WaZubJM0cJaXtnu6x9FaNfLoQMBn80BUehK2XOsroFQlV1WkU9sz
 aoF9r2NETeH7A==
Received: from [192.168.50.250] (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5501717E0489;
 Thu, 10 Jul 2025 12:49:31 +0200 (CEST)
Message-ID: <59724e10-12ca-4481-b0e4-72d7b6e4dae0@collabora.com>
Date: Thu, 10 Jul 2025 16:19:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>,
 sebastian.reichel@collabora.com, linux-arm-kernel@lists.infradead.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: rk3399-gru-kevin: kms_flip@plain-flip-ts-check-interruptible
 flake
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

Hi Maintainers,

There are some flake test reported for rockchip driver testing in drm-ci.

# Board Name: rk3399-gru-kevin
# Failure Rate: 40
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_flip@plain-flip-ts-check-interruptible

command: cd "/igt/libexec/igt-gpu-tools" && 
"/igt/libexec/igt-gpu-tools/kms_flip" "--run-subtest" 
"plain-flip-ts-check-interruptible"
pid: 1007
exit status: exit status: 98
stdout:
-------
IGT-Version: 2.1-g26ddb59c1 (aarch64) (Linux: 6.16.0-rc2-ga202a71c05dc 
aarch64)
Using IGT_SRANDOM=1751940132 for randomisation
Opened device: /dev/dri/card1
Using monotonic timestamps
Starting subtest: plain-flip-ts-check-interruptible
Starting dynamic subtest: A-eDP1
   2400x1600: 60 266666 2400 2448 2480 2564 1600 1603 1613 1733 0x48 0xa
Expected frametime: 16663us; measured 16669.4us +- 86.357us accuracy 1.55%
Stack trace:
   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
   #1 ../tests/kms_flip.c:1435 run_test_on_crtc_set.constprop.0()
   #2 ../tests/kms_flip.c:1856 run_test()
   #3 ../tests/kms_flip.c:2141 __igt_unique____real_main2028()
   #4 ../tests/kms_flip.c:2028 main()
   #5 [__libc_init_first+0x80]
   #6 [__libc_start_main+0x98]
   #7 [_start+0x30]
Dynamic subtest A-eDP1: FAIL (1.733s)
Starting dynamic subtest: B-eDP1
   2400x1600: 60 266666 2400 2448 2480 2564 1600 1603 1613 1733 0x48 0xa
Expected frametime: 16663us; measured 16662.7us +- 30.159us accuracy 0.54%
Stack trace:
   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
   #1 ../tests/kms_flip.c:1435 run_test_on_crtc_set.constprop.0()
   #2 ../tests/kms_flip.c:1856 run_test()
   #3 ../tests/kms_flip.c:2141 __igt_unique____real_main2028()
   #4 ../tests/kms_flip.c:2028 main()
   #5 [__libc_init_first+0x80]
   #6 [__libc_start_main+0x98]
   #7 [_start+0x30]
Dynamic subtest B-eDP1: FAIL (1.544s)
Subtest plain-flip-ts-check-interruptible: FAIL (3.308s)
stderr:
-------
(kms_flip:1007) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1455:
(kms_flip:1007) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1007) CRITICAL: Last errno: 4, Interrupted system call
Dynamic subtest A-eDP1 failed.
**** DEBUG ****
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, 
pitch=9600)
(kms_flip:1007) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
pitch=9600)
(kms_flip:1007) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1007) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1007) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1007) igt_kms-INFO:   2400x1600: 60 266666 2400 2448 2480 2564 
1600 1603 1613 1733 0x48 0xa
(kms_flip:1007) DEBUG: No stale events found
(kms_flip:1007) INFO: Expected frametime: 16663us; measured 16669.4us +- 
86.357us accuracy 1.55%
(kms_flip:1007) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1455:
(kms_flip:1007) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1007) CRITICAL: Last errno: 4, Interrupted system call
(kms_flip:1007) igt_core-INFO: Stack trace:
(kms_flip:1007) igt_core-INFO:   #0 ../lib/igt_core.c:2075 
__igt_fail_assert()
(kms_flip:1007) igt_core-INFO:   #1 ../tests/kms_flip.c:1435 
run_test_on_crtc_set.constprop.0()
(kms_flip:1007) igt_core-INFO:   #2 ../tests/kms_flip.c:1856 run_test()
(kms_flip:1007) igt_core-INFO:   #3 ../tests/kms_flip.c:2141 
__igt_unique____real_main2028()
(kms_flip:1007) igt_core-INFO:   #4 ../tests/kms_flip.c:2028 main()
(kms_flip:1007) igt_core-INFO:   #5 [__libc_init_first+0x80]
(kms_flip:1007) igt_core-INFO:   #6 [__libc_start_main+0x98]
(kms_flip:1007) igt_core-INFO:   #7 [_start+0x30]
****  END  ****
(kms_flip:1007) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1455:
(kms_flip:1007) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1007) CRITICAL: Last errno: 4, Interrupted system call
Dynamic subtest B-eDP1 failed.
**** DEBUG ****
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=3, 
pitch=9600)
(kms_flip:1007) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1007) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=4, 
pitch=9600)
(kms_flip:1007) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1007) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1007) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1007) igt_kms-INFO:   2400x1600: 60 266666 2400 2448 2480 2564 
1600 1603 1613 1733 0x48 0xa
(kms_flip:1007) DEBUG: No stale events found
(kms_flip:1007) INFO: Expected frametime: 16663us; measured 16662.7us +- 
30.159us accuracy 0.54%
(kms_flip:1007) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1455:
(kms_flip:1007) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1007) CRITICAL: Last errno: 4, Interrupted system call
(kms_flip:1007) igt_core-INFO: Stack trace:
(kms_flip:1007) igt_core-INFO:   #0 ../lib/igt_core.c:2075 
__igt_fail_assert()
(kms_flip:1007) igt_core-INFO:   #1 ../tests/kms_flip.c:1435 
run_test_on_crtc_set.constprop.0()
(kms_flip:1007) igt_core-INFO:   #2 ../tests/kms_flip.c:1856 run_test()
(kms_flip:1007) igt_core-INFO:   #3 ../tests/kms_flip.c:2141 
__igt_unique____real_main2028()
(kms_flip:1007) igt_core-INFO:   #4 ../tests/kms_flip.c:2028 main()
(kms_flip:1007) igt_core-INFO:   #5 [__libc_init_first+0x80]
(kms_flip:1007) igt_core-INFO:   #6 [__libc_start_main+0x98]
(kms_flip:1007) igt_core-INFO:   #7 [_start+0x30]
****  END  ****
(kms_flip:1007) igt_kms-CRITICAL: Test assertion failure function 
kmstest_set_connector_dpms, file ../lib/igt_kms.c:2247:
(kms_flip:1007) igt_kms-CRITICAL: Failed assertion: found_it
(kms_flip:1007) igt_kms-CRITICAL: Last errno: 9, Bad file descriptor
(kms_flip:1007) igt_kms-CRITICAL: DPMS property not found on 54

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79971538

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
