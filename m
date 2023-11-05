Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA697E16B9
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 22:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A48010E15E;
	Sun,  5 Nov 2023 21:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FE610E00D
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 21:01:10 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5a84204e7aeso44532327b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 13:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ncf.edu; s=google; t=1699218069; x=1699822869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IHNT0zTQnNcqPPjHsSZJukecZ6cg1UjZ8+XnwMd4fEU=;
 b=cmCn2/t/pLD0wSdad7cxZyMG3Ewl1ASD1F0VfHSdLQi3OP2vMoyYjiHk2VImAwasel
 SMu4hbv6dwpXZl8FVJq+1UT5YFKT/Z/qJNynVEifKpLgvb+fNYyOVroxdhhfFRqCe9ui
 Ol8LWovYuokmNpK4sdOmU+ZFChmZGNg7kvwSlafWDazOf7iwdOOILkKwgc67aYbtKjov
 EPjcAhGVG5MntAKB6k9oTCuMJCC4l2ggROlif/kpIKWHgaq9eryTXrJFG72ON5pZcG9f
 /n9Il4ljX5XA3nz5DtX0rWpyFcJflgP2M/cL1AJzMyqO8NKws/JelXRr9XtKvNQLW+/g
 W3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218069; x=1699822869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IHNT0zTQnNcqPPjHsSZJukecZ6cg1UjZ8+XnwMd4fEU=;
 b=Rrl5/h4Ibk8ToE9Qx6lGzwl/R6LmpeBqdzzPGjPLNBxwt2bLLs03rTnuNgLKiR2B3c
 hufsEaDIPv74V8/ERrVtP9TYE9Qy6pqnzpJ7Cvl8c3mlqqyq7w02x9QzS4U8b0WckQQ1
 mlWWUoNxikvdrsxi4v0YH3ULXO2LyjMN6h4VB+NHuim/LbYGP+MzRKfyfzQiTwS1+x2Z
 VMV637jFPpKwudIun4USU47ZOHFcn79JIR8zekljDhu2blSVviSOTHn0AEbn0obpFeOS
 PP0kC8zKBK/WIRhZ6y0g/bT7PCZSgufxdl/Dqjoc+5OCvyGSqV0ocLfJhNJiXUVpbtqc
 /lTw==
X-Gm-Message-State: AOJu0YxpGmx08BqT7aohO2Gw2Q8yOObjnZRkGFXicXrIt56yOiEg1jUl
 yUhrJN4+BYtm6Ny1+T81BVdN1w==
X-Google-Smtp-Source: AGHT+IHTe+jz59X3TG5/BvLWO7twuGvFUqyXHcSTGVYZVIJwrYV1Qm7dBjwgblMISH1Ss4fexHRecQ==
X-Received: by 2002:a81:9290:0:b0:5a7:aaac:2bce with SMTP id
 j138-20020a819290000000b005a7aaac2bcemr9344504ywg.35.1699218068977; 
 Sun, 05 Nov 2023 13:01:08 -0800 (PST)
Received: from localhost.localdomain ([2601:580:8201:d0::7d3d])
 by smtp.gmail.com with ESMTPSA id
 fc10-20020a05690c314a00b005afa4b9b049sm3486658ywb.42.2023.11.05.13.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 13:01:08 -0800 (PST)
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation warning
Date: Sun,  5 Nov 2023 16:00:44 -0500
Message-Id: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
X-Mailer: git-send-email 2.39.3
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
 evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resolves Sphinx unexpected indentation warning when compiling
documentation (e.g. `make htmldocs`). Replaces tabs with spaces and adds
a literal block to keep vertical formatting of the
example power state list.

Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 517b9fb4624c..703fe2542258 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -990,11 +990,14 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
  * the power state and the clock information for those levels. If deep sleep is
  * applied to a clock, the level will be denoted by a special level 'S:'
  * E.g.,
- *	S: 19Mhz *
- *	0: 615Mhz
- *	1: 800Mhz
- *	2: 888Mhz
- *	3: 1000Mhz
+ *
+ * ::
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
2.39.3

