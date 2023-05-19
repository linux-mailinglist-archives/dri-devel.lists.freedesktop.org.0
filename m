Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05AF709EE2
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A35B10E614;
	Fri, 19 May 2023 18:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248C910E5FF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:09:30 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-96f0678de80so651987166b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 11:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684519768; x=1687111768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MF33tdMj9iVHCsjXUVoEa1ZEru2AhDHukTYWsA8encE=;
 b=bm7RAQh6sbBla4vNjrqGC5WqJ+/w35iby80F2IEn4lfhiajLAQZK8zrOwn+VUdYVc1
 5vr8TZGpub1V6modDXJzHvOZm0KbrmORsP201upDRJncrMrqBosCAR+X9RgXdNHqmb+g
 rHSuzRcNajsuOLEms/pFWpK1/OApbZ5gCIsILsO62ev4+PcjrKnb+Hcgzstco3XI3iSH
 IBhm3MZq1H9zNQACcIOfw8whprOqQPTb8ueGk5h/YB4wHDMqc9f/TkAnINdLJAP+TBZX
 HrtkKrictRIJZnCHsUinUGfIYj8HkDYfcdU5oj/Py6Gojc0cZMXl12wyiArGpvkIo43Y
 31fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684519768; x=1687111768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MF33tdMj9iVHCsjXUVoEa1ZEru2AhDHukTYWsA8encE=;
 b=lKUsNNrEF56uj1aaieWOCT/zLUaLX0POkKvqqx34QJcf1AW9twFnflMt33tH+9ei7r
 tbJJnnip9qC5b5EJEJADWLUGzJ2a+R4ksiza5PxGj3oSdfrv+ZObrWAkbeAL8W5+BR+W
 p1GflTgJyJkVNtn9YU+ReiuMKzXPpBpnAyfuZ2q1YBqWxm1ZxJYD7VzmUzGwxqVKCz/v
 usAEGNoSZ8n6I+Gx2FQVS1Ndmy/PHbsRaOYzXaCAGS/7K4D0XNp3sS2d/BpEgfJkhLm4
 3JRS2+xSyKHuwfUJA81NowLhcj6Hgj3RQzTQmgwCvoNck4hfgERjlhoBaPpH2jeahxlo
 wayQ==
X-Gm-Message-State: AC+VfDwpZna0vsfGCReraassB/TMELuT25TgYx828CsHE4gRgrLLGTc6
 qs5PCOULXxFgg1FnzDZtxg/U7oz+NnA=
X-Google-Smtp-Source: ACHHUZ6SJoTanHKm7kR2LK1v+KjCScFJDXFOZCH/ufqcyH+1iKc+sO94xdQxG9FrUnCxyLb6Q97YqQ==
X-Received: by 2002:a17:906:fe41:b0:96a:138:c1a0 with SMTP id
 wz1-20020a170906fe4100b0096a0138c1a0mr2982368ejb.9.1684519767821; 
 Fri, 19 May 2023 11:09:27 -0700 (PDT)
Received: from localhost.my.domain (83.11.222.198.ipv4.supernova.orange.pl.
 [83.11.222.198]) by smtp.gmail.com with ESMTPSA id
 g26-20020aa7c85a000000b0050690bc07a3sm19824edt.18.2023.05.19.11.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 11:09:27 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 4/4] arm64: dts: adapt to LP855X bindings changes
Date: Fri, 19 May 2023 20:07:28 +0200
Message-Id: <20230519180728.2281-5-aweber.kernel@gmail.com>
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
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 38f4ff229bef..a6a58e51822d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -58,19 +58,17 @@ backlight: backlight@2c {
 			dev-ctrl = /bits/ 8 <0x80>;
 			init-brt = /bits/ 8 <0xff>;
 
-			pwm-period = <29334>;
-
 			pwms = <&pwm 0 29334>;
 			pwm-names = "lp8557";
 
 			/* boost frequency 1 MHz */
-			rom_13h {
+			rom-13h {
 				rom-addr = /bits/ 8 <0x13>;
 				rom-val = /bits/ 8 <0x01>;
 			};
 
 			/* 3 LED string */
-			rom_14h {
+			rom-14h {
 				rom-addr = /bits/ 8 <0x14>;
 				rom-val = /bits/ 8 <0x87>;
 			};
-- 
2.40.1

