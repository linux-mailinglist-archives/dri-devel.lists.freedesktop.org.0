Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48755B84D6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 11:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB4410E8D0;
	Wed, 14 Sep 2022 09:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B82110E8D0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 09:21:47 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220914092145euoutp01059c6dd977cb39d6204c99b79f70e4ff~Ur6mZriQU0660606606euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 09:21:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220914092145euoutp01059c6dd977cb39d6204c99b79f70e4ff~Ur6mZriQU0660606606euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1663147305;
 bh=9xUHT6opTS5QpVilkLV1rpCIn4AWpuRKrfv2RTOVJjo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=YIuXT43lWDgGky7SaEMCyoOKao7hKskG2d1WQs2yAqwVLMuqyB5x8AkcPnQP05S22
 XK8SZNyL8o6Gmr7++0ewg9f2ojj+1jBQjV7vqAbZtb69IYoaAir8aohte0/a63gy7y
 TDyRpuS4+eykee90wjshI4eTCOc2wLFnerctz4fA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220914092144eucas1p10d56af42c079312a1bc5243d34e1820d~Ur6l8vbKc1257312573eucas1p1i;
 Wed, 14 Sep 2022 09:21:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E6.19.29727.82D91236; Wed, 14
 Sep 2022 10:21:44 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220914092144eucas1p2815d67eeeb49965b6a693a9548a299f3~Ur6lYa20B0714107141eucas1p21;
 Wed, 14 Sep 2022 09:21:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220914092144eusmtrp1130d7ebad675a6e2607cac3e4d2fe8cb~Ur6lWTpTm1130811308eusmtrp1j;
 Wed, 14 Sep 2022 09:21:44 +0000 (GMT)
X-AuditID: cbfec7f2-21dff7000001741f-6b-63219d28383d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3D.44.10862.82D91236; Wed, 14
 Sep 2022 10:21:44 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220914092142eusmtip1cae80778b543598a927c8baaf76060a7~Ur6kD3smC1222512225eusmtip1h;
 Wed, 14 Sep 2022 09:21:42 +0000 (GMT)
