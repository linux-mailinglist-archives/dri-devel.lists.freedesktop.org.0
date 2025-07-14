Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80D8B038A3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 10:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C72610E418;
	Mon, 14 Jul 2025 08:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xsqsx17g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE1710E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:04:36 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5551a770828so4014087e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 01:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752480274; x=1753085074; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C6t5fJRCHpoSZ7F8pJt3tQSM8oWBMiBs4n4p924ZYdk=;
 b=Xsqsx17gNYOWgqJJv3KbcRy44YQlkzbH3sk5zJFCakL8b7aZP1I46S3cSZAO6BhDjk
 5+1YrknU0dL3ieVJXdk6ZJL0nwbYVCMnlIJJ1uiJTZwnSC5VbiY5YcmFGdHF77d5xSp6
 B858JMmXEzbOZE7D8zF5FZSQx5qRNL0pnWg+FH6srJ3SAcFbElzDWD8HWuq2TZgiqhFe
 m2UotCYCdvuVbum0e7fuETIk1Iv9eYp4X9vT6rgFFksYmfDV2ygscpS7B2lwGQjN6zNr
 j38N0UqRbifdvLxGKBH9uEolC3QE6B+LPIlH9LxzwOO1cQeNkHfvVGLn1DOGDsoOcQ+g
 vI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752480274; x=1753085074;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C6t5fJRCHpoSZ7F8pJt3tQSM8oWBMiBs4n4p924ZYdk=;
 b=gonh3Qkv629Y1VsTFJXsyTcvPCF5YP7h5esJtpmTcaCQYzfqvxETuvjyTSNtJAUDGV
 xjKjhfuR7t7DvjwTt32SWF6oU0+4HJf7pFW+lArOozhTEijotbCSFWvNA37KzngJ/f6+
 /k7BYngwFIReXA14lO9EOhf229FH2LG/DQrD2QWIvWjKaeneoSgpr/Epbo78sy+yJbd6
 1ig+e/4tGl06+UHkRw1enTXqM/tvZ9pUZ7E6cvkQq7ZZmZ3SDSHEWJGEAKeKGnxtm/C7
 pLEhZ3tIfxt4CaSb5tR60WgQsg8y1YaQ/2yOVYy/TtYBUuO1Ag/yS6clVI4K4cEyjT/S
 +kJQ==
X-Gm-Message-State: AOJu0Yyr7ur+vCOHknYk5Bc9y6P2AdWDiGkuFU4AF912cP49ssipVRIO
 w4gUF/9SZqbQvcRfHmrAuI193OZl3DQa/F+7VN5fz9BM4xDXF0dW2sKn
X-Gm-Gg: ASbGncveER2jPTf4vJyr5lwGW14B6W9sP7G9mADT4t2Gci1dbysY/B5y9jgxbs3jcqG
 /89DeqzAoviRY9webAmrIo1qpboQgOPxpMW6kUAFHhm3PdxwPJjfsUz9eauafcrGBEjFQbDrhyZ
 Njh2dTOoGokKD+E6P0grbku53RLesL4DyhCY21nyX0dhh2lv5Pr/DYEAaKwVEIf40jUD9fOshz8
 yvVmJnLlPd7IXRJx9f5c7WAe2UOSrGqxs8eTcyGbCAivK5gqRq9/ra5s+rfufWrW4Smkz6hH4Pc
 imnbXp9Ct3tgCjTd2kVHt3HMh7N+3bD3DTGLkHZWfVxgV3v406tWH7G+DmcMyLJZuO5uBPWu4JE
 YG4zMqATGs4Sg2tCcBHEqrN+RAHnuM6uUYXlMgGuroUZewXBmO072laxMbHwB9w85zGQ=
X-Google-Smtp-Source: AGHT+IGO+3QtpME4CCrqHVYceKIs+EzxANjanQNgmj5QsH7D8grBIIDUPIbXCvr+3hhKeD3znxuUpw==
X-Received: by 2002:a05:6512:239c:b0:554:f9c5:6b3e with SMTP id
 2adb3069b0e04-55a046498e8mr3794634e87.41.1752480274141; 
 Mon, 14 Jul 2025 01:04:34 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b6c08esm1864385e87.187.2025.07.14.01.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 01:04:33 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 14 Jul 2025 10:03:59 +0200
Subject: [PATCH 1/5] drm/st7571-i2c: correct pixel data format description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-st7571-format-v1-1-a27e5112baff@gmail.com>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
In-Reply-To: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=X3ffU5ZPQL/iK6X7dL3NI0KO+0AZSsAr7S+Y6bShp/M=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBodLn2NLRJC7QmCcM48VdTkHlG7HKLR0Zzz7Ym3
 1TaJ9VTuz2JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaHS59gAKCRCIgE5vWV1S
 MluOEADQB0UdULY8BmNpIjqemT9VnYXMEdA6qIDFPHZZx0uqZXCwOZ2axoaN671SPYSwzAEF0AB
 3Vr1XZMvhG3YkHUxMEceZbc7pv2MvE1czli5gsrh4ckp+C9xpoatCbVfpAPcX8T794+/zF64W7d
 Sjo+nin4O87meWMd2Ydu0488b3b+HwyFOeqjweYkCH7gREvMfYbrHXRK+NTkCXBVyZiDSAFYBVp
 1Jq4CBN/sMwLnTMNpCh2UONgDXICZUBHZrzSpRJrBrq7NvD3GE6mSNARe6kU4wTfiThRQk0kDLL
 oBJriXF2L4skdu8Uhn92YgnXwQOpcNBjNwVJA4gomW/tBbKPxfA+SNXJK7i8k3jE7GsLqdvuBlI
 mbzEEh90o7/Y5eqeUHZwYQUEgh+HfpbmW5bprH2qN40AL113ppFnXzG6qP4SO3mHymMKV7oZQ9D
 xQlhEMT6JGEh5cCBkRplL2QWIowpZLAgNMrXj6Jq09Ab1mWePpr8fIRcUpZ8OC6V07UiREAs1Om
 WVnYdH29cwaisTOz9Mpv2BsG8u120tLnE6cALkjbYYCYng/QdJumP/oajR9lGTNQTXqZ4ty2pdr
 EiI7ogUVMDZpFX36AZTMJhSWHMG1JN3jhGbhtlo4WOJqYzDqLXn6cMdu0mrVxmROQ6D32c4dGgN
 ELSEbufM2TmTyZw==
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

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index eec846892962dce2d0b86c9c5c226d44135f2b0d..3024c94c890497d1ddbbf0f7f81ec4664f48d580 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -382,10 +382,10 @@ static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct dr
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

