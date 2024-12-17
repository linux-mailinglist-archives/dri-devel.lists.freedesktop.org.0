Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA239F44A8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 08:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D32510E77E;
	Tue, 17 Dec 2024 07:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="h3NIqfy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D3D10E414
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734418825;
 bh=ta6/RfirTMv6/TmEdMRAfKedVPrY5UfkkZ9TaGPE3gs=;
 h=Date:To:Cc:From:Subject:From;
 b=h3NIqfy6KEw9cxag/hB07uhrFPmmP/JIEsCAjglqx4YdEhEBB/DH1MyZLPfD4cOrQ
 mwsq2PH6/ly5XXb8q9NgN0fxPATnJM8z6mGOl6HsBURBFnrKZIAJrawAmKNeJ8JQmx
 0pX8H2WrqvQ8+Z1Dt3lEF2DDjE/L8csyD3scBlWpbebXpi6OVEXu/ztUz+p+08fM9C
 uLel/2+2kO30x73PSHKAbRxnnp0w9iDsyiJdp8TDZi4DjEeLeiOs9nshhbdtwydIgf
 hPpLJbBcHadhTt34zKSIiKADi4v0Rt3J+qCZtRyqMXQ0J3NTbShEyasBHnYVFkQhNk
 QLt2KKEpT5w3Q==
