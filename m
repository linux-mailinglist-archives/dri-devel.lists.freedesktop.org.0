Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EE4472BDB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 13:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998C810E774;
	Mon, 13 Dec 2021 12:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6677710E774
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 12:04:16 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211213120414euoutp012247d5c04c49d45df7ed7a3f22677982~ATu9TIMSc0509505095euoutp01P
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 12:04:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211213120414euoutp012247d5c04c49d45df7ed7a3f22677982~ATu9TIMSc0509505095euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1639397054;
 bh=3ck8LHjCQ1JFwTRWtkUx32p5FyIEn4RntPCyvSe+7a4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=G7HetlAkNvEF/qewmlZk4p+ihEEkSvZ+DZqEsxrQzR6+GyuuzNXlanO1AicbH19+D
 QMN+CktWvBJyqXEdKW1yCq3B50lKerBm1Bp/H4EfmlHtKBQZ7pclxx4WY1ZG3KMyEy
 t6nrJ3SFZ481Wyi87E4HuoYxQUuZ/cua7K+BnLMY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211213120413eucas1p1d7aed0847c049eb4ade1b48302ca5e80~ATu8_LVWP1504715047eucas1p1o;
 Mon, 13 Dec 2021 12:04:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0F.2E.09887.DB637B16; Mon, 13
 Dec 2021 12:04:13 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211213120413eucas1p2b302a89f2ac7384196d224a8fe49f626~ATu8dco2n1548315483eucas1p29;
 Mon, 13 Dec 2021 12:04:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211213120413eusmtrp22a8da88d69d5c182ee214591425d5a43~ATu8ZdTaM1592815928eusmtrp2O;
 Mon, 13 Dec 2021 12:04:13 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-73-61b736bd6231
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 3B.32.09522.DB637B16; Mon, 13
 Dec 2021 12:04:13 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211213120412eusmtip1001a53d087f9dbbd3461af9153cb67ab~ATu7uufAs0339903399eusmtip1F;
 Mon, 13 Dec 2021 12:04:12 +0000 (GMT)
Message-ID: <9c1f6bed-2a62-4d85-1bd0-95c0bd5f6c89@samsung.com>
Date: Mon, 13 Dec 2021 13:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3 0/7] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20211212181416.3312656-1-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsWy7djPc7p7zbYnGlw4o29xf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJUYyuLxaG+aItPsx4yW6z4uZXRgctj7cf7rB7vb7Sy
 e8zumMnqsXjPSyaPO9f2sHnc7z7O5LFk2lU2j74tqxgDOKK4bFJSczLLUov07RK4Mp69385e
 sECw4n3vLdYGxia+LkZODgkBE4l3b94xgthCAisYJSbM8u1i5AKyvzBKTLp9jRXC+cwo0fBx
 B1sXIwdYR//WNIj4ckaJn38fMEE4HxklHq/eDzaKV8BOYsHOj0wgNouAqsS5w5tYIeKCEidn
 PmEBsUUFkiRaO/6A1QgLOEj8f/kJrIZZQFzi1pP5YENFBB4xSTz98x8q4S7x9M02ZhCbTcBQ
 outtFxuIzSngJHHr0w2oGnmJ5q2zmUGaJQT6OSXetL5kgXjUReLPsm5GCFtY4tXxLewQtozE
 /50Q2yQEmhklHp5byw7h9DBKXG6aAdVhLXHn3C9wADALaEqs36UPEXaU2LnkDTRc+CRuvBWE
 OIJPYtK26cwQYV6JjjYhiGo1iVnH18GtPXjhEvMERqVZSOEyC8n/s5C8Mwth7wJGllWM4qml
 xbnpqcVGeanlesWJucWleel6yfm5mxiBCez0v+NfdjAuf/VR7xAjEwfjIUYJDmYlEd6X1lsT
 hXhTEiurUovy44tKc1KLDzFKc7AoifMmZ25IFBJITyxJzU5NLUgtgskycXBKNTBtPxj72Hqu
 5u2Q9Ym3ZJYY2vP0JBuGt39uaJ658niyboC2/8z2aEvTCJabB1r1TvE9Wiqg2P6xnyF9ne0n
 CbdZ7y9USW4R/bBFjeOO87wb2e3qFf3PqwT/3loYnGnLztDqyjGrOGbqsZYPfA75U/tvvDkQ
 sClKRfrMnM5JU/MPOYWsuMd/bd1WkVk8V8WsfAXZcoM3GF3tPdo7M+9R4to9VnE/eg6durjv
 RY/YZValfR+Fvk7YuMPV8tTn1YqfVm+tfeZza8PTr+YRpaontjVwWTC3lHMd/57r9KdrY+rh
 IpXlfC6liYZdF0PYDur/VjrKxGkXKrYk//Gh3L0VCf69YpcXf1lyor2sauukTlclluKMREMt
 5qLiRACK8ATbzwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsVy+t/xu7p7zbYnGrQ0cFrcX/yZxeLK1/ds
 FpPuT2Cx+LJpAptF58Ql7BbLJ+xjszjV2Mpicagv2uLTrIfMFit+bmV04PJY+/E+q8f7G63s
 HrM7ZrJ6LN7zksnjzrU9bB73u48zeSyZdpXNo2/LKsYAjig9m6L80pJUhYz84hJbpWhDCyM9
 Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jGfvt7MXLBCseN97i7WBsYmvi5GDQ0LA
 RKJ/a1oXIxeHkMBSRollr2cxdTFyAsVlJE5Oa2CFsIUl/lzrYoMoes8osfHMDEaQBK+AncSC
 nR/BGlgEVCXOHd7EChEXlDg58wkLiC0qkCSxe91WNhBbWMBB4v/LT2A1zALiEreezGcCGSoi
 8IxJ4uimtVAJd4mnb7Yxg9hCAlMZJT7N9gex2QQMJbredoEN4hRwkrj16QZUvZlE19YuRghb
 XqJ562zmCYxCs5DcMQvJvllIWmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMGK3
 Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuF9ab01UYg3JbGyKrUoP76oNCe1+BCjKTAwJjJLiSbn
 A1NGXkm8oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2ampBahFMHxMHp1QD03r5m6tl9Jfp
 yp15XhJ9tor//Ibs+ZsNZHO8a874m24JMnuXu3nZzspt2YbeJc/FPz5a8eK4fc2yts01C4V+
 soWrFi9wYJNp/bPdTUoz4YzdvLIJmtESDw58PLFz0yb2KZPP/FGXcqx8piV3anltY8ntF7JT
 rqfO+/7ZOp07TD/vEM+EZJlNHH/DPly8s2ZK2eG55wX5w5clb5ArqAqSX//W41yj/xfmyd+n
 d23lN5Mq3Hhts722bE2yZc2aR4L/XpW5nT6mvXZe9JQ2Lk/mnGv3HOe0TWM/xDS9UkN/T/O9
 Rb0fdkXf49sY/23tm8sp/CouO1aHRUxQSWTbde72pdC47zyG+vuNg55Fh7Hd36LEUpyRaKjF
 XFScCACUoaKjYQMAAA==
