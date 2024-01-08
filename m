Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB7827787
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 19:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBB310E2C0;
	Mon,  8 Jan 2024 18:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464BB10E2A2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 18:33:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 408IX5ms041769;
 Mon, 8 Jan 2024 12:33:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1704738785;
 bh=Gdhx6GMh4rVP3km5x1uoGL2Uoq7UqUUHtltyRBPwCl8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=tIC3FO5NGBdpNDZlL287om+LGb2BYGIgBzpWR4Jj6OVKhN1b5dqIyLqSNRd3Asg27
 PYv3+qbzz6maBy2EnNEuv8N8WDCe6hqy8SionOywnJa55CZ2Gmu/CwUGPkD1dzCZ/v
 emN536JMSU2ovagvBOND/1UjP9UZWTchj78/WjV4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 408IX5mU022175
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jan 2024 12:33:05 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jan 2024 12:33:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jan 2024 12:33:05 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.40.136])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 408IX3hA051691;
 Mon, 8 Jan 2024 12:33:04 -0600
From: Andrew Davis <afd@ti.com>
To: Frank Binns <frank.binns@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>
Subject: [PATCH RFC v2 01/11] dt-bindings: gpu: Rename img, powervr to img,
 powervr-rogue
Date: Mon, 8 Jan 2024 12:32:52 -0600
Message-ID: <20240108183302.255055-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240108183302.255055-1-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Andrew Davis <afd@ti.com>, linux-omap@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../bindings/gpu/{img,powervr.yaml => img,powervr-rogue.yaml} | 4 ++--
 MAINTAINERS                                                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/gpu/{img,powervr.yaml => img,powervr-rogue.yaml} (91%)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
similarity index 91%
rename from Documentation/devicetree/bindings/gpu/img,powervr.yaml
rename to Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a13298f1a1827..03a8308b41ae7 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -2,10 +2,10 @@
 # Copyright (c) 2023 Imagination Technologies Ltd.
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/gpu/img,powervr.yaml#
+$id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Imagination Technologies PowerVR and IMG GPU
+title: Imagination Technologies PowerVR Rogue and IMG GPUs
 
 maintainers:
   - Frank Binns <frank.binns@imgtec.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index fa67e2624723f..5b205795da04e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10461,7 +10461,7 @@ M:	Donald Robson <donald.robson@imgtec.com>
 M:	Matt Coster <matt.coster@imgtec.com>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
 F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
-- 
2.39.2

