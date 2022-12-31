Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2965A193
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 03:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFA710E0DE;
	Sat, 31 Dec 2022 02:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181D710E0DE
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 02:29:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bf43so34025932lfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 18:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vq6Y9+70rY8XVkQFLk3Qlj1zt9Xu549GNuu+Ch1Bb6U=;
 b=GRoGxAsjITrHtzu8u9Of8PA58T0kKy83D34WXGyNjLSdG9HAcgC4dxmu9T4VmMmswV
 F8+tB44FLNc4vCVlFvQoUPw1IcDlN7R7Cnz5Zkay2A5ysWxeELMMAMRnLFha7xm43COV
 dGzkYFjFqiJ2o6uk9eyFOZPKVt10sO9Geb/pZgmoqT/NHxht3Rke4YeD3r0NgWImvyvI
 mI0iNNm8Avx8QUVprmPYr889VJyL4OUAEVKIUtOwbz3cdfa7qV6lXrCploXOhaRWuhBM
 XcJEIvF+6I6mWs1A0X6Scq4ms64VRWOACwEc8mPl+vKBZKGkLaIrzoz1ArhWaYcgEP5Z
 vpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vq6Y9+70rY8XVkQFLk3Qlj1zt9Xu549GNuu+Ch1Bb6U=;
 b=F/0+86JzwZA5jEaHBcJFkSP/yg2BQ1V+5o9F/LK1R5wpmZmDhTj4qe0QuTfdIEMCYD
 BApGiImt0vk3DUWsuz+sM3T6dSb0fLt6X6woRinlLf4/RrFdXa+TBRwGfqTwTTp/Swbu
 dM85oprCWa9dioLxtFOGwtpqTaci2W3/kvQx91LEmRsAT/ay7FvQnhI403hGTICG6uq4
 xWVXeA48KnJffZxwvc8xgMqRWFEXR8kQtHhzsCx0zBtpVNMKXASoUWJSdgQS9VEEw2cy
 4IWWalVBnBhMHjWYOKpMxmaqHE8DqAq0dBpAoRex8otUDJAv4GdvTbLBXmozZTY6W+Gf
 lHUg==
X-Gm-Message-State: AFqh2kq4KH+CmfJuyNl2GnO/3FX1zs0nkt+hsTNjFc9j59O+JfDsaVI6
 lowdC8F+bdJP2U4Nt1H3XbTEZA==
X-Google-Smtp-Source: AMrXdXvg0qLjmJspZohtomaCHL/2fkIyD5en3wFEP7tTEYuKk740n8RBzm6TAcm6+DKnWyH1OerftA==
X-Received: by 2002:a05:6512:220a:b0:4b4:b667:4b1d with SMTP id
 h10-20020a056512220a00b004b4b6674b1dmr11161162lfu.27.1672453778949; 
 Fri, 30 Dec 2022 18:29:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a05651234c400b0049d0a98f73csm3667231lfr.154.2022.12.30.18.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 18:29:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm: another fix for the headless Adreno GPU
