Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECDBB0B5E1
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B2210E376;
	Sun, 20 Jul 2025 12:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QniFaGDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C6B10E372
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K7vA2T002640
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JZJfA7Qabzy/jPdKR6dbafyKFe2qpCis68oXDiINUR8=; b=QniFaGDNP/do/+Bx
 IXKGDiPOma1/MEmHD4p1xVElDLJUA5NoxBC2yFy1FzH0FlQGiQUlWV5KRvh0LXgw
 yQ0QfofNGHf6rRgqq9nqk4Hcxw/66t//HVwLI2ukfsr5/G+AMNBPRCcSnzTbcg3H
 c+9U2QDg4ANoBJp7xzKwBw1ppNNmteGx2Hx52hUs0y2A5R3jdb+BAF4kwUqkNIHU
 YhW6Ko9mAS2Dy5564+QwwAPn+AipiWS+b2U8jilotcKvd3HOcOHnZC0ifYxy0wR0
 gPwVU5yTs+Kn4erpxtnoXM0blhd3DRQVoXM9O3Myo8P7MgheaBuhNYYqXYyQ+IbQ
 2xcL2w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459j5te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-75494e5417bso3299041b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013839; x=1753618639;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZJfA7Qabzy/jPdKR6dbafyKFe2qpCis68oXDiINUR8=;
 b=X+8ItZ6GGfhVidKQYXCTKBtSnqN116novF18g0mUIjc09yl6dMpa6x1OIit/48Or14
 QcEIOiQIokK0QeXyDFkJW8i4kHO4JadUl/+2HtysiKfRq9qmAFDhdr9l0kZ3BWgGvNOS
 RWUAoSUwNqQc1yg/yU3AGtSXtRYkvLz02cxxBRTD2mzIdzI49FXqeQRtWjXCp7F+RaQE
 g2JIHdEQfIdWE07ZlePeU/BcwFE7hFazOx4FLtAyYvRqS+DbhZ9tvYBrttve8R+23tjZ
 Zc/sgVZgXkaDv7ywZ9OG9iQhUxI7Uw3imXfeM0MQQ9+qUW8X3Ib6KLtsS7avoURZ/E9K
 gqpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4RpaiGARZwGUcZUBpJ1RhZMJFO4ZMitBz85ViTUnhQkZ5Q2rd52OtpZtbH4W3pFcwA4dOxn8whfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9i/GXEnARuvlMM92YWALm0/p2TnLd2UwFDU5cCq6rjxb8pK3H
 1jNp6Pjvfpefx7lLBiw0jzfYYrKRLbRwCL9x6caebIvtAoOrGNPRXPb4/5TRyk+0inhGvngKV7+
 P0tueJwdgF+Z+AMcJCitzYhPviN+nBUtqbKutkyPTSgiqq2+YNJOAGnDhQfK+IultYcvLYkI=
X-Gm-Gg: ASbGncuwA91kIzAcq8ObfqOR/PfR4pzrTOvcik5KfObmD/Q/9Tc9AA02KI9UUB3xe6o
 KasOccWfGj+AR05fRN38p7k5W3bZtYp2zkNYyd+Qb1R/HaDCVIi1W3kPluhthIThOSEoWi6vuXu
 dvoi1C0CHUe5hiswP7OpLlvibJPS1O0IRoA0Bza8qHBoRTJk5djLOWlRhE5jrJTmUqGL88rO1E1
 H6mwyAGa5ic8qp0PZtbvr3UDjbM2HSCNJ2bJIC5MV0xXFNP+GQOMjJLwsSuYqm9Jc0w/JYI0jLS
 yset5l7mig6V00nHGEk/ZCYu7dXhDap1oCxBNzQv/1zjcK8LLTNHtmFxchPSwZY2
X-Received: by 2002:a05:6a00:420a:b0:748:e289:6bc with SMTP id
 d2e1a72fcca58-75836fac119mr17123867b3a.1.1753013838806; 
 Sun, 20 Jul 2025 05:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENusTlFJiMacijONMXXzlEhWQ1XUh20Qf6EGIIO9giZDiOveTZLnhER6oVE7SDZtpmrfWuOw==
X-Received: by 2002:a05:6a00:420a:b0:748:e289:6bc with SMTP id
 d2e1a72fcca58-75836fac119mr17123843b3a.1.1753013838259; 
 Sun, 20 Jul 2025 05:17:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:08 +0530
