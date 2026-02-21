Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNgqGB0qmWk6RQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 04:44:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58CF16C0F8
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 04:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7CB10E11C;
	Sat, 21 Feb 2026 03:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gVIYrVXv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB7510E10E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 03:44:24 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-82318b640beso1471127b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 19:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771645464; x=1772250264; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8mQ/6om80WOoxF8Tb2IxdKJHO+VtjTLYYsstxqzSHM=;
 b=gVIYrVXvoDT9QemnysEuaTSz73g0FS0rm9BWadJJTPWwhEK3NbHHv8rRthaZGe4yhn
 qnIsvhnkGdQJsod/sXgxWQZruxuLVCZvMhRCSqy0XpmKOaSbF4EPja/Tum3aUnAjQMXt
 PkzWPeBtYvx6zyuyrfmu2+umcWVVblGd2PJ9DoLYZEcep58RlG9zGYp6cOqGK6p79hfh
 /JgXL9r1OjqIdP6uE7wVMZMEqj6AohPl/7rg3rgjG+lUnYAsJtwMalc22bqVQ4vMNUQI
 UVbGLXjztDbjY8z3gUsljeQBdlznKICUZ11V9e+kpD3xGLGzp55+Us9eieIltOJSaQLR
 v76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771645464; x=1772250264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M8mQ/6om80WOoxF8Tb2IxdKJHO+VtjTLYYsstxqzSHM=;
 b=aLS6T9xqxooBNfC63KxrlseAj719b6PzYF18gqTFBwbkIJqduw2u6NsWmHxqqHEJaJ
 YMIiFEoHbuEuOrpWYawID4aj8zHzRkawBLZIUVZENymJj2dRB8YMbwKKXPKKbX21036Y
 aemfE1hOwyMDdlxuucvZmCCdYWvGh9eX5+xepV46ZlRhoMOX2VMDMWCa2gL+TdQ8qD8b
 LcJ1luPjYER2lBRs/VvZA3PGwRBGHGCRWT6tAE95pdcpnKKMWvqMzDHHMziCJgpXKtsr
 v6r6TnvojKQBqIXWyqCpaSmIVfVglsGZjEb7fMTMb8+zuU7WjW06ry9MpItU8hSV2vFA
 CUyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh4gEersOnvJyIxmXKNLPEIaOF87B6/kxv+TBiIY0n88jncRFchTYxpCbB0Ad8QJywVoxh8+Ws1bk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfLk3x8b9adkSNOzHqtEELp/6QGL/qI+Z7PyUqmhqEHJGBq+0z
 cw4kKFWhiOpvKWPjIgzsg2obWZLdjzNVRvJ4N2n3WdWIn4QSMUNNYwFf
X-Gm-Gg: AZuq6aJT8Rd+K1XRTw6cie33OJ0oKSysFaveRThsQc4LnfcGoGaagtHw5NttV97yLfp
 I/pJ6+dYMIsykzIk8gomul7UcolI592O3vfRKUbeHhwXBylFOaGtoMA/HYVEMgJZuEdn0kHjoYI
 HY1f5n+Z3S973v61kthV6H0qTSw0lyVwyOlXMPLcMf8AOeP7ixSkxG1gjlCxw5MQ/6lDqJyN/fC
 MThz+VPB1axjTgDCt9SocVAy/jR4t+/FdMsrHXHt5EMRCWvkNSPChLKyC4+4JFApbDrnKB/uRxa
 8vfj3CGg00EBaHH+dspWUFhIs/Q55zEGvEtsjrHWFyJcUBk7PUvYNNIcP9h/r8T0symo1Yi8nk4
 A96ugerb2PrAfmTv6LSUc1oiCiAZgOBJxBC0Dx0woEqT31rFSYuMI1qTi+J3VK3DC8FAC
X-Received: by 2002:a05:6a00:392a:b0:81f:2b25:ca73 with SMTP id
 d2e1a72fcca58-826daa021c5mr1721717b3a.38.1771645463914; 
 Fri, 20 Feb 2026 19:44:23 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd8ba11bsm714951b3a.50.2026.02.20.19.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 19:44:23 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD POWERPLAY AND SWSMU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] Revert "drm/amd/pm: Disable SCLK switching on Oland with
 high pixel clocks (v3)"
Date: Fri, 20 Feb 2026 19:44:02 -0800
Message-ID: <20260221034402.69537-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221034402.69537-1-rosenp@gmail.com>
References: <20260221034402.69537-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B58CF16C0F8
X-Rspamd-Action: no action

This reverts commit 0bb91bed82d414447f2e56030d918def6383c026.

This commit breaks stable kernels older than 6.18 that are booted with
radeon.si_support=0 amdgpu.si_support=1 amdgpu.dc=1

In 6.17, threre are further commits that are needed to get the DC
codepath in amdgpu for Southern Islands GPUs working but they seem to be
too much of a hastle to backport cleanly. The simplest solution is to
revert this problematic commit

Cc: Timur Kristóf <timur.kristof@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 31 ----------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 05eaa06dfa34..c4386c86153b 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -3426,14 +3426,12 @@ static void si_apply_state_adjust_rules(struct amdgpu_device *adev,
 {
 	struct  si_ps *ps = si_get_ps(rps);
 	struct amdgpu_clock_and_voltage_limits *max_limits;
-	struct amdgpu_connector *conn;
 	bool disable_mclk_switching = false;
 	bool disable_sclk_switching = false;
 	u32 mclk, sclk;
 	u16 vddc, vddci, min_vce_voltage = 0;
 	u32 max_sclk_vddc, max_mclk_vddci, max_mclk_vddc;
 	u32 max_sclk = 0, max_mclk = 0;
-	u32 high_pixelclock_count = 0;
 	int i;
 
 	if (adev->asic_type == CHIP_HAINAN) {
@@ -3466,35 +3464,6 @@ static void si_apply_state_adjust_rules(struct amdgpu_device *adev,
 		}
 	}
 
-	/* We define "high pixelclock" for SI as higher than necessary for 4K 30Hz.
-	 * For example, 4K 60Hz and 1080p 144Hz fall into this category.
-	 * Find number of such displays connected.
-	 */
-	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		if (!(adev->pm.dpm.new_active_crtcs & (1 << i)) ||
-			!adev->mode_info.crtcs[i]->enabled)
-			continue;
-
-		conn = to_amdgpu_connector(adev->mode_info.crtcs[i]->connector);
-
-		if (conn->pixelclock_for_modeset > 297000)
-			high_pixelclock_count++;
-	}
-
-	/* These are some ad-hoc fixes to some issues observed with SI GPUs.
-	 * They are necessary because we don't have something like dce_calcs
-	 * for these GPUs to calculate bandwidth requirements.
-	 */
-	if (high_pixelclock_count) {
-		/* On Oland, we observe some flickering when two 4K 60Hz
-		 * displays are connected, possibly because voltage is too low.
-		 * Raise the voltage by requiring a higher SCLK.
-		 * (Voltage cannot be adjusted independently without also SCLK.)
-		 */
-		if (high_pixelclock_count > 1 && adev->asic_type == CHIP_OLAND)
-			disable_sclk_switching = true;
-	}
-
 	if (rps->vce_active) {
 		rps->evclk = adev->pm.dpm.vce_states[adev->pm.dpm.vce_level].evclk;
 		rps->ecclk = adev->pm.dpm.vce_states[adev->pm.dpm.vce_level].ecclk;
-- 
2.53.0

