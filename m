Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37D2A61983
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 19:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA28210E9DE;
	Fri, 14 Mar 2025 18:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HSNZ8K31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290A610E81A;
 Fri, 14 Mar 2025 18:35:07 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-225b5448519so45889625ad.0; 
 Fri, 14 Mar 2025 11:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741977306; x=1742582106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KOGfE1bp0apHOUPvuww94GVOY0/BGeOxjq/fkDzIXwE=;
 b=HSNZ8K31Lab/oS1EaDSXb8Y6ad7Cpyxu/2FeGw3/ak1vUyXmg0l3bYzy4+UVKy4ZVP
 MaZk1YUwsjNYu14RTWgLhovreSxfraPXrMKZpY6JgLYytClvlZVBgKlCuAONxkNerNjK
 sMkz7qnx17UHSsedSq7yjiyKtzLbNb3RMAnXm79vZ2cEXAf/TJxHGtzs3xM6B4GhUlI4
 nQkkLZonsVuS3EoTFU05o7TchAE76Q3wHs4+Zt8F/4syneyfPhnKMAtcw8cYv054n1DU
 3wqsE0/20q+up6yhx0BAcDshou/Jdskx3iUgschdNk+eAonrOsa7RidsvC1ODbBj6LkS
 QNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741977306; x=1742582106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KOGfE1bp0apHOUPvuww94GVOY0/BGeOxjq/fkDzIXwE=;
 b=BWlzKhO+lGleS89e1WsFXuRi3UpFVUyzgRaxRlJgTrfjDDqyKRtHUNF/Z+izYspKVL
 eaxDX5r9B22rn/w0hyxJDLYEHGe0I47fuBxKPPQg1dxWAk2TV1wOGHpyAaMVFd634s5k
 XDHeRmj3PnbpkaCwbrgSUZb9Aaqo5Y22GThLGy1a8npwb3oILoVuTbvOFm2ncsyvSE9H
 u4ecLfZAU4z7vC+8Pcye2MnVhhpD5C3uZa7Z9lRqHUhDLbzurtCIHPYe4+gVl4LyntEY
 29h9QUqqtu8gZlHUMPVK5g+7VZaDf6FbEvrXEqAwsl37i+tstPBIkXpa3b1vIn+1zY7I
 dMJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKZcspRUHofONKYGVQcUKAXMD6TnPXLpHBfQa3Cb5nZYfEHED4ZMjsUYlhJxayx+eE8OGquzHWvXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyC8+1PFfjuzp/DrpCZfREGNi1w9SO3/Q5071RNJJWM9b2IPtF
 v0DUF7VVcA5zArj4w3V9DgdObzSPdBKXRxVszFahbC0Uhy3QBqREwDNYmA==
X-Gm-Gg: ASbGncvDQwun9x3vTQjwox8Z+3Zbfrvj3ZpLWKG7Exkv+8hkFEneYAzjcoh/emRF0fI
 Y7RZtwDZZiwZTy2WfZzPD4iqudAORKPK8Zwh5kpMCGIT5gtMYeeQxKFzGuLc4Y7vBM2TIioaEfI
 kWCh9DPcY1BJY/wmRJrjH6dQvP8uLCyGf8uvD6yLLQg5spuXRITYJGbeL/mgSfLobEglz7tLFyM
 4d5EwizkaR7nnHPM/kjmxdPLXRtNrjZPj/Aqu61j2BTyQ/9yMhrUHKHyI9yq6rljUPBJkH75lbn
 EaxN48XX5fzYHROHLkLvT9pC/5s1PNHbZQjt8ciDeJNvz6fFWnMvPmOUL3z652o/nTcGsXCZp6X
 u/ltcNzi09B9k85ZnYYI=
X-Google-Smtp-Source: AGHT+IGyHLOiEcz0CUx+B5T1oc0d5NEOsRtR01l/PJbeEXJcQ7LU9JwYgvAyRbB0tUWON/7rymzn8Q==
X-Received: by 2002:a05:6a21:6d97:b0:1f3:37c4:5005 with SMTP id
 adf61e73a8af0-1f5c12d7458mr5644246637.33.1741977306172; 
 Fri, 14 Mar 2025 11:35:06 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea9489esm3071103a12.65.2025.03.14.11.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 11:35:05 -0700 (PDT)
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
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/a6xx+: Don't let IB_SIZE overflow
Date: Fri, 14 Mar 2025 11:34:54 -0700
Message-ID: <20250314183455.120824-1-robdclark@gmail.com>
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
index d3978cfa3f20..ea52b7d0b212 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -245,10 +245,10 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
-			OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
+			OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
-			OUT_RING(ring, submit->cmd[i].size);
+			OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(submit->cmd[i].size));
 			ibs++;
 			break;
 		}
@@ -382,10 +382,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
-			OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
+			OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
-			OUT_RING(ring, submit->cmd[i].size);
+			OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(submit->cmd[i].size));
 			ibs++;
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index 55a35182858c..a71bc6f16cbf 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 </domain>
 
+<domain name="CP_INDIRECT_BUFFER" width="32" varset="chip" prefix="chip" variants="A5XX-">
+	<reg64 offset="0" name="IB_BASE" type="address"/>
+	<reg32 offset="3" name="3">
+		<bitfield name="IB_SIZE" low="0" high="19"/>
+	</reg32>
+</domain>
+
 </database>
 
-- 
2.48.1

