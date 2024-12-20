Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C29F8975
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E62B10EE31;
	Fri, 20 Dec 2024 01:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vm0BCj/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E633F10EE2B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:41 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so1606148e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658120; x=1735262920; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cNGurZx5APr5o8b1YKpzmXoTLfFEipQsrmLsb92m7mw=;
 b=vm0BCj/uaMGIOSCCOOgILpLso/uf8dzk8T/RDq27veWb/auJeIfkAZ9ip5CiXp6Mcy
 DgTjlqQCU7kmwz5K6Le7/kjtIW3LOvNArd8wiuzyo0zdkdm8jFdoKl+0MmEPskmUKepj
 5iC3B8PEJRRHkcLTIcMu5Tp1NNj02laHd60Hu3pj9YMinJQbL1/kS7tZPcPxK/NHwX38
 pEjL/wAd4IRcZvDp99y0624+5BhgjgXVBmWlh2RVHLU7+O1cL0/uC4wLS3V80jbXR3BY
 tkEpKPzY5U7GDI8GSGVfbdpDwPqjiRsqPbsQ5NRVttnvB3oMO9HLO25/MTJcVW6c/WO6
 /+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658120; x=1735262920;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cNGurZx5APr5o8b1YKpzmXoTLfFEipQsrmLsb92m7mw=;
 b=Lh9w7AQXxi5wxXiSs9RA6r0aZV/hPzr6OsTm/eax7IQBWNhCHLDBbxLYDvfak+egYn
 NxJIH8OIR+fSFXT3I7NJlzvqrflLnqCukeZyH17eBIXKRIexVULQ9z08gjExYKD0I6Do
 lkl0YZ/wIAN5jkdOCD6ZftDwzEUzDmAhCRDIEiSJhxbGNus478jhZVY+ZOqIf1A43BKw
 xT2PvHCNLRIhUJ2zza2pID5spt1E62+hQ36T0vSbpXXAuv7Hp/vEVq4Kf4cfMoOACDcu
 Jz3Kl//neMu6Ez4W0PnB+tBqpyf/yPoPu3kWORTbouNcPDQJIrM+QGsOkcCZIQOmQJs6
 Sryw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWaS0/9j4EUNtO7oSkVBZhCGFrPkZq07qw0VCf0m7ZIjK3JVi1Pp8dOrkG39wKCF71sg6qCn+04Hc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLCNkCugz70RCkU6ZNMVpGP3cOLUOw7OgBBFiahfY7yjl7bN2J
 Qzlw/ggD8RhGeFMkXQiYb7bq+IQP98Yh8K6nXX3Ku0AvQ7vVDcgrtWEALd1GSfA=
X-Gm-Gg: ASbGnctjzVM6JakbPVvY/yAQvh4/ASc8ENOoHK3dFz75TxkijTvqgsA5AsW+IFdQOaY
 1y3HSiopOu2Z/t5GrwKpUQIOEYBACkTF9FUJ11Kt2x7zr1hflM0gakVYpxtuOefFAEUF57O0laz
 vZDxnl1fxb+MfMkl4QalyfppzFPUhsXetoBCd+y9nq9sw+QrGZuD81V6mjYdBvCkrseeyCdQAb1
 FToA04EcT4pWRTx6iP9uGbcu08fWf3XXpNyl1VYLS0BcIkeVPLoBdepuDP5BMan
X-Google-Smtp-Source: AGHT+IEzZsIs9KHrk+RQNoZgbtix0ubEjo1ieObMZDI8gSvt5gDisA0jhTtuC/z1S2rpaDu+Y3v9hg==
X-Received: by 2002:a05:6512:1055:b0:542:232a:7b2c with SMTP id
 2adb3069b0e04-54229548e22mr177814e87.29.1734658120251; 
 Thu, 19 Dec 2024 17:28:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:32 +0200
Subject: [PATCH v2 4/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-4-38fa961ea992@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dZzh3PXS76i6xnboEA79w1m+EII00mpCa9Y07Mzie78=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rKCbtco8lmN7xdHszWyrTvlH/Va6gQOXnhca6J55/M0
 p37RvtvJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmIrmfg2Eiu2lo8Z5c6RyX
 Hbeui8duXMSxykPaoNlh5Uo74cSQ5uqnWzdV58azlf/mWDmlbH5Hw9a4FIdH3driHWsvxvwUtTB
 2axMLkbA5VPRimZ5xj8qq3a8Nij+x+VmWO2rJh+u8rnQUObWBkedeih4j6/pp3YZXONOZ1M7yBy
 f5V6te134k+J7T2fzD8b3y0+6aCbYnXhDc95szle/A+kN1O2yOf2FakcvMOTHkFnuigg+PuaCog
 +rO4Bt7Y9h8w52CuOoWTq9z15bgdqrv6k+ZtEKD40bKgWWtT5YvzXt1d5JHaHjAPG0+2eeHhaqa
 LsYr7n67PT+z7cyEmZ27tCWysvutb34uDlu2guuBSSUA
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

Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a57d50b1f0280776bb95f55b8fce9aa8259d7041..e8916ae826a6daf30eb08de53521dae89c07636c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -162,6 +162,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -169,6 +170,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

