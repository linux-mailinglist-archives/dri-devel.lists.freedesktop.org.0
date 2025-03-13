Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC88A5EFAB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 10:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638D810E1B8;
	Thu, 13 Mar 2025 09:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="X7lEfqhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB4110E1B8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741858654;
 bh=wEZ3ZhU1xH+c8nDddMtez5TC7wFGYUjOp30LRzKkNWo=;
 h=Date:To:Cc:From:Subject:From;
 b=X7lEfqhXL9qBAKJSCezXpnTjIk5Rw1gPm37S5ZpQVNsynTgo/UnaSTcCp1V5exMCS
 I7WnMi862iWqFO9ooEe+65G8CAxBSVWD6YO+dNEU6qER49OB20q6ZOWy8JMXNqLFme
 XIDZyd2IsPXGibrL2M5jzyOHVQf1kkMuJe0CT3rvMhE0HlKpFBmgl8b+kbhHrlv5sR
 mI+cP0KlMwGj4sRkpS7tDY610M2E5e++A7WOBmJ0jLmOWRMm8zDAJSoj9zYh5ShPLu
 7l0dpy1S+PZM/2YkJhpy4ybeqeAqwE6cd2QJrqcK/U3NKzOHnEoQdWAnnlTBCbScpq
 AmoIQxZaCarzQ==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 433A817E0385;
 Thu, 13 Mar 2025 10:37:32 +0100 (CET)
Message-ID: <d25442b9-0b6b-433c-8e23-997840fad305@collabora.com>
Date: Thu, 13 Mar 2025 15:07:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 nfraprado@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: mediatek: kms_flip@flip-vs-wf_vblank-interruptible flake
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

There are some flake test reported for mediatek driver testing in drm-ci.

# Board Name: mt8173-elm-hana
# Failure Rate: 20
# IGT Version: 1.30-g04bedb923
# Linux Version: 6.14.0-rc4
kms_flip@flip-vs-wf_vblank-interruptible

command: cd "/igt/libexec/igt-gpu-tools" && 
"/igt/libexec/igt-gpu-tools/kms_flip" "--run-subtest" 
"flip-vs-wf_vblank-interruptible"
pid: 845
exit status: exit status: 98
stdout:
-------
IGT-Version: 1.30-g04bedb923 (aarch64) (Linux: 6.14.0-rc4-g5dbf0298b72f 
aarch64)
Using IGT_SRANDOM=1741692817 for randomisation
Opened device: /dev/dri/card0
Using monotonic timestamps
Skipping timestamp checks
Starting subtest: flip-vs-wf_vblank-interruptible
Starting dynamic subtest: A-eDP1
   1366x768: 60 76420 1366 1502 1532 1592 768 776 788 800 0x48 0xa
Stack trace:
   #0 ../lib/igt_core.c:2055 __igt_fail_assert()
   #1 ../tests/kms_flip.c:1671 run_test_on_crtc_set.constprop.0()
   #2 ../tests/kms_flip.c:1829 run_test()
   #3 ../tests/kms_flip.c:2114 __igt_unique____real_main2001()
   #4 ../tests/kms_flip.c:2001 main()
   #5 [__libc_init_first+0x80]
   #6 [__libc_start_main+0x98]
   #7 [_start+0x30]
