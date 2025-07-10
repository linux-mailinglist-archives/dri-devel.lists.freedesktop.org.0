Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD6B0033F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 15:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4A910E8DD;
	Thu, 10 Jul 2025 13:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OlQ6FF2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B0710E8DD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 13:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752153808;
 bh=nAVWwKhETar1cgLGiHmoLRp6y0KAvtrMfzV3joAeyo0=;
 h=Date:To:Cc:From:Subject:From;
 b=OlQ6FF2x05vIjafY+9eGatkIEnpsK9geHeQUNkXcJwMwkcu2/PVMZfaJqF6lrFLUl
 QYxCjulj692ZfpM2LdlbW7oLY4tj3ac0LMdv87TNXgwLsp0dPxrtCfYsb5Et782hFf
 22BmO5RWiAoqWWqUg2jXsx/ljVlGOJIat7xf00C86MWUWf7Fyqd5j8e8vmsSOwoGnD
 ihnqGaJXEN3zIm7lqSjR5R7g0wLiSlAgVSuEgzhWW5JpXkXs5/Y+2TbJvLdLeqX+IM
 rJG6ZqoJoiZFUTEfpMxV+UMvGze2lO8JQEttr1uod8xiwHisaNvFqfHFn9g/7cIyfa
 h4VmEWIJQ26PA==
Received: from [192.168.50.250] (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E7C7117E0523;
 Thu, 10 Jul 2025 15:23:26 +0200 (CEST)
Message-ID: <4c9e1501-52cd-4659-a894-8a2ac58c3996@collabora.com>
Date: Thu, 10 Jul 2025 18:53:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 nfraprado@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: mt8173-elm-hana: kms_flip@absolute-wf_vblank flake
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

There is a flake test reported for the mediatek driver in drm-ci.

# Board Name: mt8173-elm-hana
# Failure Rate: 40
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_flip@absolute-wf_vblank

07:39:19.323: DEBUG - Begin test kms_flip@absolute-wf_vblank
07:39:19.323: ERROR - Igt error: (kms_flip:962) CRITICAL: Test assertion 
failure function __run_test_on_crtc_set, file ../tests/kms_flip.c:1666:
07:39:29.405: ERROR - Igt error: (kms_flip:962) CRITICAL: Failed 
assertion: do_page_flip(o, o->fb_ids[1], 1) == 0
07:39:29.405: ERROR - Igt error: (kms_flip:962) CRITICAL: Last errno: 
16, Device or resource busy
07:39:29.405: ERROR - Igt error: (kms_flip:962) CRITICAL: error: -16 != 0
07:39:29.405: ERROR - Igt error: Dynamic subtest A-eDP1 failed.
07:39:29.405: ERROR - Igt error: **** DEBUG ****
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=5464)
07:39:29.405: ERROR - Igt error: (kms_flip:962) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=2, pitch=5464)
07:39:29.405: ERROR - Igt error: (kms_flip:962) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_kms-INFO: 
1366x768: 60 76420 1366 1502 1532 1592 768 776 788 800 0x48 0xa
07:39:29.405: ERROR - Igt error: (kms_flip:962) DEBUG: No stale events found
07:39:29.405: ERROR - Igt error: (kms_flip:962) CRITICAL: Test assertion 
failure function __run_test_on_crtc_set, file ../tests/kms_flip.c:1666:
07:39:29.405: ERROR - Igt error: (kms_flip:962) CRITICAL: Failed 
assertion: do_page_flip(o, o->fb_ids[1], 1) == 0
07:39:29.405: ERROR - Igt error: (kms_flip:962) CRITICAL: Last errno: 
16, Device or resource busy
07:39:29.405: ERROR - Igt error: (kms_flip:962) CRITICAL: error: -16 != 0
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_core-INFO: Stack trace:
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_core-INFO:   #0 
../lib/igt_core.c:2075 __igt_fail_assert()
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_core-INFO:   #1 
../tests/kms_flip.c:1643 run_test_on_crtc_set.constprop.0()
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_core-INFO:   #2 
../tests/kms_flip.c:1856 run_test()
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_core-INFO:   #3 
../tests/kms_flip.c:2105 __igt_unique____real_main2028()
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_core-INFO:   #4 
../tests/kms_flip.c:2028 main()
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_core-INFO:   #5 
[__libc_init_first+0x80]
07:39:29.405: ERROR - Igt error: (kms_flip:962) igt_core-INFO:   #6 
[__libc_start_main+0x98]
07:39:29.406: ERROR - Igt error: (kms_flip:962) igt_core-INFO:   #7 
[_start+0x30]
07:39:29.406: ERROR - Igt error: ****  END  ****
07:39:29.406: ERROR - Igt error: (kms_flip:962) igt_kms-CRITICAL: Test 
assertion failure function kmstest_set_connector_dpms, file 
../lib/igt_kms.c:2247:
07:39:29.406: ERROR - Igt error: (kms_flip:962) igt_kms-CRITICAL: Failed 
assertion: found_it
07:39:29.406: ERROR - Igt error: (kms_flip:962) igt_kms-CRITICAL: Last 
errno: 9, Bad file descriptor
07:39:29.406: ERROR - Igt error: (kms_flip:962) igt_kms-CRITICAL: DPMS 
property not found on 34
07:39:29.406: ERROR - Test kms_flip@absolute-wf_vblank: Fail: See 
"/results/igt.kms_flip@absolute-wf_vblank.log"

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79879662

Please could you have a look at these test results and let us know if 
you need more information to debug. Thank you.

Regards,
Vignesh
