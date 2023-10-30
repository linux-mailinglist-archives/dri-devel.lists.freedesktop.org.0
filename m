Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5417DBFD3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 19:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4393E10E02B;
	Mon, 30 Oct 2023 18:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD3710E02B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 18:26:18 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c9e072472bso32647785ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 11:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698690377; x=1699295177; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R62SThzKu31JyxEJEDyEUmzwekn6rEpi3haubFsFBjA=;
 b=XQ/KSVSAsjeMzHSCLK0oR+UPnzOrOVgftWmX7XB6iQqJhis81rLECl7a4GOdJNSXOo
 Ts5VD2eQBNsGTutLio5EdlQOPWOrnB5e49C6ReWKQo0rLC2EsImytiE29fZ9woBRBmIg
 Ix/SRSjuqOhKA+yZBhykdh2Msr5D5Fk/bjeavzU485KeOkswbTkTM/kdo/7s+dVwhzwH
 rr9XKm2abNvH/cH6MMvhAvMR6S626Dyv46GccryDYiTDkaIVEGRH4mcgjJdHIfTjRdYo
 pmYy6auEiJiztD6sxwg2QOrCnxqKTtwt9sBsCMj8l5nOAatMk0wtfDnxtWrpJ5cNU00v
 ib5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698690377; x=1699295177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R62SThzKu31JyxEJEDyEUmzwekn6rEpi3haubFsFBjA=;
 b=lIGIgcG6JbzNy603YPw9fR1MJH2GeeVwusVizdOpNP762cPjegqen7angBHj4G1+mf
 WXlm3UfcbQdKftxCfCLWZsZEr9rq0fN11dkYwZVPkay2JfPPMqqrGk8880OF0nFx29MP
 TGqLBq09fFBx0I+L2zdrlsCIXRs8u0GAo9PGnIZMM10meug9i03gGPIGkvYtZc7bco5I
 lfpAOAsVaIM4xwR3duXaLGtqQ5HrhwJvnXO7cnGmDjkIy1v2s6JMb2Huwolikk77iZ/3
 5eR+kEv9ZFS/brfJhKtfF5MWqf67cr0a6M32r6luaY1Y7bOCnbp70alutv1BtDpTzIjE
 DyPA==
X-Gm-Message-State: AOJu0YxzBl+wCQb+Uc8fSXCfY98G43DWOod/hcYovbvtGgq2qEc7tIH5
 VFiyeA725jsjRgTX0veFCnqxiBLbSjM=
X-Google-Smtp-Source: AGHT+IGsopBprn9bNgbQiLpNlqHvZ5wikCH3OsB5zmYg0zrLqmiVVOeyrP0uwwqFijBn5HkdQecXjQ==
X-Received: by 2002:a17:902:d082:b0:1cc:2091:150f with SMTP id
 v2-20020a170902d08200b001cc2091150fmr5623248plv.1.1698690377299; 
 Mon, 30 Oct 2023 11:26:17 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b001b9f032bb3dsm6754237pln.3.2023.10.30.11.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 11:26:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/gpuva: Fix comment typo
Date: Mon, 30 Oct 2023 11:24:00 -0700
Message-ID: <20231030182400.31590-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Just something I noticed in passing.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 include/drm/drm_gpuva_mgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index ed8d50200cc3..26a2c0880bac 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
@@ -189,7 +189,7 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
  * struct drm_gpuva_manager - DRM GPU VA Manager
  *
  * The DRM GPU VA Manager keeps track of a GPU's virtual address space by using
- * &maple_tree structures. Typically, this structure is embedded in bigger
+ * &rb structures. Typically, this structure is embedded in bigger
  * driver structures.
  *
  * Drivers can pass addresses and ranges in an arbitrary unit, e.g. bytes or
-- 
2.41.0

