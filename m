Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F0C2610CE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8BA6E7E2;
	Tue,  8 Sep 2020 11:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97BC6E7D9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:18 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113716euoutp02bca4272468f7a7ff6befa5011467d07f~yy_z_C87r0099700997euoutp02H
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200908113716euoutp02bca4272468f7a7ff6befa5011467d07f~yy_z_C87r0099700997euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565036;
 bh=EHIPiCsP6+EBTPA70jdMAHPbGC9Ru4tdCPsKuauXX10=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=D1G2dvPjSqdqWIDsXk6cd6cysNKM1Tjs3L+cpikP2X3ntpzvuZ/WtMALckD/ySr8m
 4ksKJi8d23xTkeWPmCu12CAAU9C0h+rYQ7wb8af68rwK/Q/LgefVGY10ftP/FWVePJ
 KUpe7/Ypyh8vEa847/Bm0DH+H23A27f9/lCfPz1w=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200908113716eucas1p26d54b11bf79e4e64f958932054c85698~yy_zwFGvi2028820288eucas1p2J;
 Tue,  8 Sep 2020 11:37:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DF.45.05997.CEC675F5; Tue,  8
 Sep 2020 12:37:16 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113715eucas1p24824cc43d260e04b6bc2ddbd146b6673~yy_zZPlz23077930779eucas1p2D;
 Tue,  8 Sep 2020 11:37:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200908113715eusmtrp2f5c113360443c68dec92b751de7f6275~yy_zW_ODq3046530465eusmtrp2J;
 Tue,  8 Sep 2020 11:37:15 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-ae-5f576cec7dfb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 00.D1.06314.BEC675F5; Tue,  8
 Sep 2020 12:37:15 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113714eusmtip29ca97490ca12427a9b62f099359ca829~yy_yiViA11658216582eusmtip2U;
 Tue,  8 Sep 2020 11:37:14 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 00/12] video: fbdev: use generic power management
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <7660f403-ff17-04c2-91d3-1d1ff0510e87@samsung.com>
Date: Tue, 8 Sep 2020 13:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e0+dhVvXpePo4bRjKAwewo/e9iTuAhhCT0oypZeNJwPtmZl
 0cPQUmn5yKSbpphomVmsMjccwcp8rIyyTFMxyMA0c9qKNLOcd5L/fc453+/vnC/8GEJxnvZj
 jiQeFTSJKrWSdiVrn4+9WvpVvSdqee8VEo9l22lcnhaHz/W+RniyalyO3/4YpvHAi7s0Nnxq
 p3CT3kbhy61WEmd96idxm6mIxpYCM8LVz27K8a2xRwibCysoXNedKcPl9cPURg++rf01wRvF
 HjlfatDxtZZ2kjdUZdL8k+JqOd+b3SjjH5Sf4X//ykf837R+OV9+9R3NF5v0iP9uCNjB7nNd
 FyOoj6QImmVhh1zj6lsikru9jxtzS6mzqMEjC7kwwK2GwYE+Igu5MgruFoKhV2YkFXYEzePN
 pFR8R/AiXU/PWGy5Zrk0qETQXmNwqoYQ1FgbCIeK5tZA7oUq5OC5HA/6nkGZgz25IHjTIMoc
 BoLrIuHGYIvcMWC5MMjsyps2kNxCmBDLptmL2wujH59SksYDmq/1kQ524TbAo6Z3048SnA98
 6Ctx8nx4PFQ0nQi4hwyYO22UdPdWGKmvdmaYCwOND+USz4O/xhKZZKhB8Odiv9P9GEFl/qTT
 sRa6W8enmJlasRjumZZJ7U1gS89EjjZwc6BjyEM6Yg7k1RYSUpuFixkKSb0I7lfcp2fWZhlv
 EzlIKc6KJs6KI86KI/7fW4rIKuQj6LQJsYJ2ZaJwLFirStDqEmODo5MSDGjqa1onG+11yDRx
 2II4BindWFv47igFpUrRnkiwIGAIpSe7+aX1oIKNUZ1IFTRJURqdWtBakD9DKn3YVWVfDii4
 WNVRIV4QkgXNzFTGuPidRSXzii/Z2364BAWcCak91dnf4jZK+Ee8X5CaFNnbc/JzUIBahO2+
 sdb9ezNGq6MLhn+ylr4LGzLMIV7eviPUnSLx+vqO7G+7GU38tkI9Eb9EHfeghNvZ4V4WvSaQ
 DT2t89lVp4zsCLdHpZvcfYUtxpziidAQr/qKnrfWz36BaVuUpDZOtWIJodGq/gFz83HulgMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsVy+t/xe7qvc8LjDZZN1bH42f2FzWJJU4ZF
 4/2LjBb/Vv1it7jy9T2bxasza9ksNj2+xmpxou8Dq0X/udMsFl2PX7BYXN41h83i0NS9jBZr
 jixmt1jxcyujxd7py1gtdtzpZLJYsuc9q4Ogx+VrF5k9ds66y+6xYFOpx7ZD11g8Nq3qZPPY
 P3cNu8f97uNMHpuX1Hv8/jGZ0eN/0wt2jyXTrrJ5zN3Vx+jxeZNcAG+Unk1RfmlJqkJGfnGJ
 rVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaeU/4Fd8Qqdk5cwNrAeFSw
 i5GTQ0LAROLDxL3sXYxcHEICSxklNj/cA+RwACVkJI6vL4OoEZb4c62LDaLmNaPE2/NTmUAS
 bAJWEhPbVzGC2MICHhJ9d1+DxUUEdCQuHZ3FBNLALHCbReJGey8TRPckRol7W36AVfEK2El0
 3p4E1s0ioCLxZ9YiMFtUIELi8I5ZjBA1ghInZz5hAbE5Bewltp64CtbLLKAu8WfeJWYIW1zi
 1pP5UHF5ie1v5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93
 EyMwRWw79nPzDsZLG4MPMQpwMCrx8H7wCosXYk0sK67MPcQowcGsJMLrdPZ0nBBvSmJlVWpR
 fnxRaU5q8SFGU6DnJjJLiSbnA9NXXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC
 1CKYPiYOTqkGxk43lfXFTTrf3Of+6I6oXeRUccrYPMhtyZ0f0sJKbinvDnvd37rw8AH57O1f
 TMIKJ6RztUgyrP4tWK1fe5dN0M7bdP7qC8x7pm/+JvjnfH7H3g1SPbxVJ1QubPhRftHWef35
 uEPKD2XOPzjxaWLM4VK1lHslqpxVly916ZkeNp2xVHtngqeKvhJLcUaioRZzUXEiALK1rWon
 AwAA
