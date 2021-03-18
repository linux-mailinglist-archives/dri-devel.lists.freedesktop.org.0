Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE53403FC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 11:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449266E8DC;
	Thu, 18 Mar 2021 10:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407BB6E8DB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 10:55:05 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m12so3840906lfq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1PjxkJWRqZH9Itgha41YGjrgemxzg/sWl+7Uk4MUXE=;
 b=t0DFqimi3isfDhx/V5eIsDPMDk/202h7dNwHp8feagKuHmr81mfBNAZD3Ua9uYCqTk
 Rk07oobZbjl/frYTn+tWu3IAdfDK5A/7Z3yKOwSnW1ZLN+I2SMcZLvhb7YipCks2ADlT
 Bl/C33QVwRjiNLg0lCrKOpMNcqwwNrX5bbAngr/cFp6XA/fZ3XwpDhLnSWvHs02kf7ey
 D7x+jauGD5VgD3qUZN4SzjHmcjKWGhggPPuVrGu7vlGQAcsCcaP3JBcV73G4Y7RKYHaA
 oN9Y5Er7K1TT7kxj3D+CP+SfEb+1heNnTFA9YGEy7J0CIbUWBe/p2MqCovuaUqO8qlxn
 bCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1PjxkJWRqZH9Itgha41YGjrgemxzg/sWl+7Uk4MUXE=;
 b=MKEU7xNYKKSXWVUGQmlubMKUJBg0niEXb1be9lUMSzz5g/JRFXt5btlzx0XCliqXul
 1sIepHDyCdeA9wi1P9OApVMPTNEEeJSRYziePN7lOg36LVw1Kv5MFMYl12+qPUlCF4YX
 vXmgPl0ph+RI06+rz+S5KhuD0Uej4EU/+bMbE7/Xge/NS8a7qjiM0q51fpfnJBQyIG7V
 UjEMBt24mrU8hM0C0WIsRug4Tx7stYg6siVCV3r/HkPbOkG8bWT8g8TWcpHoGYJTL5Fp
 tIL+WFeXVDOCJi+uBcUT5ilXDBp7Ttl5hXO94tXAxMhEROHW5V22TENVMMa97ol1a0Pd
 z9hA==
X-Gm-Message-State: AOAM5309sEp6ksBNJuM/czZ2dxMO7P4o0Tqu29dTAsrL8hlWdCi0qrbU
 y0XvqvL9wcylLRrjBPUeCSHxlw==
X-Google-Smtp-Source: ABdhPJy5DFNkpcJO3HWxt+NbsIqKlrwbQRcnKhDAF24WkxblOuK7JpO9m+TJryIBSuRJ/X5VMOuTOg==
X-Received: by 2002:a19:5213:: with SMTP id m19mr4960818lfb.203.1616064903653; 
 Thu, 18 Mar 2021 03:55:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i18sm182110lfl.22.2021.03.18.03.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 03:55:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH] drm/msm/dpu: enable DPU_SSPP_QOS_8LVL for SM8250
Date: Thu, 18 Mar 2021 13:54:35 +0300
Message-Id: <20210318105435.2011222-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SM8250 platform has a 8-Levels VIG QoS setting. This setting was missed
due to bad interaction with b8dab65b5ac3 ("drm/msm/dpu: Move
DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks"), which was applied in
parallel.

Fixes: d21fc5dfc3df ("drm/msm/dpu1: add support for qseed3lite used on sm8250")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index bffe5969ed7e..f21f630af476 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -22,7 +22,7 @@
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
