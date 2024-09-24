Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B4398449F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E7F10E882;
	Tue, 24 Sep 2024 11:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aFGcfsPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D2A10E6D9;
 Tue, 24 Sep 2024 11:30:54 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso444770966b.0; 
 Tue, 24 Sep 2024 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727177453; x=1727782253; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P5IaPT/gznJhO20fAht54q7dPGf6JrWBFw1pjTTg0Ss=;
 b=aFGcfsPgQjDo2ICoZrkCdsqpLsBzYZR2T6jGDDSm82oCscSLeFfcgJkYg0JaXbwzhS
 B9DBcppyBeEgqUbcZudeGKAiV9F6nvdalwhYYeIxOVUEGhojXhBX+d+LMbvCY9ELJTrR
 0D1FcT8T3tBXfUyjx92tQ3PUALL9jbCmjmpjNt6jFZ6DwYb44U8H1qBjTccHc82KR2ZQ
 GykQCQozcT63sxJ5QsnCINC+gTH1wCqJrz04Mv+6r377kXWDcjptnZ23UHsy99jaRJRl
 dGfHOA7KCd5O0IIxS/UDZbgYjPeP/qRhQjvEhVKES2BIbedwsitRuzF8xRDKvUWuzyXu
 pBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727177453; x=1727782253;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P5IaPT/gznJhO20fAht54q7dPGf6JrWBFw1pjTTg0Ss=;
 b=r3iaybrvYdqJL+XKw5X9/T0uvOfRaj4cW17SoUdM2+qFfkA/1Q1qdckS53229g69uz
 fT9G4Tabuc0DF9Iizs1AWBOHKaciq/QUrVFFqJSPosntn0vCk1bYavRzNhQdZyjFkQ6b
 +mbFQrmLB1eNW8HCtxEsVNwYH+r3G4D1Y+RGPajgeALxLYdrKlETDD6oUx8Qmu7vvoyt
 g11jgBLHuM3q88fRr0ukPvGZ+RSn5kQ2ez/4XDq22LFBj5abf6bgXS4dNn/qMRM7dCKO
 C5meICDQWdw83i1PVydkh4iLHQgvQ0QWsd/Pjz+JrAiatikSDUDNP6eihCK+huUggUXb
 z8Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDMgQunIsCC/LNsNOi9Zey5Xt5ctxmbhacqZEjbIPmI3NskYoBSRnciML2C9lpXknF0fmznCfhq2Sw@lists.freedesktop.org,
 AJvYcCWKXmFVnEUsNbpl5+iawjBHiqipQj2zzJfxPbpLulGBoK+/DATqNeojGC9p70qSmXhhYsNlX7kE6uU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbl+1v3MptTcE1LIXlJl/5xI0fH5Pgv675N5R9Rd7kgBKmHiai
 I8T08sz3NwqQsU9ciu10XDfNKVsYY849HPpOdxs/J+xzaK/SHkGZ
X-Google-Smtp-Source: AGHT+IHQBo0k9Sv2Yl2rMpaMsnAE86hTAwNupBRmv0/SY5Bzs2msqLq0LfSee62mPHG/7tB3TKfgsA==
X-Received: by 2002:a17:907:c894:b0:a8a:822e:44c6 with SMTP id
 a640c23a62f3a-a90d55e1025mr1581092166b.4.1727177453088; 
 Tue, 24 Sep 2024 04:30:53 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it.
 [87.7.171.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:30:52 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:43 +0200
Subject: [PATCH v5 08/11] drm/msm/A6xx: Add traces for preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-8-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=2841;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=e8NI1sPsjgdaczPyb6uHIaB/U/4w86fcwHEFY+OeNMM=;
 b=QCyhBwbISNJCKhTR8VJ4GsTt/NhlYeXaAt2E+ICoHh44vuNC41Voq60skiPjufx2xQy0ome7o
 a5eWFPDFlZQD5YqC7aKnUPs/2Twq+AEEFg0k2bPzl4ZE10XW2tIzVjs
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
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index cf75f612edc15374f3d8238e3dc0297532569607..ae471a572a7100d8a3b86a7eaa0dcbea7a728fb1 100644
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
@@ -295,6 +298,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
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

