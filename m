Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F878527E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C33910E3EC;
	Wed, 23 Aug 2023 08:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C5110E3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 08:15:15 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99d937b83efso690803466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 01:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692778514; x=1693383314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2I/rcTmF/d9ASGbPY9AUiCj5AxfuxUDm5JR/iDbnII=;
 b=WePlgP/TalC4r5lDsRV0VLnR4Qk2YImVFkCGSjegCbhbDEAsfZ0SPjACzUvrxaIAjJ
 TT3IC2qalX3RCMZ2OcJ6OrIHpubkC4e229lqsML+3hlP5F+oauoLhIzY7amy2tKd2HAi
 OsstpVeextg5zr4jdwwTqp3EcUh3UI592/D2CMyKP4iYk/GOGFwEtvC8wH69tIkShntX
 ozjm+AJUjWJVxa9YVu5p1ubp9tObtl2oUroJAL9woRzegKYCz5OKEeXXZ0w8uT+z4Wd8
 kD3sZStaQIa7rjBbYW974ztUikPa0bTO/qB/Zu3X4FzO+0fTuUAVCV1zNawHPhTL309N
 xkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692778514; x=1693383314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2I/rcTmF/d9ASGbPY9AUiCj5AxfuxUDm5JR/iDbnII=;
 b=UgVvSt3xiqlEU+cY8u9knypkcvPXg7z8vE2jM1U1jzU5eFyzVlS1PvHMIhK5wUXXNq
 eV7ETlPoUVhAox+l2PZsudMwHHgpM2OPDlq3fY717HZOJOkm13t2i0BIBm1bo8p4dd/q
 g9WNAdslYESbXA3tO3Yx0EHOscvLMzbok7WAY3jMp7rip8Luv8AaaxC8b1ut8sl7z1A9
 tflzJWc3wkd3xY++Yn8fiQmlS/bkmT+NB1qpUOr3sMYqTGRP1WTUlqPLi7zzw3Oz0fP0
 D51JO5TDbLduDXnip4v148t1WKEvzHOgP+OZBe/pY19Cb1Ir2Sux+YLp0jE8Ks/36JLU
 Yscw==
X-Gm-Message-State: AOJu0YzW6j6+w7NF040thq2jKRVMRMTBj2nXcgiiiXP7NA1h11j8MS/K
 CfHConSnHTLVSamfMDKKN1cvjQ==
X-Google-Smtp-Source: AGHT+IETjdWV9RFfADLDj5Dy07TdSIAvWrcUOrOhKZnPagMQpfK7z/rBMAjru/IHXBr1oBQ1hT3lCw==
X-Received: by 2002:a17:906:2192:b0:99d:decd:3dde with SMTP id
 18-20020a170906219200b0099ddecd3ddemr8804671eju.18.1692778514041; 
 Wed, 23 Aug 2023 01:15:14 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198]) by smtp.gmail.com with ESMTPSA id
 v18-20020a170906b01200b0098e78ff1a87sm9539730ejy.120.2023.08.23.01.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 01:15:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: display: novatek,nt35950: define ports
Date: Wed, 23 Aug 2023 10:14:59 +0200
Message-Id: <20230823081500.84005-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
References: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel-common schema does not define what "ports" property is, so
bring the definition by referencing the panel-common-dual.yaml. Panels
can be single- or dual-link, thus require only one port@0.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Use panel-common-dual

Changes since v1:
1. Rework to add ports to device schema, not to panel-common.
---
 .../devicetree/bindings/display/panel/novatek,nt35950.yaml     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
index 377a05d48a02..7cac93b20944 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
@@ -19,7 +19,7 @@ description: |
   either bilinear interpolation or pixel duplication.
 
 allOf:
-  - $ref: panel-common.yaml#
+  - $ref: panel-common-dual.yaml#
 
 properties:
   compatible:
@@ -59,6 +59,7 @@ required:
   - avee-supply
   - dvdd-supply
   - vddio-supply
+  - ports
 
 additionalProperties: false
 
-- 
2.34.1

