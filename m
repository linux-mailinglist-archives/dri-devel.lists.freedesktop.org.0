Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849AA1A29AE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004086EACA;
	Wed,  8 Apr 2020 19:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242D66EACA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:44 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m8so786794lji.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHVjRzMuuU310GbyJK/QLhuR1wLfy8v28XEG79WdtmY=;
 b=IvFfKCEWvxdkNAYPSEVha/dK8zD5QE0gDPK02BSmFJKlvn8XlaQ0htmZgD4gBw83c8
 3DTIjAB5biJaExkgbj2gj9kWsGPNvCIOWYW3mp5UG01Vp5dUfXxn7cYKc9nuaUNuk/Yv
 2IVcoh7hAko20Oyh5udG1nh37+n+iQXHNJH6Q3g8HK76c7uK3Mt1EEg9MkZtEwbVyjaP
 U9WYdYFfGd/Z8nQUPyVs7yi/yDAry7UJYeWYpEbu2mjZT+wTqVoqRI9A18FJYfAFTACD
 b/xzV8uEepea49dQhA/I7NPeN9+dcPnrN+5mz49nApt6Pjcr7xoR+lB81T7CTk31R5Ar
 nAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CHVjRzMuuU310GbyJK/QLhuR1wLfy8v28XEG79WdtmY=;
 b=hAfBjKGUgWeKcWTeIurhdcEBB9ZytFrYABozU/TZViQuxA2llGRp8azfVhiYuFWOLB
 M/qk2QwZtp+zDT5tqsk8H8cGGdz/H2QGPzhWPvqCBkklnW1rrCQzmB7KgzJHk71m0CGE
 aj4hT9EBaKNoXdofcrMKSpzoI5YkmeLRNZvHg5GpRZxOhCayM2kF16/sQ6Zwfbr29Cjb
 n5H7mfOsIXZJe5gPGiopCnogJYc3sX+oiO4tb7zE1oafP1yOvIpBAdWro6KDOP3Sh3dd
 15YLeaZ0CszcuZWf0uoSptfne9O6bYMGUFZf+448Nn/8duGgRjen/PdWQSoC1ceVsFch
 p0LQ==
X-Gm-Message-State: AGi0Pubh5HrTnXlkARz46WjzeMvyQQZS2fb1TMSJN3N8QDvxRDi/QlNG
 YzJJOJsPLdWzLcF42T5+9xnRZAu0Ib8=
X-Google-Smtp-Source: APiQypJ91Q004ZE4tYA8kCFhDwIemmIQEr19HuL+SR8e46lWnuO2JTTvQhsVGrNkjq1rTlBhv1izXw==
X-Received: by 2002:a2e:b611:: with SMTP id r17mr6172730ljn.62.1586375502082; 
 Wed, 08 Apr 2020 12:51:42 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 02/36] dt-bindings: display: look for dsi* nodes in
 dsi-controller
Date: Wed,  8 Apr 2020 21:50:35 +0200
Message-Id: <20200408195109.32692-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob wrote:

    Uhhh, it's looking for dsi-controller(@.*)? which is not the common
    case found in dts files. We should fix that to dsi(@.*)?.

See: https://lore.kernel.org/dri-devel/20200319032222.GK29911@bogus/

Fix it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/dsi-controller.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
index fd986c36c737..85b71b1fd28a 100644
--- a/Documentation/devicetree/bindings/display/dsi-controller.yaml
+++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
@@ -28,7 +28,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^dsi-controller(@.*)?$"
+    pattern: "^dsi(@.*)?$"
 
   "#address-cells":
     const: 1
@@ -76,7 +76,7 @@ patternProperties:
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    dsi-controller@a0351000 {
+    dsi@a0351000 {
         reg = <0xa0351000 0x1000>;
         #address-cells = <1>;
         #size-cells = <0>;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
