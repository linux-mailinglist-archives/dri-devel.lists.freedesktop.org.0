Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076BF4024C9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BDA899B5;
	Tue,  7 Sep 2021 08:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D029B89907
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:01:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i28so1817645wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HYTvQRGt3NhFaqOSrMpu7TPCql7VP+FkFkjiEIqR6oQ=;
 b=QEmg2swTJltB+1B1lmtK/jsVBtrHndqndUzKEJ2Vvnp/zsviuwLyjdJe5LtY5VwsI+
 ygE97bugEPX6jZuokhF+SCbPJOxeZ3nSumxowmh7VJOW6RvvBAP4Jcey1tG80kbysD2+
 5KoKo7MRfqyj5mcMELEczGtFhMR2j1M8XGLgbnfg5JkykbobpCDY+uePS39hHLoDAeNi
 Pfx6h+l1QtL0sY/WBJZ1WIvuLsjYysr458uctAzbInF+Vw9IpEMNU6OBMXdA7WY19VLC
 TaStB4y+EGMJ76ZAlrUGe8hq8qiEEV1C8OsdrMb4u43edCoRiDaQS5pSmb6AwG8+hNMv
 DBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYTvQRGt3NhFaqOSrMpu7TPCql7VP+FkFkjiEIqR6oQ=;
 b=YVjPk+W8jHBSU5yZbJFGpJCXr4bI/mutD2Sfx67E0quFIFHMDegolPfjSRrdAARSQ/
 C+m2Pct4OhjkgRb/k1fCy1bjZmmDYkXsH8Q6I5XzUsy3m/n/enedWeHj9KsJchnZd7Dx
 W+PbFAbXdtq8XDlbnjZBaj49KtsV852Kvh+mLRgtqu1UIU3o1usAS4qJ5EOvpwgAjPR9
 pVFvgzUObPmR1/xyXGk5aN8DzdEWSfjZDrKPTJco5QwrOOmiRvHwuoL8fHFlviR8I/He
 Wdwp9e1j0qQK21IiNrBEHnUijT3mjLbe4LfQUA45udylBF4UAYw8odC9U3hyIKiVL8T1
 gNUg==
X-Gm-Message-State: AOAM5324k5QtY3dIER06WKsIoC8LawDjBPkOHJjdNkeWSaZsuR5mRXds
 HExZuXdFgWmOCXyjvN1BTuCFEK0qy/SWsB2A
X-Google-Smtp-Source: ABdhPJzuBdhfADGubDBybcgfRgZCQksIqRJhVmkNGpOAqQ5/fFYTTw98FpeHoTpbEX3487tSHVwbWQ==
X-Received: by 2002:adf:8170:: with SMTP id 103mr17692341wrm.167.1631001698402; 
 Tue, 07 Sep 2021 01:01:38 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g1sm2248242wmk.2.2021.09.07.01.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:01:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com
Subject: [PATCH 2/8] drm/ttm: add some general module kerneldoc
Date: Tue,  7 Sep 2021 10:01:29 +0200
Message-Id: <20210907080135.101452-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907080135.101452-1-christian.koenig@amd.com>
References: <20210907080135.101452-1-christian.koenig@amd.com>
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

For now just a brief description of what TTM is all about.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst     |  3 ++-
 drivers/gpu/drm/ttm/ttm_module.c | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 8ca981065e1a..6b7717af4f88 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -28,7 +28,8 @@ UMA devices.
 The Translation Table Manager (TTM)
 ===================================
 
-TTM design background and information belongs here.
+.. kernel-doc:: drivers/gpu/drm/ttm/ttm_module.c
+   :doc: TTM
 
 The Graphics Execution Manager (GEM)
 ====================================
diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
index 997c458f68a9..11b59cf03ec3 100644
--- a/drivers/gpu/drm/ttm/ttm_module.c
+++ b/drivers/gpu/drm/ttm/ttm_module.c
@@ -39,6 +39,18 @@
 
 #include "ttm_module.h"
 
+/**
+ * DOC: TTM
+ *
+ * TTM is a memory manager for graphics devices with dedicated video memory.
+ *
+ * The basic idea is that resources are grouped together in buffer objects of
+ * certain size and TTM handles lifetime, movement and CPU mappings of those
+ * objects.
+ *
+ * TODO: Add more design background and information here.
+ */
+
 /**
  * ttm_prot_from_caching - Modify the page protection according to the
  * ttm cacing mode
-- 
2.25.1

