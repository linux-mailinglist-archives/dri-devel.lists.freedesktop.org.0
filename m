Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C23A93A06C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 14:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8C410E5A4;
	Tue, 23 Jul 2024 12:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Id4A2ELf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5E810E598
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:17:54 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-368313809a4so2544265f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721737073; x=1722341873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDrSQxR5dtn/3sQ/p+B1Mxs5j5Xf2+2pD6tH3hlzlME=;
 b=Id4A2ELf3yeDHe7vhYWdIYZ0lSFeKLRV7MVfMelhA6RlW6cpyBN8drkZOhHVJk5FHO
 Eu7U0ri72v53kM8/oIvV/x69Y3xLCacDPMfAyyIb/WwH32ikG0b0DkyJtLWEvnHamP29
 D6cdQywP4V8FSiyrlqUi5Nr6Z18UbbxAZPwh07QAzu9T41VHgG59XdzgqBOk7QX/muIm
 k26tttA07yTeCJHm4Yvhu4r6j1BoqkPi8VHkEUxajYOfZkFDRicixN5duC98CArVNfhR
 dasWm8AlDXNLn1T7Mab+4NlSD6PV0jBLd+90vp48mg3GfMyc+FMyvUazNOEaDW9nhgDK
 fBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721737073; x=1722341873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDrSQxR5dtn/3sQ/p+B1Mxs5j5Xf2+2pD6tH3hlzlME=;
 b=FKuNd2KJ+kD8flAMIOKp9z4H6h82E+CL2HubAcvVimveICrS73LFGwLdjrvE/XNC6Y
 rqgYC8l6qWVnkkd6lMULodWh0//S6u2TteeBdfAldltGvVWmaXgX0j1i1vlHJYnUXwW6
 ndITdrMLSmrYaDhwoa8oSknFrXehqgfFkLy6FT4IfWwfUIUtiETqX/G/NedgI6mfqubP
 wkSK/zEFpt4CXm1Y5WR1glkHtfWh04GqyE4XmUuI7uV8EO3/tCwwAUzZxunBnn3HBwH3
 5wtATpVXsScLB7yme4p6XZ/U/3OI/vRTV3yA7ecuHIemXAJiuIN4nEfDTG5IbqZBbxfQ
 Zhsw==
X-Gm-Message-State: AOJu0YwuEeBV3rt5wRar/Dah2na23VPqc2idfDXHYYAa6AoT9sMcsgSh
 tTtU36s6EQaZMT9a2loG8mj0jT6cCZyzgUDA6OsZ7T2KX5UrsCqpK1+9Y+cj
X-Google-Smtp-Source: AGHT+IFmC32w+KwKsuTPMuvRHuQPLr++89pXfLWwm21BU23T7trgIb6lIsJG4RvTc00fw4Mf5sQa9g==
X-Received: by 2002:adf:f5d1:0:b0:368:3ee9:e119 with SMTP id
 ffacd0b85a97d-369e3f120e2mr1376164f8f.29.1721737072779; 
 Tue, 23 Jul 2024 05:17:52 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1540:9700:699c:86ac:5633:2a7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427db2a4e3bsm138119595e9.44.2024.07.23.05.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:17:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/radeon: use GEM references instead of TTMs
Date: Tue, 23 Jul 2024 14:17:44 +0200
Message-Id: <20240723121750.2086-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723121750.2086-1-christian.koenig@amd.com>
References: <20240723121750.2086-1-christian.koenig@amd.com>
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

Instead of a TTM reference grab a GEM reference whenever necessary.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/radeon/radeon_gem.c    | 2 +-
 drivers/gpu/drm/radeon/radeon_object.c | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 2ef201a072f1..05df49b3a5c6 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -88,7 +88,7 @@ static void radeon_gem_object_free(struct drm_gem_object *gobj)
 
 	if (robj) {
 		radeon_mn_unregister(robj);
-		radeon_bo_unref(&robj);
+		ttm_bo_put(&robj->tbo);
 	}
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index a955f8a2f7fe..4b972c8c9516 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -256,18 +256,15 @@ struct radeon_bo *radeon_bo_ref(struct radeon_bo *bo)
 	if (bo == NULL)
 		return NULL;
 
-	ttm_bo_get(&bo->tbo);
+	drm_gem_object_get(&bo->tbo.base);
 	return bo;
 }
 
 void radeon_bo_unref(struct radeon_bo **bo)
 {
-	struct ttm_buffer_object *tbo;
-
 	if ((*bo) == NULL)
 		return;
-	tbo = &((*bo)->tbo);
-	ttm_bo_put(tbo);
+	drm_gem_object_put(&(*bo)->tbo.base);
 	*bo = NULL;
 }
 
-- 
2.34.1

