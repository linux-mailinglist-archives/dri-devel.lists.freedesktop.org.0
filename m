Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB100B26093
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B30210E82B;
	Thu, 14 Aug 2025 09:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="po/6dNJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D8110E828
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:18:20 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45a1ac7c066so4619855e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755163099; x=1755767899; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZAaDT/OUbXmcuIyI0UD5MRIk/4NCc8MDaMt6MhGlz8c=;
 b=po/6dNJ/2sYRtdOJghgcDohcLJVUYoEs0cGf64zsLj1Vnguya/o72gJhwvUgQitRbh
 TsoAYIBolmItZdS1MiE9wIvtLD6QQO5aSkrFWiLJ6pfVEvcrPaZoJLDa1NEC1kbLhZnl
 g3LMj9zpVLq/No8MpDaZRph33wHRCNyNM6ciKmwK0BfRE+lusQWJhibREDJgf3oo+L/v
 rZR2xFeu0giyJR06hB05a2LkTazoivYQWQQdRKPyEx+HisnAKkzI8BcFPIPoIPpJ7FJX
 o8PI0r4ejXTigaGXkXGjcE/1xjaPP3OSvNDsjM7FEYrVb2u6Sx8Ao+wH50HVHJJgKss4
 8EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163099; x=1755767899;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZAaDT/OUbXmcuIyI0UD5MRIk/4NCc8MDaMt6MhGlz8c=;
 b=K0nLII5XCfIfdPtz2YyXZMcCjPJC2P6kD7x5JVmDoDpFwS8iTizd8o5lHD2p2yd9K5
 uiuMRKg6gSdx1S718ymd/gv3zlUrAGCMId+m6BM0MoIA0//UjlPxjODm79eN8KuvkykX
 zbH2ODxu+XbcFdXzKhuQw44TwQ3O11gPVWP5sGqPw3Mr5qRJdHd64u1UrA4LxwV0vnwb
 aZnyIxqpxYihYdxaB0sYpIaI/qDNziI0HD3Z2/wN5f01Y1UBm9xj3ClNrssiCXua7Y/i
 F7zkZgU4A67qoARdPeE2qLFEiOU37cjRpylIVYc1kt4ej+yr2Di7zoiN7ohoI5SHebyR
 Y1Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU70n1NZptx271imPMQXP0G/i1MJfnlA9vFGhW14vRfLjoKE1Jh0Xfm1F/nzP5NtFVCt/oJaSSK08U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqikkRQtrVqTEpBtOssJafT2TaYuh1Ujo6GeBAX1a6vPynDpF3
 jGseOuks6wh1dy3GltugcBPIP9wyVbWAHWTmAvABxzawdM6kHmWSJw115IXViUbuiuI=
X-Gm-Gg: ASbGncuwbeULe9C/uimyP5A+CEDozmB4f5pISm9Nm76BHmmoNruDIXTbWQX1LWSvgg1
 rMIHmJLgSK5szGHuQfl/vDXGvuo8J1aik46OGeYCqibrNlu1ZNscRHoQTQywE5klAaKqMXcRI2q
 n673oq0saVbdBU5KkYULBuxYsLGgU4H34Om/fFlzfl1gszzAoQ44ixft9MfVDSwU/aPCk3GFwXn
 uxw9FHjfycDULu+ZfsTdA98siHttbGbo2roFAEQMihxR1pzMz5H3GP9J8JTleIYTMKYb1RTQUxq
 s8r0P6ry9ZoJ2qVZ4x3Y85Sxm7AiQurdUDCoVWbzTQnshzRcQPVqufKcmgkZ8KmzRlZfgpp1D3b
 gIVMBTuXxQWVsQP3L/8WvWMBPJI5mfz8qclag
X-Google-Smtp-Source: AGHT+IEja8CLfTSNlKR5f4WfpXSN4rOwyS5Xo1KeZ5Yr/TOyUiNzdSQo50qDF7mxVImYpzfwRhB+ZA==
X-Received: by 2002:a05:600c:3503:b0:456:ed3:a488 with SMTP id
 5b1f17b1804b1-45a1b78645emr16883635e9.1.1755163098783; 
 Thu, 14 Aug 2025 02:18:18 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:ea13:2485:4711:708])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c74876csm13861925e9.14.2025.08.14.02.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:18:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 11:18:06 +0200
Subject: [PATCH 1/2] driver core: platform: Add option to skip/delay
 applying clock defaults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-platform-delay-clk-defaults-v1-1-4aae5b33512f@linaro.org>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
In-Reply-To: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
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

Currently, the platform driver core always calls of_clk_set_defaults()
before calling the driver probe() function. This will apply any
"assigned-clock-parents" and "assigned-clock-rates" specified in the device
tree. However, in some situations, these defaults cannot be safely applied
before the driver has performed some early initialization. Otherwise, the
clock operations might fail or the device could malfunction.

Add a "driver_managed_clk_defaults" option to the platform_driver struct,
similar to the existing "driver_managed_dma" option. If this option is set,
applying the clock defaults is skipped in the platform driver core and the
driver must do this itself when ready.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/base/platform.c         | 8 +++++---
 include/linux/platform_device.h | 6 ++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 09450349cf32364bcb3c8dd94023406442ec204d..c7278ace71d3f6d473fdea35bf79bcf80a56ee21 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1392,9 +1392,11 @@ static int platform_probe(struct device *_dev)
 	if (unlikely(drv->probe == platform_probe_fail))
 		return -ENXIO;
 
-	ret = of_clk_set_defaults(_dev->of_node, false);
-	if (ret < 0)
-		return ret;
+	if (!drv->driver_managed_clk_defaults) {
+		ret = of_clk_set_defaults(_dev->of_node, false);
+		if (ret < 0)
+			return ret;
+	}
 
 	ret = dev_pm_domain_attach(_dev, PD_FLAG_ATTACH_POWER_ON |
 					 PD_FLAG_DETACH_POWER_OFF);
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 074754c23d330c9a099e20eecfeb6cbd5025e04f..fa561dae2f106b61d868a870e10d9656542b1c7e 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -250,6 +250,12 @@ struct platform_driver {
 	 * to setup and manage their own I/O address space.
 	 */
 	bool driver_managed_dma;
+	/*
+	 * Skip calling of_clk_set_defaults() before calling the probe function.
+	 * Use this if the driver needs to perform some initialization before
+	 * clock defaults (parent, rates) are applied.
+	 */
+	bool driver_managed_clk_defaults;
 };
 
 #define to_platform_driver(drv)	(container_of((drv), struct platform_driver, \

-- 
2.50.1

