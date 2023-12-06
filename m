Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F95806ACF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95BD10E67D;
	Wed,  6 Dec 2023 09:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C189110E67D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:36:59 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6ce6d089482so293120b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 01:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701855419; x=1702460219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+2dLAKSciKS7QGuXNKASoK14doRScvY7pNxRNpgN9Vs=;
 b=k8XELsPuqksRaqa7grW2OpckCea99bAv4HdGQyWeJt2jiSW0+SgCNfLEnQo/WJtlaP
 yVdrWVLUgJCgDgp5iKZik/cDScGitIsflwZ3xaDrVZgYMZ2alU7LQvH42/PVOiDQ35pH
 N3qNy0gW6Bn99/cSWBcSmmS7KyH2oDKX/RA9SuYRQdTVgPqEZQ2NQrB20aSxEKU189fr
 2PgE8FQC3RMJK5v+nkJC3hKo/IFpu/v+c5xdtx26molwSNu+yqmSJytgQxa8ZKif8149
 +JnV34O3F6UTvP5oFrPvEEpZ96MeceCsNrD1B5/ydYmEMH68R5/TmoBFqzKnNu+dFU8D
 xETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855419; x=1702460219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+2dLAKSciKS7QGuXNKASoK14doRScvY7pNxRNpgN9Vs=;
 b=IE23qADE3PYjX7GRwWL+HxFwuKhzRTM+hVOhCU4D7mmclgMWfEB/F/avxAqp+7m6it
 EvFtHP/FmP+U/hw9CHewJ3WWfsQPypCxl986R6bZ9ty8zm3KjkkT+z75BCVVzDkQtNL1
 SvsELKUiIl7ivofU7prdwRFnSyoJj7nrf/wjNVVVmvWOkPw38LWGz+P11JWZXx+covC1
 Vn9Vg9BgxVD9WZ3denRLFYJGVhAgg1/xM2M5zaCjKquszjqTRVFwzYT1hvaiWiXnWt7v
 GdJtMt3zmpNDXHPWuKIzAZKWLAkoEJTjKRCUzFB3W89iGFgp9UbNiPBEa2HczM4ZcHI1
 Eg0A==
X-Gm-Message-State: AOJu0YxOtpF8LUGx9AQISx8GIPtPQ5Z6LlZu63zbAAzlqHw9KuQFxG8l
 xePUnMI9vxgQKV7+ccCDzi8=
X-Google-Smtp-Source: AGHT+IGuvJpJ2JVFORtV9m0mcL7xmhK4OZ504kkGXUtWUlhbRbAbMPOFwH0KxW02LP803euUV3Cd1g==
X-Received: by 2002:a05:6a20:4308:b0:18f:c9dc:df0b with SMTP id
 h8-20020a056a20430800b0018fc9dcdf0bmr1177622pzk.2.1701855419145; 
 Wed, 06 Dec 2023 01:36:59 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:6764:e124:5ffc:3f5])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a62b81a000000b0069346777241sm3052504pfe.97.2023.12.06.01.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 01:36:58 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH v2] dt-bindings: display: adi,
 adv75xx: Document #sound-dai-cells
Date: Wed,  6 Dec 2023 06:36:43 -0300
Message-Id: <20231206093643.2198562-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, aford173@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

When using audio from ADV7533 or ADV7535 and describing the audio
card via simple-audio-card, the '#sound-dai-cells' needs to be passed.

Document the '#sound-dai-cells' property to fix the following
dt-schema warning:

imx8mn-beacon-kit.dtb: hdmi@3d: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
	
Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Adam Ford <aford173@gmail.com>
---
Changes since v1:
- Also pass '$ref: /schemas/sound/dai-common.yaml#' (Krzysztof).

 .../devicetree/bindings/display/bridge/adi,adv7533.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
index 987aa83c2649..df20a3c9c744 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
@@ -9,6 +9,9 @@ title: Analog Devices ADV7533/35 HDMI Encoders
 maintainers:
   - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
 description: |
   The ADV7533 and ADV7535 are HDMI audio and video transmitters
   compatible with HDMI 1.4 and DVI 1.0. They support color space
@@ -89,6 +92,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 1, 2, 3, 4 ]
 
+  "#sound-dai-cells":
+    const: 0
+
   ports:
     description:
       The ADV7533/35 has two video ports and one audio port.
-- 
2.34.1

