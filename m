Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D56AFFF4E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E5410E8BE;
	Thu, 10 Jul 2025 10:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YfsgW3EA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A034410E37F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752143407;
 bh=ULw7wT/Zin6p0rqWnTH20a2r+OT/dAS9iD1kWJ24mCM=;
 h=Date:To:Cc:From:Subject:From;
 b=YfsgW3EAIc752yTueKOYdPfO2PC48GvG6SHfQOyHvDAiOYU+CbK+jdGlyq5DsjyZ8
 aGtBm4EAWIl4QD9nxtJB/PlySflePaa5WN9jibeUeAIAKqOzSbue0O50uXQna0IlZy
 eHK0ktjNkTiuK0B5A1XksMvDIu9gV7On3cydnBs86xWvoSwjbRfZ5eCGLJlJTSxRmH
 uZG1wa0fO4pxEOGC19T2FqK7DHagE9f8KvSA5mt8fQ/qcX51fsjtzoZJhFJquDLRzo
 XRcEB5LkUos6XaQdjLYuEz5nRCLtMi7LDGow1+eg+0+CJO9UKc30gdp3ORXoyFM3E1
 vtxtIlKQxltQg==
Received: from [192.168.50.250] (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 053FA17E08E3;
 Thu, 10 Jul 2025 12:30:03 +0200 (CEST)
Message-ID: <e29c2892-08f2-423f-af72-e4d8b207fd1c@collabora.com>
Date: Thu, 10 Jul 2025 16:00:02 +0530
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
Subject: drm-ci: rk3399-gru-kevin:
 kms_bw@connected-linear-tiling-1-displays-3840x2160p flake
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
# Failure Rate: 60
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_bw@connected-linear-tiling-1-displays-3840x2160p

02:16:31.041: DEBUG - Begin test 
kms_bw@connected-linear-tiling-1-displays-3840x2160p
02:16:31.041: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Test assertion failure function igt_pipe_crc_start, file 
../lib/igt_pipe_crc.c:387:
02:16:36.124: [   60.745159] [IGT] kms_bw: executing
02:16:36.124: [   60.758055] [IGT] kms_bw: starting subtest 
linear-tiling-6-displays-1920x1080p
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Failed assertion: pipe_crc->crc_fd != -1
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Last errno: 5, Input/output error
02:16:36.127: ERROR - Igt error: Subtest 
connected-linear-tiling-1-displays-3840x2160p failed.
02:16:36.127: ERROR - Igt error: **** DEBUG ****
02:16:36.127: ERROR - Igt error: (kms_bw:356) DEBUG: Test requirement 
passed: !(pipe >= num_pipes)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Test 
requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Test 
requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
02:16:36.127: ERROR - Igt error: (kms_bw:356) DEBUG: Test requirement 
passed: data->output[0]
02:16:36.127: ERROR - Igt error: (kms_bw:356) DEBUG: Test requirement 
passed: !(physical && pipe >= data->connected_outputs)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3840, height=2160, 
format=XR24(0x34325258), modifier=0x0, size=0)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=15360)
02:16:36.127: ERROR - Igt error: (kms_bw:356) ioctl_wrappers-DEBUG: Test 
requirement passed: igt_has_fb_modifiers(fd)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
eDP-1: set_pipe(A)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
eDP-1: Selecting pipe A
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
A.0: plane_set_fb(58)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
A.0: plane_set_size (3840x2160)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
A.0: fb_set_position(0,0)
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
A.0: fb_set_size(3840x2160)
02:16:36.127: ERROR - Igt error: (kms_bw:356) INFO: Assigning pipe A to 
output eDP-1 with mode 3840x2160p
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
commit {
02:16:36.127: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "GAMMA_LUT" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "MODE_ID" to 0x3b/59
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "ACTIVE" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "VRR_ENABLED" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.0, fb 58
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_W" to 0xf000000/251658240
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_H" to 0x8700000/141557760
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_W" to 0xf00/3840
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_H" to 0x870/2160
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "FB_ID" to 0x3a/58
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_ID" to 0x27/39
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.1, fb 0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "FB_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.2, fb 0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "FB_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.3, fb 0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "FB_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "GAMMA_LUT" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "MODE_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "ACTIVE" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "VRR_ENABLED" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: B.0, fb 0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "FB_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: B.1, fb 0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_X" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_W" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_H" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "FB_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "rotation" to 0x1/1
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  eDP-1: preparing atomic, pipe: A
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: eDP-1: 
Setting property "CRTC_ID" to 0x27/39
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: }
02:16:36.128: ERROR - Igt error: (kms_bw:356) DEBUG: Test requirement 
passed: !(ret != 0)
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
commit {
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "GAMMA_LUT" to 0x0/0
02:16:36.128: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "MODE_ID" to 0x3b/59
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "ACTIVE" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe A: 
Setting property "VRR_ENABLED" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.0, fb 58
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_W" to 0xf000000/251658240
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_H" to 0x8700000/141557760
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_W" to 0xf00/3840
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_H" to 0x870/2160
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "FB_ID" to 0x3a/58
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_ID" to 0x27/39
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.0: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.1, fb 0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "FB_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.1: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.2, fb 0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "FB_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.2: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: A.3, fb 0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "FB_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane A.3: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "GAMMA_LUT" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "MODE_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "ACTIVE" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: Pipe B: 
Setting property "VRR_ENABLED" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: B.0, fb 0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "FB_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.0: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  populating plane data: B.1, fb 0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_X" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_Y" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_W" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_H" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "FB_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_ID" to 0x0/0
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: plane B.1: 
Setting property "rotation" to 0x1/1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: 
  eDP-1: preparing atomic, pipe: A
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: eDP-1: 
Setting property "CRTC_ID" to 0x27/39
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_kms-DEBUG: display: }
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Test assertion failure function igt_pipe_crc_start, file 
../lib/igt_pipe_crc.c:387:
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Failed assertion: pipe_crc->crc_fd != -1
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_pipe_crc-CRITICAL: 
Last errno: 5, Input/output error
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO: Stack trace:
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #0 
../lib/igt_core.c:2075 __igt_fail_assert()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #1 
../lib/igt_pipe_crc.c:433 igt_pipe_crc_get_crcs()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #2 
../lib/igt_pipe_crc.c:592 igt_pipe_crc_collect_crc()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #3 
../tests/kms_bw.c:247 run_test_linear_tiling()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #4 
../tests/kms_bw.c:293 __igt_unique____real_main262()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #5 
../tests/kms_bw.c:262 main()
02:16:36.129: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #6 
[__libc_init_first+0x80]
02:16:36.130: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #7 
[__libc_start_main+0x98]
02:16:36.130: ERROR - Igt error: (kms_bw:356) igt_core-INFO:   #8 
[_start+0x30]
02:16:36.130: ERROR - Igt error: ****  END  ****
02:16:36.130: ERROR - Test 
kms_bw@connected-linear-tiling-1-displays-3840x2160p: Fail: See 
"/results/igt.kms_bw@connected-linear-tiling-1-displays-3840x2160p.log"
02:16:36.130: DEBUG - End test 
kms_bw@connected-linear-tiling-1-displays-3840x2160p

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79872340

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
