Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E7D9F1859
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6931F10F0E9;
	Fri, 13 Dec 2024 22:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pnis8kpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEC010F0E6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:14:40 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso23625951fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128079; x=1734732879; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bVFn/1aPfVa0xohd3oPORN+C+aZ2lVwC2QbDNFvd/gM=;
 b=pnis8kpA+HN7yBctaerEyAe+Y3bZ43Se7u2ilb+Xy5561qY3xnCcMjr7RHe5cZnkBi
 kTl1Ixp1dqOkTWsbWBphuFcF8xtGllnr3QE+1gBykcELdlyQpMkAr2oNIOJ29kizLksE
 Sby1OfY9Cwuyb4OBQzq9xUezEPrylmJjyKhPSmHv+8KW6iGgF9v3n8zpIYBXYCBVxYMx
 5bpGtfpO71dx1jxE8t4vU4HIrCO3IOX5UPQDrjM/hhPKHT5b546JlifDogiwh48gvp4S
 Ni3xsFMfOE7caX3n0oJGt9rM6kNe+CnWT6O9qaxO90Fs/jVN/cRhGtp/xdRoIsrbs7Zv
 q4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128079; x=1734732879;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bVFn/1aPfVa0xohd3oPORN+C+aZ2lVwC2QbDNFvd/gM=;
 b=VGcKzplAflfFpa9hqypmXCKgKnytV/AnFxP2MDOYls6E9kzHywPHnB4LeAAzTYr/yg
 XbqCHrn9VeFGy13Tu67yhrLXIeO6+P/MnIS5H93okgNDWqJvzK8qRKepiQyNh1+UZXHg
 sPe/XZiv+VWQPzMZHlCN7l9kYSlB6O48xPxkr/56mArf//+QMy3OJCA4gVSKRolDhn5b
 j2MDRff8oaTSPrun+QEbOjsTxOvVHsZoZ7BqLmO0jt1C+6vqg+T1KeYyF0b0JentgCLE
 2Dt6S/hHS3bce6/nRrM0n8JAr3a8ll934qQ97MbpjVZQXw5pecxLouvpYTrkj/OvACBl
 zTxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk7NjW+Ws2lFZ26XpcrgiCFOh8JfNIpmrF/wWOLb5hNxyIWNjhH8CsST0V6EODnzXx8I9XKEA+gJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymojONManUb3z7Aimura7XLGIC1YXc1ev88qKPyv1tqETEgvKc
 E05CpppzsDP1JxQm1qBceo2kJH7mXwfHSwGiEjkblSMCKAEScD+fw1kByZKx48A=
X-Gm-Gg: ASbGncusVidRLWc6u56dZfyGtfq8Zr3CWC/Urf7I2U1MvBeirAdMGUYlWilcJPeTltj
 1sPtrGMR7sRP8cp1McteLuT1VQCPuET+Bwv9g0e0S8FKfJOLnlkOg38HtQYPCoa/cokJdq4NAL2
 naT/owAIpkVc5ORGFg3AgDwXbRCw3ifuQdYV6gQKtdB0HbMmzDALteU0JjZqLBF8nHjOM9oms5z
 q/wOunowGFNFlaneH5P+Br/uqC3RXdtRlJAhee57966Sdw4pLhXNjKcCEp9rrQw
X-Google-Smtp-Source: AGHT+IG8lJ+VBbBY5aElheNBUlAYaHKjDoU3TNCRY+zalc99ZsPdgyXW7wc5QMb+m4C+7pM7pxP3jQ==
X-Received: by 2002:a05:651c:2122:b0:300:1de5:59e3 with SMTP id
 38308e7fff4ca-30254521ed0mr15390361fa.2.1734128078843; 
 Fri, 13 Dec 2024 14:14:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:14:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:17 +0200
Subject: [PATCH 01/35] drm/msm/dpu: skip watchdog timer programming through
 TOP on >= SM8450
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-1-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SSoEgRXQqPTu5p08nib3mD4yIJvnsbCBVcW8GugolsA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHDuG2EjdhHOBPkHxC0zhd1zmAgAkeMlsl0y
 HEIxujd9LmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxwwAKCRCLPIo+Aiko
 1ca6B/0QhUWfX4o6FGB6/wC8f9qD66NrrbygcsESqL3hkFzoHj7UTCsyHbRFtOWSfdS0hfyZuX1
 GfTtmJhYsXRWpL4tunRfumHAQzjMHmSh9yMTJhYp5pp6B7HNyrrqsUXNXA3fz72VuLuM/H9EKIK
 0tOWkaHD/GkP98ElSLtlARGjp22KldlJaxUMs8c2BazBAQTqc/1QnBiGCvA+PGcUqCanFBdQcDu
 JVkajnKxrnO6NwA2yNPp7hlx6CqKii6KHVEoZRNNlSp7UMC/Nxv2e0vccjJIMGVG61WeJG0BgTQ
 t1fH8QxxhsTfgBqSakPERtMLor/slUcv+jHYHY0xZv9+O161
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

The SM8450 and later chips have DPU_MDP_PERIPH_0_REMOVED feature bit
set, which means that those platforms have dropped some of the
registers, including the WD TIMER-related ones. Stop providing the
callback to program WD timer on those platforms.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index ad19330de61abd66762671cf253276695b303b32..562a3f4c5238a3ad6c8c1fa4d285b9165ada3cfd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	if (cap & BIT(DPU_MDP_VSYNC_SEL))
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
-	else
+	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;

-- 
2.39.5

