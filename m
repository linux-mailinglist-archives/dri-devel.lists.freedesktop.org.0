Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D5347C00A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 13:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE3210EDF0;
	Tue, 21 Dec 2021 12:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C422C10EBE3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 12:51:57 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id js9so12255341qvb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 04:51:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CXUVbYOFX+qNt7zC1+Gzh0+PjSFhu0u9+OwdjiLHOzQ=;
 b=pmr3/+ecWGcyp+CuNFg77llvNo9pFITy55LoWs4jsFqKPdK4JeHgUhZ966u1No29B6
 dToOE2FIvrf11YxCHJZmlDwszS3liSPVEAuPKE/dINSKLz6OVS31HUuxHBTV21+LNpeZ
 Prbp/LGIhGRkOpvQR7MP1KC0NihOYQy3XxC/EFKMrbzy6FrXVgqU3S1d7bH7+4Ad5ZTV
 Uq9jvkBiLnkIcRw+4vyOmyPS9t9VwFMbpPaQUtwGYn6n6V1KBnc4swcFgKEmZRZBreGW
 r8BkzYVIcJrhvO8tvHCXe50heOeTPxoMlR8jbuTWJK5AL69ktGPfQMI5rFZkwFy6UF5M
 ixsw==
X-Gm-Message-State: AOAM530/f5eY2me6WA4qE1p3d/YwpglUyOc2XJWgA5qZNGmsPcELsZur
 utUKFxo/XozsH5lF1s263w==
X-Google-Smtp-Source: ABdhPJzo1zRafFgA1Rs/dx78OvoHKnIPrB8GViOOzCeTRGNIK14UPySnci9L369mX/rxt06+xfJBpg==
X-Received: by 2002:a05:6214:20af:: with SMTP id
 15mr2236132qvd.95.1640091116951; 
 Tue, 21 Dec 2021 04:51:56 -0800 (PST)
Received: from xps15.. ([24.55.105.145])
 by smtp.googlemail.com with ESMTPSA id f21sm16840871qte.52.2021.12.21.04.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 04:51:56 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [PATCH] dt-bindings: display: st,
 stm32-dsi: Fix panel node name in example
Date: Tue, 21 Dec 2021 08:51:45 -0400
Message-Id: <20211221125145.1195234-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With 'unevaluatedProperties' support enabled, the st,stm32-dsi binding
has a new warning:

Documentation/devicetree/bindings/display/st,stm32-dsi.example.dt.yaml: dsi@5a000000: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)

The documented child node name is 'panel', so update the example.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/st,stm32-dsi.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
index ce1ef93cce93..54f67cb51040 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
@@ -110,7 +110,7 @@ examples:
               };
         };
 
-        panel-dsi@0 {
+        panel@0 {
               compatible = "orisetech,otm8009a";
               reg = <0>;
               reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
@@ -125,4 +125,3 @@ examples:
     };
 
 ...
-
-- 
2.32.0

