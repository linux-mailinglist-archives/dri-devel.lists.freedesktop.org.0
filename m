Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1384A5F135
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 11:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEE810E836;
	Thu, 13 Mar 2025 10:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qN6R7G1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8C610E842
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 10:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741862750;
 bh=2QAhljX19/TsHGbFWMYLcAbGHsnxAfWMnvajxitXSZk=;
 h=Date:To:Cc:From:Subject:From;
 b=qN6R7G1FjD/LDJMUDXM0djo6izSebSSu6MtpTJ5swlgKmHqxX8Y6izNnUjk70Ecbk
 ZYG9jrbcRdFze7d1NdinQQJnGlVhmTxF5ttLm+NxQU1COLCJA9ecaGKLlTHWjubZ+r
 XNUitdjsf3iSCZGVeQIkuOYP56pbtmpiD9WVfEtgbZiqK2bkK4pZGyxsNB8fKyRj3f
 N1x86Po6GfL1koWAfPyLFHz08LutrVtS756k5rL4T54Ype+g8lBYTS4vbmBymgCnAc
 vh+W9GJ3IrWs16NZbew75b0TeaFGevEwMzHrmHmzXtPyLRF4RoQBlO2n8DPM73T/nf
 LTPjdBpky4QFw==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AE34117E0E01;
 Thu, 13 Mar 2025 11:45:47 +0100 (CET)
Message-ID: <2364a6bf-e6bc-4741-8c78-cea8bdb06e03@collabora.com>
Date: Thu, 13 Mar 2025 16:15:46 +0530
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
Subject: drm-ci: vkms: kms_flip@modeset-vs-vblank-race flake
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
# Failure Rate: 20
# IGT Version: 1.30-g04bedb923
# Linux Version: 6.14.0-rc4
kms_flip@modeset-vs-vblank-race

DEBUG - Begin test kms_flip@modeset-vs-vblank-race
ERROR - Igt error: (kms_flip:1250) CRITICAL: Test assertion failure 
function run_test_step, file ../tests/kms_flip.c:979:
ERROR - Igt error: (kms_flip:1250) CRITICAL: Failed assertion: end - 
start > 0.9 * actual_frame_time(o) && end - start < 2.6 * 
actual_frame_time(o)
ERROR - Igt error: (kms_flip:1250) CRITICAL: wait for two vblanks took 
47374 usec (frame time 16665.600000 usec)
ERROR - Igt error: Dynamic subtest A-Virtual17 failed.
ERROR - Igt error: **** DEBUG ****
ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1024, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=4096)
ERROR - Igt error: (kms_flip:1250) ioctl_wrappers-DEBUG: Test 
requirement passed: igt_has_fb_modifiers(fd)
ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1024, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=2, pitch=4096)
ERROR - Igt error: (kms_flip:1250) ioctl_wrappers-DEBUG: Test 
requirement passed: igt_has_fb_modifiers(fd)
ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG: Test requirement 
passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG: Test requirement 
passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
ERROR - Igt error: (kms_flip:1250) igt_kms-INFO:   1024x768: 60 65000 
1024 1048 1184 1344 768 771 777 806 0x48 0xa
ERROR - Igt error: (kms_flip:1250) DEBUG: No stale events found
ERROR - Igt error: (kms_flip:1250) INFO: Expected frametime: 16666us; 
measured 16665.6us +- 0.500us accuracy 0.01%
ERROR - Igt error: (kms_flip:1250) CRITICAL: Test assertion failure 
function run_test_step, file ../tests/kms_flip.c:979:
ERROR - Igt error: (kms_flip:1250) CRITICAL: Failed assertion: end - 
start > 0.9 * actual_frame_time(o) && end - start < 2.6 * 
actual_frame_time(o)
ERROR - Igt error: (kms_flip:1250) CRITICAL: wait for two vblanks took 
47374 usec (frame time 16665.600000 usec)
ERROR - Igt error: (kms_flip:1250) igt_core-INFO: Stack trace:
ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #0 
../lib/igt_core.c:2055 __igt_fail_assert()
ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #1 
../tests/kms_flip.c:1023 run_test_on_crtc_set.constprop.0()
ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #2 
../tests/kms_flip.c:1845 run_test()
ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #3 
../tests/kms_flip.c:2078 __igt_unique____real_main2001()
ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #4 
../tests/kms_flip.c:2001 main()
ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #5 
[__libc_init_first+0x8a]
ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #6 
[__libc_start_main+0x85]
ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #7 [_start+0x21]
ERROR - Igt error: ****  END  ****
ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: Test assertion 
failure function kmstest_set_connector_dpms, file ../lib/igt_kms.c:2246:
ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: Failed assertion: 
found_it
ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: Last errno: 9, Bad 
file descriptor
ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: DPMS property not 
found on 39
ERROR - Test kms_flip@modeset-vs-vblank-race: Fail: See 
"/builds/vigneshraman/linux/results/igt.kms_flip@modeset-vs-vblank-race.log"
DEBUG - End test kms_flip@modeset-vs-vblank-race

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/72473690

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
