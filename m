Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB7D53A371
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD4010E368;
	Wed,  1 Jun 2022 11:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33C310E368
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:03:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e25so1808597wra.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q6tthIMoT4ruD6JHwzSQMleekGF9Zk9WpAchytaiYTM=;
 b=BVlIGd7DGxhP3kteQYVstjWADi5+sAeQTjsydIO0PG6YOts2TQa26BbXpRjb2JHqxV
 TaFgM5zKcMlO1QaUscfhF9C/IRbqGI3kGajtRGKvEBzLHXYBuMKORcxviEV9GAKFtMQM
 eNrf6HYo6jHiuXlHzeNbIc13VM9JneZ/DWSfU1PjZ6KmlcgfVMmX4juFE4k2GL01Go/Q
 j2TJoJNvvz/XUB2hADLuwSzac4/HC6uy8cLqjhBJ/YzQp4pAvs/RMJW2WCnBhQPhHIq/
 fVvydLYJP1CwGb8lBIEZJwQ1JWjSJLPibrhMjV4MAjbD2gLLzGy78M3+fexCvOe6Bxnc
 4WMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q6tthIMoT4ruD6JHwzSQMleekGF9Zk9WpAchytaiYTM=;
 b=z2jb0PRueLx6dBReHLP55jlumubOqZ8NIEDyGGOV00Iy8t+mA89Zg2mACMiDKsxaro
 T2TOnzaL9Zo3GL3qJGcA/TSdJsXqZwBzvHCyRrCIVr4YL5IJgHsMjMzW4/NkhiavWvYL
 WZ/xIsv7Er+jA6J8DCudpI94J8B46hP8o9jiRqvwhHuxr61FRYGqlFzAQUoZ4JO1MlXU
 CoIuP6yyhxiHq+ElBYgFxOkVZ+D/HXtt5BpMkguofPiNDe1zdvDLZ45jK9GyK52zyrPA
 CwcFPBvJP2ZmBkGRrOlD4Vm3liqwDul645Ez90c+Dcf2POh7mfeby7LZsbkRQ/ar273e
 xwHw==
X-Gm-Message-State: AOAM5317qYOzSbicW0KbDA+8XaIoMZVbatXWQJpnBakiz3/a3abGSxHk
 2tx9paHfM+yPY+FSaNY7R0o=
X-Google-Smtp-Source: ABdhPJzLmmoS2dYg0CT3V1aVAnpDEFMEScwN3Ds9lW57/lngszZOr8vkmalkfzvnB1GkITDhJ2zlLQ==
X-Received: by 2002:a5d:5888:0:b0:20d:270f:6b61 with SMTP id
 n8-20020a5d5888000000b0020d270f6b61mr52883493wrf.211.1654081393257; 
 Wed, 01 Jun 2022 04:03:13 -0700 (PDT)
Received: from morpheus.home.roving-it.com (82-132-215-116.dab.02.net.
 [82.132.215.116]) by smtp.googlemail.com with ESMTPSA id
 j14-20020a05600c190e00b00397381a7ae8sm6074559wmq.30.2022.06.01.04.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 04:03:12 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list@broadcom.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>,
 javierm@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, maxime@cerno.tech,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v5 4/6] ARM: dts: bcm2711: Enable V3D
Date: Wed,  1 Jun 2022 12:02:47 +0100
Message-Id: <20220601110249.569540-5-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601110249.569540-1-pbrobinson@gmail.com>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
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
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds the entry for V3D for bcm2711 (used in the Raspberry Pi 4)
and the associated firmware clock entry.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
Changes since v5:
- Move the firmware clock to bcm2711-rpi.dtsi

 arch/arm/boot/dts/bcm2711-rpi.dtsi |  4 ++++
 arch/arm/boot/dts/bcm2711.dtsi     | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711-rpi.dtsi b/arch/arm/boot/dts/bcm2711-rpi.dtsi
index ca266c5d9f9b..98817a6675b9 100644
--- a/arch/arm/boot/dts/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2711-rpi.dtsi
@@ -69,6 +69,10 @@ blconfig: nvram@0 {
 	};
 };
 
+&v3d {
+	clocks = <&firmware_clocks 5>;
+};
+
 &vchiq {
 	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 };
diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 89af57482bc8..177662257b16 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -601,6 +601,17 @@ genet_mdio: mdio@e14 {
 				#size-cells = <0x0>;
 			};
 		};
+
+		v3d: gpu@7ec00000 {
+			compatible = "brcm,bcm2711-v3d";
+			reg = <0x0 0x7ec00000 0x4000>,
+			      <0x0 0x7ec04000 0x4000>;
+			reg-names = "hub", "core0";
+
+			power-domains = <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
+			resets = <&pm BCM2835_RESET_V3D>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
 
-- 
2.36.1

