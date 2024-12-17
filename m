Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B1F9F445E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 07:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A2D10E400;
	Tue, 17 Dec 2024 06:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gDKArG+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D6910E400
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734418384;
 bh=8pybKnNblGBBO5m98T2VCI4WkKLKpY2CIqzKDo5X3NE=;
 h=Date:To:Cc:From:Subject:From;
 b=gDKArG+iHtedQF1+0BijosfQx3/b3tS2RsQQnIaAp1kkAirCt1g/+RiVGNOHkr6cs
 bDhwaAN1BYyYeCXJUc8CcK4ptjYu+wWfYwQcnBC3TsznO7PTX85OiMeteiQwFe6Or5
 KyVSCj2KeBvx9GggStP5vgx6zP8q9ZY01mhxVFkjGLU/GG2oX8GtFqpS3Sproq9auG
 BEjPg7zvla6u4LjoK0yTRbV//ARbKaVyyLcSBApimnNmyF8pIPqpsFECB1dDwR0lEY
 gnJ3ljNstQhmH6VWNrjvqiCwzYdzy4tiE1P8UtVFs2jY2HehMXexZIFuiVKq65k5Pe
 Uln+lfinAvUwQ==
Received: from [192.168.50.250] (unknown [171.76.86.135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D63A317E125E;
 Tue, 17 Dec 2024 07:52:58 +0100 (CET)
Message-ID: <616aa015-9574-4527-9d07-d8d698bbcc3c@collabora.com>
Date: Tue, 17 Dec 2024 12:22:52 +0530
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
Subject: drm-ci: rockchip: kms_plane@plane-position-hole-dpms flake
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
# Failure Rate: 100
# IGT Version: 1.29-g33adea9eb
# Linux Version: 6.13.0-rc2
kms_plane@plane-position-hole-dpms

command: cd "/igt/libexec/igt-gpu-tools" && 
"/igt/libexec/igt-gpu-tools/kms_plane" "--run-subtest" 
"plane-position-hole-dpms"
pid: 920
exit status: exit status: 98
stdout:
-------
IGT-Version: 1.29-g33adea9eb (aarch64) (Linux: 6.13.0-rc2-gc72a8c362509 
aarch64)
Using IGT_SRANDOM=1734342282 for randomisation
Opened device: /dev/dri/card1
Starting subtest: plane-position-hole-dpms
Using (pipe A + eDP-1) to run the subtest.
Starting dynamic subtest: pipe-A-plane-1
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../lib/igt_pipe_crc.c:125 igt_check_crc_equal()
   #2 ../tests/kms_plane.c:320 test_plane_position()
   #3 ../tests/kms_plane.c:1327 run_test.constprop.0()
   #4 ../tests/kms_plane.c:1387 run_tests_for_pipe_plane.constprop.0()
   #5 ../tests/kms_plane.c:1457 __igt_unique____real_main1444()
   #6 ../tests/kms_plane.c:1444 main()
   #7 [__libc_init_first+0x80]
   #8 [__libc_start_main+0x98]
   #9 [_start+0x30]
Dynamic subtest pipe-A-plane-1: FAIL (1.054s)
Starting dynamic subtest: pipe-A-plane-2
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../lib/igt_pipe_crc.c:125 igt_check_crc_equal()
   #2 ../tests/kms_plane.c:320 test_plane_position()
   #3 ../tests/kms_plane.c:1327 run_test.constprop.0()
   #4 ../tests/kms_plane.c:1387 run_tests_for_pipe_plane.constprop.0()
   #5 ../tests/kms_plane.c:1457 __igt_unique____real_main1444()
   #6 ../tests/kms_plane.c:1444 main()
   #7 [__libc_init_first+0x80]
   #8 [__libc_start_main+0x98]
   #9 [_start+0x30]
Dynamic subtest pipe-A-plane-2: FAIL (0.272s)
Starting dynamic subtest: pipe-A-plane-3
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../lib/igt_pipe_crc.c:125 igt_check_crc_equal()
   #2 ../tests/kms_plane.c:320 test_plane_position()
   #3 ../tests/kms_plane.c:1327 run_test.constprop.0()
   #4 ../tests/kms_plane.c:1387 run_tests_for_pipe_plane.constprop.0()
   #5 ../tests/kms_plane.c:1457 __igt_unique____real_main1444()
   #6 ../tests/kms_plane.c:1444 main()
   #7 [__libc_init_first+0x80]
   #8 [__libc_start_main+0x98]
   #9 [_start+0x30]
Dynamic subtest pipe-A-plane-3: FAIL (0.289s)
Using (pipe B + eDP-1) to run the subtest.
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../lib/igt_pipe_crc.c:433 igt_pipe_crc_get_crcs()
   #2 ../lib/igt_pipe_crc.c:592 igt_pipe_crc_collect_crc()
   #3 ../tests/kms_plane.c:232 test_grab_crc()
   #4 ../tests/kms_plane.c:357 test_plane_position()
   #5 ../tests/kms_plane.c:1327 run_test.constprop.0()
   #6 ../tests/kms_plane.c:1387 run_tests_for_pipe_plane.constprop.0()
   #7 ../tests/kms_plane.c:1457 __igt_unique____real_main1444()
   #8 ../tests/kms_plane.c:1444 main()
   #9 [__libc_init_first+0x80]
   #10 [__libc_start_main+0x98]
   #11 [_start+0x30]
Subtest plane-position-hole-dpms: FAIL (3.234s)
stderr:
-------
(kms_plane:920) igt_pipe_crc-WARNING: Warning on condition all_zero in 
function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_plane:920) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
(kms_plane:920) igt_pipe_crc-CRITICAL: Test assertion failure function 
igt_assert_crc_equal, file ../lib/igt_pipe_crc.c:112:
(kms_plane:920) igt_pipe_crc-CRITICAL: Failed assertion: !mismatch || 
igt_skip_crc_compare
Dynamic subtest pipe-A-plane-1 failed.
**** DEBUG ****
(kms_plane:920) DEBUG: Testing connector eDP-1 using pipe A plane 1
(kms_plane:920) igt_kms-DEBUG: display: eDP-1: set_pipe(A)
(kms_plane:920) igt_kms-DEBUG: display: eDP-1: Selecting pipe A
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, 
pitch=9600)
(kms_plane:920) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_plane:920) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_plane:920) igt_kms-DEBUG: display: A.0: plane_set_fb(56)
(kms_plane:920) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_plane:920) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_plane:920) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=64, 
height=64, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
pitch=256)
(kms_plane:920) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_plane:920) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_plane:920) igt_kms-DEBUG: display: A.1: plane_set_fb(57)
(kms_plane:920) igt_kms-DEBUG: display: A.1: plane_set_size (64x64)
(kms_plane:920) igt_kms-DEBUG: display: A.1: fb_set_position(0,0)
(kms_plane:920) igt_kms-DEBUG: display: A.1: fb_set_size(64x64)
(kms_plane:920) igt_kms-DEBUG: display: A.1: plane_set_position(132,132)
(kms_plane:920) igt_kms-DEBUG: display: commit {
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
56, src (0, 0), mode 2400x1600
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: display:     SetPlane A.1, fb 57, src = 
(0, 0) 64x64 dst = (132, 132) 64x64
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: display: }
(kms_plane:920) igt_pipe_crc-DEBUG: CRC mismatch at index 1: 0x0 != 0x2e30
(kms_plane:920) igt_pipe_crc-CRITICAL: Test assertion failure function 
igt_assert_crc_equal, file ../lib/igt_pipe_crc.c:112:
(kms_plane:920) igt_pipe_crc-CRITICAL: Failed assertion: !mismatch || 
igt_skip_crc_compare
(kms_plane:920) igt_core-INFO: Stack trace:
(kms_plane:920) igt_core-INFO:   #0 ../lib/igt_core.c:2051 
__igt_fail_assert()
(kms_plane:920) igt_core-INFO:   #1 ../lib/igt_pipe_crc.c:125 
igt_check_crc_equal()
(kms_plane:920) igt_core-INFO:   #2 ../tests/kms_plane.c:320 
test_plane_position()
(kms_plane:920) igt_core-INFO:   #3 ../tests/kms_plane.c:1327 
run_test.constprop.0()
(kms_plane:920) igt_core-INFO:   #4 ../tests/kms_plane.c:1387 
run_tests_for_pipe_plane.constprop.0()
(kms_plane:920) igt_core-INFO:   #5 ../tests/kms_plane.c:1457 
__igt_unique____real_main1444()
(kms_plane:920) igt_core-INFO:   #6 ../tests/kms_plane.c:1444 main()
(kms_plane:920) igt_core-INFO:   #7 [__libc_init_first+0x80]
(kms_plane:920) igt_core-INFO:   #8 [__libc_start_main+0x98]
(kms_plane:920) igt_core-INFO:   #9 [_start+0x30]
****  END  ****
(kms_plane:920) igt_pipe_crc-CRITICAL: Test assertion failure function 
igt_assert_crc_equal, file ../lib/igt_pipe_crc.c:112:
(kms_plane:920) igt_pipe_crc-CRITICAL: Failed assertion: !mismatch || 
igt_skip_crc_compare
Dynamic subtest pipe-A-plane-2 failed.
**** DEBUG ****
(kms_plane:920) DEBUG: Testing connector eDP-1 using pipe A plane 2
(kms_plane:920) igt_kms-DEBUG: display: eDP-1: set_pipe(A)
(kms_plane:920) igt_kms-DEBUG: display: eDP-1: Selecting pipe A
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=3, 
pitch=9600)
(kms_plane:920) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_plane:920) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_plane:920) igt_kms-DEBUG: display: A.0: plane_set_fb(59)
(kms_plane:920) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_plane:920) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_plane:920) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=64, 
height=64, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=4, 
pitch=256)
(kms_plane:920) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_plane:920) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_plane:920) igt_kms-DEBUG: display: A.2: plane_set_fb(60)
(kms_plane:920) igt_kms-DEBUG: display: A.2: plane_set_size (64x64)
(kms_plane:920) igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
(kms_plane:920) igt_kms-DEBUG: display: A.2: fb_set_size(64x64)
(kms_plane:920) igt_kms-DEBUG: display: A.2: plane_set_position(132,132)
(kms_plane:920) igt_kms-DEBUG: display: commit {
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
59, src (0, 0), mode 2400x1600
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: display:     SetPlane A.2, fb 60, src = 
(0, 0) 64x64 dst = (132, 132) 64x64
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: display: }
(kms_plane:920) igt_pipe_crc-DEBUG: CRC mismatch at index 1: 0x0 != 0x62d0
(kms_plane:920) igt_pipe_crc-CRITICAL: Test assertion failure function 
igt_assert_crc_equal, file ../lib/igt_pipe_crc.c:112:
(kms_plane:920) igt_pipe_crc-CRITICAL: Failed assertion: !mismatch || 
igt_skip_crc_compare
(kms_plane:920) igt_core-INFO: Stack trace:
(kms_plane:920) igt_core-INFO:   #0 ../lib/igt_core.c:2051 
__igt_fail_assert()
(kms_plane:920) igt_core-INFO:   #1 ../lib/igt_pipe_crc.c:125 
igt_check_crc_equal()
(kms_plane:920) igt_core-INFO:   #2 ../tests/kms_plane.c:320 
test_plane_position()
(kms_plane:920) igt_core-INFO:   #3 ../tests/kms_plane.c:1327 
run_test.constprop.0()
(kms_plane:920) igt_core-INFO:   #4 ../tests/kms_plane.c:1387 
run_tests_for_pipe_plane.constprop.0()
(kms_plane:920) igt_core-INFO:   #5 ../tests/kms_plane.c:1457 
__igt_unique____real_main1444()
(kms_plane:920) igt_core-INFO:   #6 ../tests/kms_plane.c:1444 main()
(kms_plane:920) igt_core-INFO:   #7 [__libc_init_first+0x80]
(kms_plane:920) igt_core-INFO:   #8 [__libc_start_main+0x98]
(kms_plane:920) igt_core-INFO:   #9 [_start+0x30]
****  END  ****
(kms_plane:920) igt_pipe_crc-CRITICAL: Test assertion failure function 
igt_assert_crc_equal, file ../lib/igt_pipe_crc.c:112:
(kms_plane:920) igt_pipe_crc-CRITICAL: Failed assertion: !mismatch || 
igt_skip_crc_compare
Dynamic subtest pipe-A-plane-3 failed.
**** DEBUG ****
(kms_plane:920) DEBUG: Testing connector eDP-1 using pipe A plane 3
(kms_plane:920) igt_kms-DEBUG: display: eDP-1: set_pipe(A)
(kms_plane:920) igt_kms-DEBUG: display: eDP-1: Selecting pipe A
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=5, 
pitch=9600)
(kms_plane:920) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_plane:920) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_plane:920) igt_kms-DEBUG: display: A.0: plane_set_fb(61)
(kms_plane:920) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_plane:920) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_plane:920) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=64, 
height=64, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_plane:920) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=6, 
pitch=256)
(kms_plane:920) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_plane:920) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_plane:920) igt_kms-DEBUG: display: A.3: plane_set_fb(62)
(kms_plane:920) igt_kms-DEBUG: display: A.3: plane_set_size (64x64)
(kms_plane:920) igt_kms-DEBUG: display: A.3: fb_set_position(0,0)
(kms_plane:920) igt_kms-DEBUG: display: A.3: fb_set_size(64x64)
(kms_plane:920) igt_kms-DEBUG: display: A.3: plane_set_position(132,132)
(kms_plane:920) igt_kms-DEBUG: display: commit {
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
61, src (0, 0), mode 2400x1600
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: display:     SetCursor pipe A, fb 6 64x64
(kms_plane:920) igt_kms-DEBUG: display:     MoveCursor pipe A, (132, 132)
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_plane:920) igt_kms-DEBUG: display: }
(kms_plane:920) igt_pipe_crc-DEBUG: CRC mismatch at index 1: 0x0 != 0x62d0
(kms_plane:920) igt_pipe_crc-CRITICAL: Test assertion failure function 
igt_assert_crc_equal, file ../lib/igt_pipe_crc.c:112:
(kms_plane:920) igt_pipe_crc-CRITICAL: Failed assertion: !mismatch || 
igt_skip_crc_compare
(kms_plane:920) igt_core-INFO: Stack trace:
(kms_plane:920) igt_core-INFO:   #0 ../lib/igt_core.c:2051 
__igt_fail_assert()
(kms_plane:920) igt_core-INFO:   #1 ../lib/igt_pipe_crc.c:125 
igt_check_crc_equal()
(kms_plane:920) igt_core-INFO:   #2 ../tests/kms_plane.c:320 
test_plane_position()
(kms_plane:920) igt_core-INFO:   #3 ../tests/kms_plane.c:1327 
run_test.constprop.0()
(kms_plane:920) igt_core-INFO:   #4 ../tests/kms_plane.c:1387 
run_tests_for_pipe_plane.constprop.0()
(kms_plane:920) igt_core-INFO:   #5 ../tests/kms_plane.c:1457 
__igt_unique____real_main1444()
(kms_plane:920) igt_core-INFO:   #6 ../tests/kms_plane.c:1444 main()
(kms_plane:920) igt_core-INFO:   #7 [__libc_init_first+0x80]
(kms_plane:920) igt_core-INFO:   #8 [__libc_start_main+0x98]
(kms_plane:920) igt_core-INFO:   #9 [_start+0x30]
****  END  ****
(kms_plane:920) igt_pipe_crc-CRITICAL: Test assertion failure function 
igt_pipe_crc_start, file ../lib/igt_pipe_crc.c:387:
(kms_plane:920) igt_pipe_crc-CRITICAL: Failed assertion: 
pipe_crc->crc_fd != -1
(kms_plane:920) igt_pipe_crc-CRITICAL: Last errno: 5, Input/output error

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/68246514

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
