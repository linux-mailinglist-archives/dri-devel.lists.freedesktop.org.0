Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED075A5F0AA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 11:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9F610E83D;
	Thu, 13 Mar 2025 10:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VHRbxG4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074D10E838
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741861482;
 bh=OMG5p9c82Fy88EBZQ+5+Q+IWbNxzgwDKnhNWi5zvF8c=;
 h=Date:To:Cc:From:Subject:From;
 b=VHRbxG4v4NT3MoyLCgq0dGvtApSMj4+sKXpMQjo0cD3MOJ1VkFj1v1KTp7xR8xRpI
 O0qFo3WyRbhYZVmQ1e79X+ZBUCh3tHkrSLiGdZ3h1qyOAVwedGbs8W7val7fYZt8uu
 bVolbmKEmDGE/mQoicF2q/jK+3w3tAuMnfdc4edWmgElpmGxP2Nelu2lk8bH7uoewF
 cnmiUBJYQkxqSf1DoUw2XfFeCCLtqtv23rkncdMW2LJXD7ohsmMF5/QphjWOYqs70s
 lQsFZ61G7jmlz60GXZVajDawzS6Dg5LRY6ARXrwyXHbhqETsPU0zOdWwXvlCnNWdmD
 jtDz0o+uASunA==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 10BF517E0F86;
 Thu, 13 Mar 2025 11:24:38 +0100 (CET)
Message-ID: <eece9a80-42f3-41f4-86cc-69d8a51b976a@collabora.com>
Date: Thu, 13 Mar 2025 15:54:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>,
 sebastian.reichel@collabora.com, linux-arm-kernel@lists.infradead.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: rockchip:
 kms_bw@connected-linear-tiling-1-displays-2160x1440p flake
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
# IGT Version: 1.30-g04bedb923
# Linux Version: 6.14.0-rc4
kms_bw@connected-linear-tiling-1-displays-2160x1440p

