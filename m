Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C29C7120E3
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ACD10E7AB;
	Fri, 26 May 2023 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175A910E7AB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:27:19 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30959c0dfd6so319781f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 00:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685086038; x=1687678038;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HDBB5eovZhlXrO3g9LqieVp5YonZKlA4uqXGyTCZauw=;
 b=s6NXn1a9+f1yxRDLZnaZR1IlK/wd01PSrJlX5zKR38PS8N0L9yVuE/nXahJqTpU6nW
 3MfxHXTRXKu3h1hU5MEEcXkG2+WuTXmUOzg/Kcfq9O7j6iBdbSUGQGDfswvhooSYZso+
 z9KdZNa5bre5xMS1f+rwJEhHmK9gPCGRtKWs+XHopFzCxtHuPKb173CD5xANhudaOqGg
 AuRy9PysDziq/YBnEzbY3p7wnPJhT7XEttDv9OgkzRAgbpnSHavpc4R//E95Sx2SjpVk
 7L/gvW1ksCh8v9t2O8NjRe4djsksy4eIuGzwpqVCfu33MDJYD5AUO6sNq6I/boyZ2aYF
 0h4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685086038; x=1687678038;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HDBB5eovZhlXrO3g9LqieVp5YonZKlA4uqXGyTCZauw=;
 b=W4aofiA3vgVXKvf1qW+RKC/G3vfDMg0oKINmgEX1ZODHSU6oEJPLrE/lmYxdHnAaIk
 UcQTF1Lq455XIRZ1eYqlVfKY141D1s04n2Rv79dOuCnmGIht3PONlIUPpoz0nj8RLQaU
 /D/vdX4DQjXCJzM27+8hh0tTTapbc7NPBR6+gaHrp6tVKKfXioS4rjsb4u7gY59jrFU4
 QdlJJMNGeJ0gNUARpp3acH8p2BB+F8Mwz/w20/eaeTFzK7RExoWg5Ftuq785WpYa+3U+
 edw13O1yVb2RptCdZr8Z1duErV7KcIBhJmWrs3/Ha+8nzcjZYIJ5ZclbUv4rVVODy6no
 dNlg==
X-Gm-Message-State: AC+VfDwK70hfb/F530+KTs+yr95DdxXS2S527lxUaeiH2uv+2tiYWdEm
 xQrUwWlhRFxAV89pzRR0Jjet8Q==
X-Google-Smtp-Source: ACHHUZ5P9CXsJJ60w1KQqJgy7f1CIIOVw3ItSGBLqDHqhJ7IlZSnsbm8DHUs2HIcAP0igdCbVAPdGQ==
X-Received: by 2002:adf:e941:0:b0:309:44ed:ccff with SMTP id
 m1-20020adfe941000000b0030944edccffmr678149wrn.1.1685086038397; 
 Fri, 26 May 2023 00:27:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a5d54c4000000b002c70ce264bfsm4119604wrv.76.2023.05.26.00.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 00:27:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 26 May 2023 09:27:16 +0200
Subject: [PATCH] Revert "dt-bindings: bridge: samsung-dsim: Make some flags
 optional"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-revert-bad-binding-v1-1-67329ad1bd80@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFNfcGQC/x2NQQqDQAxFryJZN6BjVexVSheZmagBiSWjpSDev
 aHL9/iPf0JhEy7wqE4w/kiRTR2aWwVpIZ0ZJTtDqENbd6FHH7HtGCljFM2iM07DQG2isb83I3g
 YqTBGI02Lp3qsq8u38STf/9PzdV0/1P20cHkAAAA=
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1qywf6uKYxPPVGd+4S1H+CwZp4Z/nUxjv97YfdQmNPo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkcF9V9rgQyPLabyak6KxRL0N36QLgt3oUO6eirYJj
 w8i13PeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHBfVQAKCRB33NvayMhJ0R14D/
 91Z/BQ19siSPfErk/MdDGU0O3VokdOdXV7s5NPCVig89zIBcuVB1wIjA7FXca5tKORvNdJLC2kMBDt
 VNWmuA+OZUiHcbP6BcVzDtYPzzDni1V/2lYFudG7Y6kbR+Dk6lE9kFL2s6G4MZ5IoysrgAW/sdwd18
 GEaQJmFYTPYOLtnueL1K5HGn8IdleSOGnbt205nfjNBqVj75uXOj80TuteuRqwSOkp/ak+k+/N0CD2
 CN8VFySoIYCsoevUEWAM+SBsP9FAAiNEsZAk6Q2NnT2irPWqcx1PsE44Eb0qzB88/s7vLeF6H0W2zy
 BOIln/AXDCFKAZED/Y+QHmBCn4QCpmWPH7tvTDoUEIc/AB4Zs3nSujj9DGoapi6tyHg/tsIh6F6W7l
 35fpXYrXC5KLiKG2pqTMKs093OYhV3FePLnzkT0qLR4b7ee2A7cItZs94d1wy8w42yddgXr62/iook
 XnM4ohxOoOaoGsFHdV4BNaN2a57chF/+Z81mqfwEvRKQ3nxhTAYOFIvKkjpBr+jQEvwm7mlfsOT5Yi
 S0W+v/vjeKLkNal+IsECxCRHYDS5SOxzMgor//H4fNEnx1pgTE2Kd8YNow5cr0FQ45x7CTxdKlstep
 d9S662YGufYcUTcnnBFt3FBJCrznnK1JsDbbk/7cFtP/muShVlUTwFm2xk7Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
 dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit cfaf76d349837f695c8aa6d7077847fec4231fe5 which was applied
without review due to a bad tool manipulation.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml    | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 360fea81f4b6..9f61ebdfefa8 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -70,9 +70,7 @@ properties:
   samsung,burst-clock-frequency:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      DSIM high speed burst mode frequency when connected to devices
-      that support burst mode. If absent, the driver will use the pixel
-      clock from the attached device or bridge.
+      DSIM high speed burst mode frequency.
 
   samsung,esc-clock-frequency:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -82,8 +80,7 @@ properties:
   samsung,pll-clock-frequency:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      DSIM oscillator clock frequency. If absent, the driver will
-      use the clock frequency of sclk_mipi.
+      DSIM oscillator clock frequency.
 
   phys:
     maxItems: 1
@@ -137,7 +134,9 @@ required:
   - compatible
   - interrupts
   - reg
+  - samsung,burst-clock-frequency
   - samsung,esc-clock-frequency
+  - samsung,pll-clock-frequency
 
 allOf:
   - $ref: ../dsi-controller.yaml#

---
base-commit: cfaf76d349837f695c8aa6d7077847fec4231fe5
change-id: 20230526-revert-bad-binding-f77a3ca96419

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

