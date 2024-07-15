Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C97A9313E4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 14:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BA510E36B;
	Mon, 15 Jul 2024 12:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BIwbcPuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F7010E374
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 12:16:09 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3680667d831so1511434f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721045768; x=1721650568; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kTq2r+cTBBf6PJ97371cfxGvOYB5A8cmvVmwB9VmmPg=;
 b=BIwbcPufWfrx+oex9hLyFn03CP+FFD8IDsCO2dW1M0qGNjdcVRQp34dv8s+B5vDunX
 GPQ6IwC5EEZGFZFRet65t7A8fZid71A/1+vhm4p0B4ocy7IXlY4hrlcX0YQibbufzWZW
 7aFz5I8bKD41ZZVStsuHHLCdJuHbUcMGbamZ52CvTAhZhkytDM8ZA2ManvW1g5KJyTlW
 4QUvI8Mo+9NWjAdO9b8Iu942WXGBwHI+Eu586kPmPxdVccJ8wLN2n9ANjym8Ufd2h48T
 Tl5W3OvITBZ9KIcxmgWOuMCNcOY6WoAm/dkQrABDdv7Jm7I+rdvLSmgp2J2xZMg4MtGk
 ffQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721045768; x=1721650568;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTq2r+cTBBf6PJ97371cfxGvOYB5A8cmvVmwB9VmmPg=;
 b=w3Cq9xoYe+D7kgKAwkvfckbif+JK57DYhcsO3ya4cPA3g1/HnFofffrNy4A272/IWq
 amSbCGvyH57RTMj5EJNuyUU/GR1jbHmxP0z6WiF7mdGxvdytkJE0DSODhcACS6ToiuTf
 Y3cXe/7d0p/rXlKtR88GZozf37hZN2k3I3ZEyauOMGLHNljKL89KehbeEsUxpxXx9itb
 Pu1qUiJ4MAzFwm3ZefpVtL/j0xaQ8iXRqW9f6zydYPXkOYWCmUCwUSimPyKwMBosn5Mo
 qlTGbDmWAF+B8w2+wvAU9Jw//a5/F9AOiuWjh5AgzbI7F+mOYnzvXOuKkxtxEt+KvlER
 TnKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmXjZeTsjd82ncr5En3iYCUGMt6lylqM1lLeKNO9zpmPfW4ca+4G9NOkmyCq/xVwvIP9/Bjohjr7BWF8HC1YwRXyjJA2KW8OgYlyLe5FaQ
X-Gm-Message-State: AOJu0YxNItyq4vHorqU5LzVnmRg1/2OGu/jFIIbaAFuE5QFBlgJVZU2y
 3YQRDBj1E+y8gZ4c0+DK0K6Yp6RXxiPSgfbg2kbOMQgYxaxOLapGIU7APNZLk7I=
X-Google-Smtp-Source: AGHT+IFs1erFYCijcBGp0SVQyMBvfH9pHBYbLhKOfck+AMcQPdS3cmXHK20l4yRwr/hKh+tKqHhBsQ==
X-Received: by 2002:a5d:480c:0:b0:364:6c08:b9b2 with SMTP id
 ffacd0b85a97d-367cead1d1amr10964785f8f.45.1721045767976; 
 Mon, 15 Jul 2024 05:16:07 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:886b:1a3a:7569:3d95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680d9771aasm6369201f8f.0.2024.07.15.05.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 05:16:07 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Jul 2024 14:15:40 +0200
Subject: [PATCH v2 4/4] arm64: defconfig: Add
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-x1e80100-crd-backlight-v2-4-31b7f2f658a3@linaro.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
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

This is needed for the display panel to work on the Qualcomm
sc7180-trogdor-homestar and x1e80100-crd.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d32fca64996..362df9390263 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -887,6 +887,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
+CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m

-- 
2.44.1

