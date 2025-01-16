Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F1BA133B7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC67B10E8C3;
	Thu, 16 Jan 2025 07:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zVapURhr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB6210E8C3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:26:30 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-21bc1512a63so10609035ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012390; x=1737617190; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YoErTj5R/6bDpkTGboi+2J+mxLFw/UBtFH5HLA2mCCY=;
 b=zVapURhrbe+xwQao2lLIViu6R8xcEvAp/QOc/Pd5muH1AArmWylbQtLy7P+Up1Cntb
 QRCRGOxkSunEue5fJRFGFKrKZBLEqdT+UpilrDA0anHSX5m0+XwcSfjfI42rqkuEBgZN
 k0uLtyZyAB+q1NPwMUhgn4Mzj6nF+qv9DHuv+q+Q9mms+qqIo3jO72GVEw+dhcivrsbh
 mI5VBr/qdnus+A+EY5px92Gny2XIiLr3qbCYn5FsyDaXlyFrvyIVfqP+V154RkCIpgcj
 9659tejGAxwKHKVYDe/CgD0Yikxayk12VsiKeBxYgkibZXZ7CnHU3d2ggFKkS3L4BG6B
 eOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012390; x=1737617190;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YoErTj5R/6bDpkTGboi+2J+mxLFw/UBtFH5HLA2mCCY=;
 b=ay5O+U4OusudHuV8DUW6XbJt022HdLVCFIDY3DDmxo2/2Yz8pqcnvsv6H712G8di+3
 CD1i+xH9I3q8pfmzbS0bP123RvcWOrhL0t1Y5IaojHqDPONdqNL04ScVWb8mxuXKQPP3
 Wr/fioYAmuD0psHDgWEvgOqIA5xCmEBGF+F6tTgdXmQNjF/2gnwV9LxLKs+3RHw1G1Wv
 5f28+OB8uFxswQN4MqjHeBXiLELLdXaz+8UM4RgrkDuFpqV4qnjLuGLMr5VWuQ3VAv9x
 5ccpaFPugeZJZUxas4C5nsRDsdvA7V1g7RegwvasmmouXfTWjCP3YGnEkI7a7fSoD4pW
 64lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe6z/8xpWu69zAHOtUukpheAe1tsR+QUfjVTK9hQIDFY80AdxBro2UNGe9zKRLSrDWAlqNsQKVRLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu/J73i1zQXqO6gFsXJnODxeLQXVVV5aJIRFtJwOJg9DtnSLft
 u1YBp1xZT93/OXs/70kxDEVgr+3YOKQQoymKTij5QhUO0iDEA5IRU2F3zSgVjkM=
X-Gm-Gg: ASbGncshRudDX7PFiYJKZTeRu6DEABygSMTZrQdEOQFoEiOHTpPRODyFUficaIohp2T
 hWGwsygtjQ4Z34SbeGhjUAZFhD456waHlmY/Unn+nt26IS2sQlFE8drKbG47NY3bC8zx7SYGpx+
 SaFyZgjVkzAmbuMfOjhieIeCk+OOLVHgPEvCYE+B2WFoa+fKmWR5pUMrEyYZRwRzB5lKWaf+I/W
 7MRcQnqC2FUy5N6nctx/sZMmSAIm3Q85Y7Tq1dGHQdvWuAdhqj34Q==
X-Google-Smtp-Source: AGHT+IEEyBRAhj+yuGi93sK/+BkUn+itWY/3PcfWMBSR1VeRwy1zquY8/MSur6Q37Svz6ElMecHztA==
X-Received: by 2002:a05:6a21:8cc4:b0:1e2:5c9:65e0 with SMTP id
 adf61e73a8af0-1e88d2ec106mr53738358637.32.1737012390585; 
 Wed, 15 Jan 2025 23:26:30 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:30 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:53 +0800
Subject: [PATCH v4 04/16] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-4-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1960;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OIStHp3vqvhCacoNrcsrSybMaAkAUq1kz8KBDHS8J0s=;
 b=rwgQXNy+2oms/4wk72QbrJ2tiXoOO9ioI4wGoHth9IcABkkGbeVTKQ5oUk77DozsBcc/Y1JHZ
 hUFpVz+6JBpAZMlXPjS+fKBTgkhFs75VsPOWOmfKzrh0GJMkarXpjsZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Add resource type info on allocation failure to ease debug. Because
more resources are required in new usage cases, such as quad-pipe case.
It is more likely that resource allocation may fail than existing usage
cases.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a67ad58acd99f..24e085437039e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

