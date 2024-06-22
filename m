Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DEC913677
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F5110EDF1;
	Sat, 22 Jun 2024 22:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vN2AMmCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EADB10EDE9
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:23 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ec59193468so3162501fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093741; x=1719698541; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dUSF3z8flXPuG1mf393BlemBX3xprfFWvuJAVHzccy4=;
 b=vN2AMmCthC7uDkM+B63s/HW/sFO8CWDyr7eMD/i/Bqd4wVdTle0xGe9LdU8EuZ5L3u
 FvETdiwoKmC6HHSSn9ScxM1A3QtD4Wz5lwwE+MtnJWL3nQUzNz49J3QicBHG0f85yk72
 34eyARfLZAHpw9tCqZK+W0U8OfIaQ8Xm564vNc+lIST7x9MrQDSkIreGJ5Hw75x7klgj
 IAnIltFjwK7owI4iKeVN/a5ejkoTIHCjXpox4kIkTP0ZXNV0ncHoNRDHmyHCMOk1SGPl
 Af6RTiuoiLlCCgrmf2rCcJKpVPjGEbM9FtOz49W65IphnBdBUbtwTvSZaat2hBHV6Fub
 2Msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093741; x=1719698541;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dUSF3z8flXPuG1mf393BlemBX3xprfFWvuJAVHzccy4=;
 b=e0pDTvxmRK0gWXyQC9/wNMB/IYQyWwyYR3iqfZ31liZ22hY2EP+TlDNo8OF0QTlBbb
 nVHpU1hMSUIx+KRvCr2C90vOVnr3/yvV6Dt0JtDZZN9s3d6gE5D4KoR1rYGfgByDMVic
 H84rEFYmQ7QXZSTZRgO3sr2B/ro5NViPHkozAFMyFFrA0kcmcPElN3p45sPZJ5Ls+5/8
 7FUIrxMTidiz/EP5Z58t8WYaSWjr/0aCV9VpevAw96GC/mj3J7+8X5QfZzYjFscpV+0J
 cNswhnxpO6YtvAPmrTQAB68FkffWjFFw5R3G80NXX0irBbYVN1USBtjRI/m41TstvH8P
 Jh8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1wNHaO6S5iroB1cgX9DH6Q/dvOLbOxLQWx0OnTGB8kVWXneM79+x0MxkuYO2aGeykikn7JqXRUreB24TO10oY9o+zk7xRZfTD1SIN1dTP
X-Gm-Message-State: AOJu0YxigpFY/sis57iBXHZMjJgbQMFYTBvUugCzwADS+te1fW9of4fn
 rjxRTAvE4C2nClmh3WgUoOK17H64ltrlk4e7gVA2dB8qnm/YTJXzYP9QMtlif/A=
X-Google-Smtp-Source: AGHT+IGMMMmICL3mibO+4e1/Qy4RQb1df6S7as4drSTw9qVUH8VTk4mQZRIsei13f4OmQ9lhypqjyA==
X-Received: by 2002:a2e:890e:0:b0:2ec:500c:b2d3 with SMTP id
 38308e7fff4ca-2ec56c6cbabmr5669221fa.2.1719093741652; 
 Sat, 22 Jun 2024 15:02:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:17 +0300
Subject: [PATCH v3 04/13] drm/msm/hdmi: drop clock frequency assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-4-8645a64cbd63@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/H9AIeRGXj1iPiMEVlXfEy/zaUhCvcXeyC4fw6d5vqM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0noU4Zk6ai+BqxKLQv+DuZB+HcLkitfG198w
 TKh43wQY+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6AAKCRCLPIo+Aiko
 1XFTCACCZWRtDa5j3veTt161Zzru2wbC1iIJaNc44Trwd8tq0lKZPNaJtAbeZFP22J2h8xrUaYp
 LT4OKi/B1z2c5RvUzdMh4lnE9mumYKIvvIndLML9nDw8b4Zykw1kSnJMS/aOk7QqZqRxnuZUhS/
 mzdPf07mi6DNoOsX1SMaIDRuCZG0Nprsl1+Vh0OGmzawZtVT5ysQtnvykWHr67OohWaJJ7afXqh
 aSNhYQILCJChPwf6hmk19Cgpg8cpFJsPcOeqIDSar+FkOdOjxzUSTUDAnBym5kh7swsh6Nt0KVy
 Ml6vk1OxPM86QTaOSHPgXlR9JqC/l8XWsNEfzLKpvxIYAN4V
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
index 3a65d82cedc7..9a39ad1847b9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -235,12 +235,10 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 1f8c5045a78c..14472b2d6229 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -94,7 +94,6 @@ struct hdmi_platform_config {
 
 	/* clks that need to be on for hpd: */
 	const char **hpd_clk_names;
-	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 9ce0ffa35417..7ae69b14e953 100644
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
2.39.2

