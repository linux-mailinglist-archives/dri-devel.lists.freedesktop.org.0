Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6497AD210
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4B610E204;
	Mon, 25 Sep 2023 07:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-190.mta0.migadu.com (out-190.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::be])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3411010E14C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 02:11:55 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695607913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gv+uafqaxdaZgt/RSDYyi9C7m8D3DymG7MRuMChltow=;
 b=YWs5pGYMd+dRD8Qyiiih1AuF22KRu13DKM6DqbOM/k+3M8Sc8qCYwFYNjYxs08l3KUzxGK
 FOx/Nrh51hSfPbukJYr7xS9hE0iErhScAWcUawXkT/4YZoHOLpVHJtSffcn6GblyApb0y6
 JsHNCtsE1YDhOaDBaRzt1V1eRufeTaQBkD1+eqkYUtht8hp3CuQJzU6KrD3J+yx4hB/kDe
 iV0aoRe1ijsv69Hs8YZNWnVu+2W/EVnxuAQ9V4dJgg269KaY1tz0Zi8GItF/XIzSg60Pol
 z95GCuDMRzygBOD4ODNM8TeiX2v6j4NZv5plr0+Cr4WhZt9vyncRYZvuOCzlfg==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 6/7] dt-bindings: vendor-prefixes: Add fascontek
Date: Mon, 25 Sep 2023 12:10:57 +1000
Message-ID: <20230925021059.451019-7-contact@jookia.org>
In-Reply-To: <20230925021059.451019-1-contact@jookia.org>
References: <20230925021059.451019-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 25 Sep 2023 07:43:28 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 John Watts <contact@jookia.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fascontek manufactures LCD panels such as the FS035VG158.

Signed-off-by: John Watts <contact@jookia.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 565b13fb429d..744317e2a7cb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -468,6 +468,8 @@ patternProperties:
     description: Fairphone B.V.
   "^faraday,.*":
     description: Faraday Technology Corporation
+  "^fascontek,.*":
+    description: Fascontek
   "^fastrax,.*":
     description: Fastrax Oy
   "^fcs,.*":
-- 
2.42.0

