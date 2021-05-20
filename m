Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E20538AD78
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C3F6F441;
	Thu, 20 May 2021 12:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B9C6F418
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q5so17385215wrs.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X9eczHip+J0dwqD8Nynlf0SQVH9uQ9i0PT+0Vah0Gl0=;
 b=EBBm/BAj9BTJp956f9eBv+yUCERX2gUNVAM6K/5E4csMp3i8GsP0qbgOm0BU51QRPT
 6nZwAPPp4tiz1c50sSMPznww3MHbW2TC23YqcXaF+HTp7ZnZ9HSGMonK8a1ZKw5SrLH5
 oJpnp4A7uLGuhrKjG6xl92kK2l3WXZ9+gU6bOrPj+wQ1mvnabg1GgtQs7S7B30Y19HIE
 MCTWxGCtlQMnK/H+JaYrycrc2+WEVxcDH//S1RDdP5XUC7hL8qakz0B2Bpve4HW+1qd5
 tu8gFTy3HGzvAwq/DnIU51mjniWNYmOd2pDlwG3048bxvSJ0F4DAUgCO+tlb+dlgUz9Y
 6ckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X9eczHip+J0dwqD8Nynlf0SQVH9uQ9i0PT+0Vah0Gl0=;
 b=CqgnPXCqwwG2WmFnMTKhV+tWTLl7bQ/N5+/RH1Gcl71HiJsJgOR1cnTN1nFe4pqSUy
 UA5het58I3h5h6eWOd4yH1X+UotyGLFVU0QVEO8DQK3smlSWdu/8h96I4KBuhaLdIKZg
 z9KDGniWMAmN0cZ4daXh78iuDtoTm7AZ65p6Ke+k8LziaW4WpdN0wYnFojH/EHnxkBbn
 SmJ8KztnipVyNjcJO9fTIMg7tUy9JvDWzWMLQ+nHyyx8a8hH9gp7jYzIEybjdLVAnY/2
 32vNMGMi1NMxx/Q8Nb2OHFdFZglJ0We+VKeS7PJb/yr+q6RdRNa7QY4eHQ2F9QSKSmLa
 JuAg==
X-Gm-Message-State: AOAM532L7ZeQY4gPrdUnl4uOkbYuKbL7K5LuHjSQzopJPfBui+SVEAvK
 j7ELQONCe7A0mV8G+diUX4e5fA==
X-Google-Smtp-Source: ABdhPJyRIxha+2unj4GubwBfRPOO/kKMbHctRfrTKSCS4y70HgOgR3Rv8Bl0IBQd/a0bAg1psWp//Q==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr3957954wro.254.1621512214037; 
 Thu, 20 May 2021 05:03:34 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 32/38] drm/amd/amdgpu/sdma_v4_0: Realign functions with their
 headers
Date: Thu, 20 May 2021 13:02:42 +0100
Message-Id: <20210520120248.3464013-33-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:764: warning: expecting prototype for sdma_v4_0_page_ring_set_wptr(). Prototype was for sdma_v4_0_ring_set_wptr() instead
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:830: warning: expecting prototype for sdma_v4_0_ring_set_wptr(). Prototype was for sdma_v4_0_page_ring_set_wptr() instead

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
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index d197185f77890..ae5464e2535a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -754,7 +754,7 @@ static uint64_t sdma_v4_0_ring_get_wptr(struct amdgpu_ring *ring)
 }
 
 /**
- * sdma_v4_0_page_ring_set_wptr - commit the write pointer
+ * sdma_v4_0_ring_set_wptr - commit the write pointer
  *
  * @ring: amdgpu ring pointer
  *
@@ -820,7 +820,7 @@ static uint64_t sdma_v4_0_page_ring_get_wptr(struct amdgpu_ring *ring)
 }
 
 /**
- * sdma_v4_0_ring_set_wptr - commit the write pointer
+ * sdma_v4_0_page_ring_set_wptr - commit the write pointer
  *
  * @ring: amdgpu ring pointer
  *
-- 
2.31.1

