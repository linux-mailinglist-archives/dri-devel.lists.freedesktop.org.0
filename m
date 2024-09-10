Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7FA973615
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 13:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B9B10E799;
	Tue, 10 Sep 2024 11:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bXwtssOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF1410E797
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 11:19:43 +0000 (UTC)
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A5E0CDB;
 Tue, 10 Sep 2024 13:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1725967105;
 bh=2gbKCjbO/rQ1lMbWDdR6AXX0Gurc69aOVPF/Uingrl0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bXwtssOsJFTJaD0LEe1D6WlXqQHR7PJd+3sfnhoTAFpvWuDROPLKFKmXiToVNP9SK
 lJxvIiNz6BENQ+h5QL570lvoMo3gKTHZxH9Dd2+B07NABhJF8vqA3HRnuert9rEziT
 P6+H6fymj+Hj8wPqGiOCw8gt1B8UTRO66OrngjnA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 10 Sep 2024 14:19:19 +0300
Subject: [PATCH v3 1/3] dt-bindings: display/xlnx/zynqmp-dpsub: Add audio DMAs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-xilinx-dp-audio-v3-1-75560793f4d0@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2409;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2gbKCjbO/rQ1lMbWDdR6AXX0Gurc69aOVPF/Uingrl0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm4CtKgm+EqNc2XlDXS8dMFSzNafDruu/XeGWq0
 gVm7MRmIUaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZuArSgAKCRD6PaqMvJYe
 9W7aEACQNgQRnmxctbq5tQ7o5Xl/5T3Wm4W/g7tlXZp6jvw05nfnSXc13zZr16ktdpVywPSVBF9
 TKwNt+YklfR0wq34q6mIMaTfXeXbkWaEP85q74BvqkRuEjdw/QWXcBAZWClWF/s1pN1BVDBSADE
 NOIwJlNGZ+fUcbBufSI1ZNTOk1aU9Y7fnF2uuSqBm19A2cPZOpdx0+tEO9vvT/M54rlkoJI9Bd5
 LYDnvepLeAf1/sqf65hYyArghe+R9PclZpwDXrRrlxMeuf+u7F8mKTSsLw79oqZtyp8ZnCY+oT8
 ugi/JRdqZazf0jGtMdYXty2dZ3sOZMMq2/yrJn4m2uYevuKhw/zBK9ABUUs8ZymHasA8TO7DZSE
 56qwq3WJP9y6pf/GQJd3P4CIlsPKKem35EnLTJKkNJ185vcYsER89H0wRx9e0Y3wMTTdkNrbDd2
 cRcQjDNblHHc2XjimAwIXTmECj85MS7NABJ6E3pXi0YSnVdr5yC+P6LY8Em1wr/PLDKrohCT00I
 DqecCYicucKgyzywuSP97ce00BFdKDffs3rW07NKnZKzcHBiK19U1nKYpOFjp5FLm6RsQA9xYnB
 ci19cbGhrkM7SxHmTj2OSUylSEoik2ZP2jWHOrbR4hg//UvFBHlVA7burvRpAmCJcDuoIqM1yCS
 +2Gp0jM40jB300g==
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

The DP subsystem for ZynqMP supports audio via two channels, and the DP
DMA has dma-engines for those channels. For some reason the DT binding
has not specified those channels, even if the picture included in
xlnx,zynqmp-dpsub.yaml shows "2 x aud" DMAs.

This hasn't caused any issues as the drivers have not supported audio,
and has thus gone unnoticed.

To make it possible to add the audio support to the driver, add the two
audio DMAs to the binding. While strictly speaking this is an ABI break,
there should be no regressions caused by this as we're adding new
entries at the end of the dmas list, and, after the audio support has
been added in "arm64: dts: zynqmp: Add DMA for DP audio",  the driver
will treat the audio DMAs as optional to also support the old bindings.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
index 554f9d5809d4..6b754d4f260e 100644
--- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
@@ -100,12 +100,16 @@ properties:
       - description: Video layer, plane 1 (U/V or U)
       - description: Video layer, plane 2 (V)
       - description: Graphics layer
+      - description: Audio channel 0
+      - description: Audio channel 1
   dma-names:
     items:
       - const: vid0
       - const: vid1
       - const: vid2
       - const: gfx0
+      - const: aud0
+      - const: aud1
 
   phys:
     description: PHYs for the DP data lanes
@@ -194,11 +198,13 @@ examples:
         power-domains = <&pd_dp>;
         resets = <&reset ZYNQMP_RESET_DP>;
 
-        dma-names = "vid0", "vid1", "vid2", "gfx0";
+        dma-names = "vid0", "vid1", "vid2", "gfx0", "aud0", "aud1";
         dmas = <&xlnx_dpdma 0>,
                <&xlnx_dpdma 1>,
                <&xlnx_dpdma 2>,
-               <&xlnx_dpdma 3>;
+               <&xlnx_dpdma 3>,
+               <&xlnx_dpdma 4>,
+               <&xlnx_dpdma 5>;
 
         phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
                <&psgtr 0 PHY_TYPE_DP 1 3>;

-- 
2.43.0

