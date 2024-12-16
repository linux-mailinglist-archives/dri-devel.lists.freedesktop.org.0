Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD659F2BD3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BBE10E52A;
	Mon, 16 Dec 2024 08:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tXOf2m+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E7710E3E0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:44 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-3022c61557cso40456941fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337663; x=1734942463; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w6iaR4XhdKUYvlNFXFyoX/pNn4cHsyDnjyLqjwDAVN4=;
 b=tXOf2m+2bn/833rKjlhgpB5rICXvWP+BF+Ui1UugKyns776FIw0Z4ihB/QIWHSR/HR
 cDuDQ+0xgpnJTPpKSI0wAEwfm5Fx+LVdYxZrtVaJBkGjel2k2uCJlyGtclR9lLmkrjC+
 2kDp8ahlpBXFtwh7EFZ0Vjnig0y28tsa0eIi8B1B7VBsIE1y7DrkEw6A/dBL5M7VT5sN
 /nGOCV8Tu5cmF4FnorFjQXWiggAavREa0r46d6xWRcVim/Dq/wJKUDaUCAiBzTcMmzhx
 HfHTWodLZDLpJqHUxlRpP+GglWTmok2tvBXe6w8FKnFWslKaCmycn0Xgo9ptbwbzus3i
 cxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337663; x=1734942463;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6iaR4XhdKUYvlNFXFyoX/pNn4cHsyDnjyLqjwDAVN4=;
 b=XkGh6JVNUi4YKG2lYAfZFVBtRXo16BS4zdl34hHomnrOAf9HmPojgNG3D3aE+B+Qsf
 Gr1h9IGVUL1BXheBl32HCLVoY44seKJmS6RuCgbnu0VkSKz/PMh6UdV3XgqdiVghrHnR
 Ow9T3d2NMKjO7lHHMJIIfv49dnkbVAGyj2sIHvG4MC5hJNteyFU1TZOiuqwsfZHfGa40
 ESZZk0NrtsnN9SZ50esBDJHZGW9XmS/W8NyXSUmcDjPMTubHVGrcdK5dCyKtBmg0tu/A
 bcwPMhBffokUrz4fAsGdcYYslSUs57GETrUH9ugmeZIxmUuxccape1nnbkUcj9jSQlD3
 V3yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH7/e2l71d2MzCyrG0BLqFqR5N+DyzCvXGdew427Kc/y/SJCA/VlQi4ujSRdRcC41A9ZqZ1UGC0es=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo4OS8NZYh/rbTX6z8BAqyjVhq/LWPlt4Srgf50JGrYF+kGGAA
 qIZgzOzbevKOIt96cQRhzeA32F/231Jxh1s76WcmHRVlyWUU6fFDNp8+Q1C6DpY=
X-Gm-Gg: ASbGncusibQ1LIXtytCN7lJpAsYA84jVqVVwF9CFYDxd5NQ7ZYf7t0KP2hA4Ki3rv6B
 GZ2QTnYrSID/4czUqkbS16ssySxwmvMzQm3IT3h1AlISZnLbSxLJZGzcXiMDqtXcwNyXzRn/3nY
 3U9+3vp1Jcv4ckL9anWI3UgczxIqQJg9LjaeFENjmfhXJrXpSFVjt9PUCzawt/gWC20jhRCiwAP
 J80V6asS27ZpiLZ44Q3KdjPknyaAYjBb39TJEscVgwjhOp/paAYNeUJqfLz1uas
X-Google-Smtp-Source: AGHT+IEy+x7o2Lt7ybsRZe8ZBGCz8wMHfuQe/9Ykj81HF+ZPyzLz0xLLyDsY3vkjOuNJg6AH3N2zDg==
X-Received: by 2002:a2e:a9a8:0:b0:2ff:8e69:77ef with SMTP id
 38308e7fff4ca-302544230e1mr42812991fa.1.1734337663008; 
 Mon, 16 Dec 2024 00:27:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:28 +0200
Subject: [PATCH 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0d6Vl9uKHPMWNXj1THwSQ8KfCjRZZOIXlKFBufG6ric=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RsCE00L5+s73vnKOb6ulTZZZO35mal3hBlU
 0p3uqpReEmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1V5+B/9pAJg0ZCTSwEwVzazpw8iop9xUL9QAUMhs88Vnbw7eF+Ky0nqKgZQOPcnp9duJ2KZd6ui
 Gy5oSC8vg5ghOaf6MZeZO4c56G2GEH7P5mrLyc0NWGhX7oetzAUeTeGbmicgRLBMrzpynqDEGu/
 eDOJlyhNHdK94yeSjnwIEcve+5ZfFJZmaR/XywGLfDAoXizxGb5vLBwyfRnnnnfdk8qau3JNXUB
 HdcxyIvCCQg1HyU94uG0rGw5r/qUo+xYWM4BQzWu3xF1K6g4EKe0QTptys5QOkzJNzJ/MGSUzbR
 9+xDb3ElV4sLX0QpcniZNzoD55SwhZzlv5M4vizm1nlTCp09
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index d61895bb396fb4287e9b41807a3bb0cdb25d4e25..4f110be6b750d30e158d517aaa507c7b4eda0af4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -159,6 +159,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -166,6 +167,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

