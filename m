Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2EE96DC77
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F9610E8E8;
	Thu,  5 Sep 2024 14:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TnRFTh03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2253910E8E6;
 Thu,  5 Sep 2024 14:51:38 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5c3c34e3c39so1251868a12.2; 
 Thu, 05 Sep 2024 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547896; x=1726152696; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rK5yBMEf90OUINDLf+RR7pYf+kiL8PQvR5Q2LbyjkQs=;
 b=TnRFTh03nciR0tFGmCjCFbr7Y2z2QPUmGSCEfUyf3C7H+26hYuuujg6fyGpVH139LR
 ZsStUEH+xMzq3HA9LQRbZZT7ijSM9DddDsH1x+Tn6XWe6VWrB4zya1kXmSqsPduhYK/L
 kH1aC5T4lA+i/DIS55WvxSXLHA9b9t76i53Tla4Fror4NKUvFgtP+i2Rss3dnL1w10Fa
 f+9JTD9szZh/1/6OOS3xpmHaN/Ce35IHi+vbzfgcHdLffFUPDd56Mg6LOaE5AwHMBeGW
 VJ4jCrbG9brgAdW0bwjDLVWrr1x2OQ+PueIpb909ly38zsywCEC9I3zi6mf3NAXo1F4u
 2ZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547896; x=1726152696;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rK5yBMEf90OUINDLf+RR7pYf+kiL8PQvR5Q2LbyjkQs=;
 b=a4kckpL97odi+/n6NdDrbTe3DnROgMG2P+ITudPbQGWxb2V6mLAZJU90IU4HksBF2x
 m0VAt4jadFiSILOAFGQ1mFKzxR29CvPXhPrUSOiiRNsKBp9gckl+7hTEk/5rdLQCnEBD
 +zDxpM9rH34iuOPgyL9unJTPggUaoDxgXGsr46XHBto7q3MsSzX5GdsmMVNuQTaw+u29
 j7OrhJs5aVvZRhuh+MmjOrxzGgZA2t8i6frLcOVWO2S7laX9weUNYIM2iCkk7uEHtlKa
 0F/9mEJKJz5yZOUzw+lhg1Ku1wUiGw7eKkzAldpBb+W4U44w1aUWSqDjIMl36h4h+8Ux
 Keqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe7HYHA/grXGP/olBCnE9b6yx4f+FN/MleFmlNcaywwcVljqjw98wILZry6hePVC9o2lrnWQ+rL0f3@lists.freedesktop.org,
 AJvYcCVQSoW7QY11cqV1jy4cS5hcGH58xL9rwoset/I2RMDmpeMx30GT7/aVMR1EOIjIM09DVOGoY/bqwHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmSyRRxGGjNIwSNdQCgaoRIguiz78h1/29WevCPsvw4fchigvd
 5VRJowbyJYjWW3Ca13h17K+zINp1dSz8hb+CSK++DES9IPqZLVAe
X-Google-Smtp-Source: AGHT+IGG7m3iphMCYBLjg1kpWjifWUCOQ4PeH0nb4nsX7mDac3Dg9OfexwXPRgyu5GmjMvm/+qt6vA==
X-Received: by 2002:a05:6402:50c9:b0:5c3:c51b:9bdd with SMTP id
 4fb4d7f45d1cf-5c3c51b9ddemr3304156a12.18.1725547896294; 
 Thu, 05 Sep 2024 07:51:36 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:51:35 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:24 +0200
Subject: [PATCH v3 06/10] drm/msm/A6xx: Use posamble to reset counters on
 preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-6-fd947699f7bc@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=5328;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=a/XTT96P/eYWRZ+CcJVy75ymhUdqG+xB6TCQZjQXHOs=;
 b=RQklsGpRSyO/4orKlM6bUbyl0cn+LEDDh6qvZghEOaoWUXTaFkxARLH0z8KRz6wgN0WP7wC5X
 WI22+w9arIDB0a+A8xvSyqspxrtc7R3zrf3DaX25AesaHYBytdlZGRP
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

Use the postamble to reset perf counters when switching between rings,
except when sysprof is enabled, analogously to how they are reset
between submissions when switching pagetables.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 20 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  5 +++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 32 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
 4 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ed0b138a2d66..710ec3ce2923 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
 {
-	u64 preempt_offset_priv_secure;
+	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	u64 preempt_offset_priv_secure, preempt_postamble;
 
 	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
 
@@ -398,6 +399,23 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 	/* seems OK to set to 0 to disable it */
 	OUT_RING(ring, 0);
 	OUT_RING(ring, 0);
+
+	/* if not profiling set postamble to clear perfcounters, else clear it */
+	if (!sysprof && a6xx_gpu->preempt_postamble_len) {
+		preempt_postamble = a6xx_gpu->preempt_postamble_iova;
+
+		OUT_PKT7(ring, CP_SET_AMBLE, 3);
+		OUT_RING(ring, lower_32_bits(preempt_postamble));
+		OUT_RING(ring, upper_32_bits(preempt_postamble));
+		OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
+					a6xx_gpu->preempt_postamble_len) |
+				CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
+	} else {
+		OUT_PKT7(ring, CP_SET_AMBLE, 3);
+		OUT_RING(ring, 0);
+		OUT_RING(ring, 0);
+		OUT_RING(ring, CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
+	}
 }
 
 static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index da10060e38dc..b009732c08c5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -71,6 +71,11 @@ struct a6xx_gpu {
 	bool uses_gmem;
 	bool skip_save_restore;
 
+	struct drm_gem_object *preempt_postamble_bo;
+	void *preempt_postamble_ptr;
+	uint64_t preempt_postamble_iova;
+	uint64_t preempt_postamble_len;
+
 	struct a6xx_gmu gmu;
 
 	struct drm_gem_object *shadow_bo;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 1caff76aca6e..ec44f44d925f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -346,6 +346,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
 	return 0;
 }
 
+static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
+	u32 count = 0;
+
+	postamble[count++] = PKT7(CP_REG_RMW, 3);
+	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
+	postamble[count++] = 0;
+	postamble[count++] = 1;
+
+	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
+	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
+	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
+				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
+	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
+	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
+	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
+	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
+
+	a6xx_gpu->preempt_postamble_len = count;
+}
+
 void a6xx_preempt_fini(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -376,6 +398,16 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
 	a6xx_gpu->uses_gmem = 1;
 	a6xx_gpu->skip_save_restore = 1;
 
+	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
+			PAGE_SIZE, MSM_BO_WC | MSM_BO_MAP_PRIV,
+			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
+			&a6xx_gpu->preempt_postamble_iova);
+
+	preempt_prepare_postamble(a6xx_gpu);
+
+	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
+		goto fail;
+
 	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
 
 	return;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6b1888280a83..87098567483b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
 	OUT_RING(ring, PKT4(regindx, cnt));
 }
 
+#define PKT7(opcode, cnt) \
+	(CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
+		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
+
 static inline void
 OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
 {
 	adreno_wait_ring(ring, cnt + 1);
-	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
-		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
+	OUT_RING(ring, PKT7(opcode, cnt));
 }
 
 struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);

-- 
2.46.0

