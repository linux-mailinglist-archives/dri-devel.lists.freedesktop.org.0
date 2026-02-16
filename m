Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFjsFzdMk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:56:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F141467D2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0C310E1B8;
	Mon, 16 Feb 2026 16:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bz5zSQV3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F88F10E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:56:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 918DAC16A13;
 Mon, 16 Feb 2026 16:56:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7EAB0606CF;
 Mon, 16 Feb 2026 16:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 519E110368016; Mon, 16 Feb 2026 17:56:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771260976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=rk33jShkc5GyZhH4ODiSXr2qkDwH0lTssejEJ6ovQ6U=;
 b=bz5zSQV3pLrKKxR0fLQsaBJAvoAvaUGQzTK+LpxUzlhx+i180FBz/iFwzA3caeM7gbmbkU
 izBSorum1pxK4fcOoH9EFdpsH/etwbJ860KKT+z4LaIpsSKxK0HvJjPZKkM/xGkEkwJJoL
 vpH0IzssWWlGxu76/KzjCuW+cd07Ed+aVTycQk/15TrIrFr/XjzL+zD2Frn+KQHQUNX8Cc
 dU5hfQD9/avEq2h5iLwBemuJjQwTODdJBbK73R43iiXcSssyb0/sspuRI1ZLMlwIGFOc9O
 Q3LIzh4H5i4RM48NGlc/fIVT1gw/4tQiHX5oz9U4B9cb8Z5sdw9BATfJgsM/Kg==
From: "Kory Maincent (TI)" <kory.maincent@bootlin.com>
Subject: [PATCH v2 0/3] Add support for Seeed Studio BeagleBone HDMI cape
 overlay
Date: Mon, 16 Feb 2026 17:55:51 +0100
Message-Id: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABdMk2kC/3WMQQ7CIBBFr9LMWgxMrVpX3sM0BtrBTqJgAImm4
 e5i9y7ff/lvgUiBKcKpWSBQ5sjeVcBNA+Os3Y0ET5UBJe4lKhSWdHoFuhpTXd/i8SAN0mQ7qJd
 nIMvvNXcZKs8ckw+ftZ7Vb/0TykpIgb1UO12dbbuz8T7d2W1H/4ChlPIFmoudV6oAAAA=
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 "Kory Maincent (TI)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14-dev-d4707
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:thomas.petazzoni@bootlin.com,m:linux-omap@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:luca.ceresoli@bootlin.com,m:praneeth@ti.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:louis.chauvet@bootlin.com,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D3F141467D2
X-Rspamd-Action: no action

Add devicetree overlay for the Seeed Studio BeagleBone HDMI cape, which
provides HDMI output via an ITE IT66121 HDMI bridge and audio support
through McASP.

https://www.seeedstudio.com/Seeed-Studio-BeagleBoner-Green-HDMI-Cape.html

This overlay requires the recent tilcdc cleanup patch series that was merged
to drm-misc-next to function properly:
https://lore.kernel.org/lkml/20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com/

With this DRM tree dependency I don't know if this series should land in
DRM tree or in OMAP tree.

Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
---
Changes in v2:
- Enable overlays only for am335x BeagleBoard boards.
- Squash defconfig changes in one patch.
- Link to v1: https://lore.kernel.org/r/20260212-feature_bbge-v1-0-29014a212f35@bootlin.com

---
Kory Maincent (TI) (3):
      ARM: dts: ti: Enable overlays for am335x BeagleBoard devicetrees
      ARM: multi_v7_defconfig: omap2plus_defconfig: Enable ITE IT66121 driver
      ARM: dts: am335x: Add Seeed Studio BeagleBone HDMI cape overlay

 arch/arm/boot/dts/ti/omap/Makefile                 |  13 ++
 .../boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso    | 157 +++++++++++++++++++++
 arch/arm/configs/multi_v7_defconfig                |   2 +
 arch/arm/configs/omap2plus_defconfig               |   1 +
 4 files changed, 173 insertions(+)
---
base-commit: 40c1ccc1a3b86259e455a9a5082d5c8e0f944d62
change-id: 20260212-feature_bbge-932870b2edf5

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

