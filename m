Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F563FFFC2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 14:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594CB6E889;
	Fri,  3 Sep 2021 12:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA07B6E889
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:31:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q11so8006151wrr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VsPLsLnCXFpv0vdAq78Xg5X2klUysHtWbTOyQshd/C8=;
 b=D65VvtizymjC6ofq+PbFJkCrMqguqEqmbFmxKxT7gJv3f8Rb3SCa+DHSGH13DDYXkS
 fTUEUSF2Rc2wo1q3Ca/LjG96mx+DuUtGak2idEyyjxY0ZLbQNNsmrNXv5imB5AIuQ/za
 ubxsMb2F6AtzMiAvt5EzOdCXvRcHrtQuZIlmizQgto/40G+0JaX8wRzQDbdnZ/4JZtCe
 RyFfvmvd7edba4s1iSkOr6/3LCDPI4ynXl75DA+y4b34JmSmfrjpnp3D71mgRFO8tEyW
 m2zZU2ptzQgMJ/OYFZmp0OiR/UTAiV+A5nD1qpo+vDL9X2ldz8FsnZ384LEO0nEfwCP7
 Z3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VsPLsLnCXFpv0vdAq78Xg5X2klUysHtWbTOyQshd/C8=;
 b=th9hDrBnaMrQ5P5SDOEHgxhnXz9plxiGHRQf/4+S9OLkFB7gk3K7DCjTTOKJBi0QXr
 Gmr3uZNRQ9XR9Iva4UQtcHr+D+i66klRAIWeMCcNFJIUIXZda0MNoUz66ZPJPqt46n5I
 LWZnmnSiPsHDP938SfJgV2oHfK6MimOv+77rDYnkt2kFNCnchBandQxCfWsKL1wUTy2v
 6NsJUeoDUWaNw0/BlhrRyF5XKUQWaLw0MLZGUJ/AFL78+877dpyFvkDYsUMnbNaKeRcu
 MOWRXn8XlFbMJlUSHLal7+Z9N6G1vejXYhzBWu3RQOU6bXqTi9Woigg14tY8Vqi7awP0
 jLVg==
X-Gm-Message-State: AOAM531+7/RtM6bDSXxqr2tSKTkKqgbFB53Mrae5uQEIzFAUOMG8AAyK
 qyc1kDgIyJqyzn7HgjFH7Bh90yFa3/UW6aiS
X-Google-Smtp-Source: ABdhPJwKT4cb9vAnZNFZ1tZSSZh250zbGsRhaULdpNo2W47tH7DxV1A3T4cko19R8DI/C3LQh0FSYA==
X-Received: by 2002:adf:e745:: with SMTP id c5mr3703112wrn.321.1630672299278; 
 Fri, 03 Sep 2021 05:31:39 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 x11sm4564873wro.83.2021.09.03.05.31.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:31:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/ttm: enable TTM TT object kerneldoc
Date: Fri,  3 Sep 2021 14:31:23 +0200
Message-Id: <20210903123123.116575-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903123123.116575-1-christian.koenig@amd.com>
References: <20210903123123.116575-1-christian.koenig@amd.com>
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
---
 Documentation/gpu/drm-mm.rst | 9 +++++++++
 include/drm/ttm/ttm_tt.h     | 9 +++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 195a857fa1d8..aa78e6ffc22e 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -54,6 +54,15 @@ TTM resource object reference
 .. kernel-doc:: drivers/gpu/drm/ttm/ttm_resource.c
    :export:
 
+TTM TT object reference
+-----------------------
+
+.. kernel-doc:: include/drm/ttm/ttm_tt.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/ttm/ttm_tt.c
+   :export:
+
 The Graphics Execution Manager (GEM)
 ====================================
 
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index e402dab1d0f6..fbc13d69ee73 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -126,8 +126,9 @@ int ttm_sg_tt_init(struct ttm_tt *ttm_dma, struct ttm_buffer_object *bo,
 void ttm_tt_fini(struct ttm_tt *ttm);
 
 /**
- * ttm_ttm_destroy:
+ * ttm_tt_destroy:
  *
+ * @bdev: the ttm_device this object belongs to
  * @ttm: The struct ttm_tt.
  *
  * Unbind, unpopulate and destroy common struct ttm_tt.
@@ -148,15 +149,19 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
 /**
  * ttm_tt_populate - allocate pages for a ttm
  *
+ * @bdev: the ttm_device this object belongs to
  * @ttm: Pointer to the ttm_tt structure
+ * @ctx: operation context for populating the tt object.
  *
  * Calls the driver method to allocate pages for a ttm
  */
-int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm, struct ttm_operation_ctx *ctx);
+int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
+		    struct ttm_operation_ctx *ctx);
 
 /**
  * ttm_tt_unpopulate - free pages from a ttm
  *
+ * @bdev: the ttm_device this object belongs to
  * @ttm: Pointer to the ttm_tt structure
  *
  * Calls the driver method to free all pages from a ttm
-- 
2.25.1

