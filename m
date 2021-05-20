Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C8F38AD5F
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A018940F;
	Thu, 20 May 2021 12:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F176F420
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id y14so15302670wrm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ORngqLW4L2zdTApLGcFRT++FkyS233QJRd+HHJUy1ZY=;
 b=OwZKFXat7QOpuAe9T/E2FnG6IWhBsxkdiaopAfAMhCSo2LU3SbsOU9JO7w72ceqS8C
 FZ9FqBXSiyasTx7FaT/iWnoyItrte5OQjvak4wHoXmVrBLWAxvpjXGgEApRHBZf8lRp0
 4ZlT4hCnoT9e8AiOqOF9Q3KeZ4cK0vIDsybkwg4673URzHQttcm2VMvZp50vWZgmndFx
 C5l9Qt8/ZJp40BVtvzY+QNgg+cQmC/mTbBy/uuZobIV47wGmvv2hzyIUBbKr557KROSa
 1u8i8WJsDmDcXFRHcPNRE27hhBJYy+FqOsVcxTcEMjZS/4o6tGNEBBvg4KjsngghfREV
 3Ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORngqLW4L2zdTApLGcFRT++FkyS233QJRd+HHJUy1ZY=;
 b=oI63w/9d0kWT6k/UJydk0VtKzp5FQeucSv7fWHklJOncUes8vE4UOjaFWAiI9kH5yb
 ZG17nNqPnvWWk9LwAx0iKg7s+e4xMDc8HQs8U0LKjPYopLb4rCBLQ+FGvzGjDCguE0Of
 nDhfV39pJFXSjWojdS29+ybB3hsIhG3NTNdUN36K2AhPItbs+IAnk9bd0vqAVZyRY+/w
 cDiEliH8Fm+O2axr7AYY0zj9dCwzTkzRIuChOAz1Ztaw0yhKF9LeDDA0DXTSJl90Xo95
 cTbvnqC/TJ9txwGrz98ro/NpT1Xlo1m3ngxnEeIRcMUjOKaPCCJcWvN3mXys6z7X2QlZ
 GmWw==
X-Gm-Message-State: AOAM530fJYEMlXn0TwX4TI0BwyRJnNgBdmb+jxI4aFPtt7QJxYajFsyR
 e/zOZgl+eHuMFMLP5V6/M8OKIQ==
X-Google-Smtp-Source: ABdhPJywahqmGqUniBXsHiwugmEi2oTc+D0Jdl2htYoDQ3fBFQRtKVzFD9Mqaj8Dp7jr9w/uo3hGqQ==
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr3904749wrs.333.1621512189384; 
 Thu, 20 May 2021 05:03:09 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:08 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/38] drm/amd/amdgpu/dce_v6_0: Repair function name of
 'si_get_number_of_dram_channels()'
Date: Thu, 20 May 2021 13:02:27 +0100
Message-Id: <20210520120248.3464013-18-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:468: warning: expecting prototype for cik_get_number_of_dram_channels(). Prototype was for si_get_number_of_dram_channels() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index dbcb09cf83e63..c7803dc2b2d53 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -456,7 +456,7 @@ static void dce_v6_0_program_fmt(struct drm_encoder *encoder)
 }
 
 /**
- * cik_get_number_of_dram_channels - get the number of dram channels
+ * si_get_number_of_dram_channels - get the number of dram channels
  *
  * @adev: amdgpu_device pointer
  *
-- 
2.31.1

