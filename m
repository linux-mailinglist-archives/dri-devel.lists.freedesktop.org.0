Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61B712D8C2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 14:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6666E226;
	Tue, 31 Dec 2019 13:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AF26E226
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 13:06:18 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i23so14309636pfo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 05:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=httxNtiAtTuNvzz6MxoyCtXDBVFL0u6yHkvzNjKde9c=;
 b=MdCq41ofpEY8c34RFkP1S5dM234FR2fXVDzxinANFdkXgf0FmIvFirPZtrEymmP3rZ
 LRs/Acpaff/uiK9bcF0jbGBfc4NqQsBHRXTV5RGNJtDUQMjnEHt3B4Fek+onqtGLlGXR
 6h2gMOSkO3d5uyOGF/tLmDijKezdJdS0sH1+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=httxNtiAtTuNvzz6MxoyCtXDBVFL0u6yHkvzNjKde9c=;
 b=r/WHsdpEUmmaTSdRTtsNU9mRvfOCP38bp/xUNE0kdU3yOM5UZckmleXmQ6559DBxEi
 IxzibIV1qCIL9gWo0EowPp6x5vHCjmMQ+jYjpY1bGt/v97ztkAD4gGJVZKUEtluHG7pJ
 VClme62ER3SW1CUlHklvC86sxL369dQd5KUhw6f9gIni/8+lG3E2u/rtxo0v5Cg4NTTP
 +449WuDfSPhOxU0zhtRbNG6cakF3+ziy2rtJbD24oHFjVsd9BxkeHz8iBYwJaenxt3CS
 s+pzusDq9+yhVuOlEa9qXnHzqRYdK6f4dUgeCFR8Ub59GcWzm7ApeetDwXbYwnZgDMVr
 cp1g==
X-Gm-Message-State: APjAAAUs4ka1rCUeAFBPrKowslNXBK1k2MKMThKJMIm68KJD8KX6Xmgp
 EUSOTM6w+t3ltzuugmVKcV0lEQ==
X-Google-Smtp-Source: APXvYqzP7Mrk8jxC0HNGSJpd7IzJbAguLU0Np2bAgt6OGvXHASkOvcgw72p733pq9UW4WQ3i9a9jJg==
X-Received: by 2002:a65:4501:: with SMTP id n1mr76072356pgq.336.1577797577740; 
 Tue, 31 Dec 2019 05:06:17 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.115])
 by smtp.gmail.com with ESMTPSA id i3sm55204089pfg.94.2019.12.31.05.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 05:06:17 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 7/9] dt-bindings: sun6i-dsi: Document R40 MIPI-DSI
 controller (w/ A64 fallback)
Date: Tue, 31 Dec 2019 18:35:26 +0530
Message-Id: <20191231130528.20669-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191231130528.20669-1-jagan@amarulasolutions.com>
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MIPI DSI controller on Allwinner R40 is similar on
the one on A64 like doesn't associate any DSI_SCLK gating.

So, add R40 compatible and append A64 compatible as fallback.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- update the binding in new yaml format

 .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml    | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index d41ecb5e7f7c..138ffb6ae403 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -15,9 +15,11 @@ properties:
   "#size-cells": true
 
   compatible:
-    enum:
-      - allwinner,sun6i-a31-mipi-dsi
-      - allwinner,sun50i-a64-mipi-dsi
+    oneOf:
+      - const: allwinner,sun6i-a31-mipi-dsi
+      - const: allwinner,sun50i-a64-mipi-dsi
+      - items:
+          - const: allwinner,sun8i-r40-mipi-dsi
 
   reg:
     maxItems: 1
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
