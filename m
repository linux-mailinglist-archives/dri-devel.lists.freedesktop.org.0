Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3397C8D27
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 20:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D480710E632;
	Fri, 13 Oct 2023 18:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74C310E62E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 18:39:28 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3af604c3f8fso1429189b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697222368; x=1697827168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GXvtOEtJnfXimkkSuTA6yQu+NLR704L5IFi4fq/Sctw=;
 b=L/uwb4y2JbYoJtQEK5jtWnXD4+NxaP/o/EOEIzJ7/MJd2tdAjgmwzAZjqhO+u/WO9F
 R2C0w8WRnD/mbGPb/j5LNY8EcZJ7V9uJo8hGXn++UMIHAPQMoqwVZ0E/uGbkKhmgppth
 TtowMTg6EXWHM0MpofZb8iMlrgI5yCdDeEkx+MR+VyIu3c+fnQzEVOZq13lEUyU/CCUL
 /zCz2NcAFUCJ60u9r+bmfV1RUmSxIyCaJFrLtHLg3tBtJYIzA1jT82fbm6ZUwNxXPdQd
 i7sFUzn5UtDIv/5DA4QEKG2Ohil+bc90mKA51WeqXIwg+0q73Bw4keG0vx/F5XFDjiIS
 +z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697222368; x=1697827168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GXvtOEtJnfXimkkSuTA6yQu+NLR704L5IFi4fq/Sctw=;
 b=oRgNQgMtfkht9D56e6CrSQu8M5uC65U3MLdHdLW/J76+9ZiYJVTL4rrC8y4JbwK9yA
 Zshv+wXG1QHqZdsc+r6iWzqzxwMmYkv6KzXZ44bOzlejccjXWhc/mTr36E6xfFA8uktv
 wS+poPKuZrfACRGceZkR3tC0dAxCBxYlHwxlh58H+x2MzT1ivcfthWJM5AgaYzsfOZXO
 L8HYYVbIRPYrk+v4MjnSiV2v0xAVRIGcSxJc0o/E936RlPSJpAHZPrMCJz2oI03HCLPb
 I8c0djC4ZYBOGer8HnrC2cRYX7GX9ZTnA07ctiTcJbUs+A7VDKceDgjyR7mz6yk91RDl
 vQfg==
X-Gm-Message-State: AOJu0YyueuRI5ji4LYaPkLLZejfkuie5A0EK8oIcXXGh/+YgQAHrBnu+
 skXaBWQX9nJMfD3KWYoPhvg=
X-Google-Smtp-Source: AGHT+IHLCQbzkeoiVhX2wJ/317UY9cBFnl7g/HRg+swF0MvMpIM8vSagJfZ0IQEo3cfxpthCYJQz7g==
X-Received: by 2002:a05:6808:10ce:b0:3af:66ef:3566 with SMTP id
 s14-20020a05680810ce00b003af66ef3566mr37525952ois.33.1697222367844; 
 Fri, 13 Oct 2023 11:39:27 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 bx19-20020a0568081b1300b003afe584ed4fsm842159oib.42.2023.10.13.11.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 11:39:27 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 4/5] dt-bindings: arm64: rockchip: add Powkiddy RGB30
Date: Fri, 13 Oct 2023 13:39:17 -0500
Message-Id: <20231013183918.225666-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013183918.225666-1-macroalpha82@gmail.com>
References: <20231013183918.225666-1-macroalpha82@gmail.com>
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
Cc: megous@megous.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kernel@puri.sm, sam@ravnborg.org,
 neil.armstrong@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, jagan@edgeble.ai, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RGB30 is a portable handheld console from Powkiddy which
uses the Rockchip RK3566 SoC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ca5389862887..a349bf4da6bc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -669,6 +669,11 @@ properties:
           - const: pine64,soquartz
           - const: rockchip,rk3566
 
+      - description: Powkiddy RGB30
+        items:
+          - const: powkiddy,rgb30
+          - const: rockchip,rk3566
+
       - description: Radxa Compute Module 3(CM3)
         items:
           - enum:
-- 
2.34.1

