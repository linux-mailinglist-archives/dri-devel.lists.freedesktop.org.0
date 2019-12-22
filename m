Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BF2128E24
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2019 14:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F6A6E527;
	Sun, 22 Dec 2019 13:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7EB6E527
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 13:29:36 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id u63so5039593pjb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KhD44eBjciixBbXS0jbewwrbs2b2OiqLmvbXkaKHo00=;
 b=lB4V4tgg9XJchkZsFP26liTLrD5wSsSFIAEJ32qjq+iAwPpa8KAOLT+EVxcmw1pwYK
 WMckdTBx4XBA2jV1zAMUZl7P6mpT+gvrq67YYby5w8wExWSzt8Nz7CRKG/z/R4vuRF6+
 shHJH9AM/F2G+LyXB5Hw4yotlUHH1pZsM8UDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KhD44eBjciixBbXS0jbewwrbs2b2OiqLmvbXkaKHo00=;
 b=pY70CqY5o00aT8jND9L4AXJniFOtkyyVjeXRnpCXwvmpe6dJDvWV/gs8Rtu2oHDXE0
 U+wI47QV+g0bjnVv9tmQNzDeEnVfC/DLXhpDloiYIgku5O0v49Z7JyPa905qrPh068y1
 d0PDzeSST2hDp+K/VLN46veFVlsgcoE7bL2gDJHeQypdmp+JsabkngesLlH+XaSAZqOI
 CJtxkAyz5rN52paHa9K+rtJFU4QA5FMMgsQFaj/HvzM1fUP/UBj275g+2OnPZra8JzMh
 7/Kp/LhERIVyuzKpK5QkDQnad4sy0FjatubgsjKzqY5T+P6iaQWMpTixJWLF6iAJluPc
 OTxw==
X-Gm-Message-State: APjAAAUF0W4acap413RqHszSkXAUUDRgtkYiSAhBHrVxMvKFwnEzYviL
 KnRp+hl6v9uH57+4uSBPrz1wOg==
X-Google-Smtp-Source: APXvYqzVvyqaDb1iAdI2rOGho/ufZoqSGILukc81YMHL6NVkze8m/8RkPnz08yfklmZh9CKXZYH2lw==
X-Received: by 2002:a17:902:74cb:: with SMTP id
 f11mr24895957plt.139.1577021375724; 
 Sun, 22 Dec 2019 05:29:35 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.16])
 by smtp.gmail.com with ESMTPSA id o2sm12073058pjo.26.2019.12.22.05.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 05:29:35 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v14 2/7] dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/
 A31 fallback)
Date: Sun, 22 Dec 2019 18:52:24 +0530
Message-Id: <20191222132229.30276-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191222132229.30276-1-jagan@amarulasolutions.com>
References: <20191222132229.30276-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MIPI DSI PHY controller on Allwinner A64 is similar
on the one on A31.

Add A64 compatible and append A31 compatible as fallback.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v14:
- none

 .../bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml         | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
index fa46670de299..8841938050b2 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
@@ -15,7 +15,11 @@ properties:
     const: 0
 
   compatible:
-    const: allwinner,sun6i-a31-mipi-dphy
+    oneOf:
+      - const: allwinner,sun6i-a31-mipi-dphy
+      - items:
+          - const: allwinner,sun50i-a64-mipi-dphy
+          - const: allwinner,sun6i-a31-mipi-dphy
 
   reg:
     maxItems: 1
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
