Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC70A40AD2
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 18:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C8F10E15C;
	Sat, 22 Feb 2025 17:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="rPANDz/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AA810E0E5
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1740247093; bh=9sTFrUSIaXiC/a6HGkCf0NeCEy/CQy9eg6+/LWUf/z8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=rPANDz/Zm8jng4H/W+oPivhEMXhURPJFwhlrEj8nsH7ytl/ujiS9g1OJ/rpNBs+3P
 6VcXuRq9dO9qn0FmiAlKFgZfHd1/dBVvTIyrRcwlOvPIN1+8W6z5Yf1w2pNDQusjaf
 NaIy4cxBYYXeXHX+XVrCrnexUOPMuYTi11R4j4y4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 22 Feb 2025 18:58:04 +0100
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN
 Optronics Technology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-fp3-display-v1-1-ccd812e16952@lucaweiss.eu>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
In-Reply-To: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
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
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=9sTFrUSIaXiC/a6HGkCf0NeCEy/CQy9eg6+/LWUf/z8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnuhAxesS9PiufpYIyX/I5BSN7vk1/Peq4qz5G/
 ABsZE+5SXKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7oQMQAKCRBy2EO4nU3X
 Vp88D/993hkFvRFps1P7B05YZ/phVscPfzFqCsKij6rNOTddUvz2pIXPoEB/iAyU5usR71Kemlq
 aBC9yES5supye5j+I8mn6TRqu1gJl0Y4pNEtaWosK8xa3LH3JP4FwYzfOvjhZ6Q9xqdv6QCGTNL
 EOp46kViSbkNJBSOiZfZlv/I1OkHA0JzncLMKzFgTkHBk0DAKWzE8Ku6WMtZJUzXi2AYatkgB/o
 zx7/fpyXTNSrAMH6QDIUSepckZtNRAEyetYG0zukFLZBzCjewbOIEtVqa0UeluFJMnwi+l2maSB
 wCwYlPiYJTZkPNmN/mcrtxEqEIomabJtz86WfLt+KazfSIXUrwCSq5vBxNIr6qgnD7bU0kWBM2n
 A+Bl3n09Ac29hR3M+sOcRoXxJvX0a+gTl4Nn/gr6Q10fizhcYJx4EKFjR9jTo7czgLGV+H0aKvN
 fKCyDxdfzkouC1ytogG3t69V8aqAFpO2097tPXkH4b/uPbX/pCL8/bL3e0+gQ6VyLrj6ckVyDAZ
 5R89Z4a4LeYFRwUqAuPkaXAqV2SmCKGDcLi51+h4raz1w60Xxu0NxodV61Yo8ywZ12nIgDWE2tN
 ysfd2SFJUqKPiblV5WznqaTxTU2J/R0/FgObCQ4+i2ceswF6dfLr4c/3C5t1to0esXoinfjTfz1
 4HulOWWqhrRlmbg==
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

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c76830a520594a69bd6a2e0231df0d..ee2dca4f372263c7a79ea17f4a9411939bd0531a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -390,6 +390,8 @@ patternProperties:
     description: Diodes, Inc.
   "^dioo,.*":
     description: Dioo Microcircuit Co., Ltd
+  "^djn,.*":
+    description: Shenzhen DJN Optronics Technology Co., Ltd
   "^dlc,.*":
     description: DLC Display Co., Ltd.
   "^dlg,.*":

-- 
2.48.1

