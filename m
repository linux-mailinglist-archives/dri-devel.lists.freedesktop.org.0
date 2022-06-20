Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7188552BD1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFFA10FC11;
	Tue, 21 Jun 2022 07:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F2D1130F0;
 Mon, 20 Jun 2022 10:02:23 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so10264047pjl.5; 
 Mon, 20 Jun 2022 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsi5qTupo0kCuDpyUp9YDxiUEMfoJpT1b7YUEL135SA=;
 b=oo7k9+JPQLMEKY3tOyf6KAUgNfkZrLlYSmVWITF7Fr2t4tvkQXfngyks/qngStBwXO
 2KuDwQZZEJQWpZDVOEjycAu2bxEWq8N2PnxoUaIm+gAycjUQ8qK446V23KAeFOx9pk1N
 MGwXnL/k6JiwNXoCJTBuob1cdVpgTd1cPM4NmxboqdVzyy+YMCT0WRGKbaw3xAFi8ROi
 pTDl7Vb7DIyknDT7WfQDEyH4rhuXYzj7lO2+pCicymiMMyUqMqqTlYXJZEhEFc/uhT8z
 1PtDeeEovLFDCrYqnJq4g+N6tLBcn4cJAO3krkPR3D3vYbXA1wbOklEsvBkWnhr+bVL4
 AIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsi5qTupo0kCuDpyUp9YDxiUEMfoJpT1b7YUEL135SA=;
 b=nd1CoVZUKQDsra+TQpv1oUGYR7vzIjL6mSN4GoWgYm7/MeF1HZsXy6RkN6qihLN+BU
 8Sk6Nqa5fVHHHrndN8LU2V+uZ43gz273vT9+oyYEC+C+8xikoYIXrPY4rbJ6/szQOJoT
 AYI60L1eO/7V6L9ojNYkhLzyRvcxbYrnWZwiSIMfO+HalBRAaLl0lPRglWIx/m00TFJB
 slPZ87UeNWxy+dpjVzvFwkZgdSdTHYPsgc6P/58xkgTWr4KV5/nn+O38xs+PAXFI+o3Q
 +Qzu6Zh/Qdv9WcNda1cy/VaNp9kSTO+dtsx+dldVg8VjNNL5p2N1+kGlGsfNgn7nTnjl
 TfQA==
X-Gm-Message-State: AJIora+l5M07EklZSYeFO9RDDzikjeVNQmqSmxD9oM1V3PO/mgbTC4mq
 kncJio70T2DVTogswwvATgOf2sv/hDnAqjoc
X-Google-Smtp-Source: AGRyM1u3K6M5PpPDTvfSLZ5whwluHfiPWJvWBgeCw28Fdp0FAEibLDJdV8iLozIYLO5sCfWNAOKn1A==
X-Received: by 2002:a17:902:e8c6:b0:169:10c4:5231 with SMTP id
 v6-20020a170902e8c600b0016910c45231mr19307693plg.173.1655719342478; 
 Mon, 20 Jun 2022 03:02:22 -0700 (PDT)
Received: from localhost.localdomain ([43.132.141.4])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a63b802000000b003fcf1279c84sm8826654pge.33.2022.06.20.03.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 03:02:22 -0700 (PDT)
From: zys.zljxml@gmail.com
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/i915/gem: remove unused assignments
Date: Mon, 20 Jun 2022 18:02:16 +0800
Message-Id: <20220620100216.1791284-1-zys.zljxml@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Jun 2022 07:24:08 +0000
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
Cc: bob.beckett@collabora.com, thomas.hellstrom@linux.intel.com,
 katrinzhou <katrinzhou@tencent.com>, linux-kernel@vger.kernel.org,
 matthew.auld@intel.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: katrinzhou <katrinzhou@tencent.com>

The variable ret is reassigned and the value EINVAL is never used.
Thus, remove the unused assignments.

Addresses-Coverity: ("Unused value")
Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
Signed-off-by: katrinzhou <katrinzhou@tencent.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ab4c5ab28e4d..d5ef5243673a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -931,8 +931,6 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 		break;
 
 	case I915_CONTEXT_PARAM_PERSISTENCE:
-		if (args->size)
-			ret = -EINVAL;
 		ret = proto_context_set_persistence(fpriv->dev_priv, pc,
 						    args->value);
 		break;
-- 
2.27.0

