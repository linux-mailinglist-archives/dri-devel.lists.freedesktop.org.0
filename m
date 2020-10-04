Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D405282CF9
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E3089E98;
	Sun,  4 Oct 2020 19:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C4789E98;
 Sun,  4 Oct 2020 19:21:11 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id y14so4326247pgf.12;
 Sun, 04 Oct 2020 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8roT9Qf/uCSVbwPyL+ZLgqLFUJWhIOLg7jX7brDWZVQ=;
 b=CN9uiFFrUASl4sYS287RnyYXZuyZ7Y2vAbTiPWN9SywBTKJ5RtW0OtFwOOi5Vgb2pF
 iK945jnrW5qYaz5lzdVXFta3bUO48vTw4wlgNcR/2NdjRQ6aZTa5jpDMHs/waJFIKKNn
 pqNK2Tqw8HNmFX3R+v6Fwu1mVWf5nVuz47tFalkfHjGrlpQoABy7873rtEL8S8HLj/Y6
 VJF9OLHcSnEKuzRdbBRyGvlMjtEFbfU1GZpcgz/NCaK1DHjdd4uiL/41OO9NaTq+jk4I
 DCyDvzFenQNg22JXc/fLQ6/IAcjxD4NMDHDFSfTRLkJ+02xqpIgUBWpDEsMzi1ODgRa0
 M2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8roT9Qf/uCSVbwPyL+ZLgqLFUJWhIOLg7jX7brDWZVQ=;
 b=U6yohfym+EwuqRFM4wsLhLQEfXHh6gpF1Tqd+A1pqQQ3SFz5RxTyoiaeeBvp21pilg
 OXcuEf6Oo3INz3JRxcDzM5ovdiE7rsKX30+HdPA8STOWE4E2bBmlbfPSmI5fOVa6dRWn
 dkpQPzrpK0ohEzZIyuMtEpHb16+3YGSz4zmYP9EcGbZgU75GYpOOxSBiB/gpEidil88G
 a1TkTOQ1vj8wRYvHgFLPriN2FGVzAsZ8FhJVuzHkUOMZ0ajNpA4QscyRJAFJTEiXr+az
 c5MWfxHD/ZO9gwQVeCzMcqVYWrpZxJif/XHg//K6MHNAETTrFgNdjhvDQB0XGTyUSskb
 AY0A==
X-Gm-Message-State: AOAM530LTCC91aluw1v4dKkefQ8ET4zMcgQoX6OKDiLxRBzqUX5TOBsk
 Ki6xkG+IQkopU1cxmStK4wTXOm3h7dkmJtBU
X-Google-Smtp-Source: ABdhPJzpVe6lU/lpwBKDe/+zQOSlcHlVKlEAL02V4leKB6Uq1FQPwew3fDKvnWcUxYT9D+3gGdj+lQ==
X-Received: by 2002:a62:5bc2:0:b029:13e:d13d:a130 with SMTP id
 p185-20020a625bc20000b029013ed13da130mr13182418pfb.24.1601839270175; 
 Sun, 04 Oct 2020 12:21:10 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 x3sm9825340pfo.95.2020.10.04.12.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/14] drm/msm: Drop chatty trace
Date: Sun,  4 Oct 2020 12:21:34 -0700
Message-Id: <20201004192152.3298573-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It is somewhat redundant with the gpu tracepoints, and anyways not too
useful to justify spamming the log when debug traces are enabled.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 55d16489d0f3..31fce3ac0cdc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -535,7 +535,6 @@ static void recover_worker(struct work_struct *work)
 
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
 {
-	DBG("%s", gpu->name);
 	mod_timer(&gpu->hangcheck_timer,
 			round_jiffies_up(jiffies + DRM_MSM_HANGCHECK_JIFFIES));
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
