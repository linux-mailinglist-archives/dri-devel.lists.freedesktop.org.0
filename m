Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B8B6E0B14
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 12:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DF510EAA9;
	Thu, 13 Apr 2023 10:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC26410EAA9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 10:09:51 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q15so11238423ljp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 03:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681380589; x=1683972589;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bSIW3m6ouiUh4MBy/iPcO3038yiahaw6SCZrZmXoL8c=;
 b=s2aepwa18IqdU0SyKMtM8jAoCQnaWRTpqSkvN7201r1i0T84x5U2A//m+sbAcDUY/h
 bIiDy6rekYmG6rNaS1GUtUrLIjmERQ/aWcasLBXJrb3f5xP8+Cy2JScNMxy6od9iC/MB
 7i/0wMUpzGXDxnO7SaEBTv90z1Cm00CrZurSL82Rv1xj8WW/tvrrzwI6fX0vsYxaSdNe
 eIDmzsQiVKeVrX9UKxSMxtZNcln6avoeEn11sokQ6rOTBf1YjXPvJbKZzmmmCBIAOk2F
 oLv2O4sjH9mOq8ymbTMucigojP13caE7qM32yysFQDphq2hC8KNebM8DwDCcJu1oF3tH
 Nkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681380589; x=1683972589;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSIW3m6ouiUh4MBy/iPcO3038yiahaw6SCZrZmXoL8c=;
 b=Fro/e4+7aC82r+9FtUVxbsEM3K1RAAuCbUtJnx70giDk6gmuURpkHC4xJLRP8HCaBh
 M8OVZ+o0NwXW3zBnO2g6+N6xfMhoOJYWkATgTER41oIEFsHVmhTy3CdVYxxP/TRYOWb9
 fky+fOJQu9wr1cMjBMQI5XptBpG6ySqTxt/V9ySaV+MbvdYEgA+ZVD18QBPrj2WRDuVk
 r1xLFPr9kwo7nNdbAsW4XUKXFZBygVtRYbeQPTQVE50TsmbCK5u7Fdj9nlqegArg0Q8t
 3KbPvHyCgQwjDmUfYyqJzPy3EeyslHEaBCO+DFVoN0bMeiM2bjCdP8QpzYRLAbUAQ7XS
 Li5Q==
X-Gm-Message-State: AAQBX9fZ0OqZ/nJlfI3kJ+t7ch1axZKRewW92TAZ0U7aaBd04fYTVtNy
 ajZNVJhQ35tA4yQ9CyHahUsBOg==
X-Google-Smtp-Source: AKy350akt3tf+m5dnagc6WlGIUG8b2dlWdEiOD0/YEcV1QE/n9GCXFU+ey43oGfBADr3OnNThMPwMQ==
X-Received: by 2002:a2e:2418:0:b0:2a6:8a:d0f5 with SMTP id
 k24-20020a2e2418000000b002a6008ad0f5mr578207ljk.23.1681380589691; 
 Thu, 13 Apr 2023 03:09:49 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a2e9d14000000b002a2e931fc48sm200482lji.140.2023.04.13.03.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 03:09:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 13 Apr 2023 12:09:36 +0200
Subject: [PATCH v2 2/5] dt-bindings: display: panel: nt36523: Add Lenovo
 J606F panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230412-topic-lenovopanel-v2-2-055c3649788e@linaro.org>
References: <20230412-topic-lenovopanel-v2-0-055c3649788e@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v2-0-055c3649788e@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681380585; l=1472;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=n3Ug6o2RQm9MRwfNsS0ku9LYCJEX/SEVYNXH8b0uEzs=;
 b=7k3RzLmzF5mXo80xwIEgbS38OpViZfugrSV/p8xZjzFY6LLzX8bSGoCa5fzFIkaUzU3qAqdZhOrL
 xZd5o7mhAfUxWxAQTY7QYr+XMn+hZJmlPjzk32hAPTHJlIpKfczq
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Lenovo J606F tablets come with a 2K (2000x1200) 60Hz 11" 5:3
video mode display. Document it and allow rotation while at it (Lenovo
mounted it upside down!).

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/panel/novatek,nt36523.yaml          | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
index 38f4f986aef1..fda74d5bd89e 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@ -19,11 +19,16 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - xiaomi,elish-boe-nt36523
-          - xiaomi,elish-csot-nt36523
-      - const: novatek,nt36523
+    oneOf:
+      - items:
+          - enum:
+              - xiaomi,elish-boe-nt36523
+              - xiaomi,elish-csot-nt36523
+          - const: novatek,nt36523
+      - items:
+          - enum:
+              - lenovo,j606f-boe-nt36523w
+          - const: novatek,nt36523w
 
   reset-gpios:
     maxItems: 1
@@ -33,6 +38,7 @@ properties:
     description: regulator that supplies the I/O voltage
 
   reg: true
+  rotation: true
   backlight: true
 
 oneOf:

-- 
2.40.0

