Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A83343222
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 12:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E546E1BB;
	Sun, 21 Mar 2021 11:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8111B6E1BB
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 11:43:48 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id f16so17584138ljm.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yC6sQQpeQv3wXPmtPXFBTvqQOQNp1qqEx00Cra5b8ho=;
 b=BuUqCPP3xC7RYch7SvgeAfdPBSSG7JYM9Ky6w5s1R5pn5SzbghNf3X0OCsDyJdD7FN
 gN2fCD5iLmuM8/pEqlGvtmj5/Tl9B0EZsr7HNLQVRrwPCtFG4ArwLXdKEt3aO74UPYn/
 Z42yLdpSljo4Dkj9xnnPEjAjfo1/tSFMQG++pOZfYV7F2424jOTMnfZYuE3DFJtXOde/
 N9eakYFE+btBuNRksbD++mfOxRlILtcQCGzUkfgdyLJ9zYeS+1nliDDmpQWlDy0Uasi9
 CXEe/mW+dE6TmgQRBnRQTOLAWpqbOH2MFPq2GIzji5Z+vQq2gydFcVyTlvs8PNfS0p5A
 HgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yC6sQQpeQv3wXPmtPXFBTvqQOQNp1qqEx00Cra5b8ho=;
 b=Xc2Arv7KFRDb8urjSxO1pqp4+0PwyAgg/tRDUiYLiOaB5to/BKv2OT24I8zImvq4Tp
 i+XNlz8UrIlByrkJWV887kIsSm2IO3fXHA90QpHaYZjWtYH5xEllhA83VtqpK2qOdMgU
 3Z/oaFOSkt6smx3XdC99Z6iTbX+ae9g05oxqBqNJ0y34PrtvIoxyTvUemfgFM+iYPBUP
 bcZWzY02UYJfFaYIEW+K4MhptNde6UoRQs2o1YbRHh0WRikqgJwDB8T+dUQw5Lmcsidb
 myrVAR0JNHeDki9Pfifol6OIjsk9p5S5oB9UkuRB0997uPskvgRPzvSsFnCHsGjw7S+y
 KDrg==
X-Gm-Message-State: AOAM531ZI66bDCpgKC8CCchkxjRHcOb5ZNUnj+tNhbqU1Qu3gCBSjPMn
 citKPmBL9VsExERuhqDXhqAr+zOny/+IM81d06g=
X-Google-Smtp-Source: ABdhPJx+/D6Dc8OB1Qp/wtw7IjZEKSpZ/IjzNXq6nkRD6Rxn/6cHI6uAaBP1n1k3i/okhcda/1KYjQ==
X-Received: by 2002:a2e:9d8f:: with SMTP id c15mr6507117ljj.494.1616327026901; 
 Sun, 21 Mar 2021 04:43:46 -0700 (PDT)
Received: from localhost.localdomain
 (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
 by smtp.gmail.com with ESMTPSA id 197sm1484419ljf.70.2021.03.21.04.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 04:43:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: backlight: Add Kinetic KTD259 bindings
Date: Sun, 21 Mar 2021 12:43:40 +0100
Message-Id: <20210321114341.944696-1-linus.walleij@linaro.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The KTD259 is just a newer version of the KTD253 and works
all the same.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/leds/backlight/kinetic,ktd253.yaml          | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
index 7a6ec1f8c0f3..73fa59e62181 100644
--- a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
@@ -4,13 +4,13 @@
 $id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd253.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Kinetic Technologies KTD253 one-wire backlight
+title: Kinetic Technologies KTD253 and KTD259 one-wire backlight
 
 maintainers:
   - Linus Walleij <linus.walleij@linaro.org>
 
 description: |
-  The Kinetic Technologies KTD253 is a white LED backlight that is
+  The Kinetic Technologies KTD253 and KTD259 are white LED backlights
   controlled by a single GPIO line. If you just turn on the backlight
   it goes to maximum backlight then you can set the level of backlight
   using pulses on the enable wire. This is sometimes referred to as
@@ -21,7 +21,10 @@ allOf:
 
 properties:
   compatible:
-    const: kinetic,ktd253
+    items:
+      - enum:
+          - kinetic,ktd253
+          - kinetic,ktd259
 
   enable-gpios:
     description: GPIO to use to enable/disable and dim the backlight.
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
