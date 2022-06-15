Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E620A54D102
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7A210F7B0;
	Wed, 15 Jun 2022 18:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9726A10E638
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 09:39:19 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d13so9917150plh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0DIPLwmMTI4UFu3PLi/ZuHsGMPc+dZx/HTp4WkIjKJ8=;
 b=n4coT+HVX9DwyBEdN3ZSDmnm95GQqXH55r3cZwcG+udEoJR7J28LsDHZxwKNbN+PUw
 RCVinxVkeotbifxu67AxKJhAevSSzVFGEAFSTQ76mYvH3mh7OqKbKMzDj2Bw+2xAuDRA
 kp7/d7kCn+dMz11P5MQFtsCHngtKry6vYDFkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0DIPLwmMTI4UFu3PLi/ZuHsGMPc+dZx/HTp4WkIjKJ8=;
 b=nxot4WtYAtoQQEjFtZlHS3Si/FJ47G39zZU9dR1Hz5I74p9FfJvmEWqaa1boWOy4g3
 bNdyijwGM1/Qog+5xWK78vQokSizawtjpSQyozwsXyf9bF665yY1HPjOpXs7Rr8loivB
 /9+6+diLIEwjkn3j35AEhSQlmX3WUtyLa50n9Og6i/bErJVNeLEGXY/eAxXVPDsSofhe
 /fpWyvf/fC5Wav297AvbO5Y/WeQVyc5/bEXSGYL6zQP7zFAh5iQU0n6pgd4Z6eSkqjta
 SFrP1o+UyuUyU7lpB4gNLI0w0mvNi4cRh4+XeZ0UtZEsFFoCxpXGmhrb970EgXm4n489
 h+kQ==
X-Gm-Message-State: AJIora+1wJ97X3fB9XezkRvJQaL97lKGagAECP+0yKeyEIPxKXZPCq+s
 flrJ0W0wtKjXWwGfykJuMmJt+KC/BA4RUmNc
X-Google-Smtp-Source: AGRyM1tcxw7uqSAvNg76JoEw6CjJnQJAUebeac0bdqGZo0OIVG5a7HTGHFCy6lZKKRDEAkmCv21Ivw==
X-Received: by 2002:a17:902:ed52:b0:163:ee36:c8b with SMTP id
 y18-20020a170902ed5200b00163ee360c8bmr8328182plb.128.1655285959137; 
 Wed, 15 Jun 2022 02:39:19 -0700 (PDT)
Received: from localhost.localdomain ([183.83.136.224])
 by smtp.gmail.com with ESMTPSA id
 jf17-20020a170903269100b00163f183ab76sm8662543plb.152.2022.06.15.02.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 02:39:18 -0700 (PDT)
From: Suniel Mahesh <sunil@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add binding for
 RenewWorldOutReach R16-Vista-E board
Date: Wed, 15 Jun 2022 15:08:59 +0530
Message-Id: <20220615093900.344726-2-sunil@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220615093900.344726-1-sunil@amarulasolutions.com>
References: <20220615093900.344726-1-sunil@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Jun 2022 18:36:18 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a binding for the RenewWorldOutReach R16-Vista-E board based on
allwinner R16.

Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
Changes for v2:
- Add missing compatible string
- insert missing signatures of contributors
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 95278a6a9a8e..52b8c9aba6f3 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -787,6 +787,12 @@ properties:
           - const: allwinner,r7-tv-dongle
           - const: allwinner,sun5i-a10s
 
+      - description: RenewWorldOutreach R16-Vista-E
+        items:
+          - const: renewworldoutreach,r16-vista-e
+          - const: allwinner,sun8i-r16
+          - const: allwinner,sun8i-a33
+
       - description: RerVision H3-DVK
         items:
           - const: rervision,h3-dvk
-- 
2.25.1

