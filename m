Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE16846CF3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 10:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4506110E2E8;
	Fri,  2 Feb 2024 09:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="h2RupUvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 478 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 09:51:10 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511D110E2E8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 09:51:07 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240202095105euoutp02002923793fdbb98ccacb1740c818b95b~wAuqU1JF51037710377euoutp02I
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 09:51:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240202095105euoutp02002923793fdbb98ccacb1740c818b95b~wAuqU1JF51037710377euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1706867465;
 bh=Bf7rQoU5d3WU3FmKbvnaNCSLH3IiWNFAQPjzDN4h2DA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=h2RupUvMh0R3caFVIp6ukDjpf3fzWFs+JV1u/Kb0qY6dLR29d9EQyrpUo4euQG168
 HLxQYntFu/zqdKtC+CxcW8kaCrk4jF4uG45UQ/0UtISz4ng0eg1ZVxlrAlhnbxeKEt
 B4Bgjcb2z170QYruMReQi59No9xAsDTokL5xk/C8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240202095105eucas1p1aa13c67394f117a9b1c5e2ab9c781273~wAuqCOByy2463424634eucas1p18;
 Fri,  2 Feb 2024 09:51:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8B.A6.09814.80BBCB56; Fri,  2
 Feb 2024 09:51:04 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240202095104eucas1p2df4522cc4a7ee29540db1fb61d8e19fc~wAupfiSY-0953409534eucas1p2F;
 Fri,  2 Feb 2024 09:51:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240202095104eusmtrp15fbe04a3ea76a0b1797f65ac46b92a6d~wAupeseMs2064820648eusmtrp1g;
 Fri,  2 Feb 2024 09:51:04 +0000 (GMT)
X-AuditID: cbfec7f4-727ff70000002656-d3-65bcbb086c8b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 12.C8.10702.80BBCB56; Fri,  2
 Feb 2024 09:51:04 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240202095103eusmtip15e86ad33d27184a8710bda287b9b4121~wAuojslAw2135221352eusmtip1b;
 Fri,  2 Feb 2024 09:51:03 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Russell King
 <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Davis <afd@ti.com>, Mark Brown
 <broonie@kernel.org>, Lee Jones <lee@kernel.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] ARM: multi_v7_defconfig: Enable BACKLIGHT_CLASS_DEVICE
