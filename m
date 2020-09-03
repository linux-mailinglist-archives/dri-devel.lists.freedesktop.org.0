Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C87125D1F9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59C96EAAE;
	Fri,  4 Sep 2020 07:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27C36E199
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:01:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 11CC8B36;
 Thu,  3 Sep 2020 04:01:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=pCHRyt9pwiHm9
 P1dZVZ3m42DEt9fo9/daatGBaOfPPw=; b=ebE9PrQaXt5uVlHUvqoOSv6/HH6a3
 UpQG5rZNZ5koOHeJKM7hcKLZYw72BDPzLfAiyeSEgi9jn6hmM2KCwjx3re5KkF1G
 4ATb6kzut3LH1g9VSInhDGP5ucEchziIW+Y+XIOI+6mQGD4+XEeBQWgxBIS18BH/
 uCDSBfsTiOCN50j2Iwekliu1+KCoauDScrpfJ81IRh4wOLjBkq7NVUHOr9vIfOd1
 42ThgZq5GrbKNWAzAFsb1YjCDSoY3RQvfhHJpj+xYLAvOS0ce1pyAG/aq83cL6PO
 RKcta0oh/v5YUCJliNdDbjsYR7XaWZ+eezmE/Q1QwZtZwJQKRG+38ub0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=pCHRyt9pwiHm9P1dZVZ3m42DEt9fo9/daatGBaOfPPw=; b=NCGGHfLa
 KT9a/9dEdb9XuoKGQ+RtMvbipYCHa8hkc2059hUOUnZFpUTHXR56OrYn8sE023y4
 4Qwp1UcMYwr5/b3Wg6YeY+mdi1Q3tlliphU1QCfQxrTk7HDQWfV4PGtf23SigTN4
 O2/IXITmrpLXP4MfPfYj+4B9MCF/fN+YbLCudrnbs6V8hhuci7tZIQX5J6+Mo2ca
 a8jIon84qHTIptRR8Yvge3P2NTD6FaJ8EjaHlSYoo3q7f1ijSUeVDdlTOHZjv+gY
 bPj7GegiFcyu2X/Xg63MPEIHYtuqST4wBwS7KWVs9AK4xhVwEhqlahYkMYGokD1L
 rNI04rZLOBDOWw==
X-ME-Sender: <xms:9KJQX7UXIds2bWmEj_g1vBwl1QYWmeg7gHYR97tn4YI_lkqazoyyig>
 <xme:9KJQXznSNSGP2RiOfk0wR_rLqJSMGuyAFU5SRYLSYNpzK7iztUZmrmnhj6bLesfVY
 CAmleWd4PlWlaZZiY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9KJQX3YQtrCpvn3BLsbCQbvdBvCc0eq_slopomHYKq0vpPT6J3F_rA>
 <xmx:9KJQX2Vy-pVjHhQVgSdQj0JNY4jWj0ki806pUEU2kq7N2JVjOnFkiw>
 <xmx:9KJQX1k3ySUJ63DTmT-GYhMW-BqoO9DdEdY9RB0py3XmxEBW3vDfhg>
 <xmx:9KJQX7dxau8A-oa7FZWM3ikdhySO44APyJ_vqPab82w3HO8pw1jggF3E2vU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D90713060062;
 Thu,  3 Sep 2020 04:01:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 01/80] dt-bindings: display: Add support for the BCM2711 HVS
Date: Thu,  3 Sep 2020 10:00:33 +0200
Message-Id: <a6b4c9ee03bc8f950adc6c493db70cd540c2f902.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS found in the BCM2711 is slightly different from the previous
generations, let's add a compatible for it.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 18 ++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index 02410f8d6d49..e826ab0adb75 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm2835-hvs
+    enum:
+      - brcm,bcm2711-hvs
+      - brcm,bcm2835-hvs
 
   reg:
     maxItems: 1
@@ -19,6 +21,10 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+    description: Core Clock
+
 required:
   - compatible
   - reg
@@ -26,6 +32,16 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: brcm,bcm2711-hvs"
+
+then:
+  required:
+    - clocks
+
 examples:
   - |
     hvs@7e400000 {
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
