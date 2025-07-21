Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56F9B0C186
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 12:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D95610E4D2;
	Mon, 21 Jul 2025 10:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bWb6UFkx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D3710E269
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 10:44:13 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-553c31542b1so3637123e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753094651; x=1753699451; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uZgi0IGCTQu+xFbtpDGEBKVDI7Gw2v7i+CZyebbbBrc=;
 b=bWb6UFkx9XIyhK/NU0lR7cZUb6kkSO9KeEqMbQfszmDOMc3ncPBehXT9q2hkrtWj/4
 SotTNowM3syMhoSBWRtCy3hM+qU0M36OzUsJ8WawvPEwkKGMku3ZIE3WnpKC+s3wwWz6
 tGQl9qmimbV/iQ57eubCDrzdHf61+S3G4pQf9eyYNKkkJ7qWnh9aoV3Krv9Joi2nZZMe
 D7hllTlBNjqpQNxdaxhCWgo33BnRz3rBPKCiLu5lgTweHFeH3Tfu2bJ2Qs21zGrbtoD9
 +kcADnrQGiKMOzCaNy0yv/kvNVaV154A+MLYTH5FVI0XfcNjWpFMTgZ7NUUxeKwlznYk
 p5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753094651; x=1753699451;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZgi0IGCTQu+xFbtpDGEBKVDI7Gw2v7i+CZyebbbBrc=;
 b=Axwc7lPZ5bEJRXoOLVllhz9877pcGBBdIZ47WFM2gExh5WxP4v0TknWksg0TP/XGgh
 eIZ/rtIQWPXQNZG3ZMeVr3XsUMgCMcXXvBkvI2tJOrSTsNE2T92vnop6NwenPuP6HnB0
 o0Hbvo0+yhmMz7lNVOpInEUEIC3yCLDh+1+9vyGVphvfkK03NvZF3JqU7yp2SGfryE/W
 Wu5HRl7xNz3Kq/Cds685kUE86ZDMHMqNhfCL1pLcETIPzIl0BUYXSI9OVdMZ8na/IgO4
 PkR4az4XnBqne+extsjiW7Au0QRZRQQMY3TLV/Gy5RK3mhYQzFVOnJFiLjpji4Z084Vu
 6uDQ==
X-Gm-Message-State: AOJu0YwNqEtfLXML37LeKDkRUACKGnwSWS9Jst0n+8uT5MWaU8Bj9xkV
 0gtZt/2yS8ZW6yMiX+30l1Uz4xLKZtqJt5GywTFNcH5hY0OBhNhmEOsI
X-Gm-Gg: ASbGncvdRFAfAWhR+tguXIz64K8A3oVMVV7wieS8CMA9GgFLk+Y+3Gumw1lEc0ecmVD
 +pg5jSh5TLycatR0qcZnncXMsCKkOtLeti4E9cr2Mjqg8I59PLvOly8dqfxxAeqPCGc2psqjxGm
 wufqSLaDcfB09diHVCB9M/sanzGB9oi/aXlvOukrVPx9dOLcV1NQ41p8mK0T8x389RTfmRru3fx
 tmeh8mGK7rzORP/HjlCka7ktS8l5WTYiqnuL2BKetcKYsddmWMn+s37m4YboAoiank5KgAPSPl9
 GIA5nhiAUGjjtgrdL463MGI6PLnlV4ytGznN7RUjygm8ulJG2ypRrR/eefH6cYUBwBW6gncf/cv
 67L7WT9GHQQRS+2Enpq+CfH46cmhhiftyRWCMCZ7xpgqYISYCppzDhIYC0qsMU/AxAg462ovvah
 trWA==
X-Google-Smtp-Source: AGHT+IGuVsyJ1VoNtlX4uZdFa9de1M9socYdCeEuJ0l7LOrUdQ47lJmy6BhpBpxRED+In30jMQumsg==
X-Received: by 2002:ac2:54a5:0:b0:554:f9cc:bea5 with SMTP id
 2adb3069b0e04-55a23f56157mr4445936e87.34.1753094651264; 
 Mon, 21 Jul 2025 03:44:11 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31db89bbsm1505164e87.237.2025.07.21.03.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 03:44:10 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 21 Jul 2025 12:43:31 +0200
Subject: [PATCH v2 1/6] drm/st7571-i2c: correct pixel data format description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-st7571-format-v2-1-159f4134098c@gmail.com>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
In-Reply-To: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=IBvWsfd1qdqQU3Rg1nmav2yYeSIn047JyVePtD2ctPQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBofhnZ77JL3v/9CnCts1MBF/beUtSWOM1Zx4r1l
 WDEMf69H3WJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaH4Z2QAKCRCIgE5vWV1S
 MrlOD/9190vl9+6uV8EbrJXDTugXGNXbo9Brq3oO8as6X3Q4KC7xtF+xgG2OZH6mpLq3BSlHo31
 jUWRusoZ9g8IERx42w8TWzIwxa+ukcZh8s+6bmw8pTG7yka0FhiH0e5TrSx0qADksGtEENVYFff
 9GSBsOAnzQPmMZCkk0UpIUFZ3OL8B8pr59zznppEr6eSMEjm+fdXCvPHDm7AGARnDm5dzIOn7UE
 EL6ZOfndlLePFOzp+jGv1nqXC1MI9f0sI/s46wM2EEbQUQ4N2AG41Oxg1l8u0N9FwfASN1nqOlT
 uMu8fq2YRa8ukI/AAeZKHNwbiau7tXIJqZE2d8uVA9Lm6OwqLL2RafZRyOZTOs2zCSCB3JPKP+B
 idXkuval3ZKCoRvUJxqRYLFm0VVvRA2gB8scZW7JrIKsVlZU44V5S28vL3JHshVrexBlaaYhdoT
 vuGMAeoTu6Pyi2U8AfGviPG46PlvD0puZ5KTL44i4BYKNpyyDRjPuAojSTARcYx4r6FxcsMMRku
 G1I2B5tEuDkhRPon9G017rsMB0UQ83Upgix82n4TM0Esr4G7DNNx8dAzknIrOfeREBRZT39ijf9
 /dNjrhOxeX9qU+j1pdnYIPpiUJ/pWqxhmPH9IVcwadzlBX4MAGeKp8yAebrxQH+tXoIpIMjzujv
 ka3cu8FDVHlWz/A==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

The comment describes the pixel data format as stated in
the st7571 datasheet, which is not necessary the same
as for the connected display.

Instead, describe the expected pixel data format which is used for
R1/R2/XRGB8888.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 453eb7e045e5fb5942720d6020b6279a4b7315d7..dfdd0fa4ff24090c3cbe7ab162285be45464d6a6 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -386,10 +386,10 @@ static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct dr
 			 * even if the format is monochrome.
 			 *
 			 * The bit values maps to the following grayscale:
-			 * 0 0 = White
-			 * 0 1 = Light gray
-			 * 1 0 = Dark gray
-			 * 1 1 = Black
+			 * 0 0 = Black
+			 * 0 1 = Dark gray
+			 * 1 0 = Light gray
+			 * 1 1 = White
 			 *
 			 * For monochrome formats, write the same value twice to get
 			 * either a black or white pixel.

-- 
2.49.0

