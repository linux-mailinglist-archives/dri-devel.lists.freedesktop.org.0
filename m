Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232B6846CF6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 10:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5412A10E48A;
	Fri,  2 Feb 2024 09:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Jt1vo41j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45DE10ED4D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 09:51:55 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240202094307euoutp012bc353d7526cc00232e4d8810aac6b8d~wAntBn9Q80996509965euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 09:43:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240202094307euoutp012bc353d7526cc00232e4d8810aac6b8d~wAntBn9Q80996509965euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1706866987;
 bh=axH9rp1XzowN5Ts+jZdt6sEzxE9S8CWrn90hD1cZ2PY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Jt1vo41jRaAF58swLBeO3SoekqCTRSK9vT/tVCYqIL+6P0Gblpm5X2O4+AdD9VbPQ
 VosrBFCXEq8aERUCkQAGa5N3EmXfQ7IREzSX5T0PaPEja5f/eDpc3AqrhcrblT87mW
 jUzH7NGcVYklgslDoSlyWOSO0T77PhpkZk5JbIMI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240202094306eucas1p2bbdf8cad9ce00432599a9c4fdbc4a1be~wAnsqImw_2034520345eucas1p21;
 Fri,  2 Feb 2024 09:43:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id AF.F4.09814.A29BCB56; Fri,  2
 Feb 2024 09:43:06 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240202094306eucas1p2232e5a440da112a5864d7bea83ac2e25~wAnsLoBgR0333603336eucas1p2j;
 Fri,  2 Feb 2024 09:43:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240202094306eusmtrp2c678e2ef96f6fc4c3e1a5ce19d8d7770~wAnsKgGQe1936519365eusmtrp2K;
 Fri,  2 Feb 2024 09:43:06 +0000 (GMT)
