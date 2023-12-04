Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3407E803DCE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467010E3D0;
	Mon,  4 Dec 2023 18:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D20610E3C9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:57:29 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6d8ba6c9b4bso1218756a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716248; x=1702321048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjmGxTzba5eWWMFHid+3cWm8jzHt4QZZbkOJ/mqzOBE=;
 b=hwxAoNZYJ8Rh0GU8ihB0L51Zmc63ijpRN9N1iFsxXkGgtdrxZwBdayQuYc2OSR8/NT
 Vs4keyAJRd3M1WHAQ+81ba5TcdmKcO4mZ8U6JYvUNayvuc2R4b5g2O3Agk6MyIetq4vs
 PGpp0X+oKoq9Jtbb6zMVWMsoQYla1rCJxejVkecJOfWZILn+o2Gk82WWEy5pLuLdwh0c
 MJGqTeJphddlX/VehF3iH3DKyeVks9MTCIl/+LkErVDywQ8p5Qadq7n9KE93ezzjPghr
 40LLbwnhQV140Sk9TxcDWVJ8Sqw43tIajOSK27D6pAmG/T//4EzZDEb6zZOiON6EsA9F
 QEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716248; x=1702321048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjmGxTzba5eWWMFHid+3cWm8jzHt4QZZbkOJ/mqzOBE=;
 b=xIDoL0QjOjp9Ekxz0LxeneDr9b5zP8HDZW1g11RhgOdAwqs22+mpMCzQr1YX4DWJ3S
 C8GAGKyVgMUxPHZozt0onfyk9B8znMnY8jkjtdptNRTmiay5PQNSwlOWeRwkqj/vAFsg
 EOfSMiyGT56uCWKcGsRHE57yzW5gOr/28Uzzwww0hcLWMxyIz7WtrSC7fnhkpatXpdcY
 ij2TfqEB0E6Z4oB/FgGQteH6kDMneRfKPt2fYB/Ucef+gbHF3b37imfZFFSE7KTYGYwD
 WUfa8APddmwVUstCCDsWY3R0qY3x+EUNVAPdNAHLXTTkeHZfLq7YpB1AyUf26qPhGkhk
 2w1Q==
X-Gm-Message-State: AOJu0YzYV1LVxFjs3PzmBYn9Rdo8t9tHByp7tYh86h3w4iw5NAFul/6y
 /jN9z89Ptm8LjzkkXPHcekw=
X-Google-Smtp-Source: AGHT+IHzaTHpQ8Ye62P0QKbQwCJqXbRnvbwicXwZ+oGcJTkA78/3+GN9vTij/qu8kdADwpJVxnvYZg==
X-Received: by 2002:a9d:6f82:0:b0:6d8:7afe:7867 with SMTP id
 h2-20020a9d6f82000000b006d87afe7867mr3604849otq.73.1701716248278; 
 Mon, 04 Dec 2023 10:57:28 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:57:28 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 03/10] dt-bindings: display: Document Himax HX8394 panel
 rotation
Date: Mon,  4 Dec 2023 12:57:12 -0600
Message-Id: <20231204185719.569021-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, quic_jesszhan@quicinc.com,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Document panel rotation for Himax HX8394 display panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/himax,hx8394.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index ffb35288ffbb..3096debca55c 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -31,6 +31,8 @@ properties:
 
   backlight: true
 
+  rotation: true
+
   port: true
 
   vcc-supply:
-- 
2.34.1

