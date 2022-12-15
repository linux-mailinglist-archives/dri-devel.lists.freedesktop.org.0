Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1808864D56D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 04:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98A10E4E7;
	Thu, 15 Dec 2022 03:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B58510E4E7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 03:04:37 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d15so5456108pls.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 19:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K3IDb4rreGLvgd+2ug69AbMNttQGcSlWv6zwqNmBMEs=;
 b=WO+jqkME9JS3LPl3YEwJ9fsDiX7H+yavqwaNSvSMYi4QNdrrpXYeINXgw4DAvI1RT4
 DHE3EJg9ncOQk6Fm2cy4nRE/s3tqXBfXZUOTn5VW2Be9HM1ZXdrpZIezWYkoCTBHgVsH
 +O2wt7wDzP5I+bVZRyXDMXsLRcLafoo2XMK8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K3IDb4rreGLvgd+2ug69AbMNttQGcSlWv6zwqNmBMEs=;
 b=AE9spI8Ctu+Xx3CfuCAxaiyhlJFZEy5zEyjwmht4wbJlotuaQYa6X9dVZsmVSLrknt
 sL981xu9IA4UWOymu0fdAEedZXqqOV1vraQL0CRILzeOZIKWgXrhW2pcM6Nx1iUWn2CQ
 13vuffUfEYRpajAiIPX/zgot9sxSLhGoutg58kR2O57lDnD+EjclQw4ccnDhlA8ffnLR
 c3GbGT14DwxHTyy0LCuBHvfVF3n+CrUWG1J/vQBh6EeldhuPtVXAHRd7n5nopjsYErC5
 rDtYQqWtnoDE0yrdYzIiOa0apFZ7febv4hCDTErPY6kk7VRT2qZRoII3PYaFx9Mgj8tl
 Ey7A==
X-Gm-Message-State: ANoB5pluc9n+C0vf+akUwtDI0OGHiVX5w3gJ0e9OdAyoEZfJEE/0/R44
 2EJxbs+yhufZshyk41+qUvg80g==
X-Google-Smtp-Source: AA0mqf7wKc6XzZX1oNXGMf8tcflozHngQGwuO9UrUVF9WZ/jsDYALIyxEzz5shOz3mkM1vRpJcglSA==
X-Received: by 2002:a17:90a:3e03:b0:219:2aa9:2c7c with SMTP id
 j3-20020a17090a3e0300b002192aa92c7cmr27847877pjc.0.1671073477529; 
 Wed, 14 Dec 2022 19:04:37 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:8edc:d4ff:fe53:350d])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a17090a5d1200b00218f830c63esm2063785pji.1.2022.12.14.19.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 19:04:36 -0800 (PST)
Date: Wed, 14 Dec 2022 19:04:34 -0800
From: Brian Norris <briannorris@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Message-ID: <Y5qOwmqIIp+2qWOy@google.com>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5itf0+yNIQa6fU4@sirena.org.uk>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, kernelci-results@groups.io,
 bot@kernelci.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 04:51:11PM +0000, Mark Brown wrote:
> On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:
> 
> The KernelCI bisection bot found regressions in at least two KMS tests
> in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
> merged up mainline:
> 
>    igt-kms-rockchip.kms_vblank.pipe-A-wait-forked 
>    igt-kms-rockchip.kms_vblank.pipe-A-query-busy
> 
> which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
> PSR-exit to disable transition").  I'm not *100%* sure I trust the
> bisection but it sure is suspicous that two separate bisects for related
> issues landed on the same commit.
> 
> Below is the full report for the bisect for the first test, the bisect
> for the latter looks identical.  It's got links to full logs for the
> test run and a Reported-by for the bot - I do see some backtraces from
> userspace in the output, the first is:

I think the backtraces are just because IGT calls assert().

> | IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux: 6.1.0 aarch64)
> | <14>[   35.444448] [IGT] drm_read: starting subtest short-buffer-wakeup
> | Starting subtest: short-buffer-wakeup
> | 
> | (| drm_read:350) CRITICAL: Test assertion failure function generate_event, file ../tests/drm_read.c:65:
> | (drm_read:350) CRITICAL: <14>[   36.155642] [IGT] drm_read: exiting, ret=98
> | Failed assertion: kmstest_get_vblank(fd, pipe, DRM_VBLANK_EVENT)
> | 
> | (drm_read:350) CRITICAL: Last errno: 22, Invalid argument
> | Stack trace:
> | 
> |   #0 ../lib/igt_core.c:1933 __igt_fail_assert()
> |   #1 [<unknown>+0xd5362770]
> |   #2 [<unknown>+0xd536193c]
> |   #3 [__libc_start_main+0xe8]
> |   #4 [<unknown>+0xd5361974]
> |   #5 [<unknown<6>[   36.162851] Console: switching to colour frame buffer device 300x100>+0xd5361974]
> | Subtest short-buffer-wakeup failed.
> 
> Unfortunately we don't have current results from mainline or -next.

