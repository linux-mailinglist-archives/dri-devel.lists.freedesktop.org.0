Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A827757A977
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 23:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E367112882;
	Tue, 19 Jul 2022 21:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B4611253C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 21:52:08 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id 125so12957808iou.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 14:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mroLFifN0SuvCBf9OxTLXerBEW1pjfpPjFqUEPZmNrg=;
 b=FdWHOuzrRd3H0BM7NBLLbTk41we8ylTl0yozWWzXZrSjNp77NHTggrPbBzFUuZrui9
 O7Td3KNkiM7N94T1ZujU4mpzXPqzpk68/PgeIIJcZqAUno7pDqwUIDzGuIuPQSFXpesW
 qCgPzK1Bxfpe25fZWQE59SivCWUUCGu4oYwjiYX1IAvUG2P2ihmNkI/qE2r/EWeyej0O
 M+5F1VC9UDPf4aJ1Hys5csQwBTqllo08FdpzDeIlrjb0aP26g1ElNgK0od/8xXOSJ5cu
 er2Z7eGQKYFmVbUnIDx9tyLR59BFH57seUe+xRmkMCVmu4yfTpUh9NdlM/4a35eao9gi
 FXYw==
X-Gm-Message-State: AJIora+DE4XtA2Qb1JNpgEemCJFbHF0cscJb2Hywgf8U4jzE5fuNq9D6
 o6y9zoIYRisDu1H09//RlQ==
X-Google-Smtp-Source: AGRyM1svemBsZn7xTQKlMXN78k/BH2idVDolBBdErL1IzE+EV4rpEff56gul9pMR648c2f8r4nQESQ==
X-Received: by 2002:a05:6638:22c9:b0:341:56cf:c447 with SMTP id
 j9-20020a05663822c900b0034156cfc447mr9866603jat.244.1658267527990; 
 Tue, 19 Jul 2022 14:52:07 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id
 w7-20020a92d2c7000000b002dd0b0adee1sm95770ilg.24.2022.07.19.14.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 14:52:07 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Robert Chiras <robert.chiras@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: panel: raydium,
 rm67191: Add missing type to 'video-mode'
Date: Tue, 19 Jul 2022 15:52:01 -0600
Message-Id: <20220719215201.1877997-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'video-mode' is missing a type definition and is not a common property. The
type is 'uint32'.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/raydium,rm67191.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
index 617aa8c8c03a..d62fd692bf10 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
@@ -38,6 +38,7 @@ properties:
       0 - burst-mode
       1 - non-burst with sync event
       2 - non-burst with sync pulse
+    $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2]
 
 required:
-- 
2.34.1

