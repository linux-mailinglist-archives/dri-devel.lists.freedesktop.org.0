Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB512AB0E08
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2253210E9E0;
	Fri,  9 May 2025 08:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kL7oRLrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1998F10E9D8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:59:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so11776125e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746781185; x=1747385985; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T3uAu3A4YUWMgeScFXrknXczo0EYOFrNx11xrsJM7O0=;
 b=kL7oRLrhA51s4jsx/VbmK5+PQr2Y6FWnpwZKsL7yWa38THmtExXj3oDAeJ+opOmKZJ
 t7tUz4kbsUP/TfOHf9N0jnCrs8c8BRxVAecE1MsO/ITfM4jFePGzz6p8Dpku2WkBh36U
 o+vkhMekuBWzkzzZ9lp+YHR/7ANrhP/YwD02QsIp1wSxnUnItc09oOF4/mY1WKcCPCxe
 k2tjaKq5HXy3BEaSpBM7ielZducm/dDjmKxuKQOFTsvn9QctVMO7LeNBi02YbUCsyK5i
 mxzE2aRRddzuHH/ZHJcLox9bL5KraGxmlNivJYnUILmh9/5/RPWGEFrncRI73srB4Ayh
 j7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746781185; x=1747385985;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3uAu3A4YUWMgeScFXrknXczo0EYOFrNx11xrsJM7O0=;
 b=nOE7rKEncdMjzXPcldKeeqWOQgctmApynvJHjWSMJ4YzyWlAVNMH9jjE2SSbZZvKEZ
 A+r+VvbMj/dDtkSFGkD8btCJ3i3bWMRBuf9LJAPw0TvKvSyex0dDH44wyoVJNgbAr0LQ
 /v1hQHBaPPjaPufeZ/y9BB0tZEwUIqI+2dRd09oWX16DsdG9bFQ8MLvQHSYBmyS2EzF+
 vrOHdP8zyOE334+3IYqz15cHwIYAMlROA8Ayzimf/KFoyh4aeVHnqMu+tV3yAopxdtBQ
 9gYqSf2/jPTytB/ZY+aColReM/UH7CMJD4ADuVSWYxIBbgdOL0q4glF4jLwryWANc+rh
 3ESw==
X-Gm-Message-State: AOJu0YyvoxCNuIHgcGU59AecGMpplH+8FSlj5cP2Y/WOkx0dOP6QVKzA
 WzUa1ul2tsi6ykSOKf0zvddb43G8NVSV52Y5sSz3xZN3GnurucocUfnGlwQrtOM=
X-Gm-Gg: ASbGnctnFrDzj37kY75f1loMo+aKdbO01I3XokIqlUcLKsuWv+IjP6vFsJgUczcGjZh
 LWnPGlfTW/+sEsq/8w7vYzVwhxARlW8nlOgASVVzKktncWS0rThJjo+DwzBrmGtLEPuPMlzEOkn
 KUceSV85PTFFyBejaf3c0AUJfCtmFMmjPZ61U4HWasrB9/K4mjV1QG4rLviMet02M1Ti/pmAodN
 PMUJBpT0g21tySmHxF+t3b0v+zD2Id0QcMCdG3xfYVyM05QP+txeQdmlwwTBM6a9sxgaNZLnbXu
 Mmw+26BO0MYvdS2juaz7VXZdHcJqAY/ev6tUgY164VeEy3XkuI/okbIrA4HxpQ==
X-Google-Smtp-Source: AGHT+IGGLXUusoILbS1CySmY5yLxrVw4d+a59DHYYC61SdUtYSIzuzu1CJOLjh+OwwTUyJ0NNUtfDQ==
X-Received: by 2002:a05:600c:c1b:b0:440:6a68:826a with SMTP id
 5b1f17b1804b1-442d6e05cf2mr22229985e9.13.1746781185559; 
 Fri, 09 May 2025 01:59:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67df639sm22369115e9.13.2025.05.09.01.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 01:59:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 09 May 2025 10:59:39 +0200
Subject: [PATCH v2 1/6] dt-bindings: display: visionox-rm69299: document
 new compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topic-misc-shift6-panel-v2-1-c2c2d52abd51@linaro.org>
References: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
In-Reply-To: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RZnJ7ALArB3S7wde3YqyxUd7RDqI3oA1G2B1Dr/Q+do=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHcP9MKcRO9eIXObPviW/V5gNHncIf/stkVaVtTSb
 nYclvCuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB3D/QAKCRB33NvayMhJ0QEzD/
 95LJQICNhRzxZ4fY78+fdBWGHMKqvJi3xCj4wryHyTDLLvc7cIb8RMbbk1fBjxzw0nKBXTBiHL+1Ws
 wRhxpfIfw2EXYauyhjvDrJ+gDaODcxbRtR+VriZDWaTe61aXeYRiVTsSLeg56xhgQ64iTj7IGj834X
 MsCeaIeJ8rOdsKpPt7aL/cChhG8jfmT3jYWEWD7FHc1DKPI7BSqFkx23ZycuyD+qOSsRZR7xdr+HbG
 lNjRqJabzwvJ0mPQEsr9XCWpv70J6a6xOHscpjDO1A5XyTB+eGzlqo0Smc4sqFnLKT6VXhvsQbe0zG
 x0f9HblXFIU7Myx9NeuQW3ui8vVVrlXL8P/KYRi+Q4kxCmhzD0OZUab79dH/QXmUOgrPXk2nxAWPqJ
 7/ZHliXq/zSjUh5hN034abXLvSS+tNB3/K8iZAWgYfGD5zGEOaBxMVntGn7HYiVj7mGPqB+0ZPH+fJ
 4c4oMcmxseBJr28aTrH+g465Rqtxiq8JBBsWw9+YzJQgQcBw4xANAH7Cu3RHahc0i1lP6B++vdHP84
 TAsgdfMONKDvxthNkpBxz3Q/Tv0L4/gNt/WdbDqNwNpkzy9Yriwufe9qIu9LZCD2OWhPJQDbmt+lAB
 PGvf3e5yEvM4mFFeuiUHgKBRywMPHiE7JzziZfxLO+3f3L83mT7eKhaqLYMQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Caleb Connolly <caleb@connolly.tech>

Document a new compatible string for the second panel variant.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
index 30047a62fc111ff63cbbc275914ef8bb7cb4ffd6..f0a82f0ff79099cdccfd5c5001de0d319e94410f 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: visionox,rm69299-1080p-display
+    enum:
+      - visionox,rm69299-1080p-display
+      - visionox,rm69299-shift
 
   reg:
     maxItems: 1

-- 
2.34.1

