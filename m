Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B6403AA7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFCD6E1B8;
	Wed,  8 Sep 2021 13:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D836E1B4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:29:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u16so3325074wrn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2INtmtay4yhrMB99ehHxoJxNcKftfJyg0aF7JJKMHM=;
 b=ON7I6+k4V89j41FcB7dbAyZhzhifDwItdByUveIFWj9kHEdi92NMqCeY1btBRwW2av
 aTZPJk7cnc4XkQEZEgK8yMAGKHk+KRafAdDIHxQXEJadhrwxUoSzl+eWljmTjewNCwp9
 RgDs6MqWRd4NQ+h5dJ/5hZG/LWNKF7dJX87FdlppC0HiGx0mfySwpMuQ/27G3gTypk+S
 9TTBjommypDeESESUZ1/Wa0DAbU8HMMHC59pSM+M+oTEKo+Fm13qpBw+m150P/fGtYD1
 ywhWwdvfmaZ7lPP8EllMrSO4EOMGXCvpaavN6rL3lt+9wCaXaPgDCdvo2/ZLqI2cgi/O
 SDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2INtmtay4yhrMB99ehHxoJxNcKftfJyg0aF7JJKMHM=;
 b=ZsYF5F9ablw8+1ueiWdt02+SN9icp98/GyatFeTI16HfChLfAC6+lbPQb5ocVUTwLP
 dl4GPeRLpB03UFN5W8kKL42FBjzHAx/RyxEBZpr3uPqj9n/rZTBexy24kD1xwkNWQA7L
 D2npPmaJ55jzWdHsJF7yoDxyPitIodOVe92OVqZ7DMDWYjX9N6PCLXAl1qviqsOpFdNx
 dax9tpuxAefKHcozf6ZphxUl3fv+ojD0IIjPiqgTH6zR/ktfZiuYXEGzeZDrVvSVoGG8
 X+e0VhS28lWQwi6R9FQKYdOhQConDq3fHmsgC6SuyCW2GT7wDmQExgMhmNsPsz26tO4S
 zUCA==
X-Gm-Message-State: AOAM532AKatBPmAyA33JoIC3XAp8P04LSvQTmXgaypx5wBa60lFSkLe5
 xWYIWHFnv7M6rs3On4VpCyOIDQnfFH/0WDnt
X-Google-Smtp-Source: ABdhPJxkJyZJIsbh73X8kiEFOX4Vqf3fvXcbXeG/AXDWHTvTCnPnP6htjusHG2fEGcQkVIvpewSdrQ==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr4189941wrs.149.1631107784035; 
 Wed, 08 Sep 2021 06:29:44 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k18sm2138959wmi.25.2021.09.08.06.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:29:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com,
	daniel@ffwll.ch,
	alexdeucher@gmail.com
Subject: [PATCH 8/8] drm/ttm: enable TTM page pool kerneldoc
Date: Wed,  8 Sep 2021 15:29:33 +0200
Message-Id: <20210908132933.3269-9-christian.koenig@amd.com>
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

Fix the remaining warnings and finally enable this.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 Documentation/gpu/drm-mm.rst | 9 +++++++++
 include/drm/ttm/ttm_pool.h   | 5 +++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 69c4a20b95d0..e0538083a2c0 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -67,6 +67,15 @@ TTM TT object reference
 .. kernel-doc:: drivers/gpu/drm/ttm/ttm_tt.c
    :export:
 
+TTM page pool reference
+-----------------------
+
+.. kernel-doc:: include/drm/ttm/ttm_pool.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/ttm/ttm_pool.c
+   :export:
+
 The Graphics Execution Manager (GEM)
 ====================================
 
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 4321728bdd11..ef09b23d29e3 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -37,7 +37,7 @@ struct ttm_pool;
 struct ttm_operation_ctx;
 
 /**
- * ttm_pool_type - Pool for a certain memory type
+ * struct ttm_pool_type - Pool for a certain memory type
  *
  * @pool: the pool we belong to, might be NULL for the global ones
  * @order: the allocation order our pages have
@@ -58,8 +58,9 @@ struct ttm_pool_type {
 };
 
 /**
- * ttm_pool - Pool for all caching and orders
+ * struct ttm_pool - Pool for all caching and orders
  *
+ * @dev: the device we allocate pages for
  * @use_dma_alloc: if coherent DMA allocations should be used
  * @use_dma32: if GFP_DMA32 should be used
  * @caching: pools for each caching/order
-- 
2.25.1

