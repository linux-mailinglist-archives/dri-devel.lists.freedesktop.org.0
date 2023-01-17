Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70E66DDAF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 13:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D21910E537;
	Tue, 17 Jan 2023 12:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5D310E537
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 12:33:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e3so21193506wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 04:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=GBXTZBzjFExwUsgMNbXMNmGYPR61v6tMr7PRj9eHQco=;
 b=HiYrL7vQkco1p0rqoYtymENPSlWbu3NQV84i372y6elWXXaRd7ZnxWiBl7k/5dmxaj
 4BjG5Y63XzN8nikViZGiU8uwqxVpZsD2hnC4NyiMMzCiuGhJjb9FWBWJrjuix3azCHt8
 lVubTroGx6/E6dhLfT63oLLGcoOrdSR9zUF/rR9C357O1SZnCOmX05D6G9v5A7rwoV4j
 T5vIm9eqc3GoZkPuqBYIfta6d4R78aWdiOuzhs8M731yK3Sa+Mj7NZZewpTtcjIiV9cU
 N9i7QaQ5PAyLwAB7Gd8a4n8Xz7bwVUjJTLaKR8Ze74nNsBMQ6TCRAxSfGHD9b3kSkfDO
 5Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GBXTZBzjFExwUsgMNbXMNmGYPR61v6tMr7PRj9eHQco=;
 b=o+Ke0VVL4hTkrdHPnHrAUovLplHAJmB71lZhOfYMCvdl3hc1FGaVOI11qUzwRL+Vsl
 10fO81EL2kvgg/YIKEp7r+CPYnaJZaT9PqaUEEaITL5R30mhUH04hG6Z8eIutEMVVieD
 PpIxDzZmMmVPn9cTuJ4e3b4R2IpkkdMC3f4XATQq9OmTnU2BgjakGccOHoDBxtrizxgz
 BH0l8cipabNv8nDqaVLlrWVbme2SxhHudIYq/svB35abUk0cfFw0Ydj30P08OYyUZDgy
 mNUG9Vk1J6h+8RsZEC2OGLu3U12+zTWgaYCv48ItQQDWbDBti+fNz/4rH0yqWZFjfwx6
 FqXw==
X-Gm-Message-State: AFqh2koNdWb/LaxbjiVDiHBzzI9Mn6Yto++9ORLmTmrgBEzCc3rgELTB
 DsYD6Nph1o5RKl00YaMQqPy59tbG2BQ=
X-Google-Smtp-Source: AMrXdXtTv38uIf8HgX4VU/INtdN6oimqah+xJzfUVU+IbnLa3AWiAjSVmSg4Ai4n/KxHe1bn0erlCA==
X-Received: by 2002:adf:fc4c:0:b0:2bd:dbbb:e7e2 with SMTP id
 e12-20020adffc4c000000b002bddbbbe7e2mr2520134wrs.60.1673958827287; 
 Tue, 17 Jan 2023 04:33:47 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b003db08be84e3sm1891453wmq.32.2023.01.17.04.33.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 04:33:46 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix some minor kerneldoc issues
Date: Tue, 17 Jan 2023 13:33:45 +0100
Message-Id: <20230117123345.387078-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

Pointed out by the kernel test robot while merging ttm_bo_api.h and
ttm_bo_driver.h.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d33bff038d3a..77b50875b99f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -127,9 +127,8 @@ EXPORT_SYMBOL(ttm_move_memcpy);
  * ttm_bo_move_memcpy
  *
  * @bo: A pointer to a struct ttm_buffer_object.
- * @interruptible: Sleep interruptible if waiting.
- * @no_wait_gpu: Return immediately if the GPU is busy.
- * @new_mem: struct ttm_resource indicating where to move.
+ * @ctx: operation context
+ * @dst_mem: struct ttm_resource indicating where to move.
  *
  * Fallback move function for a mappable buffer object in mappable memory.
  * The function will, if successful,
@@ -281,8 +280,8 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 /**
  * ttm_io_prot
  *
- * bo: ttm buffer object
- * res: ttm resource object
+ * @bo: ttm buffer object
+ * @res: ttm resource object
  * @tmp: Page protection flag for a normal, cached mapping.
  *
  * Utility function that returns the pgprot_t that should be used for
@@ -621,7 +620,7 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
 }
 
 /**
- * ttm_bo_move_accel_cleanup.
+ * ttm_bo_move_accel_cleanup - cleanup helper for hw copies
  *
  * @bo: A pointer to a struct ttm_buffer_object.
  * @fence: A fence object that signals when moving is complete.
@@ -665,7 +664,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
 
 /**
- * ttm_bo_move_sync_cleanup.
+ * ttm_bo_move_sync_cleanup - cleanup by waiting for the move to finish
  *
  * @bo: A pointer to a struct ttm_buffer_object.
  * @new_mem: struct ttm_resource indicating where to move.
-- 
2.34.1

