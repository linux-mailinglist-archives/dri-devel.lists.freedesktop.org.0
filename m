Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64906A618C1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 18:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4199610E367;
	Fri, 14 Mar 2025 17:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yzw9idCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE23910E35D;
 Fri, 14 Mar 2025 17:58:28 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-22355618fd9so49243065ad.3; 
 Fri, 14 Mar 2025 10:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741975108; x=1742579908; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c/nB+EprANSiiLTLvezU1vuAXuyjHhh7tXywCPXdMdU=;
 b=Yzw9idCqboTtNvK6KFgBT5T/+DmSLx5MO1ejcOj9PWUIqVCM4DniK15Rvi7NyifvKn
 3b3wu3Sw1oMUb/syCnCS2sE/7UAED/3FUG4cwgI6uMeSPXmHVzXK4NpssUtuW8qmgD3Q
 aTmTOxaKa8etOFxVCJLZKDI1i1aDtmnYjYwnC0OiqBYppScFgL58/yZKYS5AeDiEW/oU
 FB59vCb/czbhMtvGEQbtN0N+as40FkhW1p1VosysaUHCiqAeTrrz9wCU1m1mzf9wE1Jx
 SbEiafNg+ZSu6SBCCYY+Sh/3Zqt225lymsczpXd2iwl/BEcYN+Ubg68PvlLjPwpgH2zZ
 KykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741975108; x=1742579908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c/nB+EprANSiiLTLvezU1vuAXuyjHhh7tXywCPXdMdU=;
 b=lkhZU0ZClHBma13wpB0vWBZsQeoEJlEWLA8dXhR/oRm8LuvyjusEt+UKb6i9J7So8w
 b+tuMX2WFLaaPhGp6S6/S18uFYmwcNNxubJVT+osgyTyQ0GbkvuXWgjeEgZ1dJN1cLZw
 NpWrE5Cxu5PfyOf+Q/wnYTGeIFNgQ6TvUrol5yP1Vj5lw61zweA90W8NBEGwx3EacGXS
 KzM28nnAm7pi24gp/3IkkseN93aD8DMZ2pJfGMPQ9KDIO0E+3/GaeZJ5Qs3QOHi1YlIn
 F0V68zOJFauZ2PEdlI02lUsKtv/eSUYNAhTuf5R18qHNkJZmxiSOOb0OGu4K1TN3q9NL
 r7hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4JkPhqmolg7CjhLwRmkWldZfzcqCZzq9KCJCMuT+RYoKsb8D+1OYLK9Uo4So3CVRYJvzRkNtPhvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZmWuap2dDAdQT9w/6z7fLCkcIY7ej3lTpkL2msWZcfpt9E+FG
 jkyM/n+YQokm3WnvD/UWp788BNGKzXEuVjlznAR6YWilMS7XqNtyTrv1nA==
X-Gm-Gg: ASbGncuSi0bFj57WcrjyDF0GM9du/xJCYpF7XDY/e7ubZmh6jNvuQt9NyhTvm9IEg7D
 7g49kgmERp5lqvmuWK0JmGE4MJi8CeMP4aStQQNVBuNeiVIwJAbbwrw0B+nk9o0ijd/yXa0Uut1
 ToamX/TrI9xJgu09LKtwdOtSSZ2NJ60SOL0fDEAR1DfUtay4b8wdtV4yteovk6ZhdXLh96wevBh
 A178ssQErAy+UnSjQj9FXcfJd4fzBZoMFhMhxhNisCpaojgWFdw1AbFDsUjDY11qFSGwEwJH9Yv
 WHA9iY2PWmSw2zBWML7Iqn/YVoeN8ZqBGBb5q5K7UrLgCb0cxfPis/+LTxJOoRczXl2kd6ucfty
 p6DiL8SSrHR5hljuPIfo=
X-Google-Smtp-Source: AGHT+IFboGzFCFtY2YrWd36M9O/xP69dJrRf4kY9d1YlDpQIOB21fIIEL0GCNbPYS4EL7EjpGpHCPw==
X-Received: by 2002:a05:6a00:21d3:b0:736:6ecd:8e32 with SMTP id
 d2e1a72fcca58-73722470508mr4728372b3a.21.1741975107715; 
 Fri, 14 Mar 2025 10:58:27 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7371152938csm3243466b3a.12.2025.03.14.10.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:58:26 -0700 (PDT)
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
Subject: [PATCH] drm/msm/a6xx+: Don't let IB_SIZE overflow
Date: Fri, 14 Mar 2025 10:58:19 -0700
Message-ID: <20250314175820.112340-1-robdclark@gmail.com>
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
index 55a35182858c..16848259af51 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 </domain>
 
+<domain name="CP_INDIRECT_BUFFER" width="32" varset="chip" prefix="chip" variants="A5XX-">
+	<reg64 offset="0" name="IB_BASE"/>
+	<reg32 offset="3" name="3">
+		<bitfield name="IB_SIZE" low="0" high="19"/>
+	</reg32>
+</domain>
+
 </database>
 
-- 
2.48.1

