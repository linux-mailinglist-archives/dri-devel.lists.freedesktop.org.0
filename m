Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8BC5BC2C4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 08:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323A910E2D4;
	Mon, 19 Sep 2022 06:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CFC10E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 06:22:23 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220919062221euoutp01beae2c85cf2e83d51101ea712e754f70~WLsY-TdOg3138731387euoutp01f
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 06:22:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220919062221euoutp01beae2c85cf2e83d51101ea712e754f70~WLsY-TdOg3138731387euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1663568541;
 bh=wIxffZ9P+tsWrsq1BXhG+0MKNVgTf9otFBuDK4CSvqs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=SyGq9OgjgHFvg29A9Mb3l8jDZRUEmUgUVEwL1FGdg1n47uQ9VF539TSWXrVL/DUMv
 G0DyKJGW+xsOM0qxlH4+grb0V7OpLxCW9Wp5Txli5nBj41b3Lj8assOoelETDJ79ey
 WeizRoFA/YvPtslzx/lN3zdIpzLFvifY+Vdmsvbc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220919062221eucas1p2237f6a4175457d646ebc47b201777ca2~WLsYwFg8m3231532315eucas1p2-;
 Mon, 19 Sep 2022 06:22:21 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 30.22.19378.C9A08236; Mon, 19
 Sep 2022 07:22:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220919062220eucas1p2ffc878a338a9a897027ba3042e1187d8~WLsYH1xAH0491704917eucas1p24;
 Mon, 19 Sep 2022 06:22:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220919062220eusmtrp23a7262f846c6485926672e571a191876~WLsYGwYgO1786517865eusmtrp2M;
 Mon, 19 Sep 2022 06:22:20 +0000 (GMT)
X-AuditID: cbfec7f5-a35ff70000014bb2-24-63280a9c6326
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 3F.F9.07473.C9A08236; Mon, 19
 Sep 2022 07:22:20 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220919062219eusmtip1c8ae051b06934c1543f7c90b23c23e41~WLsXLhbFn2405724057eusmtip1i;
 Mon, 19 Sep 2022 06:22:19 +0000 (GMT)
