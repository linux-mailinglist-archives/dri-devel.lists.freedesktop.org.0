Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B585DB00268
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5587610E0D3;
	Thu, 10 Jul 2025 12:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XI8c4hGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B0C10E0D3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752151806;
 bh=hapXZ1CLJj9VVkddZ3yGM3MjfjYbRKQEZ8m4KIxSF8Y=;
 h=Date:To:Cc:From:Subject:From;
 b=XI8c4hGmOVLk7G+hUCnoIap8PCaiABZqR/L9XnkL9lkLnQixmh0MIaSwQisroj8w5
 ZY8x/uUzKFcFYTLvtPoj1dmlDwORgkox4JUHFMwMBIwB99UzBjFH5aa/id5Pf6LXSe
 6I0bSbz5wyMVaylLCesV3cbVUe2I8xYVt7xvYjC/ip4xWnF4aOYfOLwJ23CiV84rB3
 Vo7AFJ5TvMRhNeUP4puHk27nyu8e0lLrhuj/nKzlmLyiQkBu94fLWttg/1cJbeqUn0
 b8gVV2PfMD3IJDcngGvo3VJ4NczDdjr7TU9hBYE+gh7U0OOhYdUJ/9yNMDeAxKFH/y
 sKiDF5/0XUDsA==
Received: from [192.168.50.250] (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A97D17E0FD3;
 Thu, 10 Jul 2025 14:50:03 +0200 (CEST)
Message-ID: <7559dd68-c9dd-410f-880f-201679e2dd54@collabora.com>
Date: Thu, 10 Jul 2025 18:20:02 +0530
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
Subject: drm-ci: mt8173-elm-hana: kms_flip@blocking-wf_vblank flake
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
# Failure Rate: 20
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_flip@blocking-wf_vblank

02:13:44.625: DEBUG - Begin test kms_flip@blocking-wf_vblank
02:13:44.625: ERROR - Igt error: (kms_flip:275) CRITICAL: Test assertion 
failure function __run_test_on_crtc_set, file ../tests/kms_flip.c:1666:
02:13:44.625: ERROR - Igt error: (kms_flip:275) CRITICAL: Failed 
assertion: do_page_flip(o, o->fb_ids[1], 1) == 0
02:13:44.625: ERROR - Igt error: (kms_flip:275) CRITICAL: Last errno: 
16, Device or resource busy
02:13:44.625: ERROR - Igt error: (kms_flip:275) CRITICAL: error: -16 != 0
02:13:44.625: ERROR - Igt error: Dynamic subtest A-eDP1 failed.
02:13:44.625: ERROR - Igt error: **** DEBUG ****
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=5464)
02:13:44.625: ERROR - Igt error: (kms_flip:275) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=2, pitch=5464)
02:13:44.625: ERROR - Igt error: (kms_flip:275) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_kms-INFO: 
1366x768: 60 76420 1366 1502 1532 1592 768 776 788 800 0x48 0xa
02:13:44.625: ERROR - Igt error: (kms_flip:275) DEBUG: No stale events found
02:13:44.625: ERROR - Igt error: (kms_flip:275) CRITICAL: Test assertion 
failure function __run_test_on_crtc_set, file ../tests/kms_flip.c:1666:
02:13:44.625: ERROR - Igt error: (kms_flip:275) CRITICAL: Failed 
assertion: do_page_flip(o, o->fb_ids[1], 1) == 0
02:13:44.625: ERROR - Igt error: (kms_flip:275) CRITICAL: Last errno: 
16, Device or resource busy
02:13:44.625: ERROR - Igt error: (kms_flip:275) CRITICAL: error: -16 != 0
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_core-INFO: Stack trace:
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_core-INFO:   #0 
../lib/igt_core.c:2075 __igt_fail_assert()
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_core-INFO:   #1 
../tests/kms_flip.c:1643 run_test_on_crtc_set.constprop.0()
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_core-INFO:   #2 
../tests/kms_flip.c:1856 run_test()
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_core-INFO:   #3 
../tests/kms_flip.c:2105 __igt_unique____real_main2028()
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_core-INFO:   #4 
../tests/kms_flip.c:2028 main()
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_core-INFO:   #5 
[__libc_init_first+0x80]
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_core-INFO:   #6 
[__libc_start_main+0x98]
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_core-INFO:   #7 
[_start+0x30]
02:13:44.625: ERROR - Igt error: ****  END  ****
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_kms-CRITICAL: Test 
assertion failure function kmstest_set_connector_dpms, file 
../lib/igt_kms.c:2247:
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_kms-CRITICAL: Failed 
assertion: found_it
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_kms-CRITICAL: Last 
errno: 9, Bad file descriptor
02:13:44.625: ERROR - Igt error: (kms_flip:275) igt_kms-CRITICAL: DPMS 
property not found on 34
02:13:44.625: ERROR - Test kms_flip@blocking-wf_vblank: Fail: See 
"/results/igt.kms_flip@blocking-wf_vblank.log"

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79872311

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
