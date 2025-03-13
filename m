Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0014A5F01D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 10:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4341010E0F3;
	Thu, 13 Mar 2025 09:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Qi0hh8VK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEBD10E0F3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741859978;
 bh=wz/SiZ9Lo8XInv5FYAo7V9xc1M+dPPiTq+WWx5XQVFM=;
 h=Date:To:Cc:From:Subject:From;
 b=Qi0hh8VK/KFwi1CRlmBfCI8ciE0lx5cj9Cp+sEOQjkoCKv/xvGZhPgQeRfTT3AOpO
 ej/kX9+dkABe6q5VU60+IFqPUDWs5wAGuOsZ02Qq1ygNMXDszOcSpeVazyHyUBPazC
 Png1ftR1aLGwFM9rkEpTPNCjZy/s+C8uw8GvXi87dYp0/3Sv12uaTpfMP3z358Ry27
 9mMlJhWK7Hy3uRktW7ZMdZUEa3dMPedX9/HcQg/ScqV0nbbEhUKgp3Daxe3JHfM2RD
 mJGE0WxTyQmfUppJP4W7+eUIjKsRJ3RiNXbi/UJBs4wBo9hNeb7fyDLIqbSSRndb+f
 vsbTTm0ngLVcg==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B5F5017E0ECA;
 Thu, 13 Mar 2025 10:59:35 +0100 (CET)
Message-ID: <da578eed-224f-4374-853a-1ff0aa20d03b@collabora.com>
Date: Thu, 13 Mar 2025 15:29:29 +0530
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
 kms_atomic_transition@plane-toggle-modeset-transition flake
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
kms_atomic_transition@plane-toggle-modeset-transition