Date: Fri,  2 Feb 2024 10:50:44 +0100
Message-Id: <20240202095044.1980696-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH97v39t5Ls5LrxcVfAME0wQdSfG3zZjSKC4l3Q+MjkiyLDxq5
 A0Ip2MKY/DFRHGLHoLSi0IKiYApsCpSXQBFpllagNkMY6oBgAUOsMoYWw0Nwttc5//ucx/ec
 70kOidITAn8yUZHGKRUyuRgXYs3WeYeEbDdzmx1vtjPTPYUEc/fBNYSZf3oRMEtaK8EUOSdw
 xv58hGDeNBeizMDsNM6UGbSAqXKXEEzHsyaCuZVzFWNM44MCpr+tFGcsRR2AufH7CBFJsf2D
 fSi7uKAFbMercox9UtBEsIX3JGyrfoRgTTXncXZ40Iyzoz/bELah8hSb31gDWNvDFoR9aQra
 L/pWKI3j5Infc8pNO2KFCfnXjCC1QvjDpPOOIAu4SDXwISH1KVxq70fVQEjSVBWAS+et7wI3
 gMbqIQEfvATw2eAQogakV9KYG87njQC2GMbAe0XFPxrMMxentkD1lBr38EoqEbZU2jFPE0pl
 Y3DJUYZ6Cn7Ubni5W+1ljAqBfeUOgWeDiNoJ71T68v6CYWfXPW+LiFoBu0smvPPRt/nsJoPX
 KqQqfKDRkI3xgih4t6bnHftBl62R4DkQ9uryMF5wDsDyxVGEDzQAZk3+BfiuCDjsWMA9LlBq
 A6xt28SfvAveL0jh0Rc+nFrBe/CF2uZLKJ8Wwdwcmp+xFuptN99v7frjPsozC5fNPYiHaeoI
 1P1Zj2rAGv0Hl+k/uEz/v4VygNaAVVy6KjmeU21VcBnhKlmyKl0RH348JdkE3j5i77LNfQsY
 XTPhFoCQwAIgiYpXiqqDWjlaFCc7mckpU44p0+WcygICSEy8ShQSF8zRVLwsjUviuFRO+V8V
 IX38sxA5GlC8uHzbftkv7EKE5EpgxoL1ZGhD8etXlMOQutd0OGbUJK0vrYURTzZjZl1XaVP0
 CfK57Me6xW8Uf7syUKGpQ509WYSvKcmZMvg/pSU3OzWOgbAdqYEHIteLf+kcP7NB4JrDZst+
 y3T1/SQUKE5vG9J9Uic5cqJWmhdT91nf7NmxzI3DM+7deflXqr7bZz4aIIuJjY2iRWHRxWmh
 /fsuzkeF2o3B17cmvAjJDeoO2faR9pIz6PNHravTFAMZ7avbMM2A5SvnwatfJ5VOz0VI5WbX
 IXrMmh9NP47Oky4XuG/oKNy8MCP98sKv4z32ucc7xdVfzH4ceWh7mcu5rm2PGFMlyLaEokqV
 7F96UzfR9wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsVy+t/xu7ocu/ekGhw7JWTx/tREdosT1xcx
 Wfx8OY3R4u+kY+wWUx8+YbM48+Yuu8X/bROZLa58fc9mMXf2JEaLFV9mslvsfb2V3WJH20IW
 i02Pr7FaXN41h83i0NS9jBZrj9xldxDwuHztIrPH71+TGD32flvA4vG0fyu7x8Szuh47Z91l
 99i0qpPN4861PWwe97uPM3lsXlLv0bdlFaPH8RvbmTw+b5IL4I3SsynKLy1JVcjILy6xVYo2
 tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy+hbtJyxYDFXxfOHB1gbGF9xdDFy
 cEgImEhs6dDrYuTiEBJYyiix9eRlpi5GTqC4jMTJaQ2sELawxJ9rXWwQRZ8YJS6e+8UGkmAT
 MJToetsFZosIZEv82XiFBaSIWaCXReLEoyXMIAlhAXeJeSe7wGwWAVWJiwvOsYJs5hWwlziw
 hA9igbzE/oNnwUp4BQQlTs58wgJiMwPFm7fOZp7AyDcLSWoWktQCRqZVjCKppcW56bnFRnrF
 ibnFpXnpesn5uZsYgZG47djPLTsYV776qHeIkYmD8RCjBAezkgjvSrmdqUK8KYmVValF+fFF
 pTmpxYcYTYHOm8gsJZqcD0wFeSXxhmYGpoYmZpYGppZmxkrivJ4FHYlCAumJJanZqakFqUUw
 fUwcnFINTBNm7P25tX2v34GmJXY3TqW5FQt79ZyXFd7hu+wv8+doXvbtimq8ypM/53I2mi+/
 v/fKdDnG3FUbQl9NCj3c1XUz3MN22tRXa28o/DN8XMr8svFz7rxdH1X27Fvwtjw555n+pv45
 8kWab1pEL/ftMm56479a6bWXlsfp/3d8Y/q3+P16ox/yVu/qC0mBWn01sflpfnb/d965bP7o
 wkuZGQwqC3JO73t14XHRl1d689ZHb9/+xMxU99ajmsWzA+L2ujmrlGhN3MqwpnZJZODS0/YG
 O9I73vhwMy/zPGfygtlox1qhU8v/st+5PPtQ3/mSnIUP17rP/73Y+I631bYT+64vbpyvPsGO
 b+Yml7N2cyY8VmIpzkg01GIuKk4EAC+h70VNAwAA
X-CMS-MailID: 20240202095104eucas1p2df4522cc4a7ee29540db1fb61d8e19fc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240202095104eucas1p2df4522cc4a7ee29540db1fb61d8e19fc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240202095104eucas1p2df4522cc4a7ee29540db1fb61d8e19fc
References: <CGME20240202095104eucas1p2df4522cc4a7ee29540db1fb61d8e19fc@eucas1p2.samsung.com>
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

Commit 72fee6b0a3a4 ("fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH")
disabled availablity of the SH_MOBILE_LCDC driver on the RENESAS arch.
This innocent change has a significant side-effect on the ARM's
multi_v7_defconfig, because FB_BACKLIGHT symbol is no longer selected,
what in turn leaves BACKLIGHT_CLASS_DEVICE symbol selected only as
a module. The latter disables some backlight related code in the DRM
core, because the DRM core is set to be compiled-in in this defconfig.
This leaves all DRM display panels without integrated backlight control,
even if the needed modules have been properly loaded and probed.

Fix this by selecting BACKLIGHT_CLASS_DEVICE to be compiled-in in
multi_v7_defconfig.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 8f7445729cd0..b2955dcb5a53 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -777,6 +777,7 @@ CONFIG_FB_EFI=y
 CONFIG_FB_WM8505=y
 CONFIG_FB_SH_MOBILE_LCDC=y
 CONFIG_FB_SIMPLE=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_AS3711=y
 CONFIG_BACKLIGHT_GPIO=y
-- 
2.34.1

