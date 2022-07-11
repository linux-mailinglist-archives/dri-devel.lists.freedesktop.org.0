Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD20E56FD9A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25B78D511;
	Mon, 11 Jul 2022 09:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255028D511
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:57:43 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 73so4287417pgb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9fY/cD5RyDbPMC16zL/4fjstRGOrtcZDiECJwfvZbXo=;
 b=m/z4oAXPcVCiAj03EYjCD7HgTnrAcQcfMT5Tu7oYB1Lb0CyjF/1GzJDYCblblGRIvs
 XrRZpCLRkefOfXzdhNdJ9mnOdl5U5jdc4HAHi3uMzTj9WOE2dBztlGDe9Pa9NFx9OojJ
 cLo7jbARrZH5/SJjoSWZRpZo54LuEX8oagi8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9fY/cD5RyDbPMC16zL/4fjstRGOrtcZDiECJwfvZbXo=;
 b=MhBt1x9q0bNlHkjZtoOzaDp3AUB/oZ0xTyJu5OKnJmiwyUi6arzv9aUlPIv4PjK5vl
 Xh5/y8ukJ+IeWHkgxk0aAhcN2DDufwL9XC4PZVjKTvDt14LxBH57Jdvb7hajGBEZ8qc7
 qqcrUXCezoUpBVYrfgq51l9ZBvf7BlJWTEYFYedVOsesH7HxjJPheuGkep25vwq/XDsw
 2CDS/9k+uWMM4D5Agelk4+gqzNphAxA38IG8d+eMFtU3gQv6f9yfBuMwoOWcWMQzk12h
 6/1MI5h4ghR+r3R3KJPpdvn3XabLESRkn4n4gkNbqd6mET58FSpndWHtt/vrvXObNQCR
 42qg==
X-Gm-Message-State: AJIora8l+huYE+jnEZRzy2Q2pHcF4HT56jzipb4/7uhAd7Oa2zqtAbpN
 mRvujsXcU4gxX5/1QgkKnarL+w==
X-Google-Smtp-Source: AGRyM1u7q92IK+OSS1YolOtVcQvJjMLfup+akgRA/a14mGGcYqsDkd4e5+gLPuID5zltApnZq7LgYg==
X-Received: by 2002:a63:b443:0:b0:40c:fbf9:8366 with SMTP id
 n3-20020a63b443000000b0040cfbf98366mr15206295pgu.308.1657533461057; 
 Mon, 11 Jul 2022 02:57:41 -0700 (PDT)
Received: from localhost.localdomain ([183.83.136.224])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm6560814pjb.42.2022.07.11.02.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 02:57:40 -0700 (PDT)
From: Suniel Mahesh <sunil@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: sunxi: Add binding for
 RenewWorldOutReach R16-Vista-E board
Date: Mon, 11 Jul 2022 15:27:20 +0530
Message-Id: <20220711095721.1935377-2-sunil@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711095721.1935377-1-sunil@amarulasolutions.com>
References: <20220711095721.1935377-1-sunil@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a binding for the RenewWorldOutReach R16-Vista-E board based on
allwinner R16.

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes for v3:
- As suggested by Samuel Holland:
- vendor prefix documented
- primary author of the commit should be the first signer

Changes for v2:
- Add missing compatible string
- insert missing signatures of contributors
---
 Documentation/devicetree/bindings/arm/sunxi.yaml       | 6 ++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 95278a6a9a8e..52b8c9aba6f3 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -787,6 +787,12 @@ properties:
           - const: allwinner,r7-tv-dongle
           - const: allwinner,sun5i-a10s
 
+      - description: RenewWorldOutreach R16-Vista-E
+        items:
+          - const: renewworldoutreach,r16-vista-e
+          - const: allwinner,sun8i-r16
+          - const: allwinner,sun8i-a33
+
       - description: RerVision H3-DVK
         items:
           - const: rervision,h3-dvk
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6bb20b4554d7..f5cd0acb1036 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1030,6 +1030,8 @@ patternProperties:
     description: reMarkable AS
   "^renesas,.*":
     description: Renesas Electronics Corporation
+  "^renewworldoutreach,.*":
+    description: RENEW WORLD OUTREACH
   "^rex,.*":
     description: iMX6 Rex Project
   "^rervision,.*":
-- 
2.25.1

