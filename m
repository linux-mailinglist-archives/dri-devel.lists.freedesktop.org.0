Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DB94FC66E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689B510F768;
	Mon, 11 Apr 2022 21:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2DA10F768
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 21:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649711571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n0gtWVG0aimnuoPQwNXoXZOG0mpWKStMnE3++TkqLKY=;
 b=RBMd6T4+h11LciY9mRZN7nd3ZtvIkbzFL6epoofm5E79Tyb2KkP6QItD+yrYniqvktEX0q
 c0DptXYipLrblvWANqzstqRjZTCPQztqc0iRe0IhtzWK3tA3nLVs1vgQ2a6lOnHm+sCQWz
 nn7zXQvoMAekOSJmnBEchN1UrYrfxuk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-uOJl2n5_ODOCpN5Hvd3PlA-1; Mon, 11 Apr 2022 17:12:50 -0400
X-MC-Unique: uOJl2n5_ODOCpN5Hvd3PlA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r127-20020a1c4485000000b0038eaca2b8c9so201511wma.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 14:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0gtWVG0aimnuoPQwNXoXZOG0mpWKStMnE3++TkqLKY=;
 b=Ph7ACurmcxeRJhj2tM7gycSbXOnFf3jem30viC+akq6UvJfjXy/KoOAI8aguZ9wQyZ
 PmQCxqnbv5wylWhhqTZIjGaiJcRMRD4yT1Q9kfeG82ay0D5ADAzKK3bmS4sk8Q0T/78C
 jwf0gXzdi8oPveY49yL5phc/vSAPhdEUu/kHfIooVBnyKwpkVw1/xWUA5zVYIWIokhHE
 xTTb1qvv25VI5FXnNvEGiFE0pLWRVSSkBwqKSNWbQCO0nhlJmzlbKq043ZJ/Sm34GrJa
 IgdANQGOM/YOTLqAGlSzocUvVQ+Q9d4xC0OtuJrpRh7u3ufcsnr8VFTWkLf2f864Y8me
 4jtA==
X-Gm-Message-State: AOAM530YJpPUr50lR8tErOUlBFVTYzgjFR1SczvMQdGEcb3vpwf1YL5P
 A0OF0uHTlRS3oJxxKIWw8vOuvqyzyv+oJH2GR1QApcossSuE1by0+Uq12UoIb/HLtSOrS9PEjuo
 XDmCpNvCpKXTnJ+rgwU6IqwWq2YR9
X-Received: by 2002:a05:600c:198f:b0:38c:a9e9:754a with SMTP id
 t15-20020a05600c198f00b0038ca9e9754amr985270wmq.146.1649711569454; 
 Mon, 11 Apr 2022 14:12:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIG64xz0G/zDMtKH809CxNshjqiDFUCpZN0F0DuF+gDgN8/smhV2a82KJnAYzO7uRz0AUIkA==
X-Received: by 2002:a05:600c:198f:b0:38c:a9e9:754a with SMTP id
 t15-20020a05600c198f00b0038ca9e9754amr985248wmq.146.1649711569194; 
 Mon, 11 Apr 2022 14:12:49 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a5d6d89000000b00203d62072c4sm28723722wrs.43.2022.04.11.14.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:12:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] drm/solomon: Add SSD130x OLED displays SPI support
Date: Mon, 11 Apr 2022 23:12:38 +0200
Message-Id: <20220411211243.11121-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series adds a ssd130x-spi driver that provides a 4-wire SPI transport
support for SSD130x OLED controllers that can be accessed through a SPI.

The driver is quite similar to existing ssd130x-i2c driver that is used by
I2C controllers, but there is a difference in the protocol used by SSD130x
depending on the transport used. The details are in patch #4 description.

Patch #1 just makes the current ssd130x-i2c compatible strings in the DT
binding to be deprecated, and add new ones that don't have an "fb-i2c".

Patch #2 extends the DT binding with the properties needed to support SPI.

Patch #3 adds the new compatible strings to the OF device ID table in the
ssd130x-i2c DRM driver and deprecate the old ones.

Patch #4 moves the device info for the different SSD130x variants from
the ssd130x-i2c transport driver to the ssd130x core driver.

Finally patch #5 adds the ssd130x-spi DRM driver for the OLED controllers
that come with a 4-wire SPI interface, instead of an I2C interface.

This is a v2 that addresses the issues pointed out in v1.

Best regards,
Javier

Changes in v2:
- Drop the -i2c suffixes from the compatible strings too (Geert Uytterhoeven).
- Don't add compatible strings with an "-spi" suffix (Geert Uytterhoeven).
- Drop ssd13x_variant_to_info() and just use the array index (Neil Armstrong).
- Add Mark Brown's Acked-by tag to all patches.

Javier Martinez Canillas (5):
  dt-bindings: display: ssd1307fb: Deprecate "-i2c" compatible strings
  dt-bindings: display: ssd1307fb: Extend schema for SPI controllers
  drm/solomon: Add ssd130x new compatible strings and deprecate old
    ones.
  drm/solomon: Move device info from ssd130x-i2c to the core driver
  drm/solomon: Add SSD130x OLED displays SPI support

 .../bindings/display/solomon,ssd1307fb.yaml   |  74 +++++--
 drivers/gpu/drm/solomon/Kconfig               |   9 +
 drivers/gpu/drm/solomon/Makefile              |   1 +
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |  64 +++---
 drivers/gpu/drm/solomon/ssd130x-spi.c         | 184 ++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.c             |  45 ++++-
 drivers/gpu/drm/solomon/ssd130x.h             |  12 ++
 7 files changed, 332 insertions(+), 57 deletions(-)
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-spi.c

-- 
2.35.1

