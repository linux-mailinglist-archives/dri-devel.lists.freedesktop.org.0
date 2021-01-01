Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEF2E8397
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jan 2021 12:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4950289A4F;
	Fri,  1 Jan 2021 11:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4302889A4F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jan 2021 11:45:39 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m25so48627772lfc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jan 2021 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X1yeAUk6b8gmMiVEP9IT/lqKGsTIem4bh7tOu2Oot/A=;
 b=EiprgCkNWoZTNpZ+M6EjNSn+adRKabT0A7ltqt3Y0x3cfsEV7w+/syWJH56UVYDc4+
 BGbQ+VeogSA8hr5LmrscLylIsLbrPljYWA63rSKzT84r01DjWCJJ4qF0/tBooyGqAI6d
 0vaxla9U3MlzwbvIX61tB7Z/1V16q5XTBE02PVaRXHmH2BJlwG6u1hPAoOiIp9yH1ism
 DWug6ErN86we9xX0iB1QzvqnrIgGAaFiGdVph9+26KZuX+qM/vDH/W4O0bC1n4C9xhRN
 OlBs/IYwNV/pH1kxg7YaEyz3QoG9pCCFCoY86unPqHPHH1E22VKG0ga3eOwRg+GVyAmG
 hmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X1yeAUk6b8gmMiVEP9IT/lqKGsTIem4bh7tOu2Oot/A=;
 b=iw/vn61qSPHcyt6ESpKfWGR2kbS5Jr9WsIBG1c9sN91k7FLL35apu9f9HIsVu/IQoB
 ZgagfRwJKcDwxuv2H6HBLzqxoY8r1VSw5lyXCHzMZxBGwDQ4mGcDCP0JQPy1hFKgW4ck
 fAIJ0AnkOTWkFS+gVi4/2mhQgRs707vzIiawLubBanRpiCdCoqxoTxhl6Es0IvTlbJC6
 0m39lIfnFzKzLnd/3QavZADa0Uwy71cnkEb/rdPndQ3jvemrCKkBSc38rZlpGYD9MJQT
 BegXfF2avrCiUX7MdUFdjNQ5zlJWSD/gFeQ1BynGy7w2kz1Qsb7i5MlnTamsIFXh5TQs
 G+MA==
X-Gm-Message-State: AOAM530E+cajxaYMyfLPKGKpn3ODr3uwPOmOLdzPspPYRdjj5LUAdJZJ
 EaJpxnE79x1iER2psmzG+CEMIw==
X-Google-Smtp-Source: ABdhPJz68u9Xdaa14ja4xd+XvtPX65JRDstT/f9I/cqpEA6IAlHMb8YOQa3NTAVIzK6W5EPXTRyoOw==
X-Received: by 2002:a19:fc1b:: with SMTP id a27mr25204221lfi.349.1609501537546; 
 Fri, 01 Jan 2021 03:45:37 -0800 (PST)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id b22sm6487166lfp.233.2021.01.01.03.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 03:45:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: display: Augment s6e63m0 bindings
Date: Fri,  1 Jan 2021 12:45:22 +0100
Message-Id: <20210101114522.1981838-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes the following problems with the s6e63m0 display
bindings:

- When used on the DSI bus, the panel is listed directly as
  a subnode on the DSI host so the "port" node is not
  compulsory. Remove "port" from required properties.

- The panel contains its own backlight control, so reference
  the backlight common properties and list default-brightness
  and max-brightness as supported but optional properties.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/display/panel/samsung,s6e63m0.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
index 1dab80ae1d0a..ea58df49263a 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/leds/backlight/common.yaml#
 
 properties:
   compatible:
@@ -19,6 +20,8 @@ properties:
   reg: true
   reset-gpios: true
   port: true
+  default-brightness: true
+  max-brightness: true
 
   vdd3-supply:
     description: VDD regulator
@@ -31,7 +34,6 @@ required:
   - reset-gpios
   - vdd3-supply
   - vci-supply
-  - port
 
 unevaluatedProperties: false
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
