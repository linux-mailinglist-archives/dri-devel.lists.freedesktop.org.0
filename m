Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0E5824490
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 16:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3FD10E4C0;
	Thu,  4 Jan 2024 15:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F0910E4B5;
 Thu,  4 Jan 2024 15:05:52 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3368b9bbeb4so514970f8f.2; 
 Thu, 04 Jan 2024 07:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704380750; x=1704985550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EZGJdA0F++2P/K37coEne46KHwvd4SnYzLgJWUGLPe8=;
 b=QFeiOa2Ot3+XdU4a6F6UY1naDx/oVJsqWkvcKrsC/OKKrI5UjonXfwEg56YQTcbJy0
 ylLLxUe4I1pGaXgeGXzSpI8pj6zcaobGhiv++Q8z3y0SaKD/oqL3jXlNhsc5ASwgrrf4
 LSp9gcZzjZ1IpefNJx6HgTYJsjN1bHMTUvDxFBnIWA0jVCT7aitIDu+1LSiTeEusueT+
 QAH0h7X2n43AISDHnBAq0l6efL8aDHWYmQLeS8E9ef/dVzZrW2nGuzwCUfRSWMOqsYtJ
 sfvKW1gqJXXSHwr10tWCS4QlMQVrofcadyFyjW5cOigmvgb6pZB0XXhtyDs3pssoKEIj
 MjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704380750; x=1704985550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZGJdA0F++2P/K37coEne46KHwvd4SnYzLgJWUGLPe8=;
 b=eNHAC5aMUK43ZkvieXXW0BRDHKfn/afg2JomT/kDgbP85xDhKiOs2sznsxfWKW4WDv
 QRKX0WE/C3rL0DdmTJYZsI0BVH++414g3oc5mGI0JsI/qE/IHcPSgPdGkSLN+OdcG23b
 6Ho079NNX74glKTPK371lXOloao1TLFhIqsJMAKEORGWXsbZh5OnqChG6Ct4DKa3JAHn
 WYerHt9zdE2zdp3PUMmWa7z/hBDrrQahuWnp9O2uvQqns45l4fOypHvEF/1SBXSnitOo
 5YDp6d5arQWtYXQSw4ssjb+BeFIX1+VRh+eUnUlhmmiD5yE7C29iu7laij0fURQ1mvCX
 bIzg==
X-Gm-Message-State: AOJu0YyBO4htLLu35VkjmeTgJLo2B2onOyReQDGMKwrVTXp3wGeWIp6/
 uhqqvPL/YPqRE6oM/S0G10EGT7D9vHRWog==
X-Google-Smtp-Source: AGHT+IEc58ZfDngHbkbasrUQBXqnOTzZTE4uzQn8sHPDPvUEA3msJaN8eQLqmcS555VOwAWRPMMmxw==
X-Received: by 2002:a05:600c:219a:b0:40d:57d7:6388 with SMTP id
 e26-20020a05600c219a00b0040d57d76388mr214361wme.302.1704380750622; 
 Thu, 04 Jan 2024 07:05:50 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:157f:4100:7224:7d9c:a8ca:3fe9])
 by smtp.gmail.com with ESMTPSA id
 hn33-20020a05600ca3a100b0040d5ae2905asm5845420wmb.30.2024.01.04.07.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 07:05:50 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, nouveau@lists.freedesktop.org,
 jani.nikula@linux.intel.com, kherbst@redhat.com, lyude@redhat.com,
 zackr@vmware.com
Subject: [PATCH 4/4] drm/amdgpu: use GTT only as fallback for VRAM|GTT
Date: Thu,  4 Jan 2024 16:05:45 +0100
Message-Id: <20240104150545.1483-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240104150545.1483-1-christian.koenig@amd.com>
References: <20240104150545.1483-1-christian.koenig@amd.com>
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

Try to fill up VRAM as well by setting the busy flag on GTT allocations.

This fixes the issue that when VRAM was evacuated for suspend it's never
filled up again unless the application is restarted.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index f110dfdc4feb..979cecf18f17 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -173,6 +173,12 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
 			AMDGPU_PL_PREEMPT : TTM_PL_TT;
 		places[c].flags = 0;
+		/*
+		 * When GTT is just an alternative to VRAM make sure that we
+		 * only use it as fallback and still try to fill up VRAM first.
+		 */
+		if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM)
+			places[c].flags |= TTM_PL_FLAG_BUSY;
 		c++;
 	}
 
-- 
2.34.1

