Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C6335C614
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A9B6E558;
	Mon, 12 Apr 2021 12:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C548C6E558
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:21:06 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m3so14807309edv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BLtncd095+xL9sAk7UPWULzqDy/TXj9RcbNvIRcWzHc=;
 b=hZFBeBlsVcnAz5gmSpzAAzuixg0Npw5UtotY8EMvQPN6LB1ee9yCdndvVUJK/rYmKd
 szDrQ8MtopXOTG8JHm77rQerKRDPi6Apyr+ZYbTx9g449C5MFKaKKeW+gjTvfSPQ9ADh
 tdT66kqM0Uo4rY6VBqBWL+vHAqIyrsQdpVgqF2enK+QGeI0zl+ucf0rayXbDGns8zC+f
 RV4Ou7d1G4XVno/gslpZwnLTrXlrwpeEUctZ6b7tRem23GfC5DRyr3jyfcJQ/PWeUQIz
 tvFVFJYQozJWGsD/czOqwR8QgmCJvtDl39avZQs5EPuXYN0WzEu5V0KZAYiuIDzkixxy
 GGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BLtncd095+xL9sAk7UPWULzqDy/TXj9RcbNvIRcWzHc=;
 b=TVTKHQ/C8gqAZREHPbA6sFe5k6/bW/BtWt8xi8kPaofYzHXmZHHFnV6xRLWQrenEKc
 nzxtW+/AOOODQDI72JE2QNLK1lkBv6tJBfTbrjFae7Q5zc1BUfUhidG/xQV+W7C43VJ3
 WWmttz+UueC7BHjM5G93N2SQpKyHGNe/ash+YcrQbU6u4TjvCQxToK/SRjIMGkQe98mU
 nC8xkb1QBjLZ/XaWKPincqMlSHBkQcGtC/C8ZBEpng5D1+GJmgK7zMF0kdueR3nglKPe
 CoZUV0aYqEmz5E/9roxbyNAWhaiz8YaqNvJVCLNBvrsxHPF5umU6ltoW9pffo1OaRTB+
 tVhw==
X-Gm-Message-State: AOAM532Ec5pnJ4CLcbXUuaRq62+WaGa+WZqejGVL0qvzVXMgeLtPWF2v
 u3VQiOj1FhtzN7dgRAk7FnmTNMsJ/dVmxHow
X-Google-Smtp-Source: ABdhPJwcLzwVEDKVIT9sxe3wvAoAtvfklGINxUq5UiFqilJrRFh1mdSYPutmBFx2l1DxV0OKrVmg4g==
X-Received: by 2002:a05:6402:10c9:: with SMTP id
 p9mr29493182edu.268.1618230065164; 
 Mon, 12 Apr 2021 05:21:05 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id ck29sm6408191edb.47.2021.04.12.05.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:21:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 "Daniel Vetter" <daniel.vetter@ffwll.ch>,
 "Melissa Wen" <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: [PATCH 1/2] gpu: drm: Replace "unsigned" with "unsigned int"
Date: Mon, 12 Apr 2021 14:20:55 +0200
Message-Id: <20210412122056.28351-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412122056.28351-1-fmdefrancesco@gmail.com>
References: <20210412122056.28351-1-fmdefrancesco@gmail.com>
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
