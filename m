Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C18B6DA2B0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD8310E116;
	Thu,  6 Apr 2023 20:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AB010E116
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:17 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id 18so4212548ejo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Cj6dH8SQdnU185Yyyy6Om9VdNmKCPrXJ/wOeykSuMs=;
 b=taN5aF85T0o4DOEA7zGLC9x48hE/Ll4x8ZFWRhnpOle/x0WjymESe4p4Z14BHa4S9c
 uw7oNg/Q29YXzTtqcl9Czi8nNczbJMDfMKL24RxQLPQ4i7gS2T3RgrLsNbgbf+VAwqnm
 kCTb7lsCxP9ItySfzSsSSg9XA7o/XysqdOeSgmklm8S772pjBQT+JEFaumzsPFB7Z7Kq
 ttNNTzWPBGiJpGKT0WSXACkCsMquvcdtgYxpUaltczVIRYNkiqm57VeXX06xfnl++FmI
 gmxj3nq/pcX+gvNwXJxO0eKcWnKI5uuzQyY9KAyvy8nG+tI3TfEqTkyzFK+8IztYVtiX
 M02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Cj6dH8SQdnU185Yyyy6Om9VdNmKCPrXJ/wOeykSuMs=;
 b=Xy/6V5e2bpWo82DzLcjtyYBiMvvCv7OkHWiVakTfzzL2YPOHLx5j3swTZC7fX9TSBI
 +/Xf21FCZHdEsj8owc+qzXv5azaUw2VuIp3dPNqifwPTpafj+ltDnuOJbNo//gFFUZWj
 FE/WRJP5MZqaaspdNy+mJfLjKlHiiEBTo754HK641XVGZv5AwOTb2bEIvPo5vYZ/L7+u
 JmncxD0D4Owpus2wxbcpVVnVJPRQDC5JfJMpbZRqwpjbVqS56ZqBZ9cLu89eKC09vQ74
 Cy4B14kV+4jOfesUu3g/6bE9qrbLdPskOzmm2+kMQbkz6EmNQoAbtNQJSDE2fZbrPVLB
 qasg==
X-Gm-Message-State: AAQBX9fG1++sNbAlJcIDcuoHYkngcUj1ZwR8I0ctIhbrlbG4P85kdI7A
 S2cMR96JZBg6H8DTH8cfiVgzyQ==
X-Google-Smtp-Source: AKy350aYtbUbdh6UH+nAWn66ZLqv4AwXcyRo/pi+U+xLfe5lXoD+dmiqBL9fEc9v7hXlsmZb2JD7bg==
X-Received: by 2002:a17:906:c795:b0:922:8fc9:d235 with SMTP id
 cw21-20020a170906c79500b009228fc9d235mr6270842ejb.9.1680813074873; 
 Thu, 06 Apr 2023 13:31:14 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Oded Gabbay <ogabbay@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Marius Zachmann <mail@mariuszachmann.de>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Clemens Ladisch <clemens@ladisch.de>, Rudolf Marek <r.marek@assembler.cz>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Jonas Malaco <jonas@protocubo.io>,
 Aleksandr Mezin <mezin.alexander@gmail.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans de Goede <hdegoede@redhat.com>, Michael Walle <michael@walle.cc>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Agathe Porte <agathe.porte@nokia.com>,
 Eric Tremblay <etremblay@distech-controls.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Luka Perkov <luka.perkov@sartura.hr>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@opensource.cirrus.com,
 openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/68] hwmon: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:29:55 +0200
Message-Id: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The first patch constifies the hwmon_channel_info pointers in the core, so all
the drivers can be updated - all patches here depend on the first one.

If the approach is fine, I will later update other subsystems.

Best regards,
Krzysztof

