Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ACC6C9653
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 17:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7B410E311;
	Sun, 26 Mar 2023 15:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A80D10E1DE
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 15:54:36 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r11so26220752edd.5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 08:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679846074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2CYAkeBkiK+UhGthwoQ1EwlNXrFR2ygK1R+o0KFshok=;
 b=iniB2T59+riVzewdPmkYZTlzSoMEMibvs1gKTUrFj/FlPUgrgbP4ZJDQNewJS/NVhn
 1CFxpd3JcXrRLeifWK2d/aO8I8l3m6pe3ON92TN+gvOaDEJEJR1GyVkWtAoSoH495O/g
 AWUXli4NoPQNE6/xAGw9W8gPX/OnisQIit2jCrYeRyb2+qDOYralNkm9GjOQpOqKicnu
 6hTQQeTGxWwNEXOFRh1mGoTC2KMIfKu77IBW8XupaiP78TLYTZOu0tEsf+xr7cvLqyo2
 kOzHJEpTrOSlNYZ88ch50BuhzvasTM99iYPMFRuWtxQ7R/xGmLlsIgxNdRQxZPLKNPhr
 ILpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679846074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2CYAkeBkiK+UhGthwoQ1EwlNXrFR2ygK1R+o0KFshok=;
 b=SxakVZtZEZcrRn1EEkpVxx2Ds8/AVAs/SCnwBrXbaJ7O7jRGGNn3bh19xDy0KSPCbZ
 9olWr/KABeUpwrNqN9G7DLh/w31qg3NtjpW7vs+Kc+RL/dgyyIpRUjicsgVfKVL6jdeU
 fpvdIiBjbhP/FbWlUjwfhYuD2OkXNdm6NMOgTEsZ6uNuL7C/c0c54NCtlpvKRmv9EKnD
 pxb4VF2m036KW+CCYvr9rKXFtV6ildgAjBNeU8NuhYn9A8Aiatfzv2eSphgr0mshHMz6
 wVtiGX9aFlu0TL4TFVfi0M8RzbCpT6zFOts2Ei6yt/03M/i4RaJSC2dz07MshuIyV8jW
 AhtQ==
X-Gm-Message-State: AAQBX9eZ3fizHoEsMURxC6y9vFROSm/0MxEUMi+Yt537xaqTa6tRgCmI
 XIdQ1vNSsaNWmberWmpho5GAwg==
X-Google-Smtp-Source: AKy350YpYs/8Vdmi3STGf5AquUGui7sbir34hOCWu9zkXPhfNRRkOuFcZ9t6H3NCocxlP0Gvgw4JwQ==
X-Received: by 2002:aa7:c846:0:b0:4fb:8d3c:3b86 with SMTP id
 g6-20020aa7c846000000b004fb8d3c3b86mr9105609edt.1.1679846074821; 
 Sun, 26 Mar 2023 08:54:34 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a50d6c6000000b004af62273b66sm13506742edj.18.2023.03.26.08.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 08:54:34 -0700 (PDT)
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
Subject: [PATCH 6/6] dt-bindings: display: boe, tv101wum-nl6: document rotation
Date: Sun, 26 Mar 2023 17:54:25 +0200
Message-Id: <20230326155425.91181-6-krzysztof.kozlowski@linaro.org>
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

Allow 'rotation' property (coming from panel-common.yaml) already used
in DTS:

  sc7180-trogdor-quackingstick-r0.dtb: panel@0: 'rotation' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index f98ed588c750..aed55608ebf6 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -55,6 +55,7 @@ properties:
     description: phandle of the backlight device attached to the panel
 
   port: true
+  rotation: true
 
 required:
   - compatible
-- 
2.34.1