Message-ID: <5baf2a71-3d1e-0f25-9b0e-2af98684fce5@samsung.com>
Date: Mon, 19 Sep 2022 08:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZB8Nt6Q5nDJQEj33YouyWZqVA9jB=9JA0usLt+c-+0SQg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xbVRzO6b29vdS0XkqVEzAsNrA53GAv9AhLBcXt1s1X1MTMxyzlCnWF
 YTvGxhIHuk3oWFcLUbh7WHlkXbGjloJABmYM6YAMlVnsoKO6EZVHYcBgrotM2rsp/32P35fv
 9zs5JCYpI6JIde4eRpur1MgIId7cfad/7UnhE6p1rSPJyDvchyFfzRyOJoYtBPplfppAx+r6
 +eiWw0igv0Z+xtHlTyYFqPTzWgE6Y+wgkOPGIB/pA2cxVPljBw9NHikGqO96A4Z6iw/jqNPw
 Npplf18yy8cIdPvuZSxVSttmfHx62nNYQJ9mL+F0xaUuPt3KXhPQJ0qq+HTN+TEe3eWu4dPe
 wfME7Tvq4tGNtQfpb6daeLTBaQX0nCPmVfEO4eZMRqPey2gT5e8Ls72WETwvkLSvyTOGFQH7
 Wj0IIyG1CXrrZ3E9EJISygLgVGMV4MgtAH+4YBBwZA7AEaOT9yDSZTURnHEGwPnaHowjMwDa
 vxnAg1MiSg6Hq82CIMapOOgedPI5PRz2VI2GZh6hVJDt7gZBHEEp4LWeQEjHqEg4NPpVqE1K
 PQkXqiZCbRhlJ2BZQyURNAhqPdT79SEcRr0Gbe4TPC68An7nPxnaCFKLYbC0ax7n9k6Hhy7a
 AYcj4LjLKeDwY/Bea7AtGPgMQPNd331iBLDoz6H7iRTo7Q8s1ZFLFathQ1siJ6fBsoU2PChD
 Sgw9/nBuCTE0NX+JcbIIlhyRcNMrIes691/thZ8GMCOQscvehV12P7vsHPb/XjPArSCSydfl
 ZDG6jblMQYJOmaPLz81KUO3OcYClD9u36JpvAZbxmYROwCNBJ4AkJpOK4hSxKokoU7m/kNHu
 3qnN1zC6ThBN4rJIkUptV0qoLOUeZhfD5DHaBy6PDIsq4pkT5fGGld9/Wleqq/ZcX9Pr/+Dh
 9IOZNn7H9pK37jye3JS2zbQ39ZW559/I9ilsz9xTki0bqIvG1UnmJvmL0YXDDv+pNwMxNxUF
 mwy/PfvxukOimYHkcXFhS50rKfKfdHvUdONLxhhSe+7RVS+ItjS+vlVtq8gIbG42ma7eTkm2
 6k1tuuoPd75cL/564VTl5NX+0fannva2L7qds8d7RBtcN1Yp9h1N691x7GbdF2Vx5fqM2ILi
 oYcGJ+LZ8mh+zEcbp9RpeClbPn76V1vrCkuCMOc9U8rfWwJX3p08u+uAmxRH74+10gaNNA+C
 Pw7MRoRXSOs9mvbUlIz8xePPBd65IkdrZLguW7k+HtPqlP8C+T+mmB8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsVy+t/xu7pzuDSSDbZsFrK4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC2+bJrAZvHi3kUWi7NNb9gtOicuYbdYPmEfm8Wmx9dYLbp+rWS2
 mHF+H5PFm7ZGRovTj9YzW5xqbGWxONQXbfFp1kOg5OSXbBbff59ldhDxWPvxPqvH+xut7B7z
 Zp1g8Zhy4girx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH5iX1Hhvf7WDy6Nuy
 itHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQi
 fbsEvYw7K+6xFPwyrdh64yVzA+MG3S5GTg4JAROJI6smsXUxcnEICSxllLh36AojREJG4uS0
 BlYIW1jiz7UuqKL3jBK3nm5nAUnwCthJ3F60gB3EZhFQlbh6bQsrRFxQ4uTMJ2A1ogLJEksa
 7oPFhQU8Je6e/AUWZxYQl7j1ZD4TiC0ioC3xbeZrsAXMApvYJJpWtbFCbPvEKrHmxDewDWwC
 hhJdb0HO4OTgFAiUWHt1NhPEJDOJrq1djBC2vMT2t3OYJzAKzUJyyCwkC2chaZmFpGUBI8sq
 RpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwISy7djPzTsY5736qHeIkYmD8RCjBAezkgivqqdK
 shBvSmJlVWpRfnxRaU5q8SFGU2BoTGSWEk3OB6a0vJJ4QzMDU0MTM0sDU0szYyVxXs+CjkQh
 gfTEktTs1NSC1CKYPiYOTqkGpqmh00/NuR7yrsPA+UpP3NyqjOOtTH15DK9LbBa9DVOVeab+
 dOXzuX92SeZ/zvKxWraiIGjP25luV3pFire5tYkrpB40z/W9v85u3RMP+fzoBdHBLRznkldf
 Pj/N7G5W35fsm/M85Q4k/Fxin/51sZwv6/T0qaZfDKcy7845IubefyxnWnDI+cVGc1bd+GJ3
 6PiGCOmrbI9On/lY372ptD3CJmalRvO1lwxmK2aol4UGZT2Uf/S9Z+1JI82/i0+xmXh4TtFe
 xcl2SYv1wM45Wx7yu+53F5/D/OV4S/mUXzERn1nsjn9Z3P9P3uu2iNS2+Woud23V38Sfn6It
 P+OCAt/ixclrXr5xNZW6cdVFYKMSS3FGoqEWc1FxIgCoHRuEsQMAAA==