X-AuditID: cbfec7f4-727ff70000002656-d3-65bcb92a00c7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 49.61.09146.A29BCB56; Fri,  2
 Feb 2024 09:43:06 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240202094305eusmtip148afa28ecd6a7bc0c47560a47a43221a~wAnrRJxTY1680716807eusmtip1i;
 Fri,  2 Feb 2024 09:43:05 +0000 (GMT)
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
Subject: 
Date: Fri,  2 Feb 2024 10:43:00 +0100
Message-Id: <20240202094300.1875944-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKKsWRmVeSWpSXmKPExsWy7djPc7paO/ekGux5oG3x/tREdosT1xcx
 Wfx8OY3R4u+kY+wWUx8+YbM48+Yuu8X/bROZLa58fc9mMXf2JEaLFV9mslvsfb2V3WJH20IW
 i02Pr7FaXN41h83i0NS9jBZrj9xldxDwuHztIrPH71+TGD32flvA4vG0fyu7x8Szuh47Z91l
 99i0qpPN4861PWwe97uPM3lsXlLv0bdlFaPH8RvbmTw+b5IL4I3isklJzcksSy3St0vgyrhy
 ZwJjwTuuipXz3zA2MK7h7GLk5JAQMJF4vuAHYxcjF4eQwApGidenvkM5Xxgl7j+8ywRSJSTw
 mVFiZ3cATMeth2/ZIIqWM0r82bqCDa5j/Zxr7CBVbAKGEl1vu9hAbBGBTIntS86wgBQxCzSz
 SPw9N5cZJCEswCmxqfs8WAOLgKrE3xnvWEBsXgF7icnPj7FArJOX2H/wLDNEXFDi5MwnYHFm
 oHjz1tnMIEMlBGZzSuy8v4K1i5EDyHGRWLRDGaJXWOLV8S3sELaMxP+d85kg6tsZJRb8vg/l
 TGCUaHh+ixGiylrizrlfbCCDmAU0Jdbv0ocIO0psfvyQHWI+n8SNt4IQN/BJTNo2nRkizCvR
 0SYEUa0mMev4Ori1By9cYoawPSTav3+FhmisxNS1ixknMCrMQvLZLCSfzUK4YQEj8ypG8dTS
 4tz01GKjvNRyveLE3OLSvHS95PzcTYzAlHj63/EvOxiXv/qod4iRiYPxEKMEB7OSCO9KuZ2p
 QrwpiZVVqUX58UWlOanFhxilOViUxHlVU+RThQTSE0tSs1NTC1KLYLJMHJxSDUyRC23vrcgJ
 3+iwi2P+SvbvcuvXdT82+yi25UnS1ifcf9hvmv3udtVflrJJLfOShEbaAsdl/L1mkXufsczi
 Eaw93ut26/8ypZYksW/VUf3SjUJxlfoZNd86G+J+HHmkYPy/fnLkSkdv63kv3zBZPY//2VV2
 s29nf9PVna6GVbxb9qpYX3wpkbvpRvy5fwb73sQcLt3iqC1h9ntP2M6JsbkfXs0RXRK+tMLz
 07+HR9X3J7lnf3jza2PCYW73N+LlR3oM7oslvJ/StO2Vqs4isyXmMf+y1CP/BE9+7N+RH/yo
 1vv9rLB/gve+s6gteRE8b/+FGb13zCM/l59lOu3W8FVT7BJ7TfeFe4u7vDcyVvYrsRRnJBpq
 MRcVJwIAs7F7UPgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7paO/ekGlx7zGXx/tREdosT1xcx
 Wfx8OY3R4u+kY+wWUx8+YbM48+Yuu8X/bROZLa58fc9mMXf2JEaLFV9mslvsfb2V3WJH20IW
 i02Pr7FaXN41h83i0NS9jBZrj9xldxDwuHztIrPH71+TGD32flvA4vG0fyu7x8Szuh47Z91l
 99i0qpPN4861PWwe97uPM3lsXlLv0bdlFaPH8RvbmTw+b5IL4I3SsynKLy1JVcjILy6xVYo2
 tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy7hyZwJjwTuuipXz3zA2MK7h7GLk
 5JAQMJG49fAtWxcjF4eQwFJGib/ru1kgEjISJ6c1sELYwhJ/rnVBFX1ilPiw6SwbSIJNwFCi
 620XmC0ikC3xZ+MVFpAiZoFeFokTj5YwgySEBTglNnWfZwexWQRUJf7OeAe2gVfAXmLy82NQ
 2+Ql9h88ywwRF5Q4OfMJWJwZKN68dTbzBEa+WUhSs5CkFjAyrWIUSS0tzk3PLTbUK07MLS7N
 S9dLzs/dxAiMxm3Hfm7ewTjv1Ue9Q4xMHIyHGCU4mJVEeFfK7UwV4k1JrKxKLcqPLyrNSS0+
 xGgKdN9EZinR5HxgOsgriTc0MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCU
 amASnXLFYbPTZt4nE9bbsMyZtrcvgN0kd7Vvyb3JQrbJjIEf5tvMiTb7uCqST3vudc5bk6r7
 /vrkp4XxiJ2LeSJ1Q8jl9v4qNeEn76IFuo/b1H5ttn4s9yVzn/Qcbx0uZvnHvN+cl8lsvPpm
 3q4/rxO3TFD95dWfw3hGV27jje6gmcdfRh+e0rlt7a9We4HnDr96tnNphf8oKLYQEZ7bdnLL
 XzkOyTSfuhnPdZXUOw9F9lb9iJEpbgtTmjHDz/L/LjfpjqxfpzTnrMtsq+/o3affsugzq3aU
 71GPL1elOcNlTiet8tvBcbs23rH234YoIYep759dquKY+0DeXGNSd6pd5LS7Bqmn75hstXRO
 f6bEUpyRaKjFXFScCAChw1KETwMAAA==
X-CMS-MailID: 20240202094306eucas1p2232e5a440da112a5864d7bea83ac2e25
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240202094306eucas1p2232e5a440da112a5864d7bea83ac2e25
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240202094306eucas1p2232e5a440da112a5864d7bea83ac2e25
References: <CGME20240202094306eucas1p2232e5a440da112a5864d7bea83ac2e25@eucas1p2.samsung.com>
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

Subject: [PATCH] ARM: multi_v7_defconfig: Enable BACKLIGHT_CLASS_DEVICE

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

