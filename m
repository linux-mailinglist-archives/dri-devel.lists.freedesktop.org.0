Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B367D38AD7F
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03976F416;
	Thu, 20 May 2021 12:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F289C6F418
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x8so17378561wrq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tJTJtfpMV/J/H+YFu2v39vUwU64txzJ+siPwQcxgUUI=;
 b=mDFB9RE1bc0Vqz3kk4DPBdJ9UZ/aMsd+rUlwA7frOrSPKA4J5EOky+7+ysl+VIeslx
 VnuHUou9Hz0olWToCaUysglK/ryHBbFYTG1zdzpfEsRKX2oKSczKuKDc2NZI/0vROlwG
 nFEFSbfmg6XBybX7YhaVP+Tr/LE1gctAgIP1HLMc0JcMywAitb0spISUg8E4IOPhaaJJ
 Kqq4h1v8Gm03ZOYI1kvz7TzyM67/zNMNzWIRm1646/gx9rl1Tvfm9CQGE6wVv488bsYO
 r6S8oUrYDtO3fYI5BS7HPcNxS2VKfxQLPJABQ3qYCqjXM6uEPjbehPB4X9i5wQ+XUa3x
 o/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tJTJtfpMV/J/H+YFu2v39vUwU64txzJ+siPwQcxgUUI=;
 b=Hvn/QFcCTMfnxFNWAX8X+jBJwxYLgLBqxqu+k7uMKM+mg1FdrrqA75eR46xQ9TfgN6
 fK4oZE2oUK9HTkUyp8k6mPT0i4R048WkakXZhkEVmc59TlwY1PvqNkLfnvJ1fwgoYcvb
 wL4X1OO6obaCc39vPQIzAfdj0q6tmCV0I7sHqYRyoawDNpLFdtB6oo4OoQz6vHD7gMHI
 6CIy4tt6K49aliEZqowON4C3mYntKLev7w0NzlX8LGOWrhJCjvVC7YIVtTexgxwZ25/N
 4Jzpep47zer1RpvpNsyyLd9bV7pqTiYpz2gLk661DbbADkSw3f+xAmDQX1AkX8tKfVPC
 HKGA==
X-Gm-Message-State: AOAM533HuHslteibTk7Ly8iuSPoyl0iCJfvUz7PPOOpXzJVz9VGHAnl5
 XE91lYwULHd4b32KpQT1tVooupFVPzhxTg==
X-Google-Smtp-Source: ABdhPJwhOZLLUHKejvhGLkMhKQ561C0i0iSobmuqHgR5qbq460hZZkBpBeFxX4iu+mRWKCqZF6aUVQ==
X-Received: by 2002:adf:e0c6:: with SMTP id m6mr4107882wri.66.1621512217735;
 Thu, 20 May 2021 05:03:37 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:37 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 35/38] drm/amd/amdgpu/sdma_v5_2: Repair typo in function name
Date: Thu, 20 May 2021 13:02:45 +0100
Message-Id: <20210520120248.3464013-36-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:501: warning: expecting prototype for sdma_v_0_ctx_switch_enable(). Prototype was for sdma_v5_2_ctx_switch_enable() instead

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
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index ecb82c39b1062..deb907f960906 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -517,7 +517,7 @@ static void sdma_v5_2_rlc_stop(struct amdgpu_device *adev)
 }
 
 /**
- * sdma_v_0_ctx_switch_enable - stop the async dma engines context switch
+ * sdma_v5_2_ctx_switch_enable - stop the async dma engines context switch
  *
  * @adev: amdgpu_device pointer
  * @enable: enable/disable the DMA MEs context switch.
-- 
2.31.1

