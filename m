Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D7B41F0CF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE646EE3D;
	Fri,  1 Oct 2021 15:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC416EE2F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 15:12:27 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id a9so5783796qvf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rz5gCzVDNV62cuv4vyK+T5ukQ7N8zj3vMSyr7EWxfPQ=;
 b=S7nyWdGn5iqG2gUb+u/f2G7vtcP08aG/rEHaXicD7Lh6GBWOnbGHLk2zM5y/90c1fZ
 nd30Dob5lUGRzMJ8VACsYqHDnKBOuPVRejGVKk15fZ0k8OnYSbJb5/nKDcbBSUS2IlDA
 r/Aja9AKgI8BDZQ6diJAWNeiC8QOM0CqTJorzMiIZCY5DXp//YyzcU3yrlG1W3aOiX6k
 HUL6dHEvUPID0gKIcvh+9YxERfSMmZauBkOgpedJY43x2UmJEfbw2cmVWm+S2byH5XLH
 rOwizyFuqxkUPfxQTCrLFR7lThZeeTjZ+23FToKXcHB6M7et2REhbLP6pRlTIOT+ymlS
 Efaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rz5gCzVDNV62cuv4vyK+T5ukQ7N8zj3vMSyr7EWxfPQ=;
 b=bxeW2UX5bRE7sr+sMU4TrCdQB5EgngPaf5GNUUvFeOeAEOOfz88Uhboav2uMWSwT/S
 5GKpWBjOfMPoOONEoTreK8jwlFny1VAOxYkWj/Na1ukhdSPxgYU0xek/I/AJoEw+BnBh
 Foc6nZgHIJvHyXr9633e0H28fbCoNDCANPFKT8HmQxj9gycJL8ewy57cyrvkai3sbyn/
 U0vQkF8V0+BQ95LUBcW/JwYYtyeHco0G68ffEzzpTZFcd0R47DtnavewlhAkDQz/jiuU
 ZyqnflTXkVg6gMfo7/Q26UVvU+pur49XT2Fw1CKDD7Q0qAphFwquMfPruw1++1MHRcfE
 jvOA==
X-Gm-Message-State: AOAM532RHN4wZ6hkcoxGB7Vu452VBzNdIOEPotfVQRf1H0B06r30fQfb
 2t+pZqD81Kfr+bfVGoyMcZRnpYR/KRzIrw==
X-Google-Smtp-Source: ABdhPJwBtXAxIHHmKlEd+vw6XuF/oHF6qtgC7vJFS4QGvfBf/twt1YKz0iQR7Ix/Be5gkY5Yuf7Cbw==
X-Received: by 2002:a0c:8123:: with SMTP id 32mr11009090qvc.26.1633101145767; 
 Fri, 01 Oct 2021 08:12:25 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id l19sm3111643qkk.12.2021.10.01.08.12.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Oct 2021 08:12:25 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, jani.nikula@linux.intel.com,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 08/14] drm/msm/dpu_kms: Re-order dpu includes
Date: Fri,  1 Oct 2021 11:11:37 -0400
Message-Id: <20211001151145.55916-9-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211001151145.55916-1-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Make includes alphabetical in dpu_kms.c

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-9-sean@poorly.run #v2

Changes in v2:
-None
Changes in v3:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ae48f41821cf..fb0d9f781c66 100644
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

