Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED6258F009
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757DA90261;
	Wed, 10 Aug 2022 16:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD3F2BFD2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:03:45 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id h138so12484392iof.12
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gUFodgoC2lqTFaNasV7YrZykU95cfxFWACtBt8544i0=;
 b=hEh71p2ql8vFfYP/A7KpRvQ+lIipKGkjBe//NNFjsngPornH6rPN2IV+i4y1JT1Iaa
 fcPsjykM0HGUlMbzWdxX7u4NPO/qRkd9oqwcqIp9MREvMRMEwdXxyOechAQIBwyOS3jK
 W0Vkswe1FiURX8KCxpuwuhxgTi0NNowHefCFhv/JAuiIYmajCWCUSGoy5WXsyXMC1Cp3
 5oJjUoEMe+WUXLSjRF4DrCLfxWnYxF/3D17Uh6bEv49Kep2d4+FbRIzxSimZCeQPLY/w
 wF9YR9TA4VMIb0bSwyfS4uzJD6L3Sjmw/2yUcZUHa72uraz2yAq+aiYnEKc4DaR4qC1T
 UQiw==
X-Gm-Message-State: ACgBeo0CTTRxLwP5kBWAVRkcxLMB/FpkdJL5wUvWmubUKgyWI2OQIf6A
 mW/tQ43v5wHJt18RMp9YnA==
X-Google-Smtp-Source: AA6agR4B7/p6u94ML83YbYJrjwN2UKytsOAzrt31dANpFxXzc/VXUvtvEbBrHLarP+5xG25DICyg+g==
X-Received: by 2002:a05:6638:2504:b0:343:38c9:eb27 with SMTP id
 v4-20020a056638250400b0034338c9eb27mr2808124jat.92.1660147424916; 
 Wed, 10 Aug 2022 09:03:44 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id
 a27-20020a02735b000000b00341a215d3cesm7617629jae.63.2022.08.10.09.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 09:03:44 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display: arm,
 versatile-tft-panel: Drop erroneous properties in example
Date: Wed, 10 Aug 2022 10:03:40 -0600
Message-Id: <20220810160341.51995-2-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810160341.51995-1-robh@kernel.org>
References: <20220810160341.51995-1-robh@kernel.org>
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

The 'arm,versatile-sysreg' node in the example should not have
'#address-cells' and '#size-cells' properties as the child node doesn't
have 'reg'.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/panel/arm,versatile-tft-panel.yaml        | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
index be69e0cc50fc..c9958f824d9a 100644
--- a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
+++ b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
@@ -37,9 +37,6 @@ examples:
         compatible = "arm,versatile-sysreg", "syscon", "simple-mfd";
         reg = <0x00000 0x1000>;
 
-        #address-cells = <1>;
-        #size-cells = <0>;
-
         panel {
             compatible = "arm,versatile-tft-panel";
 
-- 
2.34.1

