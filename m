Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC307CE28F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 18:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A1E10E191;
	Wed, 18 Oct 2023 16:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C9410E191
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 16:18:58 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3add37de892so3856435b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697645937; x=1698250737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hM+gahaFfhqvyzMw+hLPiLwUYVFl/GwZI4lQvIkPZFg=;
 b=JT92Xh23yOpWKfbySFkTFj/OWrX5GyNT+GqStrjoJ506dK2mjA9Bhni2DLTzU7g5Ha
 L8+lpMhVPsC/lDPksUsgdJsXQBuJBbsLjC4pwcel2tdv9mvydHq4GeUYDiNnGeJkrFIW
 9n1DdBfIjfYfSiMBbNDDa+4SBVDvtREW7b0idksZeQBEg6DNT67u79+tv/WqEQtkUUkv
 I3uZ/UNi8aZVeOLxZoPUcoA9g3TEHUcOrz1WZNLUT+HT6szCX3XLwVpL97M/+16kzdV6
 0AMZnghgqFmDuV97gJIV8ZZP1LRTkI/qLwrHnDwmueQ/0ICZCCHBLkqkUSQgIJj/ncfO
 lRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645937; x=1698250737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hM+gahaFfhqvyzMw+hLPiLwUYVFl/GwZI4lQvIkPZFg=;
 b=p1B3mHwQlkAgpmInHIO+4bTXX4QM7qPcV2cYuGL2HvCozS07eXbKFqaWrg+0IX+9cs
 mgZYq1u9M60nZuTTyZl1Z7Tx9wxogd7XJjM5lr3sDz/WkdEogVvO/umH8xeKd3UTD+8C
 YcABPvBLqUGXofRQVcS59+psBxpEAfyLQ9exG4Xlmh73sdnhjIRlAGbpGUA2YEPpWBjD
 AV1HiWeFV8chis3GN0GxudZ4GKpmCZo6/0bAVnVVzVP9twClI2SQZ7GovBwNpOohJktK
 AaoOFFgUrkLNFGYoo/yUqj4BMV1CU7AjRC40c+hjsBRscBereI9cNcG0ec56ZcxLs9a/
 2/+Q==
X-Gm-Message-State: AOJu0YyASL9zllqFcVIh8y5uYdriHwyAos4OzxBs+n1CuQTUW8s+pmA/
 DZa2mJ3L82LHfg01x2bquEU=
X-Google-Smtp-Source: AGHT+IH4OYf/H6hu8k3PAsRf3mm4jsjcixitYV7dNNGP1JInDwCe05WxnBR6TBxPI5AC2/tf1wVZoA==
X-Received: by 2002:a05:6808:f8f:b0:3af:b6ea:2e2 with SMTP id
 o15-20020a0568080f8f00b003afb6ea02e2mr6734005oiw.59.1697645937480; 
 Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 4/5] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Date: Wed, 18 Oct 2023 11:18:47 -0500
Message-Id: <20231018161848.346947-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
powered by the Rockchip RK3566 SoC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a349bf4da6bc..a6612185a7ff 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -674,6 +674,11 @@ properties:
           - const: powkiddy,rgb30
           - const: rockchip,rk3566
 
+      - description: Powkiddy RK2023
+        items:
+          - const: powkiddy,rk2023
+          - const: rockchip,rk3566
+
       - description: Radxa Compute Module 3(CM3)
         items:
           - enum:
-- 
2.34.1

