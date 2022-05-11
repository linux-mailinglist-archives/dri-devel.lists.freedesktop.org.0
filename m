Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63C523670
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 16:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1400410E060;
	Wed, 11 May 2022 14:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8099E10E086
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 14:58:25 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220511145823euoutp02916d9bbed55a6a0d25d6ac89d8e92e0e~uFOjYZjA82958729587euoutp02V
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 14:58:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220511145823euoutp02916d9bbed55a6a0d25d6ac89d8e92e0e~uFOjYZjA82958729587euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652281103;
 bh=5ixAvrUuB7Dw/mQY5x1TA+cod0n3aQ95sTxuWXF+1m4=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=ZcsvEOAIDns2LFU5z3ADhDUxQYsTTDdgP8F9Cm5DOIv3U9WCzAH8gs/reIe2h59Qr
 Ynt9cDHQTlIS0slcwitRkwj0U+sdUzRr+3S3sHX6Iy+UXKrcew5dwarFZKU1A6BZWS
 rgAjcvM/MoW0b7BvKVrA8TcwGf4/8ka0cqP9tVpk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220511145823eucas1p10257e8fc46c594954c5c28e63a8f1f59~uFOi3TpVs2775727757eucas1p1b;
 Wed, 11 May 2022 14:58:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 06.BB.09887.E0FCB726; Wed, 11
 May 2022 15:58:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220511145822eucas1p24f9b352d1b3a5430ad65b63d314b70ba~uFOidn0hU0498204982eucas1p2s;
 Wed, 11 May 2022 14:58:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220511145822eusmtrp22a9ce2ee1466388a05088a5ed61eb7b3~uFOibwEJd0616106161eusmtrp2N;
 Wed, 11 May 2022 14:58:22 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-f6-627bcf0e37bd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F7.C1.09522.E0FCB726; Wed, 11
 May 2022 15:58:22 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220511145821eusmtip26c2a8a20426c83f41e71bfd1bc2886bc~uFOhgHGOo2411824118eusmtip25;
 Wed, 11 May 2022 14:58:21 +0000 (GMT)
Message-ID: <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
Date: Wed, 11 May 2022 16:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Content-Language: en-US
In-Reply-To: <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUwTZxzOe3c9rmxlZ8H0HcPNNcOEJRZ1hF2CYS4x2+0rwS1ZFjHOAy4t
 AoW0wCpohgkgVG1anB+cfC0l1BhBUr4V56yppYJUqnzU4IrRaCgtroIlKNBx3Nz473mf5/l9
 PL+8BCqtwmOJbHUhq1EzuXI8Euu+tejaGuUqzdj2tDWFOjnsRKhQUI9QXvMcRoW7TSgVqDdj
 1J2WGzhlci3i1P2Xz3Fq3mrEqWeNbYBy+kcxqtrUHEH9HuzCKH/lUUBVVreIKJshnXrBPUKp
 Tr9JtEtKtwa9Ivr5REUEfb5sBKMbuAGMvhZqwug+7uEqV1Uros390whtvViN0wNGN0JPjvXj
 dE9oSkQ3OPfQ3uMOhK6wv8LojsHSNHJv5M4sNje7mNUkph6IVHlGnKICX4zO8JsFKwOPST0Q
 E5BMgrf7b6J6EElIyQsAjl4LiHhBSs4D2DauE4Q5ALv8ExFvKmqv92GCYAHwVlclIjyCANY0
 +hDeJSFT4TPLCcBjjIyHHs8ILvAboLP2CcbjjWQG9PtHUR7j5HaoD+jXPNHkN9B41ojzTWPI
 TgQee1i+NgEl3Sg8def82h4oKYMPnjSuCgQhJvfAuvlCgf4A9gTq1gJBckUMr4aWcWHv3fDe
 Czsi4Gjoc3T+mycOhvuEPpDMh8vnPhFoHRybuYQKOAVODr/CeQtKJsDLVxIF+nPIjfKX4Cuj
 4ERgg7BBFKzpPosKtARWVUoF9xbIOdr+m3njrhs1Ajm37ijculjcuizc/3ObAHYRyNgibZ6S
 1e5Qs78otEyetkitVGTm51nB6mcdXHHM9wKLL6iwAYQANgAJVB4juW7QZUglWcyhElaT/7Om
 KJfV2sB7BCaXSTKz2xkpqWQK2RyWLWA1b1SEEMeWIabWbzdvbq9ObtCkq7xtHWlm+7RM5X5f
 ZU19dIENLX19ef+mJhujio/udeUnp/w6qfzuj/BB1Z+BkryOyX5mqLjlkPh+MD28q+PvmYXD
 48rkd04H9l09qjj8YWZazOv62y9zklYOMN93PzDU2H/sKoKGcmz3CFBnVpQH52Y+DfuyKgZO
 WWaPfDY8LYu7mXj8dNkxx7b2hdnhE1tn912xe0wJO3YOTrmtrqWn5zYqio+IPLGXPmr8cnB/
 oMDXbFjShSbKE5ZP/pTU3Ht3aNz7RU5BCVbHvl3/Vrx6MWtO/pe61/0arTpjblc3Pe7ZlLs0
 5DizUPqV44e44kXz1BT9rmcsR45pVcz2j1GNlvkHT7C5VBsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsVy+t/xe7p856uTDPoXSVn0njvJZPHtYxeT
 xf3Fn1ks/m+byGzxdu5iFouzyw6yWUw8/5PN4srX92wWXzZNYLN4Pn8do8XJN1dZLDonLmG3
 WPhxK4vFm7ZGRou2zmWsFof6oi0+zXrIbLHlzURWByGPtR/vs3q8v9HK7jG74SKLx7xZJ1g8
 9n5bwOKxc9ZdoFjHTFaPxXteMnlsWtXJ5nFiwiUmjzvX9rB5bP/2gNVj3slAj/vdx5k8Wo/+
 YvHYfLo6QCBKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
 3y5BL+PmxZOsBa9EKvqmLGdpYHws0MXIySEhYCIxc/9Oli5GLg4hgaWMEi2bVjBCJGQkTk5r
 YIWwhSX+XOtigyh6zyhxfMc6FpAEr4CdxPPlPWANLAKqEjdvXmSDiAtKnJz5BKiGg0NUIEni
 yGF+kDCbgKFE19susBJhAW+JCdMngM0UEdjCJHHk2jdWEIdZ4AazxIT1b9khti1mkmjZtxFs
 A7OAuMStJ/OZQKZyCgRKzPlSAhE2k+ja2gVVIi+x/e0c5gmMQrOQ3DELSfcsJC2zkLQsYGRZ
 xSiSWlqcm55bbKhXnJhbXJqXrpecn7uJEZhOth37uXkH47xXH/UOMTJxMB5ilOBgVhLh3d9X
 kSTEm5JYWZValB9fVJqTWnyI0RQYGBOZpUST84EJLa8k3tDMwNTQxMzSwNTSzFhJnNezoCNR
 SCA9sSQ1OzW1ILUIpo+Jg1Oqgak28MybJ68cW2a5LX70Qea6G1vN/vvWgqWrVXW3N/O1/VS0
 zXwQ8e2/9tr1wWYXdl/wuRSwUuqPiLnYU+2HN/o+TQvq4H/Mvvpxf9MHn4TPCdO2KjO47hOQ
 POvGXZnr9rK28j5L/Bu9sqti+7c/2LHpy4v7W/gOx0ROf2j56dOnPSWqCpdPMm17pdKzbn82
 88sy5f/eytGHb+36e/k1V197+x1zI5M1u+XY/H68uXCOd41WSnT1LRYR9UVK2yQkvk3Td3xr
 dOuL442tt0N2VmsZJjzP5nrLWvFPuyVZoawoRnfZt7f1r5fl9m+NfvdCzWS7lNHB+7pBP91f
 bL05U3hZhM+/9qN/DwsJfRaS2H9UiaU4I9FQi7moOBEA63cpCLADAAA=
