Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70597AF66
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 13:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918FB10E46D;
	Tue, 17 Sep 2024 11:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AlD/gmyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F1910E3F0;
 Tue, 17 Sep 2024 11:14:30 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f75428b9f8so53287231fa.3; 
 Tue, 17 Sep 2024 04:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726571669; x=1727176469; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VvKesWW0P1em7NCkwV+X61LcizJYLoAIblBeFBNllk4=;
 b=AlD/gmyQebyYmo32Rf/lspZ7t66NkZf3n/0dXjUi8tJqN/5GJH8ri0kA7rn+5Czenp
 4hEHHiYbz10VKkZUe7hnPKEmriKLL1CDjWvUZQlysdco1ZkmiB2+fhP/Rl1+j/5VqSRd
 /4zsxthC5kfDKnpuSreC/R9GaAQSq5tHBTpqrcFB/OO4tT+Apo1u2TObCl/ZLTJ6XlFZ
 UXITHPLhV7hpBnIRtZEaDPphGJGrJkkAshKgJXeD3MDpa1T64J8qeLl3kf+n0dybxrle
 0tySSu9eBOKmOFmq8Gz/219TgCHQcvMsapSvIiMwXN9visjCHr0aG5v8DtbeVm4HskDm
 1gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726571669; x=1727176469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VvKesWW0P1em7NCkwV+X61LcizJYLoAIblBeFBNllk4=;
 b=J8h8V8X/dEoyBSAD+zDvZ8epeueeoH3UYCpOjESorLnQcwX8MYxXaOQqje155SvUmb
 cpL194/SqnE3Bl6mRhxswZfpwEpI9c+Q+0NDFFWY+w/2sreyOxZ//yGLkNRQTFykQPRD
 Q+PXJ5n2vRChmVB541syhlp5efJ6M62O7irKDwS8+AFfAgeO1ojSik/whKdihOKIjzyi
 6Z5Wtm5DWl/lhG0eJJYhjHaRIx3CSdzIjtQqM4nr14yzDGciqtm5tH1Bu2YJUiEVoeJ3
 qKxrVdCaU6Y/OBu1NHnKryL0iq9we4TNoEgR/M0tGoY0970mOKb4iVhuFOFGKIfx11rd
 3bng==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8VDkHIN5JkaQXMjRf8hmKvdHe+8gTSJbIxjqIZTlMIUH2tXlHQm+q5Myz2aj1ge8UzXd7MQnLRlbS@lists.freedesktop.org,
 AJvYcCWkJpoakyneVQ6qfbKHFMtDiD6uGJU3J7Yh2/SY3ge2rA0WgSPlgyvRfuqfqKtbi8ijWd3fkg830mA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl455irxdcUbn6R4cI6qnMBW00zZWn5jjTDfapN2eyrBhhW3k9
 kBuwWea7aKt8QcVrbrRMWytr8WGUFBoMiDpQmYg7ElDet/Lg2hmE
X-Google-Smtp-Source: AGHT+IFVz8V30gt+6XPI3+b37Uj2JukhYBxVQOQOulgj09e9U4MrJkGUCUbhq/3xNdBr0UJHl8Y3wA==
X-Received: by 2002:a2e:bc06:0:b0:2f7:7be8:fd89 with SMTP id
 38308e7fff4ca-2f7918e52damr102360211fa.6.1726571668472; 
 Tue, 17 Sep 2024 04:14:28 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it.
 [82.51.105.30]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 04:14:28 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:18 +0200
Subject: [PATCH v4 08/11] drm/msm/A6xx: Add traces for preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-8-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=2531;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=3DJAiPBLtnl8Urn+PIlflgyFDumnsqjD151UuFWc3mE=;
 b=fr59RWAnGDAY8SCsakLcWBh8Q+uMphqbK89CTU9utXhQNu1lI+FNoirfGlK4YlGU2bCC8Uz0g
 lN9GOOQ0gKKD9ATnHAGDZS/OyMak9dj6QjICMQJcvUUw+dBkuS83E+R
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
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 77c4d5e91854..4fbc66d6860a 100644
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

