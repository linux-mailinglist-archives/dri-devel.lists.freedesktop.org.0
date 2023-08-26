Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A878994C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 23:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5543D10E0FC;
	Sat, 26 Aug 2023 21:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFD210E0FC
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 21:54:33 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ff8f2630e3so3121388e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 14:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693086871; x=1693691671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hFp0Ejmw6gkggNlBSTHSqCPnLpG/phbaprHF2ZM9Jhc=;
 b=LF+YjHv9WrkNwVqh+xE+Z3vrAFFIjRKQ4HkzBD0wXrPewZFwJOnjqBxe9/o0bR7i4V
 w8SFwWcScli2rbVkKWkg+2PFrZOjqZKKykvUWEqzFfzWQSvmFMtZAOFRhO4q27elekWP
 hG7AYbfw27Th9c0TMvtH3CJD+yButAgbTPEJu0ERlVh3mQb62q0I7EekXAWyHRU3+Tle
 uErQTQ30+V2kwbyAQomah+YwvHUlWr+V9PkHnQrteUqFqIbKqmqPqExqrwvr89PDixR9
 V0dc/X647EyxP4s9ATbPSOf8GggYRgOY2KRUTeq66k038RWAzD3uK5BHc8Pti3k924c3
 XJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693086871; x=1693691671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hFp0Ejmw6gkggNlBSTHSqCPnLpG/phbaprHF2ZM9Jhc=;
 b=FFA2dKuIMCdcwCFOW0jflTsShMWn+5Pz3FDhD71soPSSBE2OVDxViFH/xEzmHQViwL
 H2IZDR+J9Wz4vas+8ljQkzQFs4HMNJoRXOH90jqKJOubS8FcM/MpNmQ7lqexATGCgMCe
 RJ6FW2zrK5etIRYvbJkLq01xHB9Ou0V58A1qS4Cc0ZmU8HZDHapy5NaY80tOYcIhezIv
 dUv7ApX+ECsR/BP9g8kvzDDM9lQLLhZ/+uiA3wrqooI6LgG88MugR4r3WgvZIgzMu+HC
 i0QUCP48f72g3/OJ8K66xa1+qsmvZG8uNGZsUVBCecqF5a1uFLw+NtZLlhaQIyI3EKt2
 rKfg==
X-Gm-Message-State: AOJu0Yx26nHAi8cQ0Bssy+hT78FSYh+2/C4kd0O6qWViziJCRPkHxj5A
 B875Ha9/WiTz7z6o11DXW5miPg==
X-Google-Smtp-Source: AGHT+IGascxwKGPMG4xR8OOD8rypHcWvLZUV0L6ylxVlRbob9jFAgm0JjKKPq/xTBNTWVTSzczdwQQ==
X-Received: by 2002:a05:6512:114d:b0:4fc:3756:754e with SMTP id
 m13-20020a056512114d00b004fc3756754emr20506684lfg.56.1693086871586; 
 Sat, 26 Aug 2023 14:54:31 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 d17-20020ac244d1000000b0050096cc3ba1sm860280lfm.255.2023.08.26.14.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 14:54:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 1/2] dt-bindings: display/lvds-codec: add ti,sn65lvds94
Date: Sun, 27 Aug 2023 00:54:28 +0300
Message-Id: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible strings for TI sn65lvds94, LVDS serdes receiver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 84aafcbf0919..6ceeed76e88e 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -41,6 +41,7 @@ properties:
           - enum:
               - ti,ds90cf364a # For the DS90CF364A FPD-Link LVDS Receiver
               - ti,ds90cf384a # For the DS90CF384A FPD-Link LVDS Receiver
+              - ti,sn65lvds94 # For the SN65DS94 LVDS serdes
           - const: lvds-decoder # Generic LVDS decoders compatible fallback
       - enum:
           - thine,thc63lvdm83d # For the THC63LVDM83D LVDS serializer
-- 
2.39.2

