Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8149596659C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 17:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7ED810E5F3;
	Fri, 30 Aug 2024 15:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SgH1xVS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5211210E542;
 Fri, 30 Aug 2024 15:33:24 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a80eab3945eso194333666b.1; 
 Fri, 30 Aug 2024 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725032003; x=1725636803; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7ApHm6HSqmijZR4RQErF/7FvUVBd6HKuz4S//PSSZhg=;
 b=SgH1xVS1ZLTedbJgwIJyOCbvNfPJzRxlKkgkd6x0poi9Tw75QHrlqf4l0prMzolEbx
 MOYm21tUyWw2zvHUcJsu0YsaCWIiuTOQNsO3j6m5Dq9OndnEr4wTnpbjCXfAWWRu/iJL
 4RabGQuF0+SDQ0vu+VxOq+4VgmHhZltzGVGouS4CBj+39hqt51M06aCYevH+D0opAQml
 3cCFIbc96BLyOJgkqIQgBG+52W4t6O7PNIypQvaCZg0NLGf25tbiF9+vlFv+Svet9YgX
 kI+AmPps8Ke+nitsmnZaaN7OoqhqcnyJeh6aEnmeLwELsP3U6bhf29wgSJApAYt9y+vQ
 WXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725032003; x=1725636803;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ApHm6HSqmijZR4RQErF/7FvUVBd6HKuz4S//PSSZhg=;
 b=ClG0f3UFdv7ufb4JoKod/n/Uv3ip1+Jz1qc1XJDaLm7WUXOtmKKU4clFj93rGHHJR3
 dAxou8MT4HFGG3WHMnFQ1xWX6DaTbmrJYIuBYgX/mPaCAt1sccqQiMpCkrEEzE4Psel5
 uVuyuYM7qTa8AEHzkfx7+ptaDE0wZg2hnH+iI1BU/c+s86zORuNVFk2wJcRz4KkLv8hZ
 bc7f7eOP5pjljXAvM2fofFMlwkEQfzRyt6HBOUgf0mxZa8GUQMectvIgA9nsMj4lnNIA
 lJvZ2J9EdGXDm9kO6BK9y+N8n+3QqrsnJDCxoyLKhTcKfzaEFuAAU/7lmyHE56iIe91Q
 h7/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ/qGNjNaEPHopGe5NMhcsDSRWZ0F6d9FYE+DE6/6uyZYovDvvaiDQMCrAVfTuBfsI3/x16+W1Q9E=@lists.freedesktop.org,
 AJvYcCXvtHQQ+WpyA/672bNjd4QPV9Gx7QIka1ZR2EvNJAFhuyehWZNKbEljngU6NokgN9XVp9ZNDepBojWa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZKRhMHI1SxCEHRqY0VEqSTNc46BWjyEETDS4CrkAtMFMyHm68
 lMfriZGE21Na5BZERyYgPrGsZUyB5u+EgA9kLmQKY7ITlGeUlUq8
X-Google-Smtp-Source: AGHT+IGC537GLnbfsxjueR3ZbhMvYvp3vDaRWXgnYb1KzZDWz2DQSdrNTSnq+tJoTdOC+vh/d9AnFQ==
X-Received: by 2002:a17:907:9494:b0:a86:9487:f1d2 with SMTP id
 a640c23a62f3a-a89a379d05emr200856966b.40.1725032002102; 
 Fri, 30 Aug 2024 08:33:22 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it.
 [95.234.170.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:33:21 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:48 +0200
Subject: [PATCH v2 6/9] drm/msm/A6xx: Use posamble to reset counters on
 preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-6-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=5369;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=EiKGi3pOzD93PnaCLs4jgX0bjNxlneKGRkE5Fa5MRdI=;
 b=jVCxqabafrVccFAojOJcW04or5sVe80w97svEb4yu2ucYytz+6eMOlmI/tbwaJmma8dRMtffr
 Pqi4RA1gB+yCVnE9rNHrGwK5qpRnTIsluijNGOnYm1Gifb4YmAvam60
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 +++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
 4 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1a90db5759b8..3528ecbbc1ab 100644
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
 
@@ -403,6 +404,17 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 	/* seems OK to set to 0 to disable it */
 	OUT_RING(ring, 0);
 	OUT_RING(ring, 0);
+
+	if (!sysprof && a6xx_gpu->preempt_postamble_len) {
+		preempt_postamble = SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu);
+
+		OUT_PKT7(ring, CP_SET_AMBLE, 3);
+		OUT_RING(ring, lower_32_bits(preempt_postamble));
+		OUT_RING(ring, upper_32_bits(preempt_postamble));
+		OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
+					a6xx_gpu->preempt_postamble_len) |
+				CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
+	}
 }
 
 static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 652e49f01428..2338e36c8f47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -66,6 +66,7 @@ struct a6xx_gpu {
 	atomic_t preempt_state;
 	spinlock_t eval_lock;
 	struct timer_list preempt_timer;
+	uint64_t preempt_postamble_len;
 
 	unsigned int preempt_level;
 	bool uses_gmem;
@@ -99,6 +100,11 @@ struct a6xx_gpu {
 #define SCRATCH_USER_CTX_IOVA(ring_id, a6xx_gpu) \
 	(a6xx_gpu->scratch_iova + (ring_id * sizeof(uint64_t)))
 
+#define SCRATCH_PREEMPT_POSTAMBLE_OFFSET (100 * sizeof(u64))
+
+#define SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu) \
+	(a6xx_gpu->scratch_iova + SCRATCH_PREEMPT_POSTAMBLE_OFFSET)
+
 /*
  * In order to do lockless preemption we use a simple state machine to progress
  * through the process.
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 4b61b993f75f..f586615db97e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -351,6 +351,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
 	return 0;
 }
 
+static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 *postamble = a6xx_gpu->scratch_ptr + SCRATCH_PREEMPT_POSTAMBLE_OFFSET;
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
@@ -382,10 +404,12 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
 	a6xx_gpu->skip_save_restore = 1;
 
 	a6xx_gpu->scratch_ptr  = msm_gem_kernel_new(gpu->dev,
-			gpu->nr_rings * sizeof(uint64_t), MSM_BO_WC,
+			PAGE_SIZE, MSM_BO_WC,
 			gpu->aspace, &a6xx_gpu->scratch_bo,
 			&a6xx_gpu->scratch_iova);
 
+	preempt_prepare_postamble(a6xx_gpu);
+
 	if (IS_ERR(a6xx_gpu->scratch_ptr))
 		goto fail;
 
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

