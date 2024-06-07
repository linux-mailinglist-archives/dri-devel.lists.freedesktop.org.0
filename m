Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02889900499
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A7B10EC3B;
	Fri,  7 Jun 2024 13:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vwRAz0gQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F13410EC36
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:23:13 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b9dda4906so3038259e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717766591; x=1718371391; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TkMzRYwH0rVG++I7PNZai1lbvWhZpzJwskrcS26a0W8=;
 b=vwRAz0gQacNv9PNZZrvTiEHwc1lE1JbO3yNFob3jWB87HkpuyfJV1yIGc8wO+82YyN
 /LKhwtKez4tDsRVy3gObDeoIRnpOCI2R2TghwGVNey5MVsF0APVcodMAex5QY+UINE/1
 iHsqxRiKAj5i4DnmnQmFqLUZkhZpmg9xRn47dK1v8keeYU3Th74bi15k2bXm3V0NjdAG
 npFgsJSQyfKL+GX00W7yMkIz0vM5035UZfxthkz1qN2IDMp4XC8mIbWVIts8FKSl9ZtU
 7nbmqqtIQMQiE99DVSV7+f7j5MGENzR93MCd0GrDIVIlYmUrgRvsp0E8YrOY3pv+P0V9
 wR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717766591; x=1718371391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TkMzRYwH0rVG++I7PNZai1lbvWhZpzJwskrcS26a0W8=;
 b=B9xGO56yBiU5w+u7SJFWnT56ESExRTb3ZVfEPF6Alr9kfpM3NyrbGJhhfhMEHW4+Py
 rzLz/PVa5MsH6UYllmkwS+ZjviPRJPM2Ix1D6lb8kZEHDp4xxvbC2Ro+O/8Aubwn1QgE
 JUzWlOUDjhH4+4nru1JZqi8QM8k0+/YkGBpOeC+uWCnLSX2tAldNKTQGhlHnhN7VP+ed
 4rLRK6q64k7cPeeh4I/U/P4M68OiPUqDdJ1P3ugdOKrGG+Karnc4X1m+PTfivNU4488v
 C95VNLnWGXpKl9YcamoruTDSFcyORZp4r6ga3xHHhhX+H3IfGDWQYY9BNkO9pXQwNSLO
 lxOA==
X-Gm-Message-State: AOJu0YzUWxVXMpuPr2hUaAzug4getVzqAhnQc6vPZu7c/tuIFd2D6HA3
 IoHqIoOrcUvFjH0go2JyaIchOTAJ64FLxvHEZwjF+OdrQClb1GSZpbsiYwCqibs=
X-Google-Smtp-Source: AGHT+IEqVYzspyMjFA7VM7X1Pabg5rRSRUot0NNv54KwjdMq6vbtyxYVWWj0h/mV51xuhgFiU9PQ7g==
X-Received: by 2002:a19:e043:0:b0:52a:5fa8:d565 with SMTP id
 2adb3069b0e04-52bb9fde009mr1923547e87.68.1717766591565; 
 Fri, 07 Jun 2024 06:23:11 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bc27640easm80944e87.104.2024.06.07.06.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:23:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Jun 2024 16:23:05 +0300
Subject: [PATCH v5 8/9] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-bridge-hdmi-connector-v5-8-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JXbaAkUfXwOLePC7VJ3jRbdq5WguoXJxRCdZfMDCGD0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYwm23kjoKoowWNnnGfRUNcWsRsEBx014LiQpL
 K5kGF2+H5yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmMJtgAKCRCLPIo+Aiko
 1QpCB/986W06+rStv5lrhzZaOvIKCcFCaFIJSIWQQDpppibPurGZ3ZYo0jReEMU14k2BZ8ExxpU
 UP+3rylqKQwPmrOlEvThIiloVTP5GvoH7ofajOZ3Q+gbKBqJX6GXDz8o0pEbwxmnPbkE1P+YhZk
 AOTyaAGdmMT0nu03qIaUOTgfWWrZGtLpC1H/foGLe/CYBDcp2p+7nBLzJ2TTkYyKkEjZFjBisEH
 6C0KhtI84IU4BXhfXjv0jYBJusFYuuVgzRdM7MniL2HRcaQ25jKY/TzLB92YNFjH6nSmFO6Fit8
 KCqjY9mRBwlRLa4PMAhKGC15tF0GjQWOJ6YmsPESUZSPCHnR
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

The GENERIC0_UPDATE field is a single bit. Redefine it as boolean to
simplify its usage in the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 6c81581016c7..fc711a842363 100644
--- a/drivers/gpu/drm/msm/registers/display/hdmi.xml
+++ b/drivers/gpu/drm/msm/registers/display/hdmi.xml
@@ -131,7 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		 -->
 		<bitfield name="GENERIC0_SEND" pos="0" type="boolean"/>
 		<bitfield name="GENERIC0_CONT" pos="1" type="boolean"/>
-		<bitfield name="GENERIC0_UPDATE" low="2" high="3" type="uint"/> <!-- ??? -->
+		<bitfield name="GENERIC0_UPDATE" pos="2" type="boolean"/>
 		<bitfield name="GENERIC1_SEND" pos="4" type="boolean"/>
 		<bitfield name="GENERIC1_CONT" pos="5" type="boolean"/>
 		<bitfield name="GENERIC0_LINE" low="16" high="21" type="uint"/>

-- 
2.39.2

