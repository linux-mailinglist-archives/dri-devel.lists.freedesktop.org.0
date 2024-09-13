Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EB8978370
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C05210ED29;
	Fri, 13 Sep 2024 15:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XxK9RIMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D82310ED26
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:08:34 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so3118163e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240112; x=1726844912; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8BuVtWnpggbksGVD/tDL66cKkJqocyp8CAEvr9d7e9Y=;
 b=XxK9RIMxQO08NIiiFCoLjYGF2noQcEK9rGLVjXXBHSVnFT2sggcZ1lr4MU/yUW0hQA
 Wts7WxlvHyhI8YgGWFETd+rtYK0/xpk9MbGiB6DceZivXei2nOx08mU9WPAdZsDI9U4e
 07tH03DI+jX6MG2cwIoiTmxuWv/f9dGMEdZq452Ejue/omkuF6mQM0N2Y3givcyoco8Q
 GtSe3woFNkona7xCrn4rnB+35zhJu2GrpoaVEe/BdNVNIFRj1e6Vu8sAcEle9nHpx5SS
 clcQJGjYruXw9N9X1mZPXznsP0OjF8tNowduUmwV2Klt+QLdXr+WmtcNfUtVychp/9/x
 za/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240112; x=1726844912;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BuVtWnpggbksGVD/tDL66cKkJqocyp8CAEvr9d7e9Y=;
 b=iT6F3hzLEyO8EsszNf+84B1S16KZNuLt5vJqpKMS0PHn/wYq4/EFbAQRix75MmPNJz
 l5HEJT9LRhWOR1d9hsUBQANAC9uKFQSbT2P3bpBWYB7LZKq1sdQndano1dfxiHc6TBUS
 3C4CC1eTnMM7QsYRkGL3nfNeYuS231R7GmhkQG44+b/xKDApilE/BzVmvlr3RidLnjOO
 P49v3SuN3oi28oeGmocyRWtl8D6vZiFivmXYIyKXACkCzL8fYQbff90UQVhNs1aEkM5+
 0kIaAscwO3ITS1weuLwYbunH8IqInV0bbky4vMeDbmQfS7lFUxdPOiiIqfVHlJPjXBBc
 dMQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl+1vbZV0M3zDAJ4/cC9gD/s4UNprNQmIDNXWF5n7L01kQ1iIrqcmjJ7AezlawFTc02Xqwh/bzu50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ1kWdkaLnAu5Vc898YNH8MUiDzTg6iJPFSnLXp9wB5BlE9b7D
 YZdLNRlYnvmJ52u0L025kJC8iIUnhUoY876C5Bl9JDgc6KLLqoiz
X-Google-Smtp-Source: AGHT+IGBKNI5Hw0ejr5wTOAzZqko2ncnm/G9BUpWyWRp3+NQpm58mdiYixmrMFyeIHbkPTwNF5f3Wg==
X-Received: by 2002:a05:6512:68b:b0:52e:fa6b:e54a with SMTP id
 2adb3069b0e04-53678fbfb2amr4385322e87.30.1726240112063; 
 Fri, 13 Sep 2024 08:08:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:31 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:07:51 +0300
Subject: [PATCH v4 08/27] mfd: max77693: remove unused declarations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-8-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=843;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=Q8zEcsu3xOThAfReNawr2bCrmNcwrVa7H+TfC8M0RIc=;
 b=hHjznQFMl889U4wkRvgPP0WBxOZ7LgBMxuxxVVaN/drKPz4Plhs+ojQQwSc3eNGaDacxx6Sgd
 TwJoYxSmM4jAg5/qwfRAJ9HCAywMGmtxGmC6O86muRBVykLfkbnswIs
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

Remove `enum max77693_irq_source` declaration because unused.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 include/linux/mfd/max77693-private.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/include/linux/mfd/max77693-private.h b/include/linux/mfd/max77693-private.h
index 20c5e02ed9da..c324d548619e 100644
--- a/include/linux/mfd/max77693-private.h
+++ b/include/linux/mfd/max77693-private.h
@@ -419,17 +419,6 @@ enum max77693_haptic_reg {
 #define MAX77693_CONFIG2_MEN            6
 #define MAX77693_CONFIG2_HTYP           5
 
-enum max77693_irq_source {
-	LED_INT = 0,
-	TOPSYS_INT,
-	CHG_INT,
-	MUIC_INT1,
-	MUIC_INT2,
-	MUIC_INT3,
-
-	MAX77693_IRQ_GROUP_NR,
-};
-
 #define SRC_IRQ_CHARGER			BIT(0)
 #define SRC_IRQ_TOP			BIT(1)
 #define SRC_IRQ_FLASH			BIT(2)

-- 
2.39.2

