Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F0B0C184
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 12:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C4010E269;
	Mon, 21 Jul 2025 10:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nue9vDzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE6110E269
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 10:44:12 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-55a25635385so4843873e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753094650; x=1753699450; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MloNkOxsM+6t7pP0mYVWFSXRLps1DlPfl53Fxu1h82E=;
 b=Nue9vDzVqepZnv8WHDw7By+TP/QL+9if6AQvSzUeLOdCcuTdGYx/MWBR1+RrkQWF7/
 fdtDS49ZNd8iReZfAmTVEtlybi0RlMLXFDVqT+EVELr3neBOfOYhXiDXV/zslcK+lejP
 0TMCJeykwywuDulW3pesiK6QwurjrTkAJbZMpEH0RYMaTwLsuhQTb1Lj8WGpYMOOhkei
 oAaASY29+XIKex+aG5GQyHg4pJsG6N1CCeLIF/civ1Lnf0qCbbn7/ShA8BQgI9Ft5wT+
 7b1+fKHemGsc9TZuQIl4iKBeDiXJloAzdbK9gzN/VvYO8qw55pZRJWbLE9pKZ47MUdE0
 QpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753094650; x=1753699450;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MloNkOxsM+6t7pP0mYVWFSXRLps1DlPfl53Fxu1h82E=;
 b=lLvY8dwX2WqfG6PRyQeBfewkm+xTN6MsTCkR16J6Abzr8Sx28ASPtTowbJqNoVKu/k
 p1RKN46Lzp1JAwQG5LmpeAnEMZYzFLxxWM2uLPkCUwI4qTpsE02XvYPLTDKY/a+LdmZi
 4nsaciHnQIkxr/UKLWtNB0bKP1MUc5sgOOhDgeprIQCcO/+U9Kpiv2vX6h9UjdTXXu/m
 iewjvCCNifPZHwikyq+BdVXFCGwOgxbiy2Jrs3lIBPUNhxOFO4SPJMl1g1lQF61/SYNA
 wHBeU9ijmXLRl7ZFqdHR0ywruW8JxXfXic2iZQDlYWzlEDnP2qXFRvO6n8R4s+MRKg6o
 THTg==
X-Gm-Message-State: AOJu0Yyndn7cA9IS7nvUfYW/J2cvYftvAc/fRksaz3fjieFiYwjNeVk6
 ll0+mqhf5MN7OjCnZ9Ow0skFyYpqn3ok+svUuQNcTkDSf4cjCewPyxmL
X-Gm-Gg: ASbGncvPR1iGuRO5GBmVOTu9e/k55WTpETlqFZRXeW0UsJm1wez6Ykq+v0Yw8Jkc29e
 0aLGnc3HREMxe8OnbcVO7o/EkE+OVs6aspPNoJOt+bpHD80J7kaSCxAuOk8H5XoHZwks62Pj4TD
 1PPdJpoucQOtmSr22f/6OoaZKyhh8mlvonl1Rl/eiLaCufN/SHg9hWGTl7Rum2ctvoQIojd3Vo3
 DcCGIXSBpuneWCzI84xcD0/K9u8+HpIeE1KsQkO2cf9xM//usxb77Y5aziq6DINeJ6Lkp/02hja
 h8g8rPOFzw6dQ2SMwpx672orO8kJILtF1bjunKdqIVfP245YdPmKIfKp4HAda0AU0FlK+kIWrB0
 b64RrbDE3lSHXs/6PFJhdGyci4zAZMP1kWz8PTNRO7Agm567eHSixpTJ/JcfSmen/+y4=
X-Google-Smtp-Source: AGHT+IEaTLVSFdGKI+Xh6r3i/xROhu8qw2nQSim/N5dEd1SjI4SK+6UEvIHqBEAnpSME0bPwhkjASA==
X-Received: by 2002:a05:6512:3054:b0:555:61e:ca7e with SMTP id
 2adb3069b0e04-55a23300424mr6273856e87.10.1753094649919; 
 Mon, 21 Jul 2025 03:44:09 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31db89bbsm1505164e87.237.2025.07.21.03.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 03:44:08 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 0/6] drm/st7571-i2c: add support for grayscale xrgb8888
