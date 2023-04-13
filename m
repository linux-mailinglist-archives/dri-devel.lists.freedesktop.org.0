Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A993F6E0B0F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 12:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4878A10E146;
	Thu, 13 Apr 2023 10:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A111810EAB1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 10:09:50 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id q15so11238369ljp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681380588; x=1683972588;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DEAnat5PSJjsxQAWB7/SpZ+xwfK/Fj2JlbHtk3HNvoA=;
 b=ltTzPvxhvo3ZlgIQh10MfEpSaxyzcEAkSMAeImGiz864Hk+fEhbQ0LBYTl2tPSAMzv
 ab1LF0jIAHCyWSFQHQAPE5RsNQrBf7QUL10601PtdgwXHZgXZX6SmagLER5KjFeycGbU
 Tn1zqwIgboWmT5uTM98zj+zv1iLv4EQv3BV3StMfIXzzjTyE/rb3qRcf8zYfu6JtIPSk
 zSZ7/Jy0lHHCEV12vsYu00BDiERMME3VWk+g53uOSCfATYHP4XEKxgzEMZqCPinFLuSr
 QkXOAnq24uM2s1mGb3lQYwPpkeH1uS6wRGzzQeqmXaHWp9Czo7eQ2hzQ8vxjX6l4hEmf
 Rnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681380588; x=1683972588;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DEAnat5PSJjsxQAWB7/SpZ+xwfK/Fj2JlbHtk3HNvoA=;
 b=kSkgaSqkK8X71KeE5tlF1sB32P565Ts6ETdYIHobRwSlVAtawbv4RtiuPpaWnQwAaX
 9t0SwxxKYfMR1ayv/GF7XQg/1yke9uE1dinfDwjZ9hfg+YjrV6nliSZ/9r1OBj/SbtJy
 dLronmyiwIMdbgFQGjG4wrENoDez3iEdOXajw8T2j3yU2wmevbiboyuF0WnhjyRnakIP
 kyCbA3F0lkKurRDFkLjLHy3UbMGyCGbOrMTXJvmA4wOrHL/jXeNUTr2SVUzVeSdbyhFC
 HKqFl04BUwCVBOmD96AV5lXXb+XU5txblA2wffag+AxsuVbmADYNGnFrDYyRdJVWV+bC
 DCuQ==
X-Gm-Message-State: AAQBX9cKwgVgTaPoJXzkXuACqj4PfMfUIGa6a2dwM06V7XNc91fBlHwd
 78b3HCr/Kd+2QauqIZruYdGFWw==
X-Google-Smtp-Source: AKy350asL51EeQDLbOK2ZbUFavRJIn/bPYE8P0PHMi+LSEUZ/Jv99YCh3KyhcP4BfchERSh094e26A==
X-Received: by 2002:a2e:9e19:0:b0:29b:d471:c80f with SMTP id
 e25-20020a2e9e19000000b0029bd471c80fmr907501ljk.36.1681380588424; 
 Thu, 13 Apr 2023 03:09:48 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a2e9d14000000b002a2e931fc48sm200482lji.140.2023.04.13.03.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 03:09:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 13 Apr 2023 12:09:35 +0200
Subject: [PATCH v2 1/5] dt-bindings: display: panel: nt36523: Allow 'port'
 instead of 'ports'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230412-topic-lenovopanel-v2-1-055c3649788e@linaro.org>
References: <20230412-topic-lenovopanel-v2-0-055c3649788e@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v2-0-055c3649788e@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681380585; l=1187;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FMgShhUTMaYzSy2Me7Gv1xSXp92sIQsWFZ0aqhhoJn8=;
 b=9J88Z5LuF95gqkV+HSGcOJ5UC/2WCV8vVvuzNlssYzVIvrv/8ehvUa53oIMtzftb/pqyOx/rHMmu
 dOWMlYA7DWmYNYzxksbhUTQJ36XooRkA8E19xmPb9BFG36Q4wp1V
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

