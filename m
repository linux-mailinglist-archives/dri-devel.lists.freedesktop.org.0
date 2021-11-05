Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F06445E4F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 04:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF31C6E591;
	Fri,  5 Nov 2021 03:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12DC6E593
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 03:05:20 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id j9so6581699qvm.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 20:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p29jzjn+HciZTKz27UBXeqRtt6jrYIq3wM4tpoc5cfM=;
 b=W3ZFF4OzpqXBx7l8s8Hp21cuwa2rPHqlccIfRMgsKQC+qqylzTSs/hsK4F2Npg1VIt
 2842O751JM4bJ9qTmPqpV4GUNnyF13Gekwl+rtPUvk5UQqc99nFnAlm3bg4hn9DoTD8t
 EEIQwJrTs3KHwK27wdfw5qmcNxNiYHyxLS5Afh+tYLjRMg4co/hsnJmPjugdVwy3Esl1
 MrtINU1i/tOHKAMtBWuulTJfaodNBdTQdfSxGsONUIIE36s10MBM4EELYo5rXKfjQg3B
 atwQFhGqGpsjcuij335zJpLoodi2ZmbrW81FOYf1t+TRbgUOz3BWp408+c59pQq164n8
 Njmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p29jzjn+HciZTKz27UBXeqRtt6jrYIq3wM4tpoc5cfM=;
 b=AAoHqx1Zkqrc0DvLjFvq5D5x1TKcCiDTOEtiTIiAveeQLTIYzMMWeJ+d3MdhprztjQ
 qlYkFu+DOtc5wzC2zTUaTP6q8C+qI7l+lRKRh8xhy08vWg3A48GsWSu3UClO9coJSjrA
 /J/mHmrD0K8CW6XqgBmILiaxrzWlPROGrhrVcFek8kJ7cmaW67dH/lzNWN4nP7uBwuc7
 t+u/J0qWnAfeaz2G11XIvyU54eZC6dSG+Cyj8kY50Jbvjtfws94eMsxOQCsOXNqyDmc+
 l/HuLJU83sUvRKJ39faQu5FSrwJ4Et4wgN38BL5TTlmjIoTatyvuWbCV8yApguFhLRwn
 O45g==
X-Gm-Message-State: AOAM531dPbRV1b4m89oSY3bERDhtTdV68zMXOuwFbTQlW+Io/q0d+ros
 JAP8MlZYujDoJAi0idC9qeIfR536SDJnPg==
X-Google-Smtp-Source: ABdhPJxjpqaOuejmdoVnBRmMROAdccqiWmk/TA4c8Co84JjNZbbGXmcOjN0wLslqkbGBCU5dnpp3gw==
X-Received: by 2002:a05:6214:f09:: with SMTP id
 gw9mr21017353qvb.36.1636081519728; 
 Thu, 04 Nov 2021 20:05:19 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id s18sm5475605qtw.33.2021.11.04.20.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:05:19 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 08/14] drm/msm/dpu_kms: Re-order dpu includes
Date: Thu,  4 Nov 2021 23:04:25 -0400
Message-Id: <20211105030434.2828845-9-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, swboyd@chromium.org, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, bjorn.andersson@linaro.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Make includes alphabetical in dpu_kms.c

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-9-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-9-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a15b26428280..66b7df7daa6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -21,14 +21,14 @@
 #include "msm_gem.h"
 #include "disp/msm_disp_snapshot.h"
 
-#include "dpu_kms.h"
 #include "dpu_core_irq.h"
+#include "dpu_crtc.h"
+#include "dpu_encoder.h"
 #include "dpu_formats.h"
 #include "dpu_hw_vbif.h"
-#include "dpu_vbif.h"
-#include "dpu_encoder.h"
+#include "dpu_kms.h"
 #include "dpu_plane.h"
-#include "dpu_crtc.h"
+#include "dpu_vbif.h"
 
 #define CREATE_TRACE_POINTS
 #include "dpu_trace.h"
-- 
Sean Paul, Software Engineer, Google / Chromium OS

