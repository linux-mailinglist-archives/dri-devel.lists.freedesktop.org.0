Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5DA1132D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 22:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A44D10E385;
	Tue, 14 Jan 2025 21:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EFLZhVae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E365D10E195
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 21:39:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1E105A41CE3;
 Tue, 14 Jan 2025 21:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15302C4CEE4;
 Tue, 14 Jan 2025 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736890739;
 bh=y7I3ysTNSviVxSY83s+mUanX/HzCwqOMU6EU00x1sxM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=EFLZhVaeJT6CDmekEYZuOeQdu0U6SclgGrQ+LrZp1Pd5+iNlq2pM2Hd3HOlDln8v/
 KFRle1OMq40FGmOJl8doCss2A06D4Du+WY0Uk5D+/yi6n+/Q2dLEGONjRFfX2ij3f1
 p7mZrZz8MVu0mi+uxfCTVx/3qAKyQFCJJAIrSONk2htTkmakQOVi7HjYN4dOUh90w0
 kE4mupetrAfF5KVOvrMKUhMWu7Yy4jI4qV1F00l8lySWM2AeiZuHGx+MUyFUIPQRna
 IcecO1m8wQ+UzWxU1Z5ZKQea1liZoVAfLdWwMVOoDm9Xs7TlobH72DRhfNvq53FhUK
 kkLq51OgRjAtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0E5C02183;
 Tue, 14 Jan 2025 21:38:59 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:38:56 +0100
Subject: [PATCH v4 5/5] MAINTAINERS: Add entries for touchbar display
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-adpdrm-v4-5-e9b5260a39f1@gmail.com>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
In-Reply-To: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736890736; l=1377;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=KEf80SVHicxgRXKAdu52Cd2dNEz+kgXSg0wZwqOZ7j0=;
 b=tIjqWyPizwmuQ4MvM1PbsbAt5UwiHuHH2S/xckQkz+poI3Wc1LrropTswbyz0A+KoDSg0qqp3
 rsdSKCfGiq0BCan/6ZNOoqZuNhkkvYcx+c4DdO1OV0ee1JEVHHyD+mw
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..4ce0d3bcf67910d909ba41261535dcb14a24a7b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2189,6 +2189,9 @@ F:	Documentation/devicetree/bindings/arm/apple.yaml
 F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
+F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
@@ -2208,6 +2211,8 @@ F:	drivers/bluetooth/hci_bcm4377.c
 F:	drivers/clk/clk-apple-nco.c
 F:	drivers/cpufreq/apple-soc-cpufreq.c
 F:	drivers/dma/apple-admac.c
+F:	drivers/gpu/drm/adp/
+F:	drivers/gpu/drm/panel/panel-summit.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c

-- 
2.48.0


