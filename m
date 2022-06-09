Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F40AF544161
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 04:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314FA11AF95;
	Thu,  9 Jun 2022 02:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC9C11AF95
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 02:22:36 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id c196so19906550pfb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 19:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m+CpzL32MJHRZYZDgBzpwQnx86VfK2H69F/qGC0XfI0=;
 b=U0bxjLbFOl10tf8GWT8fIiAYppnmK4xrmmSNHHEf760MXcmV0kCY2V78Ae4maBKj5H
 GpcF03gxnizNDwMshZsC8QdTudjUOr2vWOVN8+mgFHrfI/lf/c3NFVuknm7Fb7zu7bwb
 dZKz+i5301TJ9EWWmS0B9KQf5JNEemrG3Bm5qR3nwBAdUUClvq3aROAfW8qSEMPn9J/s
 +lKc7bze0Ol7qDrCRBOlJmd37/ARrNf/6RuMIh4ZusRWZhOjiCKSCAQpWplu8Er68285
 xTbh2jXiI41+4WvD7vF4PypX+rNH9lRbN5mBR590sgoLa7ElY16YSJ4Iw57UwxZqt1HF
 xZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m+CpzL32MJHRZYZDgBzpwQnx86VfK2H69F/qGC0XfI0=;
 b=pwrISTvRnsvZk4+ISn9ECi6SRE7Tbe0FKCoZYczW+ORXLFkaSzEiEFvBnEjxff43E/
 wPujONJJZ911jkeej7l2reFvKO9w8Yw2cvRONo/Z9q9Bl2uJGUtC7aBqQm08Xax53pox
 pwAS0BgO4LkLQi36YdE16OZM18NhhzygZ+SxIDT5i/43ckcb/E0s7Cqg5JVnVeaLJJC6
 +NJ0d8tiGZq9pL0N3HMgFPddRF0NJWvq++9mmLdJ1RlN3b0sJKPAK52+fNkQwCW4kPFC
 bdQhX+tQdcNrxDb5KalOh3GZxWzpk+Atp1Biap3X0ibLg8HvAYcQoTcTDuvpfOPII/fF
 fKgg==
X-Gm-Message-State: AOAM531XSCPzkUqaZlj3/JZuJBdAQmsWumRrB8yrW9Q0ouHZ1K4YqTpf
 T44c2+uOS1zJ6xAYy6aMGyc=
X-Google-Smtp-Source: ABdhPJzXbLLy8MQgfWhrfW3Lanr7tdpKafQO63EjjVGOPJXJ8imC9BhA9caiO6leM26zJoqSXz/oxQ==
X-Received: by 2002:a05:6a00:22d1:b0:51c:15ac:396e with SMTP id
 f17-20020a056a0022d100b0051c15ac396emr19378533pfj.58.1654741355935; 
 Wed, 08 Jun 2022 19:22:35 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:478:d041:804b:4db9:72:b011])
 by smtp.gmail.com with ESMTPSA id
 y22-20020aa78056000000b005183f333721sm15748770pfm.87.2022.06.08.19.22.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jun 2022 19:22:35 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH v3 1/2] dt-bindings: backlight: rt4831: Add the new ocp level
 property
Date: Thu,  9 Jun 2022 10:22:18 +0800
Message-Id: <1654741339-12756-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654741339-12756-1-git-send-email-u0084500@gmail.com>
References: <1654741339-12756-1-git-send-email-u0084500@gmail.com>
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

