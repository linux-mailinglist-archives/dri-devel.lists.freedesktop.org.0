Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BF3785265
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C3410E3E0;
	Wed, 23 Aug 2023 08:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C7D10E3E0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 08:11:11 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so13086788a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 01:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692778269; x=1693383069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hWIUEdPk1CVzeFNa/lTLBisRtZ9LdCr03S42AI/HH6I=;
 b=jamh73z7UBix+rO6bWvxGUVSkOZJJKD1UJSMn8ibtA0Rv3csHU/EiiYHzEWM3DbehD
 A8imp5eCC/FPuwrG0+lT6rYyQjySYw5kRBS34ZabyJ0Tp0YULxN6hsPXYvG9jkBO9NiW
 6inOy+xUYdutuCWJVS6AxqWKBTzDKTK5U+PjToviW6AEUVpdHunm6spFG522c8Ojs0+h
 HDIkTNR/IROwNe+XgG6VvRipQC9YyfhQ3Rxd7bd+5CYDfthVkTQvHI+JyYuWxZiuCJFf
 STckr3JMIbffr6zCQsSXK4INDZddvVGRaUpWmzwdmkDBwJwhrJTBp6qnVbQnf2mhwtL4
 wr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692778269; x=1693383069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hWIUEdPk1CVzeFNa/lTLBisRtZ9LdCr03S42AI/HH6I=;
 b=Y/0QizPfDVlbSE0sgijwjdf0tpVSg2bey/dogJv16EFljE7KcwfVUZs1x01iTaYsTX
 9CawkJXVjBANpjSx88PcsVJsq09fD3ogA/f78n+eaFKhSuX321QHVt+jAp2Z+CEqJnMg
 h0Z46mdUsg8XOGngdlv5gDHyjeOO5R2EnWHl+uAzzVFMfvDDqUkMQab32YSGEhLfjVUn
 rtJqO5LrB4a6GtY/0xGqQV7dH7b2J51BkO9kF25HkdpLDNbQTg9TOZ6brGFDgalRs3aE
 VEyycPPCAIktCRAvjMoPXKA56MR2GkXHF9MH3yXX8FJ/nbPpcagaGAJFlO1FN3y50oYb
 1zZA==
X-Gm-Message-State: AOJu0YxxRpW0WVQEQfFeh3GaI5ZI1Qekmj9Fg2qLV13vSmZDJbJJmB7y
 hn2GYzLQ3VAVuqTZWvbwbnFe8w==
X-Google-Smtp-Source: AGHT+IEPD1TV4eNUhdP63rhi8ljL5x6yk1Pd63+tV3rbw5htu/bhzg7Z3DlE3MJYIEBz7wcQVcTzYQ==
X-Received: by 2002:aa7:cf09:0:b0:523:37f0:2d12 with SMTP id
 a9-20020aa7cf09000000b0052337f02d12mr13737560edy.17.1692778269622; 
 Wed, 23 Aug 2023 01:11:09 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198]) by smtp.gmail.com with ESMTPSA id
 f11-20020aa7d84b000000b005257f2c057fsm8925329eds.33.2023.08.23.01.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 01:11:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: advantech,
 idk-2121wr: reference common panel
Date: Wed, 23 Aug 2023 10:11:07 +0200
Message-Id: <20230823081107.82967-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Reference common panel bindings to bring descriptions of common fields
like panel-timing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/advantech,idk-2121wr.yaml           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
index 67682fe77f10..2e8dbdb5a3d5 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
@@ -19,6 +19,9 @@ description: |
   second port, therefore the ports must be marked accordingly (with either
   dual-lvds-odd-pixels or dual-lvds-even-pixels).
 
+allOf:
+  - $ref: panel-common.yaml#
+
 properties:
   compatible:
     items:
-- 
2.34.1

