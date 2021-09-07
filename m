Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B444024CB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994E7899D6;
	Tue,  7 Sep 2021 08:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B28C89907
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:01:40 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m9so13103058wrb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aklhp4nSOlXmuo2T825fChTwU39hx8MVy1/F2BcXUSc=;
 b=B4X19oanJJ0F/HReA2ixrxXfWsOstNsZeBcYf3pi+3CefAy3MFpzUHf/i5O1fyY9L/
 vKqGkTTslakBDR2RpzRlWX/kjCQiftdy5SvexJ/NUG3tksMpDHuPYK175HbpmkV/Cl6b
 S4aY+DznKnPZTgJstZBflkOYH6tzv1IQ0e7TQasew7Fc7Wf8b+k8uRNxpD97hbNtF+Wa
 c6xgSeAU2PG3m4JXw6R4PvXIpysZAB6L+6tuYtfK8Oq+svfQFkprYuMYQ99ExT/mwutV
 KhE7mP9vepdOJEHficHtTWql4cb1rRROOw/TED0AL/qVpqD24z9dHGqpAMvWdBxMlyIi
 g/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aklhp4nSOlXmuo2T825fChTwU39hx8MVy1/F2BcXUSc=;
 b=a6Xnay+TtqZ0nIL3DCkMQxkYlLU1MCjEyUYUnVp/sd+5ko3bvsvbNo6SEhftnK96CK
 GZNFOaMNnT+tIeCtFa7KsOTstoVqWTDkJzgDYQPuB978PKcf6z29BGmRLJEsvhQXRe27
 8VxTv7pGjZoMzdFAiiWTeIofT0GCJ5nsQIxqvldHUE13E6L4HILVumxmAb7YaK8e/uot
 SsjxM8vZ8/Z2QfxGI4Ej1Rb+hRS1pFneGXdHwLcwd73DYgV9zMUDzNdwUx+BAR6K2dYi
 Zjhd+6AT/Fs6SZV8eymO1kbXYCPSdzGEdwSup1OzA8rLtxsSo8u4uomiwUkGmpJrTZy4
 iGHQ==
X-Gm-Message-State: AOAM530pyGhIkbRR2ZKcdr2C1izOVBZXCI6aBcTdQoX5QhMrAh7OtWq0
 T4zRAjwKgFbW61x7aoygSOkh252cXkDf1nob
X-Google-Smtp-Source: ABdhPJzQCe00BvBOKSjM427o5aC62ZBpsZ7i4RbAHQiTBF8xl1+sxikFHT0WMMEqFAhk+KAC+HSW5A==
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr17460144wrh.108.1631001699147; 
 Tue, 07 Sep 2021 01:01:39 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g1sm2248242wmk.2.2021.09.07.01.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:01:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com
Subject: [PATCH 3/8] drm/ttm: add kerneldoc for enum ttm_caching
Date: Tue,  7 Sep 2021 10:01:30 +0200
Message-Id: <20210907080135.101452-3-christian.koenig@amd.com>
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

Briefly describe what this is all about.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst  |  3 +++
 include/drm/ttm/ttm_caching.h | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 6b7717af4f88..f22c9f9a2c0e 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -31,6 +31,9 @@ The Translation Table Manager (TTM)
 .. kernel-doc:: drivers/gpu/drm/ttm/ttm_module.c
    :doc: TTM
 
+.. kernel-doc:: include/drm/ttm/ttm_caching.h
+   :internal:
+
 The Graphics Execution Manager (GEM)
 ====================================
 
diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_caching.h
index 3c9dd65f5aaf..235a743d90e1 100644
--- a/include/drm/ttm/ttm_caching.h
+++ b/include/drm/ttm/ttm_caching.h
@@ -27,9 +27,26 @@
 
 #define TTM_NUM_CACHING_TYPES	3
 
+/**
+ * enum ttm_caching - CPU caching and BUS snooping behavior.
+ */
 enum ttm_caching {
+	/**
+	 * @ttm_uncached: Most defensive option for device mappings,
+	 * don't even allow write combining.
+	 */
 	ttm_uncached,
+
+	/**
+	 * @ttm_write_combined: Don't cache read accesses, but allow at least
+	 * writes to be combined.
+	 */
 	ttm_write_combined,
+
+	/**
+	 * @ttm_cached: Fully cached like normal system memory, requires that
+	 * devices snoop the CPU cache on accesses.
+	 */
 	ttm_cached
 };
 
-- 
2.25.1