Message-ID: <92cfa300-0cf8-0040-f99b-59b3d9a1c2be@samsung.com>
Date: Wed, 14 Sep 2022 11:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZAVV_dLnkBsgBCYgNbVNE-hMFiORqv7AxkDpwciJawtzw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xTZxjOd24tbO0OlYVvQIY00ekWqI0s+5IxsmXNcnSwsaibl8yt1jNA
 oJhW6nSZFjJRzgoCarRnQ5hlwjBSYMIKIaAFi6WCuig6qFYZq8hlhruUzM3DYRv/nud93ue9
 5ZXiinwqXJqm38Ma9NoMJRVMNLrmrsWsKo3WrSnuiEHefg+OfLZJAo30V1Ho5vRjChX82EOi
 qfoiCg3du0Gg7txRCcovrpCgyqJWCtX/3ksiLvATjk5da8XQaF4OQJ4BO466cg4RyFm4DU3w
 D56Jxx5RaHa+G387lDk/7iOZx3cOSZjT/BWCOX6lg2Sa+LsS5rsjVpKxtTzCmI5bNpLx9rZQ
 jO/bToz5ueIgU/enA2MKL1QDZrL+5WT51uD4nWxGmok1qBI+D07N7Wqhdnujv2y6F28GtyM4
 IJVCOg76c7dwIFiqoKsAPPFHCRDJFIBN1tlFMgngLXs3wYGgBQc3aFsUKgE8O9G2SMYBdAa6
 gFBXRifA4py3BANBr4CONisuYBkdAt3WwYVCL9I6yLtcQMDL6HXwrjuwEMfpMNg3WIYJOJR+
 Dc5YRyihPk7XUtBiP0UJAkWrITfGLeAg+iM4/9AGRHMU/GXse1wwQDoQBL3ts4tja2Bvm4MS
 8TI43HlBIuJI6DlmIUTDYQDL532YSIoAND/sA2LWm9DbE6CE1XB6NbQ3q8TwO9Ay00yIl5TD
 O2Mh4hByWNJ4EhfDMngkTyFmr4R8Z81/bS9d/xUvAkp+yV34JfvzS9bh/+9bDohqEMZmGzNT
 WKNaz+6NNWozjdn6lFhdVmY9ePatnqedEw5QOjwe6wSYFDgBlOLKUFnhxuU6hWyndt9+1pD1
 mSE7gzU6QYSUUIbJdGm1WgWdot3DprPsbtbwr4pJg8LN2A5V8tpZNxczoC64/8Jo+tzJ5Q0K
 88G9cUnxdU7/llp2k/owv9lSMFzaVL0/7vTchpVJZWvbj/t9l4gNf4Mf6qZnEn8b0x1lHXj4
 ut7LH34Kpof6Vmn80B/ynoYrUCT3rYiwn6lUhmWFcqqvzrnOMIE1DfbKo1Hbz9Wklmxr6aBO
 5A94vnkSfj/btP7JZnnyyAFHZHlZ+fONNezXKeaErTv615skGl08/UruUBtp0kS5t7cnNryu
 Ml2WRz+9+MHonKWCHOmRZB1IaAbuv6Jv53Xrv/jEfnNf1XjM+dXOj991vTF19bn3iy++lKQj
 0wlXABkfdCWe1W9s3FVY0Rq5yU0rCWOqVv0qbjBq/wFzeyBrHAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsVy+t/xu7oacxWTDRat4bS4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC2+bJrAZvHi3kUWi7NNb9gtOicuYbdYPmEfm8Wmx9dYLbp+rWS2
 mHF+H5PFm7ZGRovTj9YzW5xqbGWxONQXbfFp1kOg5OSXbBbff59ldhDxWPvxPqvH+xut7B7z
 Zp1g8Zhy4girx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH5iX1Hhvf7WDy6Nuy
 itHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQi
 fbsEvYymU3vYCu4oVuy8Z9PAeF26i5GTQ0LARKLryWLGLkYuDiGBpYwSn7ZMY4NIyEicnNbA
 CmELS/y51sUGUfSeUeLxtFtADgcHr4CdxMRGW5AaFgFViR37ZzKD2LwCghInZz5hAbFFBZIl
 ljTcB5sjLOApcffkL7A4s4C4xK0n85lAbBEBbYlvM1+DzWcW2MQm0bSqjRVi2S9miauPL4F1
 sAkYSnS97QK7jlMgUOL3c5CzQSaZSXRt7YKy5SW2v53DPIFRaBaSQ2YhWTgLScssJC0LGFlW
 MYqklhbnpucWG+kVJ+YWl+al6yXn525iBCaTbcd+btnBuPLVR71DjEwcjIcYJTiYlUR4+0IU
 koV4UxIrq1KL8uOLSnNSiw8xmgJDYyKzlGhyPjCd5ZXEG5oZmBqamFkamFqaGSuJ83oWdCQK
 CaQnlqRmp6YWpBbB9DFxcEo1MFkfiw7ap1nW+srlqv3b1OQVG2f/ehxczVHLvECOuYw1MzX+
 yWXuX29z3x3vtnr7d4WSdJecu/XiXBOnzwIsV/256ruZHmRNSYoq7UhoenYvYILEc47J28sf
 eqfeSbqx6fm8snnM2nf+zRZp//AtVUG5W2IHF3/gsR8Jbl6C199uKZl+etYDLvnjy644ZemF
 LAmzVXVNUF0XP/eP5LIH5+5L/zVY+nWapcGO3UrfNVJNS1MVao9ucf1w6DmLd3fA7hDb36ud
 Giy2rV3aN73KUizdUGr5/sms2bIbp4q6tL6V2c0u8nTrYUu7Hezt500XiE/cdPEoS9f+ICZ/
 q2/BRWsZz5QLSHJ93zZj26f+CiWW4oxEQy3mouJEAO5GRAWvAwAA
X-CMS-MailID: 20220914092144eucas1p2815d67eeeb49965b6a693a9548a299f3
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