Subject: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-7-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=6397;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/vk/IY1MxYK7Q8PcqzCSsbH+EycuMXiRl4FMmAVgRoQ=;
 b=Mu9aI8+DlG6130/5EfeEicUbbv/YtgJy+WV1EGcF5mRD6lC331N7JjIliGVOQC20WGkOs6Kb6
 xJB0tuu1I+qB1J0HqAMZTwOqHLkPaGBrjvEfDyAjcD1MaFVKjQJd2+K
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: ca4c11lm1UyAWDkabMScBO8vXISlEO6y
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687cde4f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=YYoBuv6U7x1zitwOiNcA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ca4c11lm1UyAWDkabMScBO8vXISlEO6y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX5Xkn5Q/voxil
 IFFNLoF1Q6387STOKL4zQouoBBv7IDa/9ywUv9vIwIR6Wi7C33t1H3iwLhhOnsjNF3aJ+U5WyLe
 U2BFEtBBMqksPzDnY8+AimMi4npOc4qseYLbNhNig7lC+nfG9Xm46eczxuE7R/K3EKW5Q1Md3Kd
 8939aMKjc0jsfCteSHhLJhJWbk0ue4nz4nNuW8eIcWgae9welS0CCkKqZScYvRXrg7Gwr3Bv9wU
 cSHaXl8Ld1GOJYLHC7Nf3C1ajvLHKn/K5/dlxHSFL3BWXgkNg3HlNiwhM3kss2YemSg1dn7lNlr
 IGQMHegRmFJ2Dp+HY+y7DtqsL6wJMOFVCfZbl/DoZY++tQwNCcp/SpzUTW0l0IbYk4NMCdhYlJT
 WK2sPZgv6B0r0ClxafEezYPoFwyj3rxs5x+Xa/fCbHIpsFxONoFcSt5WDMO4ESGQJlB6/Jm5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200117
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

There are some special registers which are accessible even when GX power
domain is collapsed during an IFPC sleep. Accessing these registers
wakes up GPU from power collapse and allow programming these registers
without additional handshake with GMU. This patch adds support for this
special register write sequence.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
 3 files changed, 73 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -16,6 +16,67 @@
 
 #define GPU_PAS_ID 13
 
+static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
+{
+	/* Success if !writedropped0/1 */
+	if (!(status & mask))
+		return true;
+
+	udelay(10);
+
+	/* Try to update fenced register again */
+	gpu_write(gpu, offset, value);
+	return false;
+}
+
+static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value, u32 mask)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 status;
+
+	gpu_write(gpu, offset, value);
+
+	/* Nothing else to be done in the case of no-GMU */
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return 0;
+
+	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
+			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
+		return 0;
+
+	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
+			offset);
+
+	/* Try again for another 1ms before failing */
+	gpu_write(gpu, offset, value);
+	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
+			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
+		return 0;
+
+	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
+			offset);
+
+	return -ETIMEDOUT;
+}
+
+int a6xx_fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u64 value, u32 mask, bool is_64b)
+{
+	int ret;
+
+	ret = fenced_write(a6xx_gpu, offset, lower_32_bits(value), mask);
+	if (ret)
+		return ret;
+
+	if (!is_64b)
+		return 0;
+
+	ret = fenced_write(a6xx_gpu, offset + 1, upper_32_bits(value), mask);
+
+	return ret;
+}
+
 static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -86,7 +147,7 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	/* Update HW if this is the current ring and we are not in preempt*/
 	if (!a6xx_in_preempt(a6xx_gpu)) {
 		if (a6xx_gpu->cur_ring == ring)
-			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+			a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
 		else
 			ring->restore_wptr = true;
 	} else {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 9201a53dd341bf432923ffb44947e015208a3d02..2be036a3faca58b4b559c30881e4b31d5929592a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -291,5 +291,6 @@ int a6xx_gpu_state_put(struct msm_gpu_state *state);
 
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
+int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 mask, bool is_64b);
 
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 3b17fd2dba89115a8e48ba9469e52e4305b0cdbb..5b0fd510ff58d989ab285f1a2497f6f522a6b187 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -41,7 +41,7 @@ static inline void set_preempt_state(struct a6xx_gpu *gpu,
 }
 
 /* Write the most recent wptr for the given ring into the hardware */
-static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+static inline void update_wptr(struct a6xx_gpu *a6xx_gpu, struct msm_ringbuffer *ring)
 {
 	unsigned long flags;
 	uint32_t wptr;
@@ -51,7 +51,7 @@ static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (ring->restore_wptr) {
 		wptr = get_wptr(ring);
 
-		gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+		a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
 
 		ring->restore_wptr = false;
 	}
@@ -172,7 +172,7 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
 
-	update_wptr(gpu, a6xx_gpu->cur_ring);
+	update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
@@ -268,7 +268,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	if (!ring || (a6xx_gpu->cur_ring == ring)) {
 		set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
-		update_wptr(gpu, a6xx_gpu->cur_ring);
+		update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
 		set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 		spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
 		return;
@@ -302,13 +302,13 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
-	gpu_write64(gpu,
-		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
-		a6xx_gpu->preempt_smmu_iova[ring->id]);
+	a6xx_fenced_write(a6xx_gpu,
+		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
+		BIT(1), true);
 
-	gpu_write64(gpu,
+	a6xx_fenced_write(a6xx_gpu,
 		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
-		a6xx_gpu->preempt_iova[ring->id]);
+		a6xx_gpu->preempt_iova[ring->id], BIT(1), true);
 
 	a6xx_gpu->next_ring = ring;
 
@@ -328,7 +328,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
 
 	/* Trigger the preemption */
-	gpu_write(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl);
+	a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl, BIT(1), false);
 }
 
 static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,

-- 
2.50.1

