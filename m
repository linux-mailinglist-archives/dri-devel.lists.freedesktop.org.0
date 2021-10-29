Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED9743F906
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 10:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD9C6EA25;
	Fri, 29 Oct 2021 08:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF7389E14
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 08:36:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211029083604euoutp0145af7596f3c9a04022f636433ef1d65e~yc3XXqgCZ2696326963euoutp01O
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 08:36:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211029083604euoutp0145af7596f3c9a04022f636433ef1d65e~yc3XXqgCZ2696326963euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635496564;
 bh=rGQtswDny4qK/UzHiFb+huxqfuzGLP8FOoXL2crr0fA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=tcwko/MsS7BipXpl0EHdcjbWQhBbNIuA1kjkcdYixpmD0tyPpjWcyFNmTdWthSxEN
 LkotWK8zO9Gb8VB1zXpfMFtNXtYmyElEy4yIXeC31pv0JCOjnQAznZgvCHy6GVyGAT
 1y2xx7t4/JZfADf9K0gUxR/mAbDYw/oVXEFimIYs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211029083604eucas1p1285bb75781ee522a82d2c225b2e1a2c6~yc3W4Do7c2420724207eucas1p1F;
 Fri, 29 Oct 2021 08:36:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F5.C8.45756.372BB716; Fri, 29
 Oct 2021 09:36:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211029083602eucas1p23bcb25ec288181943e83e9e1f1cd31ce~yc3VxKiVD2588125881eucas1p2g;
 Fri, 29 Oct 2021 08:36:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211029083602eusmtrp20534e587a8c486de19cc3b71c591b132~yc3VuwZfm0992409924eusmtrp22;
 Fri, 29 Oct 2021 08:36:02 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-2c-617bb273cf56
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 49.D7.31287.272BB716; Fri, 29
 Oct 2021 09:36:02 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211029083601eusmtip1e121b0634bb0176f3cb82f735caa032e~yc3UAGYwb2760027600eusmtip1d;
 Fri, 29 Oct 2021 08:36:00 +0000 (GMT)
Message-ID: <f62174cf-5786-f9d0-3a3a-3c9919f27b1e@samsung.com>
Date: Fri, 29 Oct 2021 10:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [v6,02/21] drm/bridge: adv7511: Register and attach our DSI
 device at probe
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
Cc: Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, Sam
 Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Tian Tao <tiantao6@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Xinliang Liu
 <xinliang.liu@linaro.org>, John Stultz <john.stultz@linaro.org>,
 linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, Sean Paul
 <sean@poorly.run>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20211029080521.6tmfq4kjngu5slv7@gilmour>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxzHd+69vfdSV3IpLhzUqKtxMAggEcdZXMzYI16XLEJGopElrJsX
 NDzUFsTJsgEKgQ4YL11pBVbQgIAwHu2kQ6hEVoi0SAElDa4yuoE8BXQDNugoFzf++/we39/3
 9zs5NC7+mdxGn45P4GTx0lgJKSR0vyz1+skbk6X7Kv4JQjnmbgxV9tThaODFLImujZkAKrDl
 EWisrA6gnr/9UPfUIIHGf+0j0OJKmwCZ0qYolJV/nUL57SYK9euvkUjZ24YhzZyWQMrFVYA6
 ciOQ7apqbYZmEUfzqhEcVS1pAXpceA8gZeFTEi3pSwlUM9lGoeapfAHqbK8WvLuDnR1Kp9hh
 cy/JtqgeU+xoSQPFqjOLBWxF61OM7cqzYOzww1aS/enPJwK2tDuMtX1rxFij3kqx168Okmxu
 czVgm+4nswuNO0OZE8J3TnKxp89zsoBDnwlP3e2boM4OiC78/jCFSAElWxTAhYZMECxzjBIK
 IKTFTBWA32mWBXzwHMBH9gqKDxYAbF0pEryUGJpqSL5QCeAfD4wbXXMAFle9WOuiaRFzCBaO
 X3AKCGYvXGjLJJwsYtxgd7F9nV9jPoeZM1nr7M6cgCs59ZSTccYDWu1lmJO3rmkHcu7gzvk4
 Y6ahtiyLdBZIJhAqphXr7MK8BY1XDBgv3gUvadXrAsiYhLCkR4fxa38Anww9Azy7wwljM8Xz
 Duhocbo5BZcAHDHfovggG8D+NOWG4iAcNi+TztNw5k1Yrw/g0yHQ2rmMO9OQcYVD0278Eq6w
 QPf9RloEMzPEfPcbUGWs+8/27gMLngckqk3votp0v2rTOar/fX8ARDXw4BLlcdGcPDCeS/KX
 S+PkifHR/l+ciWsEa//7/qpx/jYomZjz7wAYDToApHHJVtFUUbJULDop/fIiJzsTKUuM5eQd
 YDtNSDxE1eraSDETLU3gYjjuLCd7WcVol20pmNg0ejlp7njJQEiEpa+/9dh0XWbT+0nns3H1
 x59oznmWG/RMwIEhPyYy+MdQnQOXlPu6blkwLGVn9B/e7XGz3Nv+Vczz3xxptgPBF1NdDkcd
 TC6MUFsmYwZ9rC07w728Z+5ouuL2eXUebQkvtRnGHYOGywW+DVEZN8pdQoqOK33nVnLjtu+q
 ffSXZXnPUc1k5TfPDOFC8auihJkgFEArwma9exuYj1Jq0iNuzo+n6oyyoHTRXrP1yKfuXWjM
 98b+DwO0DZGKPbXi/dJjXa/4ebY7xpo079nnv37dJ6I+7O0aZXC9W+m93bWpFrXP7ajQIyO0
 pyvyal/1IbNuyWvOgUgJIT8lDfTBZXLpv/xr/nROBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEKsWRmVeSWpSXmKPExsVy+t/xu7pFm6oTDW7c1rC4te4cq0XvuZNM
 FsvPrGO2uPL1PZvFnOdnGS0m3Z/AYvF8/jpGizO/dS1OvrnKYvHi3kUWix9/97FanG16w27R
 OXEJu8XE/WfZLS7vmsNmMeP8PiaLhR+3sljM+PGP0eJQX7TF/WmzgGYs/MFs8WnWQ2aLFT+3
 MlrcnXyE0WLG5JdsFj93zWOxWP16H7vFljcTWS2O7l/F6iDr8f5GK7vHnXPn2Tx2zrrL7vF4
 7kZ2j9kdM1k9Fu95yeRxYsIlJo871/aweWz/9oDVY97JQI/73ceZPI7vusXusWTaVTaPvi2r
 GD02n672+LxJLkAgSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
 syy1SN8uQS/j4MVX7AVXeCueXmtgaWCcy93FyMkhIWAicWDzarYuRi4OIYGljBL393WzQiRk
 JE5Oa4CyhSX+XOuCKnrPKHF86VWWLkYODl4BO4nJLypAalgEVCU+7+tgAbF5BQQlTs58AmaL
 CiRJbFvwkxHEFhaIkvjbu54dxGYWEJe49WQ+E4gtAtR7pXcvM8h8ZoFLHBI39r1kgVj2llFi
 U9MkNpAqNgFDia63XWA2p4CZxPGpB5ggJplJdG3tYoSw5SWat85mnsAoNAvJIbOQLJyFpGUW
 kpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAhPXtmM/N+9gnPfqo94hRiYOxkOMEhzM
 SiK8b6ZUJwrxpiRWVqUW5ccXleakFh9iNAWGxkRmKdHkfGDqzCuJNzQzMDU0MbM0MLU0M1YS
 5906d028kEB6YklqdmpqQWoRTB8TB6dUA5NmwZwDsV5p/Rs37ox6377sxd8GN3vl2sSiQyK8
 k5+JC6v0fTtkd+H3Sfni7o01cpKRkpUGTsJsbfI7ur70ik4O362d1Ph+4qGeYxMTz+9947Fo
 fdTZw7eLGQ9dL3530+6ZvKRgwbLjYdkueno/A1t0OiOFrHqkTTR8uer4zVMykmYpZ/qVnPtT
 HZXX+Jan+7XY4uPFnqqGm+Kir/QLfd/5NFp6e5+BQIa9ter+T+uONWqWJ3KdvL/XUS/d4uoq
 s7nmuWI7tUU1/ONv/r717LHQKkf+bZo7A/WaC0+qS09I+2u8WX7py6YJwfys15j8Zz77Fm3x
 qCbMltXrw+TlNuHBya9X9kwqjO5TUNqpxFKckWioxVxUnAgAFetmzeUDAAA=
