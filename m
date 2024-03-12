Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633CF87911F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 10:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFC7112BEE;
	Tue, 12 Mar 2024 09:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ac1FXk2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B20D1129E6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:41:39 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F4612133;
 Tue, 12 Mar 2024 10:41:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710236476;
 bh=j2a+fTDMVSBS7rEaJXfVLc+dzulfLunaNx5cADI5ti4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ac1FXk2B1qAQQkMqGZ+GPiSAtyiIQik+94LwBYT1JHvkMLASSOdwLDc9M35qTGtp8
 LsHLFf0zwzNaqZ8bXSpdfajHfSqChmYKeIjdxsjBK4c1qGMEV3jQBF+vgrY6HgIoxx
 zBfzbx9jPNo+O50n+lAQIxER2uLV0tmJgiAEhDaY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 12 Mar 2024 11:41:04 +0200
Subject: [PATCH 3/4] arm64: dts: zynqmp: Add DMA for DP audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-xilinx-dp-audio-v1-3-696c79facbb9@ideasonboard.com>
References: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
In-Reply-To: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBl8CNL7JHIYQ5Lh00SsbllFwWlS06TdmgtH1mHR
 Gdqb16gSymJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZfAjSwAKCRD6PaqMvJYe
 9fUwD/0d+j42xGdpW3Tz+0ipWYy7jNZIsJHIbXVXX5+/KTNttSCGjp627yKTlSeHBJ6MsbyesZ6
 7I6La5WbDbrzVd9vem4K8+h82c92s95KE07KgkJJt9JawdZ58M0o33906M5YWJiPyH4ho+ybEb4
 I/H976VYwkQDWfmnVDl1kViR4Cwm2i2ozPnBWPGgT2Kz8XYhAzbLHirmxLpsfI03Fo4gg3w3yaU
 07gHi61aeyLn1aqPZYbiC+ZM2g/gE5kE2NQTFdxEzaGyJGZDLedlt+J8Yn4TD1UN+OQYcjaCsha
 hhlzyvq485p6JaxkthPt8mxUuM/fD9ePj8dCEuj9nY/J2EnHnJcNFOb24IqvmZIMurrNrzS7lul
 IMJ1Ol6lZPXo3p3n2GYuOx0kU5pbj3P81zzjypQ4m7e+OxxrxfUT3Q7+fe67e/X1toRyIpFNnig
 O8aY01wY/+jtmCqTCP8rAxN6Kku2zVRXCs6qtJBSj8eekkackk1xtvmjBuDw3teTgCGuGCKiMAg
 QAvnb8ifHC6AibyFv4F8aCbg/Nl0X3uBQfQ2h62T8LknxcoId2qMdUNa+1xZOec/vkASKDs5I3W
 IT7anAAMJG3KXUi7bkv6yJAOn5o3yl+bzBMRLbVUw0Ur4rnh2rEukm9dnVtYONhDe62YszfUZfA
 kXOQGrQSikHSMNw==
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

