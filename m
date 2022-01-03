Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02818482F81
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 10:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3600689650;
	Mon,  3 Jan 2022 09:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC81289650
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 09:37:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id h2so63279995lfv.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 01:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FmlVT1AXE+HDliZOHtHIhhai4JiN6uCj6mcj/yzjTPg=;
 b=E6RzK3ucTj2ytUJ4Y6nk2RAanvOP0kISYxcYHnHDWCbFDnHdQfg/GWMdqJm58CqxYC
 +7q4Yp1rYsjqQTjeVV+4s5yQ5kEBlZ+81FgrdCY+HjNOM4EE5A04SVK7M8Bht1GcYuUF
 cH2UVRiZyaJzUt8EITpR94pY58Fu++oDM7ELn/OCB62Rl9LYIlftwd1sME58wcZz4Dve
 IdR1FiQHwRVGYOGnyk3qJagHDdM6dgJkjJAGuLZDRzmJ7yw638PqZCE2JrC2+axdXQQt
 MhNDVQMZ14PNNdIViujYflfarqxLmML82EKDvdRTmXnSTKuwuMmYedNGbl0wBVQcn8E2
 ErPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FmlVT1AXE+HDliZOHtHIhhai4JiN6uCj6mcj/yzjTPg=;
 b=TIYs4858F4XhzaroviCI7+gw/NAxuGWZ60lYVk56w7lnNh5oCdKqXUCK5iep8K/mri
 ppzPjXHCfB4QWYkT+Qb4QItBCCjy9l0MHOZSKASezHaNAWq32Kv8Sdq3szaoA3ip4oUg
 tF2+GqxL/7zsKsd2MxVV+oq8B1D9aDAqgsHg6yIrii/d9n8Jor32kL+tjN8GqVVvziov
 FThPUsLILPwj/WSmFukIThs0Xe5lOT4FAEAoNKfEesrAwHJDjIlA4lat0lheT740ZHsT
 F20F8jlOtiflikoYJCfi/HAemMQHXnobT3Sx34sdP464g/yZ2GB9qIavoIUzyAmRUgpM
 /LPA==
X-Gm-Message-State: AOAM530Zo0FJf5bgZhTXtFJEsxxquk8Xk+/Z6qcwElnllhVcBaEIBEB7
 UkBXYtS+OlUA+9quWAfyqdvoFTwZt8FwhQ==
X-Google-Smtp-Source: ABdhPJyEgP4i9Ls7K7RLynrtgF6870z5JNk0K/T+tA+D4lKutEws3hkJFpV+XDkjiVKlKyGJFgcXFQ==
X-Received: by 2002:a05:6512:a8e:: with SMTP id
 m14mr39502559lfu.423.1641202625215; 
 Mon, 03 Jan 2022 01:37:05 -0800 (PST)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id h2sm2165437lji.50.2022.01.03.01.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 01:37:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: Extend ACX424AKP bindings to ACX424AKM
Date: Mon,  3 Jan 2022 10:35:01 +0100
Message-Id: <20220103093501.637323-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel ACX424AKP seems to only be used in prototypes, whereas
real products use the 10 pixels shorter ACX424AKM. Extend the
ACX424AKP bindings to also cover the ACX424AKM. The ACX424AKM
was used in a few different mobile phones from Sony Mobile.

Cc: devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/display/panel/sony,acx424akp.yaml        | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
index 78d060097052..059cc6dbcfca 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
@@ -4,7 +4,12 @@
 $id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony ACX424AKP 4" 480x864 AMOLED panel
+title: Sony ACX424AKP/ACX424AKM 4" 480x864/480x854 AMOLED panel
+
+description: The Sony ACX424AKP and ACX424AKM are panels built around
+  the Novatek NT35560 display controller. The only difference is that
+  the AKM is configured to use 10 pixels less in the Y axis than the
+  AKP.
 
 maintainers:
   - Linus Walleij <linus.walleij@linaro.org>
@@ -14,7 +19,9 @@ allOf:
 
 properties:
   compatible:
-    const: sony,acx424akp
+    enum:
+      - sony,acx424akp
+      - sony,acx424akm
   reg: true
   reset-gpios: true
   vddi-supply:
-- 
2.31.1

