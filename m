Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE50F709ED9
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B24C10E612;
	Fri, 19 May 2023 18:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E331910E5DC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:09:27 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso5822423a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 11:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684519766; x=1687111766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+d7PbSuYoLaRDWMlMC+jLFLlA199/veHtp6NNGsVDoc=;
 b=gcQTbnmDPp2/Gb2su0qH27Cgs0F2g1Thm8mh9FNIKJm0oVuWfADVDmYW4S0L/BK8+o
 a3kVhiDBd4o54uoRD7sp0IrRDfs3pfeg/SNyFKjAdblu6Ht4gb3IPvd2GMeO02U3gysx
 B7ZE8QxzdS0Mec6P1B8zNcr+Fh8yiAoPQMJ1yYGqpUy19Wptg2PvOGX2y5mQt8Mll+aR
 XBvSXRbCkp/SVV6ti/QWRr4WHfxvz+fdSWMLN02t2+823/rE6XWCLu1ag1HeoW4jVgbG
 K7Ko9Ct/ypYjQZOP7mkZyEVgV59MYRy59bdLdpyRUEOObSce6eGRgyKDjmZ4RQQPTpu7
 qUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684519766; x=1687111766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+d7PbSuYoLaRDWMlMC+jLFLlA199/veHtp6NNGsVDoc=;
 b=gqVJ87lW714NmPH7VEcc8NiDuzhS5zsTVi6UQT7KMnbhvFdCzKeJh56Vn7STnP4gwO
 vVSzZYNrSDPDrQ1rpvbKaHhEkXj+HkhOvkQYsjsIe93bGQtNlPWPUcEsNI5h4JkZZewQ
 7aqOrBAlE6bsT/ffx/1KPQ6ezFt7z9zaepPw5gRLHkw8u69UqoxJGfHSBF3fWF54N6Fv
 miP9TfnLvmyL7J7sKVp7ZLUq2Y8tEDWLKaW/6s9tWUZOgtItZKisZeuyWNH1sq8kNxQ/
 a6nwVCyNOoIPEstQXX5MADYVCU/L+fDxBqwpNP9ODECWEDtcCrb67/8LJOrED6OAPhTr
 tasg==
X-Gm-Message-State: AC+VfDwEuVxOidJMSl3ApbBonCuJU9t5lTs0jSWetEe59uhrTq7l6ZWq
 5i1hDORCpNrXm3UVrk3tYH0=
X-Google-Smtp-Source: ACHHUZ7rLnbizAEqYNWScE2PGJGpJKPdJtBcR0QqvyY0pfJthrs/TixsUA/eAKRegeklwChoSIzfNw==
X-Received: by 2002:aa7:d8d8:0:b0:50d:bb87:247c with SMTP id
 k24-20020aa7d8d8000000b0050dbb87247cmr2359065eds.1.1684519765877; 
 Fri, 19 May 2023 11:09:25 -0700 (PDT)
Received: from localhost.my.domain (83.11.222.198.ipv4.supernova.orange.pl.
 [83.11.222.198]) by smtp.gmail.com with ESMTPSA id
 g26-20020aa7c85a000000b0050690bc07a3sm19824edt.18.2023.05.19.11.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 11:09:25 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 3/4] ARM: dts: adapt to LP855X bindings changes
Date: Fri, 19 May 2023 20:07:27 +0200
Message-Id: <20230519180728.2281-4-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519180728.2281-1-aweber.kernel@gmail.com>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, devicetree@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, linux-pwm@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change underscores in ROM node names to dashes, and remove deprecated
pwm-period property.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
Reviewed-by: Luca Weiss <luca@z3ntu.xyz>
---
 .../dts/qcom-apq8026-samsung-matisse-wifi.dts |  1 -
 ...-msm8974pro-sony-xperia-shinano-castor.dts | 23 ++++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
index 91b860e24681..884d99297d4c 100644
--- a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
+++ b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
@@ -99,7 +99,6 @@ backlight@2c {
 
 			dev-ctrl = /bits/ 8 <0x80>;
 			init-brt = /bits/ 8 <0x3f>;
-			pwm-period = <100000>;
 
 			pwms = <&backlight_pwm 0 100000>;
 			pwm-names = "lp8556";
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 04bc58d87abf..2396253f953a 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -150,47 +150,48 @@ lp8566_wled: backlight@2c {
 		bl-name = "backlight";
 		dev-ctrl = /bits/ 8 <0x05>;
 		init-brt = /bits/ 8 <0x3f>;
-		rom_a0h {
+
+		rom-a0h {
 			rom-addr = /bits/ 8 <0xa0>;
 			rom-val = /bits/ 8 <0xff>;
 		};
-		rom_a1h {
+		rom-a1h {
 			rom-addr = /bits/ 8 <0xa1>;
 			rom-val = /bits/ 8 <0x3f>;
 		};
-		rom_a2h {
+		rom-a2h {
 			rom-addr = /bits/ 8 <0xa2>;
 			rom-val = /bits/ 8 <0x20>;
 		};
-		rom_a3h {
+		rom-a3h {
 			rom-addr = /bits/ 8 <0xa3>;
 			rom-val = /bits/ 8 <0x5e>;
 		};
-		rom_a4h {
+		rom-a4h {
 			rom-addr = /bits/ 8 <0xa4>;
 			rom-val = /bits/ 8 <0x02>;
 		};
-		rom_a5h {
+		rom-a5h {
 			rom-addr = /bits/ 8 <0xa5>;
 			rom-val = /bits/ 8 <0x04>;
 		};
-		rom_a6h {
+		rom-a6h {
 			rom-addr = /bits/ 8 <0xa6>;
 			rom-val = /bits/ 8 <0x80>;
 		};
-		rom_a7h {
+		rom-a7h {
 			rom-addr = /bits/ 8 <0xa7>;
 			rom-val = /bits/ 8 <0xf7>;
 		};
-		rom_a9h {
+		rom-a9h {
 			rom-addr = /bits/ 8 <0xa9>;
 			rom-val = /bits/ 8 <0x80>;
 		};
-		rom_aah {
+		rom-aah {
 			rom-addr = /bits/ 8 <0xaa>;
 			rom-val = /bits/ 8 <0x0f>;
 		};
-		rom_aeh {
+		rom-aeh {
 			rom-addr = /bits/ 8 <0xae>;
 			rom-val = /bits/ 8 <0x0f>;
 		};
-- 
2.40.1

