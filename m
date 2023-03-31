Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7426D1E1F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 12:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC0310E034;
	Fri, 31 Mar 2023 10:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6AB10E034
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 10:36:54 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230331103652euoutp0130edd18e9043e3261a5f5f2508a4fd58~Reqt1s7eK1673516735euoutp01e
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 10:36:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230331103652euoutp0130edd18e9043e3261a5f5f2508a4fd58~Reqt1s7eK1673516735euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1680259012;
 bh=sRB1R7r6q9AiZM1bpBhq2czTwkfHcFxDtHME9PfHkgk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=K2rdM3hMKTfJdgglMVR4u2OVrc2vTUZXS2bBJm9UTCmi4QiOTGkMYCBxzy/3Cu/J+
 JNZpM2SNRj4nM0RF2+5jv5THtwL0JK0UPrAOJbv0wLclKlY/WJQp61e1xcMVS9vIYO
 N1oXasCCMTQLNX45b/DsIg4Fj2qlNrrMn/9uKrNU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230331103652eucas1p2833c38b8b82d4dc21e42a0821c1dd7e5~Reqtoe4Fm0050700507eucas1p2Q;
 Fri, 31 Mar 2023 10:36:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 89.17.10014.4C7B6246; Fri, 31
 Mar 2023 11:36:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230331103652eucas1p237ffebb6ddfc0ca72ee364e38b0118d2~ReqtRvRje1954619546eucas1p2F;
 Fri, 31 Mar 2023 10:36:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230331103652eusmtrp1c10649a6100b91d658f5b14091d31c30~ReqtREAtz2248722487eusmtrp1M;
 Fri, 31 Mar 2023 10:36:52 +0000 (GMT)
X-AuditID: cbfec7f5-ba1ff7000000271e-dd-6426b7c46ae0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 51.86.08862.4C7B6246; Fri, 31
 Mar 2023 11:36:52 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230331103651eusmtip10805d3756f00967537a4989bc8e14135~Reqso53Q60572305723eusmtip1D;
 Fri, 31 Mar 2023 10:36:51 +0000 (GMT)
