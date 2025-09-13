Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC929B562B4
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 21:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEE910E1B4;
	Sat, 13 Sep 2025 19:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L5Z2E37w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B25B10E1A8
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 19:19:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D9F2C44FAC;
 Sat, 13 Sep 2025 19:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0F5DC4CEFF;
 Sat, 13 Sep 2025 19:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757791191;
 bh=GqkoZ7KBwzs7dRpuLzIvS/Z61jcctzBt4EJ6Zi6zhmc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=L5Z2E37woXfN3bjSp3w0H6wMYr6Opo7pCqy70FBz6TrYIXVfXSNZwrTo4faP8Boli
 QV1YyF4LY4RMfbGZGsADpP808f+8BZ8cvUJCXadgNjSqQghaeFe++SbzGscfYRaE4c
 EXplkfcvDTfXP7pO4XRSb6n3CCXUNeoEUrQr6YY88Ln3P+gRTN7CHIJzghrk4e1cpm
 dMLFaSJzVZihCAOFsMYakAYa9FRVvGPBEM+sQOzRPKRhoAtNRpiRXb9wXsSO1vnbbb
 dp1Nqji5g/+/hCORgtfQGe8M3N3aceaGBbT7avppvHHgGgGRQVolNMVnGSn1X6clMa
 WqhZl5rInaLMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 99699CAC594;
 Sat, 13 Sep 2025 19:19:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 13 Sep 2025 21:19:49 +0200
Subject: [PATCH v6 3/3] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nt35596s-v6-3-b5deb05e04af@ixit.cz>
References: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
In-Reply-To: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Molly Sophia <mollysophia379@gmail.com>, 
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=lFoP3Jmjexe60vWrVFSdH2SLqrIeKo/VFBht7BKKVLc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoxcPWenKVF1BK8oEurKoF2JGZ9fs17xjEBq+ad
 nLmW22lVKGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaMXD1gAKCRBgAj/E00kg
 ckPSD/0apPokMVlQ7NkcKcqNNKRt7eEHs4tDWTXJIK7FXwLs0StRKtIg70lfdXdy3JCMhEOogEM
 OMZXA3Cyts0ez2Jg392TkgFk6P7Xaux4ia8v/1LzS/ckjqNRgQtbdHiAlXkCtcm0PnO+mTlUBUX
 PQPuJx8kSnYnKv4TDWRKKj1KpV2ACOPAYaaaY9wC60D6EgIrq6Qt/97jZPNRptlZpjNLmGD8B0f
 hn+U1OAGucge0s1O/z/xMyFpEwL8P5T26vfykwxuzmaaGw3qFNELC+WPmiH80ZljZtzHTy3UGi+
 4sWruE8Y5JO2xrLCzSKffjyJ1ciBageAJudf8bC6MUsTkojpnnY0hhKuNAynL6Z0LltT7iZe/S4
 u63Uwb4yeiVMIsb1ireT1O7a8PxFzgYcPIJcSYhwMnMZA/abeIE5PU7gzBrvg0eoYdbN37fs8We
 lZSBaQ+sLKgO+VQfW4kB2Df3E2AFWC+oU5SweY3XDkpY9s95i7u4Drs0YTVLQDG4qCcegLj/e7b
 wAk3pvbSFdulrYISf1p84hyXwbHT+rcQwpUgqZ3Dltmrvb8sfrMx4lmrjm8Y0kGw/kOJwMQN/tY
 pAck29CBBWV4/MygzCDUUXUET2qFzxBIs9iJy9MwFFBecpVDS5UK0190SMaLOmqDS4jtZlgLpWx
 uiJR9/I7KgdKqFg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Molly Sophia <mollysophia379@gmail.com>

Add documentation for "novatek,nt35596s" panel.

Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/novatek,nt36672a.yaml    | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index 800a2f0a4dad98954ef60c3bb04d8eb2243cae7a..d7036ab46382f7b6200cc263ba7e93856386919f 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -20,14 +20,21 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - tianma,fhd-video
-      - const: novatek,nt36672a
+    oneOf:
+      - items:
+          - enum:
+              - jdi,fhd-nt35596s
+          - const: novatek,nt35596s
+
+      - items:
+          - enum:
+              - tianma,fhd-video
+          - const: novatek,nt36672a
+
     description: This indicates the panel manufacturer of the panel that is
-      in turn using the NT36672A panel driver. This compatible string
-      determines how the NT36672A panel driver is configured for the indicated
-      panel. The novatek,nt36672a compatible shall always be provided as a fallback.
+      in turn using the NT36672A or the NT35596S panel driver. This compatible
+      string determines how the panel driver is configured for the indicated
+      panel.
 
   reg:
     maxItems: 1

-- 
2.51.0


