Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FEF8FE069
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 10:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF84F10E170;
	Thu,  6 Jun 2024 08:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=norik.com header.i=@norik.com header.b="KbXP3xbe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854CB10E170
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7s68vawvM88MOkUXWMwzFJ3k8tEB3l1beOIvsHYWJZ8=; b=KbXP3xbe6ra38k9I5QUoTbaYWy
 CIvr/HcJvbyDM4O+SXH19IrbxSStcoFiRHvdwCHCgMSCxr2q5hdWVcnqYNidTIRV9894RNRF4jNHk
 2gZTWVWDtzJJN1vWTz+ylrwWUxXc3dh9LWIag89j6GPjwDXV/GTOkF5BRhrUApZ2TXM0g7CVpiQpe
 uNu8q+mLNzPKoBpNt7NJ68IvAzvF+mMt667Srdw4J9ITPAa9K0khq5NrTsyu2LRhR/irvOdlJgURB
 sAa2cSOLdADuj9MhEdPKIpXkC1eLhzRcJgzXPYRkglCbAY2tf02ce7LMk9jHn8rKWB8mKacW3T6LL
 fYuKS9CA==;
Received: from [89.212.21.243] (port=51044 helo=localhost.localdomain)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <primoz.fiser@norik.com>) id 1sF83W-00BWkF-2t;
 Thu, 06 Jun 2024 10:01:06 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add PrimeView
Date: Thu,  6 Jun 2024 10:01:02 +0200
Message-Id: <20240606080104.3663355-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

The Prime View International (PVI) is a LCD panel manufacturer.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- fix subject line
- sort alphabetically

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1..69cedce51628 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1160,6 +1160,8 @@ patternProperties:
     description: PowerVR (deprecated, use img)
   "^powkiddy,.*":
     description: Powkiddy
+  "^primeview,.*":
+    description: Prime View International (PVI)
   "^primux,.*":
     description: Primux Trading, S.L.
   "^probox2,.*":
-- 
2.25.1

