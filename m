Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29957D48EA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 09:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E8610E2E7;
	Tue, 24 Oct 2023 07:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DA410E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 05:10:55 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cac20789e8so6250945ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 22:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698124255; x=1698729055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nr5cAMeAjZ0dSBqvWw1SfW+F2HbXuSyjdYrPRDOlSoo=;
 b=FXAITOnCgByqQ3Thc+4pLtCRnXRLLRc3/NxNt9wEmi63JVFakpHvEx/LSVqJWSGBgy
 bOgMYN+9HbJeLeHOfaH9oxES+a7jmz/HABabYt15VRsB702tHb3lKdCHTlly2bbSumxN
 ECLo4v2R94S3a31+e57daevcjIyYD+eNfCGYSwii8Nnw4oxkVJbxeLOstUdlU+d/XFTI
 cQODHqdhdDk5EFY8GnRMAhWGG3uSDyqZIFLCLwrcZwPHxQybYj9KSAHPbaoD8aWkSd/u
 HoqWECJDKBk9KRPNyR6rIF6+O/e2M5o9ob91t2ORJjvfqkyuyHo5alDk9DY4a5sN5pnv
 RZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698124255; x=1698729055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nr5cAMeAjZ0dSBqvWw1SfW+F2HbXuSyjdYrPRDOlSoo=;
 b=gywPsIgqf8D9oIoD/HNY+2oZnlParaH1LHQdBvvXWn6cfQseEvkGLJD6ZsFzYaFpGx
 BLmrZrLJfmvpECU9zyJfddpFXJ9ozKJNo1c/9xyopaIQdzR4y4NqX6gaV6eGd0XkXg0a
 49yKDa63VbKESUEefN0WUllgdgOlPGt2aPqohUbAyyHy4DGbVFrtIlU+cMyVrTuPYJyL
 f6QgnQUvsW/AdwNJXoBLUC3SQZaQam5jrRtKKpZlbJ/1ommcQana5d5dD3ga/8Xx3OGU
 bUPr9TWFcRo26oZgUMu2kwLOlPdXAaYQLM2D3/LPdIwbSAk67ka3+mDE29Szmjd11DYr
 0J+g==
X-Gm-Message-State: AOJu0Yxm6gE2oUj3wpdb8u22cRcxinmwi36Czuo8gK0eRnKxuXSxFl00
 KbvSBuCrmYPA4sHxfF/qEI0zkWyoh4CAjHLj
X-Google-Smtp-Source: AGHT+IEKidxYo+0nvWnMqIVx1G3xWxLR77E+4ZE5dV6xoCA8Xg5Bd6n85Oxi+lbh0lC40JYbPcaHnw==
X-Received: by 2002:a05:6a20:8f05:b0:163:57ba:2ad4 with SMTP id
 b5-20020a056a208f0500b0016357ba2ad4mr14202019pzk.2.1698124255449; 
 Mon, 23 Oct 2023 22:10:55 -0700 (PDT)
Received: from fedora.. ([2400:2200:74c:7eed:5855:5fc6:625a:57c3])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a170902704100b001c61921d4d2sm6736397plt.302.2023.10.23.22.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 22:10:55 -0700 (PDT)
From: Kenjiro Nakayama <nakayamakenjiro@gmail.com>
To: airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/ttm: Fix comment about return value of ttm_tt_init
Date: Tue, 24 Oct 2023 14:10:46 +0900
Message-Id: <20231024051046.724070-1-nakayamakenjiro@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 24 Oct 2023 07:48:38 +0000
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

ttm_tt_init returns -ENOMEM when out of memory.

Signed-off-by: Kenjiro Nakayama <nakayamakenjiro@gmail.com>
---
 include/drm/ttm/ttm_tt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index a4eff85b1f44..243232be87b8 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -145,7 +145,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
  * Create a struct ttm_tt to back data with system memory pages.
  * No pages are actually allocated.
  * Returns:
- * NULL: Out of memory.
+ * -ENOMEM: Out of memory.
  */
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
 		uint32_t page_flags, enum ttm_caching caching,
-- 
2.41.0

