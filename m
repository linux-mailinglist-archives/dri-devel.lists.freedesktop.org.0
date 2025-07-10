Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BFBAFFF70
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034A010E854;
	Thu, 10 Jul 2025 10:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qTuhLJAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6266710E37F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752144056;
 bh=AWumJfF2mpoZuN4/hlJ970rZCmguvf8nWjFfyYovaEQ=;
 h=Date:To:Cc:From:Subject:From;
 b=qTuhLJAOx+z+BpPVfzdyzX1jmv28d2FCry4EagnZL76nFH9FF/htslzcF7xtmyuWc
 aGsY4Xty3esYxLkr73wpvL1d/2TMhHVkiWBYjoLddjsPB8T4wBobavQ8JKEYpve+pP
 GArYIaioVH3MyKkjO4o93ubqBvsPQKmLggN/hO7E7zkAM5G1V/t+I4zVE/shBdrJJu
 I39L56dn4DLBWMO6iwJIG7SB3skk43t+dgAIkyl5PqCT3V+drBn0+tQuw95Uj5YEW0
 rl3sAStBdq0xwmcSAVEvTsvzPUJcNxu2fY+AOLmZwsKNdlSCUx6QxTn1G5SrzYqnqk
 jpmheV8LNbpVA==
Received: from [192.168.50.250] (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F37EA17E0489;
 Thu, 10 Jul 2025 12:40:52 +0200 (CEST)
Message-ID: <ad9ce463-c803-4502-ae89-381a6b6eb19f@collabora.com>
Date: Thu, 10 Jul 2025 16:10:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>,
 sebastian.reichel@collabora.com, linux-arm-kernel@lists.infradead.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: rk3399-gru-kevin: kms_color@legacy-gamma flake
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

# Board Name: rk3399-gru-kevin
# Failure Rate: 40
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_color@legacy-gamma

(kms_color:1399) CRITICAL: Test assertion failure function 
run_gamma_degamma_tests_for_pipe, file ../tests/kms_color.c:787:
(kms_color:1399) CRITICAL: Failed assertion: test_t(data, data->primary)
Dynamic subtest pipe-A-eDP-1 failed.
**** DEBUG ****
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: !(pipe >= 
display->n_pipes || !display->pipes[pipe].enabled)
(kms_color:1399) igt_pipe_crc-DEBUG: Test requirement passed: dir >= 0
(kms_color:1399) igt_pipe_crc-DEBUG: Test requirement passed: 
fstatat(dir, "crtc-0/crc/control", &stat, 0) == 0
(kms_color:1399) DEBUG: Test requirement passed: pipe->n_planes >= 0
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: set_pipe(A)
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: Selecting pipe A
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: set_pipe(None)
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: Selecting pipe None
(kms_color:1399) DEBUG: Test requirement passed: 
pipe_output_combo_valid(data, p)
(kms_color:1399) DEBUG: Test requirement passed: legacy_lut_size > 0
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: set_pipe(A)
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: Selecting pipe A
(kms_color:1399) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_color:1399) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, 
pitch=9600)
(kms_color:1399) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_color:1399) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_color:1399) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
pitch=9600)
(kms_color:1399) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_fb(59)
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: commit {
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 0
(kms_color:1399) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
59, src (0, 0), mode 2400x1600
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 1
(kms_color:1399) igt_kms-DEBUG: display:     SetPlane pipe A, plane 1, 
disabling
(kms_color:1399) igt_kms-DEBUG: display:     SetProp plane A.1 
"rotation" to 0x1/1
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 2
(kms_color:1399) igt_kms-DEBUG: display:     SetPlane pipe A, plane 2, 
disabling
(kms_color:1399) igt_kms-DEBUG: display:     SetProp plane A.2 
"rotation" to 0x1/1
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 3
(kms_color:1399) igt_kms-DEBUG: display:     SetCursor pipe A, disabling
(kms_color:1399) igt_kms-DEBUG: display:     MoveCursor pipe A, (0, 0)
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe B, plane 0
(kms_color:1399) igt_kms-DEBUG: display:     SetCrtc pipe B, disabling
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe B, plane 1
(kms_color:1399) igt_kms-DEBUG: display:     SetCursor pipe B, disabling
(kms_color:1399) igt_kms-DEBUG: display:     MoveCursor pipe B, (0, 0)
(kms_color:1399) igt_kms-DEBUG: display: }
(kms_color:1399) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_fb(58)
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: commit {
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
58, src (0, 0), mode 2400x1600
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display: }
(kms_color:1399) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_fb(58)
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: commit {
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
58, src (0, 0), mode 2400x1600
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display: }
(kms_color:1399) igt_pipe_crc-DEBUG: CRC mismatch at index 0: 0x780 != 
0xcc65
(kms_color:1399) igt_kms-DEBUG: display: commit {
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display: }
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_fb(0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_size (0x0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_size(0x0)
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: set_pipe(None)
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: Selecting pipe None
(kms_color:1399) igt_kms-DEBUG: display: commit {
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     SetCrtc pipe A, disabling
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display: }
(kms_color:1399) CRITICAL: Test assertion failure function 
run_gamma_degamma_tests_for_pipe, file ../tests/kms_color.c:787:
(kms_color:1399) CRITICAL: Failed assertion: test_t(data, data->primary)
(kms_color:1399) igt_core-INFO: Stack trace:
(kms_color:1399) igt_core-INFO:   #0 ../lib/igt_core.c:2075 
__igt_fail_assert()
(kms_color:1399) igt_core-INFO:   #1 ../tests/kms_color.c:785 
run_tests_for_pipe()
(kms_color:1399) igt_core-INFO:   #2 ../tests/kms_color.c:1182 
__igt_unique____real_main1169()
(kms_color:1399) igt_core-INFO:   #3 ../tests/kms_color.c:1169 main()
(kms_color:1399) igt_core-INFO:   #4 [__libc_init_first+0x80]
(kms_color:1399) igt_core-INFO:   #5 [__libc_start_main+0x98]
(kms_color:1399) igt_core-INFO:   #6 [_start+0x30]

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79896647

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
