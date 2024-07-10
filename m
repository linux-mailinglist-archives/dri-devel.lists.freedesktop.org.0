Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE692D70A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F24010E83D;
	Wed, 10 Jul 2024 17:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aKR4b3sq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD8D10E83D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:05:19 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4266f535e82so16275555e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720631117; x=1721235917; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S4NkoAIT77VT3upOcUYDgNo3eUGfA37eNUjC42fZIhc=;
 b=aKR4b3sqWs/ZSyTRE7BnDyKjPgSr/4JHvEc+wUEE5Zizx7tCDCXAgNlyF+dKS6GvVd
 VKq8x4RFIdeArqlp8IkdNYCkHqYHRCypPegIBOzISI/vi55+wcLZC2zNj6N8sg8Ws7oq
 Wat/u3pXuEIDs1LDx3ZN027/FQUWXGagg0SJLOwH7nBYhL1l9oTlzba/+hVReKsTi7RF
 BWB7rPAFcd23dArdlYImtHrPzw0yIdLxVX0ydyUhKUtC9JDc39zo2YftDP0/I6PBr3l9
 5ugpwUyLEBzkVZq5NgNqwRHVLEbp/WXaqaz2MMcYq5aivQGRxNy51KKV0eZ28wcVnYtR
 dOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720631117; x=1721235917;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4NkoAIT77VT3upOcUYDgNo3eUGfA37eNUjC42fZIhc=;
 b=pz3P1f6YBndJvJg6KZsa4JDg0hCSc3bwhmqNfV/MdFUSDxQezD9/unBdvb+3NfaHmX
 Aes+Ndsrkx3JayjNmpA9aasaOMgEiZ4pXk6/CFy2prHsT0rcu2u+53YSo7upZ7fhfLzk
 Vjetm9E5Gn7NVlHZ/eN+kDKZF8Lda71rCME1WpYLIFyDfHN1/Es//G/Hnj6j0+W3bi7L
 GvDPdndguc1uTqTL8kyLUjpErqZ2vUKvkYvHPvJiTtyA5/czhDhRDNCu2EDp/IdzKWaU
 SYeHsZMLwHtJ4vhDvR7IJfPsGbdlLN/AgsXG6zIscmUIndS0eN+j6U0zXQc5uvfBM//t
 Hpcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDXArNawY01GpUBj6+Ks35C/8EUQ8+YZiVfXpu4UTYWomh3MRqr15oEGfNm+ju56tWW2dnXL9iFTedh/fvrIwK2kHrIL+hHlN6QdcKQniM
X-Gm-Message-State: AOJu0YwTjaS/cFx3VCPs7EQ/Dn0gH8jaZk+l2KOLpdpVXvzxTuiiONq9
 q+zWuYIs/TMTk3rZDOzxGxc3iKXLvfo7KjX0cSj2yi9d9I0qlXPlLvt3fXZ2KtFxusLk7MneasD
 T7e353A==
X-Google-Smtp-Source: AGHT+IGkLUFSUmZ5ECS3GHwAe+MqsROrwZrfQE/I+tdJdPvxCPyYlWVxShiAik5dzVjABnYcvtZ7ZQ==
X-Received: by 2002:a05:600c:896:b0:426:5216:3254 with SMTP id
 5b1f17b1804b1-426708f1eebmr46866985e9.32.1720631117621; 
 Wed, 10 Jul 2024 10:05:17 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:65e6:93ca:5f80:ea9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7dedfsm5838446f8f.24.2024.07.10.10.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 10:05:17 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jul 2024 19:04:59 +0200
Subject: [PATCH 3/5] Revert "drm/panel-edp: Add SDC ATNA45AF01"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-x1e80100-crd-backlight-v1-3-eb242311a23e@linaro.org>
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
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

