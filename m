Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549B4FF31A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2887710FFA1;
	Wed, 13 Apr 2022 09:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2929210FFA1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:12:46 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g20so1570922edw.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 02:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ivUogtVqlQN+ilYxQHUNcor2QbLxNrwv/heOgHjNYsE=;
 b=nDGhfkg9n5/mcWKvMvSDaRxXcHtD4R19fMjsctStw+5s2YiHBFvxmNeEVA3Na+Cz9P
 PxjfGIvHdIGFoGI8lLI9HuLEoRZMDgHrmpdsgZYGYD3fv2pZ3BVPPx7U3zVL0/ydLs1Y
 eQ1I1EkBnYlRsUz4Ynpt/hHJ6TcRphwuXOOSxl75pn3DZzm1ZttkdU9CmOrRvuxmwAtq
 JvQ7UOV9Qfac8ZLuSYodC3IlI97gHAoiQZqpAaR9OuKckS8ynSXhoc3x5UJocjPP28Am
 VI6ejSa0XwFQiYQVPvrwzh64g50ztByLQFKJ2a4mS6NE7N6xDrX3L9QL3+CcizNhuYCD
 GQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ivUogtVqlQN+ilYxQHUNcor2QbLxNrwv/heOgHjNYsE=;
 b=jfyJgrPt+LfXDJktVWyrx2ux5mnsb1bTvwvSBnqbSr1+VQEzyKBVIzUPnO0UixviNt
 JgfeO/eFVSLQ/xSZne7ocG8+Z5dUawMvxFX2uxJhjdy01Ayxc5sUrkxgZ5O/B4q4AziJ
 49rCXtIdSV7bsNEkv/RMT2E2VablHi95EQ/LkL2Flh4tT24BPDeJ//qGnJEvy2rjVFwQ
 nXNQFIXaYuWAbqZyckYLwFsUV1DXu3Z1CUcTi8YuZYEhqt0QtflbsbR12cWYo1l4UhXP
 1SJ8gfa7pK5OLvFXu2yGKLVbANNfAR3ChHuDcN0lSEdBMQ8ykDmOX0JlqZ5ZUrHzU7m+
 Jzhg==
X-Gm-Message-State: AOAM531EVpJPKiJHg5E94AIbXoSXRdH45HtWTk72YVE2r4j3vYxGcW1g
 rAJa5Df6+3DysQ4BMleFtbw=
X-Google-Smtp-Source: ABdhPJxwEdTuQup8o5VWZeYZgd5+I78T/0zMkCYOXyiqpxwoCgRPFnd4TL9Gg91im15WLo2NWEZQYw==
X-Received: by 2002:a50:fe81:0:b0:419:16a5:d265 with SMTP id
 d1-20020a50fe81000000b0041916a5d265mr43018586edt.4.1649841164685; 
 Wed, 13 Apr 2022 02:12:44 -0700 (PDT)
Received: from EliteBook.fritz.box (p57b0b9e1.dip0.t-ipconnect.de.
 [87.176.185.225]) by smtp.gmail.com with ESMTPSA id
 hx12-20020a170906846c00b006e8ad71c18fsm1913200ejc.208.2022.04.13.02.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 02:12:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix kerneldoc for ttm_lru_bulk_move
Date: Wed, 13 Apr 2022 11:12:42 +0200
Message-Id: <20220413091242.638413-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the kerneldoc for the members as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: b0e2c9ea5afc ("drm/ttm: allow bulk moves for all domains")
---
 include/drm/ttm/ttm_resource.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 314f73de4280..f82fee18c07f 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -215,8 +215,7 @@ struct ttm_lru_bulk_move_pos {
 /**
  * struct ttm_lru_bulk_move
  *
- * @tt: first/last lru entry for resources in the TT domain
- * @vram: first/last lru entry for resources in the VRAM domain
+ * @pos: first/last lru entry for resources in the each domain/priority
  *
  * Container for the current bulk move state. Should be used with
  * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
-- 
2.25.1

