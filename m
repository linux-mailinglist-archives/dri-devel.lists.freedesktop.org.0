Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D599D39D29
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D699B10E334;
	Mon, 19 Jan 2026 03:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PXemQUKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B433810E334
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:40:31 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-502a407dabaso22858491cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768794030; x=1769398830; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KcbVa3268lyqxBGM305ylj+tBhZM3T/QjOKg0r4LL34=;
 b=PXemQUKHV4CgxFw9SoRCIeqhWGa0Lx16jxV1RxTzsYl4ppKyKpNEudBX9xdzM5edZN
 MznGndvXyQX+vHkDJMEek14k55R/3YqtearHQMYZylFoe8PbOtMhWytJYlqds7Rfod+z
 SQlHUm+3bXOYrml+7ihjx8W8IztCrAui8q5qkHh0L6ha7MOYM8DeUxXY9Nar+D5dtyjE
 V/RqxOvvth78KoEyaJluO7JM3qTrwFkr6Y4LsVG7v3Hx6PNqmpqBcseGDgCq6cftGd4h
 SwK20q8qL/kqEkp4cwOqZJlhLUUSK+DAQ/kue17t/JVzpxm9D0zcAFG5DsVZwvbyOJeA
 7kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768794030; x=1769398830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KcbVa3268lyqxBGM305ylj+tBhZM3T/QjOKg0r4LL34=;
 b=EZahuRw2osLSybxbx+6i0E/TiGDpuwvidW5AdZOAZq2fvqPqtoQpQvZdLKw9BOdkzQ
 DQObIBu8ck6PbCbgzEQNdH82FAmskOoq/uBIbOtaPY0n8r5KPUwyqLD/Ysa0APJ0wunG
 /rZTMSDkHyQPnymOxjZZhqiRstGp1VxrE6hMHJLUHXymT3xlSJlDqTxG49Fa06vAGJRM
 jIEmZUN6lvXFQePwucAEzuxQ4iZQqZE5CcD5hF6l7TWYy0csatmVJM1IwxKcAjPOfO1H
 7Jo8OhqntwomY4HdzaCZfANxGWqBlsw52HUzSTedeMLXaf06KcuTi/2FiZbbKk5gSzFt
 6rJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxY4tgGWZSd/6nGh61ONEvQ6RvTCb/3bZ472rdymK+FSoRRHKFsSaDGfkIlCUbCSPAhQOi6uSVASc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVSXwflOz1WiS7TSK20jAQ6xM6gWShJeOsOwLSpxY2BAy0zpvI
 8lRgqe+Ho2A+/cAanxPUzrnbva1kKm0CCE7/LNXFcuxcLQu2tIRyTC8Z
X-Gm-Gg: AY/fxX4sQPkc4age/+i/Ib7gEod4cvqX8tpJDzcQtgqKW9abXO/haU/FwyLFpMvJTdo
 XueqCnub/E1YSL5fwTrTjNLvatijYfAYsEsoWbBf7xG80mFO4T4c2UAGJWiy+wTp143rDR1qjrG
 H78KfMOfo/9V63L5fzm6VFtJPpQEK/HxYioZgR4QPpHZlu5VTvKWRgeUqP+PBQHuqkcWhxPkhdV
 R/zKhbDkyPWZII6xFtPEmxu6VcpFhGCBMXG29dqzHuoFaTVzinycPFEAi8ZPV0c3mYTBn1gxrqB
 hxqx7aZ9AJ744fN2ZrjguS/KvrW6RLbqrTqBjUT7vS7WLAJYVZcRfl+brG+D9kMT3nzmCG/jBMm
 0gdGQmsUKX4z9hgm81RGHVvtHM3lIzQVlUEcD2SNMsQ98Z7AwXQHXv7yVqPvP0UwAe6CKHBcSug
 E6id+QqObr9zSrvbTtikjra3yXMyfosTBpEGVt09c6NWIlzGPdsNOMK3KyfYH0lzirsMQ=
X-Received: by 2002:ac8:5d05:0:b0:502:9f86:ca31 with SMTP id
 d75a77b69052e-502a16b3652mr167438321cf.52.1768794030529; 
 Sun, 18 Jan 2026 19:40:30 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1f1b872sm64030801cf.31.2026.01.18.19.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:40:30 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, bavishimithil@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: 
Date: Sun, 18 Jan 2026 22:40:24 -0500
Message-ID: <20260119034025.58091-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subject: [PATCH v4 00/10] Initial support for Samsung Galaxy Tab 2 series

This series adds initial support for the Samsung Galaxy Tab 2
(samsung-espresso7/10) series of devices. It adds support for 6 variants
(P3100, P3110, P3113, P5100, P5110, P5113). Downstream categorised them
based on 3G and WiFi, but since they use different panel, touch
controllers, batteries, I decided to categorise them based on screen
size as espresso7 and espresso10.

It adds basic functionality for both the models including panel, drm,
sdcard, touchscreen, mmc, wifi, bluetooth, keys, battery, fuel gauge,
pmic, sensors.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
Changes in v4
- Fixed syntax in doestek vendor
- Changed - to _ in node names
- Removed address/size-cells in chosen
- Added pinmux for i2c-gpio5,6,7, irled
- Allow sdcard to poweroff (reg_espresso_external)
- Changed power to key-power
- Order alphabetically in omap4_pmx_wkup and omap4_pmx_core
- Use generic node names
- Added TODO for future nodes
- Fix touchscreen values in espresso7 and espresso10
- Add dts to Makefile
- Commit message length under 75
- Link to v3: https://lore.kernel.org/linux-omap/20241108200440.7562-1-bavishimithil@gmail.com/
Changes in v3
- Use device tree from the correct branch
- Fix commit subjects to matching the subsystem
- Add Doestek vendor
- Add compatible for LVDS encoder
- Add compatibles for 7 and 10 inch panels
- Clean up device tree using "make CHECK_DTBS=y"
- Link to v2: https://lore.kernel.org/all/20241030211215.347710-1-bavishimithil@gmail.com/
Changes in v2
- Fix node names in common dtsi to have - instead of _
- Removed import for twl6030.dtsi
- Edited dts to completely use twl6032 nodes
- Fixed typo ldosb -> ldousb
- Link to v1: https://lore.kernel.org/all/20241030194136.297648-1-bavishimithil@gmail.com/
--

Mithil Bavishi (10):
  ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
  dt-bindings: vendor-prefixes: Add Doestek
  dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
  dt-bindings: display: panel-lvds: Add compatible for Samsung
    LTN070NL01 Panel
  dt-bindings: display: panel-lvds: Add compatible for Samsung
    LTN101AL03 Panel
  ARM: dts: ti: omap: espresso-common: Add common device tree for
    Samsung Galaxy Tab 2 series
  dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
  ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy
    Tab 2 7.0
  dt-bindings: omap: Add Samsung Galaxy Tab 2 10.1
  ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy
    Tab 2 10.1

 .../devicetree/bindings/arm/ti/omap.yaml      |   2 +
 .../bindings/display/bridge/lvds-codec.yaml   |   1 +
 .../bindings/display/panel/panel-lvds.yaml    |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/ti/omap/Makefile            |   2 +
 .../omap/omap4-samsung-espresso-common.dtsi   | 762 ++++++++++++++++++
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 104 +++
 .../dts/ti/omap/omap4-samsung-espresso7.dts   |  70 ++
 arch/arm/boot/dts/ti/omap/twl6032.dtsi        |  77 ++
 9 files changed, 1024 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

-- 
2.43.0

