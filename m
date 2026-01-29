Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IngKMwQe2k9BAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:48:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D02ACF52
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF6810E800;
	Thu, 29 Jan 2026 07:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fvnuPoFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01B910E800
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:48:24 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-1248d27f293so333094c88.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769672904; x=1770277704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ucryCuFvG8BETVJFMHSqACBtDXZ973dX+aGPcHODNIM=;
 b=fvnuPoFEf+4b5Z/ZD3BxphRwgnCjTdZHdA5r3t3EuPahBi6T7tnt1TjSFsueHpLjmY
 EIqX4wl9GZ0lHqbUyzdhgjl2FMvINoFm5lN+4bR1u7/6VSB311wR4PXVUccEgqpla7WE
 gnmpIJkUD4pNctQvTiIm5COzdkNRGDHLgKk1aRdp3I0i2Hf0CXDfW7jPbLCLA6kggXrz
 QdDAP4MifLGbRtbam0nYIqgqHZv9PKIkWLxh1dAHX0ckhaUHDoI4ZvrufyKWkQxb2Jgd
 2wesOi4au1vBpjjjC7Gz2nLYbLbDLh5oFOhaPIEwO7eBilHlHXL11NQ20Z84dJ3LrTOM
 Azuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769672904; x=1770277704;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ucryCuFvG8BETVJFMHSqACBtDXZ973dX+aGPcHODNIM=;
 b=VVyQXfXt18LRubW8kuX2D1gXwJwxyGRg9Qr0eY1ltOpozweGWAHduk/SNiWGpzATFT
 3LyqdJMotyrUcW2yLB2yCRFtVb1ORLLNjAPeLJ5lfSjAyjYpGS5uEeCM36oYvZRsy/f7
 p/AzVZd5bVJF0DnaVNiD87R4azbN8zDtH/t63ID0tHLinYou29PocSvVrh5Kl/tVjUl+
 LJXDCTF8HWXqfLqHhpmUiayD0FnYBiDL/lmnoVsEORPti/Sc6PGx0dZyJhgevC4sD7hb
 Z9MqFLadriFDnSiYBpGeVGMWcV2mgjDR9QtHzikYoW3HlXILqevRveIvovWgaeVgxPt2
 /xgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEoM1GyRIaioZKK6TaS/97awvVhp89/0siPwvqOHN9+3S0d3Ezfj8sEQoAnrGdr3tA3lLxgJIMuHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrxdUrjJXw0cQ+j++/J19ilkzt9g8PAs+sIqZZF3o6qod/J91K
 WtQw94+wUOZVQi3hRdi8qZfHTpaRdwNZE6NMgvTvk7CzVJfUGH2ORrYVnEEG0w==
X-Gm-Gg: AZuq6aKr9hAM8POPAjxEA5CRI672a5nP+jXSRitSVqoU0C5jyKNWSoHYDSKz4iYn937
 10EWgZRAdtR/YIk7XxMrfccdoMrdsWQuPdkZPnLFY2Gjb7u4hMgniUD+NMB0ICx4yjj17N03aQu
 6NUhOEw6nN5/M+0ZvnVYe+Qspq7PpsLGYB8iP9KRuDszOHRayVgPjQkWVPuB09lk9ZYp7fgt+ud
 PNXhpOr+E6Ie0Vvg74Y0jlAciHnK9DKa+xVRwsC/w1W425IW4lgzhbASPHeqxapvxa1eChJga04
 zlHbWEmpJrFWJzDI+0Lg5N02pjm35+8nkW5cJPR1ezdyFi4KuPH1/AjJLap1snSqD6PKIWFtHvM
 UOCsuh7ril2BkdboHUvdayPsGBbDJ67rG4fl+fotFYBuBTnCtTkqSDPzmBV2/ckThJMZ1Kn273L
 IxH90cKtGmj3srEtqs7FKa2Uuc8zjysc49IkVMlbecVI4J98eIrjuvsoBkmKJTUwA4M3KjIRY=
X-Received: by 2002:a05:620a:bc3:b0:8c6:af59:5e1b with SMTP id
 af79cd13be357-8c70b926324mr972584385a.77.1769665652113; 
 Wed, 28 Jan 2026 21:47:32 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-894d36dd1cfsm30903216d6.25.2026.01.28.21.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 21:47:31 -0800 (PST)
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
Subject: [PATCH v5 0/8] Initial support for Samsung Galaxy Tab 2 series
Date: Thu, 29 Jan 2026 00:47:01 -0500
Message-ID: <20260129054709.3878-1-bavishimithil@gmail.com>
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
X-Rspamd-Queue-Id: 03D02ACF52
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

