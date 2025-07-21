Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B4B0BFDB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1198A10E4A9;
	Mon, 21 Jul 2025 09:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B5410E4AF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:18:21 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-adfb562266cso663414766b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 02:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753089500; x=1753694300;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=petoWFIc1yVrUA7vb5hl0SJbICvldq7drqIuMNaVr3w=;
 b=PS8pppf/onJp4iWYma3v0i4ybOOWbaw0zINCoHnpPaFLKdj7yrdN6F91pA3GE5RGTe
 6YOh+elpzVB/LWmwqGTT5HId4ga4ySpiXtATOSpHf6LgSJfIKgXxpeRx/l+y6/DRftqd
 GuU4wjzihDEh1+ciwBlQdJYc+FEMglNAqLgYbg56cLsFgtFPde9kh+Yinw85k6Jzo6eA
 9KjPP27cd3WpzVwZd17jD8+PuQS/6UT08ZkpscroJqOWR0phDMCRSAfNtQKQG0F4lhds
 wFULr9W0ULN2Ee71z72XHmhH/AGo0D738jSdMjg2UYqVgELYuSHllVDMt6czOJx65jwt
 Ph0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0AO43L3TRDYhY12hTsb9W7YRc9pVVfs+jz+nHJ8jjQSd6xLI6V2tjMXEjn+X8o5Jas7bsnPwrreU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTwGUNTfWTOMJA8EOBn1VapY9Am17UtDbcQKBALLc/QMxxcMHW
 7zr2mlmGJ3+ySfaJ5XN9Ktuvtxk/Vs0tU+2YDfqcCsh2dORfBl9adD8s
X-Gm-Gg: ASbGncvXrXxh8IhK2TFIgo4NblW6v/ITLXeWE6fOxAhiqV6bjYq1+4k9qOK/xjJ6oQd
 h9sQ1p1Aa6/B34TLvV5eOVxz1+5AswMaWb4WyLw82HDehe/TFXmyTBITO//1TatE5bYHMd7Q4aH
 qBXf3hNvUZCHASltC5PZIJKh1JNoW+s9jZkiYoB+foheP7qCAYZEWeoaWRInCUxtddcgRTgLwm7
 X/Oli+SRY6hV/F4JZ2QQ8FbUZgZ1xqGanusWGmqwll2yjsPIY5M2vmEdZREj8DjmmzbCSDtLQiv
 WDSMA+ReGmflBF2FFdnlz3uDNKd/A83unQx8BRAlinjCmXRxGSma1zDkPjjysIQ5IjioYg3ujCj
 1FHh/ovr7s8gkRB0vVTwPS6KSJ6cuT6pwLyw6YyZ7iD0CFeX47WJ4Xyp5
X-Google-Smtp-Source: AGHT+IGczU3qNrxFunoCGEDGeA0G1E/ZGSoC4F1+GJF6HBHUDUmYhKpCzIqdyOaA9bUQmJSSnrGq0Q==
X-Received: by 2002:a17:907:7b8f:b0:ae0:b33d:2a4a with SMTP id
 a640c23a62f3a-ae9c9ac0695mr1863454666b.35.1753089499696; 
 Mon, 21 Jul 2025 02:18:19 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 02:18:19 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:34 +0200
Subject: [PATCH v9 07/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-7-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU of the RK3588 has an external supply. This supply also affects
the power domain of the NPU, not just the NPU device nodes themselves.
Since correctly modelled boards will want the power domain to be aware
of the regulator so that it doesn't always have to be on, add a label to
the NPU power domain node so board files can reference it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 70f03e68ba550d6b9142131dcca86e8ded36e2f1..1eddc69fd9c9ed95cdc810ba48d9683e3f82489a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -841,7 +841,7 @@ power: power-controller {
 			status = "okay";
 
 			/* These power domains are grouped by VD_NPU */
-			power-domain@RK3588_PD_NPU {
+			pd_npu: power-domain@RK3588_PD_NPU {
 				reg = <RK3588_PD_NPU>;
 				#power-domain-cells = <0>;
 				#address-cells = <1>;

-- 
2.50.0

