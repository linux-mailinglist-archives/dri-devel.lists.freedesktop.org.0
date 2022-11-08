Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740BC621AAC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB4C10E4D7;
	Tue,  8 Nov 2022 17:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C82110E4D5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:31:32 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 130so1596014pgc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 09:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=72IOHn8vTUxOevqJbd/ETpT4pRNMPQp/jDGduzjTALE=;
 b=VEJ2q/r7txvFf04Pu+R7l0ULoTowiUNocRVuGrw41WQo0QGuc0t1X5QNelVK1GFGn/
 2XTXR6mk9QFZHyhfCybYonUjFDd+jI0gThOaRtfMyclbt6q+/VtmPI16OcCop3hGcuRf
 Zk9Pcq5v3Yp3V/UtDL4C1k9teCcDKCw06btt7JXvh+l17B+Co11zHOEXXVyimnHEJShm
 CjjY8ksL/PaKUl/3qOb12k9DqTKIiK04pjBeaRuyFqurXMUi/b3TBd1Gc9tNbSiZV879
 K/JnIrzwiL/+umx5pHezuu2MK/Y8R9MOgayt01P3Bl6iTNKREzeWDdXH9o548ggmB2fS
 6v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=72IOHn8vTUxOevqJbd/ETpT4pRNMPQp/jDGduzjTALE=;
 b=qrDhTUzKiQCSAV+3laBf96pJbYt0ts6fZrTNhHNCixhjqJ9Li5d2jQQY4kuOmynFy1
 qQaGWyZ4y2QgKGnjXDPjvbTdiN0dxLaLPLS8HJBf3gFgbga1wdq4eWd2uOj1c5iDoF5B
 AMFyI1ZM4RcxrZBL4+CWVxcwadQZ0bB/p674w2F6MViUWELGQuUKYFxXCg4oR7LwMtwZ
 bK3F0KZ4/rkPBGqJ1HvOIW5aOVR6F54WNCyhzk6DLj35renFQldLCq75dEDTnE9uhp4S
 rzPq6pzmNweBcMB8fNyO8YmH0AmRrrQFB5w9A9haQE+M310L8UviovwQIyYJqWXp/STN
 4mww==
X-Gm-Message-State: ACrzQf0b4sZbCutd8VZA6zKqltUyMHCEv37Zz7JoG743H34hDiH2iG+p
 MQ3GBwP8Ahzv3BWaEirpSeMJ6Q==
X-Google-Smtp-Source: AMsMyM56h3FPIKoCclAH9FzFxmvrkU7agu1MEyij+PXN3hapuNyz/AsxWctUUSqR4Ub64HPaDyg8bg==
X-Received: by 2002:a63:f012:0:b0:46f:59be:2cb0 with SMTP id
 k18-20020a63f012000000b0046f59be2cb0mr49865184pgh.99.1667928692025; 
 Tue, 08 Nov 2022 09:31:32 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c2c:74c3:d3ed:4dfa])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a63df43000000b0046fd180640asm6018517pgj.24.2022.11.08.09.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 09:31:31 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Document Chongzhou
Date: Tue,  8 Nov 2022 23:01:17 +0530
Message-Id: <20221108173120.618312-1-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chongzhou is a professional is a manufacturer of LCD panels
from Shenzhen.

Add vendor prefix for it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v4, v3, v2:
- none

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index eae3bc8a4484..08264594a99f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -246,6 +246,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chongzhou,.*":
+    description: Shenzhen Chongzhou Electronic Technology Co., Ltd
   "^chrontel,.*":
     description: Chrontel, Inc.
   "^chrp,.*":
-- 
2.25.1

