Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E503AD5C38
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 18:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1DF10E6C7;
	Wed, 11 Jun 2025 16:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="zNfquBnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA18410E6BC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 16:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1749659638; bh=ORrUF7nYa0/NON+F3kH44eDNfaALmuqR7JZEAZeDHdc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=zNfquBnu4au5n6tctaPtenA4Y7+ce7R8H4AdBoIna0w0Kq+kubxj2t0SipBGikx4a
 Evks1NZnLB0uLPhWYb/YoiBFfkj2iCIl+juD2VAY2gw5njP0JALukcjnuDfuegAJvq
 8KF1VhtujOFwD3C5zbBGTqXMrx9QwwNSt/0bdEjI=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 11 Jun 2025 18:33:15 +0200
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN
 Optronics Technology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-fp3-display-v4-1-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
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
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSa/x6c3JKVQi2RCu6SDD27dPhsmDUqBNNquQk
 PNRSxppQ+uJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEmv8QAKCRBy2EO4nU3X
 VszyD/9y/9KXayucSAYpHY4nG3FNkTfBZ9G/jTxm/lIcP2E0y9E8l582QS4NqowJFunqE7YdYFX
 99ex9K86xNVJt5aGh11prrCSYNGMABGpaJc/U9/A3Xun5lRCR+mmY8BNfBEsauP/zoNJaBaYs53
 hkmon/lpUJsYeP+FUZuqO6v+dBEsgPyCydxFZCfjC9/oWVwKGQ7RPSb+R8pnQni6wEvcswVo0xV
 yrHJVY8Ojso2QaQnwlgUk2JaS1XNsPfb436ghe27idOplvT8MrNk6taPSWay6U/7re5tvUuU0DT
 eXo2pi2qcfcpOMo8AY276DIkinc0ReO5DqrLjmJ980V4ptNhoi8QwcfGmKZta6AUAVyhS45tOTH
 p/3n3y3LMTxdAuMTngc1adlMjFXvJ4vdb/BVMn0aa2b9qk2skrF7TVsZ8kgUuJziDj5jQ7PChea
 ONOrhLrtrDQwe3GVYAgoqdfDUtG6zy7dlJyss1kur8nobcMwp/Vipcus/q+kGvxDlWNqorD+rm1
 OwxaNyhNR8Sbs9QcPH0DL7lF3ShQubjuNK7crUsZgg8P+rEu4Gc48C+GI65wTTAprhwj83bePzE
 lkf1E++9yLDgcq/yKUTkCF2r84oABvQDiEFiHFxKW6lzrUdDAqx+YLIEbnZoDjnfg3omlEikKEQ
 Sq2m53bls+5srWw==
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

