Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9270438AD7B
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DFF6F440;
	Thu, 20 May 2021 12:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05E56F430
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:36 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q5so17385295wrs.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yuvzJ7XKyB2J8XQ1p95NuNGQFyxLRMRhEwI7C8RcNw8=;
 b=KyloU0Voex0hBA1Vx66+tEWWQZSCdnxYcCTC9umTlXk2zRxDTFsqFUwWYcXMI55fpw
 ENKGyXCKnhBGEV7Dp0TCokF1f7aFF3VqhQ8JHMJb8TCCO7bG5a29KxxBijKLRur7EiWk
 TxQoHuk1+XSmKHRK/beFAE08KhwcQNYY/Nh6/KbpAeHraYFF6nQIVAdVrj8qay8qdJOe
 vac1Q+oLGtJH/WukRqAUD4Dq6aKwi9vX0isP8Rhb/LuvpCeG0ju/5erm5eesC0yaV/cG
 LSBgbZrY3r05ZoFaJPbh6jdbqCB2Lhg5D2/LZD6itG6VLVoOavS+G5pLuI21bl23jZ/B
 M0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yuvzJ7XKyB2J8XQ1p95NuNGQFyxLRMRhEwI7C8RcNw8=;
 b=s9/H/gS3LmJrlEvsPC9kqiAgWu2PQTn1mTPY3IgkdXCK2QsTf3gPP8VVWbz6gtXL+a
 nI+cwYAQTpT/bv4Uo53FQYAUAWNTX17Z+UgEtuL2Yur1Q9UXilcFuIPzIg/FOVFdMlC+
 6O1OWaFR+YVjB3q+dRYXN9vROFNI7v/XdK/ouoic+XUdZMP6MVdbB2k8jDJONNg5GMhG
 yzpIO2lx7w1U4tjl1zw4oQ4EzM3usrnTs9/D8Dlc+RiiqrE0rUvXyTHVeI4tvH6vrInx
 lyFNPkLmAO9ERpAq/bMyM+W994UTOf+LgWPkpBAwO13CvYNAN/A+Fxz1NEIY+5kN9GCl
 bgLQ==
X-Gm-Message-State: AOAM532+gdNn8O9kaPwGIsLtYjqWamUzmZUqd5j6f7AhLdsyBDNaJsld
 4Qs2i43ySB0lluPdjfEqiljd3g==
X-Google-Smtp-Source: ABdhPJy0xmbVP0jsnJYQuIk/ot8CWGqLOEp/599UQ2CXy8d5CQ9PYnIIK35Er7h+2CYObNbUZS63DQ==
X-Received: by 2002:a5d:4536:: with SMTP id j22mr3889313wra.329.1621512215520; 
 Thu, 20 May 2021 05:03:35 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:34 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/38] drm/amd/amdgpu/sdma_v5_0: Fix typo in function name
Date: Thu, 20 May 2021 13:02:43 +0100
Message-Id: <20210520120248.3464013-34-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:563: warning: expecting prototype for sdma_v_0_ctx_switch_enable(). Prototype was for sdma_v5_0_ctx_switch_enable() instead

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
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 75d7310f84392..2a2b9d50afb70 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -571,7 +571,7 @@ static void sdma_v5_0_rlc_stop(struct amdgpu_device *adev)
 }
 
 /**
- * sdma_v_0_ctx_switch_enable - stop the async dma engines context switch
+ * sdma_v5_0_ctx_switch_enable - stop the async dma engines context switch
  *
  * @adev: amdgpu_device pointer
  * @enable: enable/disable the DMA MEs context switch.
-- 
2.31.1

