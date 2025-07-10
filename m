Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4299CB00322
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 15:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921BA10E215;
	Thu, 10 Jul 2025 13:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FvE2fIkc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46E810E8D5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752153384;
 bh=EPc+tZ1ozq5uCigJRh2UyBKKKKtf8aYrTug5gBogqBs=;
 h=Date:To:Cc:From:Subject:From;
 b=FvE2fIkcElyy6m+NVkrexvlXoWfkUhzuHFX0r3R0X/mXKXf9MVafAzEVDMisYTTfe
 B4EyYCLVqe8DrRM1Oq8mubYwg3/wZxtS+Lx24o5HGbLUQ4iYOmhk5O6FD1gnaPEBuW
 8J98R23vetrI/+U8Qdu7NGbRxiGC8F+bkaLzwLl3q5zi+OvuOaWHLsSs67QzLyNbZL
 mHpBWOuFIU1AbdjVM0HfhyHW007parGEx6BT7DVaFRyK2NG9gOQoVTHO9G+boFCQZP
 r9MkPNBESK7o1YqjieKENw1GyddfnHp/rNCalsJfMZX1p+KT1zuD9NJ35xEe4hDuLE
 5lROYKkVjprYw==
Received: from [192.168.50.250] (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F07517E0EBD;
 Thu, 10 Jul 2025 15:16:22 +0200 (CEST)
Message-ID: <30b3f8b0-3409-4329-bb60-b6287e1a439d@collabora.com>
Date: Thu, 10 Jul 2025 18:46:20 +0530
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
Subject: drm-ci: mt8173-elm-hana:
 kms_atomic_transition@plane-all-modeset-transition-internal-panels flake
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
# Failure Rate: 60
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_atomic_transition@plane-all-modeset-transition-internal-panels

07:35:22.411: DEBUG - Begin test 
kms_atomic_transition@plane-all-modeset-transition-internal-panels
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
Test assertion failure function wait_for_transition, file 
../tests/kms_atomic_transition.c:539:
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
Failed assertion: fd_completed(data->drm_fd)
07:35:22.411: ERROR - Igt error: Dynamic subtest pipe-A-eDP-1 failed.
07:35:22.411: ERROR - Igt error: **** DEBUG ****
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 83
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: }
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: commit {
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.0, fb 82
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x5560000/89522176
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x556/1366
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x300/768
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x52/82
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x4000000/67108864
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 83
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: }
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: eDP-1: set_pipe(A)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: eDP-1: Selecting pipe A
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: plane_set_fb(0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: plane_set_size (0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: fb_set_position(0,0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: fb_set_size(0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: plane_set_fb(0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: plane_set_size (0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: fb_set_size(0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: plane_set_fb(0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: plane_set_size (0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: fb_set_position(0,0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: fb_set_size(0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: commit {
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x55/85
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: Pipe A: Setting property "ACTIVE" to 0x1/1
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     eDP-1: preparing atomic, pipe: A
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: eDP-1: Setting property "CRTC_ID" to 0x39/57
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: }
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) DEBUG: 
Retrieved vblank seq: 4302 on unk
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: plane_set_fb(82)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: plane_set_size (1366x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: fb_set_size(1366x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: fb_set_size(1366x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: plane_set_size (1366x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: plane_set_fb(84)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: plane_set_size (1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: fb_set_position(0,0)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: fb_set_size(1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: fb_set_size(1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: plane_set_size (1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: plane_set_fb(84)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: plane_set_size (1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: fb_set_size(1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: fb_set_size(1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: plane_set_size (1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: plane_set_fb(83)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: plane_set_size (512x512)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: fb_set_position(0,0)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: fb_set_size(512x512)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: fb_set_size(512x512)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: plane_set_size (512x512)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: commit {
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x51/81
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.0, fb 82
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x5560000/89522176
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x556/1366
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x300/768
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x52/82
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x39/57
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 84
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x4000000/67108864
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 84
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 83
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: }
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
Test assertion failure function wait_for_transition, file 
../tests/kms_atomic_transition.c:539:
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
Failed assertion: fd_completed(data->drm_fd)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO: Stack trace:
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #1 ../tests/kms_atomic_transition.c:536 
wait_for_transition.constprop.0()
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #2 ../tests/kms_atomic_transition.c:715 
__igt_unique____real_main1122()
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #3 ../tests/kms_atomic_transition.c:1122 main()
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #4 [__libc_init_first+0x80]
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #5 [__libc_start_main+0x98]
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #6 [_start+0x30]
07:35:22.412: ERROR - Igt error: ****  END  ****
07:35:22.412: ERROR - Test 
kms_atomic_transition@plane-all-modeset-transition-internal-panels: 
Fail: See 
"/results/igt.kms_atomic_transition@plane-all-modeset-transition-internal-panels.log"
07:35:22.412: DEBUG - End test 
kms_atomic_transition@plane-all-modeset-transition-internal-panels

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79879662

Please could you have a look at these test results and let us know if 
you need more information to debug. Thank you.

Regards,
Vignesh
