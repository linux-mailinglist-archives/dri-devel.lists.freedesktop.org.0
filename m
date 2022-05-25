Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD951534566
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 22:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4EA10F092;
	Wed, 25 May 2022 20:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3648B10F092
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 20:57:29 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id y66so15912oia.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PvdkFEtwnY8PQ1QhT5M3rI8a4A3NL4oFFj4uvWw4Njw=;
 b=cD+CpP0k1Tf3pUJ210kRQy9XwGHC9MxJWgx/RxXtj3VUM/3ns27MawTxjpqQ8hxzQy
 n37bcshi/iBG+bIsy31Irc4DslCaMmwpr7200MpmDT35KoU30WJ/lOGjVpFoAN6TonjR
 lRqt4y+N97DAfMbGe3yUN56K/QrP6/sLezbNcSQsR79Cl6NMbyKRd6TTLNmLf0sPcW+V
 zQ/hkZ4zntYHJfDnGHMsxDG2TUNI2Iwvs/J1Oii3B5VtqD7CbwG/s4YhFZ0gWJiK9kAp
 ERa+SOTQHUFfNnReC0UB1E5xij9mOMoj2N63ETbLeNAl5SIqDhxyrNY5yupeUsOydsMB
 ndGQ==
X-Gm-Message-State: AOAM532TKbi5+2Q2R5wg1tZsOAguTZ6ORwI6XgyLvF6Q12bZ4R4QvdwD
 EJzPcawrIeooZqr5TkeTGg==
X-Google-Smtp-Source: ABdhPJyRuiJ/assfY1zLs5zrpGcTguyfUw5N+iA1GV/DKuVDEOa45pd2/EegjcXHekwesofSJm644A==
X-Received: by 2002:a05:6808:f09:b0:328:b61f:1b52 with SMTP id
 m9-20020a0568080f0900b00328b61f1b52mr6053707oiw.150.1653512238956; 
 Wed, 25 May 2022 13:57:18 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 r125-20020acada83000000b003289f51c2d7sm6896210oig.34.2022.05.25.13.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 13:57:18 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] dt-bindings: display: ingenic,
 jz4780-hdmi: Drop undocumented 'ddc-i2c-bus'
Date: Wed, 25 May 2022 15:56:26 -0500
Message-Id: <20220525205626.2482584-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While 'ddc-i2c-bus' is a common property, it should be in a connector
node rather than the HDMI bridge node as the I2C bus goes to a
connector and not the HDMI block. Drop it from the example.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
index b8219eab4475..89490fdffeb0 100644
--- a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
@@ -55,7 +55,6 @@ examples:
         compatible = "ingenic,jz4780-dw-hdmi";
         reg = <0x10180000 0x8000>;
         reg-io-width = <4>;
-        ddc-i2c-bus = <&i2c4>;
         interrupt-parent = <&intc>;
         interrupts = <3>;
         clocks = <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
-- 
2.34.1

