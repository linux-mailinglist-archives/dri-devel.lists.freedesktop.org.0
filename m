Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1535C67F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D333D6E575;
	Mon, 12 Apr 2021 12:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C6C6E575
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:43:47 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id ba6so14896493edb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRH1ZfbEvRBoK5SPSjf6X7NL13GHB5xpKAzHGHnUqz0=;
 b=rXB8ZnyZviGJam15eHpyZf5Oo2gGqeAckKc/sjZsjj9YpoPrHWGSHJnXcu5h8EwIxQ
 YD4FYqVuhlf7Z9ywbyn4+bSi385XYKJxGpqNkK18uyBvWAL6wL2CfpbaFANsmXRi4H/x
 Ctvw6mOgn0+FpJbhlMzzCVYwNDPItuFiemKV41J0VEgZnGir0yZfMk11qcEZt/OVYP89
 f8qKfYF6uQjb3VoMAEUuC1OcHg0tOiFoCa+zs2dtLmAzXukIiMACPsdelLnLbknM06Ht
 rdQf9hNGaVCsQo99lIU6sqX3LQea6Q9sPM74JtTjA3UhFIuDW+nhrtds7duw08zcJNws
 t/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eRH1ZfbEvRBoK5SPSjf6X7NL13GHB5xpKAzHGHnUqz0=;
 b=sjo42tC/KeTxXF9MqzdAKZSnLv1N6rfAigV5pcWGQsCpStpL1q0VmCu0v+JmMFDMYn
 N4QvGeFlG5NlfSC+PktsBdIAjYtvHfg6dsHau7cPhoMLHLOklzTt+pyAoZ8h2McGMHSM
 MysGRD/OSG7DrFfvrZg8IsYrU7tXFgmaCf7j82iiMyxlHYj8RsVqPnor8fckrlp53PeH
 oJFGb+YRV16bQQHorILkXIL2l93lm/ECFSSCfuSjaH8R8oXNwRPtFsIoc/vYD38mvZp6
 nJnglMtZBmCfalITnLbIb1clAIkbmZ5wzJ4u4Bd4URsJWIb2m8RfZnANPeTHYCsWUmep
 79Pg==
X-Gm-Message-State: AOAM533T4Gt3fmMGi5YGikRq23/lMivKmCxtWw5Kml1kUwtMHovWwSkR
 2xf9fC5oKWHtHzy0P8cdF8bC5mCIqRcrXeH9
X-Google-Smtp-Source: ABdhPJze56IZDivDiiLOK3uVv3GcVvrylUHN5zGPjrseWxZMEBMgxn+4Uf5u7qPMII229Z75t8oaCQ==
X-Received: by 2002:a05:6402:1109:: with SMTP id
 u9mr29593383edv.174.1618231425565; 
 Mon, 12 Apr 2021 05:43:45 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id m6sm5939452eds.49.2021.04.12.05.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:43:45 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 1/2] drm: drm_atomic_helper.c: Replace "unsigned" with
 "unsigned int"
Date: Mon, 12 Apr 2021 14:42:14 +0200
Message-Id: <20210412124213.4628-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412124213.4628-1-fmdefrancesco@gmail.com>
References: <20210412124213.4628-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replaced "unsigned with "unsigned int" since the latter is preferred.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: Rewrote the "Subject" of the patches in the series

 drivers/gpu/drm/drm_atomic_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f2b3e28d938b..cd748ff61162 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -106,7 +106,7 @@ static int handle_conflicting_encoders(struct drm_atomic_state *state,
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	struct drm_encoder *encoder;
-	unsigned encoder_mask = 0;
+	unsigned int encoder_mask = 0;
 	int i, ret = 0;
 
 	/*
@@ -609,7 +609,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 	struct drm_connector *connector;
 	struct drm_connector_state *old_connector_state, *new_connector_state;
 	int i, ret;
-	unsigned connectors_mask = 0;
+	unsigned int connectors_mask = 0;
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		bool has_connectors =
@@ -1478,7 +1478,7 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i, ret;
-	unsigned crtc_mask = 0;
+	unsigned int crtc_mask = 0;
 
 	 /*
 	  * Legacy cursor ioctls are completely unsynced, and userspace
@@ -2575,7 +2575,7 @@ drm_atomic_helper_commit_planes_on_crtc(struct drm_crtc_state *old_crtc_state)
 	struct drm_crtc_state *new_crtc_state =
 		drm_atomic_get_new_crtc_state(old_state, crtc);
 	struct drm_plane *plane;
-	unsigned plane_mask;
+	unsigned int plane_mask;
 
 	plane_mask = old_crtc_state->plane_mask;
 	plane_mask |= new_crtc_state->plane_mask;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
