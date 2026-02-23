Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA/xDZUFnGlk/AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:45:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEB6172CEB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C6610E25A;
	Mon, 23 Feb 2026 07:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Htlu9NMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3E410E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 07:45:21 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-463967f35d7so2531059b6e.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771832720; x=1772437520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJJXdok9+FUakR4+4YGKa7V5rpMzXNyNvVO7Mm3dh3s=;
 b=Htlu9NMUJQMkipb0hKY4pZU4NZQZMbxciUaXAMLv2CdMYPrv7GD1yyn4P9etORxFCW
 yn+kGsK6QzaQKq7EkNZGmLTpXsm+ZA85a+3Krj0CVPnXFLrl2VkeizVKtdo3LGUnw3rV
 XxDAhBnSWXUEEC8LGBprfDTPb1c7c2neln2XkfKZM2kY39dHo1NSBpYWBbuNMphzXJU3
 ZS9OPufn7atzSmzFYy1bPckNQwLXfv+A4G7RqlXFOWfZXv9+mlyjMi82yh8tqOuc4ket
 p4i1org6QryCcV+pvNvvw9nxN6QXV4Q3UzeDc7nCLNlG/iyihIUnyLofvn+HkTUfRW1q
 xCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771832720; x=1772437520;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZJJXdok9+FUakR4+4YGKa7V5rpMzXNyNvVO7Mm3dh3s=;
 b=GXqF3xUSTP5a8aQrUcLWTxGyPdJEXj81YJCzXnebKTDmwO5sa+wEVxH/Ls4L1imon5
 hkjlyoyZPFVikI7OuSoCfASrqTbOGGC+ontB1Kp5ybasfKpQLKGvM9BzuZ9k33yPUjY4
 eUJg99mughH/9Rnl4qOi2F9WDJZihKxQ/6+2tWHLVhDxGNTdQMr9u6El4+tvamJBmwKS
 uIRWZx5GLhRX0pMHehX62vcMBNXuvw+NQBuLpK5QbTzacZouil77GNukxO6E8o4+QTWv
 EyyZyQ2CBnjHr78d5g/mLf8YdvOUbZarGTJavZmPN5+G3oVecua6m74/XrdWsCF7gRHY
 Gu/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvEFtxYWe3ejazy7VtxQ7k3THxUb/wsbLQLPMa0R7vYM7waznApRapOBk8abwhct7tn9C344JgDFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUGEkNNsBV3wTmfH7amc8BeIkTz824B/CS7TM+dgOI1cZhDO6R
 qHwqDk83ObWVLuwRPGtXQcQ4N/OSA8NWnVMtRIBFGsko1y+rxUkGL/IKD14j4T7/
X-Gm-Gg: AZuq6aJ7aLZAOEt1xyK96JW03gN3e+z0nxAw+lH9gk1XeI3k34sZWz75ScFQ+vHLEG8
 mhtGAPc3qGdMAk8Lv0a1BdzZm9VRuuYFUK2M5yphRNy9JGNu9jlDC7eUAKJWtP2gKoiiMwqwpKZ
 QctLAowrDczehJyN7Akm/XYN2PS9QjRZvvN/t1vAuf1Ff4RuKcPWYkaq/seMT/4W+tYfNwRdKzy
 lmsrVnpaqDfzQCF4pp4ahYmvuU2rkaBbJMrzVaBr/+BtJe1DAp7olOW7hJEuPuRLW63QSXD3m1K
 S6o91vZMtQOX5oEnQsjnctRiqWJ60cN3FKXy52AV2vt636WMlLo9QibbJh8Ivz9IRI4VLj6DEfm
 phBZQRuUppmI7GXvbVaR+BHx1aNNNaO5WPyfA06SYWQkEkhhsgybvf8RpKNTMnqv6dQHYUQTDff
 QizRq9Enf+ZlxzYlTM8FLDhdMHfCUAqVcKjb5hgpX93aVklclN07rOBMVA9f+dRQG64u8fGqq5x
 fOPDtXM8B9EtAKZUzPe0g==
X-Received: by 2002:a05:6214:400c:b0:882:4be6:9ab9 with SMTP id
 6a1803df08f44-89979f3491amr98922476d6.54.1771825877439; 
 Sun, 22 Feb 2026 21:51:17 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8997e62f453sm59459096d6.36.2026.02.22.21.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 21:51:17 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jesszhan0024@gmail.com,
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de,
 andrzej.hajda@intel.com, bavishimithil@gmail.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH v7 0/8] Initial support for Samsung Galaxy Tab 2 series
Date: Mon, 23 Feb 2026 00:51:05 -0500
Message-ID: <20260223055113.1288-1-bavishimithil@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9CEB6172CEB
X-Rspamd-Action: no action

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
Changes in v7
- Removed prox_irq
- Changed commit message
- Link to v6: https://lore.kernel.org/linux-omap/20260219210408.5451-1-bavishimithil@gmail.com/
Changes in v6
- Remove references to WAKEUP_EN (drivers dont support interrupts-extended)
- Remove gp2a_irq, it was for bh1721fvc not gp2a
- Remove mount-matrix
- Link to v5: https://lore.kernel.org/linux-omap/20260129054709.3878-1-bavishimithil@gmail.com/
Changes in v5
- Commit message length < 75
- Squash commits
- Link to v4: https://lore.kernel.org/linux-omap/20260119033035.57538-1-bavishimithil@gmail.com/
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

Mithil Bavishi (8):
  ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
  dt-bindings: vendor-prefixes: Add Doestek
  dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
  dt-bindings: display: panel-lvds: Add compatibles for Samsung
    LTN070NL01 and LTN101AL03 panels
  ARM: dts: ti: omap: espresso-common: Add common device tree for
    Samsung Galaxy Tab 2 series
  dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0 and 10.1
  ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy
    Tab 2 7.0
  ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy
    Tab 2 10.1

 .../devicetree/bindings/arm/ti/omap.yaml      |   2 +
 .../bindings/display/bridge/lvds-codec.yaml   |   1 +
 .../bindings/display/panel/panel-lvds.yaml    |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/ti/omap/Makefile            |   2 +
 .../omap/omap4-samsung-espresso-common.dtsi   | 744 ++++++++++++++++++
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 104 +++
 .../dts/ti/omap/omap4-samsung-espresso7.dts   |  70 ++
 arch/arm/boot/dts/ti/omap/twl6032.dtsi        |  77 ++
 9 files changed, 1006 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

-- 
2.43.0

