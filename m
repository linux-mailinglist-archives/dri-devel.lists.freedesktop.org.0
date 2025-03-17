Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E7EA654B3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 16:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60A810E423;
	Mon, 17 Mar 2025 15:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NeCb0e8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37A910E423;
 Mon, 17 Mar 2025 15:00:10 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2ff615a114bso2769468a91.0; 
 Mon, 17 Mar 2025 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742223610; x=1742828410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lKg3+CntGpo2nGd/HO2S30tnDbQnjifg17kcFSnARp4=;
 b=NeCb0e8zSNOCxd8YmJkW0CpYcyx4lMm28r0dT12xCROBPNVpR7s3I4XOuOh9hksBxL
 RvAwISp4oiC9UOg/wlmbto4q0jmFs7uabRiKTonyjPc7g7a3R0a7XJpaPmLuwC9oXx5D
 /gWQLa1sLvflgtq17MrBZJVH2FpjjQGh69NQC4ZuW0zMgMCqdOsI6f6rBulvqk/PCPXB
 4cLE3UggWJ8FUP7HtsbQniOtF+UX5IvwblSUMdYmC4BmXRrVK+BwPVvlZd23SgKa1cN6
 k8pElTg+zwDJfZrKy04aMdGgvecsICawSXgWO/xjdJI3ujPiCN8ZW708IfR/dsLOLUIa
 7OZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742223610; x=1742828410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lKg3+CntGpo2nGd/HO2S30tnDbQnjifg17kcFSnARp4=;
 b=NeAiWq0rWEE+uxZhDHUB2GQKGmTTdFnq05m0oT2qwrX4vtSvXxNgbF58Szsp+FZukc
 xgARVk+80wQ8XLrJpdXkqwmXQJdANYfoB8wOrIm5ZBoh3/9LaZPBUHE2G47sY26+pfot
 zjklYag7sMqhVPXU+Xw83z4iuh1jJeF1o3Z5wmjcG8V2IwIm2U6+CIgttAPz+sQf9sgb
 f0Y6fYdmBuNp3wbRiK1pzxJMFXas5uB72DwgnwyjiVdYOPOEIwOYuLfUIlTwPAEzPu4l
 MITq9oYkHAfBcqLB+kY7s/oQAdlU+VijA3uKjpCJsmrJtoB/qWRvVxs1xHYHXuPIDTe4
 EY4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaQG5Bm5Uh5FMTRCJzGtZDG8w3NhcwOj/VoA2uEhIOA+nPB6RuBW10SkJa2zC3Nj44d7rmJTJnQYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlkGkDeTyKHTItSsS8jhsDUj/uh2NEShERjEmFP7/xYdFrGvmF
 Q1gp1XzFCBpU1ng7L4RIP0f3QK/DjgJgiTLuHMCQc3wSwbTnMIF8cfkuTA==
X-Gm-Gg: ASbGncuS5A8SOAxeOaMpOGUb92ylu7Ji/AQC4xLodepnrexAIHUDermSzlfE1R5vKUL
 EPqQwi0opNjHuSHDgU22Hp46o4no/WbXHdSfpIvGOB4/VaOyUZKkXNz9W8sItljKA3fr6tr/rQG
 EBeIdowYC2XGmG4TY98zBUnaHBbwa3AoAntFThjUzjcyIoNwdzPcZyUI+Wubtvv+4WwfrbYsc7j
 f7BD6FRIXMUZLQENCjWlCYkeXqNYPI6UlxLpiawUaU36NfOi7FUB27XJrZpuR1wTL5IRsob74M5
 g2utI3i+1VoTpArRefgZuQlDJcOsTRmqfI9UEdDZw+mDuIDvLMjut/aqCow7E4voDLfyh6oNw8t
 MPIipTDiJZpBs/RGePLA=
X-Google-Smtp-Source: AGHT+IHpqQOthZ629rK5OBwdGCNb3YwECxZM9wivvDLCurM5eSyLS9L2K41fuMd5nLAFoGdSrLTErQ==
X-Received: by 2002:a05:6a20:12c8:b0:1f3:2968:5ac5 with SMTP id
 adf61e73a8af0-1f5b095d100mr25087612637.20.1742223609746; 
 Mon, 17 Mar 2025 08:00:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm7297043a12.8.2025.03.17.08.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 08:00:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx+: Don't let IB_SIZE overflow
Date: Mon, 17 Mar 2025 08:00:06 -0700
Message-ID: <20250317150006.34084-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Rob Clark <robdclark@chromium.org>

IB_SIZE is only b0..b19.  Starting with a6xx gen3, additional fields
were added above the IB_SIZE.  Accidentially setting them can cause
badness.  Fix this by properly defining the CP_INDIRECT_BUFFER packet
and using the generated builder macro to ensure unintended bits are not
set.

v2: add missing type attribute for IB_BASE
v3: fix offset attribute in xml

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: a83366ef19ea ("drm/msm/a6xx: add A640/A650 to gpulist")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Backport notes, prior to commit ae22a94997b8 ("drm/msm: import A2xx-A4xx
XML display registers database"), just open code, ie:

   OUT_RING(ring, submit->cmd[i].size & 0xfffff);

Prior to commit af66706accdf ("drm/msm/a6xx: Add skeleton A7xx
support"), a7xx_submit() did not exist so that hunk can be dropped.

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c               | 8 ++++----
 drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 91173bfb7e58..eeb8b5e582d5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -244,10 +244,10 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
-			OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
+			OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
-			OUT_RING(ring, submit->cmd[i].size);
+			OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_2_IB_SIZE(submit->cmd[i].size));
 			ibs++;
 			break;
 		}
@@ -381,10 +381,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
-			OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
+			OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
-			OUT_RING(ring, submit->cmd[i].size);
+			OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_2_IB_SIZE(submit->cmd[i].size));
 			ibs++;
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index 55a35182858c..5a6ae9fc3194 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 </domain>
 
+<domain name="CP_INDIRECT_BUFFER" width="32" varset="chip" prefix="chip" variants="A5XX-">
+	<reg64 offset="0" name="IB_BASE" type="address"/>
+	<reg32 offset="2" name="2">
+		<bitfield name="IB_SIZE" low="0" high="19"/>
+	</reg32>
+</domain>
+
 </database>
 
-- 
2.48.1

