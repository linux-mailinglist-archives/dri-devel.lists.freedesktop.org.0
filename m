Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED32EA9802D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 09:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A13610E1FF;
	Wed, 23 Apr 2025 07:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WhXQ+x2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A049810E1FF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:14:01 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-548409cd2a8so7870599e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 00:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745392440; x=1745997240; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YvyOldVjik2clEufX+t1ug+a06U2eyGh/2E+7k+qjeo=;
 b=WhXQ+x2foc3ic6qixPbjbqfggEsqg16DCm9tNjapo0rHVwK7kOgl/IJ0WVhECgo2sP
 X62Rxd8/QIVge/jeGkJX5WwJgiZ88uspUk9ah2ZiZjc5Bc8gzG6ZxTLCozd1vOjusU/9
 OsGRL0jqT0SXafppW1qkPCFJ2JTTT5LW7nmQoL76nqEQMte/nPrcegtiLtdUXJWGYaWK
 Fkvn5FaHLhWwlc/YnjC/oKx22GVcsS5uepIjo0UkdlUhW7UKKrJZHxUOQyX+YWSKFeJm
 D0NkPQBX5/cmhJGPd+PWFbJ+386D0YmqS1sgl+YGPEGDz/z9gGleZClu8h57rDtKbkA2
 0aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745392440; x=1745997240;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YvyOldVjik2clEufX+t1ug+a06U2eyGh/2E+7k+qjeo=;
 b=vVxcWvn5vPKehRFOOw4P8G7adiFTxS7SUnK/8oDcrSTzlitqmTXbtmXgPCdoJwQ9Sn
 JMrziJ+dKGMfbjpRruKdsEwbYao8zzUkhedC/llaW9ZeBmZQKzXggmkGBeZKrq/aZ1uj
 Z//UrB+EIq06vW2SMkYz6eLLwMnyC5Q7bMSWzxRXTyOZPgWg50LCdnmImdu87iUBZwfK
 +tdqJr3bjJuHsZqRk1Tgn0hT10RqvkeODEkYICb0824UqsHLdsLLDPn2Lgkxn+ptMmzJ
 66gqnGfb40bMJv28VbQkqydTRxsIHWmbzyiR6LKiirYlmQTGF9DcFieCMJFE77mNrvzp
 TaQg==
X-Gm-Message-State: AOJu0Yzi0kA5jcikaOUbAZBcgsVJvCVS5rm5P0UH9K1e3r0P2GEYpRY9
 hoTo9i8ejiKss8tE8kLGx1w+6X1VQ0ac+anAJsK7bGTYRnE6L9g9
X-Gm-Gg: ASbGncsJVbVZ773yn2jTkIUgV2sWCEwzxp0teHzLc+SGWZ5D4ksuX1Lv0A206DrlO5z
 hDNm3WAIG/x3E3z/cp0qqCKEed2VvQnP69+7tGLQPx9PUzdVPwubFPxevTsQEW7+P8Xr4V6N04V
 gr3uq0ehC3a7lY+haLmSGzLqmHZrEkrZsYn7NgAQmV9ZOA+8bdTnTC9A6rVZa4G2OSXhtGDIKIr
 +hD9DrP609Og7yvvGMkDb6SJOSZw0QCRRGDzmq8iJVqxdp4Eei3+VHLFBD18NjgtpI4NiIid7vW
 Nw5UWG5NrNY7gy0GGu1itfo7zNqbTq5ZZFxX9O1zAvRXQrAUhCO+V6Ob6Pmn5metZ6bghoqmsb9
 UDcG9/B0L
X-Google-Smtp-Source: AGHT+IEJ2dqO4sQOvwn1jc5hvRSw2WVFzIUOKoTI1g9tUZR21Xok3o4RsI9UbYwJ4A6sNAN6iFcu6Q==
X-Received: by 2002:a05:6512:ac3:b0:54b:e70:3658 with SMTP id
 2adb3069b0e04-54d6e615e52mr3463302e87.2.1745392439491; 
 Wed, 23 Apr 2025 00:13:59 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e524645sm1428793e87.41.2025.04.23.00.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 00:13:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v5 0/3] Add support for Sitronix ST7571 LCD controller
Date: Wed, 23 Apr 2025 09:13:32 +0200
Message-Id: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAByTCGgC/2XO3wqCMBiH4VuRHbfYX9066j6ig21+6iA1NpFCv
 PemoFgd/j72vGxCEYKHiC7ZhAKMPvq+S0OeMuQa09WAfZk2YoRJIgjFcShkQbHmilntKkd4hdL
 jZ4DKv9bQ7Z524+PQh/faHely3RJsS4wUE8wlLXOrAaww17o1/nF2fYuWxMiOTOyMJSZcoYxJH
 yjlH+NHpnbGE2OE5JpDBU4Wv0wcGJU7E4kpK522oKyBLzbP8wdvwX3tQQEAAA==
