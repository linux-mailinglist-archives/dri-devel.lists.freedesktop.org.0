Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE0CAFFFF8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 13:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF95410E36F;
	Thu, 10 Jul 2025 11:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WM4gGtMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847C010E36F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752145276;
 bh=/xuT9FcZLRXOMmJvcEkbLxs/9S5yzO+NUtC3euhyfLM=;
 h=Date:To:Cc:From:Subject:From;
 b=WM4gGtMwfRJMT7QJvIQAs/ax4RBrgHDzrtztK1tOmdGCUm2TNLwtuTPfxD6J94eTI
 Q3VrD9ZC7faFoeMgmzgHI48fa7bVQROor6LYSkX3/SXQySvPKvZlrS6wsGnM9x+0CI
 T6MySWowO4/7IYlsoddfn0pFbAYv+OiYJ94xspZQ2/saRhI3cnWihI9YCFI7CaeVj9
 XIp9KIsA86ryprDS2lIZCRiOLESKVxjU9A36LDeSPBGSGoayNyW7jaJ4VbscrX/ws7
 YaXSMvr/WrG4Gd6ifGz833vAKWjI5TIuUfgrSUFGKXbAo+qox2Mc+Fk3+Oci2X3y9o
 XrdJk8s8yGE4A==
Received: from [192.168.50.250] (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DE45817E0FB8;
 Thu, 10 Jul 2025 13:01:12 +0200 (CEST)
Message-ID: <d790db5f-a1ba-47f9-9af0-d3287ef3274c@collabora.com>
Date: Thu, 10 Jul 2025 16:31:10 +0530
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
Subject: drm-ci: rk3399-gru-kevin: kms_bw@linear-tiling-2-displays-3840x2160p
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

# Board Name: rk3399-gru-kevin
# Failure Rate: 20
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_bw@linear-tiling-2-displays-3840x2160p

13:36:54.352: DEBUG - Begin test kms_bw@linear-tiling-2-displays-3840x2160p
13:36:54.352: ERROR - Igt error: (kms_bw:511) igt_pipe_crc-CRITICAL: 
Test assertion failure function igt_pipe_crc_start, file 
../lib/igt_pipe_crc.c:387:
13:37:00.810: [  119.244188] Console: switching to colour dummy device 80x25
13:37:00.810: [  119.250844] [IGT] kms_frontbuffer_tracking: executing
13:37:00.810: [  119.299086] [IGT] kms_frontbuffer_tracking: exiting, ret=77
13:37:00.811: [  119.337091] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  119.540148] Console: switching to colour dummy device 80x25
13:37:00.811: [  119.546800] [IGT] kms_frontbuffer_tracking: executing
13:37:00.811: [  119.599624] [IGT] kms_frontbuffer_tracking: exiting, ret=77
13:37:00.811: [  119.637274] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  119.855295] Console: switching to colour dummy device 80x25
13:37:00.811: [  119.861941] [IGT] prime_mmap_kms: executing
13:37:00.811: [  119.914621] [IGT] prime_mmap_kms: exiting, ret=77
13:37:00.811: [  119.954437] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  120.140102] Console: switching to colour dummy device 80x25
13:37:00.811: [  120.146721] [IGT] kms_frontbuffer_tracking: executing
13:37:00.811: [  120.199174] [IGT] kms_frontbuffer_tracking: exiting, ret=77
13:37:00.811: [  120.253612] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  120.443887] Console: switching to colour dummy device 80x25
13:37:00.811: [  120.450540] [IGT] kms_frontbuffer_tracking: executing
13:37:00.811: [  120.498957] [IGT] kms_frontbuffer_tracking: exiting, ret=77
13:37:00.811: [  120.536557] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  120.744633] Console: switching to colour dummy device 80x25
13:37:00.811: [  120.751295] [IGT] kms_frontbuffer_tracking: executing
13:37:00.811: [  120.799279] [IGT] kms_frontbuffer_tracking: exiting, ret=77
13:37:00.811: [  120.836861] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  121.044480] Console: switching to colour dummy device 80x25
13:37:00.811: [  121.051159] [IGT] kms_psr: executing
13:37:00.811: [  121.097706] [IGT] kms_psr: exiting, ret=77
13:37:00.811: [  121.136584] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  121.340108] Console: switching to colour dummy device 80x25
13:37:00.811: [  121.346761] [IGT] kms_bw: executing
13:37:00.811: [  121.359019] [IGT] kms_bw: starting subtest 
linear-tiling-16-displays-1920x1080p
13:37:00.811: [  121.367870] [IGT] kms_bw: finished subtest 
linear-tiling-16-displays-1920x1080p, SKIP
13:37:00.811: [  121.377132] [IGT] kms_bw: exiting, ret=77
13:37:00.811: [  121.391115] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  121.595756] Console: switching to colour dummy device 80x25
13:37:00.811: [  121.602455] [IGT] kms_flip_tiling: executing
13:37:00.811: [  121.647430] [IGT] kms_flip_tiling: exiting, ret=77
13:37:00.811: [  121.686488] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  121.897990] Console: switching to colour dummy device 80x25
13:37:00.811: [  121.904522] [IGT] kms_psr: executing
13:37:00.811: [  121.947315] [IGT] kms_psr: exiting, ret=77
13:37:00.811: [  121.987832] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  122.196397] Console: switching to colour dummy device 80x25
13:37:00.811: [  122.203075] [IGT] kms_bw: executing
13:37:00.811: [  122.214260] [IGT] kms_bw: starting subtest 
linear-tiling-2-displays-1920x1080p
13:37:00.811: [  122.973646] panel-edp edp-panel: Skipping disable of 
already disabled panel
13:37:00.811: [  123.267344] [IGT] kms_bw: finished subtest 
linear-tiling-2-displays-1920x1080p, FAIL
13:37:00.811: [  123.277038] [IGT] kms_bw: exiting, ret=98
13:37:00.811: [  123.299578] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  124.061570] panel-edp edp-panel: Skipping disable of 
already disabled panel
13:37:00.811: [  124.499431] Console: switching to colour dummy device 80x25
13:37:00.811: [  124.505916] [IGT] kms_pm_dc: executing
13:37:00.811: [  124.562298] [IGT] kms_pm_dc: exiting, ret=77
13:37:00.811: [  124.601588] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  124.775272] Console: switching to colour dummy device 80x25
13:37:00.811: [  124.781724] [IGT] kms_color: executing
13:37:00.811: [  124.790024] [IGT] kms_color: starting subtest 
ctm-blue-to-red
13:37:00.811: [  124.796739] [IGT] kms_color: starting dynamic subtest 
pipe-A-eDP-1
13:37:00.811: [  124.804622] [IGT] kms_color: finished subtest 
pipe-A-eDP-1, SKIP
13:37:00.811: [  124.811521] [IGT] kms_color: starting dynamic subtest 
pipe-B-eDP-1
13:37:00.811: [  124.819353] [IGT] kms_color: finished subtest 
pipe-B-eDP-1, SKIP
13:37:00.811: [  124.826253] [IGT] kms_color: finished subtest 
ctm-blue-to-red, SKIP
13:37:00.811: [  124.844302] [IGT] kms_color: exiting, ret=77
13:37:00.811: [  124.881434] Console: switching to colour frame buffer 
device 300x100
13:37:00.811: [  125.084817] Console: switching to colour dummy device 80x25
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_pipe_crc-CRITICAL: 
Failed assertion: pipe_crc->crc_fd != -1
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_pipe_crc-CRITICAL: 
Last errno: 5, Input/output error
13:37:00.813: ERROR - Igt error: Subtest 
linear-tiling-2-displays-3840x2160p failed.
13:37:00.813: ERROR - Igt error: **** DEBUG ****
13:37:00.813: ERROR - Igt error: (kms_bw:511) DEBUG: Test requirement 
passed: !(pipe >= num_pipes)
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Test 
requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Test 
requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
13:37:00.813: ERROR - Igt error: (kms_bw:511) DEBUG: Test requirement 
passed: data->output[0]
13:37:00.813: ERROR - Igt error: (kms_bw:511) DEBUG: Test requirement 
passed: !(physical && pipe >= data->connected_outputs)
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3840, height=2160, 
format=XR24(0x34325258), modifier=0x0, size=0)
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=15360)
13:37:00.813: ERROR - Igt error: (kms_bw:511) ioctl_wrappers-DEBUG: Test 
requirement passed: igt_has_fb_modifiers(fd)
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
eDP-1: set_pipe(A)
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
eDP-1: Selecting pipe A
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
A.0: plane_set_fb(58)
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
A.0: plane_set_size (3840x2160)
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
A.0: fb_set_position(0,0)
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
A.0: fb_set_size(3840x2160)
13:37:00.813: ERROR - Igt error: (kms_bw:511) INFO: Assigning pipe A to 
output eDP-1 with mode 3840x2160p
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
commit {
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe A: 
Setting property "GAMMA_LUT" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe A: 
Setting property "MODE_ID" to 0x3b/59
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe A: 
Setting property "ACTIVE" to 0x1/1
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe A: 
Setting property "VRR_ENABLED" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: A.0, fb 58
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_W" to 0xf000000/251658240
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_H" to 0x8700000/141557760
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_W" to 0xf00/3840
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_H" to 0x870/2160
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "FB_ID" to 0x3a/58
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_ID" to 0x27/39
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "rotation" to 0x1/1
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: A.1, fb 0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "FB_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "rotation" to 0x1/1
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: A.2, fb 0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "FB_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "rotation" to 0x1/1
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: A.3, fb 0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "FB_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "rotation" to 0x1/1
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe B: 
Setting property "GAMMA_LUT" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe B: 
Setting property "MODE_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe B: 
Setting property "ACTIVE" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe B: 
Setting property "VRR_ENABLED" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: B.0, fb 0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "FB_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "rotation" to 0x1/1
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: B.1, fb 0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "FB_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "rotation" to 0x1/1
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  eDP-1: preparing atomic, pipe: A
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: eDP-1: 
Setting property "CRTC_ID" to 0x27/39
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: }
13:37:00.813: ERROR - Igt error: (kms_bw:511) DEBUG: Test requirement 
passed: !(ret != 0)
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
commit {
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe A: 
Setting property "GAMMA_LUT" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe A: 
Setting property "MODE_ID" to 0x3b/59
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe A: 
Setting property "ACTIVE" to 0x1/1
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe A: 
Setting property "VRR_ENABLED" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: A.0, fb 58
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_W" to 0xf000000/251658240
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_H" to 0x8700000/141557760
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_W" to 0xf00/3840
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_H" to 0x870/2160
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "FB_ID" to 0x3a/58
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_ID" to 0x27/39
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.0: 
Setting property "rotation" to 0x1/1
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: A.1, fb 0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_X" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_W" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_H" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "FB_ID" to 0x0/0
13:37:00.813: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_ID" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.1: 
Setting property "rotation" to 0x1/1
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: A.2, fb 0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_X" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_Y" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_W" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_H" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_X" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_W" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_H" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "FB_ID" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_ID" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.2: 
Setting property "rotation" to 0x1/1
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: A.3, fb 0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_X" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_Y" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_W" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_H" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_X" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_W" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_H" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "FB_ID" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_ID" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane A.3: 
Setting property "rotation" to 0x1/1
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe B: 
Setting property "GAMMA_LUT" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe B: 
Setting property "MODE_ID" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe B: 
Setting property "ACTIVE" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: Pipe B: 
Setting property "VRR_ENABLED" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: B.0, fb 0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_X" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_Y" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_W" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_H" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_X" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_W" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_H" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "FB_ID" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_ID" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.0: 
Setting property "rotation" to 0x1/1
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  populating plane data: B.1, fb 0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_X" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_Y" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_W" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_H" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_X" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_Y" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_W" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_H" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "FB_ID" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_ID" to 0x0/0
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: plane B.1: 
Setting property "rotation" to 0x1/1
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: 
  eDP-1: preparing atomic, pipe: A
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: eDP-1: 
Setting property "CRTC_ID" to 0x27/39
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_kms-DEBUG: display: }
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_pipe_crc-CRITICAL: 
Test assertion failure function igt_pipe_crc_start, file 
../lib/igt_pipe_crc.c:387:
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_pipe_crc-CRITICAL: 
Failed assertion: pipe_crc->crc_fd != -1
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_pipe_crc-CRITICAL: 
Last errno: 5, Input/output error
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_core-INFO: Stack trace:
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_core-INFO:   #0 
../lib/igt_core.c:2075 __igt_fail_assert()
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_core-INFO:   #1 
../lib/igt_pipe_crc.c:433 igt_pipe_crc_get_crcs()
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_core-INFO:   #2 
../lib/igt_pipe_crc.c:592 igt_pipe_crc_collect_crc()
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_core-INFO:   #3 
../tests/kms_bw.c:247 run_test_linear_tiling()
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_core-INFO:   #4 
../tests/kms_bw.c:285 __igt_unique____real_main262()
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_core-INFO:   #5 
../tests/kms_bw.c:262 main()
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_core-INFO:   #6 
[__libc_init_first+0x80]
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_core-INFO:   #7 
[__libc_start_main+0x98]
13:37:00.814: ERROR - Igt error: (kms_bw:511) igt_core-INFO:   #8 
[_start+0x30]
13:37:00.814: ERROR - Igt error: ****  END  ****
13:37:00.814: ERROR - Test kms_bw@linear-tiling-2-displays-3840x2160p: 
Fail: See "/results/igt.kms_bw@linear-tiling-2-displays-3840x2160p.log"
13:37:00.814: DEBUG - End test kms_bw@linear-tiling-2-displays-3840x2160p

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/80007318

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