X-CMS-MailID: 20200908113715eucas1p24824cc43d260e04b6bc2ddbd146b6673
X-Msg-Generator: CA
X-RootMTR: 20200819185901eucas1p2a6c54c905c199e6a04de8477cfa6539e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200819185901eucas1p2a6c54c905c199e6a04de8477cfa6539e
References: <CGME20200819185901eucas1p2a6c54c905c199e6a04de8477cfa6539e@eucas1p2.samsung.com>
 <20200819185654.151170-1-vaibhavgupta40@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Bjorn Helgaas <bjorn@helgaas.com>, Paul Mackerras <paulus@samba.org>,
 Andres Salomon <dilinger@queued.net>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/19/20 8:56 PM, Vaibhav Gupta wrote:
> Linux Kernel Mentee: Remove Legacy Power Management.
> 
> The purpose of this patch series is to upgrade power management in video fbdev
> drivers. This has been done by upgrading .suspend() and .resume() callbacks.
> 
> The upgrade makes sure that the involvement of PCI Core does not change the
> order of operations executed in a driver. Thus, does not change its behavior.
> 
> In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
> helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
> pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
> their job.
> 
> The conversion requires the removal of those function calls, change the
> callbacks' definition accordingly and make use of dev_pm_ops structure.
> 
> All patches are compile-tested only.
> 
> Test tools:
>     - Compiler: gcc (GCC) 10.1.0
>     - allmodconfig build: make -j$(nproc) W=1 all
> 
> Vaibhav Gupta (12):
>   fbdev: gxfb: use generic power management
>   fbdev: lxfb: use generic power management
>   fbdev: via-core: use generic power management
>   fbdev: aty: use generic power management
>   fbdev: aty128fb: use generic power management
>   fbdev: nvidia: use generic power management
>   fbdev: savagefb: use generic power management
>   fbdev: cyber2000fb: use generic power management
>   fbdev: i740fb: use generic power management
>   fbdev: vt8623fb: use generic power management
>   fbdev: s3fb: use generic power management
>   fbdev: arkfb: use generic power management
> 
>  drivers/video/fbdev/arkfb.c                  | 41 ++++++-------
>  drivers/video/fbdev/aty/aty128fb.c           | 51 ++++++++++------
>  drivers/video/fbdev/aty/atyfb_base.c         | 50 ++++++++++-----
>  drivers/video/fbdev/cyber2000fb.c            | 13 ++--
>  drivers/video/fbdev/geode/gxfb.h             |  5 --
>  drivers/video/fbdev/geode/gxfb_core.c        | 36 ++++++-----
>  drivers/video/fbdev/geode/lxfb.h             |  5 --
>  drivers/video/fbdev/geode/lxfb_core.c        | 37 +++++------
>  drivers/video/fbdev/geode/lxfb_ops.c         |  4 --
>  drivers/video/fbdev/geode/suspend_gx.c       |  4 --
>  drivers/video/fbdev/i740fb.c                 | 40 +++++-------
>  drivers/video/fbdev/nvidia/nvidia.c          | 64 +++++++++++---------
>  drivers/video/fbdev/s3fb.c                   | 39 +++++-------
>  drivers/video/fbdev/savage/savagefb_driver.c | 52 ++++++++++------
>  drivers/video/fbdev/via/via-core.c           | 39 +++++-------
>  drivers/video/fbdev/vt8623fb.c               | 41 ++++++-------
>  include/linux/via-core.h                     |  2 -
>  17 files changed, 267 insertions(+), 256 deletions(-)

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
