Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A23927E2E0B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 21:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BC210E3F3;
	Mon,  6 Nov 2023 20:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3106410E3F4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 20:18:01 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5a822f96aedso59071897b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 12:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ncf.edu; s=google; t=1699301880; x=1699906680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U8ZaLnkOmfn6VUj4P2bkyzAv0ojbKADStfSaOPEyh7k=;
 b=fY23XhhbFPVypE2dbrGHdSieouAF4sLIU0Vfve+kta5a5XNerO6uu426jOJHhqhlpl
 p5Rq1IJipW1nj1fi9EjhDrsCAG+CS6x4lNp9swddvikhMPnaHAxQ7H1oeOS0psyLfaJY
 1VmvIxm2PcDnQLsjf7A/juxmeRlJ+lTHXgLKlgImq7BxGzr1bnRFuGJQCH19wht1YrPE
 Doa+N+Aiss9VZwMK54OEftw0V4DbbQkLZOQC4uhdzsuigK461ULZUVwCAG9sn4CYnddQ
 45shEE5zX3+4GT3EQ7oAbBAbLBa20Cl75+JxZkaoXIQ1VlKQmjr23WaEtrIyQUEH5Sa/
 bpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699301880; x=1699906680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U8ZaLnkOmfn6VUj4P2bkyzAv0ojbKADStfSaOPEyh7k=;
 b=PkAH4Mge8Ns8w3bZNJYJiNg4di0PvrgjEc1Eq95tkb0kzMmgGXlpVdyI3TTA3WeMis
 TBlgcpEPMYKT4EEwOMAG+NN/pnjIlGkU6ctogqObdn7XcrTnkueBcgAZHMBOLlMwoZ1t
 gI1Qol/5gZK4oAuD+EPK9bSqM8w/Jo3MMVdX2QzXMurXVs1r4IbqH/QfHTX+bJgBez+l
 qbXcQJ/cbGxCf3el05Vt1V+qjJT8YCN2rwujmunt2VYf89Dkh+hRZWH63pRj57wov81b
 y9qtKTGFPeaW6rf8/fSGWsR+q7OP70LHAVC3jtFIjsqqxYDWfPmYIeE+5AoquyZLKK6e
 9ajA==
X-Gm-Message-State: AOJu0YxnGCvgHLcLOuqA+YDX5AAIHqy9+fP7lFbM2B7BTB9LisZtoBzz
 WXWY7WXhMZsfmfHF3ZZPsQy2Bg==
X-Google-Smtp-Source: AGHT+IEQcelb7+yRoiYucbFC0plzPHM97ye3oRTkSaTHrhyd7sCMz0sZn3o3ovon0cvSA7iGE8n/Yw==
X-Received: by 2002:a81:658b:0:b0:583:a3ab:b950 with SMTP id
 z133-20020a81658b000000b00583a3abb950mr10575615ywb.50.1699301880325; 
 Mon, 06 Nov 2023 12:18:00 -0800 (PST)
Received: from localhost.localdomain ([2601:580:8201:d0::d089])
 by smtp.gmail.com with ESMTPSA id
 q203-20020a815cd4000000b005a4da74b869sm4782343ywb.139.2023.11.06.12.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 12:18:00 -0800 (PST)
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: amd: Resolve Sphinx unexpected indentation warning
Date: Mon,  6 Nov 2023 15:17:39 -0500
Message-Id: <20231106201739.29507-1-hunter.chasens18@ncf.edu>
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
index 517b9fb4624c..81b8ceb26890 100644
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
+ * E.g.::
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

