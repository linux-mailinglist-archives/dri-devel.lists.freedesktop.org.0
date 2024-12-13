Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4969F1862
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD5410E355;
	Fri, 13 Dec 2024 22:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yuH+Mfv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF0410E355
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:14:52 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso18581381fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128091; x=1734732891; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EVXTFZ9qs5ua0a0DbBLW3XISYeiOdL8J1dr4xXWqZyw=;
 b=yuH+Mfv1AH20LjX4eFhXcp2DN4oHsXIhmRHtMTfbc91KdU+TuGzhYXxfcUo22eGtAr
 +hA2TibXCdolNtXcrNZQl3po67EWZAkiRzbt/4/Wwb8tF/m9cSo+UCor/Vo4EGuhfhYK
 BtgSs/W0g/oawg51cVDsmNf2v1spoEOPAdJ3p2kebQGXdbs4RZ9ylJOVDsgvLgF51+Q+
 fpB2wWe2l9mBuy9IPltw/hhiZisP/8qp9nW2r2vfe8me0//AVJivJeg9CmELwRIuWi8j
 QhBWgMNjHSn0XsTHuL0NYjG8sfse1F80ug9oLTJ3HIGETlpS3vkTVaJHak9IsteOJtac
 LSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128091; x=1734732891;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EVXTFZ9qs5ua0a0DbBLW3XISYeiOdL8J1dr4xXWqZyw=;
 b=pBbvPBwkAG0/s+bqkVkVZ5shgRC/zU8gXQ7Pv8q3sa5nkyPcuYQFD2QqVMkelVVmc2
 92KpizBaAE0IGxX+pCiH1XrWyc9T6ytEPhsafQ3vhtuIYf8LR/0ai+C6bpXYlbwGkqF7
 pHD98XdtHvwSoXk280M9mD4QSdovv4kdimr01EpXKlXhJAvxv9p4gfeEe+mMrKmrYrPp
 T+3cMsbQLml8G/QH1/+yZsbw+868bxWnWCFN0vi95/iNu+baPr4jrjtGiuowF+0wiwnG
 D1IdWBXWmoJiAqghRRxRT6ZRnQ3ilTZ1TiIK8ILaX/zHbM27MR5wd7TWKaiP5V3VFMyK
 qMgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5HCuTA9TfFTyDhkf426aY4//0e+P4dYE93+dTAS6QysCT33T3A1t89672XudFIpXemhimR+A3bho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt3xOPuNr3yX1jvQJ2vBGu1j1JV1nfUNYtQNHCraDQzMct+hzA
 emXjrqXai8NfToQR7G47AHG0MZnNd0nSD0itSseTa1Z5qMjA/R1L5GVs3QNwggw=
X-Gm-Gg: ASbGncuui850rzc6iTMiYqHXHseBa6rhuiD8nEdtvD1mMmMvL7anEmxFy13FoLrZj7r
 brf9g+ipuBWZbGV7wklThqw42kt+oJKIvaZRdROeLADU2ukvw4Yc+1P9+2EMKTB9+XTocXZjkkX
 qKwedUvhAcKfGdkF1muBF2Ix6NbUku6SSUyVisWC7jHZxZATQJgmkPLta8gO1HlOXs+NTp4JACG
 HO0Rkt2x4s1XLe/mjS7x58zkxhacFgcHUfB90Wtk7TXkdA/Ux2QeCNgkUOqQv/w
X-Google-Smtp-Source: AGHT+IFFousbh5sDETxWnJYsRUG+aFldqnVxIw01zT1Khil6+rtwivaKhd/OLBdvT7ptEDYIDTiw7A==
X-Received: by 2002:a05:6512:401b:b0:540:1f7d:8bc0 with SMTP id
 2adb3069b0e04-54099b6d6afmr1331527e87.49.1734128090680; 
 Fri, 13 Dec 2024 14:14:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:14:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:22 +0200
Subject: [PATCH 06/35] drm/msm/dpu: inline _setup_dsc_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-6-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=A8qcENijj/tiP/qF0PkucDRV4zm48lgOYJZUS8nuXXo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHEzG0hSBjyvopp5YyPtQtFDbzgciLOW3/Te
 M9p0FbDsuaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1SphB/47Bb/7YcZo08PzuhzFzDbS0O6TeNRzeKUFGUhrUSA8z2vehm+BrpEdeeYCGeNvuMl6FEk
 HksShACL7VmLM6lkw7RcWWf+aqeJAGlz0LIpO/imjPLv5sL9DwlqLcV60zzOfmS+Aq5RAJD+1I7
 Zsqsl4r7igtIiBOic10VXBD4wbH1lf8g8Y4R0JMol+uCe8Z/9jknJkTpRPjvGLpFNBm5k6nqRNR
 mkAK2nfnOJWSgt4udXPkAbjOmwc66PYFMywJslqfMVFmD+z+nBUX5iMZsySSInI0DaoKpIgFEew
 O8yjYzzior4JfzH1HEGX1G1jxTIOqkBCspwORKDE/fzfCABt
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

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 657200401f57635481a22f018ff00076dfd2ba34..0db375d2d779e075d20d08de059124bee81652ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -180,16 +180,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -212,7 +202,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5

