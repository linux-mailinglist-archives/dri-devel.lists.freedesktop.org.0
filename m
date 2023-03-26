Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6226C964E
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 17:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8330510E1EE;
	Sun, 26 Mar 2023 15:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B418810E1B1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 15:54:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id ew6so26149218edb.7
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679846070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVZux4uHBZzsldCyxcu4IzCwrMdWIWc1fs0M3nQN8os=;
 b=ReXjM5bs2NsnbUxngOH0a71w4JaN87+hXV8D5ZUs+LWCNy4WTySdX8t7bCmGq8aej9
 /t7pdOQPt1oSfdoPFaf/Helhz94vHkcLv+FK7plRYHO3UAWs6o0m415MAW5mVV8BamZc
 65fpQVkKkofD3OPJ+jTgb33py/ioBcwkFcZ3iQhAIb4BeGW+GsD6tog2unXij8eXCAVa
 2qiDZz3aIRw3zM769HTgMk743yYtF14Ej2utSs7IU2s5qmYC1Mr/cjiDRXlSL6uhmm8D
 tZI2VRg2HRAEM6NYccywDpPShJ2NpbOf4Q7nMqdZFIXBDEMCBghp1nt7x1I3sOcnrqii
 SJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679846070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVZux4uHBZzsldCyxcu4IzCwrMdWIWc1fs0M3nQN8os=;
 b=xvyCcRTtYZM4xxY1Ozew9Jp3BxXQtj6Og0QQkH5dqE5NuJQHKSfPjKunLUiIt/jV/0
 CFkVElBC/youS5ei7oC96lRjocGvq3btziZ3I0bFqn44ASvh91F/tovuhQejKeZz0sbe
 Vgq31f4cZ296CdIPgpHF/eNNXjmXyl0F1SOnOvzGjyOMBH5TR1xJR2mQtMX485jzl0M1
 o0DGw5y5tclZBbmuvPdai2sgyV5b7WhFFcf34ZD8CxlGiW9HRVoHhhZyOl8m8Gm8Jj2l
 BKqE7+2C9UOriLMHLDJI6S+pwANZwOr+qaGflHMX5nuyFg2onRam/2xYlg6i6M7IUtHW
 /R3A==
X-Gm-Message-State: AO0yUKWVoFrQPOa1o0TuMC+jwckRQAZhPcNVQoLik7XgCZ2TcdhyCB1f
 mE8Ge0h5mykmqldXCJHq3J598A==
X-Google-Smtp-Source: AK7set9DE6vPbbVIA0Rm5bVMGQJWRb3++BCkPyrB3vGliMxtG1Nvbu9P2n0OAfxhr8S+W5+V2o808Q==
X-Received: by 2002:a05:6402:5d87:b0:4af:740d:fde with SMTP id
 if7-20020a0564025d8700b004af740d0fdemr13852421edb.20.1679846070169; 
 Sun, 26 Mar 2023 08:54:30 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a50d6c6000000b004af62273b66sm13506742edj.18.2023.03.26.08.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 08:54:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Srba <Michael.Srba@seznam.cz>,
 Harigovindan P <harigovi@codeaurora.org>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: display: novatek,
 nt36672a: correct VDDIO supply
Date: Sun, 26 Mar 2023 17:54:21 +0200
Message-Id: <20230326155425.91181-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
References: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
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

The nt36672a bindings were added with a mistake on VDDIO supply calling
it in one place vddio and in other vddi0.  Typical name is rather vddio
which is also now used by DTS (sdm845-xiaomi-beryllium-common.dtsi) and
Linux driver.

Fixes: c2abcf30efb8 ("dt-bindings: display: novatek,nt36672a: Fix unevaluated properties warning")
Fixes: 9528a02430df ("dt-bindings: display: panel: Add bindings for Novatek nt36672a")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/novatek,nt36672a.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index 41ee3157a1cd..ae821f465e1c 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -34,7 +34,7 @@ properties:
     description: phandle of gpio for reset line - This should be 8mA, gpio
       can be configured using mux, pinctrl, pinctrl-names (active high)
 
-  vddi0-supply:
+  vddio-supply:
     description: phandle of the regulator that provides the supply voltage
       Power IC supply
 
@@ -51,7 +51,7 @@ properties:
 required:
   - compatible
   - reg
-  - vddi0-supply
+  - vddio-supply
   - vddpos-supply
   - vddneg-supply
   - reset-gpios
@@ -70,7 +70,7 @@ examples:
         panel@0 {
             compatible = "tianma,fhd-video", "novatek,nt36672a";
             reg = <0>;
-            vddi0-supply = <&vreg_l14a_1p88>;
+            vddio-supply = <&vreg_l14a_1p88>;
             vddpos-supply = <&lab>;
             vddneg-supply = <&ibb>;
 
-- 
2.34.1

