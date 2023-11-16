Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7E7ED874
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 01:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880A210E2C1;
	Thu, 16 Nov 2023 00:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D30C10E2B5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 00:17:51 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1dd71c0a41fso111754fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700093870; x=1700698670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Tc3YJAqfIqDTHuog1Hz5PnyAu42zB2xLiKNLYokXpM=;
 b=jHxyRsBT8kHBvQmzvMWfQ4DZ6ObkGULK65EGhJql5Sb+rHvnOvj5fxYEYIIiq9qgwU
 hJAj1dADbtxsT1tD8Du/jBdm54JD1rB1JBatSZhdgkL6jXwWg3F0oCTM2TeR1E6Criva
 2TBo/vhPWhjFx+HiIdTiHB8SgBbYP7eppXq6CvkU6yGZfvPksPxAjBs7K7nIX59qdWbJ
 aud+brrvcrh0Sw242IpzyqqLEoz7P2ytOBrSQ6H8m0kqsKJkACe4t1q7ZyUvO93ntIiW
 o38WxVzcP0Y2cqDtUWnFuKzslzBSwIp/KUlzqu/ffath4BmLcqRlaGIDc+NHYZ3QpjBz
 3qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700093870; x=1700698670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Tc3YJAqfIqDTHuog1Hz5PnyAu42zB2xLiKNLYokXpM=;
 b=hxBL4MNQCtjWARZ1hCpdEegvoWbPnRsdILFISq4nUkysM/6YMxDmssTKijRyJ+8nHl
 XADx3nbQZf0fwXjFRBBt6Ko23sV4DD4C2mQsRZOwqemyCOZvP/R+B4o+MplXtCQh0Z4l
 DkmoIwS2Vo9/TS1rHC5D73v1H0fK+62RVJ46YOVI/AAegCIj2/xM7zU75OrztzLq385e
 3Hr2fY2L93W/04Jk5FZIlr+RcFd0zQrKb88M/PPJHL90omEAjON6euDjcQ7clERysWUh
 U/d4B++b5/h6r4Nmun0PaIOqqyBnOYeMeykV26BoWW5jhlQe6t/c6zV8s4fdaiAsJe5t
 SA1w==
X-Gm-Message-State: AOJu0YwKmg4E/79aJdwSwoA3QwiCt4G/GzDp+/TQe//wdJUGHsPKhVU8
 TgnltZUHdjH6aJXJCCrRnSg=
X-Google-Smtp-Source: AGHT+IFLTYPG2sQjO84tzFuiebzB2LxW4EEUu+lO6YJqaMNF18JRW3+xebMH0nmwSWJxVNMOUoER4A==
X-Received: by 2002:a05:6870:4511:b0:1e9:54ef:4806 with SMTP id
 e17-20020a056870451100b001e954ef4806mr16831477oao.9.1700093870522; 
 Wed, 15 Nov 2023 16:17:50 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a9d7d92000000b006c619f17669sm727117otn.74.2023.11.15.16.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 16:17:50 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V3 4/6] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Date: Wed, 15 Nov 2023 18:17:40 -0600
Message-Id: <20231116001742.2340646-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116001742.2340646-1-macroalpha82@gmail.com>
References: <20231116001742.2340646-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
powered by the Rockchip RK3566 SoC. Group the Powkiddy RK3566 based
devices together as they are both extremely similar.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5f7c6c4aad8f..5b015c4ed775 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -674,9 +674,11 @@ properties:
           - const: pine64,soquartz
           - const: rockchip,rk3566
 
-      - description: Powkiddy RGB30
+      - description: Powkiddy RK3566 Handheld Gaming Console
         items:
-          - const: powkiddy,rgb30
+          - enum:
+              - powkiddy,rgb30
+              - powkiddy,rk2023
           - const: rockchip,rk3566
 
       - description: Radxa Compute Module 3(CM3)
-- 
2.34.1

