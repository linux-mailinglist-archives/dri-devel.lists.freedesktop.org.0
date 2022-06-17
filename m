Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A13E550324
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 08:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCF611ABEB;
	Sat, 18 Jun 2022 06:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D534010E36B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:37:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v14so7209621wra.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 14:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wGbMUWjxs8BkGkLUVDpfhH3mQEW003HHHcJjYYfU7v4=;
 b=SLDzV2QIqEa40kiO6UHKNr4FOD7iSpRR4+KbKYh4OQ8FAYv+DyGH964zD+o8MLMqru
 LAx0TEzv3qw2FW4OB1uGntlpn7DYZAdFJ6aOgFveGQt7ptcSFY66IxN00Nxx3LM60vTz
 CKfj0YSixRUUYt3Y01puNxiX8KI4XHFGS4qM8ipQZU+P3o5rd9zf6fqoHr0wzw9xcMXq
 2Jz3hLTHdfE3rhgPMk/nmt+3cUg1gu68UwhgJV4rO+d1jLEPv2ZkcSjPfnt3fVG5Z00j
 3dEPcrutimdfF6gWpUEcuB8CmV2B0GmCUyBg6Tf3B/mOldFz+cPIyHKHDntg6vsRV8bf
 PZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wGbMUWjxs8BkGkLUVDpfhH3mQEW003HHHcJjYYfU7v4=;
 b=ALRzMLvb64o38kAExD8eRheYEncUwmwNNbaYJwSbgCQtEmqq7bg7wx6yJjTAOatd5z
 bUulOl9BRuvnjsglCh7hsXTqOGPoqbhswbT/TYa2CfEbhCT1TGSyTnv6OjikIh6+HT+7
 Yh6dw4OJ9kMAJctOAukJkZjf8P7bT7R3CQ7yEDwNInoiVTPRTPsJqw1o+E1z441mt/fB
 Ok1HnE7mh0YEDrRVH/qGoiMgzYeqcJDd8tPsNumQuFvZmAxpprz5gswdpUJbPrrvq0qe
 284C1zxN035wjTvJnBOWE+4gLZcYAut60dKxpXnMs+YfcjizWevYDmQ0pHbxjN8k316V
 x1dg==
X-Gm-Message-State: AJIora/YySbKBOwHph5m2KW0coYHwPMtvWYTo/gcSTKCaxU8ThwxB/iE
 L67jP32LkqffkDre+H7fHh+Rfg==
X-Google-Smtp-Source: AGRyM1tr5HuJpzlTGlamBFC16nJpme8r8TCAQYFHnLloq5rkURi5r/W+JiMekrV08CqRLjwlrpNLEA==
X-Received: by 2002:adf:f184:0:b0:21b:6c76:5b6e with SMTP id
 h4-20020adff184000000b0021b6c765b6emr4253788wro.126.1655501851181; 
 Fri, 17 Jun 2022 14:37:31 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 z14-20020a5d654e000000b00210288c55d0sm5623988wrv.52.2022.06.17.14.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 14:37:30 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: delete ilitek,ili9341.txt
Date: Fri, 17 Jun 2022 22:37:07 +0100
Message-Id: <20220617213706.376730-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 18 Jun 2022 06:16:44 +0000
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
Cc: Conor Dooley <conor.dooley@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

ilitek,ili9341.txt was replaced by ilitek,ili9341.yaml but the txt
binding was not deleted. Do so.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/ilitek,ili9341.txt       | 27 -------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt b/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
deleted file mode 100644
index 169b32e4ee4e..000000000000
--- a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Ilitek ILI9341 display panels
-
-This binding is for display panels using an Ilitek ILI9341 controller in SPI
-mode.
-
-Required properties:
-- compatible:	"adafruit,yx240qv29", "ilitek,ili9341"
-- dc-gpios:	D/C pin
-- reset-gpios:	Reset pin
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in ../spi/spi-bus.txt must be specified.
-
-Optional properties:
-- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
-- backlight:	phandle of the backlight device attached to the panel
-
-Example:
-	display@0{
-		compatible = "adafruit,yx240qv29", "ilitek,ili9341";
-		reg = <0>;
-		spi-max-frequency = <32000000>;
-		dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
-		rotation = <270>;
-		backlight = <&backlight>;
-	};
-- 
2.36.1

