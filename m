Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404DC9313DB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 14:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0BA10E36C;
	Mon, 15 Jul 2024 12:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cWJ/ZweM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B2E10E36F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 12:16:08 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4265c2b602aso28002165e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721045766; x=1721650566; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C4zewyPEhlNFFIG7IewHHr+zZpf0Zw7H1PjOS7/qftA=;
 b=cWJ/ZweMI4BOrfZXBEFnt7y/tHKfnTX4JoxiKGoySnif8ennKc9mTHMP/ULtdcQ4e0
 jMWIfiFseCaDJ/0NgJlbIr1jyJ1Kjkn7fTSlxxbhcdbQKuvEZ8MV8KwV+0lGBrSvUQvl
 2t8dLivcVFqUkNqF45ydZ+HdQFOPE2Eloq4X2wzE0b7TrcBiOxPiAsISk3k9Z8TEj6/6
 WXx9doaWbF3rkH0ihHMf1jzTeZP/vFV4S4aY3fHA80hcFhNpc4BEURLvT31L54j/vu05
 4V9jO3wRE65iyoDjf8krNo99q3X/HujLYezquzmoKFu+V6kBPbCeeQ6CEI/CPD19/C/A
 6Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721045766; x=1721650566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C4zewyPEhlNFFIG7IewHHr+zZpf0Zw7H1PjOS7/qftA=;
 b=WV8Y/ogmxqATx8jKnbAX+Wu0duIuvc4U7kKv8tzauNWx+Y7YfOIG6r0URLJz6F7e5r
 FE5j4o7tn2ozGHs2Z/HxS4Te565LYHJ1KZGwPA3JCNxTFvYv1lKHASnXj0i8OvZOpPZ3
 8E07k5xrrBqX+d6B/Fm/dnfpIzjiI2yQvAYpPmSNWQ+6wEQIEbZG645trEQbogRCLHzQ
 CI7JSM/Y30Vdy0fY5EMz/nFwynAUdV2ZMLySj/EjZAWAuCBdh8/wXx00ug8OQ2gI30pA
 2GHmQ8Ig2ucahg/HFLMm6HradWMFh2eAJyRSCZ4WJJg7xJtmdZFMrJwMVmiVQSjL/lNT
 y+iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKz71C3qqCJCMm68FWf4eTfSOP0q9bxZQSIq6gubIXWvIVkASgO575FyHPURrN4GlrHuSFjoQFWzHEpizpIsy1aS3zu26zfNDr7s1dKBHR
X-Gm-Message-State: AOJu0YxOwJYEElrycUoXqV6M/rIewftXnqOsmLR5FUrvJi/5NKjHGMzA
 JeRBPszB9g7Oklew7XprfjFa9NtwLMayiGZm9prfs7zTpAuQ/5feYu5wY2EBIMg2j8yVpBq47t9
 yKWCt8Q==
X-Google-Smtp-Source: AGHT+IE1hOML28f+XraJzEd8SFOSIj91LonNL45CkfZTFsChgS0t1o51jq4Yctj5be3mCBmPsTXBdQ==
X-Received: by 2002:adf:ffcd:0:b0:367:9791:2939 with SMTP id
 ffacd0b85a97d-367cea6b804mr11785800f8f.21.1721045766633; 
 Mon, 15 Jul 2024 05:16:06 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:886b:1a3a:7569:3d95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680d9771aasm6369201f8f.0.2024.07.15.05.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 05:16:06 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Jul 2024 14:15:38 +0200
Subject: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
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

This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.

The panel should be handled through the samsung-atna33xc20 driver for
correct power up timings. Otherwise the backlight does not work correctly.

We have existing users of this panel through the generic "edp-panel"
compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
partially in that configuration: It works after boot but once the screen
gets disabled it does not turn on again until after reboot. It behaves the
same way with the default "conservative" timings, so we might as well drop
the configuration from the panel-edp driver. That way, users with old DTBs
will get a warning and can move to the new driver.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3a574a9b46e7..d2d682385e89 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
 
-	EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
-
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),

-- 
2.44.1