Received: from [192.168.50.250] (unknown [171.76.86.135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C03B117E12AC;
 Tue, 17 Dec 2024 08:00:20 +0100 (CET)
Message-ID: <7a1b888f-d7db-4ed7-96cd-3975ace837fb@collabora.com>
Date: Tue, 17 Dec 2024 12:30:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: drm-ci: rockchip: kms_flip@flip-vs-absolute-wf_vblank flake
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

# Board Name: hp-11A-G6-EE-grunt
# Bug Report:
# Failure Rate: 100
# IGT Version: 1.29-g33adea9eb
# Linux Version: 6.13.0-rc2
kms_flip@flip-vs-absolute-wf_vblank

command: cd "/igt/libexec/igt-gpu-tools" && 
"/igt/libexec/igt-gpu-tools/kms_flip" "--run-subtest" 
"flip-vs-absolute-wf_vblank"
pid: 1137
exit status: exit status: 98
stdout:
-------
IGT-Version: 1.29-g33adea9eb (aarch64) (Linux: 6.13.0-rc2-g1f006005ebf8 
aarch64)
Using IGT_SRANDOM=1734349644 for randomisation
Opened device: /dev/dri/card1
Using monotonic timestamps
Starting subtest: flip-vs-absolute-wf_vblank
Starting dynamic subtest: A-eDP1
   2400x1600: 60 266666 2400 2448 2480 2564 1600 1603 1613 1733 0x48 0xa
Expected frametime: 16663us; measured 16660.9us +- 46.199us accuracy 0.83%
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../tests/kms_flip.c:1434 run_test_on_crtc_set.constprop.0()
   #2 ../tests/kms_flip.c:1829 run_test()
   #3 ../tests/kms_flip.c:2078 __igt_unique____real_main2001()
   #4 ../tests/kms_flip.c:2001 main()
   #5 [__libc_init_first+0x80]
   #6 [__libc_start_main+0x98]
   #7 [_start+0x30]
Dynamic subtest A-eDP1: FAIL (1.704s)
Starting dynamic subtest: B-eDP1
   2400x1600: 60 266666 2400 2448 2480 2564 1600 1603 1613 1733 0x48 0xa
Expected frametime: 16663us; measured 16662.9us +- 39.823us accuracy 0.72%
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../tests/kms_flip.c:1434 run_test_on_crtc_set.constprop.0()
   #2 ../tests/kms_flip.c:1829 run_test()
   #3 ../tests/kms_flip.c:2078 __igt_unique____real_main2001()
   #4 ../tests/kms_flip.c:2001 main()
   #5 [__libc_init_first+0x80]
   #6 [__libc_start_main+0x98]
   #7 [_start+0x30]
Dynamic subtest B-eDP1: FAIL (1.582s)
Subtest flip-vs-absolute-wf_vblank: FAIL (3.315s)
stderr:
-------
(kms_flip:1137) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1454:
(kms_flip:1137) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
Dynamic subtest A-eDP1 failed.
**** DEBUG ****
(kms_flip:1137) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1137) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, 
pitch=9600)
(kms_flip:1137) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1137) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1137) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
pitch=9600)
(kms_flip:1137) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1137) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1137) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1137) igt_kms-INFO:   2400x1600: 60 266666 2400 2448 2480 2564 
1600 1603 1613 1733 0x48 0xa
(kms_flip:1137) DEBUG: No stale events found
(kms_flip:1137) INFO: Expected frametime: 16663us; measured 16660.9us +- 
46.199us accuracy 0.83%
(kms_flip:1137) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1454:
(kms_flip:1137) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1137) igt_core-INFO: Stack trace:
(kms_flip:1137) igt_core-INFO:   #0 ../lib/igt_core.c:2051 
__igt_fail_assert()
(kms_flip:1137) igt_core-INFO:   #1 ../tests/kms_flip.c:1434 
run_test_on_crtc_set.constprop.0()
(kms_flip:1137) igt_core-INFO:   #2 ../tests/kms_flip.c:1829 run_test()
(kms_flip:1137) igt_core-INFO:   #3 ../tests/kms_flip.c:2078 
__igt_unique____real_main2001()
(kms_flip:1137) igt_core-INFO:   #4 ../tests/kms_flip.c:2001 main()
(kms_flip:1137) igt_core-INFO:   #5 [__libc_init_first+0x80]
(kms_flip:1137) igt_core-INFO:   #6 [__libc_start_main+0x98]
(kms_flip:1137) igt_core-INFO:   #7 [_start+0x30]
****  END  ****
(kms_flip:1137) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1454:
(kms_flip:1137) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1137) CRITICAL: Last errno: 22, Invalid argument
Dynamic subtest B-eDP1 failed.
**** DEBUG ****
(kms_flip:1137) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1137) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=3, 
pitch=9600)
(kms_flip:1137) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1137) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1137) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=4, 
pitch=9600)
(kms_flip:1137) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1137) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1137) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1137) igt_kms-INFO:   2400x1600: 60 266666 2400 2448 2480 2564 
1600 1603 1613 1733 0x48 0xa
(kms_flip:1137) DEBUG: No stale events found
(kms_flip:1137) INFO: Expected frametime: 16663us; measured 16662.9us +- 
39.823us accuracy 0.72%
(kms_flip:1137) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1454:
(kms_flip:1137) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1137) CRITICAL: Last errno: 22, Invalid argument
(kms_flip:1137) igt_core-INFO: Stack trace:
(kms_flip:1137) igt_core-INFO:   #0 ../lib/igt_core.c:2051 
__igt_fail_assert()
(kms_flip:1137) igt_core-INFO:   #1 ../tests/kms_flip.c:1434 
run_test_on_crtc_set.constprop.0()
(kms_flip:1137) igt_core-INFO:   #2 ../tests/kms_flip.c:1829 run_test()
(kms_flip:1137) igt_core-INFO:   #3 ../tests/kms_flip.c:2078 
__igt_unique____real_main2001()
(kms_flip:1137) igt_core-INFO:   #4 ../tests/kms_flip.c:2001 main()
(kms_flip:1137) igt_core-INFO:   #5 [__libc_init_first+0x80]
(kms_flip:1137) igt_core-INFO:   #6 [__libc_start_main+0x98]
(kms_flip:1137) igt_core-INFO:   #7 [_start+0x30]
****  END  ****
(kms_flip:1137) igt_kms-CRITICAL: Test assertion failure function 
kmstest_set_connector_dpms, file ../lib/igt_kms.c:2246:
(kms_flip:1137) igt_kms-CRITICAL: Failed assertion: found_it
(kms_flip:1137) igt_kms-CRITICAL: Last errno: 9, Bad file descriptor
(kms_flip:1137) igt_kms-CRITICAL: DPMS property not found on 53

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/68249818

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
