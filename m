Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD6C4E6B6A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 01:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A310610E142;
	Fri, 25 Mar 2022 00:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1C710E142
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 00:06:23 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id t7so5297817qta.10
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 17:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gtiO7l2VwJnF4C2zD3rFhtpzWD/nRoEQVgYLxeu9/Gs=;
 b=UuDRm+nk2imejqGdfzDMwJrFjeplFOO3MCnyrKXxvaZMV6YmozAeO3E9FA3o6QxiA4
 iOXUGWfZALfthDZrFlJqk1YN6QSDnLPIvCLR/BVPQa3FyI91X/SpXKrlcRlMN+9l7fIf
 zH7EaQLbBqR9vXCOzDXiCkh+bQD1gbeO8IcOnXXCb2R8LAsJrRCRUWPiTH27rxYfLBF2
 4UsjhAqYthgskdyd1PGtz4YzksPeH9APZr93fKOetpXdAikq2xnUFIl2BdRgbL++ARNP
 kJ3g+JuDvd0qUCkWvLOdBmRneuKYMj95Tz/k5oXhuO4eS2uyn4Vp4pAtwkcJ0eaVbLo+
 TH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gtiO7l2VwJnF4C2zD3rFhtpzWD/nRoEQVgYLxeu9/Gs=;
 b=MowRfsORXi8KJXd0G54timxADlAft+S0iwPx5bHLiW2O7u3gmkpJlTZisWi58O9DBm
 E+FDF4jvCzuKGbbRWCJ2nLWA2jUqGU88ta1kflepg2na3mcCy/lzPMbvIjx1yTz7Rst5
 mJruDA61FkD+OJrp0B5CW7VOhKKJap1kvD6l+2xGB+Nv9j3Umv4uUkfTWtK2mYvicoJL
 0pQwp6XF1ijOdVtrv4n97IbI6jsTd3dc5PkBp00A7Zn2kuhaJuO4pElp0TOWrHvaMZPe
 EPROxTeLHtMGn3WsEk9evZP7Lxm9bc4p1QLFt1xszJO9MomtmdFlgVKdHzxrG9/765EV
 aZZQ==
X-Gm-Message-State: AOAM532ZljR96Ch7jNw0dn0Q/kzT8+ZZCTgDNDf9jsNIkUzpJJD6v9+Y
 IgvDNlTYBuHsDT9c3C2gagOTuxlO0B5avA==
X-Google-Smtp-Source: ABdhPJyusTdWZ/bsyx9NXKPC8hzabCoaoBbwKD74HT8zqlPd33J7hSHgE+09B4wQBE+xwCHovuXsQA==
X-Received: by 2002:a05:622a:1819:b0:2e0:6932:a249 with SMTP id
 t25-20020a05622a181900b002e06932a249mr6991708qtc.249.1648166782740; 
 Thu, 24 Mar 2022 17:06:22 -0700 (PDT)
Received: from localhost (115.25.199.35.bc.googleusercontent.com.
 [35.199.25.115]) by smtp.gmail.com with ESMTPSA id
 e7-20020ac85987000000b002e1b7fa2201sm3494688qte.56.2022.03.24.17.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 17:06:22 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd: Re-classify some log messages in commit path
Date: Fri, 25 Mar 2022 00:06:19 +0000
Message-Id: <20220325000622.1594343-1-sean@poorly.run>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

ATOMIC and DRIVER log categories do not typically contain per-frame log
messages. This patch re-classifies some messages in amd to chattier
categories to keep ATOMIC/DRIVER quiet.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 5 +++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index fae5c1debfad..1fcbab2fd3c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -113,8 +113,9 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
 	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 
 
-	DRM_DEBUG_DRIVER("crtc:%d[%p], pflip_stat:AMDGPU_FLIP_SUBMITTED, work: %p,\n",
-					 amdgpu_crtc->crtc_id, amdgpu_crtc, work);
+	drm_dbg_vbl(adev_to_drm(adev),
+		    "crtc:%d[%p], pflip_stat:AMDGPU_FLIP_SUBMITTED, work: %p,\n",
+		    amdgpu_crtc->crtc_id, amdgpu_crtc, work);
 
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b30656959fd8..45d130f86114 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9248,7 +9248,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			&bundle->flip_addrs[planes_count].address,
 			afb->tmz_surface, false);
 
-		DRM_DEBUG_ATOMIC("plane: id=%d dcc_en=%d\n",
+		drm_dbg_state(state->dev, "plane: id=%d dcc_en=%d\n",
 				 new_plane_state->plane->index,
 				 bundle->plane_infos[planes_count].dcc.enable);
 
@@ -9282,7 +9282,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 				dc_plane,
 				bundle->flip_addrs[planes_count].flip_timestamp_in_us);
 
-		DRM_DEBUG_ATOMIC("%s Flipping to hi: 0x%x, low: 0x%x\n",
+		drm_dbg_state(state->dev, "%s Flipping to hi: 0x%x, low: 0x%x\n",
 				 __func__,
 				 bundle->flip_addrs[planes_count].address.grph.addr.high_part,
 				 bundle->flip_addrs[planes_count].address.grph.addr.low_part);
@@ -9624,7 +9624,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
 		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
 
-		DRM_DEBUG_ATOMIC(
+		drm_dbg_state(state->dev,
 			"amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
 			"planes_changed:%d, mode_changed:%d,active_changed:%d,"
 			"connectors_changed:%d\n",
@@ -10328,7 +10328,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
 		goto skip_modeset;
 
-	DRM_DEBUG_ATOMIC(
+	drm_dbg_state(state->dev,
 		"amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
 		"planes_changed:%d, mode_changed:%d,active_changed:%d,"
 		"connectors_changed:%d\n",
-- 
Sean Paul, Software Engineer, Google / Chromium OS

