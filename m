Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308F4A9481D
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 17:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8389B10E117;
	Sun, 20 Apr 2025 15:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="1CcsojpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60A810E117;
 Sun, 20 Apr 2025 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1745161984; bh=23Sj0XCljb+mYzAWL8UrijLOqOqRTWPwSRGWnzpzJHw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=1CcsojpJCDnGJk91DYZvMjaFTTSU95B+WzwEe8jpn0Aaz3uPdMus0z25jL17jVqrK
 WQ7BnG3eqjsNySp8cI/w68QIAsSKc9f9hft4AdwYq+cHBv5dAnQtC4LUCz6FfljgwT
 wKN4LagQGFn+9GIPwqn4U2Zpd6b0fVeVzAiG6E28=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 20 Apr 2025 17:12:43 +0200
Subject: [PATCH v2 1/2] dt-bindings: msm: qcom,mdss: Document interconnect
 paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=23Sj0XCljb+mYzAWL8UrijLOqOqRTWPwSRGWnzpzJHw=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoBQ775dZDQS0PZkDqWJfdxM26an2mV6e8HmrOa
 p9iY2AJGTyJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaAUO+wAKCRBy2EO4nU3X
 VllOD/9m9lPHGpBY+nRbLUtgt+xoLbziHdGM5Wn7itYg/AdMA7FB8nT3arVEwtfYjA89Oj6JkgD
 gUw3p9+dHv5tL7CciUO79i/ngYX0CjwMxUoUSRv4dekodpbTeqY+rLP5BAq6P/gK5Lbm1/ImQo6
 zPa6afvIpCzK42K4aIT+QYI7e4VINPIYWHteLejdHJn98/+bnXMH8OvSP4eM3TRlHG2ZUhhP9nT
 eG2U31WULF3KxRUhtFxh7dHcISdFEGYIHImpe+bX3kKZOjIWmrCvSS3N0HHYN21NTQxyKb0ps3f
 AaAvo61FQ49k8zLRvwdnpV/WRWOgMPYL0c3/DM//YwsuDxGfzVVtty90BtrwpXR0v/ERfWUnJUl
 jwn6Os4d685p/+7WQWIJH28cSI3RHhTplfedhP3F2gX0BvWMxjcKTSVdY2fQq1ryPEzxT0l8ch2
 G9T65fBoZuUeUNvfGYWi3o6p4PgX++Wt6jdiHEOpoprMhZ2wf/aN/nIgdvI/4G3QQv3D1ECt/ER
 qeIwpvPS79/i87++HWQgCD4r/8ERVRb7TWJgo2+ddGY6N96mGlorc/4GngbACFJL3My+mkEryxg
 7hnEjDLNCdk7zDuiIM/IXh5ALHRpkq334VmCT8iZZp+IEaLvvYRVyc1xR15z+yXpquOrVuRfixN
 8M8Vupo12PuxYfg==
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

Document two interconnect paths found on the MDSS on MSM8953.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
There's also some interconnect paths defined in the mdp5 schema, both
drivers accept it. Newer mdss schemas seem to prefer mdp0-mem + cpu-cfg
in the mdss schema instead of in the dpu subnode. Since there's no
cpu-cfg defined with mdp5, I've added these paths here.
---
 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 7c6462caa4428bc284619275e61ddacc26d0c06e..db9c43b20e2a705bcaae4a9e0e11ce13be853b78 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -84,6 +84,18 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+  interconnects:
+    minItems: 1
+    items:
+      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    minItems: 1
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
 required:
   - compatible
   - reg

-- 
2.49.0

