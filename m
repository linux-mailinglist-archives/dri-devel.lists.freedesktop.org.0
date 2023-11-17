Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8634B7EF8A8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 21:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B3110E782;
	Fri, 17 Nov 2023 20:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFFA10E029
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 20:25:44 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1f060e059a3so1314462fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 12:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700252743; x=1700857543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Tc3YJAqfIqDTHuog1Hz5PnyAu42zB2xLiKNLYokXpM=;
 b=b8DipkHTbckg9aAhvQtA6Bwnd1zIeOtrXofcX3FUmiN1svCrykDm8UTv3BZGW/1V0X
 AE9i/24GjZyzTP7rZ2GmVdZek2XKwkJL8cT3pyGozWP7v5EygG7zhLny9clUErwx8a7G
 b8X1ZhYYsHRpfvZwtMDhYGk40O0KX6NO6ORwWGHKvYhpmFXK3UidlEW1meMQErEqcR4U
 98WhF8xWfDjbaV0jnkBlFRnGovG5NdZkatewrYYefDQ+sBCc5KSPZA8CopjxVqZostBM
 DNZ3H1v/4u6NTDMlJQ0XJn0gRiUFSidKxruLViCXKcdKXO+1ZhnTFdYD5Jfj1VvK+M0q
 tDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700252743; x=1700857543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Tc3YJAqfIqDTHuog1Hz5PnyAu42zB2xLiKNLYokXpM=;
 b=hZW9wgukAWAZ2rAJJ4ZPDdZR0p2eEqPB5CoIfS4YeAPpAvxBBwXSv76pkfH1qR1IgF
 rsJAJBVMFI0nWVhs/kwVXVvJGCgtPlcz/ehGhvMUk0m+XvplMmIB5rXRmHM3B08fLRDw
 B9q6/D6phRotCUO3g3wS2U6T5iOIljfCETrmmvN6UUpa7vh+FOFjISckC93s0vRefiW7
 C7P1pQAZhPccne3eIK3YrTJOwcIHq0iim4gHecBA3IXF3kDOVBZhsmzkpR6FgZp8bywD
 OF0lSF4jwbTAp/oRL5aYVtCH5JgF5yr7kMmPEc7kQnOuR4nnb2h8ZNtWnvLkB86BdsW2
 KJTQ==
X-Gm-Message-State: AOJu0YzGkkLDCcWiGqemMtlV4wCtm4fDhkmzkKAcGAtqJyGDM9ebSqCC
 PP9d1O68n105YAx8qHoP2ufqN2XH9Yk=
X-Google-Smtp-Source: AGHT+IEHoOP4KG6sep1RoF8BKJ7xem7Us4jx8tSEguQQKOH9EyMYtcn02oN65SfolT+ioZ9UrwWksw==
X-Received: by 2002:a05:6870:14d6:b0:1e9:ba96:272e with SMTP id
 l22-20020a05687014d600b001e9ba96272emr316461oab.10.1700252743562; 
 Fri, 17 Nov 2023 12:25:43 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 zf15-20020a0568716a8f00b001f224cbbde1sm390543oab.41.2023.11.17.12.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 12:25:43 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V4 4/6] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Date: Fri, 17 Nov 2023 14:25:34 -0600
Message-Id: <20231117202536.1387815-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117202536.1387815-1-macroalpha82@gmail.com>
References: <20231117202536.1387815-1-macroalpha82@gmail.com>
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

