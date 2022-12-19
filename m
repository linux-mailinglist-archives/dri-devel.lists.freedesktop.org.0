Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7FA6510C5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D356A10E2BB;
	Mon, 19 Dec 2022 16:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD26210E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 16:56:38 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qk9so23036626ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MW9IUi38LGJbWOititTnXuZuxcZ+qs+mMT17ZPnQkKo=;
 b=OeS+09a5otGiv+Kpp8lLf+vmlBCzLGRQR7qaXnlrCYGE2jyYt7zZ96biw1Dqc+/HT0
 A/HvI2rQK1PhpdXfAu8BkfTe8SpXixvvkcogsKLFjRipBr3Z/72DkU+uGlsb2940rucX
 sJo4GcqGJ8KVxFlsN4DisdJDmDEFTWGBogewBBWvwny/hCGMSXzuO1jLOAFn7f81cByM
 2Akq7VTkHMbjuCNNk7/JNHnR0SHjuLGoWFp+5JjOmjPV9MED3JTPNEVgrfs/UmaxukWZ
 NqtQXG8SUkdFIAnSufSaC16d3VGbJLX5xiQTfvDLeJ0Pre0Zko9oKo/6wUsaRHJ52u5f
 n6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MW9IUi38LGJbWOititTnXuZuxcZ+qs+mMT17ZPnQkKo=;
 b=ezqFgnFz703KTrr2M2lgVo2vlPLsQhAjrn0W2Mb6D+uNYssPtpFMQxVh3NmloxmfNJ
 ohxtCyHUEz0xfO5bgD9GtDmKNs+i4ZLjomlnfqiqM3h3VHRDVcE60Z5B7uV9Kk64j/zw
 p5DDKDsBe3vMEnRBmGjZRuGgYgfQp2e6UZB5qWDlGFjZ0+674VPDbek0xD625I5xKcE+
 lnC5lYgsc6svjvK97mGpU9AcAx3UpiBrm14qpCrmCcwjm0Bh/KEDSeAyyL/3v1VPrwZv
 wP4zHX3GXXdAzObDCbLcePhGv1vglpdWUAqfjlcV/J9iOpZTv2nw3VWJgQeFB2N0r/ag
 xfdw==
X-Gm-Message-State: ANoB5pm8mVY+cr/B9TTFg8iGsElbabhOqC38GZpQb6Vx10NHaHNBn6nk
 aXrJ0yXzBBYrtd68e1sQoS0=
X-Google-Smtp-Source: AA0mqf41B2/H4EPNsKQaq9hNNH4wwwkWyo/RIZIY1kQU+RhK6rFFtS4wChCTmLuHjDyyznqvRl+W0Q==
X-Received: by 2002:a17:907:11c8:b0:7c0:beee:2f06 with SMTP id
 va8-20020a17090711c800b007c0beee2f06mr34217874ejb.52.1671468997317; 
 Mon, 19 Dec 2022 08:56:37 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 rs13-20020a170907036d00b0077a1dd3e7b7sm4623533ejb.102.2022.12.19.08.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 08:56:36 -0800 (PST)
Message-ID: <0b9bb507-1819-4bfa-593f-8b7e92c2ce3d@gmail.com>
Date: Mon, 19 Dec 2022 17:56:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v4 2/5] dt-bindings: soc: rockchip: grf: add rockchip,lvds.yaml
To: heiko@sntech.de
References: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
Content-Language: en-US
In-Reply-To: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new converted rockchip,lvds.yaml to grf.yaml file.
Prepare for more SoCs with lvds output.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/soc/rockchip/grf.yaml          | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2ed8cca79..d74295e98 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -75,13 +75,17 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,px30-grf
+            enum:
+              - rockchip,px30-grf

     then:
       properties:
         lvds:
-          description:
-            Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
+          type: object
+
+          $ref: "/schemas/display/rockchip/rockchip,lvds.yaml#"
+
+          unevaluatedProperties: false

   - if:
       properties:
--
2.20.1

