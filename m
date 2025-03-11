Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A028A5CE83
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CEA10E65A;
	Tue, 11 Mar 2025 19:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N96Vbobe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56DB10E65A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43ceeb85ab2so2846345e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719756; x=1742324556; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RcjB+241gLR6s1cCQ4uICqRoaXk8v/y0NqsWEvqWvyI=;
 b=N96VbobeYfBxC7j4FGXkpki8h20cJ3yLjUC89ycDg81C5BXjClH2HhWWrmlvCnnREj
 McOl9uI3AUO3bBy4H8tTLYLboml8miHjsN9zMJlTvApYQhdSa+6C0BlVCm1dvH2DfCws
 tTmQUqe/JYTaI23CHSXwnV9DgBsCnF6lijLxLc7UlYKgyuCo4Ryj40YugGZGs09gGdZP
 En6VmvQea7U9V/rAWrIEQ/Qdf0eg9Ni9K4fxMtRwmsLLK3c851656541UQRQOBtjve1P
 lhbves9rcLiA3pzfGPG+o9MOW7JKP5dFhLrtHbfCIYi6zQfcYo3Gp06dQ6N0HxT7fpWK
 Hvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719756; x=1742324556;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RcjB+241gLR6s1cCQ4uICqRoaXk8v/y0NqsWEvqWvyI=;
 b=asnMUIviYOX6pRdbLodJ05a9z8Qudtre/6t2eHODhGhAjXWE5nNxdTEhXvXBI+4DLl
 0JktkLpwh6/OOwDEGDXJPLxkyuC45467i0zg3jiLmIuWilOqoJZ9QaYoziQbxrdPMIHx
 vKuKhhlXutYUhanAdc38aFEBRaMTYNrQprshWm49Um+RvoBUpq4/EAZIzJmehyhJfAno
 Nwjg7nifK6UWLXV0HcdY4PE5+wNG+1YiUfSG2aMvmnhVzENUpxXJr+FSUcxjYGo3897E
 3FMTTX+WI0ri6Sx/ZnQQW1mXFUFVBkzwAEKc4AjTq9UVqFPDbWXtgJJvy3DBjWASMLJ+
 N/ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8GhQsInBcE0B4fBuq6K3Xv4SsXrGoEecMFgh15kynvxxHOZSvxYp7spmT6er+Mgsl+dhXI0mi+QY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5FJaSVVoo6STvbEyh0Om83mdEeKiA9zyEzP1pfj0gC3f1WvqY
 WrtE0722tqTBJGImHYoiyXmfeAedatzBnMox6ebxkHyDdUxjI8HRos4LJjve78M=
X-Gm-Gg: ASbGncuMCHt1TsZOfH+aa7pnTyWph1K01D4A9zAWoe2v8vhGFlWmuRArSKdlqYhNmey
 XliSXOq3aAlZEbVkrJmLNehNa7j3hDe7vLTF3DtHEEYtFSBq0JfB/AyHwE7yqUKwVgI1ezdE8r7
 WZC/OyJNA4ksWynalWukit48rhnw6f1u7t3sCN7s0UP37AfQ+OhCMNa1qXlQrPdflopGueL6z84
 VTU1oSbjNR+8ezRemwx9cbgNfvxiV+xztXQKzsPlalgAQwHr4PUX8NR/bPwdsYJg6c5TeFRVx7G
 m1ActAIIbgsSxZ5XVGWpLZbwDD7f/TRD2kT2Z6AjZrnDHiyMqn85RODSuHA=
X-Google-Smtp-Source: AGHT+IHUI/GfBvqMOBGLfMGJ5oC3n7CH3DWUPWiGMnSbl7+9ajR5P08W9uLIpwe5ervzERP38Emslg==
X-Received: by 2002:a05:600c:198e:b0:439:94f8:fc74 with SMTP id
 5b1f17b1804b1-43d01b88b9amr24028355e9.0.1741719756112; 
 Tue, 11 Mar 2025 12:02:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:58 +0100
Subject: [PATCH v4 08/19] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-8-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=y6bWRccagbxiPugi9lqg3LxI5q7Luq+aGXW341tS1oo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IirZiMlFxIwx/kR+5CN6LQ3oI+wkm7qHAayp
 hUmAyRP61CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIqwAKCRDBN2bmhouD
 1wb3EACZNeztGLSxAB1Jrehurx9bUz7y7xVphpXYvou6pmU5jzCVchBQAyL8H06dHtkF/USEAME
 PjWBgSX+pMv+XgZPHpS5LMcwTMbqhq+Wqkr2kcDK6NlJmcs73zqBXrth372YEkRA8o5GCdw8FNC
 Y6sJ4dZlEQ9SsrCrSX2zkKZqtWigfDoA7xT/t5YV+1CBKG8Fl4wT/6PMVqIdxZuuedrh16802jU
 uKsFObCjV7DbADi4TGkM3VobbZ4JNyUC+A5h9cTICYDPo2TZF2RRCazQNXtUnDdy+kahUi6mrnY
 vKBDezawNLxOzN1L2D4YaDKxBjNvULH7GF0kdSe9F+Wnqu/r9GIh/q9aa+7hOwe5ZzjtQA9WOjE
 8vgCEuSTwFpbBYOJoda2m+eLXLAXWyI+aCTnQm1LwFmfv6hoif5uOYEstvl8k/0U9itEvlKDtaB
 jhQBIEe7YH+FzNcofg1WXN14yOITrTbdj7Foz6axPodRVHweRunALci7Bn4pTogy5yOXoiiwrf9
 2eKLxrVAGWwACGfqaePe85ONfxCaDB/aYSKZnu9OKHaOQ78OTswV6BagZKrQ8EE2/yoBgCcnwBi
 GLhNs1AQy9dconnR8Q+137TWMtS49s/SqCp9cPq8azzW002V6nKJS4E91m72uSWWuYevbwpWaeo
 iyggg/4Vc6qXoHg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Resetting entire CTL path should also include resetting active fetch
pipes.

Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 951d5dccab6faf34a519d06683514aea1ee6ef60..2ce59ba50ffa0d14eaa07e993fadf0f218390ef1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -667,6 +667,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	dpu_hw_ctl_clear_all_blendstages(ctx);
 
+	if (ctx->ops.set_active_fetch_pipes)
+		ctx->ops.set_active_fetch_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);

-- 
2.43.0

