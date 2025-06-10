Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCAAAD4292
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 21:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A9610E315;
	Tue, 10 Jun 2025 19:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="dVb1Rpxb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BEC10E315
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 19:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1749582620; bh=ORrUF7nYa0/NON+F3kH44eDNfaALmuqR7JZEAZeDHdc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=dVb1RpxbkDDj/U4PbLc4TfeD+qKWd4bTkbWVa3bt7IUs3Duj1YdZAtDzZHfBJXUJe
 jtUyxfAXX5m9wFywcKNyLLfiLWnEOQQ/YEUK5VrbpimhfCrOW0iyiniRW/d0pM5wsP
 yQldH5rbrZKNnKh5gpL3l8EFOlbheZ3oQOqA1jl0=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 10 Jun 2025 21:09:19 +0200
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN
 Optronics Technology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-fp3-display-v3-1-e7e7561812e1@lucaweiss.eu>
References: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
In-Reply-To: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=ORrUF7nYa0/NON+F3kH44eDNfaALmuqR7JZEAZeDHdc=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSIMYK4xtp+3EEhi1Qr8ONBlkqv85yvke2Vc7c
 GxUYN0d9UyJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEiDGAAKCRBy2EO4nU3X
 Vr3uEADEX9KozhpylN27p+GKmpGckKbzTvkRXnXBpxtoCzHqXr1oceO1g1g0f4KzLDN96D3rftP
 l09aLv7c6T7yvwIT8a+nNagP6hGDoSNoWayvhofcy8fZuG8YiMhWbbFuvZXSfbhsvWxGWqlBBaq
 odCIOmNS0Paoe0F7lEKJm+PNSHSUHaIqANXv/fCe82WqyhwM/KUQwm1ugQ2LGtjm2BlPlyvofvX
 GsUixtVwRS2PLKx/9A1X7vA4Z0O0ZoGOSjpgSfhO/k0OJFYT031d+j8lU6GFu2hWbsxvT/AQ/4c
 l/ZWVuXm1PF5lhwiuW9WVZ8YoG3b8nJE1DEgDtzmS1U1CPcmLI+lDZ9Q5D7pXe9oIOU768WajJu
 iAN6MM7+6xBpwHi8wu3q1tjszyKZ2pUUBNOqr+fQokOqbSsyAPF28ouupXOMJxtmps/dAs4Rkya
 nIrJRg1K5Bn9a5TZY5EV6bPB0bnWUgyATQ49Lz578Sk1ZQwgpmIm+8dkJ5VLBop/oE+dJrJhU0g
 mRD2J1m63tanJE/Qz5ntiVkAcbw0R9nOcmRdVaWQXass3QT8tv9irDwtFcyELvHMmCREOZ+EIP5
 z+0WYEGhwvaRDHIqYccWQP3XVFsmCnpBIda6pZ/OmLgnoC+bmDE1Tsl1q9IIpZVQjZ5oAnPxN4b
 IbHblyY7ocsDzxQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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

Add the vendor prefix for DJN (http://en.djnlcd.com/).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..76db551ebfa1266d869f40cccbccd1a288c50c02 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -398,6 +398,8 @@ patternProperties:
     description: Diodes, Inc.
   "^dioo,.*":
     description: Dioo Microcircuit Co., Ltd
+  "^djn,.*":
+    description: Shenzhen DJN Optronics Technology Co., Ltd
   "^dlc,.*":
     description: DLC Display Co., Ltd.
   "^dlg,.*":

-- 
2.49.0

