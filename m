Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E219E8C1460
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 19:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D041210EC7B;
	Thu,  9 May 2024 17:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cRXqdiJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85AC10EC7B;
 Thu,  9 May 2024 17:52:10 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41b794510cdso8704535e9.2; 
 Thu, 09 May 2024 10:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715277129; x=1715881929; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hAgOX6MEQ5v7+oviGufGYxbrE3KtnKTcvCIobKG2wxo=;
 b=cRXqdiJTeFQhU+ApeAsLQ1AWZGhI6zHb8wQ7vbnwsjXsuRSL7Bkqy76k7TSMcKR/V7
 3cj9weO93EsGPfIDd8LEwo0zUxp8Kr8UbzO70qdk3Lan14mkgVZnKJIZVeWGvgS5t0fC
 nAuGHB4hzl0JCABP1eLjUnyQEmOA4l0sWW6m78EZw0kFxI0K0lX0A1atEUXj3Wyz40YH
 bWxGQNGeYX8eA9oiEqdzX50NBc5rxFuQQNAsgAKT5mDNYIy86niJEou+ZFY3AJzJEp4U
 xwdneNSEUWxvx/txEK0y599fp7Q/uXFo7BIF5OTLZ/pOxhqZ8+gYqd6FaaMeuj9Mmkfa
 Gy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715277129; x=1715881929;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hAgOX6MEQ5v7+oviGufGYxbrE3KtnKTcvCIobKG2wxo=;
 b=MhSOAwGV86/F4DOUU+ziZko2BMk8uUEXrDyB79JBl/L7bLynAz1qwkP4cE8CwEGAR8
 N7w+NOSJIPoKGmALIuKq2vQEm0CfjjSZ2QqMBBaJ4G0ekF8rk8qrucN5oidNmNEujLGN
 OXFt5ocO2gNAbhdSKlopdgZnhOfqv9RVFRE4uH+cWNf0kndZAcI9/ynItxmHjWCnAaJR
 GATy/Wzvr/seUZTr+mufRLjb0UrP9moKU++RMZoFYovMSeQggxJub4sqVa1brXdRQo61
 Jdu3rFEEr8cB9Zm1Lo1vCi2FQ8YpJ/xduIp+EgF2/8+7bXFFHGiBs8IZeDer9lHKXN8h
 LRSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8cFKTDKqxeu/9udBxrQFCGo2sma4QIxED4giIQzfbSlObMtQNmP2vf2m0Fse03SX/AuZM5UVcvfxRaqbea8yfmtp+IUHZ8iKrGAVNrRyeZMzgxqgIKg2xX4FDmk3QylGA53SqeME3lDoNANM256AK
X-Gm-Message-State: AOJu0YxwewYLNMhLuVxZNSJ4YiL+90kHqADVGU2ZO8YZCLzsJOBmEkRC
 2U5gcHmWF994dfBhfb4YRnP87tW+1d6Ra/btRKWOAvBqklF4g+Vs
X-Google-Smtp-Source: AGHT+IE8innbNBc8AiX5EWTRT9KWJEll55U9Zj/JPSJuQs7roZHsNPLnxuehVNX8x4EXgB8XLCbJ6A==
X-Received: by 2002:a05:600c:4591:b0:41e:3272:6476 with SMTP id
 5b1f17b1804b1-41fea93a333mr2899295e9.10.1715277128756; 
 Thu, 09 May 2024 10:52:08 -0700 (PDT)
Received: from [192.168.1.130] (51B6DCE0.unconfigured.pool.telekom.hu.
 [81.182.220.224]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f88208cb8sm68014395e9.47.2024.05.09.10.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 10:52:08 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Thu, 09 May 2024 19:52:04 +0200
Subject: [PATCH] drm/msm/dpu: guard ctl irq callback register/unregister
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEMNPWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNL3eSSnPjMokLdREuDJKMU80SDpDRTJaDqgqLUtMwKsEnRsbW1AJa
 /gDRZAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0
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

CTLs on older qualcomm SOCs like msm8953 and msm8996 has not got interrupts,
so better to skip CTL irq callback register/unregister
make dpu_ctl_cfg be able to define without intr_start.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 489be1c0c704..250d83af53a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -298,7 +298,7 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 				       phys_enc);
 	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
 
-	if (dpu_encoder_phys_cmd_is_master(phys_enc))
+	if (dpu_encoder_phys_cmd_is_master(phys_enc) && phys_enc->irq[INTR_IDX_CTL_START])
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
 					       phys_enc->irq[INTR_IDX_CTL_START],
 					       dpu_encoder_phys_cmd_ctl_start_irq,
@@ -311,7 +311,7 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
 					   phys_enc->hw_pp->idx - PINGPONG_0,
 					   phys_enc->vblank_refcount);
 
-	if (dpu_encoder_phys_cmd_is_master(phys_enc))
+	if (dpu_encoder_phys_cmd_is_master(phys_enc) && phys_enc->irq[INTR_IDX_CTL_START])
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
 						 phys_enc->irq[INTR_IDX_CTL_START]);
 

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-ctl_irq-a90b2d7a0bf5

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

