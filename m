Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D7A5F205
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 12:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFFB10E847;
	Thu, 13 Mar 2025 11:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mlIRQNJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6035A10E842
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 11:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741864089;
 bh=CDHYKW3ivWzxe3ZpJDHQbCcV8GBAcI+z4z7HYBeV6YU=;
 h=Date:To:Cc:From:Subject:From;
 b=mlIRQNJEeR8Rqsfz9t9EqbTPpxbV7B/XwxUDKjKv5jOfubNkxgQufW+8jovVyuBfv
 CpwgULAXeQoFjPWJ/jGEZrg2aPKenueqw8MFF3sEEfacp15l4dwdvfCJia7tPzSsg0
 jWAqxPlGi0YYjJmiaYem/+hXQBQQcV4hnqnK6NwJxpicbVNLxxmfKhCs040T+Gmobp
 I6dO1YmBaFjzTxsfCPY+fapM3E7ceaFL3yZKEVwuJ8k7D3oun1cjXBhhL1vcXfYgYB
 ED25tC3hwqrLdSAX9oSbZcna0l8WIoVHh9I+/pxpG/9xTtqCdXAxkFDCFPmBNxI8hB
 ny9VfA3aAtdEQ==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 57C9A17E0AF6;
 Thu, 13 Mar 2025 12:08:07 +0100 (CET)
Message-ID: <b58d15eb-094d-4ac2-aad3-83e518c2f55d@collabora.com>
Date: Thu, 13 Mar 2025 16:38:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 "hamohammed.sa" <hamohammed.sa@gmail.com>, simona.vetter@ffwll.ch,
 "melissa.srw" <melissa.srw@gmail.com>,
 "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, tzimmermann <tzimmermann@suse.de>,
 airlied <airlied@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, daniels <daniels@collabora.com>,
 sergi.blanch.torne@collabora.com,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: vkms: kms_vblank@ts-continuation-dpms-suspend flake
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

There are some flake test reported for vkms driver testing in drm-ci.

# Board Name: vkms
# Failure Rate: 100
# IGT Version: 1.30-g04bedb923
# Linux Version: 6.14.0-rc4
kms_vblank@ts-continuation-dpms-suspend

DEBUG - Begin test kms_vblank@ts-continuation-dpms-suspend
[  199.805202] PM: Some devices failed to suspend, or early wake event 
detected
ERROR - Igt error: (kms_vblank:543) igt_core-WARNING: [cmd] rtcwake: 
write error
ERROR - Igt error: (kms_vblank:543) igt_aux-WARNING: rtcwake failed with 1
ERROR - Igt error: Check dmesg for further details.
ERROR - Igt error: (kms_vblank:543) igt_aux-CRITICAL: Test assertion 
failure function suspend_via_rtcwake, file ../lib/igt_aux.c:828:
ERROR - Igt error: (kms_vblank:543) igt_aux-CRITICAL: Failed assertion: 
ret == 0
ERROR - Igt error: (kms_vblank:543) igt_aux-CRITICAL: error: 1 != 0
ERROR - Igt error: Dynamic subtest pipe-A-Virtual-17 failed.
ERROR - Igt error: **** DEBUG ****
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: Virtual-17: 
set_pipe(A)
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: Virtual-17: 
Selecting pipe A
ERROR - Igt error: (kms_vblank:543) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1024, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
ERROR - Igt error: (kms_vblank:543) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=4096)
ERROR - Igt error: (kms_vblank:543) ioctl_wrappers-DEBUG: Test 
requirement passed: igt_has_fb_modifiers(fd)
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: Test requirement 
passed: plane_idx >= 0 && plane_idx < pipe->n_planes
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: A.0: 
plane_set_fb(50)
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: A.0: 
plane_set_size (1024x768)
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: A.0: 
fb_set_position(0,0)
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: A.0: 
fb_set_size(1024x768)
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: commit {
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: Test requirement 
passed: plane_idx >= 0 && plane_idx < pipe->n_planes
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display:     Fixing 
up initial rotation pipe A, plane 0
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: 
Virtual-17: SetCrtc pipe A, fb 50, src (0, 0), mode 1024x768
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: Test requirement 
passed: plane_idx >= 0 && plane_idx < pipe->n_planes
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display:     Fixing 
up initial rotation pipe A, plane 1
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: 
SetCursor pipe A, disabling
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: 
MoveCursor pipe A, (0, 0)
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: }
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: commit {
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: Test requirement 
passed: plane_idx >= 0 && plane_idx < pipe->n_planes
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: Test requirement 
passed: plane_idx >= 0 && plane_idx < pipe->n_planes
ERROR - Igt error: (kms_vblank:543) igt_kms-DEBUG: display: }
ERROR - Igt error: (kms_vblank:543) igt_aux-DEBUG: Test requirement 
passed: (power_dir = open("/sys/power", O_RDONLY)) >= 0
ERROR - Igt error: (kms_vblank:543) igt_aux-DEBUG: Test requirement 
passed: is_state_supported(power_dir, state)
ERROR - Igt error: (kms_vblank:543) igt_aux-DEBUG: Test requirement 
passed: test == SUSPEND_TEST_NONE || faccessat(power_dir, "pm_test", 
R_OK | W_OK, 0) == 0
ERROR - Igt error: (kms_vblank:543) igt_aux-DEBUG: Test requirement 
passed: !(state == SUSPEND_STATE_DISK && !igt_get_total_swap_mb())
ERROR - Igt error: (kms_vblank:543) igt_aux-DEBUG: Test requirement 
passed: ret == 0
ERROR - Igt error: (kms_vblank:543) igt_core-INFO: [cmd] rtcwake: 
assuming RTC uses UTC ...
ERROR - Igt error: rtcwake: wakeup from "mem" using /dev/rtc0 at Fri Mar 
  7 11:33:18 2025
