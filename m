Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34889F8978
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F71610EE22;
	Fri, 20 Dec 2024 01:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="viTYzHgp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B433310EE32
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:50 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so1344048e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658129; x=1735262929; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g+UxLeMEKZ0drgg5vIKf6D6FbqGDQrxrvZvv2J0cYAE=;
 b=viTYzHgpStXVqI17dPHkeoGVuxt1vhJabrZeo3mNxEz5X1rJ1ZrdFdwfNZWXH/OT/a
 Kk8HsFVqALaDpu52Pq0azF9ILGjPp3WC+Ab/BSa7HJceuKrh2f8d4wwLmlkrrJJYHsJ9
 Jb2NrQkEo3DhWJzM1lpJx46Jpra2oWUEqFuWYNUTQQSdc5vipSyGu+LpdNNArJPY96Cp
 Whpus/iRJi7ha3/NMx7zQfkgKXNlJFDmXfkC1cIsjHVK4vCTs6NG4tt4WMoAj2DF5xe3
 Cyh0RbCh/2J7O5OB29jitbNvhy4OUOVJrtRWoTzwr913DZWcPB3yFAhrZw2u5vESfe0u
 8gvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658129; x=1735262929;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+UxLeMEKZ0drgg5vIKf6D6FbqGDQrxrvZvv2J0cYAE=;
 b=P04LoRyLccEQ6j7VtOVnRn/w8Xl6OI8dC2eDaN4GWa5YoPsXOdyBCowrRaYA4mhiv3
 gATYKUdnY+LrJ4mcWlYS8EpX5oNkEEVJtpnH5RjrXk1VjnqFt2GCXKojTuaevcxPn8P4
 tkgg9pHRC9kwvBe9jKT//tzyRvv90lyt0GbIMz1x45xQVVdBJwUsRbNyCoW/r+nMyqKa
 iN8DDhl2719MF7Ike1exXgqUF+85iWR2KKnBGKX5pTbdiXV9//32aQfs1UfccfrTMOU3
 /THnqCBuL1BnWalCutr9y3z5O/ZtaeMP8GIlAGunRTIhVoW89pcvxsR5s512sA6u03OL
 ELrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXF3IAnpKi9yEwx3UyYGa6+UGbjjBPu2Gla6G1jt5ufhp8IAxrVV3lgzid0FjKZ3NniA2WcsZDWMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHYtDlp5aFw3plVAdts6T5+m58KthPYS2OH/yjjqtT3WFV2uuN
 g7pcAuutujCiu1PUP6CdUNmY8bu8eHo4eEpGvX3HzHEdrpbfR+cOwv/6SQJL15o=
X-Gm-Gg: ASbGncuttpFOl7iqTggXVSnJH/1RNR+/bYCYEGNWK4EFdXFXBfwl7XlgfHvboPflRn1
 EBvuijRXfe+m16fouLIE5aTMMVKbbcEXDgDKCdeXPi5TVerzqAKb119wsln2b0sRebXr3W4LTvm
 6wcEViGhinpOlCyKwGP1nRoFRhnDVYtZ8y6wMtlT6gUe1BgWLCMECXQ7/JLLDYvBOvzPLd+Hz2S
 v5J5yJlHgC+ZFDaIn2wwsG7fDq6mb1SteePjacnuh4h1XJcbujYm7Ru9fwqTR9p
X-Google-Smtp-Source: AGHT+IH5Icut19CrQRKgtDSzCRG8qNy2m4CTSKGxVWKKTUEhiYw6FKBa1WmLIGAIiUsb9ae8mcxHFQ==
X-Received: by 2002:a05:6512:1055:b0:53e:39e6:a1c1 with SMTP id
 2adb3069b0e04-54229560360mr232733e87.43.1734658129064; 
 Thu, 19 Dec 2024 17:28:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:36 +0200
Subject: [PATCH v2 8/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-8-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5058CHEvuHi6y1shjj/7LSsaLqFOGpH0zSafsGTeHak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg/RB+Fi7NOIgUKpxxiaLrBsE7s80wm6VMMl
 UTR4BMn15uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPwAKCRCLPIo+Aiko
 1QbaB/9MRXkpbzcxPF0Rcp5LR396dEkAkPli7KvHNg1toaDhWPRd5C5qR8G8fog0tXC0vQP8SLm
 zqaHgaRd+nheWQRf69qtmv5FXJoNt0oiyjgtNcxeokyocr3GYy07Y3hR592MYN5EJwu6aE9X+5+
 HCHKAZDNf2apKR+GPHPXPoZZ1UVJLScMigOzkAX72Sq5+kUzu2XB3OvlVhrXMQPBb0BTbvEtPCp
 rkHncfnva1A2cFkxmw5imydwNGwSq4yiGLKiiaW+cOf/jdDMnCs9KdR7a/28KDRO1a4ZxiD+oEp
 pAcUn1XMmvDK83Iy5U4XmQGl8eaE4EtvxRff50IJWybEfSH3
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

