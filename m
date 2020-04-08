Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8401F1A29BD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93636EACF;
	Wed,  8 Apr 2020 19:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B7E6EAD0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:52 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b1so9036736ljp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1vgjQwRljbyZ8hzPEbGFRIMCdtcxcKSs14d3tFq/l4=;
 b=YE/PaUCHBQqxFaSPk44HwH/HFwiS5tDsYVjauJnTGb9DovjpGZfeK6K6h/KvBq21Eu
 HDQIAmz6/0hBZeJxI+yDdcbZI17+qdWgkziNlv4C4tKTGiaEG14uFmSeTtewAiF49WjD
 TbzL8pXyssUuNw7mxixr9kXS6pG1X+a5ekcT4ROEQ0ypTbwQN3LHt2UCQ7OYaXQNXF5L
 62sjmgIf3hJfGH3UbDPieBhu6uCKIrx91/QREbMSDQZ5+2N6ND8RGN8twS/vOKPtoL69
 vB/FFME6SLriDJ087hYi+1S7u8H8O39HtAhnVNFieEPGZlA663xNqr9HzvqySMuBRMmZ
 3Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w1vgjQwRljbyZ8hzPEbGFRIMCdtcxcKSs14d3tFq/l4=;
 b=WISSVuvfrsJcXUQonvsojxWj5pDO+6dFn/PnmOWQ8Pr97aAz9cn1pourDDtNKm8v9g
 IxFfD7KY2ADuzsD/dZdBudNq2g1FBIu0wRoGvHJQbO6lLMn1qsRplMa8fRACEiUPjiRm
 Mq3nDJUcoBbHRldEm6X9WimKssQfZYpMLYmfXqTdOc0oCQ2mEm5xJW1lVzeIeQOxiXs+
 bDcHB1F7iOGmbQWp/RzEbNZ/6DePGAF0Y8k6vOL+lqO11laSOPshLG78y9MjdXcsGRJ1
 FJYYzhsT7Qs9BTRHO3hkVb2DjF7G/xDsGNgeGo2WMYn9q1tEwNDyGasxAeQw/2E6Hiio
 H/Zw==
X-Gm-Message-State: AGi0PuYqbFz7nMKUn2SqsKahZvusKuK617eVrLStlzpBo1sqQnSwvDdk
 YFCJ1jjBlNrpK2DmgXjkf63s5fUJQD8=
X-Google-Smtp-Source: APiQypJ8k32aBhpewo5nN7orUc4Bcf6hjjwbG8+Pt3vD1N8GhFawqgYlC++l+GornRwCFRJzYMhkRw==
X-Received: by 2002:a2e:7606:: with SMTP id r6mr5845883ljc.118.1586375510887; 
 Wed, 08 Apr 2020 12:51:50 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:50 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 09/36] dt-bindings: display: convert innolux,
 p079zca to DT Schema
Date: Wed,  8 Apr 2020 21:50:42 +0200
Message-Id: <20200408195109.32692-10-sam@ravnborg.org>
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
Cc: Chris Zhong <zyw@rock-chips.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the binding matches panel-simple, added the compatible to the
panel-simple list.
With this change enable-gpios is now optional.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/innolux,p079zca.txt         | 22 -------------------
 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
deleted file mode 100644
index 3ab8c7412cf6..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,p079zca"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-- enable-gpios: panel enable gpio
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	&mipi_dsi {
-		panel@0 {
-			compatible = "innolux,p079zca";
-			reg = <0>;
-			power-supply = <...>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 8fc117d1547c..328df95cbe88 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -143,6 +143,8 @@ properties:
       - innolux,n116bge
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
+        # Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
+      - innolux,p079zca
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
       - innolux,zj070na-01p
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
