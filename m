Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70584824ECB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 07:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBA610E57C;
	Fri,  5 Jan 2024 06:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7717E10E56E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 06:53:17 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a27e323fdd3so128511466b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 22:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704437596; x=1705042396; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Gs6Zdo5lqPMyDcy2Y9AErHFR4G8ZNcqDUY2nx2C99rw=;
 b=GX5SvvLj+4yzAIT9OEs2O23F3P9YRYBh6GX7DggL2LM4rHQ4qoII+NdhJK6w6u0FoJ
 QDA9KpjoZ3QCMihT/zfoRhbMIQEk5d7TFTrWW2elhogfZugMW4+2AHyhHh3raGcMRz95
 wbWhCtREVelcZxS20lhnEN6pRITOLwbl2GHRdEKd50cKg4qcSW2KvtkYHG2TKdzBooNM
 6M35zLvn76XnzIqIjJdCUI7v6tqQHc4HBjQPupv976VG1VfrXPp/IqSMD3BGa9gdds60
 PmHfBTjdjco88dApyWRDzRobnd/7B6Zq3VK4CmMp+fITtPzXcDsK4x26mz1n02Fkg+E0
 zOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704437596; x=1705042396;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gs6Zdo5lqPMyDcy2Y9AErHFR4G8ZNcqDUY2nx2C99rw=;
 b=lK9cRgTIhDhuJumip82XAu+ccjMe+Y+jLBNaI0cLzAhaXg53Ws0QvRgoCDSPMxwEpH
 KS760+Yu/OIWtrY4FmHr5GNrgPEX5qXoOsQmyq6DeQ8319hXpoMf9F+rJadsdsSbQHAI
 zyrWEsks7EOplMHIBp9zcZBdsjK+FX6r7aqBXgAv2bCtPBs/m7O7WkiiiZzQ3ivGCnS+
 zRMInsJO2yhbgxmnW1cBaWGti+pT6wC/Xtvfc+BH0AN7o4a2Z8E4m6xADs+X/AhspRwJ
 GbvPBjB4j3ZwZ06MQbL2T1bpD/UTDJOCqnwdUl5+CBbeWjasstlOtij59qF+nsvjTP3b
 7YKQ==
X-Gm-Message-State: AOJu0YzmypLfkhryjmKgNOA3PsD6mcZtGtBo5ZMHlsIXhkkzSFWN/vyZ
 4+zGkEa79wmFWaaI0VbchJs=
X-Google-Smtp-Source: AGHT+IGK9xkg0CCNYNDKzTYncS8IxaFYD6jd3LQSs6N1y6nKezYqqpIO5ypVgZmxqvaMktFrE99/jA==
X-Received: by 2002:a17:906:c55:b0:a28:77b:bb36 with SMTP id
 t21-20020a1709060c5500b00a28077bbb36mr797610ejf.134.1704437595580; 
 Thu, 04 Jan 2024 22:53:15 -0800 (PST)
Received: from hex.my.domain (83.11.207.119.ipv4.supernova.orange.pl.
 [83.11.207.119]) by smtp.gmail.com with ESMTPSA id
 g23-20020a17090669d700b00a28e2b72db2sm518809ejs.56.2024.01.04.22.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 22:53:15 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 05 Jan 2024 07:53:01 +0100
Subject: [PATCH v2 1/2] ARM: dts: exynos4212-tab3: add samsung,invert-vclk
 flag to fimd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-tab3-display-fixes-v2-1-904d1207bf6f@gmail.com>
References: <20240105-tab3-display-fixes-v2-0-904d1207bf6f@gmail.com>
In-Reply-To: <20240105-tab3-display-fixes-v2-0-904d1207bf6f@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704437592; l=860;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=Hj/KIXM8+wrf3C6zb6NPg6hk9u+G2N6Miq9I309cmwA=;
 b=y9TBDXAW40WhQZ9RyljbqE9HKhzBXZ64rvQTNoPAID3ula15xCJhQhW/2iksx6g5BkUiOZ9Zd
 PdpWEQ9LjCzDZWJLsH+POGdfXFFhAi1McL/WcJTJJjyZwgTczWGXKVr
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Artur Weber <aweber.kernel@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After more investigation, I've found that it's not the panel driver
config that needs to be modified to invert the data polarity, but
the FIMD config.

Add the missing invert-vclk option that is required to get the display
to work correctly.

Fixes: ee37a457af1d ("ARM: dts: exynos: Add Samsung Galaxy Tab 3 8.0 boards")
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index d7954ff466b4..e5254e32aa8f 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -434,6 +434,7 @@ &exynos_usbphy {
 };
 
 &fimd {
+	samsung,invert-vclk;
 	status = "okay";
 };
 

-- 
2.43.0

