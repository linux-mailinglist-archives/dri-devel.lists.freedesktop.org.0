Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E280B98E
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 08:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52F210E211;
	Sun, 10 Dec 2023 07:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E739D10E1D4
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 07:05:08 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1702191471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWSmhh5P2uhE91HAC/pqo9SELupeJYa3dTRg+Hi3E+g=;
 b=rgOIMX8qe4KZq0KHz2stTn3MhD9DVO3FpleFKuoaGzNqBCsnVk8FxDzsEqF1aUUwPCpU5B
 ByDSiio/MI4Wz9yhifoSGh3Lz0ito+pXkUCbhIpf5RO9h19wmlBFj9vQyMte5uwEE2fuVv
 7vdsBkSVL+T/6ubArKr3NZbgmsGS65nWWMLlYErQIWvXYQuIfjEkkswPnk0ZOU81uZwzHZ
 SxizJIUJCWSdEdNxaGN472+mF4FFSdXNkD2znWwOjtMGwb5nUvcuQ8XlWHLGKvzAS9mO2N
 +Kq9CXA2nXnXRN+DgRSSdVeaag/8W14Z1PN58GBOSRGP+ZasUYiQKJ8fmhoRAA==
From: John Watts <contact@jookia.org>
Date: Sun, 10 Dec 2023 17:55:54 +1100
Subject: [PATCH RFC v5 6/7] dt-bindings: vendor-prefixes: Add fascontek
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231210-fs035vg158-v5-6-d75adc75571f@jookia.org>
References: <20231210-fs035vg158-v5-0-d75adc75571f@jookia.org>
In-Reply-To: <20231210-fs035vg158-v5-0-d75adc75571f@jookia.org>
To: dri-devel@lists.freedesktop.org
X-Migadu-Flow: FLOW_OUT
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
 Conor Dooley <conor+dt@kernel.org>, John Watts <contact@jookia.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fascontek manufactures LCD panels such as the FS035VG158.

Signed-off-by: John Watts <contact@jookia.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6c3389eceede..8666f49574fb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -474,6 +474,8 @@ patternProperties:
     description: Fairphone B.V.
   "^faraday,.*":
     description: Faraday Technology Corporation
+  "^fascontek,.*":
+    description: Fascontek
   "^fastrax,.*":
     description: Fastrax Oy
   "^fcs,.*":

-- 
2.43.0

