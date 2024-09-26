Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834F987A7B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 23:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B480710EBF1;
	Thu, 26 Sep 2024 21:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IAyf+Bo7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802B810EBE4;
 Thu, 26 Sep 2024 21:17:10 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5365a9574b6so2431056e87.1; 
 Thu, 26 Sep 2024 14:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727385429; x=1727990229; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P5IaPT/gznJhO20fAht54q7dPGf6JrWBFw1pjTTg0Ss=;
 b=IAyf+Bo7XHqOiLGfFPSABcHA1oakQp/maRGEsPI3DPH3RzCrjD+/yl57AWytHhUoK2
 Ehe9hNWS5TR+uyAX2rgbpCS8gIfYvzzge1C9ThIzJJ6DsC5WfZOhEFFJYK0La2AJN4AZ
 yYQkF6t1UW4rGyFS1NxbtUEsDQTUupgfDzp8oCjexBuQnFgWzAy07ChEC2IdtGxQ3liw
 YktyrIUsQzM+vxhaPO4+cScwrH/1HtZVVL+CUFIMMm6dQWi2wr6oZRg9ZGPGJehBMkHh
 8EC9YmAcxYi9GgDScLfPfmLWVms8LbHoHj5+GCdyhbzP8Qz7SNjawynjAoKgGp5//AZU
 SfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727385429; x=1727990229;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P5IaPT/gznJhO20fAht54q7dPGf6JrWBFw1pjTTg0Ss=;
 b=bq273BC2m0JbIdg0Gma+zXK0vFXgZWCQ86Bb97gsCU0M8Q8wVjMPQdiVww7oY8ylwx
 JniUGSX+kfzntODx2BdmuQcD0rvi4PwUm/zw7qkn12LSVjF4nm1Aa8+T8RbXCimu178h
 1o3aBgWHIP+NG+NIJX1P5iJ0U98w8YqoGLiPYO3Yu5ewPwpoxXvhQo8d1+8LrD3vEndv
 3hP/LgoqpvAT9oTHDOoi3RlvloIYch7ugYfwshoz6Id+C8AoJbV0I1QjS/W7d8p9GVrj
 TKjADumK6UxV/bLEhgGieKJ1/+Z1MEz54LrVqp7PhdWQfASJT/mPeY70/x4ULkzTlHY1
 cYiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpHLAFOAnQXHOaUcXwXgp3Bpunfkdr7DxZ6D4Kc/Oz+Rhpdco3d7KKeY03DV3zOlBDIScZjz8VgVhR@lists.freedesktop.org,
 AJvYcCWmepfwDLz6oDFjV7DDHoQYWameX/eKHkkdm8OaXha5qGlIHhGwvmUGISN4aF1MPtX3JGzQMnGvrRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUL9HhRCNS+kVUXpwMCz0F67EZWcI3yFu0Iei6RERuFU3MScUS
 /oy7IlLVRnyRqmY5GFXg5AQJjhPPjv1rprRdYX7uFkffxZ1D0KKe
X-Google-Smtp-Source: AGHT+IEwNNAB08ANCNV/wGne7cXNeEle3eZUTerFEgNElbRY0pDwuztkgBO/PdeOyRc+y/ceeL3eTA==
X-Received: by 2002:a05:6512:ba4:b0:538:9ef8:882c with SMTP id
 2adb3069b0e04-5389fca4542mr893746e87.57.1727385428334; 
 Thu, 26 Sep 2024 14:17:08 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 14:17:08 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:50 +0200
Subject: [PATCH v6 08/11] drm/msm/a6xx: Add traces for preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-8-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=2841;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=e8NI1sPsjgdaczPyb6uHIaB/U/4w86fcwHEFY+OeNMM=;
 b=L/zsrWgyQ1WUnaU3njAXmCrXvxP69203oSucaP7nGVBVx0l5AGhEKUdnFZCCSDBoqOFudrkrd
 jhgMiTIYQf0AvgqygoRCcg50ZBqlBdswFhB5qkGr62Xg9Dsw7Xl1ne+
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

