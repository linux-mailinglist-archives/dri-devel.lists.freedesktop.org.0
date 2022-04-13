Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834DC4FFB2E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 18:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F248110E690;
	Wed, 13 Apr 2022 16:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC0110E690
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9+iMkpFEjyk1AZtVXTOzqrt48AoAHLCVKi3QKP08JqE=;
 b=JLw8sDZSuxba9pHiGUCnR3WNeQGw11LtjlHnuQbDrcX/LRGCb6/rnhVT4IKZE4413rPsSS
 7iaH/OWPFav3bCstLzL5wgg+TEBUXYrr68Q1ccY5wW3e8wZ7Nxy7wyZ3WIr5KBldPeu1fC
 zksZorl+Rduy1C6TOHgE41EBF0zYlNc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-GgVri00AMayJ0mX1I7K23Q-1; Wed, 13 Apr 2022 12:24:20 -0400
X-MC-Unique: GgVri00AMayJ0mX1I7K23Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso3037603wma.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+iMkpFEjyk1AZtVXTOzqrt48AoAHLCVKi3QKP08JqE=;
 b=2rfZ9phTT8fU6qKcghkPyRf2gidQdU0ctKwCmtssH9mf0wrQMtrx4+m02YK++Sz0/A
 srVPRjCBUqBDYHBonDnkOzKGybyMmDERVcMjl2b9QmEo8h90p5UTBIaut3bPvL/j5bMm
 TZtgnKJ90otpext/z9svNQnUI0QbcOVe1j0Jh2DBoWuxvbTZ4iPArpQhwfBe7CTN67gV
 CssMv9Szp8BwHXQ7d6sHinJC3cgIJBXLykyg2h8Teo297DWz20y1vkKH+deEOad9WLye
 vkV3EzE0rms3uGkgN9szjQJ2hmUTpoBA84noMmqSPm6VkPFTQYOhkvwaSpaemRbcnUpp
 lq8A==
X-Gm-Message-State: AOAM532LhA11KYCyRvE9kBlBsqhUtwvQEAEKR9rbmbUiCsgiUHpEDnts
 W8+F69FZdijYl8wEGo57vAoV0/zOKCiu8//q3Vfm2RXV0c9B8ZSW0Ez5nGYXv7cfypQGpWIyZBW
 m5EuhO9/y+1gSkhJXnO7auvFhApml
X-Received: by 2002:a05:600c:2744:b0:38e:b6f7:d548 with SMTP id
 4-20020a05600c274400b0038eb6f7d548mr9395323wmw.49.1649867059228; 
 Wed, 13 Apr 2022 09:24:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwqGxQDzVECdH3ZUuCtLW9dxuvadtDdmYHzpNw2mfwNWoXu5bqtIEYbN/8mZRxCF6rsLOxRQ==
X-Received: by 2002:a05:600c:2744:b0:38e:b6f7:d548 with SMTP id
 4-20020a05600c274400b0038eb6f7d548mr9395298wmw.49.1649867058909; 
 Wed, 13 Apr 2022 09:24:18 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfa2c9000000b002061561d4a7sm25446096wra.96.2022.04.13.09.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 09:24:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] drm/solomon: Add SSD130x OLED displays SPI support
Date: Wed, 13 Apr 2022 18:23:53 +0200
Message-Id: <20220413162359.325021-1-javierm@redhat.com>
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
support for SSD130x OLED controllers that can be accessed over a SPI bus.

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

This is a v4 that addresses the issues pointed out in v3.

Best regards,
Javier

Changes in v4:
- Add a description for the dc-gpios property for SPI (Geert Uytterhoeven)
- Export ssd13x_variants array using EXPORT_SYMBOL_NS_GPL() (Andy Shevchenko)
- Use MODULE_IMPORT_NS(DRM_SSD130X) in the ssd130x-i2c driver (Andy Shevchenko)
- Use MODULE_IMPORT_NS(DRM_SSD130X) in the ssd130x-spi driver (Andy Shevchenko)

Changes in v3:
- Drop the "sinowealth,sh1106-i2c", wasn't in a released version (Chen-Yu Tsai)
- Continue enforcing required properties for deprecated strings (Maxime Ripard)
- Add a comment to the properties required for SPI (Geert Uytterhoeven)
- Drop the "sinowealth,sh1106-i2c", wasn't in a released version (Chen-Yu Tsai)
- s/it/they in the commit description (Geert Uytterhoeven)
- Drop unnecessary blank line (Geert Uytterhoeven)
- Export variants array and use &info[ID] in device table (Andy Shevchenko)
- Drop ssd130x_spi_get_dc() helper and open code it (Geert Uytterhoeven)
- Export variants array and use &info[ID] in device table (Andy Shevchenko)
- Add Geert Uytterhoeven's Reviewed-by tag to patches.

Changes in v2:
- Drop the -i2c suffixes from the compatible strings too (Geert Uytterhoeven)
- Don't add compatible strings with an "-spi" suffix (Geert Uytterhoeven)
- Use the compatible strings that don't have "fb-i2c" (Geert Uytterhoeven).
- Drop ssd13x_variant_to_info() and just use the array index (Neil Armstrong).
- Add the same compatible strings than I2C (Geert Uytterhoeven)
- Add Mark Brown's Acked-by tag to all patches.

Javier Martinez Canillas (5):
  dt-bindings: display: ssd1307fb: Deprecate "-i2c" compatible strings
  dt-bindings: display: ssd1307fb: Extend schema for SPI controllers
  drm/solomon: Add ssd130x new compatible strings and deprecate old
    ones.
  drm/solomon: Move device info from ssd130x-i2c to the core driver
  drm/solomon: Add SSD130x OLED displays SPI support

 .../bindings/display/solomon,ssd1307fb.yaml   |  86 +++++++--
 drivers/gpu/drm/solomon/Kconfig               |   9 +
 drivers/gpu/drm/solomon/Makefile              |   1 +
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |  64 +++----
 drivers/gpu/drm/solomon/ssd130x-spi.c         | 178 ++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.c             |  35 +++-
 drivers/gpu/drm/solomon/ssd130x.h             |  14 ++
 7 files changed, 330 insertions(+), 57 deletions(-)
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-spi.c

-- 
2.35.1

