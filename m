Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC5769409
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 13:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2EF10E262;
	Mon, 31 Jul 2023 11:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CCC10E263
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 11:00:49 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bc0d39b52cso5290245ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 04:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20221208.gappssmtp.com; s=20221208; t=1690801249; x=1691406049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0WMB/rKA9SZTAI1IQRgHdLwr9J9XpTfTTdRysuLNm8=;
 b=B5wiNiUNBpQ5/cm40/5mR4Euud/LcpM2S1MDoIhxXQh4qa0LaT3RnuFzQxcKYIZVtK
 OIYrOjJcN4e2IcQt/rEdX/G/Qac+0oT/hHO/kJHGblNusnkn0KMYmETjY13t9ygONCag
 iiL1zd6KVsTRyjR3NfxaHbbXPNoB8l30xTG/wfcYEXg9FvCL4jKVTl/K14hA7SXaCXEI
 pHPARmy76/91ptYMjZmOiB7aIoiRY6w+0AFbtQCD1+FL59+47pX9+JpD7p3We8E4rLO4
 zqBW+mogigC1d1nu+LhrHDWribUeFW02vbxg41RqM3hWGkjZFiIAcGPdu55womGQX6KM
 qd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690801249; x=1691406049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H0WMB/rKA9SZTAI1IQRgHdLwr9J9XpTfTTdRysuLNm8=;
 b=Y8h1jmwFU0WDxcCVOnfVDGEf3RnhJ/PQivwQb5BkegnXAF/S6U8XdJB2ugnUm6WOwX
 EgFFcdHo74cHcrm5Vxn+O4kuCT9U40XdBD1I8hqaXsIJPjOBK8azmZZ6j+qOlSrEH3hF
 CNSXnCL/KyfqRBximASblWUXjBUtil+vz2F0k15K4k/DPehCo/j9PlHfakzTf96aVghP
 x1FgxP2g819gf6XqNmpq+Bl03ANT/NqdWin9v2Nq8V2u0nvI323KhJjcAn/25Zm0XlFJ
 6IJV2rUlf4jbKnwuNh2LRO1a/7MT9mRCaMVK/np+qGktA1R1l0UO5VJ82tAKYi1sKRoA
 +DpQ==
X-Gm-Message-State: ABy/qLZd8XzVFQRdhkaXbLXo+8VxiMMrIUE37DMZFtp1qaDkyeJnxqRV
 bJVH15IRPx2tFNCSEjzz0d1FOXh1tNnx9PHTYCsWVg==
X-Google-Smtp-Source: APBJJlEL6GyYYARcEpmECY3j7mHuoZbCzpcyxxbV86ML15IxgqlhlJDvc/OuaitgyiGInsT10WH8eQ==
X-Received: by 2002:a17:902:a40d:b0:1bb:20ee:e29e with SMTP id
 p13-20020a170902a40d00b001bb20eee29emr8855585plq.1.1690801249350; 
 Mon, 31 Jul 2023 04:00:49 -0700 (PDT)
Received: from localhost.localdomain ([49.205.243.15])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1709028c8e00b001b1a2c14a4asm8281096plo.38.2023.07.31.04.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 04:00:48 -0700 (PDT)
From: Jagan Teki <jagan@edgeble.ai>
To: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH 07/14] dt-bindings: display: rockchip-dw-mipi-dsi: Document
 rv1126 DSI
Date: Mon, 31 Jul 2023 16:30:05 +0530
Message-Id: <20230731110012.2913742-8-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731110012.2913742-1-jagan@edgeble.ai>
References: <20230731110012.2913742-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the MIPI DSI for Rockchip RV1126.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>

 .../bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
index 8e8a40879140..ccf79e738fa1 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -18,6 +18,7 @@ properties:
           - rockchip,rk3288-mipi-dsi
           - rockchip,rk3399-mipi-dsi
           - rockchip,rk3568-mipi-dsi
+          - rockchip,rv1126-mipi-dsi
       - const: snps,dw-mipi-dsi
 
   interrupts:
@@ -77,6 +78,7 @@ allOf:
             enum:
               - rockchip,px30-mipi-dsi
               - rockchip,rk3568-mipi-dsi
+              - rockchip,rv1126-mipi-dsi
 
     then:
       properties:
-- 
2.25.1

