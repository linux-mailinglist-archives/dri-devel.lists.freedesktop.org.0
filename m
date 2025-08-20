Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570C8B2D46C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 09:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D1410E22F;
	Wed, 20 Aug 2025 07:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LgjZvNE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD2810E6A2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:02:56 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-afcb736dc8cso79134866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 00:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755673375; x=1756278175; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JYDyb1l+byMOiaJzKn+UnmmghGQhvpVn03tecEee7KM=;
 b=LgjZvNE+NJTudaAaFhq5GM23deOCb1WpAPvG/1384DIRGoTLqHLlEWk3L/U8mEjEcL
 UC4WjH/M7QRbrsYX8BhtQ3sCrUPuUKGZt8XgPnuRbS7vNJs8Wznq5mnwyOK5NnB4TiBH
 9fEdTj56+kHc0QKED/Y26cHLlwElZSSkcKsbF+6C/uUt6kV9k3i89xPLXoNduhrzdPKc
 PvTNpt78atdK4238Q37Wr/aA+JwQEj6EwZl4bFApSSvojRFXSEdI8fOWLqssMEB87Y6N
 t98PviI8oys8XsaKkdB4ipct8bKuIqDSl7mZvF2cjzRrRPJyiDLCUp0e4KXikNvBUR78
 tVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755673375; x=1756278175;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JYDyb1l+byMOiaJzKn+UnmmghGQhvpVn03tecEee7KM=;
 b=aaf6Dl4GrgWrTvzM6kTbiQVRvyt+qhmVS9Jo/KWnDZuHeDZZ4CRkZYLieXVifaQ/Ye
 /1rsDnI5YCOfM+3BCLdiweDKQtSGwWoknfpixuopV8CB+05xeE8dv4FxIBoVeY9cKQSW
 4azfLKBnHZF1C1BvVg0kiMg3yHZZZyjwubL/Y/+3MSPNQkwrlHSZ+HMtjlRen9Kj6Cdh
 vzzSnDkpRdu5Frc5xCM7ks/Abu0qKor8cNKQCjvZZcMa3f1XMiN7WNhwWiPOzcBfoHed
 FcgaPR0A7dxtE3hH8Ym2+TC+qsQtn9YUAbFx0ztEDC8rD7uAnNftzDelOaIDoyrXGm5M
 cfDw==
X-Gm-Message-State: AOJu0YzCDaESliTjnJSV2SepTbCYFK4GFGq60zIvCty+j3l0GOdm1Cy+
 5cjHfl7IQ5MpSa5EjPshr0tFYiddEl0RACCtgBJuFWdy6W5DZ1uubfWBniBUwnImhgcnHYKcVNq
 6e4GA
X-Gm-Gg: ASbGncsJSQtPsevLHu1kY3JHtBJ+2d1jjlHPM6oS5uer8WVYTB4oQ7rOKBbaCvQG2Rw
 +ckJ9UiOxJSZNGL+5k4//PBheB8mYRltRZrHkht9crVUP47QXJx3d1j7avoFQK28iTwC5z/bKYq
 R34r/ZkzxsGSZiEXyXmQnLnByVAR4jGlyqP0dYXoonY3qYTd2EyW5AN09xk7EENNPndUKyB4NdU
 ZJI9mdNlcZaAU6XDUWpulOmT9H0NkcHm7n4jjH8OyyeR26H6Hbv1n45Vr7npY0JMa67/nygqlrZ
 e9VGPqvZ5/9AWQFl6Wy9OlRlqUalSnlV8wt8xt+i/5dYXVzxMa4kCANczVLYirkP2rxOZ27+RE0
 qJd0gozWcC37CW7jOXKP6lo2s2+1Ldmj+TxU0dSk=
X-Google-Smtp-Source: AGHT+IHJRyotiUitRQlmcmuPpwvWkmkIG5BFx79tKET0/ZCpVsB1kmI1FDM/O1dsctY74CZHdQJyWg==
X-Received: by 2002:a17:907:869e:b0:af9:8a71:e090 with SMTP id
 a640c23a62f3a-afdf0280436mr79978266b.9.1755673374003; 
 Wed, 20 Aug 2025 00:02:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afdf6ff14f8sm37756466b.67.2025.08.20.00.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 00:02:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 09:02:41 +0200
Subject: [PATCH 2/3] dt-bindings: display: ti,tdp158: Add missing reg
 constraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v1-2-d5b2555df51f@linaro.org>
References: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
In-Reply-To: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "H. Nikolaus Schaller" <hns@goldelico.com>, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AkV3VRQfJAkPuyGMV3zApyjndBmAsTYMa/X+l+hz0eY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopXMW9wkV4htcYjEWNJWdk1zKtmlcN5CE41MJX
 1lvlVHNyB2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKVzFgAKCRDBN2bmhouD
 10A2D/9nQCtB+BeS3a1GcRicjBMuO4BkqDJ5fzrjdybep856QeJGH+n5b1OlnWduayCgJ6pf6Dl
 LypCyElXEf/lACJADLNxNjsYmPhmf1xM6Pcn8rUiaRjTWzL5kuaKrt8ebYHsWZLGMPLPjWAInos
 ehCcXGVg0K+9/wGg+Ktof4C42Apwde031SvjTDqRFovXzfZiMksOvKip8EqCLBP0Q7I2ATk/HMo
 YNb5TZuVXvQei+SPOlGiDyjSE/lrv2u6zX/8Cgs4bgm8+lgw2vhnoLu6FCSssgBpspHM8XdK4mi
 7RVZ7+AejZe9/NrCUiby/iwRcz7r9GZBpbYj4AgyEMwchWysCpt/DeGaKJl8wFIUvCVHtQlInvQ
 u/+ww52Wz5tbPFYypkn8DeAl8xTQvvBB+tdGFPq6HedhtRQpF5e3TI/f19j7CO7XbFvdc7L+Ij2
 AaU9Z2GXgTdcvBI7CQn68hNqcoGYQm8dmxaObXAHIRncTbasCU41dBaRlDqGBxwIpW+8mzxHOZ+
 mxP5i8qdMzLlDOb3upooTdHnHYdpxv+4rHyKsOa0BR3VtvCISQUHiIlfo44ZFT5KnxqQrJQPqXY
 QmdKI43hwtGaOR0OnRZzVR/elstxfWt1N+1ovS6R0pbZnNLTFD73gtuL9gYcz84OOUd1K4qOkvk
 Uj/DMPJ6az2a7Nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Device can be used over I2C bus, so it documents 'reg' property, however
it misses to constrain it to actual I2C address.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
index 1c522f72c4bae3313930b5c76dd04dde1aef5151..721da44054e19ff04fe9d8c1dc31a9168e8f79f5 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
@@ -17,6 +17,7 @@ properties:
 # The reg property is required if and only if the device is connected
 # to an I2C bus. In pin strap mode, reg must not be specified.
   reg:
+    maxItems: 1
     description: I2C address of the device
 
 # Pin 36 = Operation Enable / Reset Pin

-- 
2.48.1

