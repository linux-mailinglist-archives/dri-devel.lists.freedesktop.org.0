Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58741517D7A
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 08:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16D510FE3A;
	Tue,  3 May 2022 06:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170AD10FE38;
 Tue,  3 May 2022 06:36:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x18so22077429wrc.0;
 Mon, 02 May 2022 23:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqBT4LMZsFqbof1yKFu425kOarB2J0nwnkKoFQoxr9Q=;
 b=Qz5fBcF18ssiRBiznoyT8U7skWaeZ7VLnQJInYP0jKmkn0a7iLXVNGOZjVLKRqEn4f
 +M8s+eEe7tF0CGbNPa0bDj8uuSzeRQeXwUdMmgT1S9zz4/npeIPZqcZfvDdOaYljhwtR
 2pJJtCkJxl7n4RnC+gAU3DvFwjYi70q7J9xQrWqnTPUYX1c4xS5nYxlNWCwtsdGp+GRT
 XpAYXKy5Af7mKpITSv15Ble9Be6+lL2g3Caa4iPaSXSNemkesEluQwHacWJbLck+xokn
 bwE7wAJ6f10i6It9HzLTnaLNh335f6Twg7rK9SxrKLLcK1VaapBbgXflD4oB7kWKMevC
 vvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqBT4LMZsFqbof1yKFu425kOarB2J0nwnkKoFQoxr9Q=;
 b=5JR8GD6+3MzJeRMHbGom/E7FtzR+k82acncIxdYr+LxQCV2g0XZheMTPWyGi2KVxLf
 /O564tcH8fNgb0ALhqVjlwekAy/fzg/m/hQG6vWhdHRezD4Mboe8WswvBIbpBXeWFrtV
 I1sV34DQoQxSS1RSXqYiI1xqWqMvCLoNELtDCeCDFxeo/C7d3VDYqXL0kXMo4YIWwJ9G
 Ir5+bMEamsMm2iHVq1faWt1d7RC5wuFEF82cPAWZJVGo5PD/n94y9U3sOaYt8SmPHqBb
 fFSkQ2raN1JUSRDFUT5BxDwmJWkpgnwjeOMSCEuYTPmPINzGxEUGbqzBlvAm4fmO+qAV
 7rwA==
X-Gm-Message-State: AOAM532NQddNcw6ho6Ieg2atObHY9Oby3kueBKenKih/rMdzhlbt0Icu
 +FhC4NmYRUHIlwsfD4TBFJ8=
X-Google-Smtp-Source: ABdhPJwpl/Sd5dOqigBN/MefvuKwnWJUBVRCmrmI8ZqI9vYzn6rCGIL+HoSrmS93pt/FLBnlz1UDQA==
X-Received: by 2002:a5d:5012:0:b0:20a:d9a9:44dc with SMTP id
 e18-20020a5d5012000000b0020ad9a944dcmr11511711wrt.627.1651559775633; 
 Mon, 02 May 2022 23:36:15 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003942a244edesm931445wmk.35.2022.05.02.23.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 23:36:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@gmail.com
Subject: [PATCH] drm/amdgpu: fix drm-next merge fallout
Date: Tue,  3 May 2022 08:36:13 +0200
Message-Id: <20220503063613.46925-1-christian.koenig@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 tomeu.vizoso@collabora.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That hunk somehow got missing while solving the conflict between the TTM
and AMDGPU changes for drm-next.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index 7761a3ea172e..88de9f0d4728 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -631,9 +631,13 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
 	if (!entry->bo)
 		return;
 	shadow = amdgpu_bo_shadowed(entry->bo);
+	if (shadow) {
+		ttm_bo_set_bulk_move(&shadow->tbo, NULL);
+		amdgpu_bo_unref(&shadow);
+	}
+	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
 	entry->bo->vm_bo = NULL;
 	list_del(&entry->vm_status);
-	amdgpu_bo_unref(&shadow);
 	amdgpu_bo_unref(&entry->bo);
 }
 
-- 
2.25.1

