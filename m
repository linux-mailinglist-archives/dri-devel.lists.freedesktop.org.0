Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AED54AA98
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDE810FA19;
	Tue, 14 Jun 2022 07:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E601510F96B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 06:20:00 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id t2so6961793pld.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IZf8NG0o3MSwo7SVn9U97DhVDIoNKKGH9DIvsvOO30w=;
 b=qSclY96TdaMyMla1x5WYCnk5LdrFesk+Ce7Eu0ynlhOK/aWfRPF/1Si9YLJ8pcAfdB
 HK6IsWYSP1PsNSi2y34UqDb48Q0DNAZR+RQA6JOKN/3Mh2uFaoQYGi5lcbs8DoAlxRpV
 86qub/JeCUTOwbTJPSDmFSmR4t9UyWUZh0Qqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IZf8NG0o3MSwo7SVn9U97DhVDIoNKKGH9DIvsvOO30w=;
 b=fjLQ5b24oiaOyn64uQ17tIr0rwQ9tf2cKnc5ob8XJDzH384HcobcGxuedZKdYadtFQ
 8K+EqQsREwvl25fWJu1M+rWIL0VNqOdEbBSZmIL5ipotvx6TVEtlgDkL/5w5oP9Hqrn+
 IFuVY9pB6LQ6q0hTfZI3O7HW0/oraPrNoPsdoNWqtfp5BWcpcOWox6v7+4hvsiOJF0Wk
 PwM5K18davTWdTAsQBxiBlBzk47/H4R4Hrc6rxktwjc4CZPa+5o8GnkKv5+jQLK8S41U
 +L2gKERL/LdnHTSvWRDD9FcxcjVFdir0N5fDcF7xnq68+ykkUwi8ssyPmmLYF9gCxw+e
 s7SA==
X-Gm-Message-State: AJIora8fyEvICbD3/EYslV4bjZzR93ONNhvT+4HoDb3id4a5BXN9MFMG
 La8LyObZj19tYytwrbe+ZVWmLQ==
X-Google-Smtp-Source: AGRyM1tfPOGZfsAnVT3J1cfIlPAO7JiAHfSJUISsHzN+lRvgTYKii6jON6J2I2dXRNYxkxxgJFCCLg==
X-Received: by 2002:a17:903:245:b0:168:e1be:f1b6 with SMTP id
 j5-20020a170903024500b00168e1bef1b6mr3060841plh.19.1655187600501; 
 Mon, 13 Jun 2022 23:20:00 -0700 (PDT)
Received: from localhost.localdomain ([124.123.175.49])
 by smtp.gmail.com with ESMTPSA id
 x67-20020a623146000000b0051be16492basm6531216pfx.195.2022.06.13.23.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 23:19:59 -0700 (PDT)
From: Suniel Mahesh <sunil@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: Add binding for
 RenewWorldOutReach R16-Vista-E board
Date: Tue, 14 Jun 2022 11:49:45 +0530
Message-Id: <20220614061946.276898-1-sunil@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Jun 2022 07:29:54 +0000
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

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 95278a6a9a8e..29c789969f1f 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -787,6 +787,11 @@ properties:
           - const: allwinner,r7-tv-dongle
           - const: allwinner,sun5i-a10s
 
+      - description: RenewWorldOutreach R16-Vista-E
+        items:
+          - const: renewworldoutreach,r16-vista-e
+          - const: allwinner,sun8i-a33
+
       - description: RerVision H3-DVK
         items:
           - const: rervision,h3-dvk
-- 
2.25.1

