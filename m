Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19705AD177
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7610E314;
	Mon,  5 Sep 2022 11:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25F810E30F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:24:25 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220905112414euoutp0138ed92128e973566c1fa5fd1aa462492~R8x97pUTt0333303333euoutp01W
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:24:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220905112414euoutp0138ed92128e973566c1fa5fd1aa462492~R8x97pUTt0333303333euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1662377054;
 bh=7flYTWURgvZWZJ0bllJwRUFaD/epPd9YT+NmvYtDtng=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=Xuux5+M2XrmAJ8c6OjhTQp3M1kqGWaOo/bv9HtquwNEzW5GrG+oUBgpI7p3aQPqDU
 e+mgVpZ0QTNip/M2e6CGk4RRIz9pGgQJfJ5DZ4S6AYXrLY+84dcpOofAVDrMpazS5O
 h6oJ13mBao4+3f2MNIVQJU4sNFuDACq5ur5wdZ4U=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220905112404eucas1p102451e5139cc449cf30959fe4fc2427c~R8x0rjDPi2163221632eucas1p1j;
 Mon,  5 Sep 2022 11:24:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 9D.53.29727.35CD5136; Mon,  5
 Sep 2022 12:24:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220905112403eucas1p1b3154207ebea4d10684904144e17b3c0~R8x0LYf4s1126311263eucas1p1C;
 Mon,  5 Sep 2022 11:24:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220905112403eusmtrp253635c8319b725b5b58e8174cae82dcb~R8x0FDCaj1852618526eusmtrp22;
 Mon,  5 Sep 2022 11:24:03 +0000 (GMT)
X-AuditID: cbfec7f2-21dff7000001741f-b8-6315dc535ddc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B9.C9.07473.35CD5136; Mon,  5
 Sep 2022 12:24:03 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220905112402eusmtip2e5ae6c1ea62e596e302614549e3dbf29~R8xy4wfX22248922489eusmtip2Z;
 Mon,  5 Sep 2022 11:24:02 +0000 (GMT)
Message-ID: <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
Date: Mon, 5 Sep 2022 13:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>, Marek Vasut <marex@denx.de>
In-Reply-To: <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0xTVxj19r2+lpq611LhinMznXGbycqYbLs4449sc8+pYWaduPGH1vKC
 bKWYFiaOLIKAYR3UUgk/io7GIjCQIQUMkM50TWmraAV0BCylw7FlIiAURFYyGO3Tjf/Od873
 3XO+L5eLCcuIKG6KMp1WKWUKMcHDrzn+dr8hHVorf1Mbh4Y83RjymWZw9MhTR6B7Tx4TqOiy
 m430Ph2OZs06Av013Iuj22fGOei74moOqtVdJ5D593420gR+xFD5nessNH42B6DuB00YupmT
 jyObNhH5DSPL4vmHBOp1+TH0dOE2tiuCapz2sanHA/kc6geDC6dKXHY25S70ElSHwcuhKgsq
 2JTJ8pBF2X81samhfgtB+b53sqiW6tNU82Q7i9K21gNqxvzSJy98wdueRCtSvqZV0TuO8o6b
 GlrAiYYNmQ8G84lsoIcaEMaFZCysWrJyNIDHFZJ1ALaaJwmmmAVw2tMFmGIGwCLvIuv5SO4Z
 O84ItQAau56wmWIawMDICBHs4pM7YH+lHQtinNwES31FOMML4I2K0RBeS8qhweEAQRxO7oXe
 G4EQj5GR8P5oVciNIGOgZkITyiQim9hwYrQklAkLuhXOj4QcwsidsMVRQDDTL8PctkqMyarl
 wauDAgZ/AG/N/flsh3A45mzlMPhFuNQRdOMu4zT4T/lWhs6E/Y+uPHvmPTjkDhDBFox8HTZ1
 RjP0blg414kzk2vgwISACbAG6q+VYQzNhwVnhUz3Zmhw/vSf5y89fZgOiA0rjmJYsbxhxSqG
 /32NAK8HkXSGOjWZVsco6ZMStSxVnaFMlsjTUs1g+e92Lzr97eDi2LTEBlhcYAOQi4lF/KR2
 kVzIT5Kd+oZWpR1RZShotQ2s5+LiSL485apMSCbL0umvaPoErXqusrhhUdmsC/fenl/dvLQa
 Pz2f6cx+NyvPXRCIz3Ecc1kuFW67TxSNKIl10tfKt+2UevZ33q15/9ytVVbBqv1E1ZXDX/7G
 DtMmLKRfTJiwHwwX+r89ZKwVZm1s2hwh3RA9oZU0Kl4Zf+dAerbOO/lpmXpKlOiQ2CSd87Hu
 4Qjj+KStePGox3PyY/1gnH/XbtGhNmzPXVOW4vP4pN639J/Zz8fPebv6tkdbZqd6zl2YGt54
 Z8vPiQMLfxifFrurpbHUVP5lvnS92mf1WHr2NfisrR0fpdUItrblnTrwIS9cGJdbmlhHHcRU
 UbmW+sMlS6/mzR2LvXkkobHUuq6mpKLL1TfWId07uq9ZjKuPy2K2YCq17F+ki5zvKgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsVy+t/xe7rBd0STDT5/FLS4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFob5oi0+zHgIlJ79ks7h44hOzxfffZ5kdxDzW
 frzP6vH+Riu7x7xZJ1g8ppw4wupxrucum8fOWXfZPWZ3zGT1WLznJZPHkauLWT3uXNvD5nG/
 +ziTx+Yl9R4b3+1g8ujbsorR4/MmuQD+KD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj
 81grI1MlfTublNSczLLUIn27BL2Mxas3Mxaslq14dLOVrYFxkkQXIyeHhICJRHPTEZYuRi4O
 IYGljBJXlm1jhUjISJyc1gBlC0v8udbFBlH0nlFi6vkGFpAEr4CdxLXZR5hBbBYBFYlp93uh
 4oISJ2c+AbNFBZIlljTcBxskLOApcffkL7A4s4C4xK0n85lAbDYBQ4mutxALRAS2skq82rYO
 zGEW+MgocWnyFnaI1U1MEn+n/mQHaeEUsJfYfKyDDWKUmUTX1i5GCFteonnrbOYJjEKzkFwy
 C8nGWUhaZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMw4Ww79nPzDsZ5rz7qHWJk
 4mA8xCjBwawkwpuyQyRZiDclsbIqtSg/vqg0J7X4EKMpMDgmMkuJJucDU15eSbyhmYGpoYmZ
 pYGppZmxkjivZ0FHopBAemJJanZqakFqEUwfEwenVAPTVI6cGXIO0auuqf6YzGZldnROluz8
 DV5hb1ZcCWFaevyjRNCz8otOv6c8uz/VYctdacsZ9tvVHu5Pfj9T/Ni2matiJl6qWTgp5d6S
 pebOuhdVmXyEsj8Lq39TCeKquTTz4iomLfOp0l+1Lpzf8bbsoSpT34mTP1XUsi5t28ckXxqi
 ujiN8Yk2b9m0K2+6Jdkr53zdX/vy2qp6NonPQtw3Llb1LeY7tOul6uzn1/mXRkT953qgy3U8
 cHluOUdks8qT9TPiHys8P/JUWjhjr35y7VupV9Hn5nast3eYbhMVuIQ//YKifl7ugzneG36/
 F04zr7LvnvZOjfF79cY7LX3WG4/OjS4PvqCeFidoVfbXXomlOCPRUIu5qDgRAGgNCO7BAwAA