X-Change-ID: 20250401-st7571-9382b9cfc03f
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Thomas Zimmermann <tzimmrmann@suse.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=/9Pm/dETYjpbmvzlN7/wVga9a2QFFFVHsRT3VRnZTVM=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCJMi524WRfvrlcCxy5vIKcPaFcs2cO3q+qOb8
 8D4w6/n62aJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAiTIgAKCRCIgE5vWV1S
 MuMbD/0U9hwH53nNOtgDB3XxMW1YE68amsUwKCqIop8DQE+o7t0ooAEpEhU6yYN7HQd8noFgM5L
 E35m5BVNB2owIlaaBUD7P+sSdzR8VEcwowoRGruDfEDsol/v5XZMT4izgoUWTlI/GML/TVm9N/m
 x9GCZCHf4uPg0oXbTCwNecb5QICe+ON7UPXOwWEFeNum2xEMsxyy2rzO4anpJkOr6bkuRYv0cb+
 J3uE6tdf5WH+vc9yzf2rkCDluJT9hes44ZxUXDfwgzdz0i6U9B3pP6mufvbalkU3FNNKkUyZkb4
 RRNTuhbkyzZTLFSrkEBROmOiO0lP4u7JH4S2Zww5V8Hb0ckoDLhfM1qrWNeQuVUe6habIdkUEDm
 GHWPkCW4RLlMyjK8cjzR5/4BU0GvG8UJxy5i76+S15W5PQpwxCZn/9tvPQHiDj/+/pI1csON2iL
 4JfIG+yq3KRbfMndMooA8Sj11N1nUfA4MzeAptq6zsCLcZveV8ZqhjGdHQP9HUKPLsvAHtB5PXM
 9TOZLrMVJBilMPOmP1mwGax3+FisJGT9Ojd1yOyEtgWwpSJmtI8mz2Fdvpla/uyo6o0ZlN7zAtG
 vmM2rNiA96tzlktlNYmLGauH1SQEQ8EKxWakgjOOcrsR68kIK0tZQU18xgyB8tPg5Ke3o4MByip
 Gb7qNRa4ZI/jUXQ==
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

This series add support for the ST7571 LCD Controller.
It is a 4 gray scale dot matrix LCD controller that supports several
interfaces such as SPI, I2C and a 8bit parallell port.
The controlelr supports both monochrome and grayscale displays.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

The device is a little defiant, it tends to NAK some commands, but all
commands takes effect, hence the I2C_M_IGNORE_NAK flag.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v5:
- Use bitfield macros where appropriate
- Add comments where needed
- Link to v4: https://lore.kernel.org/r/20250415-st7571-v4-0-8b5c9be8bae7@gmail.com

Changes in v4:
- (dt-binding) Add sitronix,grayscale property
- Describe why ignore_nack may be needed
- Make drm_to_st7571 an inline function
- Add support to clear screen
- Change from C2 to R2
- Add support for XRGB8888
- Use dev_err_probe() where appropriate
- Make Kconfig config depend on MMU
- Introduce device data to prepare for support for other chips
- Add support for drm_encoder_helper_funcs.atomic_en(dis)able
- Link to v3: https://lore.kernel.org/r/20250408-st7571-v3-0-200693efec57@gmail.com

Changes in v3:
- (dt-binding) Use 'Controller' rather than 'Panel' in texts
- (dt-binding) Constrain the reg property
- (dt-binding) Remove panel-timing description
- (dt-binding) Change description
- Mostly cosmetic changes in the driver code
- Don't call drm_atomic_helper_shutdown() in remove()
- Link to v2: https://lore.kernel.org/r/20250404-st7571-v2-0-4c78aab9cd5a@gmail.com

Changes in v2:
- Reworked pretty much the whole driver to not use obsolete code.
- Use panel and timing bindings to specify resolution and panel size
- Link to v1: https://lore.kernel.org/r/20250402-st7571-v1-0-351d6b9eeb4a@gmail.com

---
Marcus Folkesson (3):
      dt-bindings: display: Add Sitronix ST7571 LCD Controller
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add entry for Sitronix ST7571 LCD Controller

 .../bindings/display/sitronix,st7571.yaml          |   73 ++
 MAINTAINERS                                        |    6 +
 drivers/gpu/drm/tiny/Kconfig                       |   11 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 1007 ++++++++++++++++++++
 5 files changed, 1098 insertions(+)
---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

