Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076389F44DC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 08:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD83310E7A4;
	Tue, 17 Dec 2024 07:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lZfP00lB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655C710E7A4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 07:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734419734;
 bh=cLrL25gxNw+HqZe4FVyUrcKBfyRRwbF+59yDEgcg1jM=;
 h=Date:To:Cc:From:Subject:From;
 b=lZfP00lB3vY8UdLwlcxBMMYbtUatGKEiCXbyWZ+xIdNUcoFBdOpBP3NG2SngYOjNH
 NrS7DmRtQoW5XGtzhJiiWkvPurQZfvN+pvjdjeFJWet7Mwvkk+xczu9ulrxfDnjfi2
 WcrFdTMg3J3HWv7N3nWpTu6RL1kKa/1MrhLwrdFBQlnMPnYTRlvQbMW9IbGcSt31pd
 eJfJ1Hi2RksKauodB57wdCWPLLqK4cEL2hv7m6/htT4Bpi9QwRnodOhbLKJipLsuov
 a1csyFQqxvmUGeyiHL+7MDMQjpCK8za816EvFHpcmy9mWtgS4k+xKE9quLG23f9jf/
 fWungsiDdUouQ==
Received: from [192.168.50.250] (unknown [171.76.86.135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2656F17E1323;
 Tue, 17 Dec 2024 08:15:27 +0100 (CET)
Message-ID: <059545fa-65b1-4f5c-a13e-4d2898679f51@collabora.com>
Date: Tue, 17 Dec 2024 12:45:23 +0530
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
Subject: drm-ci: rockchip: kms_flip@modeset-vs-vblank-race-interruptible flake
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
# Failure Rate: 20
# IGT Version: 1.29-g33adea9eb
# Linux Version: 6.13.0-rc2
kms_flip@modeset-vs-vblank-race-interruptible

command: cd "/igt/libexec/igt-gpu-tools" && 
"/igt/libexec/igt-gpu-tools/kms_flip" "--run-subtest" 
"modeset-vs-vblank-race-interruptible"
pid: 1263
exit status: exit status: 98
stdout:
-------
IGT-Version: 1.29-g33adea9eb (aarch64) (Linux: 6.13.0-rc2-g1f006005ebf8 
aarch64)
Using IGT_SRANDOM=1734350090 for randomisation
Opened device: /dev/dri/card1
Using monotonic timestamps
Starting subtest: modeset-vs-vblank-race-interruptible
Starting dynamic subtest: A-eDP1
   2400x1600: 60 266666 2400 2448 2480 2564 1600 1603 1613 1733 0x48 0xa
Expected frametime: 16663us; measured 16662.8us +- 8.128us accuracy 0.15%
Dynamic subtest A-eDP1: SUCCESS (7.351s)
Starting dynamic subtest: B-eDP1
   2400x1600: 60 266666 2400 2448 2480 2564 1600 1603 1613 1733 0x48 0xa
Expected frametime: 16663us; measured 16662.3us +- 28.697us accuracy 0.52%
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../tests/kms_flip.c:1434 run_test_on_crtc_set.constprop.0()
   #2 ../tests/kms_flip.c:1829 run_test()
   #3 ../tests/kms_flip.c:2114 __igt_unique____real_main2001()
   #4 ../tests/kms_flip.c:2001 main()
   #5 [__libc_init_first+0x80]
   #6 [__libc_start_main+0x98]
   #7 [_start+0x30]
Dynamic subtest B-eDP1: FAIL (1.548s)
Subtest modeset-vs-vblank-race-interruptible: FAIL (8.928s)
stderr:
-------
(kms_flip:1263) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1454:
(kms_flip:1263) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1263) CRITICAL: Last errno: 4, Interrupted system call
Dynamic subtest B-eDP1 failed.
**** DEBUG ****
(kms_flip:1263) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1263) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, 
pitch=9600)
(kms_flip:1263) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1263) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:1263) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
pitch=9600)
(kms_flip:1263) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:1263) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1263) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:1263) igt_kms-INFO:   2400x1600: 60 266666 2400 2448 2480 2564 
1600 1603 1613 1733 0x48 0xa
(kms_flip:1263) DEBUG: No stale events found
(kms_flip:1263) INFO: Expected frametime: 16663us; measured 16662.3us +- 
28.697us accuracy 0.52%
(kms_flip:1263) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1454:
(kms_flip:1263) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:1263) CRITICAL: Last errno: 4, Interrupted system call
(kms_flip:1263) igt_core-INFO: Stack trace:
(kms_flip:1263) igt_core-INFO:   #0 ../lib/igt_core.c:2051 
__igt_fail_assert()
(kms_flip:1263) igt_core-INFO:   #1 ../tests/kms_flip.c:1434 
run_test_on_crtc_set.constprop.0()
(kms_flip:1263) igt_core-INFO:   #2 ../tests/kms_flip.c:1829 run_test()
(kms_flip:1263) igt_core-INFO:   #3 ../tests/kms_flip.c:2114 
__igt_unique____real_main2001()
(kms_flip:1263) igt_core-INFO:   #4 ../tests/kms_flip.c:2001 main()
(kms_flip:1263) igt_core-INFO:   #5 [__libc_init_first+0x80]
(kms_flip:1263) igt_core-INFO:   #6 [__libc_start_main+0x98]
(kms_flip:1263) igt_core-INFO:   #7 [_start+0x30]
****  END  ****
(kms_flip:1263) igt_kms-CRITICAL: Test assertion failure function 
kmstest_set_connector_dpms, file ../lib/igt_kms.c:2246:
(kms_flip:1263) igt_kms-CRITICAL: Failed assertion: found_it
(kms_flip:1263) igt_kms-CRITICAL: Last errno: 9, Bad file descriptor
(kms_flip:1263) igt_kms-CRITICAL: DPMS property not found on 53

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/68249817

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
