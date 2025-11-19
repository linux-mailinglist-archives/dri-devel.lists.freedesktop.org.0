Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA8C6C61A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 03:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B1B10E551;
	Wed, 19 Nov 2025 02:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YgahwC+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600FF10E551
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 02:30:16 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-343ea89896eso6204652a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 18:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763519416; x=1764124216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IAUl3DvNF4a96OMaEmiq14uCqbdByDkYT7FAGSKW29g=;
 b=YgahwC+H+X0/qmQFUigc9V5pXEHE77OlUaMoUWJK+FSIdxD9Cp5DM+f05onKF1cluL
 LHvUMeE4hSunfXty00NOZ6zeJ6PeRK5O4afxgs4KlbBY/aRtYz7nphqFUywZlPIkJ8rt
 p/X4fKgwEWoa9wWneNIybj1Fi87QezIK3p18ZHZlZW4kLzSLH4pmYZMQ9JH/9lVuG2M0
 6+3VnaKM0I6ASLcAFjQ+TtIDnI36aOIONppoQS8fA7sp/316SBoBkl4H+YYwoPpBGZYF
 O+B97qhBqSi1RlJnNFoAhbiz3E50EO/+IN6mvvn11F8S0QyzT/hU60g7bVgNV/g1DhJs
 t12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763519416; x=1764124216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IAUl3DvNF4a96OMaEmiq14uCqbdByDkYT7FAGSKW29g=;
 b=aB4Eyya+M9ZnmzuTxgUCbI41gHeShaZ5GUKN5rTo4dnoS2UiJjhCX/fQlLoyNUq832
 jVsSo39wx4UD90AOtAsaLKub8r3ZpIQjPXAotYEBHDJCRiez6QQhhoygxAa14g+MmBJv
 rzP7xi5WXIyRHw5xHJZ0wavSn19qoKr/QamSCZlvA4h526IE+prwbh4uKh6uILdcMPAL
 1i80pm7KauEIifiNFvoQ6gxeJHZl8hCIGVwhNmG7FqFJb9e4YN0Ho/ESO4bK591rLXFZ
 xjj7UXHJWKbhG0+Xn4vywlv+Zw6B97YScJHSJ31o0lMwf7MjM+DHjIPrvyvw9sUNc4vo
 PwKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx5XPJgkneGhYfy13KRbZbuZSqGrpnUS9K6qsgQ0plRDNaZSA0wyoRcikWXQXsESxhB1dU6zuL+R4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzOSPTCFZwC1rBTFhCspqse2jHQXnCO3mluEoaEvQkHnaaMO7M
 Ksd/GZ4AXDsQFPdthI7v7HWmy+nF1RL6wFxCA8MOm7QJnUip6hzkjuug
X-Gm-Gg: ASbGnctzlpCj9sGSx19KO/PT8y+feUfXLERVyoJQ5/BCzu6P55FP8+l9NX7di5zDSpj
 /cWjpSgoucFXHi2/0SwhDO+qWAV2ibDgWdCwG9FmOmsvroNNUftM7dfy5qlxFYKlTFNq4QEizdo
 dB4YU9WpPsVfnP89wFOdLi6xP8Y1SIqrfWHeFRTnNGqd4gOrk6auzNd+GaxpBvTJJUJvQ8eeEnV
 x8KgMAPQM+fItgCOz/GI02JfeSo0meKoHt37Cqpw/WoD3REKwxjkQolz9anpWVQr8ioTOaWifVw
 mfv2p6XCFZCpzDyacOpl2xRZXz8NkUJwJm7rTNYdbbZOX1kouoDowHYXG7Ieb0Gd8BmVN33Wu7+
 RqGAie4UEMHzWjKF7Ga3V+A8HZtR6Rr+I6fDpxMqINBFpF5XtYsUbG0bdZIkkSPhe8nHtJ+9mht
 yaDlOJNVFE5Y7SjVqayLMqBd0o6VSiludATLU=
X-Google-Smtp-Source: AGHT+IFh8r79lVQpAeCYF0NNbGC4p1MGfSUZomtiu+dfIgiNGPVRw/+zobtyaOULhCb1FmLl6qDzjQ==
X-Received: by 2002:a05:7022:d8e:b0:119:e569:f258 with SMTP id
 a92af1059eb24-11b40e7b689mr5344109c88.1.1763519415678; 
 Tue, 18 Nov 2025 18:30:15 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8863:100d:2a2a:9a74])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b060885e3sm65842955c88.0.2025.11.18.18.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 18:30:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.li@nxp.com,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Document nxp,
 enable-termination-resistor
Date: Tue, 18 Nov 2025 23:29:45 -0300
Message-Id: <20251119022946.268748-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the optional nxp,enable-termination-resistor property for the
i.MX LVDS display bridge.

This boolean property indicates that the built-in 100 Ohm termination
resistor on the LVDS output is enabled. It is controlled via the HS_EN
bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
signal quality and may prevent visual artifacts on some boards, but
increases the power consumption.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Change the property name to nxp,enable-termination-resistor (Frank).

 .../devicetree/bindings/display/bridge/fsl,ldb.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90d..6bc786204e65 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -35,6 +35,15 @@ properties:
       - const: ldb
       - const: lvds
 
+  nxp,enable-termination-resistor:
+    type: boolean
+    description:
+      Indicates that the built-in 100 Ohm termination resistor on the LVDS
+      output is enabled. This property is optional and controlled via the
+      HS_EN bit in the LVDS_CTRL register. Enabling it can improve signal
+      quality and prevent visual artifacts on some boards, but increases
+      power consumption.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.34.1

