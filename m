Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LEIGHnxjWlw8wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 16:27:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F96612EE8E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 16:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C49510E279;
	Thu, 12 Feb 2026 15:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ty5AZIWr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23A410E279
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 15:27:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1F3FD1A0E5D;
 Thu, 12 Feb 2026 15:27:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E52B1606CA;
 Thu, 12 Feb 2026 15:27:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5B93211971B05; Thu, 12 Feb 2026 16:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770910061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=dHvyyUWufcDUYZZiGp+OreXyUiQERICvMqjauxJsIBk=;
 b=ty5AZIWryFiAUKJgZh1PETyZ8lFIYeqVUbpKQhtDJxPHr/JwgpMbPPcB53R8n/K6KZjwS8
 ninJ9z0cWJeqAbqDof4AO4YOPwe0yeRvKZ+PQTxU1Wc779c1SKTSiJhR8NlyR16UIBEaWK
 N39q7624FEF6agoGTyQX3WqUBvVxdyNzfE7zMAcj8OP0aflhhotMdegJRUJgV2h253MOin
 ZX3QJ2jdjnnYV1iMM2fvrEgG+VMIXHgieid02uwD6urvC++cY19tvgoZKjuIt6/IlE7bQ5
 wFJ4RK99iQG8I2xmpHibRFgW64xPwInIqSxdg2tSX9Hy+OY81cs88Y0R9tyEIw==
From: "Kory Maincent (TI)" <kory.maincent@bootlin.com>
Subject: [PATCH 0/5] Add support for Seeed Studio BeagleBone HDMI cape overlay
Date: Thu, 12 Feb 2026 16:26:14 +0100
Message-Id: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABbxjWkC/x2MWwqAIBAAryL7XaAbPa8SEZlr7Y+FVgTi3ZM+h
 2EmQiDPFGAQETw9HPhwGVQhYN0Xt1HJJjOgxEaiwtLSct2eZq2z6yvsWqmRjK0hJ6cny++/G6e
 UPjBq33NeAAAA
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
X-Rspamd-Queue-Id: 6F96612EE8E
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
Kory Maincent (TI) (5):
      ARM: dts: ti: Enable overlays for all DTB files
      ARM: multi_v7_defconfig: Enable TILCDC DRM driver
      ARM: omap2plus_defconfig: Enable ITE IT66121 driver
      ARM: multi_v7_defconfig: Enable ITE IT66121 driver
      ARM: dts: am335x: Add Seeed Studio BeagleBone HDMI cape overlay

 arch/arm/boot/dts/ti/omap/Makefile                 |   8 ++
 .../boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso    | 157 +++++++++++++++++++++
 arch/arm/configs/multi_v7_defconfig                |   2 +
 arch/arm/configs/omap2plus_defconfig               |   1 +
 4 files changed, 168 insertions(+)
---
base-commit: 40c1ccc1a3b86259e455a9a5082d5c8e0f944d62
change-id: 20260212-feature_bbge-932870b2edf5

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

