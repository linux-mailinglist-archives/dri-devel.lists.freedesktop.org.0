Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B084D913670
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1821F10EDED;
	Sat, 22 Jun 2024 22:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aby2zY1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D53710EDE2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:22 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so39012921fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093740; x=1719698540; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PaaD0TUxicSQ9bcBzddmbploW93tWtfw/qjS+oWjoTA=;
 b=aby2zY1csOOn/SGLPFaS2ePXM2M6KzjWOuugxTUdFFrzeRFWM+PSI5zDIwyapOMbiM
 ueRduHAtUY6oP4mspWzDegPLtkpYjALXQc7rElN4ewHJa0Y3cAKYF3sjEiJ9mGKYJLht
 gZ3t0vbc4N2N3zSpH/hnxeU9nYGTgUwCBHKy7NHwxdtygRa513az53lUDaf0EJvYQ+1z
 4QMPgE3JWWVg5tquRMZy1sTJqMa/RkynB5nVBy+O7SFKoe/AirMvy0FfvCTvR/BzrUZI
 sbT7fNiaPquzls0uF8hJWsEPn7q/LZY3pTle4GF0x2Ohx7em7QlT0syJfMDZ0HY/HVc9
 A5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093740; x=1719698540;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PaaD0TUxicSQ9bcBzddmbploW93tWtfw/qjS+oWjoTA=;
 b=lUbssyGnFA2wdq7+nQzkxMgnfFyFUc7z+g6Plvz5sxQqmrxfdRQ0fGJ3jovSZAUraC
 F920UfwV/uI68BUQlZ9T76DI2zN3a9G0DTbBj3ptTDQ9/orEoS+NXNO+Y/1NF8obF+0e
 i+k7Dzcqq5mQBKGTjRwJLpQ/m1h+xy0xAIfwmb5QOrJcYV7rgRMvBO4mOp0V0LQ/Ux1Q
 rwFTNsRrPjYDErqochUlc2uubc2R1rESR3EsZXR/mCekhFI49bOoQDrDyImRZ2r2Suil
 JUW5L9RK+c9TvFHLi9c3w/VEq9L2dD+rnSUqsKIXD18gIWs0UFbaXg0gTjOg0J1GiO0l
 wbvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqzioP0yLQtNIu8VtAwlJdKbKKpDo5inH7bhUO4C/UPKuIYiXGuUki35RvHA+t9ozeJnjhfZGGHf11g3T2RvXTgU5UZhV2IpQxJSwIzmCV
X-Gm-Message-State: AOJu0Yxy8B89Bv28zIBIRMWC2BKe7dmRzfvHAd2oySUG6JdsQ3evNIOf
 DuakVAoWWx0lbwZegXCq/0LVvfui1NYDd2kS/epnz7w/T6PRzrbV4LFsvWop/LE=
X-Google-Smtp-Source: AGHT+IH31u6dzIAuNw0VNvPZ2GqCzxLoG78KUvKhD6XvPjNqmtALsT04SfRsx1ap83ri/b4wewW5YQ==
X-Received: by 2002:a2e:3218:0:b0:2ec:5685:f06b with SMTP id
 38308e7fff4ca-2ec579837bamr11068451fa.27.1719093740178; 
 Sat, 22 Jun 2024 15:02:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:15 +0300
Subject: [PATCH v3 02/13] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-2-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h0lqf9slPd5eUxk6pPihIhSWYhdShDER4/lwQr5RwCE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1q554sXjVmrzHatz+7ke/5WkuGWZkd97RrOzMsB/A6ns
 nNcrB51MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiK9LZ/5n5inesrmwVuLDO
 W6HR11dVtny2II/Ft7CzSpG3pHf7lNnZcXv/3CrsuaRUprmtUs3mJZdH7ZPIOSd577cYtqlJ7/r
 Id/7WpIVspzOPzOZb9rUugdtzLdOmtge6eR9OOjXw1nHp9OuxJCyb3fKWU1HOtWfa4RNGu6M22y
 fkMk+IYDd8sed83ILEhoKdV7kM3WeqqvakCP4523vvy+G3K3d0BDfu1Zwzz3rn8iPzDrY9SGedp
 JC73+ay5m7vuuU6vu9DZfKvs7X1qzwxYAsNvtt0Sij2TsvGbFPTPUvbN6orqR9Y1tDOccq3ceLq
 Ho0HaQv2myd1bNg5Kczjvs23789+NjA+Or3OeX25zlYTAA==
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

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 8c6c9dffffd6..818c66efdfed 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -234,9 +234,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char *pwr_clk_names_8x74[] = {"extp"};
+static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.2

