Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6dtMAdRSlWl6OgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 06:49:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2671532C0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 06:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C5410E563;
	Wed, 18 Feb 2026 05:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="DBHpm3JG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ABD10E197
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 05:49:01 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-c6e18da0f82so271279a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 21:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1771393741; x=1771998541;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/Kj/5Xgr8gKZrPyXJkXeSAAqt29f63/gJJhoCtap5U=;
 b=DBHpm3JGUCh7QxTSGytlfm1q4B4u5ouFCFzX+DzY0DdwSYDQGzejqcP394+Hwkmy+G
 0oJlPfcL8/z+FbYx0ivCg/wnLlpot8zpTrlIhDV72zjoJYv48ssgSfaAUoy6SZvmepRg
 2T2FDKyUXQCCeaC9d5EjLCdHDJoYvXy0FEPElSWkijMm5+p7vwLKj3nrf7S2DpnyNpJa
 dLTgrnitpEP9sljEpRgxB7VBRae3aXuU3Ltc1rCEPxhZu3qDUizEe8gx6ovoyOj9ABVJ
 3k8fLHnQUDz0BjS719ZEza0QCxztOhk4EcoH5MvhRReK9Dy4DUj2AbWxG9hGKOxQw27Y
 I3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771393741; x=1771998541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/Kj/5Xgr8gKZrPyXJkXeSAAqt29f63/gJJhoCtap5U=;
 b=rwnen/MwvLFTYXJdCllSjYj5vaO9J6sJAgxDETamNe2SkcLIMS4cADGzP2OZKAEd7M
 Mq0t/ZXJlxfcATnGm1WcRSWx74XWJKp569zxBgLEtADWHxb7NxUh5t6Ci2XKfNR5Q5Nf
 ErI4S902n6UX5n/LSk9mauEWDjGvaYC/VPPr6RIUO7eyo0BQPGP12kWNcYIusSClx+WV
 MQQX2X7OoAIJc+2D1Gmk4akyJtjvYVvINsdKy4zE3pPakGrvh57f2t2TVXDic+KM5gLw
 DZmAvAMy9j0/NqwNLkJHIOErdv/Lbyq6OKRL0LQ3Qy83dMv949c7t924Roc1OOQ92SXa
 huuA==
X-Gm-Message-State: AOJu0YwMsD+zOH+HoqQDgHCS9+3BVVgzc8Bj/O0b7qAZVBViHI1ZgwBs
 TDR30bQGoxPy0xyI0yaIhP1n3ItA5Nxfwc4C558RMd5wPOp6Ir21DD1FQRVJg43zjILrvMjfRl2
 uCB16
X-Gm-Gg: AZuq6aJP4hDMZzuYMcigiaLna/m2NgIdLvH261rMuRDqnS6HTCRopuzY30tC7KbBnUS
 gJfu4xkXdpioLN8MqfT7sQMm3TIg/YNBupw2twrlll5Dc0wzS5bx521iyRnzewdwbwqwcwMzyD+
 umXdW6vPsqikrO8EJ/vX8V4VxCV4ISvCLFlQDXks3tH6dAA2jz7/p1NP2xGQcHfajXmMW6yxrTa
 Z3SoK03AFX07nBZ88bgMgUFHqPiejPA37n7MNSaHbRmHeWIgWWyggcCOOnyEi1m9MhUsDv65t4b
 QLiDMnTMaK4br6Gn8Kn/iZPFqLZ4RMNd5KoQNLrDflCMvm61E9x0zE6llBXnrr1+XQmEFdgovEY
 3vgMQmwwbqBLQEnU3bNdWjRJiubtwb3LfovP4F4U34V7TcUzDOUbzm4HKFLcG8ffOj/ODRkvZu+
 uj8Xunn8EDWMaAXmeD5MIw
X-Received: by 2002:a05:6a00:39a5:b0:824:91f5:aa2d with SMTP id
 d2e1a72fcca58-824c6119c5emr9806459b3a.5.1771393741340; 
 Tue, 17 Feb 2026 21:49:01 -0800 (PST)
