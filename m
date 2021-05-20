Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D418038AD62
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4197B8996E;
	Thu, 20 May 2021 12:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C1F6F414
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id b7so8428969wmh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OmMgm22TVdmn0YlU70PwNW8OaCfk/LhHrn8mYGM1ILk=;
 b=QD/KEVmze2nJBsl72X+9/4makCpNLgnhq9kHYQtB0j4vPW1YZXrU1khxF3fGuZU0h+
 ZPx91P2Ne+MJofYJYv5eKK7Yft2hMjg3D7P89z+qpLWEu9oeG6N31skJJsST4qDrmNuL
 ySurx8C8e78/4JZjFHBzSggFMTGDA1MPBXw05kOtgeBccYfmGiCg/i8VWeoCenhST8s3
 okGcBzBiUXfR8+BF1kkNK6mjF301dRzRn875g/Zz6dy9mlYT5wmxs++2gIlYPo+WBEGW
 VwU0WXfkvJCZBLqh2oTsGKIhfsdLjBIrutsQI0UPvKw8CSfIyIxy42lR1AHIt+/e9wWS
 nUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OmMgm22TVdmn0YlU70PwNW8OaCfk/LhHrn8mYGM1ILk=;
 b=PQ36bEwB5rEaL13PJm04kPO2gENJ4sRDcpFE9kSFYzPBmePolMQpF4euBBmkzaWVqT
 RAyXhlttWF/5HWFCMrp+EF/lv7zQefu4smGmBu20u/8Chis1bDKmPnB7F8p5mdAqpgvm
 5pJCbOlor2thL8UwxHVA4jgXnBIYOWypuKxnz9VX+oku2ZRdbyqR7iJXU4/BujiyVKWr
 5txDeZ831GMFyB38kymOm/FSIGRhUmEVRA+dKSeNCp6yGuh1GRiWfLDuDrf/Wah1XE49
 Efcp/y9gqkaXU9DWNhzvNusvWtyllzDxwXV8YuFtzF3NbkP3oPl1ybNL0B7pjJ4kNXNz
 TEUg==
X-Gm-Message-State: AOAM532LmxqZVAO/65Fa1U7OgD3Yg2TfvciTH4hmUITptwfB+66CqczC
 kfX+wPZrSzmrdcnMOzYvzuqOXw==
X-Google-Smtp-Source: ABdhPJxIRwowWq6Q6Jk0qbvu6pd7yWq+Mmva8O37/LRH9s85uRpcjtEb6krZZtsukcUmk7nXDt3tAw==
X-Received: by 2002:a1c:bbc3:: with SMTP id l186mr3700393wmf.38.1621512186295; 
 Thu, 20 May 2021 05:03:06 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:05 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/38] drm/amd/amdgpu/gfx_v7_0: Repair function names in the
 documentation
Date: Thu, 20 May 2021 13:02:24 +0100
Message-Id: <20210520120248.3464013-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2126: warning: expecting prototype for gfx_v7_0_ring_emit_hdp(). Prototype was for gfx_v7_0_ring_emit_hdp_flush() instead
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2262: warning: expecting prototype for gfx_v7_0_ring_emit_ib(). Prototype was for gfx_v7_0_ring_emit_ib_gfx() instead
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3207: warning: expecting prototype for gfx_v7_0_ring_emit_vm_flush(). Prototype was for gfx_v7_0_ring_emit_pipeline_sync() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index c35fdd2ef2d4d..685212c3ddae5 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -2116,7 +2116,7 @@ static int gfx_v7_0_ring_test_ring(struct amdgpu_ring *ring)
 }
 
 /**
- * gfx_v7_0_ring_emit_hdp - emit an hdp flush on the cp
+ * gfx_v7_0_ring_emit_hdp_flush - emit an hdp flush on the cp
  *
  * @ring: amdgpu_ring structure holding ring information
  *
@@ -2242,7 +2242,7 @@ static void gfx_v7_0_ring_emit_fence_compute(struct amdgpu_ring *ring,
  * IB stuff
  */
 /**
- * gfx_v7_0_ring_emit_ib - emit an IB (Indirect Buffer) on the ring
+ * gfx_v7_0_ring_emit_ib_gfx - emit an IB (Indirect Buffer) on the ring
  *
  * @ring: amdgpu_ring structure holding ring information
  * @job: job to retrieve vmid from
@@ -3196,7 +3196,7 @@ static int gfx_v7_0_cp_resume(struct amdgpu_device *adev)
 }
 
 /**
- * gfx_v7_0_ring_emit_vm_flush - cik vm flush using the CP
+ * gfx_v7_0_ring_emit_pipeline_sync - cik vm flush using the CP
  *
  * @ring: the ring to emit the commands to
  *
-- 
2.31.1

