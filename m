Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71065403A9A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E436E1A7;
	Wed,  8 Sep 2021 13:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436A36E0EC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:29:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d6so3280427wrc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xcJdLHU6Go8+IFOAWyMibgRPmZ3htM4s/PKOMF0uNQA=;
 b=Gr2zGO7Lcod/T304z8qSBNDEMuaFxCnKR4H4elcGlz3Gjx25jaG9TOehyfdzQg6y70
 DsxoYYy8z29R/E9nhQx42HZKEBAGHfSAfOMDwJYxWZqYIIkQysS/UVBcicaMrYWj4+uZ
 /WKqDZoSOxK/aUsu9BAH9TEn1RxqT0xvK4BZn+Bo7C1VxxNvisH0ZfyzLNpYXuoNlcce
 tCy9UnfZu+nHZPTlPl1znsDVZ6qXb0ahu8hjq9UDPpieGPf2WoqLnwG2PRh4xDhCQFeD
 hx1VC36g38RDaAP6fdVwa3CIG8CbqiSlzJ93Lmmmcu5KyLzroMHSf6FseyuifseMl8ey
 Mn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcJdLHU6Go8+IFOAWyMibgRPmZ3htM4s/PKOMF0uNQA=;
 b=n++wWQDvS1T1yLoeUi3x+eLLSwbWppqV9fC0v7G9/vrbk3VmSZ3qbPTcJbfF60rIBQ
 7rSBGPpSmbGorOxmDqHOHHi5ldwneCzfTLtnB13/+mCUK3ANsxhSLNC89vUxcPNdPA2r
 v3LyvDrqudQ9uUmoh96HJTNhoSN66J1fNfgVo+EQoJGOE+Z55i5RhQ3S1ibV4OsNl3v/
 soDO7L4jYHS/voRkHgXnl2QsSjfCllTW4pmrCSXJKtCSvmhIoTO/xSbOrGISYg0aE4Ll
 rZ//Sndq55WWuJBkVokvH2igTNqoEoQCWSRWNE0TR8G98MjMTVKJ5cajoSGTY7F8Hz72
 JSiA==
X-Gm-Message-State: AOAM5307tDynyK5CrvS740kfY0Oh7Vix44qHSQEKkPI1khsgsngL8Lb5
 SO16Gn3rG6zC8kEWgf1X5tOS3EA3iOQGXegI
X-Google-Smtp-Source: ABdhPJxEWspGH/w3ru3mvriypkQYkTvSKZBqm5QmKKI5rjIspMTzT60GyPnkFo300TaeXHzd9KWHfg==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id
 r13mr4206105wru.230.1631107778887; 
 Wed, 08 Sep 2021 06:29:38 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k18sm2138959wmi.25.2021.09.08.06.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:29:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com,
	daniel@ffwll.ch,
	alexdeucher@gmail.com
Subject: [PATCH 2/8] drm/ttm: add some general module kerneldoc
Date: Wed,  8 Sep 2021 15:29:27 +0200
Message-Id: <20210908132933.3269-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908132933.3269-1-christian.koenig@amd.com>
References: <20210908132933.3269-1-christian.koenig@amd.com>
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
index 997c458f68a9..6c19290f7ea9 100644
--- a/drivers/gpu/drm/ttm/ttm_module.c
+++ b/drivers/gpu/drm/ttm/ttm_module.c
@@ -39,6 +39,18 @@
 
 #include "ttm_module.h"
 
+/**
+ * DOC: TTM
+ *
+ * TTM is a memory manager for accelerator devices with dedicated memory.
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

