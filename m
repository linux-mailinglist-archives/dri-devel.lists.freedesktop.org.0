Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F7B12516D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 20:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0566EA47;
	Wed, 18 Dec 2019 19:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1306D6EA47
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 19:10:37 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id g6so1394153plp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 11:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alXkMdM6X6QySpSco6rsE8zxLS76UNqtiB5B4hqdPT4=;
 b=E+8ziUEvMKi8sDEkiES60TVF+tNlUhhj8IHNiBcbbn371WCVzx44hbb9oQmdmCkXGQ
 hj8eBroZ2ihb46/3RVsdTD5NKgRbjqaf4ACgSi6PUIWdb5+180sHUakXUkH++To96gOn
 RIxHPJZtxlLOZtQ2kV8jtPPw49V5Lv4Rc3wWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=alXkMdM6X6QySpSco6rsE8zxLS76UNqtiB5B4hqdPT4=;
 b=lsHvDQcDDlp8BmaROV2gUV0yG44mQ1DDnw1XCDIHX5SVzwsDwODmUBGzg+KFoTglAc
 u2hhWFoKIsRimCwyX6Oxp0qM5dVh7bdFVBFjwNK08XPi301mQIWjwX026R7GOKURGf2F
 /z2QA8vEyBd09qyYb7IipyS2y8RhXtTv1WuqHWTq2E7MdWCTmeypbAMKsRtQmkxM448+
 O3Metn3qyznyuRFJSnGf9EYbSGfwkSb801K3GuToWiKZ426nd0dJbbdjarxPfYiFuJhk
 4Ru86K4v3Rj6kbXog+v1izULDakOlMRqieXUd+hFd4J9oZ2228ceNGth03RB1NoR4rzf
 HkjQ==
X-Gm-Message-State: APjAAAWkWa5mqHn7XndCRsne/etdYlpFJq60sVj7/vQzTtQ1sevNUcYX
 +jR2kf8tTF3irZ5oD7AiIj7QGQ==
X-Google-Smtp-Source: APXvYqwbe2b9Mvei8KPI9wO4JZV6Hz10WouMUmvDBFv2bWY2DwHIIMZxDNbDLq6tRccxycc9qNSXEw==
X-Received: by 2002:a17:90a:d344:: with SMTP id
 i4mr4801276pjx.42.1576696236642; 
 Wed, 18 Dec 2019 11:10:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:78ea:e014:edb4:e862])
 by smtp.gmail.com with ESMTPSA id q7sm3745855pjd.3.2019.12.18.11.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 11:10:36 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v13 2/7] dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/
 A31 fallback)
Date: Thu, 19 Dec 2019 00:40:12 +0530
Message-Id: <20191218191017.2895-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191218191017.2895-1-jagan@amarulasolutions.com>
References: <20191218191017.2895-1-jagan@amarulasolutions.com>
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
Changes for v13:
- collect Rob review tag

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