X-CMS-MailID: 20220511145822eucas1p24f9b352d1b3a5430ad65b63d314b70ba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On 05.04.2022 13:43, Dave Stevenson wrote:
> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
> <dave.stevenson@raspberrypi.com>  wrote:
>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
>> <dave.stevenson@raspberrypi.com>  wrote:
>>> Hi All
>> A gentle ping on this series. Any comments on the approach?
>> Thanks.
> I realise the merge window has just closed and therefore folks have
> been busy, but no responses on this after a month?
>
> Do I give up and submit a patch to document that DSI is broken and no one cares?

Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI 
DSIM bridge' thread, otherwise I would miss it since I'm not involved 
much in the DRM development.

This resolves most of the issues in the Exynos DSI and its recent 
conversion to the drm bridge framework. I've added the needed 
prepare_upstream_first flags to the panels and everything works fine 
without the bridge chain order hacks.

Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


The only remaining thing to resolve is the moment of enabling DSI host. 
The proper sequence is:

1. host power on, 2. device power on, 3. host init, 4. device init, 5. 
video enable.

#1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so 
far done in the first host transfer call, which usually happens in 
panel's prepare, then the #4 happens. Then video enable is done in the 
enable callbacks.

Jagan wants to move it to the dsi host pre_enable() to let it work with 
DSI bridges controlled over different interfaces 
(https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/ 
). This however fails on Exynos with DSI panels, because when dsi's 
pre_enable is called, the dsi device is not yet powered. I've discussed 
this with Andrzej Hajda and we came to the conclusion that this can be 
resolved by adding the init() callback to the struct mipi_dsi_host_ops. 
Then DSI client (next bridge or panel) would call it after powering self 
on, but before sending any DSI commands in its pre_enable/prepare functions.

I've prepared a prototype of such solution. This approach finally 
resolved all the initialization issues! The bridge chain finally matches 
the hardware, no hack are needed, and everything is controlled by the 
DRM core. This prototype also includes the Jagan's patches, which add 
IMX support to Samsung DSIM. If one is interested, here is my git repo 
with all the PoC patches:

https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

