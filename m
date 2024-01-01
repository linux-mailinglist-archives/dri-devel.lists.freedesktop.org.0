Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1C7821557
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 22:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F7610E0F1;
	Mon,  1 Jan 2024 21:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA19910E0E6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jan 2024 21:00:24 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ccb4adbffbso72902901fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jan 2024 13:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704142823; x=1704747623; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G+XZ4nybj4bZroxHF/K5QreEHMx55uD+jWsZAAJ9ETE=;
 b=HsVu73t/y4+qAUkcs1ZVm6famDCeHkPRus0IQvT9k/7f+VrH35yJtexFunviinO6uA
 Rd0f+dKaCKjYVztVxglPiM7v22OqGv2arnxHRTEV48gO8nuYY/OXhXRxXsWFnsbg6mQr
 R1IcDHMdO070JDnvXNZSEakkd5eKAq+BLHs7cdljM88ZNXXb/LY0dtSyVggkid/uujeN
 n55lVplwD0krJ+dMcFVrLt/hYZSHuGI+7RRGspGhucqzHuFwWA1uDRsSU8dQoUwqeck7
 dkQudgk1fYirJ2/mw3hh87h8BmELuR6DpLWvZAqlKUdHDIxDQfByZrrJpMIugxA9kEUT
 Jv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704142823; x=1704747623;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+XZ4nybj4bZroxHF/K5QreEHMx55uD+jWsZAAJ9ETE=;
 b=qQM8Ib2CBO7XYx/2gfAL+8OSkKFhBr7RtSKegPMxFXGMad61Da3Ymq6whQTHofGjhB
 +zHYBiZZPW7kA20jCTorOt+g9C78UDOVOVEj/QnP+w4nd4LNVA8iodpNvv/e/iKqV9yN
 KtNphnCCSxQNuDMzfORT5IropahqWhEsSezy2LUNrB47lJkUc/vPzabcLhm63rjAaaIR
 MKNVIQOyuSrV3fMepPstNr+qZFzU8RAMwSJEEmYS5Tu/6QBbGdi+UEWLIq5qYA+uhRnt
 ibN9dSgiRmLOZA9EtjB1HaIXGFAM4D8fLGzdUrLOW72+ZmWmH5eGtw9n9N7mELSxdpLy
 XdOA==
X-Gm-Message-State: AOJu0Yx6CmARJfJYk5fjd4qtltiL1NpAp19w65M+iOM2XheDGzEUpdv1
 vKfi6VYo0x5z/dWICxpKU80=
X-Google-Smtp-Source: AGHT+IEyt54Orz1g1iSdDIT58gjh8S+dJZUEQWPhmkpP2Zw9GRBQBsp4FnO+/E+W4japXdG6IOsJrg==
X-Received: by 2002:a2e:a229:0:b0:2cc:df75:79b3 with SMTP id
 i9-20020a2ea229000000b002ccdf7579b3mr3727095ljm.12.1704142822801; 
 Mon, 01 Jan 2024 13:00:22 -0800 (PST)
Received: from hex.my.domain (83.11.207.119.ipv4.supernova.orange.pl.
 [83.11.207.119]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05640200cf00b0055404e08589sm15122045edu.85.2024.01.01.13.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 13:00:22 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Jan 2024 22:00:15 +0100
Subject: [PATCH 1/2] ARM: dts: exynos4212-tab3: add samsung,invert-vclk
 flag to fimd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240101-tab3-display-fixes-v1-1-887ba4dbd16b@gmail.com>
References: <20240101-tab3-display-fixes-v1-0-887ba4dbd16b@gmail.com>
In-Reply-To: <20240101-tab3-display-fixes-v1-0-887ba4dbd16b@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704142819; l=781;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=kgQ6hReH0wzI/acEF9QXTsrDq3bCAXF+wc7FhUZWg+4=;
 b=7ohf2QoqecR3WiauAHzQUR3+ckbuzk8rHVISPaWwZek5KfK2snxhjEVFaYXEd/XhZKmMWgcbW
 mL7cAAnGc+uCDAIE86dOdGOy9C0Y9j499m3IgkJ5UnsF480rkJKSsaU
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

