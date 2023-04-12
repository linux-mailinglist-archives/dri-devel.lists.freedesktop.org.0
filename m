Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2AE6DFEEA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 21:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D92110E942;
	Wed, 12 Apr 2023 19:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F29A10E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 19:46:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z26so16018262lfj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681328771; x=1683920771;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DEAnat5PSJjsxQAWB7/SpZ+xwfK/Fj2JlbHtk3HNvoA=;
 b=YXwiyLzg4ji60X8cpHNlrFIzDmyZJKGB81F6A+ebWz+GR6NY5Iw6oTV86QwTK8VLlE
 6JFyxipHfmjVM1joCgbYab5wEgc/NJyR1AJYa6JO8xP9LPl+ocaSmy4rQnc+SdPbnh/C
 8tyxBZkFJ+js6MrlXgfSsQzD7u7/idqTlgloJP5dzbipQLlNRkjMLXU3cGd0T8Nc2N/B
 YuGgoV4RzSig1n7Rt3siwcaHYmf2mezeVij+xLS+fEPcYfcwznC2fX6aChJB27I6KJFt
 DZQWDCkyPETH8zshyG34lInJ17jBpHrxZBLHCp5PYc6fWwVwkrwwPWOGXMK9lPsqAJ/x
 8WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681328771; x=1683920771;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DEAnat5PSJjsxQAWB7/SpZ+xwfK/Fj2JlbHtk3HNvoA=;
 b=dSvxtf4wfLAVtyKExm/yEzPZ9phlCZOQxtz9WcKbImgndb2YsaYf6XwP8Y52GtOZMs
 ouv51FCxe7VZ0uQlLz7cHP1fPOYbnL7EfqTLNmwmd86Jvn/QLSbmRWFwAPPjaEcCq05w
 JaSN4NgClmKWfHIXdWICKn8PyUaTiJrDPWcFwzaI8qBMxoGDmUdpua3LrByMQbGBDMTT
 xU52ytTkcOZNx9vAmi0yZ30/o6YC+x1Ao7fdDYDUwZNpRXX8xJKaCPWb5B+6chvay1BN
 hxxK9GNJ/2+muCg+EtczoUK4Ke2wb2IjMFUu7hKzJ/Gwk6yIlMK+rO/qS9bs225D3wvW
 eiRw==
X-Gm-Message-State: AAQBX9fPmi+OIW09xjJt7i9KgGfsvRkarQfW7Fn82z1CPQTHAFAM1RSH
 FjsL2nSQfwJpQ6fM4aviebxFVA==
X-Google-Smtp-Source: AKy350ZQO4wDtrSkqQilMkiMX1DJXlr0CW0RCxaddDxjo+a6jr9yxnIMURGU7xelCIuFm0ODAe3xcA==
X-Received: by 2002:ac2:544c:0:b0:4ec:9f36:9b5c with SMTP id
 d12-20020ac2544c000000b004ec9f369b5cmr2723lfn.68.1681328771108; 
 Wed, 12 Apr 2023 12:46:11 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
 by smtp.gmail.com with ESMTPSA id
 x2-20020ac25dc2000000b004ec8de8ab3fsm1205865lfq.132.2023.04.12.12.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 12:46:10 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 12 Apr 2023 21:45:58 +0200
Subject: [PATCH 1/5] dt-bindings: display: panel: nt36523: Allow 'port'
 instead of 'ports'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230412-topic-lenovopanel-v1-1-00b25df46824@linaro.org>
References: <20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681328765; l=1187;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FMgShhUTMaYzSy2Me7Gv1xSXp92sIQsWFZ0aqhhoJn8=;
 b=9TbzELnlWNU1kmoa3o/rXyhwMOM4rjVKSxHPyH/watUFxTLNRkHx8vvXq4FZZfrwU4sEibR9V1Uw
 0SXo1Q/nB7+4KemAltiOcAA+ADHzcKumbeSaLNwxSdI89adYyaP2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using 'port' instead of 'ports' for single-DSI usecases allows for saving
a couple of DTS LoC, including a level of indentation. Allow that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/panel/novatek,nt36523.yaml           | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
index 0039561ef04c..38f4f986aef1 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@ -33,15 +33,26 @@ properties:
     description: regulator that supplies the I/O voltage
 
   reg: true
-  ports: true
   backlight: true
 
+oneOf:
+  - allOf:
+      - properties:
+          ports: true
+      - required:
+          - ports
+
+  - allOf:
+      - properties:
+          port: true
+      - required:
+          - port
+
 required:
   - compatible
   - reg
   - vddio-supply
   - reset-gpios
-  - ports
 
 unevaluatedProperties: false
 

-- 
2.40.0

