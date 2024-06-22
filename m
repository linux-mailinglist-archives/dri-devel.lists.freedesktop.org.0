Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACBC913675
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CC010EDF5;
	Sat, 22 Jun 2024 22:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d3TS1nuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C024210EDED
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:27 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so36086331fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093746; x=1719698546; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hcLXGMyi48kmnj7pjstYNNfWzbNrifnXYs8snVK6Jn4=;
 b=d3TS1nuKnWlkgDyrs587qrZgU3T6NgbUDt2YhfELabWycOlyQ3Dnr/8lodqrunjtD8
 xjIqAqlFiBEBv5m8PV/mb3q/6Bn7154/xYwMTLDhl6YyeLqzQe6MUhITLyhFzYZsJosP
 x6CNvv6dAJ8opAL33OuFn3O3FKE/qmJ4ZlGtAkbBZqXxo1PQ8dTBozFsBxMtqzTz72Kl
 ogd2O7vN5W3Wtkogk0k7E0k4zVb8MdmGrpHWEMZKyPrsyZ2cOSd49UubyYomtZ0hayW3
 0lxKR6zVDCanrHpWVw+ulDqnAMnE16MOkVIs25oJ9i/v6/j0Jt4KhNdAOD5JPBqVSUpA
 4ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093746; x=1719698546;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hcLXGMyi48kmnj7pjstYNNfWzbNrifnXYs8snVK6Jn4=;
 b=K4OjKt2fuym0yYCZFja3rn46zof3/sEmuGr5GGCUwbR8i3Ro5g+WKyIF4WnvdnleDs
 KlqZJS7FP0DwhUZRPSd3xzx1NcYAYrO0kJWW1b19ydsRKJ0lTu9iVc+HTsgifhN6crdT
 N/Bva20JWQ2h9U7Hhs5WjMOCeZLdiWD9yvxig1rNWf9N7rYFQ+xTHvZr6JvOMQEGypEI
 +5pN2mRtMFyLh+YnHB49grjqHax9+W/G712MSeXHhg9i7vvR1/q/LOLdAYnQwlf8LYzR
 eiM+Scym0h6iiu0gKbYv4XAd55bNI1xXHxQtBZ3xa7r2afywvzGvhrYTLoL9d5pGT9od
 37Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuk8iciT3S3fFmJur5SmTS3luYepdReRaAJEcbfw/QOL7XijVrocl8uFnr/22R7UygM1wABcD/CticbrygS4xysbbgvKke5+DIzoBMxpkh
X-Gm-Message-State: AOJu0Yw25IfGV4gawme/ZM4XfpTt7tutUma+dugWxIcSoxJ5hSrmkHW2
 mpIKwxqBYyiS0J17R9CocmRErKhgrX+Kft2ihaMAUEDMzP59vi7NrH/r8ZMUCDc=
X-Google-Smtp-Source: AGHT+IEosm1MB8sVMKXefmGRiaVDftf+7yDqEsDBy2wvjyJ7dnTWcgC8vmNbs+aNIEBPJzhSJChLuw==
X-Received: by 2002:a2e:994f:0:b0:2ec:4fea:8b9e with SMTP id
 38308e7fff4ca-2ec5b337a97mr4258801fa.15.1719093745913; 
 Sat, 22 Jun 2024 15:02:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:23 +0300
Subject: [PATCH v3 10/13] drm/msm/hdmi: expand the HDMI_CFG macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-10-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2236;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=c8linT71WnUmb2XL4MjDcI9MoIjYqa8Jfex5sF8uhhg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0npxQE+1N8qoZFUtMdjZ+FEG5yO3+10/F2ly
 w+8ND4VQ7mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6QAKCRCLPIo+Aiko
 1VN5B/0VeC+RdpAdyBSPOw5fDyKRSeXRtfm3jDRuz2kdmzp+6j+2ra1isZBr/dsTEm6TLHuL+8i
 Vr83ibPymZn2baMMSl+jxPqbiVY/Tx2W5l3wargUjKixUCnC6ilkyQJtFcpV/f7XZ8RlSc9mn/G
 +++cAG5s7k6JVroJt70muCE2VWSCNU8SYzQ14IZDP4wP85pmG1bz0HHp4UnbhOFuTvJ0k8oo4HN
 8LfFLuImZ5kf0WJhBk3oPvTtuGHtg9uPPIXwd3LpEUAPZmWJEyO48wHOVcOb3BiHvQKSmIamFP8
 ket0CfVSADHb1eS6IHCr9Ve6pdFyR6FY+A3/0rqrsTq8q2ci
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

Expand the HDMI_CFG() macro in HDMI config description. It has no added
value other than hiding some boilerplate declarations.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 48dd1843ea1f..5ba9a23ef122 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -222,24 +222,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
  * The hdmi device:
  */
 
-#define HDMI_CFG(item, entry) \
-	.item ## _names = item ##_names_ ## entry, \
-	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
-
 static const char *pwr_reg_names_8960[] = {"core-vdda"};
 static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(pwr_clk, 8960),
+	.pwr_reg_names = pwr_reg_names_8960,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
+	.pwr_clk_names = pwr_clk_names_8960,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
+	.pwr_reg_names = pwr_reg_names_8x74,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
+	.pwr_clk_names = pwr_clk_names_8x74,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 9bc4bd6761de..1c2e46d38792 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -87,7 +87,7 @@ struct hdmi_platform_config {
 	const char **pwr_reg_names;
 	int pwr_reg_cnt;
 
-	/* clks that need to be on for hpd: */
+	/* clks that need to be on: */
 	const char **pwr_clk_names;
 	int pwr_clk_cnt;
 };

-- 
2.39.2

