Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C2B4636DC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A2E6E9AA;
	Tue, 30 Nov 2021 14:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7E86E9AA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:36:43 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3PtL6fL1z9vCD0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vue-2T3-AGS6 for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 08:36:42 -0600 (CST)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3PtL4bKSz9vCCK
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:36:42 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3PtL4bKSz9vCCK
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3PtL4bKSz9vCCK
Received: by mail-pl1-f199.google.com with SMTP id
 q13-20020a170902edcd00b00145280d7422so8306262plk.18
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 06:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bYCNT3kO7HfP/FKczPCMqhEA+GzsNhj1SS1NjAYBh+E=;
 b=NJKuEDH9aFfVM044j6gAjxuULJ4lkl4JYrb2jNz+y9mFasatcBqPILuTaPBBVHA6My
 j1jaQW0108Alax3nT58iUAwNZjS/p04DnRc92xeKvi35NEluJoPbU1SrQGlO4xGsAU/y
 kFHkPArX8MTkkFd0DHiRXSVroeMI0IV6Ss8x9jpvkRbZHGe410x3PQWxN8uRJiXCTgRj
 dy5ZOdG14QhW0/nqiDLxNmupTZW/DnluL2Z/Z1uAdueMWOoZvZDm4KxypqFrmBH1KT5r
 qfFfvXQV3l/WF/3ymzsQiruxTXyEwJH82HPBFH4cMXBLKtihoFSiHLxO15Bboz2htlVB
 OYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bYCNT3kO7HfP/FKczPCMqhEA+GzsNhj1SS1NjAYBh+E=;
 b=nDZ4ynVd7KNRHsU8MWC2ojXaWmLL8czYvvlYGDlE0xrMLndQNPm3axPcCAb0DdH0yJ
 0UPPOR/OIV5wyY0ICvlyMADUFRkMzGMyxnRXWiEO3fw5RYGLe1izf24xUzrmdDTKoPqv
 51BuE2iZMKS1wfXhsyayLrzuvJSUR2Pm8QjYX9FVYrQtLT/EvccMdbVPC8yReKuZsTmU
 gWJexvshi8OUk+LYIIY/HQK3pzM3GMYdUJRa152Oy0ymer7vU3r65nK0JKsZRhSLn5aY
 ptIVHhpeyn/il5vWBdLOEe8bcXQ2OvsZq1WYxAUk7ywpuaMWRm8LepQtliJJaz+1FpUr
 7Smw==
X-Gm-Message-State: AOAM530iiZj93CIrvrCzaRXa40luGPBiX3vdGD88KbGgG23D+bm245WB
 SGwvULyxxR7i2g8aVJP14JRYpOqukdO/mLwTX/9a5POj7QJY/+H/Jez7HpVPXVc4LYcsFtp8sE6
 Hmh75S7AFwQsf9oaUMHAfuUcLlmaYDIVl
X-Received: by 2002:a63:1f0e:: with SMTP id f14mr40052882pgf.242.1638283001949; 
 Tue, 30 Nov 2021 06:36:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBqar7smd0w2cVXcze+DnRqaj/Gm5ZSZ66JCEvvEpV8Pf+L9IE/rqGBer8vT+8b6zPimz/xQ==
X-Received: by 2002:a63:1f0e:: with SMTP id f14mr40052863pgf.242.1638283001761; 
 Tue, 30 Nov 2021 06:36:41 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id o129sm21447892pfg.44.2021.11.30.06.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 06:36:41 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/panel: Fix a NULL pointer dereference in
 versatile_panel_get_modes()
Date: Tue, 30 Nov 2021 22:36:35 +0800
Message-Id: <20211130143635.160440-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In versatile_panel_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode and there is a dereference of it in
versatile_panel_get_modes(), which could lead to a NULL pointer
dereference on failure of drm_mode_duplicate().

Fix this bug by adding a check of mode.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_PANEL_ARM_VERSATILE=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: aa6c43644bc5 ("drm/panel: drop drm_device from drm_panel")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/panel/panel-arm-versatile.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/drm/panel/panel-arm-versatile.c
index abb0788843c6..5e73083c09a2 100644
--- a/drivers/gpu/drm/panel/panel-arm-versatile.c
+++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
@@ -267,6 +267,9 @@ static int versatile_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.bus_flags = vpanel->panel_type->bus_flags;
 
 	mode = drm_mode_duplicate(connector->dev, &vpanel->panel_type->mode);
+	if (!mode)
+		return -ENOMEM;
+
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
-- 
2.25.1

