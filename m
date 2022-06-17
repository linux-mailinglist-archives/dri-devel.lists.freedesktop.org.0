Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D08654F1E7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7703111A9F4;
	Fri, 17 Jun 2022 07:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC6911A9EE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:27:35 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kq6so7083706ejb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 00:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RkyY1zQc+wkSzumHL/lljaTT+2/4ZERv1EN4Z7asU2w=;
 b=xERG2VxM4tcRxozPKAOVE49PUr0ZVUhCJHIGIY8BjQGk16LdIwHM+gIw5vQolLskpA
 JeM396Ryxfx+qwBxi9Geuw5JWz+A/HKj1fLrxGfnvc7PtBrIrFDD5PXTiGmC4ARJANQr
 DCKlus8fiBeKfsjDZNWOJX6XG6My5D8QsQ+xFiwSb+3sx6kDZ59nQuz+6a0AdsEgcXAJ
 h5ns4pFg7UtkY0x4MyaiAyMjXv/U6e1BDiQFGRTcd8639EL9e87Mb0yyUA5LXKBygaZU
 Q2ywaRXOvyifokRlRYhavFhFVx+p8w7n51fQTi11aJYwhCn7GK3gepLsJcEbSERzuse6
 jPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RkyY1zQc+wkSzumHL/lljaTT+2/4ZERv1EN4Z7asU2w=;
 b=76kEUmxTu9b1/qOs0Co/7VxcDdHet2CW7jZQZnmjZ2sYtJ6KRMjTmOlvCOKVZyzEf5
 HGkDkAmgI+j2PlKb+6wMnQKiu+/k0n7BDTD94GciPH+7OgpJwKbw/YL0No2YdWddApqE
 iwYt/JBEUpKpQP+I6aoJFqmnTWgR81yH4FlQzXDgYRUtEmGdYPUsc/vjYBDLxQ8/HDw5
 FOORsdVZQK8PAx0AOLgV3bIXXKpjSeaF2wcFuVudLFK+x1PKY+j1yd4ekyvbNj/4eVL9
 WVELLw808L6W/6056fv2bHlqR33e3LE8LfthgI4q2VwresmZSHpF5JkNn5HM2QxvZYxw
 ycIw==
X-Gm-Message-State: AJIora+7pnwRLsPDbjlS+/zn5MleUVpwg7t7QMXoRYSv6Q1AZuOSOZcq
 TI8YGOcJAmSMXMqxbeBxVgXWMavP/jWNMg==
X-Google-Smtp-Source: AGRyM1skuitnOMjblYlPNwwdPN/hYdQiT4LHsSWSQTM/yaG4ViqU+Z/1sy7nX1EYlZS7F7oG10IIng==
X-Received: by 2002:a17:906:33db:b0:70f:12c0:4ade with SMTP id
 w27-20020a17090633db00b0070f12c04ademr7911034eja.320.1655450853755; 
 Fri, 17 Jun 2022 00:27:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170906840900b006fec56a80a8sm1762556ejx.115.2022.06.17.00.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 00:27:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org
Subject: [PATCH v3 2/6] dt-bindings: display: meson-vpu: add third DPI output
 port
Date: Fri, 17 Jun 2022 09:27:19 +0200
Message-Id: <20220617072723.1742668-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617072723.1742668-1-narmstrong@baylibre.com>
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; h=from:subject;
 bh=LQlD6Fu3ObIBtey05krAjcgHoTrbx+0w6dwgfJGEYig=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBirCyrycIYT5c95AzVhdINNgW+nDNvrU5WWX82Nd9Z
 I9hXFSuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYqwsqwAKCRB33NvayMhJ0aBmEA
 CiyTyjR1VeKCUk6d+hM4cmyr5iuMn3U9gb5MpoCunBiqjrakoFPCMcqSVEpcqPA9x7IhaB9XJmrKwR
 VvYXEmIfNtFf8kUDsbbpwa1oisLAvbEw+kklacItIJ3nK2t4tLTljpQFeYgY5ZVENj0c1c49WX9GOq
 Q8imHKf+JzBRX+SmfOZnGnFS4GD4SqVl+Em+YSzIao68s9VyFxA+RNCv5Jblh2fB6nhJGO9DGsEvo0
 NdzdM1DAwftoaVumZefuwzVpZ3stCQe8eiOLa5477MQAyrcIYm2j9dgm6iCnLQxiS5jNhhbtD6j6r0
 56zOHNOzd5PIzl7nR2VPluzEs2dwqPg6hCSOfGqDnIxwB7n2pQfwYPTLkAz+TkHFcuLhgrLGV6snPV
 E2o7RT06OLYigLDikb31GoAF45yQKYiukBnrK51shwdGIxMywmtb1mYNIaR/Y1MPNm2hkkwAtBSzN7
 hWS0VQGvG9tzqWm2fCA+qmyFUk8N2yw2hQ2eVaDkta1Un02Guw07WQl08yh8wrYqMQL/3d6cdBhkuP
 iEyXEGeZ63MpTInEfh+Q163dd3ujrp9JZ1GIqcr5WvjKA9rL0Br5k2NiSOSfKXyPZS9KxUglN5pR+A
 o2s6Pg0aBIL/dlFyVeSIvp4Y07nhY3rhAopdbKNM3mBVm6pXsNOBVI2gjnEQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add third port corresponding to the ENCL DPI encoder used to connect
to DSI or LVDS transceivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 047fd69e0377..fdb42b14a099 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -96,6 +96,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the DPI port node (e.g. DSI or LVDS transceiver).
+
   "#address-cells":
     const: 1
 
-- 
2.25.1