ERROR - Igt error: (kms_vblank:543) igt_core-WARNING: [cmd] rtcwake: 
write error
ERROR - Igt error: (kms_vblank:543) igt_aux-WARNING: rtcwake failed with 1
ERROR - Igt error: Check dmesg for further details.
ERROR - Igt error: (kms_vblank:543) igt_aux-DEBUG: suspend_stats:
ERROR - Igt error: success: 2
ERROR - Igt error: fail: 2
ERROR - Igt error: failed_freeze: 0
ERROR - Igt error: failed_prepare: 0
ERROR - Igt error: failed_suspend: 2
ERROR - Igt error: failed_suspend_late: 0
ERROR - Igt error: failed_suspend_noirq: 0
ERROR - Igt error: failed_resume_noirq: 0
ERROR - Igt error: failed_resume_early: 0
ERROR - Igt error: failed_resume: 0
ERROR - Igt error: failures:
ERROR - Igt error:   last_failed_dev:	
ERROR - Igt error: 			
ERROR - Igt error:   last_failed_errno:	-16
ERROR - Igt error: 			-16
ERROR - Igt error:   last_failed_step:	suspend
ERROR - Igt error: 			suspend
ERROR - Igt error: (kms_vblank:543) igt_aux-CRITICAL: Test assertion 
failure function suspend_via_rtcwake, file ../lib/igt_aux.c:828:
ERROR - Igt error: (kms_vblank:543) igt_aux-CRITICAL: Failed assertion: 
ret == 0
ERROR - Igt error: (kms_vblank:543) igt_aux-CRITICAL: error: 1 != 0
ERROR - Igt error: (kms_vblank:543) igt_core-INFO: Stack trace:
ERROR - Igt error: (kms_vblank:543) igt_core-INFO:   #0 
../lib/igt_core.c:2055 __igt_fail_assert()
ERROR - Igt error: (kms_vblank:543) igt_core-INFO:   #1 
../lib/igt_aux.c:744 igt_system_suspend_autoresume()
ERROR - Igt error: (kms_vblank:543) igt_core-INFO:   #2 
../tests/kms_vblank.c:445 vblank_ts_cont()
ERROR - Igt error: (kms_vblank:543) igt_core-INFO:   #3 
/usr/include/x86_64-linux-gnu/bits/unistd.h:38 run_test()
ERROR - Igt error: (kms_vblank:543) igt_core-INFO:   #4 
../tests/kms_vblank.c:528 run_subtests()
ERROR - Igt error: (kms_vblank:543) igt_core-INFO:   #5 
../tests/kms_vblank.c:675 __igt_unique____real_main626()
ERROR - Igt error: (kms_vblank:543) igt_core-INFO:   #6 
../tests/kms_vblank.c:626 main()
ERROR - Igt error: (kms_vblank:543) igt_core-INFO:   #7 
[__libc_init_first+0x8a]
ERROR - Igt error: (kms_vblank:543) igt_core-INFO:   #8 
[__libc_start_main+0x85]
ERROR - Igt error: (kms_vblank:543) igt_core-INFO:   #9 [_start+0x21]
ERROR - Igt error: ****  END  ****
ERROR - Test kms_vblank@ts-continuation-dpms-suspend: Fail: See 
"/builds/vigneshraman/linux/results/igt.kms_vblank@ts-continuation-dpms-suspend.log"
DEBUG - End test kms_vblank@ts-continuation-dpms-suspend

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/72473690

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
