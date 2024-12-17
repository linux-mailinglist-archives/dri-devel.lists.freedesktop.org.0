Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C435E9F44D1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 08:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FEA10E74A;
	Tue, 17 Dec 2024 07:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IXtEEacc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C3510E74A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734419385;
 bh=Y8t5alBa4X+t3wy2R0nIA3KjmE3CLTAYB9N2hfdmphg=;
 h=Date:To:Cc:From:Subject:From;
 b=IXtEEaccX6gbTp/a4bgwCBijq6UqMsl7D4bA9p67gwvPuYAlc20oMRBgWr3Qtn7c5
 QswOh0SjmThtuVlQfpgJ0Cm6+CdkrJ5V7S77NiNuQy/Klp+kJdhgjzxhRluWNOPpd6
 RqNOsljD5jePRqDvBjn2nZlnCNPoMxdz5cJ38ssVKV1slvdL4fOT4xRP88G6EncMqZ
 TUMOvvJKu/ShZoL29UMS3F1/v0KOA+q6VebRLIBAZmqvNAW7mFOmPjfEX2ZHO8bc2F
 KBccfPWFOQNhLUuhzbx61Sq57pbA1Ll3QFQidJmmj0NJiwj2UFsV6tBJnY6HLudI8M
 TBDNWAf0xKfUw==
