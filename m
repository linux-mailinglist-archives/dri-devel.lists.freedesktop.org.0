Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02AB0019A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E417B10E380;
	Thu, 10 Jul 2025 12:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aWZ3WMi9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525E310E380
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 12:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752150245;
 bh=AZPm53jrNoLfHebJRkqiB3Dkh1nnJmHOSVi/px8SSXU=;
 h=Date:To:Cc:From:Subject:From;
 b=aWZ3WMi9AQ0+PQwamNgwwOKYqVHE5i0jS1/dsvJlH/qvujExjcXnpcPR7ZRs2Y9Qp
 3piMWhmACY1vV49+4IWm2DpLB7KKCSjTROt5BrQUx9PiAeyN3ukztHr0Pknsz1LoE5
 b59YIrzac5VTtEcpx7qI07JXCIIoWSTO9+/dDWanlXbafuDOOCCLejwOAX7GWkhOWW
 iQ9xaZnevQIVqi+wY9PEGmrJNFjJOiVthr/HLg45h4Z5Xb32I94R3+mD6tb1lgJgjg
 vBZJHcDnFlZW4WFRF3YizOL9BaNSkfccGBKGTWqi+U6GnIXaZEHXZD9mT8ZF1L3oAr
 P5UNxgUX/C5xw==
Received: from [192.168.50.250] (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D16F17E0FC7;
 Thu, 10 Jul 2025 14:24:01 +0200 (CEST)
Message-ID: <81e13fcc-d916-4eb8-91cd-f74f64f53f72@collabora.com>
Date: Thu, 10 Jul 2025 17:53:59 +0530
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
Subject: drm-ci: rk3288-veyron-jaq: kms_flip@flip-vs-dpms-on-nop-interruptible
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

# Board Name: rk3288-veyron-jaq
# Failure Rate: 40
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_flip@flip-vs-dpms-on-nop-interruptible

02:09:26.564: DEBUG - Begin test kms_flip@flip-vs-dpms-on-nop-interruptible
02:09:26.564: ERROR - Igt error: (kms_flip:764) CRITICAL: Test assertion 
failure function calibrate_ts, file ../tests/kms_flip.c:1455:
02:09:31.611: ERROR - Igt error: (kms_flip:764) CRITICAL: Failed 
assertion: 3 * stddev / mean < 0.005
02:09:31.611: ERROR - Igt error: (kms_flip:764) CRITICAL: Last errno: 4, 
Interrupted system call
02:09:31.611: ERROR - Igt error: Dynamic subtest B-eDP1 failed.
02:09:31.611: ERROR - Igt error: **** DEBUG ****
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=5504)
02:09:31.611: ERROR - Igt error: (kms_flip:764) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=2, pitch=5504)
02:09:31.611: ERROR - Igt error: (kms_flip:764) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_kms-INFO: 
1366x768: 58 74250 1366 1502 1532 1592 768 776 788 800 0x48 0xa
02:09:31.611: ERROR - Igt error: (kms_flip:764) DEBUG: No stale events found
02:09:31.611: ERROR - Igt error: (kms_flip:764) INFO: Expected 
frametime: 17153us; measured 17152.9us +- 30.262us accuracy 0.53%
02:09:31.611: ERROR - Igt error: (kms_flip:764) CRITICAL: Test assertion 
failure function calibrate_ts, file ../tests/kms_flip.c:1455:
02:09:31.611: ERROR - Igt error: (kms_flip:764) CRITICAL: Failed 
assertion: 3 * stddev / mean < 0.005
02:09:31.611: ERROR - Igt error: (kms_flip:764) CRITICAL: Last errno: 4, 
Interrupted system call
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_core-INFO: Stack trace:
02:09:31.611: ERROR - Igt error: ****  END  ****
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_kms-CRITICAL: Test 
assertion failure function kmstest_set_connector_dpms, file 
../lib/igt_kms.c:2247:
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_kms-CRITICAL: Failed 
assertion: found_it
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_kms-CRITICAL: Last 
errno: 9, Bad file descriptor
02:09:31.611: ERROR - Igt error: (kms_flip:764) igt_kms-CRITICAL: DPMS 
property not found on 52
02:09:31.611: ERROR - Test kms_flip@flip-vs-dpms-on-nop-interruptible: 
Crash: See "/results/igt.kms_flip@flip-vs-dpms-on-nop-interruptible.log"
02:09:31.611: DEBUG - End test kms_flip@flip-vs-dpms-on-nop-interruptible

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79872339

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
