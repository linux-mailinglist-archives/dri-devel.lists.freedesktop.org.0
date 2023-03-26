Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C57B6C96EC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 18:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E30F10E313;
	Sun, 26 Mar 2023 16:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4616310E313
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 16:47:04 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w9so26577264edc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679849223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k9We10+aJn7ul+hCgyePSABdIzaHTrq5ihMYDVZioG4=;
 b=BCsjrgqFL9KlSvIHJbDWc+7t9N9t7oUU7WOToekUV2EO0SQFTiQJkmaPhEo+fSPZSj
 YzD6G0Bs8epjf8soLwdWa8IiodufrmYgfC2Y6HJKABANlO5CqqxCn1jRAt1cNqOBGPQr
 w0ieqdPMBSuNYj7BrVImGEqks1o532QUn6V4Rrp/jg52X5FOcictKEqqkIj+Up+Wex3F
 TNeUV9hHK5z8SNJbp9uozti78VVFRY9YXlNUR5Ky/u0EWVkU8rNvXsBbkRjVlOvYaCEi
 IJJGXXGKUSHluZgsnf330T60ddYCUQFKqV+VZISktF+QI9KDub2OX7T4bWEEciHNWlDY
 ziXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679849223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k9We10+aJn7ul+hCgyePSABdIzaHTrq5ihMYDVZioG4=;
 b=OuK2N4rf6hPs/j7BeEHeCZrkOyAS9TZF3QgB37nd1mFEA9O/RIlrqRu909ufFJ/qOI
 KLGTULIKcwMYlN/R7RW6MYu/tYuHwBHfHzKrDyUdguFzPFvZjyvhPpDv08D0fm3dI+S9
 LLQzpJu0tNQy3wcX2UsGyI8pgQR/pLZ0HSYb125FVK/sRjY5/yty5IsjNYQ/vub40yXS
 XT8GKH05bHLwLz5EBGbOVY09hd1zTQ66PaCXhy2c2gpzemuRd5Gnd/IOJ7dg/v6q6QZp
 Ypc6RgItxh8vj6tSR8H4iDy9cnr5eXYH6WfvWaSY5TshqF+seGRV/N+boODgm0mlmf2k
 bvTQ==
X-Gm-Message-State: AAQBX9dYcL9Yr0o5U8R+DspTxCcAhO/W2V/FBu9UZQE3PkzeQPFmSQ/e
 tXJDETkg40ZD5oT+Y0bnCjAGyFQk6zBJfOZ368s=
X-Google-Smtp-Source: AKy350ZaVi6CbGP1f3BlaM7CAOyL3H/tqpdjSxBn5g9IpqoBK7QlOK2q99MGJbJADsg/UvN5lWgoxQ==
X-Received: by 2002:aa7:c90d:0:b0:4fb:2060:4c20 with SMTP id
 b13-20020aa7c90d000000b004fb20604c20mr9205267edt.31.1679849222778; 
 Sun, 26 Mar 2023 09:47:02 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a509544000000b004fb402a2a37sm13833982eda.33.2023.03.26.09.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 09:47:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: sitronix,st7789v: document dc-gpios
Date: Sun, 26 Mar 2023 18:47:00 +0200
Message-Id: <20230326164700.104570-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The device comes with DCX pin which is already used in
canaan/sipeed_maixduino.dts (although not in Linux driver).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/sitronix,st7789v.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index d984b59daa4a..fa6556363cca 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -26,6 +26,10 @@ properties:
   spi-cpha: true
   spi-cpol: true
 
+  dc-gpios:
+    maxItems: 1
+    description: DCX pin, Display data/command selection pin in parallel interface
+
 required:
   - compatible
   - reg
-- 
2.34.1

