Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994441A29D9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0320C6EADB;
	Wed,  8 Apr 2020 19:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E3A6EAD8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r24so9015952ljd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnMmg3E6mU6M1/pbP+jwtm3Dp+SV5v9n/rhgOIrVACI=;
 b=Tg5iAd5ewEek0+m5k52fS6PoecN+Q0/+Gib1WqXIU9Ts2mwzJ9psuM5+Jc75J7gXxa
 Mm0xGSs4uB5TqoJNfs/CORNnOOlhxJG38BMrXrzQw0LcbYxPVtotgUUfE01XKO0idtAu
 F3ceJOFfIDAZR7ubBByz3reihnhYFojJivfPSezNFAOc1aSX7hOQ3tTg+EsoMLaR73LI
 iQ3j0s8GK3CNKYschRIwI2oPHAVuD7eotvzepY/jrNhI2zEGOa3cXedEUf0nu0G/Acso
 t65lDTIrn72tTHnOwqEPNz/RY8/Q1Gan4/9+A8Gh6ZM0o6HDCNErFM4eRnslwx2PoHv3
 jYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nnMmg3E6mU6M1/pbP+jwtm3Dp+SV5v9n/rhgOIrVACI=;
 b=OSjYfW+AVJKfOwQYOVp9bzBfKqRbG8F/qbQaJDJRAUl2WjDPGA2wITH0LZ+izN01f3
 DGPon/74grARJLEwfqdblIkKtm1r/IdrgCIOELn6WH6lwxtmwbUiML81btZjQMEN9ZS+
 7BVTPj5h6j7B3cBlRf5KlYcoB+s/HL3VqZcDDrpVMiAGqXJEWkykph7+opuz1ZjrB8P/
 EkIQUe3S5h7ojm9P1lWMayw/XZYJZlZSLq+DCFc0KOewZeF1ocbyN+jf3XrKF8TZOwjs
 tmDV5fVxc180VCsSo0fUJ3fDTl//NLoiV7BNJzr+5Hkj++8xd9jKjrYiLvujb/xW0sOY
 HBsA==
X-Gm-Message-State: AGi0PuZiZoKQ9EUWWiAJY3I2KBvWqvJyiPnuB0B0uY3qD0bXaGfkOFmo
 lrJIe5n1+vn9YpKYMkYvYC8zqsb3nCQ=
X-Google-Smtp-Source: APiQypI980jTU7V134I+PWfQUVXoHGZJLDDxuThdAmnP9s/MTUhtDCoWAkQ62ix2o+6wdpb083gIBQ==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr653436ljm.174.1586375519325; 
 Wed, 08 Apr 2020 12:51:59 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:58 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 17/36] dt-bindings: display: convert osddisplays,
 osd101t2587-53ts to DT Schema
Date: Wed,  8 Apr 2020 21:50:50 +0200
Message-Id: <20200408195109.32692-18-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

osddisplays,osd101t2587-53ts is compatible with panel-simple-dsi binding,
so list the compatible in the panel-simple-dsi binding file.

v2:
  - It is a DSI panel, move to -dsi binding (Tomi)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/osddisplays,osd101t2587-53ts.txt | 14 --------------
 .../bindings/display/panel/panel-simple-dsi.yaml   |  2 ++
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt

diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt b/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt
deleted file mode 100644
index 9d88e96003fc..000000000000
--- a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
-
-The panel is similar to OSD101T2045-53TS, but it needs additional
-MIPI_DSI_TURN_ON_PERIPHERAL message from the host.
-
-Required properties:
-- compatible: should be "osddisplays,osd101t2587-53ts"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 949371db0a16..f2698d7c09e6 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -31,6 +31,8 @@ properties:
 
         # Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
       - kingdisplay,kd097d04
+        # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
+      - osddisplays,osd101t2587-53ts
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
