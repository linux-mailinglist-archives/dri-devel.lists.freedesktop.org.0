Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75238AD7A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0926E6F444;
	Thu, 20 May 2021 12:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78516F41C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so5060810wmf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EkPRRoz7F84TTvDB6+0jP5Wh7M4ODElC4NQcMjBtFnE=;
 b=C7sgYTiANrC4NQXV+e5udHxsCPzVZnTdUONTGFy0elAjMgOr4a4/G1J+MxGPYWhgeG
 fKGfGMfyFUqP/jfVk/15fcyt5KfukAI0rN0/N2CeMI481eYGwA/ae2yAGB5r+KY8XBHU
 WS7b7Qm8Ple3GdMdCYcMp+hm6XJtj1QmCU9DJk9LqD58oSjspNVNWGzgWaitErSc4qWm
 NMIpVZzr8aIs+wkkMsvfH0oKbSph/Ecueoe50rcU9k85CjFRwvRRmZROlZdtpcEc19U9
 YWDrGUfx/MmdtGpYp/+KlYsxMkUJg5YvQj8KD4ya/3Nq0FnI2SucE+lTMo8DIpSGJcX6
 ygwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EkPRRoz7F84TTvDB6+0jP5Wh7M4ODElC4NQcMjBtFnE=;
 b=NR0kjO+fAA0hJ33CVnr556h60YY1XCQy7zatqU/oX7b8V8t/Tyjo1CsEUIltkU16k0
 Xn53flL+eKo40xN6zTQ8c+TXXHlN30m2k7YWrbEHMkmy3NppTe0CkrhBD4plETSTNvID
 LGa1b/c7+9DrWZRy2e/XblmJs8za7WCMVQQtYcNc9V9LrZqN3jF/kg3sBgWWQYY6+XLg
 GQZpxTedYqf3Bky/qEdFWSorUR8kgunM8QL8OzTYrUctLNGtSfqx2PgLk/zS4ppmuAxj
 bnl82b3gPf2JoO05RLPJWLNb/keClSOhwO9cg4mvvMQABC4PNNhhRiY1dCVRRduZDRc2
 vYog==
X-Gm-Message-State: AOAM532QXTkzdzpWsPxfP+cVxaHS7wX4o2kWx8GpVcCndFok6yFNE7MU
 haS2ekJZdL8fesbz38YsHR1SDg==
X-Google-Smtp-Source: ABdhPJzPnAPqk77sjtNc+xUnzh/WodTD1UR6pw3gSJKCE5waqxLJcs6BuyWwb2EH/6hrtLLTYjuCKA==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr3283573wml.81.1621512188364; 
 Thu, 20 May 2021 05:03:08 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:07 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/38] drm/amd/amdgpu/si_dma: Fix some function name disparity
Date: Thu, 20 May 2021 13:02:26 +0100
Message-Id: <20210520120248.3464013-17-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/si_dma.c:320: warning: expecting prototype for cik_dma_vm_copy_pte(). Prototype was for si_dma_vm_copy_pte() instead
 drivers/gpu/drm/amd/amdgpu/si_dma.c:412: warning: expecting prototype for si_dma_pad_ib(). Prototype was for si_dma_ring_pad_ib() instead
 drivers/gpu/drm/amd/amdgpu/si_dma.c:425: warning: expecting prototype for cik_sdma_ring_emit_pipeline_sync(). Prototype was for si_dma_ring_emit_pipeline_sync() instead

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
 drivers/gpu/drm/amd/amdgpu/si_dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index cb703e307238d..195b45bcb8ad9 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -305,7 +305,7 @@ static int si_dma_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 }
 
 /**
- * cik_dma_vm_copy_pte - update PTEs by copying them from the GART
+ * si_dma_vm_copy_pte - update PTEs by copying them from the GART
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
@@ -402,7 +402,7 @@ static void si_dma_vm_set_pte_pde(struct amdgpu_ib *ib,
 }
 
 /**
- * si_dma_pad_ib - pad the IB to the required number of dw
+ * si_dma_ring_pad_ib - pad the IB to the required number of dw
  *
  * @ring: amdgpu_ring pointer
  * @ib: indirect buffer to fill with padding
@@ -415,7 +415,7 @@ static void si_dma_ring_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib)
 }
 
 /**
- * cik_sdma_ring_emit_pipeline_sync - sync the pipeline
+ * si_dma_ring_emit_pipeline_sync - sync the pipeline
  *
  * @ring: amdgpu_ring pointer
  *
-- 
2.31.1