Krzysztof Kozlowski (68):
  hwmon: constify pointers to hwmon_channel_info
  hwmon: adm1177: constify pointers to hwmon_channel_info
  hwmon: adm9240: constify pointers to hwmon_channel_info
  hwmon: adt7411: constify pointers to hwmon_channel_info
  hwmon: adt7470: constify pointers to hwmon_channel_info
  hwmon: adt7x10: constify pointers to hwmon_channel_info
  hwmon: aht10: constify pointers to hwmon_channel_info
  hwmon: aquacomputer: constify pointers to hwmon_channel_info
  hwmon: as370: constify pointers to hwmon_channel_info
  hwmon: axi-fan: constify pointers to hwmon_channel_info
  hwmon: bt1-pvt: constify pointers to hwmon_channel_info
  hwmon: corsair: constify pointers to hwmon_channel_info
  hwmon: dell-smm: constify pointers to hwmon_channel_info
  hwmon: drivetemp: constify pointers to hwmon_channel_info
  hwmon: emc2305: constify pointers to hwmon_channel_info
  hwmon: ftsteutates: constify pointers to hwmon_channel_info
  hwmon: gxp-fan: constify pointers to hwmon_channel_info
  hwmon: i5500_temp: constify pointers to hwmon_channel_info
  hwmon: ina238: constify pointers to hwmon_channel_info
  hwmon: ina3221: constify pointers to hwmon_channel_info
  hwmon: intel-m10-bmc: constify pointers to hwmon_channel_info
  hwmon: jc42: constify pointers to hwmon_channel_info
  hwmon: k10temp: constify pointers to hwmon_channel_info
  hwmon: k8temp: constify pointers to hwmon_channel_info
  hwmon: lan966x: constify pointers to hwmon_channel_info
  hwmon: lm75: constify pointers to hwmon_channel_info
  hwmon: lm83: constify pointers to hwmon_channel_info
  hwmon: lm95241: constify pointers to hwmon_channel_info
  hwmon: lm95245: constify pointers to hwmon_channel_info
  hwmon: lochnagar: constify pointers to hwmon_channel_info
  hwmon: ltc2947: constify pointers to hwmon_channel_info
  hwmon: ltc2992: constify pointers to hwmon_channel_info
  hwmon: ltc4245: constify pointers to hwmon_channel_info
  hwmon: ltq-cputemp: constify pointers to hwmon_channel_info
  hwmon: max127: constify pointers to hwmon_channel_info
  hwmon: max31730: constify pointers to hwmon_channel_info
  hwmon: max31760: constify pointers to hwmon_channel_info
  hwmon: max31790: constify pointers to hwmon_channel_info
  hwmon: max6620: constify pointers to hwmon_channel_info
  hwmon: max6621: constify pointers to hwmon_channel_info
  hwmon: max6650: constify pointers to hwmon_channel_info
  hwmon: mc34vr500: constify pointers to hwmon_channel_info
  hwmon: mcp3021: constify pointers to hwmon_channel_info
  hwmon: mlxreg: constify pointers to hwmon_channel_info
  hwmon: nct7904: constify pointers to hwmon_channel_info
  hwmon: npcm750-pwm: constify pointers to hwmon_channel_info
  hwmon: ntc_thermistor: constify pointers to hwmon_channel_info
  hwmon: nzxt: constify pointers to hwmon_channel_info
  hwmon: oxp-sensors: constify pointers to hwmon_channel_info
  hwmon: peci: constify pointers to hwmon_channel_info
  hwmon: powr1220: constify pointers to hwmon_channel_info
  hwmon: raspberrypi: constify pointers to hwmon_channel_info
  hwmon: sbrmi: constify pointers to hwmon_channel_info
  hwmon: sbtsi_temp: constify pointers to hwmon_channel_info
  hwmon: sch5627: constify pointers to hwmon_channel_info
  hwmon: sht4x: constify pointers to hwmon_channel_info
  hwmon: sl28cpld: constify pointers to hwmon_channel_info
  hwmon: smpro: constify pointers to hwmon_channel_info
  hwmon: sparx5-temp: constify pointers to hwmon_channel_info
  hwmon: sy7636a: constify pointers to hwmon_channel_info
  hwmon: tmp102: constify pointers to hwmon_channel_info
  hwmon: tmp103: constify pointers to hwmon_channel_info
  hwmon: tmp108: constify pointers to hwmon_channel_info
  hwmon: tmp464: constify pointers to hwmon_channel_info
  hwmon: tmp513: constify pointers to hwmon_channel_info
  hwmon: tps23861: constify pointers to hwmon_channel_info
  hwmon: w83627ehf: constify pointers to hwmon_channel_info
  hwmon: w83773g: constify pointers to hwmon_channel_info

 Documentation/hwmon/hwmon-kernel-api.rst |  6 +++---
 drivers/accel/habanalabs/common/hwmon.c  |  2 +-
 drivers/hwmon/adm1177.c                  |  2 +-
 drivers/hwmon/adm9240.c                  |  2 +-
 drivers/hwmon/adt7411.c                  |  2 +-
 drivers/hwmon/adt7470.c                  |  2 +-
 drivers/hwmon/adt7x10.c                  |  2 +-
 drivers/hwmon/aht10.c                    |  2 +-
 drivers/hwmon/aquacomputer_d5next.c      |  2 +-
 drivers/hwmon/as370-hwmon.c              |  2 +-
 drivers/hwmon/axi-fan-control.c          |  2 +-
 drivers/hwmon/bt1-pvt.c                  |  4 ++--
 drivers/hwmon/corsair-cpro.c             |  2 +-
 drivers/hwmon/corsair-psu.c              |  2 +-
 drivers/hwmon/dell-smm-hwmon.c           |  2 +-
 drivers/hwmon/drivetemp.c                |  2 +-
 drivers/hwmon/emc2305.c                  |  2 +-
 drivers/hwmon/ftsteutates.c              |  2 +-
 drivers/hwmon/gxp-fan-ctrl.c             |  2 +-
 drivers/hwmon/hwmon.c                    |  4 ++--
 drivers/hwmon/i5500_temp.c               |  2 +-
 drivers/hwmon/ina238.c                   |  2 +-
 drivers/hwmon/ina3221.c                  |  2 +-
 drivers/hwmon/intel-m10-bmc-hwmon.c      | 10 +++++-----
 drivers/hwmon/jc42.c                     |  2 +-
 drivers/hwmon/k10temp.c                  |  2 +-
 drivers/hwmon/k8temp.c                   |  2 +-
 drivers/hwmon/lan966x-hwmon.c            |  2 +-
 drivers/hwmon/lm75.c                     |  2 +-
 drivers/hwmon/lm83.c                     |  2 +-
 drivers/hwmon/lm95241.c                  |  2 +-
 drivers/hwmon/lm95245.c                  |  2 +-
 drivers/hwmon/lochnagar-hwmon.c          |  2 +-
 drivers/hwmon/ltc2947-core.c             |  2 +-
 drivers/hwmon/ltc2992.c                  |  2 +-
 drivers/hwmon/ltc4245.c                  |  2 +-
 drivers/hwmon/ltq-cputemp.c              |  2 +-
 drivers/hwmon/max127.c                   |  2 +-
 drivers/hwmon/max31730.c                 |  2 +-
 drivers/hwmon/max31760.c                 |  2 +-
 drivers/hwmon/max31790.c                 |  2 +-
 drivers/hwmon/max6620.c                  |  2 +-
 drivers/hwmon/max6621.c                  |  2 +-
 drivers/hwmon/max6650.c                  |  2 +-
 drivers/hwmon/mc34vr500.c                |  2 +-
 drivers/hwmon/mcp3021.c                  |  2 +-
 drivers/hwmon/mlxreg-fan.c               |  2 +-
 drivers/hwmon/nct7904.c                  |  2 +-
 drivers/hwmon/npcm750-pwm-fan.c          |  2 +-
 drivers/hwmon/ntc_thermistor.c           |  2 +-
 drivers/hwmon/nzxt-kraken2.c             |  2 +-
 drivers/hwmon/nzxt-smart2.c              |  2 +-
 drivers/hwmon/oxp-sensors.c              |  2 +-
 drivers/hwmon/peci/cputemp.c             |  2 +-
 drivers/hwmon/peci/dimmtemp.c            |  2 +-
 drivers/hwmon/powr1220.c                 |  2 +-
 drivers/hwmon/raspberrypi-hwmon.c        |  2 +-
 drivers/hwmon/sbrmi.c                    |  2 +-
 drivers/hwmon/sbtsi_temp.c               |  2 +-
 drivers/hwmon/sch5627.c                  |  2 +-
 drivers/hwmon/sht4x.c                    |  2 +-
 drivers/hwmon/sl28cpld-hwmon.c           |  2 +-
 drivers/hwmon/smpro-hwmon.c              |  2 +-
 drivers/hwmon/sparx5-temp.c              |  2 +-
 drivers/hwmon/sy7636a-hwmon.c            |  2 +-
 drivers/hwmon/tmp102.c                   |  2 +-
 drivers/hwmon/tmp103.c                   |  2 +-
 drivers/hwmon/tmp108.c                   |  2 +-
 drivers/hwmon/tmp464.c                   |  2 +-
 drivers/hwmon/tmp513.c                   |  2 +-
 drivers/hwmon/tps23861.c                 |  2 +-
 drivers/hwmon/w83627ehf.c                |  2 +-
 drivers/hwmon/w83773g.c                  |  2 +-
 include/linux/hwmon.h                    |  2 +-
 74 files changed, 82 insertions(+), 82 deletions(-)

-- 
2.34.1

