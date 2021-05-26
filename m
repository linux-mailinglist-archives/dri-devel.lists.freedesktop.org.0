Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A213912E9
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487F46EC63;
	Wed, 26 May 2021 08:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5BC6EC2F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id h3so240878wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhZgrAainLjec7+hq499eXjP+VFgJtwYW3msrbGd3QA=;
 b=e/cES6WXNf9+ZpY2D4VLQY1tDCYiL+YmBb4TxjZ2Yg7Tqivde+ECExm/VjRqhPnSwP
 pF8Dg4H6EuHK4qbZbPO+DGRTYWw4TuhME6GXJsqxUD9gzvrooDgB5lB8x9xiKzGig67T
 N8NBqVRkw51z8HuTtm2qK+cELNmbWunRFkBF6EJNSbgv7ANarLKuUJxEP+7/qMIYa+of
 HFTWFAqci9XzxxOxAndpAr5puhN1ats8ehvfyxupcGhc+COIFf7zIjylco2BMp0a5E+T
 WMrfVMcOJM1+t4t2yLfbGAPFUfRKjdwV6HG4pMnW90cWxOBzU2w//zjuoMjZbJ+iFBf5
 /dOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhZgrAainLjec7+hq499eXjP+VFgJtwYW3msrbGd3QA=;
 b=c19lFzMeSO60GXk9c2ZePJQVQPCZ4CR8w+hiV7TDvWqhP32QVlsQuIm7OvJtM5hKwt
 gK7MAolJNfZTeYSVRugq/OCYrn+TkagnefUpfilmkTDpahO5l6zFKSvjufmRQDIL+iGN
 DpNfh+H2xSu1+aOMLSvzQBYJ79HJoyxm9SEa7/5RD4qUfDpbRqVuzziHaHiCV8f7cIHG
 sljr1KJgN3L566WSc2dZr4x7OctB1kFNz0vvNfijBE31nmXjkY0s5XAkOIkZWu6M2Jgx
 a/NjcV2yvo+PPzZpdYOOFwRCq8jS4RcBQ+FoXS/PmqaR1J4zpQiaBFd1USwg9X+WMZgJ
 CUPw==
X-Gm-Message-State: AOAM533BAcIf5XzeTw2/1dTnXw+2i3Ih8/evVxj17weSm/h+AYSWKe+c
 gBEVeqPEUjbVVG2qGlmPJq7REA==
X-Google-Smtp-Source: ABdhPJydthfwy6pyhiwfSi4Vw978YT5WPdxv2u67ek+4Ky6PZ2aPSphUROb7xbK91WYE7mAK79UCfQ==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr28332218wmb.45.1622018872593; 
 Wed, 26 May 2021 01:47:52 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:52 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/34] drm/amd/display/dc/dce110/dce110_hw_sequencer: Include
 header containing our prototypes
Date: Wed, 26 May 2021 09:47:13 +0100
Message-Id: <20210526084726.552052-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:929:6: warning: no previous prototype for ‘dce110_edp_wait_for_T12’ [-Wmissing-prototypes]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 9219db79f32b6..1ef1b1b33fb09 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -64,6 +64,7 @@
 #include "atomfirmware.h"
 
 #include "dce110_hw_sequencer.h"
+#include "dcn10/dcn10_hw_sequencer.h"
 
 #define GAMMA_HW_POINTS_NUM 256
 
-- 
2.31.1

