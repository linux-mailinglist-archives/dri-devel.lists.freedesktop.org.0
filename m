Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473572EC96
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 22:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E66310E3DF;
	Tue, 13 Jun 2023 20:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1D710E3DF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 20:11:23 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3406c8e921fso2942115ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 13:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686687082; x=1689279082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zMVh+zJOgPqDKyoOp2YotBxKUzQ/IGweQ3mdvJwSkLQ=;
 b=K016iL9kq3jggm5+jLFwf0YuhDQG+0798+NzNl/W1Bb+GylST09hGOomS5Rs75uLXY
 TMbacEvOQYVzG35r9fX/Clk8mJPHzrhJgezzOWwwnDdKMUEdYqn3HZRxIeGS1vi3UOaE
 3ZisJUKbhagn7WEueeDWp0lXzlKVhtGQB/OrqlDS2cdA6vHRPwd2lkDxUG9Hi12UanLR
 /LjdRu8/AR7HNZ0Mi4TuNL8NksekzHJfR34yvJOY8yygb0fGjsA7KhIIiX5B38rEaXmr
 70BVj0CYGF09GrwsDNo6tC6f2NTH4RpilMXp7dmEQwVcQc1DeLuwaYqjz1xFYgT63AG5
 bQow==
X-Gm-Message-State: AC+VfDzZVNWesHRKs7/zFCXJCnJDO+lSV7n4JfYlxwX2q+LnL1Npr8fi
 NsPkPAcjuk2B5WrC3mZAVQ==
X-Google-Smtp-Source: ACHHUZ7trQEUyTsH2/4qCfXy9q8VWFel7Oj5LuNBTzxv4rqOJqvR46PwWVrn/5foWVVIHRbL3zU2DQ==
X-Received: by 2002:a05:6e02:12e2:b0:334:fa57:e670 with SMTP id
 l2-20020a056e0212e200b00334fa57e670mr12729137iln.0.1686687082081; 
 Tue, 13 Jun 2023 13:11:22 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a92c809000000b00313ca4be5e1sm4102979iln.12.2023.06.13.13.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:11:21 -0700 (PDT)
Received: (nullmailer pid 2824760 invoked by uid 1000);
 Tue, 13 Jun 2023 20:11:19 -0000
From: Rob Herring <robh@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Subject: [PATCH] dt-bindings: display: Add missing property types
Date: Tue, 13 Jun 2023 14:11:14 -0600
Message-Id: <20230613201114.2824626-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of display bridge properties are missing a type definition. Add
the types to them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/bridge/analogix,dp.yaml          | 1 +
 .../devicetree/bindings/display/bridge/nxp,tda998x.yaml          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
index c9b06885cc63..62f0521b0924 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
@@ -26,6 +26,7 @@ properties:
     const: dp
 
   force-hpd:
+    type: boolean
     description:
       Indicate driver need force hpd when hpd detect failed, this
       is used for some eDP screen which don not have a hpd signal.
diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
index c4bf54397473..21d995f29a1e 100644
--- a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
@@ -20,6 +20,7 @@ properties:
     maxItems: 1
 
   video-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32
     default: 0x230145
     maximum: 0xffffff
     description:
-- 
2.39.2

