Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9E138AD77
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F036F43F;
	Thu, 20 May 2021 12:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2F06F42A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a4so17425423wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bMsBteM78sLZWfgoifTN7rbSr2W6UwGZKOyU98K9lCk=;
 b=xSRTCGcu0REc2dYZptHzRuhKcPm1H9u122v4lhRKXyyiFVkdAZ9ovsqzg0hnRDraB9
 EWpa1FP+mB8V74m/438XjQgRMh12C4wJDZOXXAyT95kTzjJcjjif1wZD2jhNcCdRTjhd
 tF7R/BcntVQUtUCaVo7NC0MbSwRBSKMWSh7YpUvC5JFpxLIbSbu94EIDF02NiLluUZ0a
 VHh+ojVGIH3DrkTiXBQaXbcwkbxwqPsGadxZ0qLQaM516IeuW6uqAMLkog+qKJBgk2an
 SfBbPaIr/eVlm9KBGjm5w6y7cZqfj/57En6BsfmOg0Vs8wdAxkgGLL3RZx5JkD93NL1w
 Ww1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bMsBteM78sLZWfgoifTN7rbSr2W6UwGZKOyU98K9lCk=;
 b=ezUe1cnCAe2I+Z8MAWMI7NxDOJEMZ0uD422f2nwLrQFQPm0pc9mWAtkC2SU/oyMR2I
 n75QC5SvXudqynud0Mm92ArDA5Y+Gb+xWXYx0IsOn7pQgf064BRKcujSz/1E4AEBFHf+
 F+GskeTRRIE2YWO+rPf0pJFzn6XMU7epn36GRAAUcXwJhxiS9M44r0H8cgJsLIyMpM3n
 mc2UZ7CwiKcaO/6IoEUmldmnW0lrOm8QQ8YnSNNHYPqO5Fwnnm3uNHr5fujrEmUjQRAq
 tGsOwWgrRCZaNc1Mzkro4dp33GsG9KNpfWOyZm64c5MR9/GzfaLCkSufp5YsKvsBx/Ih
 bSlQ==
X-Gm-Message-State: AOAM531HR+fn2cgMSqA+cQj/JoShEO6GuVn8y2W9uNKWq972UEfBz4NP
 tj+AT2xZtwWRjOWe9CdLyu8dkw==
X-Google-Smtp-Source: ABdhPJwyGDhnqi/8RHVMK2lWOHVz5VhQxaBzjq2jtP5sUVYHgFuD5cjW3Am5cCQ6JmYxEbj+vwnwHA==
X-Received: by 2002:a5d:4408:: with SMTP id z8mr4011768wrq.2.1621512218851;
 Thu, 20 May 2021 05:03:38 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:38 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 36/38] drm/amd/amdgpu/vcn_v1_0: Fix some function naming
 disparity
Date: Thu, 20 May 2021 13:02:46 +0100
Message-Id: <20210520120248.3464013-37-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:775: warning: expecting prototype for vcn_v1_0_start(). Prototype was for vcn_v1_0_start_spg_mode() instead
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1111: warning: expecting prototype for vcn_v1_0_stop(). Prototype was for vcn_v1_0_stop_spg_mode() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 0c1beefa3e498..2c9af18683feb 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -765,7 +765,7 @@ static void vcn_1_0_enable_static_power_gating(struct amdgpu_device *adev)
 }
 
 /**
- * vcn_v1_0_start - start VCN block
+ * vcn_v1_0_start_spg_mode - start VCN block
  *
  * @adev: amdgpu_device pointer
  *
@@ -1101,7 +1101,7 @@ static int vcn_v1_0_start(struct amdgpu_device *adev)
 }
 
 /**
- * vcn_v1_0_stop - stop VCN block
+ * vcn_v1_0_stop_spg_mode - stop VCN block
  *
  * @adev: amdgpu_device pointer
  *
-- 
2.31.1