Dynamic subtest A-eDP1: FAIL (5.673s)
Subtest flip-vs-wf_vblank-interruptible: FAIL (5.686s)
stderr:
-------
(kms_flip:845) CRITICAL: Test assertion failure function 
__run_test_on_crtc_set, file ../tests/kms_flip.c:1674:
(kms_flip:845) CRITICAL: Failed assertion: !retried && 
needs_retry_after_link_reset(mon)
(kms_flip:845) CRITICAL: Last errno: 4, Interrupted system call
Dynamic subtest A-eDP1 failed.
**** DEBUG ****
(kms_flip:845) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1366, 
height=768, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:845) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, 
pitch=5464)
(kms_flip:845) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:845) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1366, 
height=768, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:845) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
pitch=5464)
(kms_flip:845) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:845) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:845) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:845) igt_kms-INFO:   1366x768: 60 76420 1366 1502 1532 1592 
768 776 788 800 0x48 0xa
(kms_flip:845) DEBUG: No stale events found
(kms_flip:845) DEBUG: name = flip
last_ts = 0.000000
last_received_ts = 0.000000
last_seq = 0
current_ts = 371.308685
current_received_ts = 371.325470
current_seq = 16367
count = 0
seq_step = 1
(kms_flip:845) DEBUG: name = vblank
last_ts = 0.000000
last_received_ts = 0.000000
last_seq = 0
current_ts = 371.475159
current_received_ts = 371.475281
current_seq = 16377
count = 0
seq_step = 10
(kms_flip:845) DEBUG: name = flip
last_ts = 371.308685
last_received_ts = 371.325470
last_seq = 16367
current_ts = 371.475159
current_received_ts = 371.491943
current_seq = 16377
count = 1
seq_step = 1
(kms_flip:845) DEBUG: name = vblank
last_ts = 371.475159
last_received_ts = 371.475281
last_seq = 16377
current_ts = 371.641693
current_received_ts = 371.641815
current_seq = 16387
count = 1
seq_step = 10
(kms_flip:845) DEBUG: name = flip
last_ts = 371.475159
last_received_ts = 371.491943
last_seq = 16377
current_ts = 371.641693
current_received_ts = 371.658630
current_seq = 16387
count = 2
seq_step = 1
(kms_flip:845) DEBUG: name = vblank
last_ts = 371.641693
last_received_ts = 371.641815
last_seq = 16387
current_ts = 371.808167
current_received_ts = 371.808411
current_seq = 16397
count = 2
seq_step = 10
(kms_flip:845) DEBUG: name = flip
last_ts = 371.641693
last_received_ts = 371.658630
last_seq = 16387
current_ts = 371.808167
current_received_ts = 371.824921
current_seq = 16397
count = 3
seq_step = 1
(kms_flip:845) DEBUG: name = vblank
last_ts = 371.808167
last_received_ts = 371.808411
last_seq = 16397
current_ts = 371.974670
current_received_ts = 371.974762
current_seq = 16407
count = 3
seq_step = 10
(kms_flip:845) DEBUG: name = flip
last_ts = 371.808167
last_received_ts = 371.824921
last_seq = 16397
current_ts = 371.974670
current_received_ts = 371.991547
current_seq = 16407
count = 4
seq_step = 1
(kms_flip:845) DEBUG: name = vblank
last_ts = 371.974670
last_received_ts = 371.974762
last_seq = 16407
current_ts = 372.141113
current_received_ts = 372.141266
current_seq = 16417
count = 4
seq_step = 10
(kms_flip:845) DEBUG: name = flip
last_ts = 371.974670
last_received_ts = 371.991547
last_seq = 16407
current_ts = 372.141113
current_received_ts = 372.158051
current_seq = 16417
count = 5
seq_step = 1
(kms_flip:845) DEBUG: name = vblank
last_ts = 372.141113
last_received_ts = 372.141266
last_seq = 16417
current_ts = 372.307617
current_received_ts = 372.307739
current_seq = 16427
count = 5
seq_step = 10
(kms_flip:845) DEBUG: name = flip
last_ts = 372.141113
last_received_ts = 372.158051
last_seq = 16417
current_ts = 372.324280
current_received_ts = 372.324493
current_seq = 16428
count = 6
seq_step = 1
(kms_flip:845) DEBUG: name = vblank
last_ts = 372.307617
last_received_ts = 372.307739
last_seq = 16427
current_ts = 372.474152
current_received_ts = 372.474274
current_seq = 16437
count = 6
seq_step = 10
(kms_flip:845) DEBUG: name = flip
last_ts = 372.324280
last_received_ts = 372.324493
last_seq = 16428
current_ts = 372.474152
current_received_ts = 372.491089
current_seq = 16437
count = 7
seq_step = 1
(kms_flip:845) DEBUG: unexpected flip seq 16437, should be >= 16438
(kms_flip:845) CRITICAL: Test assertion failure function 
__run_test_on_crtc_set, file ../tests/kms_flip.c:1674:
(kms_flip:845) CRITICAL: Failed assertion: !retried && 
needs_retry_after_link_reset(mon)
(kms_flip:845) CRITICAL: Last errno: 4, Interrupted system call
(kms_flip:845) igt_core-INFO: Stack trace:
(kms_flip:845) igt_core-INFO:   #0 ../lib/igt_core.c:2055 
__igt_fail_assert()
(kms_flip:845) igt_core-INFO:   #1 ../tests/kms_flip.c:1671 
run_test_on_crtc_set.constprop.0()
(kms_flip:845) igt_core-INFO:   #2 ../tests/kms_flip.c:1829 run_test()
(kms_flip:845) igt_core-INFO:   #3 ../tests/kms_flip.c:2114 
__igt_unique____real_main2001()
(kms_flip:845) igt_core-INFO:   #4 ../tests/kms_flip.c:2001 main()
(kms_flip:845) igt_core-INFO:   #5 [__libc_init_first+0x80]
(kms_flip:845) igt_core-INFO:   #6 [__libc_start_main+0x98]
(kms_flip:845) igt_core-INFO:   #7 [_start+0x30]
****  END  ****
(kms_flip:845) igt_kms-CRITICAL: Test assertion failure function 
kmstest_set_connector_dpms, file ../lib/igt_kms.c:2246:
(kms_flip:845) igt_kms-CRITICAL: Failed assertion: found_it
(kms_flip:845) igt_kms-CRITICAL: Last errno: 9, Bad file descriptor
(kms_flip:845) igt_kms-CRITICAL: DPMS property not found on 33

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/72651178

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
