Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D5E38AD72
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC666F41D;
	Thu, 20 May 2021 12:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9936F41D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:34 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id 62so7997986wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nynxxR/OsBCzgQqs0HwpEzxLm2OUnGw35ueUBnmCZ5g=;
 b=UVushAvSHMxa0C5XeIr0bdnDeei0Y1WMhTJYIgy8dRMkWcdNb44elX1h9GjF+D91/g
 3k64urbysVJKIrBU6PzA9VQ3NsXOwtgj13lRJYOyJYsJA3e0j/9qshxBzBZ6TtR5YRPe
 y/FRBOgs+Ef7wwJovho+qJW4lgNU1EePROSRQxihFEpoh+ATXkOFcIUpzwu4AUnPeVOm
 EeRD4yDhkcOrQtK2qkzw9DlMihFqF2Kcnh/TOt5xZU2mcps7qvrMLId8Ald+2NeO/5nr
 4koCiRAM+2HJ0uXudQpe77PWXptcGWavHthevwz9C/nmG0EBxHYBX7QkwZ5OVHTnadHs
 /Pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nynxxR/OsBCzgQqs0HwpEzxLm2OUnGw35ueUBnmCZ5g=;
 b=C5vg+e7CSan7RJkjHPLC61pku9ZqkRLsNI95HQUAX6t379PcZcjGR22eIUS5WhckmN
 Dx2HktYBoSyyO/q4+MlEmNCEcvKdWihABSSp+kt/MtoFhWN7QFsvN/4zkIFChzMY6npP
 99L556ComW9oW8Mwn7OhNHvcoF9CJDyo8HSzmL7l6jyl7DH+WGCXBVC3AMC9cU5gM9SM
 kGMQJsTI01DtvxACRboLy5sXzojgoBqv9+sDyfJDzpQNfdFhJ5Pt5h/wt/cQW77UpkAW
 Ro+jZvKG0qOwwOSiy0mT/8rK7OmY/I+tHSIDaAPlUdBRL4ziEuct5+KxTizeXo0q/CzX
 SIPQ==
X-Gm-Message-State: AOAM532g6FnbNQt3XylQIy4nQw9mVPbsfwnMXyWDAr8WbW4PWOwp+Ohr
 KqWm0YWHneEx4UxWSlu0rreOjQ==
X-Google-Smtp-Source: ABdhPJwMr2S46p+INbbf4IlG3gi+W3uNAXiPXWi5P3w8PnLPD7lw+1iFRHCGlUXFBNZ3FsCYsPxzCA==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr3317496wmq.138.1621512213083; 
 Thu, 20 May 2021 05:03:33 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:32 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/38] drm/amd/amdgpu/sdma_v2_4: Correct misnamed function
 'sdma_v2_4_ring_emit_hdp_flush()'
Date: Thu, 20 May 2021 13:02:41 +0100
Message-Id: <20210520120248.3464013-32-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:281: warning: expecting prototype for sdma_v2_4_hdp_flush_ring_emit(). Prototype was for sdma_v2_4_ring_emit_hdp_flush() instead

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
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 9f0dda040ec88..4509bd4cce2d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -271,7 +271,7 @@ static void sdma_v2_4_ring_emit_ib(struct amdgpu_ring *ring,
 }
 
 /**
- * sdma_v2_4_hdp_flush_ring_emit - emit an hdp flush on the DMA ring
+ * sdma_v2_4_ring_emit_hdp_flush - emit an hdp flush on the DMA ring
  *
  * @ring: amdgpu ring pointer
  *
-- 
2.31.1

