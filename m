Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD0wDEd5nGlfIAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:59:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8183717936C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEB610E3EE;
	Mon, 23 Feb 2026 15:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RCNWFSul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8526610E3E9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 15:58:59 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-5fe0959ae3dso2461665137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 07:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771862338; x=1772467138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/aUtuOEkRmi402+kxGGUvbzHIC7w7l1S49zZW1GH148=;
 b=RCNWFSulAtMNvlDYTSXiFzISjxQ9/zHEQCV0NuuvZ8JNY438YYikIE30jMgpMxWt4M
 b5U86yiU/YpZ9a7b1zFKx/QqhgBTdXNVL9koEl9uO7B2ZXFU1yr5l8OASwlDfMFf6X2X
 ZyFRU9VoUBWeAItUXFv5VALlVBGFFrkyQKjYwQXqMthbDwIAzP0Q92fj+CZjDdtUjtjp
 NAoTnq1cDS7fIh1TAtCjG5BX5Tx2uJ+5EuVJCY0qgOEf4OHj2+rzzEL4mVpgxi/YZlHq
 2H+2BTT99Ph7vOe4Lz+3S7K41gFdgNkRvt6kGShDL2BUaP8O7emsK5J/f3y+W+NxfuWq
 /Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771862338; x=1772467138;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/aUtuOEkRmi402+kxGGUvbzHIC7w7l1S49zZW1GH148=;
 b=NqUSTuXkzI/+SOMRRpmsRgzo76NeOpp0xIvxkVNErjIUojAJfXwffImR4raXCa2tYt
 GlaUvufUlEpNCpvEUrwjwhVz0o2LhOD+QQbessIzZb9dEoRxegCwoAFhwgoHGnLXG3cH
 3Rj+sDrNpjSv1UTuDxtNEbiWTLzwlGDNTMpBM3I9MhlV0SthfgPEWj+cKCa5tKtYLKTY
 m1PLhDSph2S/YEVLvM7/kl29M1L072iUrIUQIx17N0frOLZvFQZtyEdTmyQaw3D84Ryl
 pIhKkH1rJRJpGDJ9ecSzmof8+RLJ229fVJY743JUInlVeu7kIASDYlmbtWwoKQM2CKpr
 EdYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcvyAjb0LKidJX8k2RcuUKUdzLGvYiU9ajFL+PzK9vNa9Yxmda3QiWIe9/DnepaOQVh+0Bv204EmU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjJ0yizJ6QYStdUm6KLw+ficxnf6tvznfRfoM2bxvqyZuLitpG
 W7/DW1QvD3ijDAZF0fn1pzQs2gZlivk3IxQHh4VB73CfQjSok4pl1E9OCAOj0I/y
X-Gm-Gg: AZuq6aLR9f7l1GBRBNKRf2TTDwTG5m7g+rMKrIWlLZG+D4+uXbZ5cCSnHZD3CO+5Jxn
 jb5l+XKcqxUBOAdy7A2q0ZbWe4t/nfHxC2YnFTYDH1pTgoBVZH+RqYwfkJuO7/MtxoSqHv8YaZR
 +8iMDzQWxJ3984VsBR4EwyzF8HA6/hwN+jgjh8AthLdDf8QH9qQUZr5QAXJh5kq3wsOXY0K6A5i
 +uBbcRcJFYJA55cIU6qg65DIRvuHmiQjmCWyVVCh3UhhLnlkGtgjVWkhRk29zPdVOKe/VQDSJW8
 HDUdEg2R8IXlRvrJI+Vo3Z0vo4FoFEaw697QV2ROfogzHHVsANQa+DM95CURxnzDo1TEmyhnDTI
 a9nEfgNuI82rvoEHW9mpnE1dDgZP4eT/DiWxKjv/RavPIMZ8wt/3/dt/Zr1nruYz2aqmnzzHAtg
 rUTsx5l2tw4raakGhOXKfxXr6dNu9aeIPTF/V1zlxkdNeuK67zw70yDO9YkYjmhbUgNUXrmnURG
 FJatS/VpuU=
X-Received: by 2002:a05:622a:150:b0:506:a394:ca64 with SMTP id
 d75a77b69052e-506f30beef1mr188405381cf.16.1771854584689; 
 Mon, 23 Feb 2026 05:49:44 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8997e62f453sm67954716d6.36.2026.02.23.05.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 05:49:44 -0800 (PST)
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
Subject: 
Date: Mon, 23 Feb 2026 08:49:32 -0500
Message-ID: <20260223134941.427-1-bavishimithil@gmail.com>
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
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	EMPTY_SUBJECT(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
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
X-Rspamd-Queue-Id: 8183717936C
X-Rspamd-Action: no action

Subject: [PATCH v7 0/8] Initial support for Samsung Galaxy Tab 2 series

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
Changes in v8
- Remove WAKEUP_EN from omap4_pmx_wkup
- Link to v7: https://lore.kernel.org/linux-omap/20260223055113.1288-1-bavishimithil@gmail.com/ 
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

