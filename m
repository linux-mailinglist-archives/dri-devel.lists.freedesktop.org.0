Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A487F977
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2C710F675;
	Tue, 19 Mar 2024 08:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pcuJTK+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C1710F63D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:23:05 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7A6F15C5;
 Tue, 19 Mar 2024 09:22:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710836557;
 bh=Y6RVmetmEgN8TWQrDypOJtqOBBn8R0DdUU+0mKHsKSI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pcuJTK+vdJYFs7vayb7mfXzp4i6BuS2xCcxlHJ21wLspUgFh8C4TMm1fteUTUWbwF
 JjmBGZietswKUr0YfnMxBjElRLSJVz7o9YKNv8/DAtqTMBqRvxelByeSqS++OIeodM
 iNr5dQ4LQHJkehpPHrgfF8pM3PSpOZ+NxrqoycZI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 19 Mar 2024 10:22:37 +0200
Subject: [PATCH v2 2/4] dt-bindings: display/xlnx/zynqmp-dpsub: Add audio DMAs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-xilinx-dp-audio-v2-2-92d6d3a7ca7e@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Y6RVmetmEgN8TWQrDypOJtqOBBn8R0DdUU+0mKHsKSI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBl+UtjjF56r9Z+SUr4eRYEonZvLbfJ15xHcwtSi
 jhkC69VbjaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZflLYwAKCRD6PaqMvJYe
 9UQrEACV6QbO8hdZ6rrKyFLxpH5xlL85wzqzG8z19wnxZxMQCIq8/xYnCnK9Wyza4zZZaVLYcGR
 AjC5rAoWfvBdQ0Xj8UKkgffv7pTQmy7FITnfZ/pvlzN7TOV8DPIQ+eJufdHzhL0EtNs1pmG1+JR
 oXZy2oQVyeKryu72cLrK7FypIFxy+Am1fb4xLHPvDFNcXa6KCXPshYNhx2/VOxUhdHNppftnF6g
 bXdVMK4dBqTz9fO6ZtgomHH+SDqDrRn/XZIvk/CeqBmocvAenN32VzkcvUsj5EuRcgsFx6Hb/fr
 of97GtTHggJqSyfR4HMui77EQSugwvGMiK+UJ+SYdBQNkpvUUzX7KRgpqahWNr5W8BErRdyuXhS
 kKNTXDcXIQGVfvkda1IDlXprMTFCqtlbQ1OYUTpWv4sBqEtT83Xs0TgccG15svKv84XOfvRY4ng
 sWz1Btk99Uvb6mKE59+wqyI09bU5rDn2Q6mp4bp/5QF0LlR0GhyoM19i1+Rp/BlHR8N7gS5kAVs
 nLTp5/v5UTZQe7teULekF3ziNA3/mn3tBGsaRZiV+zwLQJkkp9mFyFg63J9GQzqiJdSpj9NTery
 FE3wSZPLb+b/OWe1tK52X5lOiYdHpFxuZPjIFF9geXdriH1UTMPro8KvPcLgtSc7/lac9cc2276
 Jyc0D+k3Ko7MGOw==
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

The DP subsystem for ZynqMP support audio via two channels, and the DP
DMA has dma-engines for those channels. For some reason the DT binding
has not specified those channels, even if the picture included in
xlnx,zynqmp-dpsub.yaml shows "2 x aud" DMAs.

Add the two audio DMAs to the binding.

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
2.34.1

