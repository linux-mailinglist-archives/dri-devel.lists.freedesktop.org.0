Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8F75395B1
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A0F112827;
	Tue, 31 May 2022 17:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDFA112A90
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 11:19:09 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id j7so7553568pjn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PAfP1TfQKp57sKoK4miFwW50pUBbnmoGxnEIvXcM/g4=;
 b=VxbJrcEqXZrBzeefY+0uD9QcWn0EWa3c8fagyKu8A7g1YljQHCkjN/wLxIY7lK0PTF
 hnXZLA5SvlwBMMejDWuakWyTh2MusBV6ReGoBEPolhpc8+AhraqAiYfufwIQ+VmSFHuZ
 X7j5qcSxfxPpvm3xeCcvB8KArI8FMvvXtzTKhxbPh8gairyuBP1mbBCW9+Yh74HVZINo
 WlS8In9e6fmwq4+8ZRiV21yFvg6E7863L35z1vnLs6iqOsa/Li6g5VYsOzIv8gchvOqf
 Zy5YErt5vCJBYwqAaZG6pMyfDnqK3J65GVweAY6/PZBszLlWKBkwofxJYqtBTkIVNASd
 xnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PAfP1TfQKp57sKoK4miFwW50pUBbnmoGxnEIvXcM/g4=;
 b=D46GOPW4A26Q7RN3F6AZGgKF5iw7abuHq0gcYMUnbIiddg7FOUspNTeXyVK2URnluY
 MTtcggGGN4eC/LsSPmvlHF2q77TdykSmw9MASJeDmEu5jWjebFEUkW/Ls4A8TiQkB0rA
 74E655DY9KVd+qXZ/tkPHQrnA2KK79xRQcwtnIn+izKPEnB/MHsUuQWhWTginNu6mGhU
 mBshPfEwQxeV6VlJ4JgOAmpDkfwWrLwectmwZ2gxqAasMdxtMbMyHVi+iNatp2zKWGmW
 mKQOTzVQ4wD2Mk9AvTM+iaJkdgWWMhVBL6PXTzbPkDfsQpboe4m7lW8Ol/hmlx1ad5SN
 fTpw==
X-Gm-Message-State: AOAM533Pa3hHV49a05EXLp8Ii2egCectn2GuOQ8AXbyRuxFcEGgWHmZ2
 EKan5wzn5yJkxzYGRSxQLPc=
X-Google-Smtp-Source: ABdhPJxhWTb/Mk+ejJKNKtSGdRVZoSfW873ok5RFT4PoJkUb/S/OY5WkMvOd9idL4wo2nH2gDZDMAw==
X-Received: by 2002:a17:90a:4209:b0:1df:b907:ed3d with SMTP id
 o9-20020a17090a420900b001dfb907ed3dmr28446184pjg.40.1653995949025; 
 Tue, 31 May 2022 04:19:09 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net.
 [42.72.220.172]) by smtp.gmail.com with ESMTPSA id
 cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:19:08 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [RESEND 00/14] Add Mediatek MT6370 PMIC support
Date: Tue, 31 May 2022 19:18:46 +0800
Message-Id: <20220531111900.19422-1-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 17:57:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 peterwu.pub@gmail.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

Sorry, for the patch dependency, we resend this patch series and we're
sorry for any inconvenience that we may have caused. This patch series add
Mediatek MT6370 PMIC support. The MT6370 is a highly-integrated smart
power management IC, which includes a single cell Li-Ion/Li-Polymer
switching battery charger, a USB Type-C & Power Delivery (PD)
controller, dual Flash LED current sources, a RGB LED driver, a
backlight WLED driver, a display bias driver and a general LDO for
portable devices.

Alice Chen (3):
  dt-bindings: leds: Add Mediatek MT6370 flashlight binding
  leds: mt6370: Add Mediatek MT6370 Indicator support
  leds: flashlight: mt6370: Add Mediatek MT6370 flashlight support

ChiYuan Huang (7):
  dt-bindings: usb: Add Mediatek MT6370 TCPC binding
  dt-bindings: leds: mt6370: Add Mediatek mt6370 indicator
  dt-bindings: backlight: Add Mediatek MT6370 backlight binding
  dt-bindings: mfd: Add Mediatek MT6370 binding
  mfd: mt6370: Add Mediatek MT6370 support
  usb: typec: tcpci_mt6370: Add Mediatek MT6370 tcpci driver
  regulator: mt6370: Add mt6370 DisplayBias and VibLDO support

ChiaEn Wu (4):
  dt-bindings: power: supply: Add Mediatek MT6370 Charger binding
  iio: adc: mt6370: Add Mediatek MT6370 support
  power: supply: mt6370: Add Mediatek MT6370 charger driver
  video: backlight: mt6370: Add Mediatek MT6370 support

 .../backlight/mediatek,mt6370-backlight.yaml  |  110 ++
 .../leds/mediatek,mt6370-flashlight.yaml      |   48 +
 .../leds/mediatek,mt6370-indicator.yaml       |   57 +
 .../bindings/mfd/mediatek,mt6370.yaml         |  282 ++++
 .../power/supply/mediatek,mt6370-charger.yaml |   60 +
 .../bindings/usb/mediatek,mt6370-tcpc.yaml    |   35 +
 drivers/iio/adc/Kconfig                       |    9 +
 drivers/iio/adc/Makefile                      |    1 +
 drivers/iio/adc/mt6370-adc.c                  |  257 ++++
 drivers/leds/Kconfig                          |   11 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/flash/Kconfig                    |    9 +
 drivers/leds/flash/Makefile                   |    1 +
 drivers/leds/flash/leds-mt6370-flash.c        |  665 ++++++++++
 drivers/leds/leds-mt6370.c                    |  994 +++++++++++++++
 drivers/mfd/Kconfig                           |   13 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/mt6370.c                          |  273 ++++
 drivers/power/supply/Kconfig                  |   11 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/mt6370-charger.c         | 1132 +++++++++++++++++
 drivers/regulator/Kconfig                     |    8 +
 drivers/regulator/Makefile                    |    1 +
 drivers/regulator/mt6370-regulator.c          |  389 ++++++
 drivers/usb/typec/tcpm/Kconfig                |    8 +
 drivers/usb/typec/tcpm/Makefile               |    1 +
 drivers/usb/typec/tcpm/tcpci_mt6370.c         |  212 +++
 drivers/video/backlight/Kconfig               |    8 +
 drivers/video/backlight/Makefile              |    1 +
 drivers/video/backlight/mt6370-backlight.c    |  338 +++++
 .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |   18 +
 include/dt-bindings/mfd/mediatek,mt6370.h     |   83 ++
 32 files changed, 5038 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
 create mode 100644 drivers/iio/adc/mt6370-adc.c
 create mode 100644 drivers/leds/flash/leds-mt6370-flash.c
 create mode 100644 drivers/leds/leds-mt6370.c
 create mode 100644 drivers/mfd/mt6370.c
 create mode 100644 drivers/power/supply/mt6370-charger.c
 create mode 100644 drivers/regulator/mt6370-regulator.c
 create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c
 create mode 100644 drivers/video/backlight/mt6370-backlight.c
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
 create mode 100644 include/dt-bindings/mfd/mediatek,mt6370.h

-- 
2.25.1

