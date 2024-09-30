Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112298A60F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9D010E518;
	Mon, 30 Sep 2024 13:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nMCkDMPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DEB10E50A;
 Mon, 30 Sep 2024 13:52:57 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2fad100dd9eso10046491fa.3; 
 Mon, 30 Sep 2024 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727704376; x=1728309176; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C2upupBY1EQ+m1GezaBBUues2GRZBbvaKqjKTx4uDDU=;
 b=nMCkDMPYDqIber3CWySTKLuhmK+lJA/hN5HMrrBvTrsfVZ5fQVivSQ7ZNUJbAXqqs+
 E5cmE/W5YxpoJ3+Q9fyv18Sp0zQ4+kaFEALgSIHW4N9QijzF8R/UnRyZmmqVSJ1tdCmo
 03N+el84br3Dby2GddwI8xyVsRdfUTQsz99XcdryJ68R+FTRwB08OBu6brIbV/U/2Z7a
 yVmkqQwk3jqppzX/kqZhHFm+Y7vkHXCirXJhR2YoSACDlaYi4CeC95RDruw0e13k1eXS
 lEDjtmF8TjeHRvro/gz61Y0T0X6JeisE4SIos8xdodX9lOV+B+aSAFxlkluqzUFI10Br
 aqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727704376; x=1728309176;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2upupBY1EQ+m1GezaBBUues2GRZBbvaKqjKTx4uDDU=;
 b=WDoh+S1Y9lnKJ3blR06dOYipMiA6m3wSRzQDrpfNjDIi5kwKlZV99AKqIvCRwfZJc2
 w3VQin+DYBM3L0Q5algH9wM5Dev59MS1aiDyuv9aG3It6yVi/8OrUpL+lrRZrV1MB5ot
 WUn6oP4HvMA4f/bLrZH66nBd+eI6fvF0eZCfHN681tl7CQJtpVyebwlTZtuvif26RweG
 NZae7Ixswizayc/2x8WuDuyjegl/x4aoc1PIxUOyN9xg3azXDNH9tKVvJIzQi/65EBnX
 k4r26lx6B58ux2E1wrlouNfSA+ATwE0hzEhxPa1vjRPsLfBgqhP5Ch27t43olPDSwKvi
 E3lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8xjciVtF9DdFZHa2CNxhsSf67airpyVnP+bhk3dbxwfp+pacEffBfsV3qHWPrVwue8Jzj/5VUGAM=@lists.freedesktop.org,
 AJvYcCWDbiQsWkvZmbSmEDNN841edSSLPw0PBaG8WpYSxDfw+EySFZch3e7L53dOVhfTxm7ld+6khQPjf9m3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD9cuddzBwYm4f5ewzWmu4SMBDeYuhrC6l2o3SGpCR4NeVEpoN
 AxsAUljrpNeoBb91TFO09cXHRnB2hqg3086d8EWsYcXlgXhe0NAn
X-Google-Smtp-Source: AGHT+IFGoAUxFpUzjzZ69ApaiQy3fDLllDO8bezutMwJp4UWdL4qWG657xHrIpCGLq+qaUajJjeclg==
X-Received: by 2002:a05:651c:515:b0:2f7:7ef7:7434 with SMTP id
 38308e7fff4ca-2f9d4199f7bmr61081891fa.37.1727704375606; 
 Mon, 30 Sep 2024 06:52:55 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it.
 [95.250.55.22]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:52:55 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:44 +0200
Subject: [PATCH v7 09/12] drm/msm/a6xx: Add traces for preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-9-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=2885;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ENWLkuWoPXJbSCb+Fdj53Lnk+HYvqRlKgvKGcqOgUfQ=;
 b=YFNzopmbpd1O+q/xF6aa6raF65mgy1NGwKXUjMhy8/KisJM+QfjmUhzMAkzGb/7V9XI9eNERp
 w3P5xXPjk4xAD0Qn+J2dhezifH6qeNukKOXWU5SEDUze8v8qpjpH2Mg
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Add trace points corresponding to preemption being triggered and being
completed for latency measurement purposes.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ffdbf0e8ef0209 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -7,6 +7,7 @@
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 #include "msm_mmu.h"
+#include "msm_gpu_trace.h"
 
 /*
  * Try to transition the preemption state from old to new. Return
@@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
+
 	/*
 	 * Retrigger preemption to avoid a deadlock that might occur when preemption
 	 * is skipped due to it being already in flight when requested.
@@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	ring->restore_wptr = false;
 
+	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
+		ring ? ring->id : -1);
+
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 	gpu_write64(gpu,
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index ac40d857bc4578377b03b4cedd138c87144997e4..7f863282db0d7812c8fd53b3f1fc0cd5635028ba 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -177,6 +177,34 @@ TRACE_EVENT(msm_gpu_resume,
 		TP_printk("%u", __entry->dummy)
 );
 
+TRACE_EVENT(msm_gpu_preemption_trigger,
+		TP_PROTO(int ring_id_from, int ring_id_to),
+		TP_ARGS(ring_id_from, ring_id_to),
+		TP_STRUCT__entry(
+			__field(int, ring_id_from)
+			__field(int, ring_id_to)
+			),
+		TP_fast_assign(
+			__entry->ring_id_from = ring_id_from;
+			__entry->ring_id_to = ring_id_to;
+			),
+		TP_printk("preempting %u -> %u",
+			  __entry->ring_id_from,
+			  __entry->ring_id_to)
+);
+
+TRACE_EVENT(msm_gpu_preemption_irq,
+		TP_PROTO(u32 ring_id),
+		TP_ARGS(ring_id),
+		TP_STRUCT__entry(
+			__field(u32, ring_id)
+			),
+		TP_fast_assign(
+			__entry->ring_id = ring_id;
+			),
+		TP_printk("preempted to %u", __entry->ring_id)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH

-- 
2.46.1

