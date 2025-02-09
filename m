Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F63A2DAEB
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8825010E47E;
	Sun,  9 Feb 2025 05:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ePUcKWEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9152A10E47E
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:01 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54505a75445so940803e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077620; x=1739682420; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MgMGbXHWLKVnTij1NafnBiRAE4dpvWazdfcr2GGjsj0=;
 b=ePUcKWEjjITD+LP56hFYUotHoXniGX3A/ZwJwBMR4gp1zXHJYUMpTVAbUCjTDDZGMV
 1YXqhrs/jz5HAb+cuZ9EYLqS3+peP3umNttNDYUGBNTFFcMsX90JkaKc1Ln0VtxGVm+b
 vf2JtSu0UDoti4n/7OQbD9vQYv8WhZQsMqfshJ1Uc+j+v7bwqqLay0HwIHyG6iaa920x
 3U8UV4XvA/dfmSVrWMqBw7PoihbbPg9XWYa5IxQZkBtcV+/zzRdd4QMk8dpkHhbcs1eJ
 Fm07Jq5kEBOiJzjLw6xwoyr+8SK+EX/3MC2bdLjs7K4K4nWt/3q4sa6gFC5LWIZkNopE
 Bs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077620; x=1739682420;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgMGbXHWLKVnTij1NafnBiRAE4dpvWazdfcr2GGjsj0=;
 b=n1L4aMR65E8QuKP6/Xx0lCEyPV/9AiTOUq7v5xSrWfDWJQUPPy0dipPa5OeOERg0t6
 xngQD2y+rM4AEf4G+un7I3vD9t0yBMgt7bLUdW+ClY1toSv3PKgTHmobW/cPOWFH7Nl+
 WFP2ckhWw/5R4B0jD0K9XiwDFRMRLSZNA7HPETRa8xi19Jn8kBA/ZKrRSTVIi7qtw25c
 4x95hEBNKM2uehdR6TL2XHgMEacfEztyD/lZ5OLfN0Tr63fbEn3yxyZ0niZRL1yr4fLA
 YQmFigkLplU4RgfebvFBpqm3SWQnwVF64QAclaZ3VqR95ox5mriekYmfSpLww+p+noV5
 lzPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc0ASTyLupvI+IZ1BpnKGTHjlSKdgl7IaeKKB7qUsELLp4lFMiIRmqkt58Vifup2hOFnF8Ke3abX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTtwdLWhw4xfSgCurHxz568+Ei2/XUb2EIAMSCKUlUijFIHdvv
 2SJ96QqK69jzy5owc4P8QgqagPNPALvEmv5m87RK4n5fSa9UUraF8KsVaaPBYP0=
X-Gm-Gg: ASbGnctZkAPJFDNEvQkPWIXFiSFRD0hUh+Q7r664Q+Oq7wkh4o8Xm0C70G4XeBBWwfK
 fJf7exge6pxasBJWYnZfW1pV0oHevz7WYMoxYMZdKrlJswlw5r8mZRxG0rN4dfRRn/W9IbOvuWZ
 JT/KYrzhiR7brTkhZ4ouPoSkZhdQCQKPjIYkkv405hg3a/ZkFBqcLfmz7VeKUpf789ausxPob1T
 28/IJh5FNSAJOBoiKhEqesYx5U1CSZDk9hg4/uUFWmFYCg75agCuTB4RXAqrwmoSmnpDhPV859c
 6IhpLLMr5a7W9mmay67cqCY=
X-Google-Smtp-Source: AGHT+IFx+DmPcZu3/NRsEkP+OG1M4uAJloebIpWaEr4zUGH3IBWnTxGpoo5HkK+ek1VL2il6g5ZnVg==
X-Received: by 2002:a05:6512:ad5:b0:542:98e9:63a9 with SMTP id
 2adb3069b0e04-54414b0b605mr2844776e87.44.1739077619881; 
 Sat, 08 Feb 2025 21:06:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:06:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:50 +0200
Subject: [PATCH v4 06/16] drm/msm/hdmi: drop clock frequency assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-6-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WW4ls3rpXG1GIIqJFaRsd5YlkFmkvDhOcZwn0x64Row=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfi33wWbfpM6mTVM/ftWIImACMnz11kBEOqC
 blNTd+M/5+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34gAKCRCLPIo+Aiko
 1dSWB/40THgJWOFA7FwOHcFPelVVnpKYNOhfQuyUuXJy0WLW2cSHshnroZRXNnjokUNm0oly+fA
 dPJtLOBh52GIUcac13awR+mTeDNkso9fhOR8aONIaah9ZyYwZixqaImkB+Pya9N4Pp8S0FMZEmQ
 AuQrEaRpREWdNEYbEBavp5mnhNQsYK84xs/boE5VkJUrAn1c4uHVymlQxMc4H6beLXKwVlBrfGi
 4E8BJJzCTBIoNOAMJ/HeRM3gNw6N+RfKoG6FD4IrrD9R56rPo/c9ePXfvC7edCfmsBiCOXDC2rM
 b29yFFfR6iQHceT0T/LBylCiPZIO/Arm1BEWDWfhs7v6DikV
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

The only clock which has frequency being set through hpd_freqs is the
"core" aka MDSS_HDMI_CLK clock. It always has the specified frequency,
so we can drop corresponding clk_set_rate() call together with the
hpd_freq infrastructure.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 2 --
 drivers/gpu/drm/msm/hdmi/hdmi.h     | 1 -
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 9 ---------
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 104f9cefa14834d04fb957eb48777e605d1e29a5..6f09920c58190a9c195de0407e4c2dcc3d58b30f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -234,12 +234,10 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 3314bb8a09d6bea7e34ad9050970bf43c64d1558..e93d49d9e86936cb6c1f852a958398de2e134ad4 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -93,7 +93,6 @@ struct hdmi_platform_config {
 
 	/* clks that need to be on for hpd: */
 	const char * const *hpd_clk_names;
-	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 9ce0ffa3541795a076b433566a3cafe156120b15..7ae69b14e953f0ee6deea8a216bfa9d3616b09af 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -68,15 +68,6 @@ static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
 
 	if (enable) {
 		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			if (config->hpd_freq && config->hpd_freq[i]) {
-				ret = clk_set_rate(hdmi->hpd_clks[i],
-						   config->hpd_freq[i]);
-				if (ret)
-					dev_warn(dev,
-						 "failed to set clk %s (%d)\n",
-						 config->hpd_clk_names[i], ret);
-			}
-
 			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
 			if (ret) {
 				DRM_DEV_ERROR(dev,

-- 
2.39.5

