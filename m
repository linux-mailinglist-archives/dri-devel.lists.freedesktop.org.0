Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C9B807341
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 16:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DE310E746;
	Wed,  6 Dec 2023 15:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213C710E746
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 15:02:07 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c9ef682264so58984701fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 07:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701874925; x=1702479725;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u1zZpsz6Hajn4WlNLB7bRKZ+RtbXlToJX9UdTVguXzw=;
 b=LkGr2FW/ql1x9sne7zyi+b3KOdfXpYJ0budkVSRdvavhbWcRxJ+c5DIM2E13BPKOHB
 zx5sIENcXsaeIaS49EhyPzxeptvonER8xSh+I+EYSiDjRxd+AW64s8iMdnM4q1MJvQpf
 Smiw/buKNVU1rfwdQfD3uTLy28AC7d7M3Nps8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701874925; x=1702479725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u1zZpsz6Hajn4WlNLB7bRKZ+RtbXlToJX9UdTVguXzw=;
 b=j2ZPmm7ckzUqLc7ClDxJni/S60RLqzZJmqe6+518Npzj6TYTPd/4QEJauOQiEhRagk
 qx2tC6gEnCfIS5Km4D7WyVAG3wDbnYOLorA6kYZciwQYGhO5qQnGByDb65cyVq1E4UKY
 fD+Z3sGOkhL35pKJHOSFH8av5mZzJDGCIjrKgiHt45MQzQVNL7JP3AOEtgCC6wYpd3bP
 6AWgyi++1Oqyy1cXk95iC/R+V/B/ONZPHz29GtJZJCAkiSOcpJ87h8Eka4VC5562ufje
 CKNb5X6JfohSQnJfTJ5E8nYlC5H2dePfJjvC6ZwI1xci7cKWTl5rw4Z6Bln5dJBQiS4s
 +mTQ==
X-Gm-Message-State: AOJu0Yy+WshTfHJPnkLb1vshsluArD323YMM70WIbePMzodCw9sQQQt/
 xlsGoGe0D9ZHmItsvgJ+nxZR7w==
X-Google-Smtp-Source: AGHT+IGZNKBNPt39cTvI8EJKSjRt2XOXR6LOhsuTh1v/i0pyQvPn4ufkZh9/uUwGpLeyj0SrWl+OoQ==
X-Received: by 2002:a2e:a7c2:0:b0:2ca:2966:e754 with SMTP id
 x2-20020a2ea7c2000000b002ca2966e754mr234967ljp.21.1701874925276; 
 Wed, 06 Dec 2023 07:02:05 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:9e85:9d11:a604:aaf7])
 by smtp.gmail.com with ESMTPSA id
 ca19-20020a170906a3d300b00a1dc4307ed5sm20076ejb.195.2023.12.06.07.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 07:02:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/debugfs: drop unneeded DEBUG_FS guard
Date: Wed,  6 Dec 2023 16:01:55 +0100
Message-ID: <20231206150201.669055-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Makefile enables/disables the file compilation depending on
CONFIG_DEBUG_FS.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/drm_debugfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index f291fb4b359f..f80d9cf3e71a 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -45,8 +45,6 @@
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
-#if defined(CONFIG_DEBUG_FS)
-
 /***************************************************
  * Initialization, etc.
  **************************************************/
@@ -588,5 +586,3 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	debugfs_remove_recursive(crtc->debugfs_entry);
 	crtc->debugfs_entry = NULL;
 }
-
-#endif /* CONFIG_DEBUG_FS */
-- 
2.43.0

