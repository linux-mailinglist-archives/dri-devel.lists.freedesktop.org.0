Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D2AC2551D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5440F10EB85;
	Fri, 31 Oct 2025 13:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KHkckEzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD96510EB85
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:45:22 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47109187c32so11936265e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918321; x=1762523121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VvIMk872eUcGrvr4oYbCLqZzU34y/qoctkmyPmiR2qE=;
 b=KHkckEzgHgKs0uhcUWjbK9L9XE2COTdfHCjBFW1NNiwvcpxUjQBC1dMeW8NEaOoWfa
 xfGldVT7qg+45tjsctvUHpE2YYVO03glX/rQbL58HErYAmFFrUfAOC1BkB7q5k4/ac7M
 rlEQ2O1vWzl7GuuLwPz4V7YwDNAzTYMyVSKrQJpnFkuhkm/npck+ZyXhuJCD8oNGKTH3
 EbFSlMv3IsfQ4iInH5R44KeBAR9kicRC22eNTv+WWBY/jA/112sf0t86JBEqML4MVWhI
 PDUqKj6y7hhGFvHByKDYSbmaKZqesSzrWTn6sojDbdUpvx9x2AT8iAL7eFP/Io67klIL
 X27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918321; x=1762523121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VvIMk872eUcGrvr4oYbCLqZzU34y/qoctkmyPmiR2qE=;
 b=es6zp12BEqcKBX6r58pmJrtpX2P9BuXweUT5JIfrWHdkuelBNanZIr9YpNi3a4zRgq
 tN/ABqa84X1Yk4OzfvhLPReTnu7olZ0B94oVq85jDRfskarFBNh8a9p/UMvcVdUqUH6V
 IYKXXR0Ge/ua7b+M9VIkzhkwH+koXjLmz8tnywtUPzd4wxlLE+DM5S1ejAtmzsd3cssQ
 wMS3cGwXHlJr0pKrDq7vV6lbTiTcFpt8XLcczvl6OvWdfm3dDgqs1SoSMpZ7Lhef61NT
 vwHxE5LpWaJljqVEEma424N/EDFUZ+WMdVqtF4SzVixN2O9iKUX1mIDAAaDGWovJ8vXo
 W/7Q==
X-Gm-Message-State: AOJu0YzPJB06jomLyXAICTQmMhLCDS7gEdD0yQswnmz8gwUU3vhJdFeC
 MGFVJi/lYz0DPJjvbx7jJMRN1IDBZ/7HrzmZgFvJtkbqzz+G7keTvq/a
X-Gm-Gg: ASbGncuOWzS+FYxHzmGJ7HB+CDnmBg82ecQE/03d5djV5h11S7JeRZkNplHgbMRt+lK
 J4EaHZb1NO55dIwe2xvTVcfP5ioxDlTkp9E3CPAJAym3FR8fZW3WCGsU4MCGhp22rYwUZYsQXB9
 JNcMYLydPvsH+0nHhkyCyWDGnjRFjH9hOMWrcrK46ydmpNRWvy14mx890iGQqfFdrpmhwUf34J7
 owdLEYSJ9H1h6j1h7c5i45Smwp3YgODqzvameJKxXclsLE4pmL2iuApClSomh1dCVeYEo0dvv00
 2Wk1sooQ29m808YuaCWhN+gzp/gywGs2KNyK9TA2oiM74FDZYzfX9rorRewZO2BmJegYBNJwocy
 OqdIy4hI2Q74kOIsuNeUW+834OhoCXzxhsSh7g4+c5O3UNVbeakrdBQ02j7ZWWa1GT7zR5mF+Tw
 Fzmg9Uzt5h5Qrh+g==
X-Google-Smtp-Source: AGHT+IHYTAqcnzKdwrHIjwP0e7LE0KQcWN9px01yCeXyNDCjyUVslw3LMbRSCkFV3fZj2afZNaoSlQ==
X-Received: by 2002:a05:600c:a43:b0:46e:1a5e:211 with SMTP id
 5b1f17b1804b1-4773087b051mr33944955e9.21.1761918321189; 
 Fri, 31 Oct 2025 06:45:21 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:45:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 20/20] drm/xe: Finish disconnect HW fences from module
Date: Fri, 31 Oct 2025 14:16:54 +0100
Message-ID: <20251031134442.113648-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Be safe when dereferencing fence->xe.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index f5fad4426729..8181dfc628e4 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -159,9 +159,7 @@ static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
 
 static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_fence)
 {
-	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
-
-	return dev_name(fence->xe->drm.dev);
+	return "xe";
 }
 
 static const char *xe_hw_fence_get_timeline_name(struct dma_fence *dma_fence)
@@ -175,10 +173,13 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 	struct xe_device *xe = fence->xe;
-	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
+	u32 seqno;
+
+	if (dma_fence->error)
+		return true;
 
-	return dma_fence->error ||
-		!__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
+	seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
+	return !__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
 }
 
 static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
-- 
2.43.0

