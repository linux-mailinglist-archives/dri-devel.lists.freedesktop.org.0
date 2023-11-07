Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B957E4AAF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC9810E6B8;
	Tue,  7 Nov 2023 21:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB7C10E6B8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:28:40 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-d9abc069c8bso5568552276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 13:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ncf.edu; s=google; t=1699392520; x=1699997320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5GrfKC2IvsZBEgQFQYe2RhJApLNUugeSPWTjf04uUac=;
 b=jW0dtq3xrp3B9qkZxYmlxqJs9D/XZR11aOSwhJ1DDQS7kcEFBJ8NOwodxFRmma11X5
 g17EmP+5mmzam3ZM5HPmpPMt6fSvV9x42UsgbTXw7vodEQ0r3dO6xn57GWOgRdyAsOaK
 nrdTghv0yOgY+XRh+hTtN494sr51VOgGCPRL97gNRRSeKU6lbWaTzGdTkm9oT0CNNItQ
 5LOT8J3gCejZIaw4omTU/YntQ9sFipelUg2ix6aRL6+PvN9lCqqdTKJ6X7BQMP5boquB
 wgit4DQarRpdF9XcQgq6pvAg1I6G2dRd1bzBk+kbkKdKb+Bm080k5fQzmzi+uMoLeX/i
 ee8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699392520; x=1699997320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5GrfKC2IvsZBEgQFQYe2RhJApLNUugeSPWTjf04uUac=;
 b=rjv31hRcxnvz9pv1L8MWMpvNOgg5Qgxx5zJUlvTkt2OULL+hU90s/86KON7x3Xy6EU
 HZMryW+o432pb54SL7ICmjT833eMqFPd0l1v1WbhrUx5c79MwqhzvUroueg/P+gwcjTU
 MzawKsxCRFVw0/Fibb1v9XmKw3MphT3AzDes/JHtaeXE/eEDzWgJY8r7Rs+9uwSHcM7K
 05g9IB5Wk0JPzdy9V8H1Jry5Ea8dzCKIYE1ot/Hlvn6ccUwm2y1b3OeestbQlDjEg0Ok
 fBL8WUTX/5oGCSIdstKuCU5ZXQ9M5Hv4RKBNVbBCCw/s4A98xNXgvQG4JArTVxthE9Lp
 v1ZQ==
X-Gm-Message-State: AOJu0Yz3QaMK9+Eg1R9eSV3ppYmWejR9BdU4+rz8J+YMZ2fL6bfKLWjW
 +RTHt/7uYeF2gRIyB9hL3dY1OA==
X-Google-Smtp-Source: AGHT+IEVGxWjSPfH29B0f+BhNDDfe9GVs/2MnfzycBPjOvD0xg9LpfAOaj+zUSsjtvyDbSoQfjhDcg==
X-Received: by 2002:a25:97c8:0:b0:d9a:6b46:f49d with SMTP id
 j8-20020a2597c8000000b00d9a6b46f49dmr9749055ybo.59.1699392519826; 
 Tue, 07 Nov 2023 13:28:39 -0800 (PST)
Received: from Lux.hsd1.fl.comcast.net ([2601:580:8201:d0::4174])
 by smtp.gmail.com with ESMTPSA id
 j186-20020a25d2c3000000b00da06575fbc8sm5657649ybg.2.2023.11.07.13.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 13:28:39 -0800 (PST)
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm: amd: Resolve Sphinx unexpected indentation warning
Date: Tue,  7 Nov 2023 11:28:30 -0500
Message-ID: <20231107162830.36856-1-hunter.chasens18@ncf.edu>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-doc@vger.kernel.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Hunter Chasens <hunter.chasens18@ncf.edu>, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resolves Sphinx unexpected indentation warning when compiling
documentation (e.g. `make htmldocs`). Replaces tabs with spaces and adds
a literal block to keep vertical formatting of the
example power state list.

Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 517b9fb4624c..576202bf64f3 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -989,12 +989,13 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
  * Reading back the files will show you the available power levels within
  * the power state and the clock information for those levels. If deep sleep is
  * applied to a clock, the level will be denoted by a special level 'S:'
- * E.g.,
- *	S: 19Mhz *
- *	0: 615Mhz
- *	1: 800Mhz
- *	2: 888Mhz
- *	3: 1000Mhz
+ * E.g., ::
+ *
+ *  S: 19Mhz *
+ *  0: 615Mhz
+ *  1: 800Mhz
+ *  2: 888Mhz
+ *  3: 1000Mhz
  *
  *
  * To manually adjust these states, first select manual using
-- 
2.42.0

