Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82DD7D4D56
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 12:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6324510E31A;
	Tue, 24 Oct 2023 10:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4CC10E31C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 10:09:27 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1ca79b731f1so8128845ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698142167; x=1698746967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=alTxVp4rWur3TMjDIHhUa1P8RmGtR3szGAa9KSaD0v8=;
 b=abhJebgXHVzggfM0amxzlV1FwEsHmmGjpp+u5HOSxtCFx+zv5iQJQigAGUiBl3njMv
 Q7e0w7Y6oLOXOU1hJZHyFT4ta1lk7p3ICo3QNmvls3UK5bgLN+mNxmCdb/Uz6SGjiFF6
 kHrXelGBvzglcj9a4XN9VMa1C+2NXuDyCsmw6lxJeIFy1OM44AyTYz1V+/1kCustWPgb
 G27xUw6gCUG46NQQN9UUrJvD8XPJ6B3VGtcm4Y+fdryoB3o6wpABGxBFQHBliiaPFPnT
 JLhM5nQJIvx7oMmgQPV6C1PfmCD4hlzsD9X7DzTJP773udbhW4zyCmdNHQISNbTbMMYn
 Hm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698142167; x=1698746967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=alTxVp4rWur3TMjDIHhUa1P8RmGtR3szGAa9KSaD0v8=;
 b=KsmI+w1eEO9f7a4CeNyNl7GlkGCK+nALebv+c3m1LAbVtUsHESrF1dZahdtbtMgFr4
 /uSHnt/kVwuGyi/FEdjFWJ5Y79ePryg4nrc0cbd/KJoyfp2zlw6EjeJ7rMTrKIrj27Za
 GbZApH0oHD9e12F3Sv0NI11J+6bfoA2Ywbx9YC4jrFMo/4tHuwQUakPium5OmQNI62wY
 2XPPQsFig5BuXHY0GUdrjZzD5y0t0O6ABU9FwlWO7NWKVfSnBCnP4Q9Pay3N1bXXoGpX
 /zc+zf0yW8vF019Lx8jxSJ9h6VI1nH4xGJLR+8X6tgknKIoqun7slJwgOfGIOU8EWxXJ
 5VJQ==
X-Gm-Message-State: AOJu0YxcpaQUybr4MbNViU8fpC8YpjTwWvgwAtwALUuokA1BQIFNMiRn
 DT/scxFV2FRsk4pQP9U5P+4=
X-Google-Smtp-Source: AGHT+IFqDgaQq47lVGiLEtfpxjnRnMp5SMyiv2eQAJj4A5h0TNaNhyb8wYSffoA4BP7xIgs0+olCew==
X-Received: by 2002:a17:902:f945:b0:1c3:a4f2:7c99 with SMTP id
 kx5-20020a170902f94500b001c3a4f27c99mr10762269plb.4.1698142167066; 
 Tue, 24 Oct 2023 03:09:27 -0700 (PDT)
Received: from fedora.. ([2400:2200:74c:7eed:5855:5fc6:625a:57c3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902eed500b001bfd92ec592sm7184523plb.292.2023.10.24.03.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 03:09:26 -0700 (PDT)
From: Kenjiro Nakayama <nakayamakenjiro@gmail.com>
To: airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/ttm: Remove comment about kfree for bo->destroy
Date: Tue, 24 Oct 2023 19:08:53 +0900
Message-Id: <20231024100853.785853-1-nakayamakenjiro@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Kenjiro Nakayama <nakayamakenjiro@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the kfree handling was removed[1], this patch removes the
instruction comment.

[1] 3507932390bb drm/ttm: move default BO destructor into VMWGFX v2

Signed-off-by: Kenjiro Nakayama <nakayamakenjiro@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e58b7e249816..e0068f17fc0a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -936,7 +936,7 @@ EXPORT_SYMBOL(ttm_bo_validate);
  * @ctx: TTM operation context for memory allocation.
  * @sg: Scatter-gather table.
  * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
- * @destroy: Destroy function. Use NULL for kfree().
+ * @destroy: Destroy function.
  *
  * This function initializes a pre-allocated struct ttm_buffer_object.
  * As this object may be part of a larger structure, this function,
@@ -1031,7 +1031,7 @@ EXPORT_SYMBOL(ttm_bo_init_reserved);
  * GEM user interface.
  * @sg: Scatter-gather table.
  * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
- * @destroy: Destroy function. Use NULL for kfree().
+ * @destroy: Destroy function.
  *
  * This function initializes a pre-allocated struct ttm_buffer_object.
  * As this object may be part of a larger structure, this function,
-- 
2.41.0