Received: from [192.168.50.250] (unknown [171.76.86.135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DD3517E12D6;
 Tue, 17 Dec 2024 08:09:40 +0100 (CET)
Message-ID: <9b590b26-1bf9-4951-b6a3-ef6c67e6a1c6@collabora.com>
Date: Tue, 17 Dec 2024 12:39:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: rockchip: kms_bw@linear-tiling-2-displays-1920x1080p flake
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

# Board Name: hp-11A-G6-EE-grunt
# Bug Report:
# Failure Rate: 60
# IGT Version: 1.29-g33adea9eb
# Linux Version: 6.13.0-rc2
kms_bw@linear-tiling-2-displays-1920x1080p

2024-12-16 11:59:53.572755: DEBUG - Begin test 
kms_bw@linear-tiling-2-displays-1920x1080p
2024-12-16 12:00:03.800582: ERROR - Igt error: (kms_bw:2455) 
igt_pipe_crc-CRITICAL: Test assertion failure function 
igt_pipe_crc_start, file ../lib/igt_pipe_crc.c:387:
2024-12-16 12:00:03.800658: ERROR - Igt error: (kms_bw:2455) 
igt_pipe_crc-CRITICAL: Failed assertion: pipe_crc->crc_fd != -1
2024-12-16 12:00:03.800669: ERROR - Igt error: (kms_bw:2455) 
igt_pipe_crc-CRITICAL: Last errno: 5, Input/output error
2024-12-16 12:00:03.800680: ERROR - Igt error: Subtest 
linear-tiling-2-displays-1920x1080p failed.
2024-12-16 12:00:03.800693: ERROR - Igt error: **** DEBUG ****
2024-12-16 12:00:03.800706: ERROR - Igt error: (kms_bw:2455) DEBUG: Test 
requirement passed: !(pipe >= num_pipes)
2024-12-16 12:00:03.800719: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < 
pipe->n_planes
2024-12-16 12:00:03.800728: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < 
pipe->n_planes
2024-12-16 12:00:03.800737: ERROR - Igt error: (kms_bw:2455) DEBUG: Test 
requirement passed: data->output[0]
2024-12-16 12:00:03.800746: ERROR - Igt error: (kms_bw:2455) DEBUG: Test 
requirement passed: !(physical && pipe >= data->connected_outputs)
2024-12-16 12:00:03.800755: ERROR - Igt error: (kms_bw:2455) 
igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1920, height=1080, 
format=XR24(0x34325258), modifier=0x0, size=0)
2024-12-16 12:00:03.800784: ERROR - Igt error: (kms_bw:2455) 
igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, pitch=7680)
2024-12-16 12:00:03.800793: ERROR - Igt error: (kms_bw:2455) 
ioctl_wrappers-DEBUG: Test requirement passed: igt_has_fb_modifiers(fd)
2024-12-16 12:00:03.800802: ERROR - Igt error: (kms_bw:2455) 
igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
2024-12-16 12:00:03.800811: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display: eDP-1: set_pipe(A)
2024-12-16 12:00:03.800822: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display: eDP-1: Selecting pipe A
2024-12-16 12:00:03.800835: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display: A.0: plane_set_fb(56)
2024-12-16 12:00:03.800847: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display: A.0: plane_set_size (1920x1080)
2024-12-16 12:00:03.800860: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
2024-12-16 12:00:03.800873: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display: A.0: fb_set_size(1920x1080)
2024-12-16 12:00:03.800885: ERROR - Igt error: (kms_bw:2455) INFO: 
Assigning pipe A to output eDP-1 with mode 1920x1080p
2024-12-16 12:00:03.800897: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display: commit {
2024-12-16 12:00:03.800906: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe A: Setting property "GAMMA_LUT" to 0x0/0
2024-12-16 12:00:03.800915: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x39/57
2024-12-16 12:00:03.800924: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe A: Setting property "ACTIVE" to 0x1/1
2024-12-16 12:00:03.800933: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe A: Setting property "VRR_ENABLED" to 0x0/0
2024-12-16 12:00:03.800941: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: A.0, fb 56
2024-12-16 12:00:03.800953: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.800965: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.801065: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x7800000/125829120
2024-12-16 12:00:03.801078: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x4380000/70778880
2024-12-16 12:00:03.801087: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.801095: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.801104: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x780/1920
2024-12-16 12:00:03.801113: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x438/1080
2024-12-16 12:00:03.801121: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x38/56
2024-12-16 12:00:03.801130: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x26/38
2024-12-16 12:00:03.801191: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.801200: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 0
2024-12-16 12:00:03.801209: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.801245: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.801259: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x0/0
2024-12-16 12:00:03.801272: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x0/0
2024-12-16 12:00:03.801285: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.801297: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.801306: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x0/0
2024-12-16 12:00:03.801316: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x0/0
2024-12-16 12:00:03.801329: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x0/0
2024-12-16 12:00:03.801342: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x0/0
2024-12-16 12:00:03.801355: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.801367: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 0
2024-12-16 12:00:03.801379: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.801391: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.801400: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x0/0
2024-12-16 12:00:03.801436: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x0/0
2024-12-16 12:00:03.801451: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.801464: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.801474: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x0/0
2024-12-16 12:00:03.801484: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x0/0
2024-12-16 12:00:03.801497: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x0/0
2024-12-16 12:00:03.801510: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x0/0
2024-12-16 12:00:03.801523: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.801536: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 0
2024-12-16 12:00:03.801547: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.801556: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.801565: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x0/0
2024-12-16 12:00:03.801573: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x0/0
2024-12-16 12:00:03.801582: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.801591: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.801608: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x0/0
2024-12-16 12:00:03.801617: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x0/0
2024-12-16 12:00:03.801631: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x0/0
2024-12-16 12:00:03.801643: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x0/0
2024-12-16 12:00:03.801655: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.801668: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe B: Setting property "GAMMA_LUT" to 0x0/0
2024-12-16 12:00:03.801681: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe B: Setting property "MODE_ID" to 0x0/0
2024-12-16 12:00:03.801693: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe B: Setting property "ACTIVE" to 0x0/0
2024-12-16 12:00:03.801707: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe B: Setting property "VRR_ENABLED" to 0x0/0
2024-12-16 12:00:03.801721: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: B.0, fb 0
2024-12-16 12:00:03.801731: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.801741: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.801754: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "SRC_W" to 0x0/0
2024-12-16 12:00:03.801766: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "SRC_H" to 0x0/0
2024-12-16 12:00:03.801779: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.801792: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.801801: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "CRTC_W" to 0x0/0
2024-12-16 12:00:03.801810: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "CRTC_H" to 0x0/0
2024-12-16 12:00:03.801818: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "FB_ID" to 0x0/0
2024-12-16 12:00:03.801827: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "CRTC_ID" to 0x0/0
2024-12-16 12:00:03.801835: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.801844: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: B.1, fb 0
2024-12-16 12:00:03.801853: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.801861: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.801870: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "SRC_W" to 0x0/0
2024-12-16 12:00:03.801878: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "SRC_H" to 0x0/0
2024-12-16 12:00:03.801887: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.801896: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.801904: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "CRTC_W" to 0x0/0
2024-12-16 12:00:03.801913: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "CRTC_H" to 0x0/0
2024-12-16 12:00:03.801928: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "FB_ID" to 0x0/0
2024-12-16 12:00:03.801937: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "CRTC_ID" to 0x0/0
2024-12-16 12:00:03.801945: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.801954: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     eDP-1: preparing atomic, pipe: A
2024-12-16 12:00:03.801963: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: eDP-1: Setting property "CRTC_ID" to 0x26/38
2024-12-16 12:00:03.801971: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display: }
2024-12-16 12:00:03.801980: ERROR - Igt error: (kms_bw:2455) DEBUG: Test 
requirement passed: !(ret != 0)
2024-12-16 12:00:03.801989: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display: commit {
2024-12-16 12:00:03.801998: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe A: Setting property "GAMMA_LUT" to 0x0/0
2024-12-16 12:00:03.802007: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x39/57
2024-12-16 12:00:03.802015: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe A: Setting property "ACTIVE" to 0x1/1
2024-12-16 12:00:03.802024: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe A: Setting property "VRR_ENABLED" to 0x0/0
2024-12-16 12:00:03.802033: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: A.0, fb 56
2024-12-16 12:00:03.802041: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.802050: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.802059: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x7800000/125829120
2024-12-16 12:00:03.802067: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x4380000/70778880
2024-12-16 12:00:03.802076: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.802085: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.802093: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x780/1920
2024-12-16 12:00:03.802102: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x438/1080
2024-12-16 12:00:03.802146: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x38/56
2024-12-16 12:00:03.802157: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x26/38
2024-12-16 12:00:03.802166: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.0: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.802174: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 0
2024-12-16 12:00:03.802186: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.802194: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.802203: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x0/0
2024-12-16 12:00:03.802212: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x0/0
2024-12-16 12:00:03.802220: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.802235: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.802243: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x0/0
2024-12-16 12:00:03.802252: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x0/0
2024-12-16 12:00:03.802261: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x0/0
2024-12-16 12:00:03.802269: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x0/0
2024-12-16 12:00:03.802278: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.1: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.802286: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 0
2024-12-16 12:00:03.802371: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.802385: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.802394: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x0/0
2024-12-16 12:00:03.802403: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x0/0
2024-12-16 12:00:03.802429: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.802438: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.802446: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x0/0
2024-12-16 12:00:03.802455: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x0/0
2024-12-16 12:00:03.802464: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x0/0
2024-12-16 12:00:03.802472: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x0/0
2024-12-16 12:00:03.802481: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.2: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.802489: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 0
2024-12-16 12:00:03.802498: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.802507: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.802515: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x0/0
2024-12-16 12:00:03.802524: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x0/0
2024-12-16 12:00:03.802532: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.802541: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.802554: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x0/0
2024-12-16 12:00:03.802566: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x0/0
2024-12-16 12:00:03.802578: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x0/0
2024-12-16 12:00:03.802591: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x0/0
2024-12-16 12:00:03.802612: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane A.3: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.802624: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe B: Setting property "GAMMA_LUT" to 0x0/0
2024-12-16 12:00:03.802632: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe B: Setting property "MODE_ID" to 0x0/0
2024-12-16 12:00:03.802641: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe B: Setting property "ACTIVE" to 0x0/0
2024-12-16 12:00:03.802650: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: Pipe B: Setting property "VRR_ENABLED" to 0x0/0
2024-12-16 12:00:03.802658: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: B.0, fb 0
2024-12-16 12:00:03.802667: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.802679: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.802692: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "SRC_W" to 0x0/0
2024-12-16 12:00:03.802704: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "SRC_H" to 0x0/0
2024-12-16 12:00:03.802713: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.802721: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.802730: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "CRTC_W" to 0x0/0
2024-12-16 12:00:03.802738: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "CRTC_H" to 0x0/0
2024-12-16 12:00:03.802747: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "FB_ID" to 0x0/0
2024-12-16 12:00:03.802756: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "CRTC_ID" to 0x0/0
2024-12-16 12:00:03.802764: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.0: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.802773: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     populating plane data: B.1, fb 0
2024-12-16 12:00:03.802781: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "SRC_X" to 0x0/0
2024-12-16 12:00:03.802790: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "SRC_Y" to 0x0/0
2024-12-16 12:00:03.802798: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "SRC_W" to 0x0/0
2024-12-16 12:00:03.802807: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "SRC_H" to 0x0/0
2024-12-16 12:00:03.802815: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "CRTC_X" to 0x0/0
2024-12-16 12:00:03.802824: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "CRTC_Y" to 0x0/0
2024-12-16 12:00:03.802833: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "CRTC_W" to 0x0/0
2024-12-16 12:00:03.802845: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "CRTC_H" to 0x0/0
2024-12-16 12:00:03.802857: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "FB_ID" to 0x0/0
2024-12-16 12:00:03.802869: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "CRTC_ID" to 0x0/0
2024-12-16 12:00:03.802882: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: plane B.1: Setting property "rotation" to 0x1/1
2024-12-16 12:00:03.802895: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display:     eDP-1: preparing atomic, pipe: A
2024-12-16 12:00:03.802916: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: eDP-1: Setting property "CRTC_ID" to 0x26/38
2024-12-16 12:00:03.802929: ERROR - Igt error: (kms_bw:2455) 
igt_kms-DEBUG: display: }
2024-12-16 12:00:03.802938: ERROR - Igt error: (kms_bw:2455) 
igt_pipe_crc-CRITICAL: Test assertion failure function 
igt_pipe_crc_start, file ../lib/igt_pipe_crc.c:387:
2024-12-16 12:00:03.802947: ERROR - Igt error: (kms_bw:2455) 
igt_pipe_crc-CRITICAL: Failed assertion: pipe_crc->crc_fd != -1
2024-12-16 12:00:03.802957: ERROR - Igt error: (kms_bw:2455) 
igt_pipe_crc-CRITICAL: Last errno: 5, Input/output error
2024-12-16 12:00:03.802969: ERROR - Igt error: (kms_bw:2455) 
igt_core-INFO: Stack trace:
2024-12-16 12:00:03.802981: ERROR - Igt error: (kms_bw:2455) 
igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
2024-12-16 12:00:03.802994: ERROR - Igt error: (kms_bw:2455) 
igt_core-INFO:   #1 ../lib/igt_pipe_crc.c:433 igt_pipe_crc_get_crcs()
2024-12-16 12:00:03.803007: ERROR - Igt error: (kms_bw:2455) 
igt_core-INFO:   #2 ../lib/igt_pipe_crc.c:592 igt_pipe_crc_collect_crc()
2024-12-16 12:00:03.803019: ERROR - Igt error: (kms_bw:2455) 
igt_core-INFO:   #3 ../tests/kms_bw.c:249 run_test_linear_tiling()
2024-12-16 12:00:03.803028: ERROR - Igt error: (kms_bw:2455) 
igt_core-INFO:   #4 ../tests/kms_bw.c:287 __igt_unique____real_main264()
2024-12-16 12:00:03.803041: ERROR - Igt error: (kms_bw:2455) 
igt_core-INFO:   #5 ../tests/kms_bw.c:264 main()
2024-12-16 12:00:03.803053: ERROR - Igt error: (kms_bw:2455) 
igt_core-INFO:   #6 [__libc_init_first+0x80]
2024-12-16 12:00:03.803066: ERROR - Igt error: (kms_bw:2455) 
igt_core-INFO:   #7 [__libc_start_main+0x98]
2024-12-16 12:00:03.803078: ERROR - Igt error: (kms_bw:2455) 
igt_core-INFO:   #8 [_start+0x30]
2024-12-16 12:00:03.803091: ERROR - Igt error: ****  END  ****
2024-12-16 12:00:03.803104: ERROR - Test 
kms_bw@linear-tiling-2-displays-1920x1080p: Fail: See 
"/results/igt.kms_bw@linear-tiling-2-displays-1920x1080p.log"
2024-12-16 12:00:03.803117: DEBUG - End test 
kms_bw@linear-tiling-2-displays-1920x1080p

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/68249818

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
