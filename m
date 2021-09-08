Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC6F403AA6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3566E1B7;
	Wed,  8 Sep 2021 13:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BDA6E1A7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:29:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i28so3348596wrb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KbxFDLUp765zTrkAl1EbUb8CRqIXIgA+M9qP6QXf738=;
 b=RCcVw/GY+WyUg+FyLbSuLJjIHHEfwGkHNlSam0sFnpVkKc2lrTa5epkhqp5yzOZwkB
 GLQJ0nxSJnL6AIr/vp0H0qZQ4TQUj56M62RYO25x2oyVBInzIB62YMQRYFry3DpN4GFg
 lXF7Zxrs9pFdgRg77DBg2XJlzKCwsnqHt6ejr2EtSzL0Q+ZXlAqMmG6d+9MqUlQH62Kk
 MiWNsnvKba/npC0PJK+Va0b/gn/0fNfxdp8n6GcplGMRI00VaADqxbeSW2sKNtoowwgC
 9yaMbIPujasULhdXLc/xmHJ31MKOtmUvWLsVBLMoF7F8CIG4QqIg/xers8DfdHetzpmc
 EK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KbxFDLUp765zTrkAl1EbUb8CRqIXIgA+M9qP6QXf738=;
 b=OuLv8Kv8WVksIDo1UMg0uSasmbwU/Oek6flZtpS7fUJdiDs2/15YJxwUT+b6LNVuxg
 YU3uOFF/IijWddOpfoj3zD+n4bc2Kg9t7JTIsCm27TG2NeDa8FCuYwDUKdZmzW8L1VxI
 zWOTFqWXy9pNFfjw437XdCCCKXOXHX9gKcjkuM2brusxOBs0Htpfd4JtJ2QmB03mIUcN
 kaP0Xfs5CPPRiRacTc7WWLEo+0DbBDWRPtqVXQfMlMlQcHpGn7zAxP8zn7FQKFFxTDps
 HVtgbF6z9+d+faHu7j86ECLlg3ouIWjWim6j6YrLVPzsHAD2mfcZhHnV5l3uFWkSsQqt
 rLKw==
X-Gm-Message-State: AOAM531ZJd/xgvtLX6Mly3tDbwRbI21F9w8zplbkKw0OynBKZlnQ3Wwo
 qhPVlIiii8lmcq2vHQdjRbjKrq3fhG+OmY88
X-Google-Smtp-Source: ABdhPJzR4RUtIHMYsYjG9meUCr3R08fylESUAixrSTDD67HvVpfKi8FV36tjRbQ3mx1wFUAxSIaLcw==
X-Received: by 2002:adf:e745:: with SMTP id c5mr4132421wrn.321.1631107779699; 
 Wed, 08 Sep 2021 06:29:39 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k18sm2138959wmi.25.2021.09.08.06.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:29:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com,
	daniel@ffwll.ch,
	alexdeucher@gmail.com
Subject: [PATCH 3/8] drm/ttm: add kerneldoc for enum ttm_caching
Date: Wed,  8 Sep 2021 15:29:28 +0200
Message-Id: <20210908132933.3269-4-christian.koenig@amd.com>
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

Briefly describe what this is all about.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
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