On 13.09.2022 19:29, Jagan Teki wrote:
> On Wed, Sep 7, 2022 at 3:34 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 06.09.2022 21:07, Jagan Teki wrote:
>>> On Mon, Sep 5, 2022 at 4:54 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 02.09.2022 12:47, Marek Szyprowski wrote:
>>>>> On 29.08.2022 20:40, Jagan Teki wrote:
>>>>>> Samsung MIPI DSIM controller is common DSI IP that can be used in
>>>>>> various
>>>>>> SoCs like Exynos, i.MX8M Mini/Nano.
>>>>>>
>>>>>> In order to access this DSI controller between various platform SoCs,
>>>>>> the ideal way to incorporate this in the drm stack is via the drm bridge
>>>>>> driver.
>>>>>>
>>>>>> This patch is trying to differentiate platform-specific and bridge
>>>>>> driver
>>>>>> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
>>>>>> glue code and samsung-dsim.c as a common bridge driver code.
>>>>>>
>>>>>> - Exynos specific glue code is exynos specific te_irq, host_attach, and
>>>>>>      detach code along with conventional component_ops.
>>>>>>
>>>>>> - Samsung DSIM is a bridge driver which is common across all
>>>>>> platforms and
>>>>>>      the respective platform-specific glue will initialize at the end
>>>>>> of the
>>>>>>      probe. The platform-specific operations and other glue calls will
>>>>>> invoke
>>>>>>      on associate code areas.
>>>>>>
>>>>>> v4:
>>>>>> * include Inki Dae in MAINTAINERS
>>>>>> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
>>>>> This breaks Exynos DRM completely as the Exynos DRM driver is not able
>>>>> to wait until the DSI driver is probed and registered as component.
>>>>>
>>>>> I will show how to rework this the way it is done in
>>>>> drivers/gpu/drm/exynos/exynos_dp.c and
>>>>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...
>>>> I've finally had some time to implement such approach, see
>>>> https://protect2.fireeye.com/v1/url?k=c5d024d9-a4ab8e4e-c5d1af96-74fe4860001d-625a8324a9797375&q=1&e=489b94d4-84fb-408e-b679-a8d27acf2930&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv6.0-dsi-v4-reworked
>>>>
>>>> If you want me to send the patches against your v4 patchset, let me
>>>> know, but imho my changes are much more readable after squashing to the
>>>> original patches.
>>>>
>>>> Now the driver is fully multi-arch safe and ready for further
>>>> extensions. I've removed the weak functions, reworked the way the
>>>> plat_data is used (dropped the patch related to it) and restored
>>>> exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel
>>>> free to resend the above as v5 after testing on your hardware. At least
>>>> it properly works now on all Exynos boards I have, both compiled into
>>>> the kernel or as modules.
>>> Thanks. I've seen the repo added on top of Dave patches - does it mean
>>> these depends on Dave changes as well?
>> Yes and no. My rework doesn't change anything with this dependency. It
>> comes from my patch "drm: exynos: dsi: Restore proper bridge chain
>> order" already included in your series (patch #1). Without it exynos-dsi
>> driver hacks the list of bridges to ensure the order of pre_enable calls
>> needed for proper operation. This works somehow with DSI panels on my
>> test systems, but it has been reported that it doesn't work with a bit
>> more complex display pipelines. Only that patch depends on the Dave's
>> patches. If you remove it, you would need to adjust the code in the
>> exynos_drm_dsi.c and samsung-dsim.c respectively. imho it would be
>> better to keep it and merge Dave's patches together with dsi changes, as
>> they are the first real client of it.
> I think the Dave patches especially "drm/bridge: Introduce
> pre_enable_upstream_first to alter bridge init order" seems not 100%
> relevant to this series as they affect bridge chain call flow
> globally. Having a separate series for that makes sense to me. I'm
> sending v5 by excluding those parts.

If so then drop the "drm: exynos: dsi: Restore proper bridge chain 
order" patch and adjust code respectively in samsung-dsim.c. Without the 
Dave's patches, that one doesn't make sense.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