X-CMS-MailID: 20211029083602eucas1p23bcb25ec288181943e83e9e1f1cd31ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211029062347eucas1p1431402205321b066349e3ccf432d2452
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211029062347eucas1p1431402205321b066349e3ccf432d2452
References: <20211025151536.1048186-3-maxime@cerno.tech>
 <CGME20211029062347eucas1p1431402205321b066349e3ccf432d2452@eucas1p1.samsung.com>
 <73c13cf5-ca36-f47b-f53a-11d4f015505c@samsung.com>
 <20211029080521.6tmfq4kjngu5slv7@gilmour>
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

Hi Mexime,

On 29.10.2021 10:05, Maxime Ripard wrote:
> On Fri, Oct 29, 2021 at 08:23:45AM +0200, Marek Szyprowski wrote:
>> On 25.10.2021 17:15, Maxime Ripard wrote:
>>> In order to avoid any probe ordering issue, the best practice is to move
>>> the secondary MIPI-DSI device registration and attachment to the
>>> MIPI-DSI host at probe time. Let's do this.
>>>
>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>> Tested-by: John Stultz <john.stultz@linaro.org>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> This patch landed in linux-next as commit 864c49a31d6b ("drm/bridge:
>> adv7511: Register and attach our DSI device at probe"). Sadly it causes
>> endless probe-fail-defer loop on DragonBoard 410c board
>> (arch/arm64/boot/dts/qcom/apq8016-sbc.dts):
> I'm sorry to hear that (but would have been surprised if it didn't occur)
>
> This is supposed to be fixed by 8f59ee9a570c ("drm/msm/dsi: Adjust probe
> order"). Do you have that patch applied?

Yes, I did my test directly on linux next-20211028, which also contains 
it. What might be important in my case, my DragonBoard 410c doesn't have 
any display attached.

I've also noticed the following error during boot:

[   23.847651] msm_mdp 1a01000.mdp: Adding to iommu group 3
[   23.866044] msm_mdp 1a01000.mdp: No interconnect support may cause 
display underflows!
[   23.957949] irq: no irq domain found for mdss@1a00000 !
[   23.958014] msm_dsi 1a98000.dsi: failed to request IRQ0: -22
[   23.962229] msm_dsi: probe of 1a98000.dsi failed with error -22

The above errors appeared in next-20211028 for the first time. I assume 
that they are related.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