11:33:40.013: DEBUG - Begin test 
kms_bw@connected-linear-tiling-1-displays-2160x1440p
11:33:40.013: ERROR - Igt error: (kms_bw:273) igt_pipe_crc-CRITICAL: 
Test assertion failure function igt_pipe_crc_start, file 
../lib/igt_pipe_crc.c:387:
11:33:45.115: [   69.768463] lr : drm_wait_one_vblank+0x1a0/0x204
11:33:45.115: [   69.768480] sp : ffff80008476bc80
11:33:45.116: [   69.768489] x29: ffff80008476bc80 x28: 0000000000000000 
x27: 0000000000000000
11:33:45.116: [   69.768524] x26: ffff800082cf0e80 x25: ffff00000012a005 
x24: ffff0000054e5080
11:33:45.116: [   69.768559] x23: 0000000000000000 x22: ffff0000f74ebf40 
x21: 00000000ffffffea
11:33:45.116: [   69.768594] x20: 0000000000000001 x19: ffff000005ce4000 
x18: 00000000fffffffe
11:33:45.116: [   69.768628] x17: 000000040044ffff x16: 00500072b5503510 
x15: ffff80008476b870
11:33:45.116: [   69.768664] x14: 00000000000c0000 x13: ffff800082d19460 
x12: 0000000000000000
11:33:45.116: [   69.768698] x11: 0000000000000050 x10: 0000000000000000 
x9 : ffff800083a57530
11:33:45.116: [   69.768733] x8 : ffff80008476ba28 x7 : ffff80008476baf0 
x6 : ffff80008476ba80
11:33:45.116: [   69.768767] x5 : ffff80008476ba68 x4 : 0000000000000002 
x3 : 0000000000000000
11:33:45.116: [   69.768800] x2 : 0000000000000000 x1 : 0000000000000000 
x0 : ffff000006f59bc0
11:33:45.116: [   69.768834] Call trace:
11:33:45.116: [   69.768843]  drm_wait_one_vblank+0x1a0/0x204 (P)
11:33:45.116: [   69.768863]  drm_crtc_wait_one_vblank+0x1c/0x28
11:33:45.116: [   69.768883]  drm_dp_aux_crc_work+0x58/0x15c
11:33:45.116: [   69.768903]  process_one_work+0x208/0x5e8
11:33:45.116: [   69.768925]  worker_thread+0x1ac/0x34c
11:33:45.116: [   69.768947]  kthread+0x12c/0x208
11:33:45.116: [   69.768966]  ret_from_fork+0x10/0x20
11:33:45.116: [   69.768987] irq event stamp: 666314
11:33:45.116: [   69.768996] hardirqs last  enabled at (666313): 
[<ffff80008014fca8>] vprintk_emit+0x3b0/0x3d0
11:33:45.116: [   69.769020] hardirqs last disabled at (666314): 
[<ffff800081479a38>] el1_dbg+0x24/0x8c
11:33:45.116: [   69.769039] softirqs last  enabled at (666010): 
[<ffff8000800bc290>] handle_softirqs+0x4a0/0x4b8
11:33:45.116: [   69.769064] softirqs last disabled at (666005): 
[<ffff8000800105b0>] __do_softirq+0x14/0x20
11:33:45.116: [   69.769083] ---[ end trace 0000000000000000 ]---
11:33:45.116: [   69.769794] ------------[ cut here ]------------
11:33:45.116: [   69.769806] WARNING: CPU: 0 PID: 102 at 
drivers/gpu/drm/display/drm_dp_helper.c:2179 drm_dp_aux_get_crc+0xbc/0xd0
11:33:45.116: [   69.769832] Modules linked in:
11:33:45.116: [   69.769850] CPU: 0 UID: 0 PID: 102 Comm: kworker/0:2 
Tainted: G        W          6.14.0-rc4-g5dbf0298b72f #1
11:33:45.116: [   69.769872] Tainted: [W]=WARN
11:33:45.116: [   69.769881] Hardware name: Google Kevin (DT)
11:33:45.116: [   69.769892] Workqueue: events drm_dp_aux_crc_work
11:33:45.116: [   69.769914] pstate: 60000005 (nZCv daif -PAN -UAO -TCO 
-DIT -SSBS BTYPE=--)
11:33:45.116: [   69.769931] pc : drm_dp_aux_get_crc+0xbc/0xd0
11:33:45.116: [   69.769947] lr : drm_dp_aux_get_crc+0x3c/0xd0
11:33:45.116: [   69.769963] sp : ffff80008476bcd0
11:33:45.116: [   69.769972] x29: ffff80008476bcd0 x28: 0000000000000000 
x27: 0000000000000000
11:33:45.116: [   69.770007] x26: ffff800082cf0e80 x25: ffff00000012a005 
x24: ffff800082cf3000
11:33:45.116: [   69.770042] x23: 0000000000000000 x22: ffff0000f74ebf40 
x21: ffff800082036df8
11:33:45.116: [   69.770077] x20: ffff80008476bd42 x19: ffff0000054dcb88 
x18: 000000000000024d
11:33:45.116: [   69.770112] x17: 000000040044ffff x16: 00500072b5503510 
x15: 0000000000000001
11:33:45.116: [   69.770147] x14: 00000000000e0000 x13: 0000000000000000 
x12: 0000000000000000
11:33:45.116: [   69.770180] x11: 0000000000000078 x10: 0000000000000000 
x9 : ffff800083a57530
11:33:45.116: [   69.770215] x8 : ffff800083e6f000 x7 : 0000000000000001 
x6 : ffff800082036ca8
11:33:45.116: [   69.770249] x5 : 0000000000000000 x4 : ffff000006f5a098 
x3 : ffff800082036c20
11:33:45.116: [   69.770282] x2 : 0000000000000000 x1 : 0000000000000000 
x0 : 0000000000000000
11:33:45.116: [   69.770315] Call trace:
11:33:45.116: [   69.770324]  drm_dp_aux_get_crc+0xbc/0xd0 (P)
11:33:45.116: [   69.770344]  drm_dp_aux_crc_work+0x6c/0x15c
11:33:45.116: [   69.770363]  process_one_work+0x208/0x5e8
11:33:45.116: [   69.770385]  worker_thread+0x1ac/0x34c
11:33:45.116: [   69.770407]  kthread+0x12c/0x208
11:33:45.116: [   69.770427]  ret_from_fork+0x10/0x20
11:33:45.116: [   69.770448] irq event stamp: 666368
11:33:45.116: [   69.770457] hardirqs last  enabled at (666367): 
[<ffff8000801a496c>] ktime_get+0x130/0x174
11:33:45.116: [   69.770477] hardirqs last disabled at (666368): 
[<ffff800081479a38>] el1_dbg+0x24/0x8c
11:33:45.116: [   69.770496] softirqs last  enabled at (666010): 
[<ffff8000800bc290>] handle_softirqs+0x4a0/0x4b8
11:33:45.116: [   69.770521] softirqs last disabled at (666005): 
[<ffff8000800105b0>] __do_softirq+0x14/0x20
11:33:45.116: [   69.770540] ---[ end trace 0000000000000000 ]---
11:33:45.116: [   69.773999] ------------[ cut here ]------------
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_pipe_crc-CRITICAL: 
Failed assertion: pipe_crc->crc_fd != -1
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_pipe_crc-CRITICAL: 
Last errno: 5, Input/output error
11:33:45.119: ERROR - Igt error: Subtest 
connected-linear-tiling-1-displays-2160x1440p failed.
11:33:45.119: ERROR - Igt error: **** DEBUG ****
11:33:45.119: ERROR - Igt error: (kms_bw:273) DEBUG: Test requirement 
passed: !(pipe >= num_pipes)
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Test 
requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Test 
requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
11:33:45.119: ERROR - Igt error: (kms_bw:273) DEBUG: Test requirement 
passed: data->output[0]
11:33:45.119: ERROR - Igt error: (kms_bw:273) DEBUG: Test requirement 
passed: !(physical && pipe >= data->connected_outputs)
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=2160, height=1440, 
format=XR24(0x34325258), modifier=0x0, size=0)
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=8640)
11:33:45.119: ERROR - Igt error: (kms_bw:273) ioctl_wrappers-DEBUG: Test 
requirement passed: igt_has_fb_modifiers(fd)
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
eDP-1: set_pipe(A)
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
eDP-1: Selecting pipe A
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
A.0: plane_set_fb(55)
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
A.0: plane_set_size (2160x1440)
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
A.0: fb_set_position(0,0)
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
A.0: fb_set_size(2160x1440)
11:33:45.119: ERROR - Igt error: (kms_bw:273) INFO: Assigning pipe A to 
output eDP-1 with mode 2160x1440p
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
commit {
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe A: 
Setting property "GAMMA_LUT" to 0x0/0
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe A: 
Setting property "MODE_ID" to 0x39/57
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe A: 
Setting property "ACTIVE" to 0x1/1
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe A: 
Setting property "VRR_ENABLED" to 0x0/0
11:33:45.119: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: A.0, fb 55
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_W" to 0x8700000/141557760
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_H" to 0x5a00000/94371840
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_W" to 0x870/2160
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_H" to 0x5a0/1440
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "FB_ID" to 0x37/55
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_ID" to 0x26/38
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "rotation" to 0x1/1
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: A.1, fb 0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_W" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_H" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_W" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_H" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "FB_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "rotation" to 0x1/1
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: A.2, fb 0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_W" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_H" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_W" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_H" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "FB_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "rotation" to 0x1/1
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: A.3, fb 0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_W" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_H" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_W" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_H" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "FB_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "rotation" to 0x1/1
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe B: 
Setting property "GAMMA_LUT" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe B: 
Setting property "MODE_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe B: 
Setting property "ACTIVE" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe B: 
Setting property "VRR_ENABLED" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: B.0, fb 0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_W" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_H" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_W" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_H" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "FB_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "rotation" to 0x1/1
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: B.1, fb 0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_W" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_H" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_X" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_W" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_H" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "FB_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_ID" to 0x0/0
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "rotation" to 0x1/1
11:33:45.120: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  eDP-1: preparing atomic, pipe: A
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: eDP-1: 
Setting property "CRTC_ID" to 0x26/38
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: }
11:33:45.121: ERROR - Igt error: (kms_bw:273) DEBUG: Test requirement 
passed: !(ret != 0)
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
commit {
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe A: 
Setting property "GAMMA_LUT" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe A: 
Setting property "MODE_ID" to 0x39/57
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe A: 
Setting property "ACTIVE" to 0x1/1
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe A: 
Setting property "VRR_ENABLED" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: A.0, fb 55
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_X" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_Y" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_W" to 0x8700000/141557760
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_H" to 0x5a00000/94371840
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_X" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_W" to 0x870/2160
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_H" to 0x5a0/1440
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "FB_ID" to 0x37/55
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_ID" to 0x26/38
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.0: 
Setting property "rotation" to 0x1/1
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: A.1, fb 0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_X" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_Y" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_W" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_H" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_X" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_W" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_H" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "FB_ID" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_ID" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.1: 
Setting property "rotation" to 0x1/1
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: A.2, fb 0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_X" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_Y" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_W" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_H" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_X" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_W" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_H" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "FB_ID" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_ID" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.2: 
Setting property "rotation" to 0x1/1
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: A.3, fb 0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_X" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_Y" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_W" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_H" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_X" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_W" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_H" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "FB_ID" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_ID" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane A.3: 
Setting property "rotation" to 0x1/1
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe B: 
Setting property "GAMMA_LUT" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe B: 
Setting property "MODE_ID" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe B: 
Setting property "ACTIVE" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: Pipe B: 
Setting property "VRR_ENABLED" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: B.0, fb 0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_X" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_Y" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_W" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_H" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_X" to 0x0/0
11:33:45.121: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_W" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_H" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "FB_ID" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_ID" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.0: 
Setting property "rotation" to 0x1/1
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  populating plane data: B.1, fb 0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_X" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_Y" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_W" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_H" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_X" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_Y" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_W" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_H" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "FB_ID" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_ID" to 0x0/0
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: plane B.1: 
Setting property "rotation" to 0x1/1
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: 
  eDP-1: preparing atomic, pipe: A
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: eDP-1: 
Setting property "CRTC_ID" to 0x26/38
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_kms-DEBUG: display: }
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_pipe_crc-CRITICAL: 
Test assertion failure function igt_pipe_crc_start, file 
../lib/igt_pipe_crc.c:387:
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_pipe_crc-CRITICAL: 
Failed assertion: pipe_crc->crc_fd != -1
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_pipe_crc-CRITICAL: 
Last errno: 5, Input/output error
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_core-INFO: Stack trace:
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_core-INFO:   #0 
../lib/igt_core.c:2055 __igt_fail_assert()
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_core-INFO:   #1 
../lib/igt_pipe_crc.c:433 igt_pipe_crc_get_crcs()
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_core-INFO:   #2 
../lib/igt_pipe_crc.c:592 igt_pipe_crc_collect_crc()
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_core-INFO:   #3 
../tests/kms_bw.c:249 run_test_linear_tiling()
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_core-INFO:   #4 
../tests/kms_bw.c:295 __igt_unique____real_main264()
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_core-INFO:   #5 
../tests/kms_bw.c:264 main()
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_core-INFO:   #6 
[__libc_init_first+0x80]
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_core-INFO:   #7 
[__libc_start_main+0x98]
11:33:45.122: ERROR - Igt error: (kms_bw:273) igt_core-INFO:   #8 
[_start+0x30]
11:33:45.122: ERROR - Igt error: ****  END  ****
11:33:45.122: ERROR - Test 
kms_bw@connected-linear-tiling-1-displays-2160x1440p: Fail: See 
"/results/igt.kms_bw@connected-linear-tiling-1-displays-2160x1440p.log"
11:33:45.122: DEBUG - End test 
kms_bw@connected-linear-tiling-1-displays-2160x1440p

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/72651218

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