Date: Mon, 21 Jul 2025 12:43:30 +0200
Message-Id: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIZfmgC/13MQQ7CIBCF4as0sxYDk1KMK+9huqB0aCeRYqBpN
 A13F+vO5f+S9+2QKTFluDY7JNo4c1xq4KkBN9tlIsFjbUCJWmqUIq9GGyV8TMGuAh11gx1de3E
 d1M8zkefX4d372jPnNab3wW/qu/4ko9o/aVNCCouGtFI4WO9vU7D8OLsYoC+lfACAokjqqgAAA
 A==
X-Change-ID: 20250520-st7571-format-2ce6badc48c6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=CqXvKoIpv47+9Jo8IQqETyCXrvf0/tNJtdJBkk4iTms=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBofhnUYdvsOrhAWxNuyYe1ew+jZfPzZ5HsvXCsm
 cT6jJBh67OJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaH4Z1AAKCRCIgE5vWV1S
 MnQ+D/4xXxBUtCdOxdnnv1BsrNkNDNDdSuYB6TUb8xOO6EIB2oKUhrg59fICxw+6QMxZt7e2/cD
 fUg2KAODJc2MHYAansVBcSN0mXR3SgevWE4YYaP9GHg5ATwbOCBQGGypw6Ly8wuJCfG744saoNr
 FiACbUffA2ZAdxnmoM7rcZvg3rQyhA2MyuS4RhdJ4GatSN9HNkSXO/me3CSrwf8J0qBA8/fZ71D
 nHjHGxp2qJxDhANpBhGglvmo9+Y2bAMlsgLqkMQ4Z2xpMkBMjHdZZEjIySl++029bDJ8/hvjy3L
 6xyK8iih7pm81MbZ7YD4UGXPb8LEvqXEu8slSx3q6GL5vSoElRzHA3WhM0p1eI0qXg7zahbBWBn
 7Q6JGzh4CUmB+JhgDO0dWYEoseZZ+/bBuLQ95A7GSNhCvQTngWBMsT/8MPBut395flDUsC2KISf
 n+p/gnIfjRrDWpfFem6AFEWqrvDTPzTsh+XM+iPleluHs/HXLyU0rMtDL4aHkW0wSnokHR+2AHd
 GmzKVnjLY+v9nkiSjj4Lymt8njqv5M4AALOnjq8xjiQxe0Pbta7lQXVDdo0Ew2nM1U+ykV5gkmU
 PSMI3/ZPsN5az/Iv8KSoeYjq6gIaHKkMS83UnjqLSKMOoPZTQ7DLRuuWkqZKgWmb6yCK1OKfuN/
 4ArybFy4w6MnLdA==
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

The goal with this series is to add support for 2bit grayscale with
the xrgb8888 pixel format for the st7571 display controller.

The first patch only corrects a comment of the pixel format.

The next four patches adds support for inverting pixels. This is
necessary as the connected display may or may not use the "right" (0 =>
black, 1 => white) pixel format expected by the supported formats
(R1/R2/XRGB8888).

The fifth patch adds a helper function (drm_fb_xrgb8888_to_gray2) to
convert xrgb8888 to gray2.

The last path adds support for gray2 in the st7571 driver.
Compare the mono [1] and the gray2 [2] variants of our penguin.

[1] https://www.marcusfolkesson.se/gray2.png
[2] https://www.marcusfolkesson.se/xrgb8888.png

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Do not share code between _to_mono() and _to_gray2()
- Correct formatting (remove  "|") in the dt bindings
- Implement support for inverting pixels for st7567
- Link to v1: https://lore.kernel.org/r/20250714-st7571-format-v1-0-a27e5112baff@gmail.com

---
Marcus Folkesson (6):
      drm/st7571-i2c: correct pixel data format description
      dt-bindings: display: sitronix,st7571: add optional inverted property
      dt-bindings: display: sitronix,st7567: add optional inverted property
      drm/st7571-i2c: add support for inverted pixel format
      drm/format-helper: introduce drm_fb_xrgb8888_to_gray2()
      drm/st7571-i2c: add support for 2bit grayscale for XRGB8888

 .../bindings/display/sitronix,st7567.yaml          |   5 +
 .../bindings/display/sitronix,st7571.yaml          |   5 +
 drivers/gpu/drm/drm_format_helper.c                | 108 +++++++++++++++++++++
 drivers/gpu/drm/sitronix/st7571-i2c.c              |  41 ++++----
 include/drm/drm_format_helper.h                    |   4 +
 5 files changed, 144 insertions(+), 19 deletions(-)
---
base-commit: ca2a6abdaee43808034cdb218428d2ed85fd3db8
change-id: 20250520-st7571-format-2ce6badc48c6

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

