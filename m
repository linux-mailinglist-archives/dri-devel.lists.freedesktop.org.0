Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299E9542E5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 09:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3C710E5B6;
	Fri, 16 Aug 2024 07:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lGGa9c1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF3D10E4E8;
 Thu, 15 Aug 2024 18:27:45 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso145060866b.1; 
 Thu, 15 Aug 2024 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723746464; x=1724351264; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Tg0KctwqLqyFAo+4ao7jjZ1lcNMm+hl+ZjYOpPS5yMA=;
 b=lGGa9c1tqarEsy02g83EFjcu76Gy9SS/iHn6lrj9+3bK6eawu4dy/QbPr0q9o4YqVp
 M/GfrqrUDEwtfteo0ItE6+ZU2bS0+hL2fsy1c4pGKhWyMccnDI6P+1ushSil4wA0yBY0
 7WSmqzEijan0piwnEbFfaRf6PZz1FmSQVMSYOBiURmFeic+CVvMVRB1QK/F0eWiClsge
 SunWAMD+0k49Cas7AbcVR7egOlwGcuDXdmeP12W7Iz49bCq58Ew9CCvBd4ekmCCGV45l
 5N3nvn93HJ85JYP5Gvkm9vV884vN5np8T8Dxg5Z1zuosUpipVOah9BLvf9caCIZSVnWD
 Xoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723746464; x=1724351264;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tg0KctwqLqyFAo+4ao7jjZ1lcNMm+hl+ZjYOpPS5yMA=;
 b=X9HNhOLg2K3tN8Wn3NZKLbN+Nza+pxMzbxItkGGZsRxEG2ov+2n68EjZGQLOviMs//
 EluHtrw+ktez5JRA5yyoZAVDC5LLsGkHtmlYumzYSEWUo5dASTKcc7NH3RS4EO6dVEtM
 dsa+9TqX4AJ+oeWCx0K1U0VnDVwEO+LZef1ue3qvtAf5VqtFhG8tOgXR04hNOpbjloVf
 6zi1PYeV6ryZ+Gf2mTnPy76UtWfiojC/Z9sfhLa2lUZjIS35HFrYRvJMdqvqocjdSBZN
 iCtl5tVVlK9FcE8s2MltYbws7RtgLeOebtw2w9iLTlRpe0QiGJcRgq4pssPSxe53fvs1
 RNgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjSd5Zij/vZ0+dG0WQNgw9b/3zQgDdu40JgVkwOfQjuq+uAo1v86LEuz53FCPNyyK0FqXj9t3o2D+eAsUn8eGSCH5s7plT66gtexZWssCOqyGatnnoOsAKhjtznJ07u0yEtFcteV/NL+wLiK/hWlia
X-Gm-Message-State: AOJu0YxkX9WnmwZcIKZFsXqR4dmth4EAW5dFobzDkz2StyuOD4zU2x9d
 UBb8LWsfpz7+BLIz7vRGz0/jCzK1IGWtnaub3YhocuBNXuUw8x0v
X-Google-Smtp-Source: AGHT+IFx/oFpTN7DjKnoRNWugjy0ykwyE+NteAI/sn+WwtRauwUVB8/OZuWOH38vkF2aAbfsnprrYw==
X-Received: by 2002:a17:907:7fa5:b0:a80:aefa:14d3 with SMTP id
 a640c23a62f3a-a8392a4128amr36267966b.63.1723746463495; 
 Thu, 15 Aug 2024 11:27:43 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it.
 [79.35.172.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 11:27:43 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:15 +0200
Subject: [PATCH 5/7] drm/msm/A6xx: Add traces for preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-5-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=2516;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=DLafHpP62zkOHtSD80kKPRoUh5A+Qyukl3VsQmH39Qc=;
 b=icdUKlpDMF2mVoh3JZqkgkjybL+RiUKZ0urWvjJ6sWmpBaEiMn7wHC4EkTZSN3u+1onK3gsCs
 +k8jqD6zTGCB/NV3x/BaC3XEyt+3NzIBzDusevWF8bGcHALiM3hTXlS
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Mailman-Approved-At: Fri, 16 Aug 2024 07:39:16 +0000
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
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  7 +++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 0d402a3bcf5a..2606835f3c6d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -7,6 +7,7 @@
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 #include "msm_mmu.h"
+#include "msm_gpu_trace.h"
 
 #define FENCE_STATUS_WRITEDROPPED0_MASK 0x1
 #define FENCE_STATUS_WRITEDROPPED1_MASK 0x2
@@ -146,6 +147,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
+
 	/*
 	 * Retrigger preemption to avoid a deadlock that might occur when preemption
 	 * is skipped due to it being already in flight when requested.
@@ -262,6 +265,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
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