Date: Sat, 31 Dec 2022 04:29:37 +0200
Message-Id: <20221231022937.286491-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix another oops reproducible when rebooting the board with the Adreno
GPU wokring in the headless mode (e.g. iMX platforms).

Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
[00000000] *pgd=74936831, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1] ARM
CPU: 0 PID: 51 Comm: reboot Not tainted 6.2.0-rc1-dirty #11
Hardware name: Freescale i.MX53 (Device Tree Support)
PC is at msm_atomic_commit_tail+0x50/0x970
LR is at commit_tail+0x9c/0x188
pc : [<c06aa430>]    lr : [<c067a214>]    psr: 600e0013
sp : e0851d30  ip : ee4eb7eb  fp : 00090acc
r10: 00000058  r9 : c2193014  r8 : c4310000
r7 : c4759380  r6 : 07bef61d  r5 : 00000000  r4 : 00000000
r3 : c44cc440  r2 : 00000000  r1 : 00000000  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 74910019  DAC: 00000051
Register r0 information: NULL pointer
Register r1 information: NULL pointer
Register r2 information: NULL pointer
Register r3 information: slab kmalloc-1k start c44cc400 pointer offset 64 size 1024
Register r4 information: NULL pointer
Register r5 information: NULL pointer
Register r6 information: non-paged memory
Register r7 information: slab kmalloc-128 start c4759380 pointer offset 0 size 128
Register r8 information: slab kmalloc-2k start c4310000 pointer offset 0 size 2048
Register r9 information: non-slab/vmalloc memory
Register r10 information: non-paged memory
Register r11 information: non-paged memory
Register r12 information: non-paged memory
Process reboot (pid: 51, stack limit = 0xc80046d9)
Stack: (0xe0851d30 to 0xe0852000)
1d20:                                     c4759380 fbd77200 000005ff 002b9c70
1d40: c4759380 c4759380 00000000 07bef61d 00000600 c0d6fe7c c2193014 00000058
1d60: 00090acc c067a214 00000000 c4759380 c4310000 00000000 c44cc854 c067a89c
1d80: 00000000 00000000 00000000 c4310468 00000000 c4759380 c4310000 c4310468
1da0: c4310470 c0643258 c4759380 00000000 00000000 c0c4ee24 00000000 c44cc810
1dc0: 00000000 c0c4ee24 00000000 c44cc810 00000000 0347d2a8 e0851e00 e0851e00
1de0: c4759380 c067ad20 c4310000 00000000 c44cc810 c27f8718 c44cc854 c067adb8
1e00: c4933000 00000002 00000001 00000000 00000000 c2130850 00000000 c2130854
1e20: c25fc488 00000000 c0ff162c 00000000 00000001 00000002 00000000 00000000
1e40: c43102c0 c43102c0 00000000 0347d2a8 c44cc810 c44cc814 c2133da8 c06d1a60
1e60: 00000000 00000000 00079028 c2012f24 fee1dead c4933000 00000058 c01431e4
1e80: 01234567 c0143a20 00000000 00000000 00000000 00000000 00000000 00000000
1ea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1ee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1f40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1f80: 00000000 00000000 00000000 0347d2a8 00000002 00000004 00000078 00000058
1fa0: c010028c c0100060 00000002 00000004 fee1dead 28121969 01234567 00079028
1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6 600e0030 fee1dead 00000000 00000000
 msm_atomic_commit_tail from commit_tail+0x9c/0x188
 commit_tail from drm_atomic_helper_commit+0x160/0x188
 drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe0
 drm_atomic_commit from drm_atomic_helper_disable_all+0x1b0/0x1c0
 drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x88/0x140
 drm_atomic_helper_shutdown from device_shutdown+0x16c/0x240
 device_shutdown from kernel_restart+0x38/0x90
 kernel_restart from __do_sys_reboot+0x174/0x224
 __do_sys_reboot from ret_fast_syscall+0x0/0x1c
Exception stack(0xe0851fa8 to 0xe0851ff0)
1fa0:                   00000002 00000004 fee1dead 28121969 01234567 00079028
1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6
Code: 15922088 1184421c e1500003 1afffff8 (e5953000)
---[ end trace 0000000000000000 ]---

Fixes: 0a58d2ae572a ("drm/msm: Make .remove and .shutdown HW shutdown consistent")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

As can be seen from the backtrace, the error is generated because
msm_atomic_commit_tail is called in the shutdown path. I've fixed the
particular issue. Maybe we should consider shortcutting all mode_config
initialization in case of headless Adreno chip? This would be more
intrusive, so I haven't followed that path. However if you think that
this should be a proper way to fix the issue, I'll try doing it.

---
 drivers/gpu/drm/msm/msm_atomic.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 1686fbb611fd..98c526246ff1 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -186,11 +186,16 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct msm_kms *kms = priv->kms;
 	struct drm_crtc *async_crtc = NULL;
 	unsigned crtc_mask = get_crtc_mask(state);
-	bool async = kms->funcs->vsync_time &&
-			can_do_async(state, &async_crtc);
+	bool async;
+
+	if (!kms)
+		return;
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	async = kms->funcs->vsync_time &&
+			can_do_async(state, &async_crtc);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
-- 
2.39.0

