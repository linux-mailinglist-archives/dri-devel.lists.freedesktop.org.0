Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F6973616
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 13:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B21B10E79C;
	Tue, 10 Sep 2024 11:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mBgku+ll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF6A10E79C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 11:19:44 +0000 (UTC)
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDFB3FF1;
 Tue, 10 Sep 2024 13:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1725967107;
 bh=eGyniIEgbkS4I8Jn529EjLVW0KnnXapSyYJ+FqSew3A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mBgku+llg+BIUgJTgq6SiidI7T1R3TmvMsO5eX7x2lGRbpXvplOqcftSAbb11oqxa
 zrjOLHTlMqwZymfZQQe9Ma2KGyzbZiNwvRAOet7SRh+ULjpIDYd1PNbAelXCEy82xn
 0sM3DrBDbmbspP5cXQMtRzbKhaWkdi6MXKMusGSQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 10 Sep 2024 14:19:20 +0300
Subject: [PATCH v3 2/3] arm64: dts: zynqmp: Add DMA for DP audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-xilinx-dp-audio-v3-2-75560793f4d0@ideasonboard.com>
References: <20240910-xilinx-dp-audio-v3-0-75560793f4d0@ideasonboard.com>
In-Reply-To: <20240910-xilinx-dp-audio-v3-0-75560793f4d0@ideasonboard.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=eGyniIEgbkS4I8Jn529EjLVW0KnnXapSyYJ+FqSew3A=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm4CtKYSabCVXHi5MvaVY/G0yQhFQTFHkgWCVVK
 cmRkpBrcR6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZuArSgAKCRD6PaqMvJYe
 9c2LD/wPLQof/ncKsKJvz3V+ftvxc5l++2e+4XkFjyhZ/7Bq790n2ZEv9HwVX5gYGBEr73Efw3H
 mi0NdwU6Sjz9Aws8TnOpR2paNST/Sh8XMDCa65i1tffkgboi1xRLaJWQSZ8gyVVZ61asNS/3L8o
 ZqO7pv4ly0ljhyYViG25soeXQH5kBdz50FXs9djtvSEJ3kSFxjdEhqpsrB8TrCekH18pdqshVJm
 0SAK0Bd5fHeUNqM4QELW5++csDSn4ka2f6aJ2CCl1kl7AaPgtWymiKYNjwbjLgbwJUCnXMP+BCG
 a1ObCoPqS80r24KmuHjQqJ1CsfgPDoo4xYdiNR7+SrXKStGnuVPSA9bqTeNzaKBLfWayTpWZ5tT
 Ooi39Z823kHN6PsPUuTR2gLgXFAzYMIqY9CnbnNMA2PNJPxiLHqPzF441Bppik7cP/J8/U7sFJU
 miD/3DShlmvWq4kcOM0yKWxEskI3qubW/GzmU0T2Qk1tIHptZzmnfsvIDE2wmy+376hIeh5GNND
 tduOi7Uu9qYQ1mPOx0MSbGW+O2eb1PKtRqBhKLvf/MMWTVrrP2gySF3cf/hGTtALjVZ9hS5oXp8
 f+khn9q3u2F500lsCDkPsue7M4prYRhLPQW6HnOkdxG+5RI2BbPIOrBQdslBrczUS8q7XDbiOKn
 oYEGtJkHnEJkqVQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Add the two DMA channels used for the DisplayPort audio to the
zynqmp_dpsub node.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index b1b31dcf6291..673ca8422e6b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -1207,11 +1207,14 @@ zynqmp_dpsub: display@fd4a0000 {
 				      "dp_vtc_pixel_clk_in";
 			power-domains = <&zynqmp_firmware PD_DP>;
 			resets = <&zynqmp_reset ZYNQMP_RESET_DP>;
-			dma-names = "vid0", "vid1", "vid2", "gfx0";
+			dma-names = "vid0", "vid1", "vid2", "gfx0",
+				    "aud0", "aud1";
 			dmas = <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO0>,
 			       <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO1>,
 			       <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO2>,
-			       <&zynqmp_dpdma ZYNQMP_DPDMA_GRAPHICS>;
+			       <&zynqmp_dpdma ZYNQMP_DPDMA_GRAPHICS>,
+			       <&zynqmp_dpdma ZYNQMP_DPDMA_AUDIO0>,
+			       <&zynqmp_dpdma ZYNQMP_DPDMA_AUDIO1>;
 
 			ports {
 				#address-cells = <1>;

-- 
2.43.0

