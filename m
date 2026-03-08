Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNgfDk3mrWmn9AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 22:12:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9964B232478
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 22:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F6410E031;
	Sun,  8 Mar 2026 21:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tvu0Pwus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CEC10E031
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 21:12:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2ae88e16485so10346885ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773004360; x=1773609160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SVUEHpGLZsetFZXD2hp6GWpOMuo456n8g2SApWKR0cQ=;
 b=Tvu0Pwus38XQ6y5g0NME8cMCMPL9/aEBNdjffXrElvLM1dC/baAHiCkC5+ccaYJf6c
 nVAScp3GlcNN6CQdP4GftSlvRoQHRPRaN4jwy87ilK2gB98Tor8sIfnbKDeZc5eLdsja
 eB1bJgi7qLGMHLYuSGeZaIKpxWmuxeji/PxoVAmsBzFkdnuH+MJdFvpMDNUNry9VqYr9
 3+znTQU05aGevXyst9LuoI2dNH+/JvhV+DAvf+Vcfx6gngmyT6wR2QyfTVlnINwV3eH1
 1kYq+V8jrTuTtq29G6jmL2JQRxEph3KcjzXATUgiRaSdcj2D/tPz+vRXWHt/wBXjL4Vy
 wsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773004360; x=1773609160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVUEHpGLZsetFZXD2hp6GWpOMuo456n8g2SApWKR0cQ=;
 b=JyxynfTx4hVZd7CfZezfI08UExtDA8BxZx09j06n5dvVLwDffkQkvi7tS3fV4OXkoe
 dCFt7PYdHDC3vdjkI2uuBykdGe2U0b5AT7kQspKnjNHq6Hj98+aunbNCMwbF8veKcEbc
 xaTG1o2K+JARQBtYWHdjkRGIp3Ueeb5bbOjgStMW2f0gMRST5Q/mqSC5psPzbuMjQxls
 +TMzrLuJbH+9K4osO9z9MZ/oNLvoLyDDJoLdJH22DsFO9NG8DgSnmR0LrHUoqm0Ow0W0
 jG5oZwv3c41TKtk2B9LQz/tGzVXV4kNYRXWG/vdcfwZwYtjFXM8md/xmihnSvfHe/bV2
 IXtw==
X-Gm-Message-State: AOJu0YxBhwfrySMwVtTYoB/oer2lUjRxXELNam3ZFeH9cxEw9ldOyq9v
 Lb9XvIJOQV4DP4ZXhyjxMJW0XYLQYvrL3+aYh+5jTCMad0gKdvZec3oGxFsw4Lj36UA=
X-Gm-Gg: ATEYQzxY9dqiElU8BwSAcUsmMShFU3BOXref0N4QUozODZhxz1fG+KyCWGnCc7cnO+H
 ex71P+8M5Efj4eqzJkpciFP1446yTrJqzhAUExOEPgfRRTDZITmnDkdBJUG0URNEL6Wuak0Fq+6
 C5dluo2BoC1F8PPGUkhDDHnh7sMUsyJM7BkPiKJpIEzO1hVLZ/g1GpepNOUys4iNFbhI8YFWE4d
 upIl/EwlnAS54cGlYqe4fsHwtequy2JBeKwif1rqj/32I481JQxczIDMFDD0bXIutme+PNKVoj+
 xRwLFCPPmEHdhCqkLaU+7vEHtWssvxqcWZwDlml9aXa48QdojWe2mhExgQkbyykPj82czchDGi7
 z5P2Y/7SeVTCI9PTIjij3OezS7NqdL1lFaeErBCsHsUKW/Ym2bZUyxGp0L4qgPUJf94jx4TbZP6
 FVAFNz0nUOfa/NpPqZD6XHmNDKbYeLx8RX86p3FDnT2DRfBhf2s4p7fQ==
X-Received: by 2002:a17:902:ce83:b0:2ae:45bd:9b39 with SMTP id
 d9443c01a7336-2ae82416b18mr89231215ad.12.1773004359649; 
 Sun, 08 Mar 2026 14:12:39 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840ad894sm119471255ad.80.2026.03.08.14.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 14:12:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by
 other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] drm: dp_tunnel: use kzalloc_flex
Date: Sun,  8 Mar 2026 14:12:20 -0700
Message-ID: <20260308211220.33759-1-rosenp@gmail.com>
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
X-Rspamd-Queue-Id: 9964B232478
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Simplifies allocation by using a flexible array member to remove a
second kzalloc.

Added __counted_by for extra runtime analysis.

Simplify assignment loop. It always returns true. That is,
max_group_count is always equal to group_count.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 26 ++++++-------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index f442430d8de7..aad1605b956e 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -188,13 +188,13 @@ struct drm_dp_tunnel_group {
 struct drm_dp_tunnel_mgr {
 	struct drm_device *dev;
 
-	int group_count;
-	struct drm_dp_tunnel_group *groups;
 	wait_queue_head_t bw_req_queue;
 
 #ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 	struct ref_tracker_dir ref_tracker;
 #endif
+	int group_count;
+	struct drm_dp_tunnel_group groups[] __counted_by(group_count);
 };
 
 /*
@@ -1893,7 +1893,6 @@ static void destroy_mgr(struct drm_dp_tunnel_mgr *mgr)
 	ref_tracker_dir_exit(&mgr->ref_tracker);
 #endif
 
-	kfree(mgr->groups);
 	kfree(mgr);
 }
 
@@ -1913,33 +1912,20 @@ drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count)
 	struct drm_dp_tunnel_mgr *mgr;
 	int i;
 
-	mgr = kzalloc_obj(*mgr);
+	mgr = kzalloc_flex(*mgr, groups, max_group_count);
 	if (!mgr)
 		return ERR_PTR(-ENOMEM);
 
+	mgr->group_count = max_group_count;
 	mgr->dev = dev;
 	init_waitqueue_head(&mgr->bw_req_queue);
 
-	mgr->groups = kzalloc_objs(*mgr->groups, max_group_count);
-	if (!mgr->groups) {
-		kfree(mgr);
-
-		return ERR_PTR(-ENOMEM);
-	}
-
 #ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 	ref_tracker_dir_init(&mgr->ref_tracker, 16, "drm_dptun");
 #endif
 
-	for (i = 0; i < max_group_count; i++) {
-		if (!init_group(mgr, &mgr->groups[i])) {
-			destroy_mgr(mgr);
-
-			return ERR_PTR(-ENOMEM);
-		}
-
-		mgr->group_count++;
-	}
+	for (i = 0; i < max_group_count; i++)
+		init_group(mgr, &mgr->groups[i]);
 
 	return mgr;
 }
-- 
2.53.0

