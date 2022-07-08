Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E4656C165
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08BD10EAD7;
	Fri,  8 Jul 2022 20:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89E010EAEC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657313661; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDom/uPmSe9UiwdDAFbjIzOeDiIX+x98YrGKZn/GFRU=;
 b=EgWJ4HV/Vkvqm0qcPZ2jWu76bMes33ds1tI2iDm/nRa7H2hSqoLtMVAx8K0OhK6xMSWZ3C
 NYjnchaPA1lYy3L3u4LKXf1Pvk+B4EK9xrE2B+ATt3svos+IMkbXRcl7HbWbbY21vaNRoI
 BBCvfG0prmzbmpcc/PLhMkrBaM4j1S8=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/6] dt-bindings/display: ingenic: Add compatible string for
 the JZ4760(B)
Date: Fri,  8 Jul 2022 21:54:01 +0100
Message-Id: <20220708205406.96473-2-paul@crapouillou.net>
In-Reply-To: <20220708205406.96473-1-paul@crapouillou.net>
References: <20220708205406.96473-1-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible strings for the LCD controllers found in the JZ4760 and
JZ4760B SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/display/ingenic,lcd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
index 0049010b37ca..c0bb02fb49f4 100644
--- a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
+++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
@@ -17,6 +17,8 @@ properties:
     enum:
       - ingenic,jz4740-lcd
       - ingenic,jz4725b-lcd
+      - ingenic,jz4760-lcd
+      - ingenic,jz4760b-lcd
       - ingenic,jz4770-lcd
       - ingenic,jz4780-lcd
 
-- 
2.35.1

