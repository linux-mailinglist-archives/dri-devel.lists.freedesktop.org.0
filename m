Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCBA9FB93F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 05:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0153710E284;
	Tue, 24 Dec 2024 04:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z0u5BvEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE18210E278
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 04:26:23 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53df19bf6a9so7256802e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 20:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735014322; x=1735619122; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZxKRLp9w0TqXczLTu9OC4Th0gSsjMx67iDgxXuWVgpI=;
 b=Z0u5BvEYH+0gB1jTwEYK0cwpGUhISVpNzusIWPlr3vA7L0I7HlQ6+n46AstcUcCPpy
 22yam5fSuIr8Hlntns+3hlTcBXPOOlE5T7BibO91DR/vVimJqy6prz3GbtHQ8PdCL+hZ
 ksU0tZxDG39syo2FQ7ytPolWUgIR86sgEkRKcTC1/MDD3q3pEK55Ed+sfGlFJmG+6plc
 U2zWjvcPk6ogMO2Cq8EY4ds+fI5oRXgIFN037mbeFCBigvTSMxt2YlX5IgndtWh4qB5R
 Ta3DLP8+f058Wtl9JsNpz41XIgB0zpNw/N3/Q+s7wEpNhcSabzgNrqZb5RfRlO5OnuF1
 Mp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735014322; x=1735619122;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZxKRLp9w0TqXczLTu9OC4Th0gSsjMx67iDgxXuWVgpI=;
 b=JsbhxsdBH98olZme2Ti9o1vP5pBCx7fAQoPg5aEJZd7l/fPtl9Cz9Ypv/w+PfM1h4/
 vLxm7tPPIykA6cawBU9p5Bxtl9zvAmCLPOidqoGVq9Vu1Lw1CyQvDPDqKufAXCvLigtW
 KLVVekrygUMW5PuY7ZNPAY3O6/UmG1nffh4+f0NpD3WlLwOFyY2hUA1HHiPJ2IE9niRB
 iW9Dyd4Gqk3L8yBS8cDzVOgQ08o/M85eIS3Z42p0dzbFoB/GRL1CWDt1ACnqKt2/+Iv7
 Y+DJDhkDvoTSfqJKMEIEfN4wE27FmfQr8p87Pyk0xa7K69XzycrfEOYBX4b/vpe2VhTn
 /7Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCViG1ZQftaJM6EhYJh4q3lS8+VXOeUwDw7YJWeOt7Df1/GwWlMiZ/5xhHoru+6zLM6E9XXMZjJv9r0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyK089jzAvNi/8C51dn5WcUlG0+mAWq6Y8eIIj3MYJSpUfkcwz
 sMuJqp252mOPhl2bck3yStWeRiOTBsrCWxHs/4bktP6EN4G6zsDi21iTsO+bVUs=
X-Gm-Gg: ASbGncv4RdEe405LbcrkzpeE3sb9RkFSQAOPUp8o7nl8eEGxX7/Nk0rMQ5nWsfJfeRn
 hRGQjIz8kCUYgHVtnPem+CgEH+GPSCNrQri/j0zqucRBgYQW6bHvlBMckWw33VSMPHVPXEE13f3
 ddTZ+YXoOS9P44cU31L19XQluLV1FF6tCpkIfEKqfubL8AmYseh42r+ldETluoEPOVgu6k0P9Yr
 1VCmtr/vq4/46HAN/eZFupFYTfFLaOxI9vV+RJ5GR0qYRHkII7nT+15rFPXFYlX
X-Google-Smtp-Source: AGHT+IFzxPw0Ov30kcrG02IRmr8rlFm7Lw6T4TOohgvTbpNyR56xqT24steHLGTW/oS4XtQSq8atmA==
X-Received: by 2002:a05:6512:114f:b0:540:1d37:e6e with SMTP id
 2adb3069b0e04-542295434f9mr5272634e87.33.1735014322233; 
 Mon, 23 Dec 2024 20:25:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542248cc8e3sm1467277e87.103.2024.12.23.20.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 20:25:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 06:25:17 +0200
Subject: [PATCH 1/4] drm/msm/dpu: rename CDM block definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-dpu-add-cdm-v1-1-7aabfcb58246@linaro.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lTr2DRIVQ/vw/WOccbgEKc0Bgfl3SUf0BOqQzdNe4NY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qW+dpHrnUxh0Nl+RgLv95RFm5tUP9bFPP3Wn3i9f+3r
 vJ3mLzrZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEDsmy/zNqEvt0e6HcZ81F
 Tt55jqvjfKRtuNZ8WHfnkajEImbTHqtMlcqwbZ7fGn9nqjvmbJj8fsu/CadLUvL0iqvSjbkv2y1
 ft4LT0tZlt6G3RILHnQU529rKdDPd/vN1/O0y3VN7x6VQYuvam1x1oaxV643LAwqeHD3RGmkSEx
 nIc3Ra5VmNyez5BqstN5TlL960sXfTtUuWjNfMo2W2X/3wOzGmVMf0ynJPK4HQvqXTDN1CFCMXa
 81fcvN7vsgEmbjEiqcLBJyEeSIN/qXU9O15E+a5UuhKUrCIbFnE1LKwH4IGiZwiCwRn/Ysr0dzS
 oc12YCVLalDHheemJm4lJSW/rxS07Rdb7yL3a0b75GUA
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

The CDM block is not limited to SC7280, but it is common to all
platforms that are known up to this point. Rename it from sc7280_cdm to
dpu_cdm_0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a57d50b1f0280776bb95f55b8fce9aa8259d7041..b04375e18d07ff2dbbd7187e139e9cb8cf9c531f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -384,7 +384,7 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.mdss_ver = &sm8250_mdss_ver,
 	.caps = &sm8250_dpu_caps,
 	.mdp = &sm8250_mdp,
-	.cdm = &sc7280_cdm,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8250_ctl),
 	.ctl = sm8250_ctl,
 	.sspp_count = ARRAY_SIZE(sm8250_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 2f153e0b5c6a9e319657b99aa0954d9b190fe724..7dd423ff76a55e0828b8a859ed91deb4b189061c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -248,7 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mdss_ver = &sc7280_mdss_ver,
 	.caps = &sc7280_dpu_caps,
 	.mdp = &sc7280_mdp,
-	.cdm = &sc7280_cdm,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sc7280_ctl),
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 907b4d7ceb470b0391d2bbbab3ce520efa2b3263..99e3b373a8a8fe823a79916a65955ac5f611afbe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -458,7 +458,7 @@ const struct dpu_mdss_cfg dpu_sa8775p_cfg = {
 	.mdss_ver = &sa8775p_mdss_ver,
 	.caps = &sa8775p_dpu_caps,
 	.mdp = &sa8775p_mdp,
-	.cdm = &sc7280_cdm,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sa8775p_ctl),
 	.ctl = sa8775p_ctl,
 	.sspp_count = ARRAY_SIZE(sa8775p_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0b342c043875f3329a9f71c5e751b2244f9f5ef7..0e386875c9cfd00f6f3b20edb2d76a81b38b8def 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -507,7 +507,7 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 /*************************************************************
  * CDM block config
  *************************************************************/
-static const struct dpu_cdm_cfg sc7280_cdm = {
+static const struct dpu_cdm_cfg dpu_cdm_0 = {
 	.name = "cdm_0",
 	.id = CDM_0,
 	.len = 0x228,

-- 
2.39.5

