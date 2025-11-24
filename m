Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E60C80698
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 13:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583A510E231;
	Mon, 24 Nov 2025 12:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="KjV5IzTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7E810E231
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 12:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763986539; x=1795522539;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=7Q6o540U0MuKX4LmXYnikYcnzquX+vLmRlmwknsSgHA=;
 b=KjV5IzTMka9WLvlnqcmRnmkmxSHRot1Ciy1rNH/4hoyv80skG0n/wYD3
 WPmROn7tFwwPh6JNFDueX88fGEeZO3fPZPiGOJcpBZOMwwmZi9g/cg4Bu
 vIgCv23qkll2EmnRmEufNkTisNatJP+SeuOFBRNClPC6SYdVIP/xlhiuG
 9BX6y/sCTINb1RONANNFvbb7V9ZBcOszALIcejtnqDnBn6a2Jt6I8HpPu
 B9i8jlByuQlGp42aeZrhENskl22KO/nwqR6Fhk0zWTW2lF60J6Pt4atbW
 YgMO5CL01HLhmC7TOv+52syuP8W/8DgxTaplRhpSoeOPdEFfFhPJFNgM4 Q==;
X-CSE-ConnectionGUID: YHrtvy5xRn+N01J9f5nEwg==
X-CSE-MsgGUID: z6BBmk9ZRhaoewgnd8BOdw==
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="280948042"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2025 05:08:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 24 Nov 2025 05:08:19 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 24 Nov 2025 05:08:16 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Mon, 24 Nov 2025 13:07:21 +0100
Subject: [PATCH v3 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251124-cpitchen-mainline_gfx2d-v3-5-607f8c407286@microchip.com>
References: <20251124-cpitchen-mainline_gfx2d-v3-0-607f8c407286@microchip.com>
In-Reply-To: <20251124-cpitchen-mainline_gfx2d-v3-0-607f8c407286@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=751;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=7Q6o540U0MuKX4LmXYnikYcnzquX+vLmRlmwknsSgHA=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ6aK17wXh5Zl3zBcn1Mxs97opsptS3eZbZLvHrQ9msbBZ
 h0swqnfUcrCIMbFICumyHLozdbezOOvHtu9EpWCmcPKBDKEgYtTACbScICR4bsA83OOd3vsuiMY
 DY6Werx/6Dz3RPyu3T/zQ4O9tjAIX2H4zZZtKVA+afXKgNvdt9fseiH15VWHk/anQOs0Zl4fc4Y
 WXgA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
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

The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
driver to use it.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index ff13e1ecf4bb9545d6d2210b2f3059e6807779a0..85e9b52152aec6746f660dd0c299cd5aa12ce2ea 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -144,6 +144,7 @@ CONFIG_VIDEO_OV2640=m
 CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_GFX2D=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y

-- 
2.51.0

