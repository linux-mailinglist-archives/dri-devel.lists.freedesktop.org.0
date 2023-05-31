Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA72718EB4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 00:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2229610E0D0;
	Wed, 31 May 2023 22:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FF110E09A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 22:44:24 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-19f36a8ac3bso65484fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 15:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685573062; x=1688165062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+qAm6lJtIaXrOiQsiFuIqulJfUX5jtP4++fTCzQGAkk=;
 b=LyJHWMqDhvWOMPsTtIdZ1uvjI5V6dS2TmPwdkmjOzEEbt3X/m1srt6mBrKWlG3z5dk
 0XEXTiApoQOSqV3yTF2iTxpTY+kYitItA5XMMPeKP0yntye6c32efMhM7u3eBmn1ckbo
 GXlxWUOaJCToPCP8wWe/yPzVlpwOALRQ8hnWwevC6gl3G7sWZQ4yXatiX9HGcCYtw5iI
 oJLjvTLJTy12BpNbR7wYuARCw9ZBSJFncR3pnp4afeKl9jEjgQv0gtEchE51i4r3D3RB
 EFZp4OJPkRQmUdk3FGj1vGNlN0d/H5GDwdoSdd5XMQxb82MK8+uLUjPUqmHaHGKIAH5H
 4HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685573062; x=1688165062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+qAm6lJtIaXrOiQsiFuIqulJfUX5jtP4++fTCzQGAkk=;
 b=PDdalD4OnWODeClcriXBIUdQITqmDYJz/Alx5MnIKWTOn1izBb6pT6WyCY9UhJtR8w
 Ysziaxgm14QbMRtIbpBSnzPqRBYP3DWna1dWtcOnS5wE2FHKaPS/NInqvJ/S1uGcS/Z2
 fQ45+pbu/UcIS3L5gCDMGWtalcm5l+CyH3f/OQzA5tIPO1EtZJ1xEVSTBOfVvSCNaJTl
 blwrH2SxUqyvuhzuU8ObNCuqOGwXX7DNk7EUVG7hoSeecsCOBAFEVVhmKL7tjLMPT6+f
 rmkf4Tnu9f+UhjIZAqEFO1V0LE3xfQ25xvFjZu5EEmiEtg4AycBZxa0xQ8CgOXfRGZNI
 e70g==
X-Gm-Message-State: AC+VfDx07iWtbAUAcLWM2mHvw9qMj1hd3U3k9NjzthZT9kGLgC61O8JH
 dYe2dcHAqp6qgXBsnSMb+jw=
X-Google-Smtp-Source: ACHHUZ4YlgEh71eKJH/OcPJBJuEv/uqrRHNiRWwQWpGLWveQNdS9cmYPwBDa1k2OJ+zcw6KuYnh44A==
X-Received: by 2002:a05:6870:969e:b0:187:7a49:d227 with SMTP id
 o30-20020a056870969e00b001877a49d227mr3006535oaq.5.1685573062389; 
 Wed, 31 May 2023 15:44:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:f4e7:b79e:da9b:f89a])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a056870214300b0019e8deb387bsm1062386oae.53.2023.05.31.15.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 15:44:21 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v2] dt-bindings: samsung,mipi-dsim: Use port-base reference
Date: Wed, 31 May 2023 19:44:07 -0300
Message-Id: <20230531224407.1611952-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Use port-base reference for port@1.

This fixes the following schema warning:

imx8mp-dhcom-pdk3.dtb: dsi@32e60000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
From schema: Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml

Fixes: 1f0d40d88f7a ("dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to yaml")

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Only changed port@1.
- Used Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml as reference. (Thanks Marek for the suggestion!)

To reproduce the original problem against linux-next 20230531:

- Enable the mipi_dsi node on imx8mp-dhcom-som.dtsi

 &mipi_dsi {
        samsung,burst-clock-frequency = <160000000>;
        samsung,esc-clock-frequency = <10000000>;
+       status = "okay";
 
        ports {
                port@1 {

$ make CHECK_DTBS=y DT_SCHEMA_FILES=samsung,mipi-dsim.yaml freescale/imx8mp-dhcom-pdk3.dtb
  UPD     include/config/kernel.release
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTC_CHK arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb
arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: dsi@32e60000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
From schema: Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml

 .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 06b6c44d4641..4ed7a799ba26 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -103,7 +103,8 @@ properties:
           specified.
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           DSI output port node to the panel or the next bridge
           in the chain.
-- 
2.34.1

