Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A247139A4
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 15:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCFE10E1FF;
	Sun, 28 May 2023 13:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364D810E0CE
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 13:27:36 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7749357e71cso70938839f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685280454; x=1687872454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gEM2GqZ8OMei7ENhUmT/X40pgKCW19D6Zd4VJ4P8qcU=;
 b=R8luGRAIhXl4kxrGq9klpfmLL7HVLRAa/SX6uXo7qUjSDp7ljH+HmXvDrigp26fNNM
 Y1aTHI+PZx2p2Y6myKaWvQRpZcrF2mGS4i4/bb4OmmnpOnSY3Rftf+wSgzXYhru/szBg
 WvZzyyrNjl3vPc0MtvSM5T4SFZP1r/c5DmrXaf8TdKbEbVZViNXrhHovdRLvewa8UJru
 LbnHdaF1hxw9yFfg8R/uvFGhiSJD12OEvb3TRpjCO870OWsEA8TuSmZU2yOjd9OVKvjc
 hl68D8s0r5CMmMqZt2m+xUJbwMuhiq05UkyozbAaTmCldXLdExAGThSaDnRRSAcRnfny
 HLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685280454; x=1687872454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gEM2GqZ8OMei7ENhUmT/X40pgKCW19D6Zd4VJ4P8qcU=;
 b=V7vLDYRXau+qEAPvSYYMfI6rk1hu6neVws74znYXxmgAg0FyJpHXBszIiO9ESe7ADo
 bZHCxRRGTajOMV9ScARUR1a2igdy5ISylbr6DAVs8czWUxSQ1ZFim5FabhUWdEkE/KoP
 vFBTPo/KnXTh9Bz9RRNB6qXAhYkOMM2ZVNtwjf1uhxm3Nnnf5XWOhqOPqBZQzGuGyqE3
 J1G9jzVOYaOkereVnrYS5zD+36IwU1XzTEzUlAm34IIkHo8ltc1uXncOnG9aCqFlZ8PY
 1/bAsqCDH1HPWUdXsC+c1g1FYwM32DCrWqnaOp+lLUlpeViOuapzFczWi7+EaSphM3IC
 PkfQ==
X-Gm-Message-State: AC+VfDzXE68t7xZSEfAWjfeK/5LqMxrG8DGGh6whCWL29TOUUUYiADB9
 zFp9iefwbq4zMytTpioVmhlH7YQj174Jag==
X-Google-Smtp-Source: ACHHUZ6GtMr4xqSpqmFvjtAU90VfNw84Yg1PZzFC6bTY+R7QA/BmfifhSOuJ0y13BfpDPWumnufYdQ==
X-Received: by 2002:a6b:dd02:0:b0:76c:4ca6:34d7 with SMTP id
 f2-20020a6bdd02000000b0076c4ca634d7mr5679747ioc.19.1685280454476; 
 Sun, 28 May 2023 06:27:34 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:afd6:bf52:6c04:831a])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a02290b000000b004161fafff97sm2276330jap.136.2023.05.28.06.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 06:27:34 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2] dt-bindings: bridge: samsung-dsim: Make some flags optional
Date: Sun, 28 May 2023 08:27:27 -0500
Message-Id: <20230528132727.3933-1-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the event a device is connected to the samsung-dsim
controller that doesn't support the burst-clock, the
driver is able to get the requested pixel clock from the
attached device or bridge.  In these instances, the
samsung,burst-clock-frequency isn't needed, so remove
it from the required list.

The pll-clock frequency can be set by the device tree entry
for samsung,pll-clock-frequency, but in some cases, the
pll-clock may have the same clock rate as sclk_mipi clock.
If they are equal, this flag is not needed since the driver
will use the sclk_mipi rate as a fallback.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
V2:  Split from driver series.  Re-word updates for burst
and pll-clock frequency.

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 9f61ebdfefa8..06b6c44d4641 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -70,7 +70,9 @@ properties:
   samsung,burst-clock-frequency:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      DSIM high speed burst mode frequency.
+      DSIM high speed burst mode frequency.  If absent,
+      the pixel clock from the attached device or bridge
+      will be used instead.
 
   samsung,esc-clock-frequency:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -80,7 +82,8 @@ properties:
   samsung,pll-clock-frequency:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      DSIM oscillator clock frequency.
+      DSIM oscillator clock frequency. If absent, the clock frequency
+      of sclk_mipi will be used instead.
 
   phys:
     maxItems: 1
@@ -134,9 +137,7 @@ required:
   - compatible
   - interrupts
   - reg
-  - samsung,burst-clock-frequency
   - samsung,esc-clock-frequency
-  - samsung,pll-clock-frequency
 
 allOf:
   - $ref: ../dsi-controller.yaml#
-- 
2.39.2

