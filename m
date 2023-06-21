Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C917391DD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 23:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A4410E360;
	Wed, 21 Jun 2023 21:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C543D10E35F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 21:55:09 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51a426e4f4bso7640390a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 14:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1687384505; x=1689976505; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jn/Beteqm9A/LN1S7WLvnvRia249hgTE4o7LFlD5jW8=;
 b=npbSrNQ6pLZxRDO4iQBtGYduK/HsPHl+AGKV9spEmgzGe0BpEo+C3nRotLaWy5cKU2
 VpuVo+RZWhplXLWA9+t6OXb5TqnmIofJayaBIISKDeuIovO2ASqIwHJiRnT1gz9/w7tL
 nYmMtq+gWD7SopokiNjxfwbSnVIo1hWxLUGjw1+Iz4hb6anmNCrEutXimGHEapRdFbXG
 1GIuA0MMS/g9fvDFsIZxGIqADMyO2Fgmuh3Pm2X6dr4eq6IyBKusoHNU+vA9KXodvBFp
 Lscod8GaAQkGDsdJWsu2ruEcOls1KzAzn/HoDe9dd6+Y4UNQyBmD2XjnoxtwzyzcyBAo
 f4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687384505; x=1689976505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jn/Beteqm9A/LN1S7WLvnvRia249hgTE4o7LFlD5jW8=;
 b=W0osO0Cz2KrXnj+dRt60Fw1c62CXtHo1RAXte4yl8rps8lQeR22nAo7nLlNB+RFFPL
 zXuUOagXAGrAvrnix6JkJI1tlkzax6F4bs0SO4yMuWbJmBiZQUW8tJZelhuWFisUDPAf
 jrCBRevTYmSkoFnEIaWch9fH1uMX60XgIcctda2FGNo6DMg+y61FdU2TwHtzSvdGgO+G
 ADonn7cwaPXES/zGs9nk7+4x2Z+6e3j0hZUcuGm71tReoHoTQH1ynWOHFoXS61G4Cg3R
 Gt+M0vL9L0oXDijxELm1sM6Ichl1zefXEd60FqOtGtiuh1QvtqRSwWMouMjUSVYxrz6c
 hECw==
X-Gm-Message-State: AC+VfDw6Wj7dq113A9wL/e2KxHqFfKXp0zKSIkAqCVelIK28aXdOy9Ef
 /11N4KyWO1PfXAgaJ+ON05eVk3G2mz7deAlv81lpoA==
X-Google-Smtp-Source: ACHHUZ6A/T43INsBruKaaE+va76RJMnbtzFL7HfR52IyaTewoA0XaNKUwjNnTX5qkrnskkylIa+1vw==
X-Received: by 2002:aa7:d404:0:b0:51b:dcb7:9b45 with SMTP id
 z4-20020aa7d404000000b0051bdcb79b45mr2164807edq.10.1687384504976; 
 Wed, 21 Jun 2023 14:55:04 -0700 (PDT)
Received: from localhost.localdomain ([188.27.132.2])
 by smtp.gmail.com with ESMTPSA id
 d16-20020aa7d5d0000000b0051a358a76c9sm3115417eds.72.2023.06.21.14.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 14:55:04 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: backlight: document new property
 default-brightness-level
Date: Thu, 22 Jun 2023 00:54:56 +0300
Message-Id: <20230621215457.11297-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.40.1
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
Cc: daniel.thompson@linaro.org, pavel@ucw.cz, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, conor+dt@kernel.org,
 Alexandru Ardelean <alex@shruggie.ro>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Yannick Fertre <yannick.fertre@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yannick Fertre <yannick.fertre@foss.st.com>

Add documentation for new default-brightness-level property.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---

Link to original patch:
  https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14ffd49892c4ce663cdafe98

Changelog v1 -> v2:
* https://lore.kernel.org/dri-devel/20230519200520.10657-2-alex@shruggie.ro/
* removed 'brightness-levels' reference
* updated doc-text for 'default-brightness-level'
* updated doc-text for 'default-on'
* added 'minimum' & 'maximum' to 'default-brightness-level' property
* removed 'Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>' as
  requested
* patch is first in series of 2 patches (was second patch)

 .../bindings/leds/backlight/gpio-backlight.yaml    | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
index 584030b6b0b9..2da6552a207c 100644
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -20,9 +20,21 @@ properties:
     maxItems: 1
 
   default-on:
-    description: enable the backlight at boot.
+    description:
+      The default power state of the backlight at boot.
     type: boolean
 
+  default-brightness-level:
+    description:
+      The default brightness level on device init. The value can be 0 or 1.
+      If omitted, the value is 1. In the context of the "gpio-backlight" driver
+      the effect of this setting will be that the backlight is on/off.
+      The difference between this setting and "default-on" is that this handles
+      brightness, while "default-on" handles the power setting of the device.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 1
+
 required:
   - compatible
   - gpios
-- 
2.40.1

