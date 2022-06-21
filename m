Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4B552FDA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B74710F600;
	Tue, 21 Jun 2022 10:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BE610F600
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:36:41 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso12932086pja.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D/Eqnjqmnl12dSFxUrRjFlGQ54ZKMERMuKCuM1+6plU=;
 b=esJE5Cs8hxQTCMjqmhUfTurNyYXyH5qffkShag2sqyUzZJpiCQbbmxf917Iufe65XX
 eCth9pwsuHVyTXhutbGdZXeTMKZFqBSZ8xn4E3ooMLF4A0a5fPy6u82/xeA+QS/LWFEs
 L2Vva8Iqn66NoGTPpO7/ytEhQK68ckVHF0JEl7pFnq2rJ3te4zxMirS3/juuvhv6To9E
 j/fpGbpYiozPDEpgaVk3PTBeXZTR54ufr2SwY1n8o7ygPxwW5j17rb9qlZIpNg4Rk4+X
 b9tY/MK6YVgfKV05db5WwKLNmQBE9MgOB0QmGI4F8FfNfIz7gEQFdTvz7C/rpVbJpY7/
 g0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D/Eqnjqmnl12dSFxUrRjFlGQ54ZKMERMuKCuM1+6plU=;
 b=351iiHkGcfHch5Jy+loY/W1m/VHo05B2s/ityHh3vHJTVbOA1oHiDvWTXTaefpV+aL
 vTcOOJ7OQMGOuO5ZkryK/1FCICW8GYWTmDraaOGlfSBezYMyFZL0DpaTMTOAXzBGf55o
 L6PpkITb+N3yHe4jLxBKobhSLaSx8qJdD0sSdcFHNEmbtm7QtcBOi9vuBmdvhq/jPfs2
 K43rdqNowpQyAkT4S0HaxWk7e1IZpa9gzkFGemDtyGI3G236o9f60pVf1qsbN3VRdddA
 GFbZqjbgK+iMm3ntbWiZc2zHqlX6tsoej/GSlqigMgQQuqi6rE/zjhBLlZss1Kxy5XwM
 Gxlw==
X-Gm-Message-State: AJIora9xIsNmKbqmbO9rdNxdNorm5BGc/vy5QnJfza39ZvJBKjX/5lbz
 8Yj9FwvtkICYZoQewdJ6lKg=
X-Google-Smtp-Source: AGRyM1sEEDKgvokbKyArv3aS8MDcv/zXvb23OlGn2uUZ3vo0e/I5E/JjSAqVa9aEWi1MCin4gOlNYQ==
X-Received: by 2002:a17:903:2308:b0:16a:666:8ec2 with SMTP id
 d8-20020a170903230800b0016a06668ec2mr21368451plh.20.1655807800571; 
 Tue, 21 Jun 2022 03:36:40 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:c428:5499:b787:9:3bde])
 by smtp.gmail.com with ESMTPSA id
 o188-20020a625ac5000000b0050dc762819bsm36295pfb.117.2022.06.21.03.36.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jun 2022 03:36:40 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH v4 1/2] dt-bindings: backlight: rt4831: Add the new ocp level
 property
Date: Tue, 21 Jun 2022 18:36:27 +0800
Message-Id: <1655807788-24511-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655807788-24511-1-git-send-email-u0084500@gmail.com>
References: <1655807788-24511-1-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add 'richtek,bled-ocp-microamp' property to make it chooseable.

The wrong backlight ocp level may affect the backlight channel output
current smaller than configured.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Since v3:
- Refine the description for backlight ocp property.
- Use the enum to list the supported value.

Since v2:
- Change the property name from 'richtek,bled-ocp-sel' to 'richtek,bled-ocp-microamp'.

---
 .../devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
index e0ac686..99e9e13 100644
--- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
@@ -47,6 +47,11 @@ properties:
     minimum: 0
     maximum: 3
 
+  richtek,bled-ocp-microamp:
+    description: |
+      Backlight over current protection level.
+    enum: [900000, 1200000, 1500000, 1800000]
+
   richtek,channel-use:
     description: |
       Backlight LED channel to be used.
-- 
2.7.4

