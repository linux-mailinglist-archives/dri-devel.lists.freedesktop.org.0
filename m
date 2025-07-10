Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77FAFFEC7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A224E10E209;
	Thu, 10 Jul 2025 10:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Niphkluz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536E510E209
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752142240;
 bh=YNOs0jcJynpyowq2UFhMzKMoID+UYnwq0H47JXr44/c=;
 h=Date:To:Cc:From:Subject:From;
 b=NiphkluzssVpA+iT+hdhzLnhO0fZ1L7Jj295xpuBabcirnOHIymSsYeo9k0wi5j37
 7uhRJ4JetJeJ/v0N1NDVXKmS3o1LzIzEyntu9N/xUq0Edzlrz2H+KR5Hjx5oNHAOyD
 xxklNLkxOJfFo7Uf1Og9gcXGi2ISH86UFr/rHyv/GvGlu8k+xqyVe3WWoGifIEkaOG
 Fv8ApeKOmsvW7DkXAo0y8E3bn6rRj3j5zsjYo2umBPv3CtxnqUvY01xhhW2osFoAEG
 aUDNLNwqymuP9UpEywA2t+NOWKeimkkoGAMjcIMeQGmNIFu3l+eQzsdrct1uaH6raY
 RM295kUC3Ct0A==
Received: from [192.168.50.250] (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0706817E0286;
 Thu, 10 Jul 2025 12:10:36 +0200 (CEST)
Message-ID: <7b6e2e3b-2ea2-4cd7-92a5-68d23a63e426@collabora.com>
Date: Thu, 10 Jul 2025 15:40:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>,
 sebastian.reichel@collabora.com, linux-arm-kernel@lists.infradead.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: rk3399-gru-kevin: flake in kms_color@gamma
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
kms_color@gamma

(kms_color:915) igt_pipe_crc-WARNING: Warning on condition all_zero in 
function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_color:915) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
(kms_color:915) CRITICAL: Test assertion failure function 
run_gamma_degamma_tests_for_pipe, file ../tests/kms_color.c:787:
(kms_color:915) CRITICAL: Failed assertion: test_t(data, data->primary)
Dynamic subtest pipe-A-eDP-1 failed.
**** DEBUG ****
(kms_color:915) igt_kms-DEBUG: Test requirement passed: !(pipe >= 
display->n_pipes || !display->pipes[pipe].enabled)
(kms_color:915) igt_pipe_crc-DEBUG: Test requirement passed: dir >= 0
(kms_color:915) igt_pipe_crc-DEBUG: Test requirement passed: 
fstatat(dir, "crtc-0/crc/control", &stat, 0) == 0
(kms_color:915) DEBUG: Test requirement passed: pipe->n_planes >= 0
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display: eDP-1: set_pipe(A)
(kms_color:915) igt_kms-DEBUG: display: eDP-1: Selecting pipe A
(kms_color:915) igt_kms-DEBUG: display: eDP-1: set_pipe(None)
(kms_color:915) igt_kms-DEBUG: display: eDP-1: Selecting pipe None
(kms_color:915) DEBUG: Test requirement passed: 
pipe_output_combo_valid(data, p)
(kms_color:915) DEBUG: Test requirement passed: 
igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT)
(kms_color:915) igt_kms-DEBUG: display: eDP-1: set_pipe(A)
(kms_color:915) igt_kms-DEBUG: display: eDP-1: Selecting pipe A
(kms_color:915) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_color:915) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, 
pitch=9600)
(kms_color:915) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_color:915) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_color:915) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
pitch=9600)
(kms_color:915) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_color:915) igt_kms-DEBUG: display: A.0: plane_set_fb(59)
(kms_color:915) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_color:915) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:915) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_color:915) igt_kms-DEBUG: display: commit {
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 0
(kms_color:915) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
59, src (0, 0), mode 2400x1600
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 1
(kms_color:915) igt_kms-DEBUG: display:     SetPlane pipe A, plane 1, 
disabling
(kms_color:915) igt_kms-DEBUG: display:     SetProp plane A.1 "rotation" 
to 0x1/1
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 2
(kms_color:915) igt_kms-DEBUG: display:     SetPlane pipe A, plane 2, 
disabling
(kms_color:915) igt_kms-DEBUG: display:     SetProp plane A.2 "rotation" 
to 0x1/1
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 3
(kms_color:915) igt_kms-DEBUG: display:     SetCursor pipe A, disabling
(kms_color:915) igt_kms-DEBUG: display:     MoveCursor pipe A, (0, 0)
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe B, plane 0
(kms_color:915) igt_kms-DEBUG: display:     SetCrtc pipe B, disabling
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe B, plane 1
(kms_color:915) igt_kms-DEBUG: display:     SetCursor pipe B, disabling
(kms_color:915) igt_kms-DEBUG: display:     MoveCursor pipe B, (0, 0)
(kms_color:915) igt_kms-DEBUG: display: }
(kms_color:915) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_color:915) igt_kms-DEBUG: display: A.0: plane_set_fb(58)
(kms_color:915) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_color:915) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:915) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_color:915) igt_kms-DEBUG: display: commit {
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
58, src (0, 0), mode 2400x1600
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display: }
(kms_color:915) igt_pipe_crc-WARNING: Warning on condition all_zero in 
function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_color:915) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
(kms_color:915) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_color:915) igt_kms-DEBUG: display: A.0: plane_set_fb(58)
(kms_color:915) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_color:915) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:915) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_color:915) igt_kms-DEBUG: display: commit {
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
58, src (0, 0), mode 2400x1600
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display: }
(kms_color:915) igt_pipe_crc-DEBUG: CRC mismatch at index 0: 0xda5b != 0x0
(kms_color:915) igt_kms-DEBUG: display: A.0: plane_set_fb(0)
(kms_color:915) igt_kms-DEBUG: display: A.0: plane_set_size (0x0)
(kms_color:915) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:915) igt_kms-DEBUG: display: A.0: fb_set_size(0x0)
(kms_color:915) igt_kms-DEBUG: display: eDP-1: set_pipe(None)
(kms_color:915) igt_kms-DEBUG: display: eDP-1: Selecting pipe None
(kms_color:915) igt_kms-DEBUG: display: commit {
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display:     SetCrtc pipe A, disabling
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:915) igt_kms-DEBUG: display: }
(kms_color:915) CRITICAL: Test assertion failure function 
run_gamma_degamma_tests_for_pipe, file ../tests/kms_color.c:787:
(kms_color:915) CRITICAL: Failed assertion: test_t(data, data->primary)
(kms_color:915) igt_core-INFO: Stack trace:
(kms_color:915) igt_core-INFO:   #0 ../lib/igt_core.c:2075 
__igt_fail_assert()
(kms_color:915) igt_core-INFO:   #1 ../tests/kms_color.c:785 
run_tests_for_pipe()
(kms_color:915) igt_core-INFO:   #2 ../tests/kms_color.c:1182 
__igt_unique____real_main1169()
(kms_color:915) igt_core-INFO:   #3 ../tests/kms_color.c:1169 main()
(kms_color:915) igt_core-INFO:   #4 [__libc_init_first+0x80]
(kms_color:915) igt_core-INFO:   #5 [__libc_start_main+0x98]
(kms_color:915) igt_core-INFO:   #6 [_start+0x30]
****  END  ****
(kms_color:915) igt_pipe_crc-WARNING: Warning on condition all_zero in 
function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_color:915) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
(kms_color:915) igt_pipe_crc-WARNING: Warning on condition all_zero in 
function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_color:915) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79872341

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
