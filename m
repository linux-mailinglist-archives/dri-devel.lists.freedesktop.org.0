Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A096DC79
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FFA10E8EE;
	Thu,  5 Sep 2024 14:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j3hTVVzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDECD10E8E8;
 Thu,  5 Sep 2024 14:51:39 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5bf01bdaff0so994786a12.3; 
 Thu, 05 Sep 2024 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547898; x=1726152698; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1GC2fTRVdCYGtXlVRryRfUeAExC13fh4Kz3zelIUUr0=;
 b=j3hTVVzYmMRv2wQQDgJy4ATbCkwOrgDONODxNx8zVUNJlmYrY28MdDcl19VJUfABmk
 6cf3AafNDMqW+1W0MTsRjXQ+dZuRYAHMkuQ2u64xPV6Ot4rM7Q15ugGt9gdPvzPVzhLC
 uFZxXw4hwX/bss+qjL7xqgORvVEtiRR/746+EfbiUmBc89r2T7esdXCkFOKZaYTeiXr4
 HuxQs6Zc6hnsBwddbOasmUgz3RofOLKk5wt7PDfSqfx7MM6YIkr0SOGGuskV/lxs3Jcz
 FKoMjctuCIIxFP6XIo0saLjLSXfyVlmdgCTIHkWoUX1qU5HqHYPLSMYZF51EhGZd42ft
 WKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547898; x=1726152698;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GC2fTRVdCYGtXlVRryRfUeAExC13fh4Kz3zelIUUr0=;
 b=c7mWHbhR5NDtw+wYfcDv4mC5lzPBRv9uXH4NxhNU48aoQsvX6ZnwAYun2zq+7E4Pyy
 5CIkw5D8To+kTpJ5QGYkrjN24s+naUvramGo/YTCXDmqyukxvtk0OY88vsCfqTfAzPne
 vWG3pIznAogLdt8KFV6gCCn1zZK7oALT9pa1fc/A93nBKi7tFY760aeBK5oFeB/8GvsZ
 ry5N+8e7hQV6eyqhF5WdmxgdeFowjO99Uu90DJ0irQUsbHOR/bPK9eosZC5NL4/HXrGR
 WSmyNc6OJlCwS53rEts29hMFMAcT1BGN5eOioKf5/UtJRg/xFC+pukB549xFlOs9Cj3P
 u+sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaSmQUUkTRxOfgPid7fYvHeAFqys/Ne9R6iaUkdUF5AtoiXge0goqL6MR8ryYyM/3rqz6R2HHpJG7I@lists.freedesktop.org,
 AJvYcCX3eFkmtyDAGB4KIJH9rpgWXdJHOMkS6QZCT/PCJ0KaHAdIcg6j61a7ADQjnH0oHOEWtVse5yV1kW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaeukqtDiTFYfxpapYo+fkbsnAFHneXzZ0rJY29jsOKbgDrlW5
 2LJwEib1UWbjkokML8pj2sg1vMnZHWdLQzZUV+duw57/De1BNvzK
X-Google-Smtp-Source: AGHT+IHsZgu8qoe3CcENedpIvYZ3fmjD22EHKh5tU84tY4CjRaVCOh12fJig5JDX0DKY4f2u+bJaHw==
X-Received: by 2002:a05:6402:3595:b0:5c2:50a2:98a2 with SMTP id
 4fb4d7f45d1cf-5c250a38f97mr10296600a12.6.1725547897944; 
 Thu, 05 Sep 2024 07:51:37 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:51:37 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:25 +0200
Subject: [PATCH v3 07/10] drm/msm/A6xx: Add traces for preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-7-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=2568;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=Zsvr1247RtZPn1dRIbMfKgc5nWgYcEQdv2j7TsXQilg=;
 b=d83hA0dLH41UeY5WvcoBmmo6Sy9sQ1Iw5if3rTnE6nPTIPAflaWdtJUw9Yjto+uHnWJpg70iG
 Pd+461fmPvRCTd4+jk1L5qkInthqjG2CHuCjVKKDAj+tXtLW+YKZ4Ro
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

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  7 +++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index ec44f44d925f..ca9d36c107f2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -7,6 +7,7 @@
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 #include "msm_mmu.h"
+#include "msm_gpu_trace.h"
 
 /*
  * Try to transition the preemption state from old to new. Return
@@ -143,6 +144,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
+
 	/*
 	 * Retrigger preemption to avoid a deadlock that might occur when preemption
 	 * is skipped due to it being already in flight when requested.
@@ -264,6 +267,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	ring->skip_inline_wptr = false;
 
+	trace_msm_gpu_preemption_trigger(
+		a6xx_gpu->cur_ring ? a6xx_gpu->cur_ring->id : -1,
+		ring ? ring->id : -1);
+
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
 	gpu_write64(gpu,
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index ac40d857bc45..7f863282db0d 100644
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
2.46.0