X-CMS-MailID: 20220905112403eucas1p1b3154207ebea4d10684904144e17b3c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <CGME20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180@eucas1p2.samsung.com>
 <20220829184031.1863663-3-jagan@amarulasolutions.com>
 <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

On 02.09.2022 12:47, Marek Szyprowski wrote:
> On 29.08.2022 20:40, Jagan Teki wrote:
>> Samsung MIPI DSIM controller is common DSI IP that can be used in 
>> various
>> SoCs like Exynos, i.MX8M Mini/Nano.
>>
>> In order to access this DSI controller between various platform SoCs,
>> the ideal way to incorporate this in the drm stack is via the drm bridge
>> driver.
>>
>> This patch is trying to differentiate platform-specific and bridge 
>> driver
>> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
>> glue code and samsung-dsim.c as a common bridge driver code.
>>
>> - Exynos specific glue code is exynos specific te_irq, host_attach, and
>>    detach code along with conventional component_ops.
>>
>> - Samsung DSIM is a bridge driver which is common across all 
>> platforms and
>>    the respective platform-specific glue will initialize at the end 
>> of the
>>    probe. The platform-specific operations and other glue calls will 
>> invoke
>>    on associate code areas.
>>
>> v4:
>> * include Inki Dae in MAINTAINERS
>> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
>
> This breaks Exynos DRM completely as the Exynos DRM driver is not able 
> to wait until the DSI driver is probed and registered as component.
>
> I will show how to rework this the way it is done in 
> drivers/gpu/drm/exynos/exynos_dp.c and 
> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...

I've finally had some time to implement such approach, see 
https://github.com/mszyprow/linux/tree/v6.0-dsi-v4-reworked

If you want me to send the patches against your v4 patchset, let me 
know, but imho my changes are much more readable after squashing to the 
original patches.

Now the driver is fully multi-arch safe and ready for further 
extensions. I've removed the weak functions, reworked the way the 
plat_data is used (dropped the patch related to it) and restored 
exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel 
free to resend the above as v5 after testing on your hardware. At least 
it properly works now on all Exynos boards I have, both compiled into 
the kernel or as modules.

>
>> v3:
>> * restore gpio related fixes
>> * restore proper bridge chain
>> * rework initialization issue
>> * fix header includes in proper way
>>
>> v2:
>> * fixed exynos dsi driver conversion (Marek Szyprowski)
>> * updated commit message
>> * updated MAINTAINERS file
>>
>> v1:
>> * don't maintain component_ops in bridge driver
>> * don't maintain platform glue code in bridge driver
>> * add platform-specific glue code and make a common bridge
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>>   MAINTAINERS                             |    9 +
>>   drivers/gpu/drm/bridge/Kconfig          |   12 +
>>   drivers/gpu/drm/bridge/Makefile         |    1 +
>>   drivers/gpu/drm/bridge/samsung-dsim.c   | 1686 ++++++++++++++++++++++
>>   drivers/gpu/drm/exynos/Kconfig          |    1 +
>>   drivers/gpu/drm/exynos/exynos_drm_drv.c |    3 -
>>   drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 -
>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1715 +----------------------
>>   include/drm/bridge/samsung-dsim.h       |   99 ++
>>   9 files changed, 1868 insertions(+), 1659 deletions(-)
>>   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>>   create mode 100644 include/drm/bridge/samsung-dsim.h
>>
>> ...
>
> Best regards

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

