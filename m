Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C6D6DF8FE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91C810E850;
	Wed, 12 Apr 2023 14:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF0010E878
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:52:13 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l18so11124640wrb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681311132; x=1683903132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zQmjReLMkxtS3Ylf9Gai6KIzJluY9/zyQyab67UImSw=;
 b=SvTX5b95Fp3lg7mtX4/RWa8Mf7a2gOhtfr6ioS4WL7gaFBb+aIMtGKDoXkNf17u+9a
 PpSOq8T4PIwUhlbLIsl20tAweUBPl6cnFSII0kZ3YN045cm+QMrOiP6fmpadfCZ16IYF
 CZKLhBtfOxqeahGmJhXsUoQJJebl4MUeQl4AcJ7upwxC0RPeudKUY6pzI8yVVc19JIMI
 LXL+SsW+WQzsQBoDPH69sa3zJpPnI9wGH6owtFbfxT4HepkxLv0JJqKeBs1s+/uUIaqZ
 IU/oFxvoOlVZ5ujuml/1iJxndHzPsjweitGsA+GJ+vbiuZig9p7HVvKipEbjM3VxCsNF
 op5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681311132; x=1683903132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQmjReLMkxtS3Ylf9Gai6KIzJluY9/zyQyab67UImSw=;
 b=KCJWQfwP7Gfztuo5Z8H+9uHUvlE5oHbnqg8gbvr3TLUqUhtq3kDzt3zEUoI6IBKPCA
 3yof9FmOuL59UxG9u7VLXbFm2NuiYfcHt6CMylX7G4TRlfIy9MX7D/3Y0iq0NNcjRiTT
 IptnETmgA6bDDBmz3vc0/A7KKWBgYm7Rj2YNrxft9NXquhraqVGbDVwcRCdAabojsbVn
 vHJt0IXBzgnEjWvxBwLckO60RtoKr6UIEPnBstIgFUlc7nGNcQsfQzxilcUX/spkoujC
 gEqAjxAFbhspAu3GKdAijOo9dvUj8A2QpPhX5uMVjzfru5g1HwoozTDCyEk26j+MgsaA
 DSOQ==
X-Gm-Message-State: AAQBX9fjKJ9NRK1cfCt8kOVxLbQ8t6azvuPiJY2zQ8wpoZQANrIM661a
 UxRg6GKBR5ky2b1IVpGOZ8E=
X-Google-Smtp-Source: AKy350bW9c6+3vN1Jh4VAa9BdApkSG5WfC44W3xeZwa/25oFbUtp3Me1aSEWvGpwbr5vnKEOgchdcQ==
X-Received: by 2002:a5d:470b:0:b0:2f4:1953:37af with SMTP id
 y11-20020a5d470b000000b002f4195337afmr2395855wrq.16.1681311131848; 
 Wed, 12 Apr 2023 07:52:11 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adfe392000000b002c56013c07fsm17304166wrm.109.2023.04.12.07.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 07:52:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mcanal@igalia.com, stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 mwen@igalia.com, maxime@cerno.tech, wambui.karugax@gmail.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/debugfs: drop debugfs_init() for the render and accel
 node v2
Date: Wed, 12 Apr 2023 16:52:02 +0200
Message-Id: <20230412145206.2483-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412145206.2483-1-christian.koenig@amd.com>
References: <20230412145206.2483-1-christian.koenig@amd.com>
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

We want to remove per minor debugfs directories. Start by stopping
drivers from adding anything inside of those in the mid layer callback.

v2: drop it for the accel node as well

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/accel/drm_accel.c     | 3 ---
 drivers/gpu/drm/drm_debugfs.c | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 1b69824286fd..d473388ee807 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -99,9 +99,6 @@ void accel_debugfs_init(struct drm_minor *minor, int minor_id)
 
 	drm_debugfs_create_files(accel_debugfs_list, ACCEL_DEBUGFS_ENTRIES,
 				 minor->debugfs_root, minor);
-
-	if (dev->driver->debugfs_init)
-		dev->driver->debugfs_init(minor);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4855230ba2c6..54376e2400bb 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -242,7 +242,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		drm_client_debugfs_init(minor);
 	}
 
-	if (dev->driver->debugfs_init)
+	if (dev->driver->debugfs_init && dev->render != minor)
 		dev->driver->debugfs_init(minor);
 
 	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-- 
2.34.1