X-CMS-MailID: 20211213120413eucas1p2b302a89f2ac7384196d224a8fe49f626
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0
References: <CGME20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0@eucas1p2.samsung.com>
 <20211212181416.3312656-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Jagan,

On 12.12.2021 19:14, Jagan Teki wrote:
> Updated series about drm bridge conversion of exynos dsi.
>
> Patch 1: panel checker
>
> Patch 2: panel_bridge API
>
> Patch 3: Bridge conversion
>
> Patch 4: pree_enable, post_disable
>
> Patch 5: Atomic functions
>
> Patch 6: atomic_set
>
> Patch 7: DSI init in enable
>
> [1] https://patchwork.kernel.org/project/dri-devel/cover/20211210191922.2367979-1-jagan@amarulasolutions.com/
>
> Any inputs?

I've checked this patchset on Exynos based Trats2 board (the one with 
simplest display pipeline: Exynos FIMD -> Exynos DSI -> s6e8aa0 DSI 
panel). DRM stops working after the 2nd patch ("[PATCH v3 2/7] drm: 
exynos: dsi: Use drm panel_bridge API"):

# dmesg | grep drm
[    2.511893] [drm] Exynos DRM: using 11c00000.fimd device for DMA 
mapping operations
[    2.518653] exynos-drm exynos-drm: bound 11c00000.fimd (ops 
fimd_component_ops)
[    2.535699] exynos-drm exynos-drm: bound 11c80000.dsi (ops 
exynos_dsi_component_ops)
[    2.543912] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
[    2.556107] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on 
minor 0
[    2.573212] exynos-dsi 11c80000.dsi: [drm:exynos_dsi_host_attach] 
*ERROR* failed to find the bridge: -19
[    2.653553] [drm] Initialized lima 1.1.0 20191231 for 13000000.gpu on 
minor 1

# ./modetest -c -Mexynos
Connectors:
id      encoder status          name            size (mm) modes   encoders

Applying the whole patchset doesn't fix anything.


> Jagan.
>
> Jagan Teki (7):
>    drm: exynos: dsi: Check panel for panel helpers
>    drm: exynos: dsi: Use drm panel_bridge API
>    drm: exynos: dsi: Convert to bridge driver
>    drm: exynos: dsi: Separate pre_enable, post_disable code
>    drm: exynos: dsi: Switch to atomic funcs
>    drm: exynos: dsi: Get the mode from bridge
>    drm: exynos: dsi: Move DSI init in bridge enable
>
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 240 ++++++++----------------
>   1 file changed, 75 insertions(+), 165 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