X-CMS-MailID: 20220919062220eucas1p2ffc878a338a9a897027ba3042e1187d8
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
 <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
 <CAMty3ZBVrRa9VHDpGBM_r9gdU=Ex4iwpSHjzcOdxSBrwRrHF2A@mail.gmail.com>
 <473e88ee-1866-49ca-4a43-17a378e6fe47@samsung.com>
 <CAMty3ZAVV_dLnkBsgBCYgNbVNE-hMFiORqv7AxkDpwciJawtzw@mail.gmail.com>
 <92cfa300-0cf8-0040-f99b-59b3d9a1c2be@samsung.com>
 <CAMty3ZA7T2KiRpK_yWHOR57=T3UthNJxx=VyiHVep+sQVcCjvQ@mail.gmail.com>
 <988875db-c777-d93b-fdc7-780fa0cb31fe@samsung.com>
 <CAMty3ZB8Nt6Q5nDJQEj33YouyWZqVA9jB=9JA0usLt+c-+0SQg@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 16.09.2022 12:21, Jagan Teki wrote:
> On Fri, Sep 16, 2022 at 1:58 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 14.09.2022 11:39, Jagan Teki wrote:
>>> On Wed, Sep 14, 2022 at 2:51 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 13.09.2022 19:29, Jagan Teki wrote:
>>>>> On Wed, Sep 7, 2022 at 3:34 PM Marek Szyprowski
>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>> On 06.09.2022 21:07, Jagan Teki wrote:
>>>>>>> On Mon, Sep 5, 2022 at 4:54 PM Marek Szyprowski
>>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>>> On 02.09.2022 12:47, Marek Szyprowski wrote:
>>>>>>>>> On 29.08.2022 20:40, Jagan Teki wrote:
>>>>>>>>>> Samsung MIPI DSIM controller is common DSI IP that can be used in
>>>>>>>>>> various
>>>>>>>>>> SoCs like Exynos, i.MX8M Mini/Nano.
>>>>>>>>>>
>>>>>>>>>> In order to access this DSI controller between various platform SoCs,
>>>>>>>>>> the ideal way to incorporate this in the drm stack is via the drm bridge
>>>>>>>>>> driver.
>>>>>>>>>>
>>>>>>>>>> This patch is trying to differentiate platform-specific and bridge
>>>>>>>>>> driver
>>>>>>>>>> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
>>>>>>>>>> glue code and samsung-dsim.c as a common bridge driver code.
>>>>>>>>>>
>>>>>>>>>> - Exynos specific glue code is exynos specific te_irq, host_attach, and
>>>>>>>>>>        detach code along with conventional component_ops.
>>>>>>>>>>
>>>>>>>>>> - Samsung DSIM is a bridge driver which is common across all
>>>>>>>>>> platforms and
>>>>>>>>>>        the respective platform-specific glue will initialize at the end
>>>>>>>>>> of the
>>>>>>>>>>        probe. The platform-specific operations and other glue calls will
>>>>>>>>>> invoke
>>>>>>>>>>        on associate code areas.
>>>>>>>>>>
>>>>>>>>>> v4:
>>>>>>>>>> * include Inki Dae in MAINTAINERS
>>>>>>>>>> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
>>>>>>>>> This breaks Exynos DRM completely as the Exynos DRM driver is not able
>>>>>>>>> to wait until the DSI driver is probed and registered as component.
>>>>>>>>>
>>>>>>>>> I will show how to rework this the way it is done in
>>>>>>>>> drivers/gpu/drm/exynos/exynos_dp.c and
>>>>>>>>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...
>>>>>>>> I've finally had some time to implement such approach, see
>>>>>>>> https://protect2.fireeye.com/v1/url?k=c5d024d9-a4ab8e4e-c5d1af96-74fe4860001d-625a8324a9797375&q=1&e=489b94d4-84fb-408e-b679-a8d27acf2930&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv6.0-dsi-v4-reworked
>>>>>>>>
>>>>>>>> If you want me to send the patches against your v4 patchset, let me
>>>>>>>> know, but imho my changes are much more readable after squashing to the
>>>>>>>> original patches.
>>>>>>>>
>>>>>>>> Now the driver is fully multi-arch safe and ready for further
>>>>>>>> extensions. I've removed the weak functions, reworked the way the
>>>>>>>> plat_data is used (dropped the patch related to it) and restored
>>>>>>>> exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel
>>>>>>>> free to resend the above as v5 after testing on your hardware. At least
>>>>>>>> it properly works now on all Exynos boards I have, both compiled into
>>>>>>>> the kernel or as modules.
>>>>>>> Thanks. I've seen the repo added on top of Dave patches - does it mean
>>>>>>> these depends on Dave changes as well?
>>>>>> Yes and no. My rework doesn't change anything with this dependency. It
>>>>>> comes from my patch "drm: exynos: dsi: Restore proper bridge chain
>>>>>> order" already included in your series (patch #1). Without it exynos-dsi
>>>>>> driver hacks the list of bridges to ensure the order of pre_enable calls
>>>>>> needed for proper operation. This works somehow with DSI panels on my
>>>>>> test systems, but it has been reported that it doesn't work with a bit
>>>>>> more complex display pipelines. Only that patch depends on the Dave's
>>>>>> patches. If you remove it, you would need to adjust the code in the
>>>>>> exynos_drm_dsi.c and samsung-dsim.c respectively. imho it would be
>>>>>> better to keep it and merge Dave's patches together with dsi changes, as
>>>>>> they are the first real client of it.
>>>>> I think the Dave patches especially "drm/bridge: Introduce
>>>>> pre_enable_upstream_first to alter bridge init order" seems not 100%
>>>>> relevant to this series as they affect bridge chain call flow
>>>>> globally. Having a separate series for that makes sense to me. I'm
>>>>> sending v5 by excluding those parts.
>>>> If so then drop the "drm: exynos: dsi: Restore proper bridge chain
>>>> order" patch and adjust code respectively in samsung-dsim.c. Without the
>>>> Dave's patches, that one doesn't make sense.
>>> Doesn't it break Exynos?
>> No it won't. Lack of the "drm: exynos: dsi: Restore proper bridge chain
>> order" patch doesn't change much against the current state of the driver.
>>
>> Here is my rework of your v4 patchset without the mentioned patch and
>> Dave's patches:
>>
>> https://protect2.fireeye.com/v1/url?k=6282936d-3d19aa74-62831822-000babff3793-9317af6e2b207460&q=1&e=cd36cc51-8faa-4812-880a-8242739a86bd&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv6.0-dsi-v4-reworked-minimal
> We have one problem with getting bus format from previous bridge if we
> pass NULL in bridge_func.attach()
> https://protect2.fireeye.com/v1/url?k=bdc3e18a-e258d893-bdc26ac5-000babff3793-1dd81e5acf9d7f83&q=1&e=cd36cc51-8faa-4812-880a-8242739a86bd&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Fcommit%2F0fa57e33b3bf866efc4c17ab20eec28d6e07b3e9%23diff-3fe873f1ada5f1dfcf2a50ac114bdab3ea7b026d12278648ca40809d3fa1a331R1321
>
> Booting the video as it assigns default bus format if the previous bus
> format is unknown.
>
> [    1.635984] samsung-dsim 32e10000.dsi:
> [drm:samsung_dsim_host_attach] Attached sn65dsi83 device
> [    1.648067] [drm] Initialized mxsfb-drm 1.0.0 20160824 for
> 32e00000.lcdif on minor 0
> [    1.658726] mmc0: SDHCI controller on 30b40000.mmc [30b40000.mmc]
> using ADMA
> [    1.681893] sn65dsi83 3-002c: Unsupported LVDS bus format 0x100a,
> please check output bridge driver. Falling back to SPWG24.
>
> Does passing the bridge to drm_bridge_attach is working on your platform?
> return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge, flags);

Nope, it fails:

[drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
exynos-dsi 11c80000.dsi: [drm:samsung_dsim_host_attach] Attached s6e8aa0 
device
panel-samsung-s6e8aa0 11c80000.dsi.0: error -22 setting maximum return 
packet size to 3
panel-samsung-s6e8aa0 11c80000.dsi.0: read id failed

I've already pointed that it makes sense only together with Dave's patches.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