Thanks for the notification. I'm running:

  6e516faf0431 drm/panfrost: Job should reference MMU not file_priv

which is allegedly a "good" kernel. And running this:

  ### First kill my display manager, etc.
  ## Then:
  IGT_FORCE_DRIVER=rockchip /usr/libexec/igt-gpu-tools/kms_vblank --run-subtest pipe-A-wait-forked

Gives the appended log [1]. If I'm looking right, it seems like it's
failing the same way as the "regression."

I also tested this:

  # the 5.10.x backport, and its parent:
  dbe04e874d4fbd56be64fdfcb29410241b6ad08a^ -- i.e.:
  61297ee0c329 Input: bcm5974 - set missing URB_NO_TRANSFER_DMA_MAP urb flag

and saw the same failures, and I also see the failures I was trying to
avoid in this series (see e54a4424925a ("drm/atomic: Force bridge
self-refresh-exit on CRTC switch")). Perhaps that's because of the
"First kill my display manager, etc." -- because that step means we
might end up switching CRTCs (VOPs) when the test starts, and triggering
the bug.

I'll look some more, but this might be a difference of test setup, such
that my setup has the issue before and after that commit, but your setup
sees a regression.

Small tangent: It's possible this is similar to stuff I had to debug a
while back in this space:

atomictest: Disable CRTCs before test
https://chromium-review.googlesource.com/c/chromiumos/platform/drm-tests/+/3309960
null_platform_test: Disable CRTCs first
https://chromium-review.googlesource.com/c/chromiumos/platform/drm-tests/+/3315478

In that case, there was actually an underlying kernel regression due to:

  846c7dfc1193 drm/atomic: Try to preserve the crtc enabled state in drm_atomic_remove_fb, v2.

But our tests were broken too (assuming an initial state that wasn't
guaranteed), so we just fixed the tests.

Anyway, I'll confirm when I get some fresh eyes and can try a few more
things (like neutering the ChromeOS display framework for my tests).

Brian

[1]

IGT-Version: 1.26-gf8a4a0b5 (arm) (Linux: 5.18.0-rc6+ aarch64)
Starting subtest: pipe-A-wait-forked
Beginning pipe-A-wait-forked on pipe A, connector eDP-1
(kms_vblank:2532) CRITICAL: Test assertion failure function vblank_wait, file ../igt-gpu-tools-1.25/tests/kms_vblank.c:319:
(kms_vblank:2535) CRITICAL: Test assertion failure function vblank_wait, file ../igt-gpu-tools-1.25/tests/kms_vblank.c:319:
(kms_vblank:2531) CRITICAL: Test assertion failure function vblank_wait, file ../igt-gpu-tools-1.25/tests/kms_vblank.c:319:
(kms_vblank:2532) CRITICAL: Failed assertion: wait_vblank(fd, &vbl) == 0
(kms_vblank:2534) CRITICAL: Test assertion failure function vblank_wait, file ../igt-gpu-tools-1.25/tests/kms_vblank.c:319:
(kms_vblank:2535) CRITICAL: Failed assertion: wait_vblank(fd, &vbl) == 0
(kms_vblank:2531) CRITICAL: Failed assertion: wait_vblank(fd, &vbl) == 0
(kms_vblank:2536) CRITICAL: Test assertion failure function vblank_wait, file ../igt-gpu-tools-1.25/tests/kms_vblank.c:319:
(kms_vblank:2532) CRITICAL: Last errno: 22, Invalid argument
(kms_vblank:2534) CRITICAL: Failed assertion: wait_vblank(fd, &vbl) == 0
(kms_vblank:2536) CRITICAL: Failed assertion: wait_vblank(fd, &vbl) == 0
(kms_vblank:2532) CRITICAL: error: -22 != 0
(kms_vblank:2531) CRITICAL: Last errno: 22, Invalid argument
(kms_vblank:2535) CRITICAL: Last errno: 22, Invalid argument
(kms_vblank:2531) CRITICAL: error: -22 != 0
(kms_vblank:2534) CRITICAL: Last errno: 22, Invalid argument
(kms_vblank:2536) CRITICAL: Last errno: 22, Invalid argument
(kms_vblank:2535) CRITICAL: error: -22 != 0
(kms_vblank:2534) CRITICAL: error: -22 != 0
(kms_vblank:2536) CRITICAL: error: -22 != 0
(kms_vblank:2533) CRITICAL: Test assertion failure function vblank_wait, file ../igt-gpu-tools-1.25/tests/kms_vblank.c:319:
(kms_vblank:2533) CRITICAL: Failed assertion: wait_vblank(fd, &vbl) == 0
(kms_vblank:2533) CRITICAL: Last errno: 22, Invalid argument
Stack trace:
Stack trace:
(kms_vblank:2533) CRITICAL: error: -22 != 0
Stack trace:
Stack trace:
Stack trace:
Stack trace:
child 1 failed with exit status 98
Subtest pipe-A-wait-forked failed.
**** DEBUG ****
(kms_vblank:2526) igt_kms-DEBUG: display: eDP-1: set_pipe(A)
(kms_vblank:2526) igt_kms-DEBUG: display: eDP-1: Selecting pipe A
(kms_vblank:2526) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_vblank:2526) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, pitch=9600)
(kms_vblank:2526) ioctl_wrappers-DEBUG: Test requirement passed: igt_has_fb_modifiers(fd)
(kms_vblank:2526) igt_fb-DEBUG: Test requirement passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_vblank:2526) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
(kms_vblank:2526) igt_kms-DEBUG: display: A.0: plane_set_fb(56)
(kms_vblank:2526) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_vblank:2526) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_vblank:2526) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_vblank:2526) igt_kms-DEBUG: display: commit {
(kms_vblank:2526) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
(kms_vblank:2526) igt_kms-DEBUG: display:     Fixing up initial rotation pipe A, plane 0
(kms_vblank:2526) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 56, src (0, 0), mode 2400x1600
(kms_vblank:2526) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
(kms_vblank:2526) igt_kms-DEBUG: display:     Fixing up initial rotation pipe A, plane 1
(kms_vblank:2526) igt_kms-DEBUG: display:     SetCursor pipe A, disabling
(kms_vblank:2526) igt_kms-DEBUG: display:     MoveCursor pipe A, (0, 0)
(kms_vblank:2526) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
(kms_vblank:2526) igt_kms-DEBUG: display:     Fixing up initial rotation pipe B, plane 0
(kms_vblank:2526) igt_kms-DEBUG: display:     SetCrtc pipe B, disabling
(kms_vblank:2526) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
(kms_vblank:2526) igt_kms-DEBUG: display:     Fixing up initial rotation pipe B, plane 1
(kms_vblank:2526) igt_kms-DEBUG: display:     SetPlane pipe B, plane 1, disabling
(kms_vblank:2526) igt_kms-DEBUG: display:     SetProp plane B.1 "rotation" to 0x1/1
(kms_vblank:2526) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
(kms_vblank:2526) igt_kms-DEBUG: display:     Fixing up initial rotation pipe B, plane 2
(kms_vblank:2526) igt_kms-DEBUG: display:     SetPlane pipe B, plane 2, disabling
(kms_vblank:2526) igt_kms-DEBUG: display:     SetProp plane B.2 "rotation" to 0x1/1
(kms_vblank:2526) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
(kms_vblank:2526) igt_kms-DEBUG: display:     Fixing up initial rotation pipe B, plane 3
(kms_vblank:2526) igt_kms-DEBUG: display:     SetCursor pipe B, disabling
(kms_vblank:2526) igt_kms-DEBUG: display:     MoveCursor pipe B, (0, 0)
(kms_vblank:2526) igt_kms-DEBUG: display: }
(kms_vblank:2526) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/1'
(kms_vblank:2526) INFO: Beginning pipe-A-wait-forked on pipe A, connector eDP-1
(kms_vblank:2526) DEBUG: Spawning 6 threads
****  END  ****
Subtest pipe-A-wait-forked: FAIL (0.938s)
Test requirement not met in function igt_require_pipe, file ../igt-gpu-tools-1.25/lib/igt_kms.c:2360:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe C does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../igt-gpu-tools-1.25/lib/igt_kms.c:2360:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe D does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../igt-gpu-tools-1.25/lib/igt_kms.c:2360:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe E does not exist or not enabled
Test requirement not met in function igt_require_pipe, file ../igt-gpu-tools-1.25/lib/igt_kms.c:2360:
Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
Pipe F does not exist or not enabled
