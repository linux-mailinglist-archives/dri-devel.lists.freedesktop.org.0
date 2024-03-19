Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100BC87F978
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CE610F658;
	Tue, 19 Mar 2024 08:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WnKdGDY9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E76E10F653
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:23:06 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B55F15EE;
 Tue, 19 Mar 2024 09:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710836559;
 bh=j2a+fTDMVSBS7rEaJXfVLc+dzulfLunaNx5cADI5ti4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WnKdGDY9sUQJC/OaZKt9WkDaMF1FlAmPSqXYkh2g1BDXpsv52hMv3CdXXc86njtpt
 n2o+rp6qVDYzNckEnTeKUYIWH4iwHWuBD1nFp4jchlFUheqdgXRGADIOycVtaoZ5y/
 XNtzhDhmFDKGZbYNeaXclT2r9E05irJmbT4pJXkg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 19 Mar 2024 10:22:38 +0200
Subject: [PATCH v2 3/4] arm64: dts: zynqmp: Add DMA for DP audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-xilinx-dp-audio-v2-3-92d6d3a7ca7e@ideasonboard.com>
References: <20240319-xilinx-dp-audio-v2-0-92d6d3a7ca7e@ideasonboard.com>
In-Reply-To: <20240319-xilinx-dp-audio-v2-0-92d6d3a7ca7e@ideasonboard.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=j2a+fTDMVSBS7rEaJXfVLc+dzulfLunaNx5cADI5ti4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBl+Utjsbbzif7kYkgC3a3LIeGT0tK1XhAiEMFyC
 wvW8uwKxoqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZflLYwAKCRD6PaqMvJYe
 9W7OD/9dXHV2nZOs/P2aEWzcGt5Bbju6MhcKZbyAysKe+9PDGkfkdjCI+H51HeWUOUJGbjL8os7
 XjZmtyRZkuRTf8qlQrYKgrRfym4waSFtPxVDiPgW74D96TAmuZiXldmSywn0J3o/dI4c3ylRyGS
 S74ZR9uxr/iCi7BCUx0i3OxNHllRsz891PWnLehp1AUtZXo2sygtit9DhvtGRF57SyZ9DXJfNAH
 PnywvPtkfNCk8gJSYO26nldhfxhmxHVycHkLGt2/hdRJKWqS+8eVzgyl4+Wwxatp88hNGR3XkXQ
 i2GtS2fnKHZBo4m41iad7092NSa8awEPmlFDVzySW5IWsVnnk/3VU0flbtNY6pOJtfXqWMDaCPf
 JlTuyuQ4cd8Xth5dycQ3Jez2HVlSwfItgJsG3JuH8KiP10D/ylVO2lAhCIYO+ofakGu5yAy215f
 ojkOdHXF4cPcB3R3s1SN6aRF3k6aLXeIKuBwBT6G/21lntMpALZjLnlozKXRjTqBogVvEnuVo1j
 CAOnjeEOEO7NaWsu15ebPmqAOf8CrAKS8eoP8HlYAAYVobF2vTu/D3OoQIM8Se8PGRNg3GMfD4A
 WVY5s7LCoG6zY8LnNMn4cfv00Uw7JpnszLQBcZyQORqtaFVFVVkjrQ7v1vOQJEOQ8aOmMyjwOgQ
 opV7tYtfJS6ubUg==
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
index eaba466804bc..811d80cbf4c5 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -1036,11 +1036,14 @@ zynqmp_dpsub: display@fd4a0000 {
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
2.34.1