11:13:54.607: DEBUG - Begin test 
kms_atomic_transition@plane-toggle-modeset-transition
11:13:59.676: [  434.263064] Console: switching to colour dummy device 80x25
11:13:59.676: [  434.269133] [IGT] kms_big_fb: executing
11:13:59.676: [  434.301249] [IGT] kms_big_fb: exiting, ret=77
11:13:59.676: [  434.306845] Console: switching to colour frame buffer 
device 170x48
11:13:59.676: [  434.450106] Console: switching to colour dummy device 80x25
11:13:59.676: [  434.456040] [IGT] kms_frontbuffer_tracking: executing
11:13:59.676: [  434.485322] [IGT] kms_frontbuffer_tracking: exiting, ret=77
11:13:59.676: [  434.492171] Console: switching to colour frame buffer 
device 170x48
11:13:59.676: [  434.622627] Console: switching to colour dummy device 80x25
11:13:59.676: [  434.628545] [IGT] kms_big_fb: executing
11:13:59.676: [  434.666906] [IGT] kms_big_fb: exiting, ret=77
11:13:59.676: [  434.672432] Console: switching to colour frame buffer 
device 170x48
11:13:59.676: [  434.819136] Console: switching to colour dummy device 80x25
11:13:59.676: [  434.825156] [IGT] fbdev: executing
11:13:59.676: [  434.834142] [IGT] fbdev: starting subtest unaligned-read
11:13:59.676: [  434.864894] [IGT] fbdev: finished subtest 
unaligned-read, SUCCESS
11:13:59.676: [  434.874183] [IGT] fbdev: exiting, ret=0
11:13:59.676: [  434.878831] Console: switching to colour frame buffer 
device 170x48
11:13:59.676: [  435.039907] Console: switching to colour dummy device 80x25
11:13:59.676: [  435.045929] [IGT] kms_frontbuffer_tracking: executing
11:13:59.676: [  435.083806] [IGT] kms_frontbuffer_tracking: exiting, ret=77
11:13:59.676: [  435.090698] Console: switching to colour frame buffer 
device 170x48
11:13:59.676: [  435.226992] Console: switching to colour dummy device 80x25
11:13:59.676: [  435.233006] [IGT] kms_cursor_legacy: executing
11:13:59.676: [  435.244988] [IGT] kms_cursor_legacy: starting subtest 
cursor-vs-flip-legacy
11:13:59.676: [  439.993353] [IGT] kms_cursor_legacy: finished subtest 
cursor-vs-flip-legacy, FAIL
11:13:59.676: [  440.051426] [IGT] kms_cursor_legacy: exiting, ret=98
11:13:59.676: [  440.058445] Console: switching to colour frame buffer 
device 170x48
11:13:59.676: [  440.291856] Console: switching to colour dummy device 80x25
11:13:59.676: [  440.297832] [IGT] kms_psr: executing
11:13:59.676: [  440.351576] [IGT] kms_psr: exiting, ret=77
11:13:59.676: [  440.357061] Console: switching to colour frame buffer 
device 170x48
11:13:59.676: [  440.525365] Console: switching to colour dummy device 80x25
11:13:59.676: [  440.531341] [IGT] kms_plane_scaling: executing
11:13:59.676: [  440.542536] [IGT] kms_plane_scaling: starting subtest 
plane-downscale-factor-0-75-with-rotation
11:13:59.676: [  440.551735] [IGT] kms_plane_scaling: starting dynamic 
subtest pipe-A
11:13:59.676: [  440.559115] [IGT] kms_plane_scaling: finished subtest 
pipe-A, SKIP
11:13:59.676: [  440.565635] [IGT] kms_plane_scaling: finished subtest 
plane-downscale-factor-0-75-with-rotation, SKIP
11:13:59.676: [  440.583083] [IGT] kms_plane_scaling: exiting, ret=77
11:13:59.677: [  440.588992] Console: switching to colour frame buffer 
device 170x48
11:13:59.677: [  440.735954] Console: switching to colour dummy device 80x25
11:13:59.677: [  440.742070] [IGT] kms_frontbuffer_tracking: executing
11:13:59.677: [  440.785413] [IGT] kms_frontbuffer_tracking: exiting, ret=77
11:13:59.677: [  440.792327] Console: switching to colour frame buffer 
device 170x48
11:13:59.677: [  440.956960] Console: switching to colour dummy device 80x25
11:13:59.677: [  440.962930] [IGT] kms_bw: executing
11:13:59.677: [  440.973201] [IGT] kms_bw: starting subtest 
linear-tiling-15-displays-3840x2160p
11:13:59.677: [  440.981029] [IGT] kms_bw: finished subtest 
linear-tiling-15-displays-3840x2160p, SKIP
11:13:59.677: [  440.989471] [IGT] kms_bw: exiting, ret=77
11:13:59.677: [  440.994855] Console: switching to colour frame buffer 
device 170x48
11:13:59.677: [  441.158662] Console: switching to colour dummy device 80x25
11:13:59.677: [  441.164783] [IGT] syncobj_eventfd: executing
11:13:59.677: [  441.171565] [IGT] syncobj_eventfd: exiting, ret=77
11:13:59.677: [  441.177491] Console: switching to colour frame buffer 
device 170x48
11:13:59.677: [  441.349875] Console: switching to colour dummy device 80x25
11:13:59.677: [  441.355894] [IGT] kms_frontbuffer_tracking: executing
11:13:59.677: [  441.417396] [IGT] kms_frontbuffer_tracking: exiting, ret=77
11:13:59.677: [  441.424442] Console: switching to colour frame buffer 
device 170x48
11:13:59.677: [  441.577403] Console: switching to colour dummy device 80x25
11:13:59.677: [  441.583335] [IGT] kms_psr: executing
11:13:59.677: [  441.615044] [IGT] kms_psr: exiting, ret=77
11:13:59.677: [  441.620486] Console: switching to colour frame buffer 
device 170x48
11:13:59.677: [  441.769555] Console: switching to colour dummy device 80x25
11:13:59.677: [  441.775521] [IGT] kms_big_fb: executing
11:13:59.677: [  441.814728] [IGT] kms_big_fb: exiting, ret=77
11:14:04.760: [  441.820589] Console: switching to colour frame buffer 
device 170x48
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) CRITICAL: 
Test assertion failure function wait_for_transition, file 
../tests/kms_atomic_transition.c:540:
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) CRITICAL: 
Failed assertion: fd_completed(data->drm_fd)
11:14:04.763: ERROR - Igt error: Dynamic subtest pipe-A-eDP-1 failed.
11:14:04.763: ERROR - Igt error: **** DEBUG ****
11:14:04.763: ERROR - Igt error: A.2: fb_set_position(0,0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.2: fb_set_size(0x0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.3: plane_set_fb(0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.3: plane_set_size (0x0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.3: fb_set_position(0,0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.3: fb_set_size(0x0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.4: plane_set_fb(0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.4: plane_set_size (0x0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.4: fb_set_position(0,0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.4: fb_set_size(0x0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.5: plane_set_fb(0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.5: plane_set_size (0x0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.5: fb_set_position(0,0)
11:14:04.763: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.5: fb_set_size(0x0)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: commit {
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: Pipe A: Setting property "ACTIVE" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.4, fb 0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_X" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_Y" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_W" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_H" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_W" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_H" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "FB_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.5, fb 0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_X" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_Y" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_W" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_H" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_W" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_H" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "FB_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     eDP-1: preparing atomic, pipe: None
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: eDP-1: Setting property "CRTC_ID" to 0x0/0
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: }
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) DEBUG: 
Retrieved vblank seq: 23468 on unk
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: eDP-1: set_pipe(A)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: eDP-1: Selecting pipe A
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.0: plane_set_fb(65)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.0: plane_set_size (1366x768)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.0: fb_set_size(1366x768)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.0: fb_set_size(1366x768)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.0: plane_set_size (1366x768)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.1: plane_set_fb(70)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.1: plane_set_size (1024x768)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.1: fb_set_position(0,0)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.1: fb_set_size(1024x768)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.1: fb_set_size(1024x768)
11:14:04.764: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.1: plane_set_size (1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.2: plane_set_fb(70)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.2: plane_set_size (1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.2: fb_set_size(1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.2: fb_set_size(1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.2: plane_set_size (1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.3: plane_set_fb(70)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.3: plane_set_size (1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.3: fb_set_position(0,0)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.3: fb_set_size(1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.3: fb_set_size(1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.3: plane_set_size (1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.4: plane_set_fb(70)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.4: plane_set_size (1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.4: fb_set_position(0,0)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.4: fb_set_size(1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.4: fb_set_size(1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.4: plane_set_size (1024x768)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.5: plane_set_fb(69)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.5: plane_set_size (512x512)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.5: fb_set_position(0,0)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.5: fb_set_size(512x512)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.5: fb_set_size(512x512)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: A.5: plane_set_size (512x512)
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: commit {
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x44/68
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: Pipe A: Setting property "ACTIVE" to 0x1/1
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.0, fb 65
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x5560000/89522176
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x3000000/50331648
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x556/1366
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x300/768
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x41/65
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x40/64
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 70
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x4000000/67108864
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x3000000/50331648
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x46/70
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x40/64
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 70
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
11:14:04.765: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x46/70
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x40/64
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 70
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x4000000/67108864
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x3000000/50331648
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x400/1024
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x300/768
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x46/70
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x40/64
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.4, fb 70
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_X" to 0x0/0
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_Y" to 0x0/0
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_W" to 0x4000000/67108864
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "SRC_H" to 0x3000000/50331648
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_W" to 0x400/1024
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_H" to 0x300/768
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "FB_ID" to 0x46/70
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.4: Setting property "CRTC_ID" to 0x40/64
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     populating plane data: A.5, fb 69
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_X" to 0x0/0
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_Y" to 0x0/0
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_W" to 0x2000000/33554432
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "SRC_H" to 0x2000000/33554432
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_W" to 0x200/512
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_H" to 0x200/512
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "FB_ID" to 0x45/69
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: plane A.5: Setting property "CRTC_ID" to 0x40/64
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display:     eDP-1: preparing atomic, pipe: A
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: eDP-1: Setting property "CRTC_ID" to 0x40/64
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_kms-DEBUG: display: }
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) CRITICAL: 
Test assertion failure function wait_for_transition, file 
../tests/kms_atomic_transition.c:540:
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) CRITICAL: 
Failed assertion: fd_completed(data->drm_fd)
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_core-INFO: Stack trace:
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_core-INFO:   #0 ../lib/igt_core.c:2055 __igt_fail_assert()
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_core-INFO:   #1 ../tests/kms_atomic_transition.c:537 
wait_for_transition.constprop.0()
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_core-INFO:   #2 ../tests/kms_atomic_transition.c:687 
__igt_unique____real_main1123()
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_core-INFO:   #3 ../tests/kms_atomic_transition.c:1123 main()
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_core-INFO:   #4 [__libc_init_first+0x80]
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_core-INFO:   #5 [__libc_start_main+0x98]
11:14:04.766: ERROR - Igt error: (kms_atomic_transition:1462) 
igt_core-INFO:   #6 [_start+0x30]
11:14:04.766: ERROR - Igt error: ****  END  ****
11:14:04.766: ERROR - Test 
kms_atomic_transition@plane-toggle-modeset-transition: Fail: See 
"/results/igt.kms_atomic_transition@plane-toggle-modeset-transition.log"
11:14:04.766: DEBUG - End test 
kms_atomic_transition@plane-toggle-modeset-transition

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/72735663

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