Received: from localhost ([132.147.84.99]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-824c6a3f83csm15923133b3a.17.2026.02.17.21.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 21:49:00 -0800 (PST)
From: Shenghao Yang <me@shenghaoyang.info>
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shenghao Yang <me@shenghaoyang.info>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v4] drm/gud: fix NULL crtc dereference on display disable
Date: Wed, 18 Feb 2026 13:47:11 +0800
Message-ID: <20260218054711.63982-1-me@shenghaoyang.info>
X-Mailer: git-send-email 2.53.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.69 / 15.00];
	URIBL_BLACK(7.50)[shenghaoyang.info:mid,shenghaoyang.info:dkim,shenghaoyang.info:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rubenru09@aol.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:me@shenghaoyang.info,m:lkp@intel.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_TO(0.00)[aol.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_ALLOW(0.00)[shenghaoyang.info:s=google];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DMARC_POLICY_ALLOW(0.00)[shenghaoyang.info,reject];
	DKIM_TRACE(0.00)[shenghaoyang.info:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linaro.org:email,shenghaoyang.info:mid,shenghaoyang.info:dkim,shenghaoyang.info:email]
X-Rspamd-Queue-Id: 1B2671532C0
X-Rspamd-Action: add header
X-Spam: Yes

gud_plane_atomic_update() currently handles both crtc state and
framebuffer updates - the complexity has led to a few accidental
NULL pointer dereferences.

Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
on USB disconnect") [1] fixed an earlier dereference but planes
can also be disabled in non-hotplug paths (e.g. display disables
via the desktop environment). The drm_dev_enter() call would not
cause an early return in those and subsequently oops on
dereferencing crtc:

BUG: kernel NULL pointer dereference, address: 00000000000005c8
CPU: 6 UID: 1000 PID: 3473 Comm: kwin_wayland Not tainted 6.18.2-200.vanilla.gud.fc42.x86_64 #1 PREEMPT(lazy)
RIP: 0010:gud_plane_atomic_update+0x148/0x470 [gud]
 <TASK>
 drm_atomic_helper_commit_planes+0x28e/0x310
 drm_atomic_helper_commit_tail+0x2a/0x70
 commit_tail+0xf1/0x150
 drm_atomic_helper_commit+0x13c/0x180
 drm_atomic_commit+0xb1/0xe0
info ? __pfx___drm_printfn_info+0x10/0x10
 drm_mode_atomic_ioctl+0x70f/0x7c0
 ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
 drm_ioctl_kernel+0xae/0x100
 drm_ioctl+0x2a8/0x550
 ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
 __x64_sys_ioctl+0x97/0xe0
 do_syscall_64+0x7e/0x7f0
 ? __ct_user_enter+0x56/0xd0
 ? do_syscall_64+0x158/0x7f0
 ? __ct_user_enter+0x56/0xd0
 ? do_syscall_64+0x158/0x7f0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Split out crtc handling from gud_plane_atomic_update() into
atomic_enable() and atomic_disable() functions to delegate
crtc state transitioning work to the DRM helpers.

To preserve the gud state commit sequence [2], switch to
the runtime PM version of drm_atomic_helper_commit_tail() which
ensures that crtcs are enabled (hence sending the
GUD_REQ_SET_CONTROLLER_ENABLE and GUD_REQ_SET_DISPLAY_ENABLE
requests) before a framebuffer update is sent.

[1] https://lore.kernel.org/all/20251231055039.44266-1-me@shenghaoyang.info/
[2] https://github.com/notro/gud/wiki/GUD-Protocol#display-state

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com/
Fixes: 73cfd166e045 ("drm/gud: Replace simple display pipe with DRM atomic helpers")
Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
---
v4: Send SET_DISPLAY_ENABLE=1 unconditionally on crtc enable
v3: Dropped stable AUTOSEL opt out
v2: Moved controller and display control commands to crtc
    enable / disable functions.

[v3]: https://lore.kernel.org/lkml/20260203172630.10077-1-me@shenghaoyang.info/
[v2]: https://lore.kernel.org/lkml/20260201095956.21042-1-me@shenghaoyang.info/
[v1]: https://lore.kernel.org/lkml/20260118125044.54467-1-me@shenghaoyang.info/

 drivers/gpu/drm/gud/gud_drv.c      |  9 ++++-
 drivers/gpu/drm/gud/gud_internal.h |  4 ++
 drivers/gpu/drm/gud/gud_pipe.c     | 59 +++++++++++++++++++++---------
 3 files changed, 53 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 42135a48d92e..a2000991ecbe 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -339,7 +339,9 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
 }
 
 static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs = {
-	.atomic_check = drm_crtc_helper_atomic_check
+	.atomic_check = drm_crtc_helper_atomic_check,
+	.atomic_enable = gud_crtc_atomic_enable,
+	.atomic_disable = gud_crtc_atomic_disable,
 };
 
 static const struct drm_crtc_funcs gud_crtc_funcs = {
@@ -364,6 +366,10 @@ static const struct drm_plane_funcs gud_plane_funcs = {
 	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
+static const struct drm_mode_config_helper_funcs gud_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
 static const struct drm_mode_config_funcs gud_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create_with_dirty,
 	.atomic_check = drm_atomic_helper_check,
@@ -499,6 +505,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
 	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
 	drm->mode_config.funcs = &gud_mode_config_funcs;
+	drm->mode_config.helper_private = &gud_mode_config_helpers;
 
 	/* Format init */
 	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index d27c31648341..a5b7e53cf79c 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -62,6 +62,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val);
 
 void gud_clear_damage(struct gud_device *gdrm);
 void gud_flush_work(struct work_struct *work);
+void gud_crtc_atomic_enable(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state);
+void gud_crtc_atomic_disable(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state);
 int gud_plane_atomic_check(struct drm_plane *plane,
 			   struct drm_atomic_state *state);
 void gud_plane_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 4b77be94348d..6c62080213c7 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -580,6 +580,44 @@ int gud_plane_atomic_check(struct drm_plane *plane,
 	return ret;
 }
 
+void gud_crtc_atomic_enable(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state)
+{
+	struct drm_device *drm = crtc->dev;
+	struct gud_device *gdrm = to_gud_device(drm);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	if (crtc->state->mode_changed || crtc->state->connectors_changed) {
+		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
+		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
+	}
+
+	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 1);
+
+	drm_dev_exit(idx);
+}
+
+void gud_crtc_atomic_disable(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state)
+{
+	struct drm_device *drm = crtc->dev;
+	struct gud_device *gdrm = to_gud_device(drm);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 0);
+
+	if (crtc->state->mode_changed || crtc->state->connectors_changed)
+		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
+
+	drm_dev_exit(idx);
+}
+
 void gud_plane_atomic_update(struct drm_plane *plane,
 			     struct drm_atomic_state *atomic_state)
 {
@@ -607,24 +645,12 @@ void gud_plane_atomic_update(struct drm_plane *plane,
 		mutex_unlock(&gdrm->damage_lock);
 	}
 
-	if (!drm_dev_enter(drm, &idx))
+	if (!crtc || !drm_dev_enter(drm, &idx))
 		return;
 
-	if (!old_state->fb)
-		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
-
-	if (fb && (crtc->state->mode_changed || crtc->state->connectors_changed))
-		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
-
-	if (crtc->state->active_changed)
-		gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
-
-	if (!fb)
-		goto ctrl_disable;
-
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
-		goto ctrl_disable;
+		goto out;
 
 	drm_atomic_helper_damage_iter_init(&iter, old_state, new_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage)
@@ -632,9 +658,6 @@ void gud_plane_atomic_update(struct drm_plane *plane,
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-ctrl_disable:
-	if (!crtc->state->enable)
-		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
-
+out:
 	drm_dev_exit(idx);
 }
-- 
2.53.0

