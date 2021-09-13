Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8580409B7C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 19:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFE76ECED;
	Mon, 13 Sep 2021 17:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1FF6ECEB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:31 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id w17so8857418qta.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x1esUjNDDpPwTIgE//tv/AYRTHQITQZPLKG3TQ/M4Aw=;
 b=HSkzBKaW16XHN25FVhfE4ylfh7Ho8sKCp7NrHnYeZ9jqVbeqyvv5nhvkjL7XnJKf4/
 BaklNXOp8gHXE+dIxpH1EqfKnYbBykjq53Yy+f9sYHgj5MhRKM3vU+TNRzbWCCrlgjRL
 d6Btg46MYbzPzLbcJsGef7oPKYbzbT8e8DOQ5S6WvYFiPu11tikgrc5rpfIXNQze8xAS
 EF5ybQt4EiD/YWqON6MYIWklZfZEaCODI3MttyJMNpzbQRoqnK4w7g5RcGHiZtTbrP1P
 bFHxJyDV5PUtAZJoKr8Nn73rhfQAKxB5ggKQWeIGZ3g1VCe/ow++3JDp6sm+AthJmZrI
 oqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x1esUjNDDpPwTIgE//tv/AYRTHQITQZPLKG3TQ/M4Aw=;
 b=Gt2Xb3KPpNsTsUN0XfCFy+bcqa1cNcKfykTShhAh+Lvrsb7HgNIxBY5q1fABAl+k9w
 NsEGNDPP+/zsA5DoFyA1NQgb2CVhdKznOnKlemM+QYbgbQtMF8SaU/MMK4R+0L7Nv5cs
 Jq+7G/s5BBQ40J7+3BOBLR5f2SKel+XVhuZM38GsNq5PAHGqXadmw411zUH/8Ws8KyDa
 Mt5Dq1VCueiGc5FS87ZbAsKS+1/2ynl1HE8NZeEtYSHbDlE6HSOi/04fZJX1xBg7buMI
 34HZXibTiscMjS5ThDxOfEzDD5Ldzs6keAixfipNmREwtPhasppToHtRt5UYvPJaTCSl
 k6DQ==
X-Gm-Message-State: AOAM532u+2tiNiN5cGr7xGPtKzFBuZ4gpKi0Suz2PsG/xpF3QnqXkEPq
 irzMog+oRPHoGn31NsA/ea8CDJfzFlkf8g==
X-Google-Smtp-Source: ABdhPJwprGZQb5yj3SWlC8k2jMSq4z8CKpwRKlPSj4/nEKy9bCRmbnJ3kYbKUVAN837wrtFHdahvyQ==
X-Received: by 2002:a05:622a:199f:: with SMTP id
 u31mr763515qtc.141.1631555910663; 
 Mon, 13 Sep 2021 10:58:30 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id v145sm5853873qkb.132.2021.09.13.10.58.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:30 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 08/14] drm/msm/dpu_kms: Re-order dpu includes
Date: Mon, 13 Sep 2021 13:57:39 -0400
Message-Id: <20210913175747.47456-9-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
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

Signed-off-by: Sean Paul <seanpaul@chromium.org>
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

