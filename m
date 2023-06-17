Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B4734259
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 18:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7389110E02C;
	Sat, 17 Jun 2023 16:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9FB10E02C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 16:57:32 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51a20c744ebso2256984a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 09:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687021050; x=1689613050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cYkWr+qB9Dy27do4YoJJyP/9/BdByG4wfyLCrCmqa7U=;
 b=WJ0col15f2yIYiNyzpQLZROUE/7n8tQ4HuBnCy0Oof0nS+49wdxMqi5HnVue2p/ByY
 QEkU9wGzQSiktECAdDCRneh+ahbBQX9t7T149pNjjR3DmZl4/C4gLMPTt2ksNGZAznTA
 DRpCfLZGtmpdG5xm1EKHBc1/MhokeYzvwLC5Iubt1BtAaMr2VCZdpBOkTeCa1w+ifC2/
 WMNrVhI+lLGfubEKZfzvHELoGSvJaEb1RLQhSmrVFdnzwb7GxnTUl109VQx2IfXZZkuB
 P8ZVmQqlhegyECdr/V9Dnm2Dv1PtVctlbEnVhczort56TlYZuM/xCsb8f/iduuld79rg
 yD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687021050; x=1689613050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cYkWr+qB9Dy27do4YoJJyP/9/BdByG4wfyLCrCmqa7U=;
 b=b7zyTrvNs4wi1E1Av989ZODU+wfHB5kKdP8v7YxPp7r/kqqJlhMa/RumfmD7zeeIKg
 S0PoKsB5YVdf0nq7L8XmrSv4SyZeIoTwP6bf5iJ6BaQIDgGRkHuHQHWGyrAyDEZoAko7
 cCoTdi+dMwm4VXNuP6XamT7RJJ5XVxwEJsKa/qs+N+Ak16DNyX+kAEAMSoxRnkWoV0G7
 EXkcqRauQ5M4sQoHrrLruyqxczltcqb3fLUfekku7rDmT3t88LLbsz/ImDYNUYDfIlZk
 T/7fcWXk+M7Mv6K1dSWlJLsdFuZQiwNWWDI+zU3i2TFRufnBncl7bRvyegRXsyWMNDn6
 WmsQ==
X-Gm-Message-State: AC+VfDyKhNrYg7QfH+ZvPwaCuOIanFhwjbAOf4V0nc4IfGW5mjcRfEBU
 xJlnbVvMg23bseDcbXJqs29QeqbkneA8SpYdZw4=
X-Google-Smtp-Source: ACHHUZ6rsOF2b6T9zuvp0klPgNhhjJbj2nLVN09KwwbbKBsxKtDmXRwtSdGhblpiDCx3PeU81GFQqQ==
X-Received: by 2002:a17:907:94c1:b0:966:5c04:2c61 with SMTP id
 dn1-20020a17090794c100b009665c042c61mr5254779ejc.8.1687021050309; 
 Sat, 17 Jun 2023 09:57:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26]) by smtp.gmail.com with ESMTPSA id
 j15-20020a170906410f00b0098768661505sm1014598ejk.117.2023.06.17.09.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jun 2023 09:57:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: sony,
 td4353-jdi: allow width-mm and height-mm
Date: Sat, 17 Jun 2023 18:57:26 +0200
Message-Id: <20230617165726.279886-1-krzysztof.kozlowski@linaro.org>
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

Allow width and height properties from panel-common.yaml, already used
on some boards:

  sdm845-sony-xperia-tama-apollo.dtb: panel@0: 'height-mm', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
index b6b885b4c22d..07bce556ad40 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
@@ -23,6 +23,8 @@ properties:
   reg: true
 
   backlight: true
+  width-mm: true
+  height-mm: true
 
   vddio-supply:
     description: VDDIO 1.8V supply
-- 
2.34.1