Message-ID: <0d1e8fd9-e2a8-1ddf-943d-58fb3be3a0cf@samsung.com>
Date: Fri, 31 Mar 2023 12:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 0/5] drm/exynos: Convert fbdev to DRM client
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, krzysztof.kozlowski@linaro.org,
 alim.akhtar@samsung.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230330073635.7409-1-tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRmVeSWpSXmKPExsWy7djP87pHtqulGGzeIWdx4voiJosH87ax
 WfzfNpHZ4srX92wWk+5PYLFYOG05o8Xe11vZLc42vWG32PT4GqvFjPP7mCxmTH7JZrHlzURW
 Bx6Pvd8WsHjsnHWX3ePOtT1sHve7jzN5bF5S7/F+31U2j74tqxg9Np+u9vi8SS6AM4rLJiU1
 J7MstUjfLoEr4/GK+2wFi3grui+yNDA+5epi5OCQEDCR+PCpuouRk0NIYAWjxN3Zvl2MXED2
 F0aJ92tnskM4nxkl/qz9yQpSBdJwZH8jG0RiOaPE//f7mCGcj4wSfz99B6viFbCTWLp7IxOI
 zSKgKrH7w0kWiLigxMmZT8BsUYEUid0nn7KD2MICDhIXJnwEizMLiEvcejKfCWSoiMBroNUt
 K5khEnkSF389BVvAJmAo0fW2iw3E5hSwkDjbvIoNokZeYvvbOWAXSQhM55Q4f2wbI8TdLhJz
 TkE0SAgIS7w6voUdwpaROD25hwWioZ1RYsHv+0wQzgRGiYbnt6C6rSXunPvFBgoyZgFNifW7
 9CHCjhKb7s9lhoQkn8SNt4IQR/BJTNo2HSrMK9HRJgRRrSYx6/g6uLUHL1xinsCoNAspXGYh
 +X8WkndmIexdwMiyilE8tbQ4Nz212DgvtVyvODG3uDQvXS85P3cTIzCxnf53/OsOxhWvPuod
 YmTiYDzEKMHBrCTCW2ismiLEm5JYWZValB9fVJqTWnyIUZqDRUmcV9v2ZLKQQHpiSWp2ampB
 ahFMlomDU6qBac7O2ZJfGbfkh1Q7mP+TVru1N1T9YICygL3p9k0dZjzC/6ez/fu92/VxP/Pa
 zX1+Qdn2yS9C/ApPMZ3fxXhixpl/PLdfvp7gfrtcundy4w1utegFX4+tbJzRGs2s3mS26aRU
 +lZer9r9W584sz7SmMB87JqNy327v0zsXHcPM/OFqkRoRu5ena9p5v9+nu/SLQ+5f634J2Zk
 s9t5Xe0H8Xt7FYNP1G8JfCYgff4yp320lIxexV29v/PmL9Gc41ZfvbeLqSoopXXyC5fvdeey
 uI8Z7Xnx9nHeAS6WJPfyHM1Lx0M5n/6WiePb1HZ3Q21QvkLKjH0sS36su9m0T7rFV/dvMevB
 Fv69C1ymd5g/UGIpzkg01GIuKk4EAAQwNdDbAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xu7pHtqulGEydyWlx4voiJosH87ax
 WfzfNpHZ4srX92wWk+5PYLFYOG05o8Xe11vZLc42vWG32PT4GqvFjPP7mCxmTH7JZrHlzURW
 Bx6Pvd8WsHjsnHWX3ePOtT1sHve7jzN5bF5S7/F+31U2j74tqxg9Np+u9vi8SS6AM0rPpii/
 tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4/GK+2wFi3gr
 ui+yNDA+5epi5OSQEDCROLK/ka2LkYtDSGApo8S1x83sEAkZiZPTGlghbGGJP9e6oIreM0ps
 Ov+GDSTBK2AnsXT3RiYQm0VAVWL3h5MsEHFBiZMzn4DZogIpErsmLAWrERZwkLgw4SNYnFlA
 XOLWk/lMIENFBF4zSqzYsRYqkScxefsCJoht3YwSX1YtAkuwCRhKdL3tAtvMKWAhcbZ5FRtE
 g5lE19YuRghbXmL72znMExiFZiE5ZBaShbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66
 XnJ+7iZGYDRvO/Zz8w7Gea8+6h1iZOJgPMQowcGsJMJbaKyaIsSbklhZlVqUH19UmpNafIjR
 FBgaE5mlRJPzgekkryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qB
 yXXegdAo99BH5dPFV/3iXTvVu63fUGLKQzYRw5Z3E1UtK8QMA5OUP2rtka27dFxpaeFNhklP
 9pQkZlQGvuA5LPiY2Uz8sc/Jyrshf7/NEjh723PDc539DWUl1ns3ylkJGRlUPL3wYd/cwMkp
 s4o91Eu/XklTf3+Rt2ZNO9eTw/ovn/a/6/kj0HxVQpN1/+Q+rlA19XhtNpFCAY1uVqdw65V9
 bgeLo6/Y26akyCbN+ztTd/a7Eu8JH7X5hay26Hbv2t7YWaAsl1Z5xOnQ26nLJG5PZPrx5Cfn
 AamHbH+lDF0lozx0hC14PdMmyflNtbXdFfZkyYSr1Yfv7XgmlPx3kcvmr/9e9+pqTqsq9jmj
 xFKckWioxVxUnAgAT/b+G28DAAA=
X-CMS-MailID: 20230331103652eucas1p237ffebb6ddfc0ca72ee364e38b0118d2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230330073654eucas1p26d62d618ad8792ec4f2adcce8cfc2414
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230330073654eucas1p26d62d618ad8792ec4f2adcce8cfc2414
References: <CGME20230330073654eucas1p26d62d618ad8792ec4f2adcce8cfc2414@eucas1p2.samsung.com>
 <20230330073635.7409-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.03.2023 09:36, Thomas Zimmermann wrote:
> Convert exynos' fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in exynos is now just
> another DRM client that runs after the DRM device has been registered.
>
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
>
> I did the conversion from similar experience with other drivers. But I
> don't have the hardware to test this. Any testing is welcome.

Seems to be working fine. Tested with default framebuffer based console 
and simple tool that writes RGB data to /dev/fb0.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> Thomas Zimmermann (5):
>    drm/exynos: Remove exynos_gem from struct exynos_drm_fbdev
>    drm/exynos: Remove struct exynos_drm_fbdev
>    drm/exynos: Remove fb_helper from struct exynos_drm_private
>    drm/exynos: Initialize fbdev DRM client
>    drm/exynos: Implement fbdev emulation as in-kernel client
>
>   drivers/gpu/drm/exynos/exynos_drm_drv.c   |  13 +-
>   drivers/gpu/drm/exynos/exynos_drm_drv.h   |   2 -
>   drivers/gpu/drm/exynos/exynos_drm_fb.c    |   2 -
>   drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 174 +++++++++++-----------
>   drivers/gpu/drm/exynos/exynos_drm_fbdev.h |  20 +--
>   5 files changed, 94 insertions(+), 117 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

