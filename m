Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92996596981
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 08:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C10110F560;
	Wed, 17 Aug 2022 06:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6657A10F56A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:25:55 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id u3so17782420lfk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=m0s8lq0ZE5dtbPoTxENvKQgRbYkC4Hv5FjBGALWO43w=;
 b=l5Shbj4CqrnxxetEyGEMZbaySC8XW1ZtUiPGbHF6A7nm0Y/+THbDt8fd3hw1NnxM6P
 0HMwOfLxDKxSl1iVD1IR6N/B+jPRtAAjPoEEQobx5kioFs3d74hdH26FJLqSL3eYTkBp
 lgYhNKY7blfmYp8l00yB7wlwhabM9AjcDqySml8YRMngakKAQ/tZ4zUAa7nVLpjgVZT1
 MIXFb2SoLoHxQqzjeiu/d2e+NwCXSmuK5kp5HZ7TEjATkWePvW+pxKLn75t5rjp+yBsm
 pxXUhHzw1IWgNubq3PfadZTsEN0Jawu52Hh9U+O2ckHSe7ce7C9RGN9YEl8Qm6NUDTBU
 dAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=m0s8lq0ZE5dtbPoTxENvKQgRbYkC4Hv5FjBGALWO43w=;
 b=Q0ZGJhb1Gm30dqM6Kt9ML/BZYbMN/HDPgqsZRyUvmn02rNPhMoVNeZR/U1bxq/1Dqn
 inqjA2x0wwKoXDInn+TUQwD9ui0q0eKwAybAQ37SutJZ7jnmdItrN1N9/H+6sgkIclTp
 E8gMyrM/fCDj7hxVf/Ww7/ztNSbNhO3JP+zRh65GN3YQl7WdwHl8dyzVphLaUfbUBkJR
 WOEzDNGWvrGbWsHAVYiZ31aLZ746pR0pUVTUjzz/07VyGprfHZp0JGxSIV4LusPcpX08
 ojjxYEgprPz9F3hRLWxZwdZfzJ2bhZofQSLkcCst6Iaf9PDLLZsNGHmYA1HTZ6cHpEEx
 1KEw==
X-Gm-Message-State: ACgBeo1G3Lh+apFonr9o7QvK0a9UvOMi+5t+CNEXv2ZNMVcW15GvJhDU
 bBJKpI0GbNO52yofL0D2QeAH8Tf/JQids5wL
X-Google-Smtp-Source: AA6agR788tLbvIi0il7fkyZ8+svc4RBeE51Ahvwg47GsGIxJxBJlejvkdjwnZaczuCQcSkczVcZBww==
X-Received: by 2002:ac2:5b8d:0:b0:48a:f61d:68a6 with SMTP id
 o13-20020ac25b8d000000b0048af61d68a6mr8050433lfn.603.1660717553716; 
 Tue, 16 Aug 2022 23:25:53 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a2e9215000000b0025e42641a32sm2069836ljg.123.2022.08.16.23.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 23:25:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpu: arm,mali: restrict opp-table to objects
Date: Wed, 17 Aug 2022 09:25:47 +0300
Message-Id: <20220817062547.20122-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simple 'opp-table:true' accepts a boolean property as opp-table, so
restrict it to object to properly enfoerce real OPP table nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 3 ++-
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index d209f272625d..2a25384ca3ef 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -74,7 +74,8 @@ properties:
       - const: bus
 
   mali-supply: true
-  opp-table: true
+  opp-table:
+    type: object
 
   power-domains:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index eceaa176bd57..318122d95eb5 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -101,7 +101,8 @@ properties:
 
   mali-supply: true
 
-  opp-table: true
+  opp-table:
+    type: object
 
   power-domains:
     maxItems: 1
-- 
2.34.1

