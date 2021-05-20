Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0E538AD59
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1006F417;
	Thu, 20 May 2021 12:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B1D6F411
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so2424401wmq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X5sw4AF7XegGlkCLbUkHlKVD/9b0ngx4FCn81/fMRTw=;
 b=ksOBWl5tUNwe2AcCRFDXtFTwh3WcnrwIVTy4i2oBgCXno9jjdWp/XD6S8ubPm3p6G8
 egyngHGEAXetidUWukGeEGKRoxrHehVNUujwL5UZaJXJM/ujGV8GWbx+fsWk5zk1yvB7
 FZ7J8mU2JWiDEe6oEXLSL21YmyI9LN+k7Kjkb/11Qy49SEbRUVsKBJ37qENvdOJRZKL2
 BNLlgLJJTf/3kYZkL8yy9GP6Lj8K4Nq3roKE/fjJ7b5LSSkQFEotJBMIx5MBWf15wEnH
 I+MnL828LxfDCMygyT7WpszFes9K6itFg+Gm8fCJsCOpyneL2IezTNfHMizJD+jIPe5j
 UM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X5sw4AF7XegGlkCLbUkHlKVD/9b0ngx4FCn81/fMRTw=;
 b=buuTnYcRhlEizcfsAxMGskFhE6aBl67D3gyXFKeJgwkZUnl0NV0Ys7FdGShFKNQP/U
 ntIIwl0NV+WYCA18WLSq89NTNQXC1jMXm705go6WsUhWG280OXlIPEubRcHHu1+lEjJw
 N5ZgkDOtlAsFEMRfUq7UmDH5oS0W1IW4OpQOJfvNGU6VWvM+gEC8clB4iWUUCMfYjY56
 SWhzrx6EPaed770R61erCOAg9v7sDUM8tadUk8PXADWPf10u4qXBVoCUG6gmi8hFVgrf
 JQL+rczwVBqdkPeYGAtN/BwfId8qpsHewpeUbyU1HNL9T5rbGd7BbiwP88Y9CLYKML1q
 OPTQ==
X-Gm-Message-State: AOAM533SdhfR6JK9bf/4WUXRNnWqgBC8GDEbPnQAdUwG/Juq/5H6Yu+P
 jfgMzNjaQGw3i+ORXLCicPiY3w==
X-Google-Smtp-Source: ABdhPJytwId7vCW32UE4+OALKLTHqn8gKfwODyoIgV/xjaR47aJ4cs0jn84xEkBWDkNWVdXHbHxY0A==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr3314880wmq.138.1621512184229; 
 Thu, 20 May 2021 05:03:04 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:03 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/38] drm/amd/amdgpu/amdgpu_gmc: Fix a little naming related
 doc-rot
Date: Thu, 20 May 2021 13:02:22 +0100
Message-Id: <20210520120248.3464013-13-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:487: warning: expecting prototype for amdgpu_tmz_set(). Prototype was for amdgpu_gmc_tmz_set() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:533: warning: expecting prototype for amdgpu_noretry_set(). Prototype was for amdgpu_gmc_noretry_set() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index a129ecc738693..58feb0a422c34 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -528,7 +528,7 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
 }
 
 /**
- * amdgpu_tmz_set -- check and set if a device supports TMZ
+ * amdgpu_gmc_tmz_set -- check and set if a device supports TMZ
  * @adev: amdgpu_device pointer
  *
  * Check and set if an the device @adev supports Trusted Memory
@@ -574,7 +574,7 @@ void amdgpu_gmc_tmz_set(struct amdgpu_device *adev)
 }
 
 /**
- * amdgpu_noretry_set -- set per asic noretry defaults
+ * amdgpu_gmc_noretry_set -- set per asic noretry defaults
  * @adev: amdgpu_device pointer
  *
  * Set a per asic default for the no-retry parameter.
-- 
2.31.1

