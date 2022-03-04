Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12334CCA63
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA3710E3C8;
	Fri,  4 Mar 2022 00:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC10110E3F0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 00:03:30 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so6491391pjl.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 16:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wLbnAogNT/oWqYux4yLvZ6VmokfE6BJtRW5+y3qAKWc=;
 b=hi2XA1mGuWmzBzW2eI21+QsIerzLq33JIxiQE5ib685tWM9tZWUvnicxNP8036rM21
 u6fRHECcwEvvDNdCvQbJuComVS7o2Q89BBXL1/NDnR0RHJUQXDq2U6UHAuN7+TxO4eW0
 4SgV7FZnhLt50QFYEBELcSByrEzKbYDqLphlprmwV641hOF2t+Y1czJPeuofptpykR3t
 iDCnhEOK7DA9aDrBepcvkBbqWH7arkkPvCch6hH6bXgQCmbwm4H0XZ5FqVNRn83I8mXi
 TZwQ3Zt2y0mfKNo76TqOGc54qd8K4u6RTit7M6Zupof3RKtFDlfece48fZzkyrrH2apC
 fJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wLbnAogNT/oWqYux4yLvZ6VmokfE6BJtRW5+y3qAKWc=;
 b=TDvggywGDhtPHjNp/HSrwIE3nMdQsIwyN44UJf0oC1caNX8mICxSsCEQo8mhuWmPcU
 nshihUXHYYyC4sWx4U4ANCB3pNPI9efeJ9BXD3ja/zF6iSAo0AwliXVocNU0b6Y0xbJt
 odNWA7ZHKv+RczR/gppgdT3rP319EZsUHuLZgUiPHydL9T7bSyqoiGS/o6/FDeLW2Kwt
 G1k0AesPsgmfXPfLpfyg0SyPqZSYZ9CXHHKa0cbZiLnYDCHpM5IsHFf1gHiTUNgOKJUX
 Z4QEQhtt9Y/mteDpsVxi4v7nHW6cxmKG+ufAVp+TLiC63nmwYZg34HDTqa54eH/Uq9AI
 a0Ew==
X-Gm-Message-State: AOAM533p2hvqBp4aEsNDd4pqeQL2cAB0AhNk6xzHzdK73JLBAXVnmd16
 0DqJ0gr9K3U8lQt2xf6vosU=
X-Google-Smtp-Source: ABdhPJyELqxSTPbuNUbV618Zl9NffFmwo6n9gQkEBZYjAx7lveDnXUSUAAOKa93JYUPwetl8+4Ufdg==
X-Received: by 2002:a17:90a:4749:b0:1be:ea64:4348 with SMTP id
 y9-20020a17090a474900b001beea644348mr7804979pjg.231.1646352210357; 
 Thu, 03 Mar 2022 16:03:30 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 z8-20020aa79588000000b004e1dc67ead3sm3579070pfj.126.2022.03.03.16.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 16:03:29 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: aspeed: Update gfx node in
 example
Date: Fri,  4 Mar 2022 10:33:10 +1030
Message-Id: <20220304000311.970267-2-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304000311.970267-1-joel@jms.id.au>
References: <20220304000311.970267-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The example needs updating to match the to be added yaml bindings for
the gfx node.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index d316cc082107..9969997c2f1b 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -73,6 +73,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/aspeed-clock.h>
     apb {
         compatible = "simple-bus";
         #address-cells = <1>;
@@ -82,6 +83,8 @@ examples:
         syscon: scu@1e6e2000 {
             compatible = "aspeed,ast2500-scu", "syscon", "simple-mfd";
             reg = <0x1e6e2000 0x1a8>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
 
             pinctrl: pinctrl {
                 compatible = "aspeed,ast2500-pinctrl";
@@ -102,6 +105,12 @@ examples:
         gfx: display@1e6e6000 {
             compatible = "aspeed,ast2500-gfx", "syscon";
             reg = <0x1e6e6000 0x1000>;
+            reg-io-width = <4>;
+            clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
+            resets = <&syscon ASPEED_RESET_CRT1>;
+            interrupts = <0x19>;
+            syscon = <&syscon>;
+            memory-region = <&gfx_memory>;
         };
     };
 
@@ -128,3 +137,10 @@ examples:
             };
         };
     };
+
+    gfx_memory: framebuffer {
+        size = <0x01000000>;
+        alignment = <0x01000000>;
+        compatible = "shared-dma-pool";
+        reusable;
+    };
-- 
2.34.1

