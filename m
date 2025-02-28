Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86612A4A51C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 22:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F1510ED46;
	Fri, 28 Feb 2025 21:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ApHLKIQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E372B10ED46;
 Fri, 28 Feb 2025 21:31:31 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2feb96064e4so3077682a91.1; 
 Fri, 28 Feb 2025 13:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740778290; x=1741383090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=93u9FMaBovFoKZ6qB26R5Bei+BiF4xVMXoIYM5LNkow=;
 b=ApHLKIQBNPw7KhyqjF0ftd+Gpgp0HcygAEKQiptYGkTNMVvyXOFgfZp61V4K2YdRj+
 7k/Fi5P2sG/Y3YoMozcKqIjbeiF2xQUgGmQF33iDVEwRsymDgq1yVPeRBXp5h9ltCC6j
 FOd0u/iU44frVWkk/T+yz8RK5MpEjVnfG9QQHS+RVErNVKUk85yGWXRL4Dytdfo/UWEo
 Tbwv1Q3wLdV5XkKEpn8vIt0NDQKsjbITx66FHUoiOXSQH1UX39IBHZK7HKs6alzZog4d
 MRPh7p8z8Pje9szfhIYa+HY12KgbMRcxCp1Fych1Ocg2BL2hFmW1ch7zLoiLDPeeBjMi
 MghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740778290; x=1741383090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=93u9FMaBovFoKZ6qB26R5Bei+BiF4xVMXoIYM5LNkow=;
 b=CQVAQS5MKplMUi4bIBAZdtwXVjbJEOXk/76wYQ6bEWsuq0uiEHCy2r2WXofdSo9xlX
 WFmfYrfEhyw8R88ueXPis7mohxTvAVtnKPDbN+zFuj+4JcYuJeNzY6pS6sLwzBAaSMfN
 18ZV8lm22Ptya0OU8UfccaPgWhkQTgiLal5acPNg4EsaIYaYWw+emQVQ2AFNRKzacnAj
 D9P3e/2VggPzyn3wPHf93n92p7Jqk3TNQSJYeLgbS4p6mL2c5DN4bO9D8P7bTAkRR1J8
 MdNkCz+JnuUTbRn9YynRRaUcVKLlLgiKMTKjiLn/X9WbRBuafhFf06O+6J+AYv7Pd4Ww
 /4pQ==
X-Gm-Message-State: AOJu0YwsRZqrNWTZ+r9OBICBW8I+dcmXQbEGlJ//IgaX+YAZlo4n2D3l
 /wPb7QaWkYRAznLWopntM106dDdhiW6ntAiG20rjnYUcTrOLdvbL2Vk40A==
X-Gm-Gg: ASbGncu+hFGH/hyG7HZYXLd8e6bWZEfwqkFic6YP+8mBV/ZgELMGBIFsAe3upeg+3yj
 OWtSAOZZrPLMDtX3yG7BpGGV2b9ALiCRRRHcBXMkvS6ZHplQ4TVV3jOvA3P3dm3Rn8J8P1lP9vN
 xzsPgzwwFtoHLd5L9hxuEd2ZaOHFlruNENVdoPXaq1W5rqYAAuWdAaLYtAsn5Ofzx/UybCKu5IX
 e4HzDJIuz2lQo5V4pPnv71NxTQt8Uxo8GMm4poOqkmyvLAdPTknu6D3ghajxwlKiKxTMiWSTjev
 ktXnoqGUXQp0rBdNce+D1pv5l0jm26AdzmbsAZgtT4EdX2UcSfelIRei0X+njeg6Qje9AQsFxg2
 d
X-Google-Smtp-Source: AGHT+IFIrARPSHoqgSXOC06UG9mDf7Pz3KJcb8i4kd5NHyX2D35P54N5Ad/Fqa37E2Gj9VBa53GQrw==
X-Received: by 2002:a17:90a:e703:b0:2fa:1851:a023 with SMTP id
 98e67ed59e1d1-2febac06670mr7684454a91.35.1740778289973; 
 Fri, 28 Feb 2025 13:31:29 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2235050f3c6sm37776505ad.210.2025.02.28.13.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 13:31:29 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Fix a6xx indexed-regs in devcoreduump
Date: Fri, 28 Feb 2025 13:31:24 -0800
Message-ID: <20250228213124.54213-1-robdclark@gmail.com>
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

Somehow, possibly as a result of rebase gone badly, setting
nr_indexed_regs for pre-a650 a6xx devices lost the setting of
nr_indexed_regs, resulting in values getting snapshot, but omitted
from the devcoredump.

Fixes: e997ae5f45ca ("drm/msm/a6xx: Mostly implement A7xx gpu_state")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a73613551493..b37ff7433072 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1507,6 +1507,8 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 
 	/* Restore the size in the hardware */
 	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, mempool_size);
+
+	a6xx_state->nr_indexed_regs = count;
 }
 
 static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
-- 
2.48.1

