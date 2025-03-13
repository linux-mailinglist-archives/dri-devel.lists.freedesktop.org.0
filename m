Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F63CA5EFF1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 10:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0911710E81F;
	Thu, 13 Mar 2025 09:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iwRsFqgf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CF210E81F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741859496;
 bh=G03i3yWZ7xfzmfzyZ8JKQ66XI+EdINYMI+Wzm/+gZwk=;
 h=Date:To:Cc:From:Subject:From;
 b=iwRsFqgf8oZTPPdmiwJ8SZ4Tu907ypd3aaudzs7JDofd8OKzrUT86piOES8YMaEAm
 TcOFup0OLn3s35/4Mt3I66ULtzj2nwpmiosk2vZwYy3dIcSiX2/s+atofgRNnHZXBW
 WCGiyYc1kDCo8Q80SNwCogxH6MFPKCv+eMfXiZT+XAnG1D9y3HBOzsBujN4/4QWLEg
 JzIxpuWwlAVJUILctZIPlgtXckG0POnNv/zR8BSAfIA0LuXsuGAvQtc/5NUlX7MYa0
 qTBtFtIXtWVQxKuDlOTyNuDoAcAolvBSWGs3Tp4XMvQrhaR0f0fbYusqZtSO4XvnRm
 jr4aJjLZETZHg==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 515B817E0ECA;
 Thu, 13 Mar 2025 10:51:33 +0100 (CET)
Message-ID: <ca960a82-00fc-4183-b983-998f7ac2fbb5@collabora.com>
Date: Thu, 13 Mar 2025 15:21:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 nfraprado@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: mediatek:
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

There are some flake test reported for mediatek driver testing in drm-ci.

# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
# Failure Rate: 20
# IGT Version: 1.30-g04bedb923
# Linux Version: 6.14.0-rc4
kms_atomic_transition@plane-all-modeset-transition-internal-panels

