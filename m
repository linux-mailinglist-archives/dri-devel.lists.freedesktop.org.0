Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFD6A3D036
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 04:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64A310E8C2;
	Thu, 20 Feb 2025 03:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NwFeN16n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C87B10E8C0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:59:38 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3078fb1fa28so4091001fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 19:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740023977; x=1740628777; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EqbHNmz099kigX0TqynbTHurbS64qX/w1xCegrKBwT4=;
 b=NwFeN16nEXERwAMmg8IJJRd1nnHY1GUGo6dhHc6iGw4gPTqNo8BQpCPFbcYzGz8ER8
 Edjp2bOY69+uE2EtIXIGYPjGzRXoD4tUlqjzQvR/rJZNZfKoD/WxqWtaPFQyRwyXaqq9
 gPfXBeEL0Wd/EF5hbAjPAaHM+fGSJxuFWbCEIbkpuHwOTAn0AdZDsAVMwDZP8h7ah1rL
 WrS4Y1HNvQYG6OjX3aZD/di2ZP9miScv6rDdUKil+ZzEeFggnfjEzDY9izycsW1Hco5r
 PiWIFGNh3L0wuy41bSy69gIiymTyUtw9Y2zdApco4ujcoNhqYtnTJr0TvOAto8x1kdLN
 N+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740023977; x=1740628777;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqbHNmz099kigX0TqynbTHurbS64qX/w1xCegrKBwT4=;
 b=b8L8p4nb0jf8+iltLQLWfzEu3WYhx4o4Zt6x+iMVtmTRGeWSRFQqoUH9d+kZg6lIyz
 AK4LgHIHtI4aRPY1UKsmj09yRZcaIP1ELZ1NB/+TQEMOgrzsJhgxdMi1D+GlpVd1CLgT
 hgwLyy4Fu13tVkNRX6D/+TV3QROPhDna8RqZZhjb24O7BsxJbQUFZ9/EIQROZf8YEbpO
 Yq4/dxOQFK9hpRnBdWCJV9q28r44zcpMLxKu9VOn6V/u9nLP++qoLafa/yDZbyU7zAbP
 epIsiYvOC1Z7lXKbxO5WBx6QqXo/C0IlU5c5yCHqqHKaHqYr2gAiYa4NJIgZpP/6WGrs
 ylXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV8N2XLu8Tu8VTbN5VcOJ1evURJAa8ZPwc4lsJjSU46jDtTRkwhS8c7j89ukI4VxACQeEKEqcVQCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCxoMHARVu0W/m0Ks5YXv3SAot72ZxDPL+sVmyoEwKmlSI5bZ8
 YDLDMSA17PXBFRMMT03hegg/MCmeC2tmsvdS41+zgwH8q87TLQTgwLaR+YFuakA=
X-Gm-Gg: ASbGnctu14xeO1Rag35NvJOaBrTU7glO06WrENlAb7u8ZhE8ZubYJQHH9Y7sZ3XA63y
 3J9RLHOEzZ/lbfgxCzwhMS/4J7fKc/BLGUMyADgIeVS1roEr1f7fif1lGTJqG5drA1mH1lRG+sc
 ywyG/a5adiEGhEukU/MPI8jHk56lTYKtvtwWoRra1fKipenvlCc46OIBfdAgL0mXYdw//9t4Bki
 AX6MglKtie/lBdQ+vZdTno+5sJT8nRhQJ35UhhX8i5YDTD7JaB+RiblGFlHU8M+iJZuKA4QTCV+
 tTNDXI7bYiO/cctuIIIctck=
X-Google-Smtp-Source: AGHT+IHNLX1q/p1F1rq4DyZnm4yuozfzfNUpta652kVpbxvogd3CMY4f1V3qt5Csx5Qszd0Ja2VUvw==
X-Received: by 2002:a05:6512:110b:b0:545:aaf:13fd with SMTP id
 2adb3069b0e04-5452fe76fccmr6884137e87.51.1740023976695; 
 Wed, 19 Feb 2025 19:59:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545225f22ebsm2143909e87.16.2025.02.19.19.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 19:59:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 05:59:25 +0200
Subject: [PATCH v2 4/5] drm/msm/dpu: enable CDM_0 for SC8280XP platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-add-cdm-v2-4-77f5f0df3d9a@linaro.org>
References: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
In-Reply-To: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=975;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ksuGoNCpiLiyemIz0C1goT90Bi/HXDBK3gu4zkBcFe4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntqidVLBOqKTIOpBvG4db7VXVScNmMMC80vm5o
 Ax1Q2LayhuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7aonQAKCRCLPIo+Aiko
 1Wt6B/4l0tedtz00rD6xE5Nk2oCfAEA9rif90maR94yeStThnNmOlaypC8JzqTsQwzyfYIDLppP
 8Ad965InPWg8vKtWToJBb50m5vxxaubDgD/FQgmQqnFfuFsIzC06Uo2Qy9oTcoyXXPuZbw8YKvi
 K3VE8dPcvKt/74eD8HOTPHK/u4N5szfXBzG6SvzmYwok1e8rvwd+YVfgta0o9RZGN/sjj8SiXku
 X8/0zk0CE4KwOPA2Y+s0dzLlE5RBhDGuxMZU3ulsUMoOc/eGdn205hFslC6jxR/QIbBfiY34qJo
 9K55rA2S3tsK3K2xjDvxlegOvFKTXSdkAnGCv/toxdPo0Ipm
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

Enable CDM on the SC8280XP platform, allowing RGB to YUV conversion for
the output.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 0d143e390eca964b1c81f835d0904a2079b0b941..fcee1c3665f88a9defca4fec38dd76d56c97297e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -435,6 +435,7 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.mdss_ver = &sc8280xp_mdss_ver,
 	.caps = &sc8280xp_dpu_caps,
 	.mdp = &sc8280xp_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
 	.ctl = sc8280xp_ctl,
 	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),

-- 
2.39.5

