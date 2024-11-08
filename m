Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F69C3097
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 03:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DDC10E2C8;
	Sun, 10 Nov 2024 02:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JPtwFNkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4525010EA34
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 20:04:53 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-720c2db824eso2771314b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 12:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731096293; x=1731701093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gmzjM0Sz7rMDFT370/VwmwApAVLiN3v20l/4Ptk74eo=;
 b=JPtwFNkqJONHbQOwv422eJ0I3hzuT+YMNIyFVJtXHeuaojKZyyQxglFfejEjXBZLM2
 FN36KOIId/8FJgEIjyRmaHRLEZn1HyFijaXmQ6SoMZgzmcNtuFh1fmm6F5BetpRzYdzY
 jLaBClSEi6LftEjSKXl5+Hikxootm+NZp/gB0q4KgDC6yfXbncCnuT8z4k1JKNBYLlfa
 juELPuT43AmBbQXU41c1CxkC2Ddto2PvQlbbMsywc4yesNmgypQhJHQQ6WtnB/MjVwWm
 74vw5YKdWG/pk2gmkNNGIUJpPUSGl1IeOlGE4JU1Aiwf1rybiyjpBhKQJwhaJPRdPiky
 XMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731096293; x=1731701093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gmzjM0Sz7rMDFT370/VwmwApAVLiN3v20l/4Ptk74eo=;
 b=jEN0lSH0WBTJ0sJDGZqiFKoqNztZIb6W6fTm94BKvTOx0f2b6BgaHvrjvkIt2Micdh
 BE80cIHGZHK1Bjf1LidT38zpwMxMKRfBiDcqW6Y560TMbLb0PadPIwcNHvetrIKsa98z
 fiEnm2Xqqr6qE7vU3hXm76dbWeFvbvHnEHc201RfXwrQhmOIVBtPxIBAOaxlNUjzedU3
 RksCqMtCO9TXGkutBXGNVb34WRPxNSuUiQJeRdd/JkC7oEImrtdhBm2h+NVXmCnG24In
 74D45NLIwoe07eNfR2i0oxzsSHSZYvqL2Yn/FajJPkYTnqbDgFbC7vxP91Qvx/kZnr0D
 1XYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL09wa5vrylOSFumo0Og/5hze51UtAe2Vmv9Df2z8pABFQ/bypFbKjX/71efQvR/5fejDvnjXwKm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8pkQj5L4vIrm63IUWpWM/2s9Y8+HYB3lmVdFQxbYeq70yHAKe
 dtXFR2JjHfDP8fV2Yu3fC8QV2SbHcvgakffNnmFtmC4HMfyDTT8Z
X-Google-Smtp-Source: AGHT+IHobQL0rpFYvZO7mxaTrYc1Q3VG5GZ1OA9v2Mqn61QPt3k7BNZA4V2BCjbnnehnkYjuGTR4UA==
X-Received: by 2002:a05:6a00:139d:b0:71e:1722:d02c with SMTP id
 d2e1a72fcca58-72413260a41mr5587460b3a.3.1731096292678; 
 Fri, 08 Nov 2024 12:04:52 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:04:52 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mithil Bavishi <bavishimithil@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v3 00/10] Initial support for Samsung Galaxy Tab 2 series
Date: Fri,  8 Nov 2024 20:04:29 +0000
Message-ID: <20241108200440.7562-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 10 Nov 2024 02:30:58 +0000
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
 .../omap/omap4-samsung-espresso-common.dtsi   | 680 ++++++++++++++++++
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 102 +++
 .../dts/ti/omap/omap4-samsung-espresso7.dts   |  70 ++
 arch/arm/boot/dts/ti/omap/twl6032.dtsi        |  77 ++
 8 files changed, 938 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

-- 
2.43.0

