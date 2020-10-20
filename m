Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A572948A9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4394C6E971;
	Wed, 21 Oct 2020 07:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26EF6ECF7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:43:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f21so2704128wml.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g4H4mc6v2t0oOJX5XSAB3K/LcyD6Rk2g297NTsU0GuU=;
 b=zWcQSDXlGP/96zUAfH5qPzycQ/AK5pvGi5nwVMEHX2j4ynLCXSTLE9qp2r/ZgqpVUR
 HA4D1J8T985dXMnBot5cPB28dimAo8DbYhVpKNYcT1r16Dp5UCWtXkC7BhzEAmk6lA2g
 LpHwQfBiC//6+oOIGn6NZOgytNPgkOhkrdzAhDd/Ff3HFLkWlrnIZt4BF44SrQs54cRx
 StyTw8GWO+LWjQ83yf9x00GL0dvfB3wxR/joYpUni8MOUFzJyYVcAffIhlF8gMBjZJun
 aWGPqjxjC2VoTAS83J6nVKBM90FEti2y28QHrYBcXLGmR3o0dUCskFCU3YFDFYZAOM2K
 +J9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g4H4mc6v2t0oOJX5XSAB3K/LcyD6Rk2g297NTsU0GuU=;
 b=lStYJ/6qkmIrpXZimTrzjxwJfvFyYmtd85gCRyjkmkdnC+MV3dlxIFlO21ew7AWIEF
 jq382H0Cf9+Bu70OHVZlvUpi6t+dyTP6VKwv5Us2JqWCqn2qoyxy4mTGD8DUXTYbFYy1
 CuIUxAFiVtYMP5zQ7030k1+V7grSjM6bOCa2+LVOGt70e/U7l7Pxq2otNdJlPs+PN5fQ
 Coql8+nklqPDt5L7BrvFaTbQkMhHtmKBdv30QH4833Nd99xS5MQOYRIC8DFHZspPrYss
 0QglGvHL+8o9BxySL/fyOhntZMQfCXZEKjgbtus7MYTSr3zBh8PBzxiwKSvM/0bGTu4z
 yt8w==
X-Gm-Message-State: AOAM530Ml50fXtbhaNrSVudL9EZlhDVsG1jrsABRuyAoLSaH/CU00+DV
 5OEfyN8TCm7bDxP2aifCII86Nw==
X-Google-Smtp-Source: ABdhPJzkT8+U0NpjdVHnhaATbgwrjwpAwrtedA64YWHG7Oi+SvHzjUWaApwcG7WmvLCZ+XbT8s7K3g==
X-Received: by 2002:a7b:cd85:: with SMTP id y5mr4068624wmj.168.1603215780592; 
 Tue, 20 Oct 2020 10:43:00 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:00 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] dt-bindings: display: mediatek: dsi: add documentation
 for MT8167 SoC
Date: Tue, 20 Oct 2020 19:42:47 +0200
Message-Id: <20201020174253.3757771-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding documentation for the MT8167 SoC. The SoC needs
an additional clock compared to the already supported SoC: mipi26m.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index f06f24d405a5..10ae6be7225e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -7,12 +7,13 @@ channel output.
 
 Required properties:
 - compatible: "mediatek,<chip>-dsi"
-- the supported chips are mt2701, mt7623, mt8173 and mt8183.
+- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
   See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: must contain "engine", "digital", and "hs"
+- clock-names: must contain "engine", "digital", "hs"
+  Can optionnally also contain "mipi26m"
 - phys: phandle link to the MIPI D-PHY controller.
 - phy-names: must contain "dphy"
 - port: Output port node with endpoint definitions as described in
@@ -26,7 +27,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
 
 Required properties:
 - compatible: "mediatek,<chip>-mipi-tx"
-- the supported chips are mt2701, 7623, mt8173 and mt8183.
+- the supported chips are mt2701, 7623, mt8167, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - clocks: PLL reference clock
 - clock-output-names: name of the output clock line to the DSI encoder
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
