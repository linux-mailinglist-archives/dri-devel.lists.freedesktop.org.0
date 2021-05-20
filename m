Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A906838AD74
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B236F41B;
	Thu, 20 May 2021 12:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020BC88905
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:18 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so5280669wmk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+fmZglR54ll04aap/nnrS1lTMmfuDtfEf2wXqJX6PX0=;
 b=ovUuBIpidetnGOoSyQualmIn8fZ/i0UtYvGw3trII7Y8HUSva2w3aKXILZI3TNQoTq
 cGX973y1nw9iyAPD/T6ZLlSmDs6LUAvNrTbiLiqtEwiWwkegm+qkApuZZqKss6d5oeCz
 8h/YpzebuSZkEhunQpCVEDiE5fm4VjYhzR+4CXlHHGDwWwtDi5VRyt3DHu95k6ufJks3
 Snu0++kd82BETGmIUFSYJkr0kwMzPOs8qagvuxn3Klw10mKm0lW6CwjPlyhi/KHN1RDy
 dftAbTbwEIo5qNGZWjVG5hM//kJX7lDw+n1oU9wYzzfblnJKWdb6h7OhK4+tBxk1otrg
 Rn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+fmZglR54ll04aap/nnrS1lTMmfuDtfEf2wXqJX6PX0=;
 b=AxyLNOHDlHPM2QKVMNOCSU1fEmBq9QGSUg9Q4CdB/3fh/Blsh02JU8pPTS0bQcqXZG
 Ok64KXqv2xOwaiGiq7aBfUMmaJbQqcZFR7zwUMkcK7pTtOECBzt41mK9xeeZbiF7l3w8
 bk787oykXOoO4ksmKfIk+fSCgLUAVrxe5jv4ZXxZJRe8WCvwhpoJtYeee5GuPsBuLunK
 pgDi2uNE+lgFLu0Mn01pJaFFqSkzclTN0rCtGILO4f4xrVS2/8LWX/3q+jRaimRfmc3q
 ZbDVdgyxa96wSlc7kxdHglulH7tAM56vI3JK5YJcUACydWMuJ0FC5BisnxaPa/4k4IUB
 vuHw==
X-Gm-Message-State: AOAM532nNSKIJhGzByeyljdSSJqcKr5CrwGSKTpz7AkBtLY/tHEqDTBT
 77L81R1+Kmk/MXLM4zmB6/uF7g==
X-Google-Smtp-Source: ABdhPJw8kaYI5LLeHaobAMA/X+5SKA38x92KIomeDesCAADoarpEPLvyZ1HDdbjflDFVnFg5Iwu2fw==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr3279429wmb.72.1621512196541;
 Thu, 20 May 2021 05:03:16 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:16 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/38] drm/amd/amdgpu/mmhub_v9_4: Fix naming disparity with
 'mmhub_v9_4_set_fault_enable_default()'
Date: Thu, 20 May 2021 13:02:34 +0100
Message-Id: <20210520120248.3464013-25-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c:446: warning: expecting prototype for mmhub_v1_0_set_fault_enable_default(). Prototype was for mmhub_v9_4_set_fault_enable_default() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
index 47c8dd9d1c78e..c4ef822bbe8c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
@@ -436,7 +436,7 @@ static void mmhub_v9_4_gart_disable(struct amdgpu_device *adev)
 }
 
 /**
- * mmhub_v1_0_set_fault_enable_default - update GART/VM fault handling
+ * mmhub_v9_4_set_fault_enable_default - update GART/VM fault handling
  *
  * @adev: amdgpu_device pointer
  * @value: true redirects VM faults to the default page
-- 
2.31.1

