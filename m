Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02769AB882
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 23:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D486210E233;
	Tue, 22 Oct 2024 21:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="Z6YXdbNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic304-23.consmr.mail.ir2.yahoo.com
 (sonic304-23.consmr.mail.ir2.yahoo.com [77.238.179.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E09B10E225
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729632825; bh=d3PSEJTlHbO4B5aoyFLEaPY5Crw8mhVYCvAnnHlRSn8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Z6YXdbNqUb2wj0clYXrSl6IQWIEMdgTZN2rWEiJEKJEq69+Q3S3eoQEpAgsPRa3XzeTF6dI3hxcQ/c5jKtaZAYGwCyLHk4XngXC2sZFgDVV/ScWvY/OIkfc5nQp2C8uS4Em2g43GgEPMLgk+HGdwxd+zwka83lRtIM3hwhERyA5YflQQnrBzSa9FxKNegGZ5mDqB4raghy7bRgfGKwRFJxjLUN4EYdJWBWcU4nCblx7wCatPvtVuFeD8wp/e0N/ZRT1TGlNzR3wgmINYr0Xor3qFFNtdrsSx6R/2zlL1XKCOS/dktu7KmYiFD7wNXu5DtheUucDfvXOkWnReyXMm0Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729632825; bh=OdncCgM/6kC0IYV5KHOncg9HN5JrhBIkwb+Ru/IT760=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=hnt4CGwvxoPw1Tbt2BRQvx34xODS1I+zfsSvYWfL6+mHInhJlo8r+962bQLgQgD0YPHBbaKWyPddqdJD5Gi5WR2Z91NBGenODfIPWRGoyQlc088UbZsuccairehMAX3v/1gFnbBbiELm3ISMQX7UpHas8j84qrHvGZZqLhzhie5tr4hTVfPCd2FASaR7YYTI5ywpy8ZkLOK9jxw5zCrBqnXNx4j52mL0fD74WUjBcKdMzcRCfFX8FVjyketF6IFyg2+gGLDy2frY7gb3CwjRqlS9OhOKOIHuIeUwwc44jo4sG6t//yvw1Zgebj04Nw6z0HNdBEVq+BvMMAEdx2myMg==
X-YMail-OSG: GLsio1IVM1mKs4yXXBRW3KPsMmqnPkjezU.SxLtA_aeZLg_qwVKLRv.Z9sWuOgD
 f.0DMgZBiDjtzCe7N7xuvcZYPu1._HK7E8NPUhzHI_Gx0P2f_pgdUsitPeD3.YvXfskm71C20QNy
 C9.N1cM6rPvpIcH3KX6oLS0oS6gh_lInSKTx5fZzk6KSu6CDNdmuB7slHsLaCWjsNCM14p6mNxpd
 wBph03h98eyOrme7_2190WhuqpgxbEFrhrBcOCZZA81cGB.gW_.fvKzbYTYPEKD5NETIji4UaBq.
 dxcdcI3MA5H.sTsqfCYt597zjd53Buh5WrT1chAfo1walXQg88FGw0Cl3BwJgJSmy3EPjcZBu_a.
 BVDDFydACk0NGD78LHeG0YuKonrqaoozGY13oYdqqJxQ7haQC7meOrxeGwxRohOlESLnN3X5xPZ5
 fFwE0z31oTdbnhz..OTrYFqCpY.sFlLSe8ArrcVsJxylc.4yUnuZ51MCudzfTaitXkDzJ7gNu587
 wjgYWUln_xFikPIOWsPzKJFZPOFQGrpyS25z8eHYZsYWjZGh1typ93BqyJ5hfssOO7sISZrChoy5
 rAN4O9Ef6C_dqeR5OML99MYACS6Fha02STpfjlPqOEfuLycBN.b1iQsvUpmHk_1P8Nxglo.nlWkK
 u9hwB..YlayiHwpMdE9J4OUrdPA3RxC1nfrwldn9DUj96bt5Y51p_UuI0Zj1OFaociYnhrkAl5T8
 WKyjpfyQi.QdKuIBsySJtAiJUp9sYIV1VlQjrhXwLscNjcARGe9u4LVb4WfjDQHz1m4LSF8ChVp0
 O77Bq_tOxGyVByFe9P9O9g5dQbxbFR6rQhgTwLjBgKSOm1zeic6PaskKRePtSiHnrJ4nT4jXz8bw
 Ap4lJ_2cHy8t9mSD.nCsb882DpREOQZ3QBRnq7C41Bom5Sxavi0WkLTIdRLAvySidrSKk8UIzs4J
 SEbibKRJC61uA7ODQDFUvuuk.aRUNS6ewMsgj3Vsmmzirp1vWGJtBe0yQxPtWSp4hGPdIvKTzahu
 JgHbJFjySFb6De6U3Fn2AHscW6x7oUg6tVpmLCm3uTvQtnssRDydegBRtHRP1CEBMpu.OFePuuEq
 1EPf_gcSuPfrwtb8RdT2oBJyDVI3FKzyBFbKnHV9nfluIFTHchmq24Rfil4ZCEKyKUHjTsr5UHsZ
 MkzA5P0Xx1biiPh0ad8U00RW.97UiuwvgjVuk9P0UFQgM1QMTTQ3AEwuAEoAnzz2L_iKm0Eut3LN
 jRho02w5SaGMfobXL1nc95g9ye01fIkd0YLsvmowwesxpbQUfo2PPHXu3MMotQap1hzgTeHg.NLA
 2jMrSPFsEuTMh06jSDbbevUwRxN00hrf2SWBkjXGuZ8iv2AiRNG1i1wGFxxR4N9QiAqzMshso4oi
 jsTjA7skhMiGKaj1nFIUbd1pu6ONhe6isb.NKjVaMM6BQZNtcSiCd5uR6oOb4o8kH9n3wEcEKJDx
 oQit2IuAxdnGjpRXunx8kVU_Vu_LbLEWlXNiXb9J2ICX8fQWLald3tduLZeB_PAPaN1Z7MHu4_mZ
 21JlmzvPsuxq1qD66r1_mxwNotNZsUizBZip4Bw9TwbQu_Ju58CqEGHQeN20SO5QcBFynxuVkLYS
 SLWMlyIlYw.KiLQHsHhE58_K8dL1wnEDnlczBUKGJpPtGD8gwVaV3tC96dxaz1bWMl1WuUxEswXD
 18wrPe8m2lvTJfs0qGlWY1AkFxbDDp3pWXes.qAKDt70rDzGxIPLKddk7B2fxqnNRJQ265Gzt8Q.
 Z_uS_PI4yww0vo841HJx1CiEE2Y8RYZm4hpNYmcdPhXx4GayOpKQu73jWcx5GkCKfXbA27vdyU2R
 K6lyO7s2BwURIZ4pL3cuUoXqEjz40Q5d4S_ZGANcychzJZvfuAv4L95p0wVOjuWXvv9NI.a7wcK2
 vjPnozKRD5TeyHDxWFCwi9jJu1VczDxVt0_a7YC3AtNKBbnFuXDDe40zRkI5Hh9d25levDDFbDkZ
 bd7ldJv97LJq0NxcoqqPiFRoPG3yjOQqt1AbdUgau6gDWXn.pm_REoVp.ryUY51fW7MTHPBScP0V
 F5QD5jq.Lkv3bhYzH1BSNtTN91tvCrCY7oqvGZfjYxuZBWtPzm1E0w5OINGN5Y0G6khH8Qbqysp8
 8kd2GE32d2jW9Ndr0Y7ynUI.CNkXtbrhPjo2WQiCNNIhPF4lyCmzXguyRjBy4kb_Q1lcQa9OaCXy
 V0MGlUvJMhySUjJ59g1qVFsqI_88An8SxrCVUiOx6tHEuNCT83TNKZ.ju4X58W.nOrt300lK_GUG
 y3HL8Gmd2lO.WI_Q_XUY3I96XHqjPxnSzFbywV2RHk0kY9jMh
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 393e00c1-eac6-48ce-a59e-5499b218adc1
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ir2.yahoo.com with HTTP; Tue, 22 Oct 2024 21:33:45 +0000
Received: by hermes--production-ir2-c694d79d9-qjs6q (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 00a5d0a4af66107c7c1614b6d685cac8; 
 Tue, 22 Oct 2024 21:33:44 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH v2 1/5] dt-bindings: display: panel: Move flip properties to
 panel-common
Date: Tue, 22 Oct 2024 23:33:35 +0200
Message-Id: <18a0d8787b5714633a574f2e15f0cec1addddcfc.1729630039.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1729630039.git.jahau@rocketmail.com>
References: <cover.1729630039.git.jahau@rocketmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flip properties were used by "samsung,s6e8aa0.yaml" only so far. By
introducing "samsung,s6e88a0-ams427ap24.yaml" they become more common.

Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
---
Patch is based on current branch drm-misc-next.
---
 .../bindings/display/panel/panel-common.yaml           |  8 ++++++++
 .../bindings/display/panel/samsung,s6e8aa0.yaml        | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index 0a57a31f4f3d..087415753d60 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -51,6 +51,14 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 90, 180, 270]
 
+  flip-horizontal:
+    description: boolean to flip image horizontally
+    type: boolean
+
+  flip-vertical:
+    description: boolean to flip image vertically
+    type: boolean
+
   # Display Timings
   panel-timing:
     description:
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
index 4601fa460680..19c8cc83db97 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
@@ -21,6 +21,8 @@ properties:
 
   reset-gpios: true
   display-timings: true
+  flip-horizontal: true
+  flip-vertical: true
 
   vdd3-supply:
     description: core voltage supply
@@ -46,14 +48,6 @@ properties:
   panel-height-mm:
     description: physical panel height [mm]
 
-  flip-horizontal:
-    description: boolean to flip image horizontally
-    type: boolean
-
-  flip-vertical:
-    description: boolean to flip image vertically
-    type: boolean
-
 required:
   - compatible
   - reg
-- 
2.39.5