11:34:51.896: DEBUG - Begin test 
kms_atomic_transition@plane-all-modeset-transition-internal-panels
11:34:56.978: [  356.928738] [IGT] kms_bw: finished subtest 
linear-tiling-13-displays-3840x2160p, SKIP
11:34:56.978: [  356.937111] [IGT] kms_bw: exiting, ret=77
11:34:56.978: [  356.942557] Console: switching to colour frame buffer 
device 170x48
11:34:56.978: [  357.125173] Console: switching to colour dummy device 80x25
11:34:56.978: [  357.131172] [IGT] kms_bw: executing
11:34:56.978: [  357.142820] [IGT] kms_bw: starting subtest 
linear-tiling-2-displays-2560x1440p
11:34:56.978: [  357.150596] [IGT] kms_bw: finished subtest 
linear-tiling-2-displays-2560x1440p, SKIP
11:34:56.978: [  357.158858] [IGT] kms_bw: exiting, ret=77
11:34:56.978: [  357.164180] Console: switching to colour frame buffer 
device 170x48
11:34:56.978: [  357.318688] Console: switching to colour dummy device 80x25
11:34:56.978: [  357.324648] [IGT] kms_bw: executing
11:34:56.978: [  357.333681] [IGT] kms_bw: starting subtest 
linear-tiling-6-displays-2160x1440p
11:34:56.979: [  357.341401] [IGT] kms_bw: finished subtest 
linear-tiling-6-displays-2160x1440p, SKIP
11:34:56.979: [  357.349597] [IGT] kms_bw: exiting, ret=77
11:34:56.979: [  357.354845] Console: switching to colour frame buffer 
device 170x48
11:34:56.979: [  357.505411] Console: switching to colour dummy device 80x25
11:34:56.979: [  357.511255] [IGT] kms_plane_scaling: executing
11:34:56.979: [  357.522411] [IGT] kms_plane_scaling: starting subtest 
plane-downscale-factor-0-25-with-modifiers
11:34:56.979: [  357.531718] [IGT] kms_plane_scaling: starting dynamic 
subtest pipe-A
11:34:56.979: [  357.539109] [IGT] kms_plane_scaling: finished subtest 
pipe-A, SKIP
11:34:56.979: [  357.545910] [IGT] kms_plane_scaling: finished subtest 
plane-downscale-factor-0-25-with-modifiers, SKIP
11:34:56.979: [  357.572515] [IGT] kms_plane_scaling: exiting, ret=77
11:34:56.979: [  357.578308] Console: switching to colour frame buffer 
device 170x48
11:34:56.979: [  357.727532] Console: switching to colour dummy device 80x25
11:34:56.979: [  357.733486] [IGT] kms_selftest: executing
11:34:56.979: [  357.745874] [IGT] kms_selftest: starting subtest 
drm_cmdline_parser
11:34:56.979: [  357.752866] [IGT] kms_selftest: finished subtest 
drm_cmdline_parser, SKIP
11:34:56.979: [  357.763629] [IGT] kms_selftest: exiting, ret=77
11:34:56.979: [  357.769361] Console: switching to colour frame buffer 
device 170x48
11:34:56.979: [  357.939908] Console: switching to colour dummy device 80x25
11:34:56.979: [  357.945870] [IGT] syncobj_timeline: executing
11:34:56.979: [  357.953079] [IGT] syncobj_timeline: exiting, ret=77
11:34:56.979: [  357.959018] Console: switching to colour frame buffer 
device 170x48
11:34:56.979: [  358.090580] Console: switching to colour dummy device 80x25
11:34:56.979: [  358.096444] [IGT] kms_frontbuffer_tracking: executing
11:34:56.979: [  358.140292] [IGT] kms_frontbuffer_tracking: exiting, ret=77
11:34:56.979: [  358.147183] Console: switching to colour frame buffer 
device 170x48
11:34:56.979: [  358.309815] Console: switching to colour dummy device 80x25
11:34:56.979: [  358.315957] [IGT] kms_frontbuffer_tracking: executing
11:34:56.979: [  358.356383] [IGT] kms_frontbuffer_tracking: exiting, ret=77
11:34:56.979: [  358.363247] Console: switching to colour frame buffer 
device 170x48
11:34:56.979: [  358.526047] Console: switching to colour dummy device 80x25
11:34:56.979: [  358.531928] [IGT] kms_frontbuffer_tracking: executing
11:34:56.979: [  358.589328] [IGT] kms_frontbuffer_tracking: exiting, ret=77
11:34:56.979: [  358.596300] Console: switching to colour frame buffer 
device 170x48
11:34:56.979: [  358.754092] Console: switching to colour dummy device 80x25
11:34:56.979: [  358.760000] [IGT] kms_draw_crc: executing
11:34:56.979: [  358.803687] [IGT] kms_draw_crc: exiting, ret=77
11:34:56.979: [  358.809585] Console: switching to colour frame buffer 
device 170x48
11:34:56.979: [  358.971580] Console: switching to colour dummy device 80x25
11:34:56.979: [  358.977535] [IGT] prime_self_import: executing
11:34:56.979: [  358.983703] [IGT] prime_self_import: starting subtest 
basic-with_one_bo_two_files
11:34:56.979: [  359.019495] [IGT] prime_self_import: finished subtest 
basic-with_one_bo_two_files, SKIP
11:34:56.979: [  359.028121] [IGT] prime_self_import: exiting, ret=77
11:34:56.979: [  359.034326] Console: switching to colour frame buffer 
device 170x48
11:34:56.979: [  359.165297] Console: switching to colour dummy device 80x25
11:34:56.979: [  359.171219] [IGT] kms_pm_rpm: executing
11:34:56.980: [  359.201837] [IGT] kms_pm_rpm: exiting, ret=77
11:34:56.980: [  359.207087] Console: switching to colour frame buffer 
device 170x48
11:34:56.980: [  359.364546] Console: switching to colour dummy device 80x25
11:34:56.980: [  359.370469] [IGT] prime_nv_pcopy: executing
11:34:56.980: [  359.376547] [IGT] prime_nv_pcopy: exiting, ret=77
11:34:56.980: [  359.382284] Console: switching to colour frame buffer 
device 170x48
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) CRITICAL: 
Test assertion failure function wait_for_transition, file 
../tests/kms_atomic_transition.c:540:
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) CRITICAL: 
Failed assertion: fd_completed(data->drm_fd)
11:34:56.986: ERROR - Igt error: Dynamic subtest pipe-A-eDP-1 failed.
11:34:56.986: ERROR - Igt error: **** DEBUG ****
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_H" to 0x0/0
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "FB_ID" to 0x0/0
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_ID" to 0x0/0
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: }
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) DEBUG: 
Retrieved vblank seq: 19343 on unk
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.1: plane_set_fb(70)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.1: plane_set_size (1024x768)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.1: fb_set_position(0,0)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.1: fb_set_size(1024x768)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.1: fb_set_size(1024x768)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.1: plane_set_size (1024x768)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.2: plane_set_fb(70)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.2: plane_set_size (1024x768)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.2: fb_set_size(1024x768)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.2: fb_set_size(1024x768)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.2: plane_set_size (1024x768)
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: commit {
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x41/65
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 70
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x4000000/67108864
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x3000000/50331648
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x46/70
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x40/64
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 70
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
11:34:56.986: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x46/70
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x40/64
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: }
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) DEBUG: 
Retrieved vblank seq: 19347 on unk
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.1: plane_set_fb(0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.1: plane_set_size (0x0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.1: fb_set_position(0,0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.1: fb_set_size(0x0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.2: plane_set_fb(0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.2: plane_set_size (0x0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.2: fb_set_size(0x0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: commit {
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x47/71
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: }
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) DEBUG: 
Retrieved vblank seq: 19352 on unk
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.5: plane_set_fb(69)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.5: plane_set_size (512x512)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.5: fb_set_position(0,0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.5: fb_set_size(512x512)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.5: fb_set_size(512x512)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.5: plane_set_size (512x512)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: commit {
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x41/65
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display:     populating plane data: A.5, fb 69
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_X" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_Y" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_W" to 0x2000000/33554432
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_H" to 0x2000000/33554432
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_W" to 0x200/512
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_H" to 0x200/512
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "FB_ID" to 0x45/69
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_ID" to 0x40/64
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: }
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) DEBUG: 
Retrieved vblank seq: 19357 on unk
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.5: plane_set_fb(0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.5: plane_set_size (0x0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.5: fb_set_position(0,0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.5: fb_set_size(0x0)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: commit {
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x47/71
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display:     populating plane data: A.5, fb 0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_X" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_Y" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_W" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_H" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_W" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_H" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "FB_ID" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_ID" to 0x0/0
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: }
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) DEBUG: 
Retrieved vblank seq: 19362 on unk
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: eDP-1: set_pipe(A)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: eDP-1: Selecting pipe A
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.0: plane_set_fb(67)
11:34:56.987: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.0: plane_set_size (1366x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.0: fb_set_size(1366x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.0: fb_set_size(1366x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.0: plane_set_size (1366x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: commit {
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x41/65
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: Pipe A: Setting property "ACTIVE" to 0x1/1
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display:     populating plane data: A.0, fb 67
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x5560000/89522176
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x3000000/50331648
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x556/1366
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x300/768
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x43/67
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x40/64
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display:     eDP-1: preparing atomic, pipe: A
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: eDP-1: Setting property "CRTC_ID" to 0x40/64
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: }
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) DEBUG: 
Retrieved vblank seq: 19364 on unk
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.3: plane_set_fb(70)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.3: plane_set_size (1024x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.3: fb_set_position(0,0)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.3: fb_set_size(1024x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.3: fb_set_size(1024x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.3: plane_set_size (1024x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.4: plane_set_fb(70)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.4: plane_set_size (1024x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.4: fb_set_position(0,0)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.4: fb_set_size(1024x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.4: fb_set_size(1024x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: A.4: plane_set_size (1024x768)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: commit {
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x47/71
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 70
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x4000000/67108864
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x3000000/50331648
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x400/1024
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x300/768
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x46/70
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x40/64
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display:     populating plane data: A.4, fb 70
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_X" to 0x0/0
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_Y" to 0x0/0
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_W" to 0x4000000/67108864
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_H" to 0x3000000/50331648
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_W" to 0x400/1024
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_H" to 0x300/768
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "FB_ID" to 0x46/70
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_ID" to 0x40/64
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_kms-DEBUG: display: }
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) CRITICAL: 
Test assertion failure function wait_for_transition, file 
../tests/kms_atomic_transition.c:540:
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) CRITICAL: 
Failed assertion: fd_completed(data->drm_fd)
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_core-INFO: Stack trace:
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_core-INFO:   #0 ../lib/igt_core.c:2055 __igt_fail_assert()
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_core-INFO:   #1 ../tests/kms_atomic_transition.c:537 
wait_for_transition.constprop.0()
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_core-INFO:   #2 ../tests/kms_atomic_transition.c:716 
__igt_unique____real_main1123()
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_core-INFO:   #3 ../tests/kms_atomic_transition.c:1123 main()
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_core-INFO:   #4 [__libc_init_first+0x80]
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_core-INFO:   #5 [__libc_start_main+0x98]
11:34:56.988: ERROR - Igt error: (kms_atomic_transition:1171) 
igt_core-INFO:   #6 [_start+0x30]
11:34:56.988: ERROR - Igt error: ****  END  ****
11:34:56.988: ERROR - Test 
kms_atomic_transition@plane-all-modeset-transition-internal-panels: 
Fail: See 
"/results/igt.kms_atomic_transition@plane-all-modeset-transition-internal-panels.log"
11:34:56.988: DEBUG - End test 
kms_atomic_transition@plane-all-modeset-transition-internal-panels

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/72651180

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
