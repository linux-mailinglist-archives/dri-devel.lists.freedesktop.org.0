Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543666009C4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 11:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C8310ED00;
	Mon, 17 Oct 2022 09:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB1F10ED00
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 09:01:15 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221017090113euoutp0224bf25475bf3e572cf8e8eb567342739~ez7GQcPIY0939609396euoutp02W
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 09:01:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221017090113euoutp0224bf25475bf3e572cf8e8eb567342739~ez7GQcPIY0939609396euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1665997273;
 bh=QOswrhf3817KnZD8BbeUacMbHhhIBVF0cy/nIMf6CzY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=KF8aXXdonaBvW76Nwz368ZclzHJh2OLYQnxXCxkOidmk/ZCi2zIpPjTi2odui1QYA
 2sczHV1cPJHXhG5C5APMKWEeK2/HIYi2dTCAdyhB1DI65yaAebXE7zjv6A0F90OdzN
 +seE6epJlwAOnPLGdHsttmklo8pxud0OX9MKH9uo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221017090112eucas1p1cf444495a39859ad6a31ee650035ba8b~ez7FfV3BM2114721147eucas1p1M;
 Mon, 17 Oct 2022 09:01:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 13.6E.07817.8D91D436; Mon, 17
 Oct 2022 10:01:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221017090112eucas1p14c4188aedb9fc8127e274eb6bbc4dc72~ez7E539c00803808038eucas1p1I;
 Mon, 17 Oct 2022 09:01:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221017090112eusmtrp24702d0415d328ccc08e094f0c3cbea22~ez7E4qy9V2417324173eusmtrp2d;
 Mon, 17 Oct 2022 09:01:12 +0000 (GMT)
X-AuditID: cbfec7f4-893ff70000011e89-b8-634d19d8937e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B7.8C.07473.8D91D436; Mon, 17
 Oct 2022 10:01:12 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221017090111eusmtip1d6a8f4071bda8e2088448532c370109f~ez7Dx600n2965029650eusmtip1I;
 Mon, 17 Oct 2022 09:01:10 +0000 (GMT)
Message-ID: <2b0350ba-070a-8df0-9a2d-8c18da03b6cb@samsung.com>
Date: Mon, 17 Oct 2022 11:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v7 01/10] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <76423028-e58e-7271-0d74-fb4bb2bf65c8@denx.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRzved93737k6GWSexQPut3ppRVEp/V0dErFdS8HepxX/3BnMdkb
 UmPYBmnY1Yjkx1IboDFeQ8ZBAjNQJgGioSzOUZMhHM4Bg2H5C4SCMZJhYtteLP77fD+f7+f5
 fL/fewS45Di5TpChymbUKrlSRoqI1iu+vpeca3ekvdy2FI1cIzYcuWvmCHR/pJ5Eg/N/kejI
 D3YeKnXrCeQ160l0b6yfQL1fTfFRcUktH9XpO0lk/sPBQ7rFBhwZ+joxNFWQB5Dt9zM4+i3v
 EIEGjv1CIg9706+WTZCov8eDowcPe/G4NXTjrJtHn2R7CPpYTzePth8eJenz7CifPlFUwaNr
 Lk5gdPf1Gh7tclwkafc3Vow+V/sl3fxnO0YfbTEBes4ckRySInpDwSgzPmXU0dtSRXsHzV3E
 PoP0QIPXw9MCn0QHhAJIbYF5CzVkAEuoegDbLhzUAZEfewFs8jUSnDAH4J37W58YFvSFGNdU
 B6Ch3sHnilkAh8ddeKBLTG2DM1NaXgAT1AZ4wTlEcnwo/LXiVvDVZykFHLLPYAG8mkqAVSMt
 QS9OSeHwraogH0bRcOleKxEIwCknCT3F/UGBpGKgbloXfFRIxcKOG9dIzhwJ8386gQcMkNKJ
 4MI/7YCbOx7aTPplvBpOWlv4HF4PH5+vwjhDIYDGh+7lQg+g9u7wsiMWuuyL/giBP2ITPNMR
 zdFvwpKbY0SAhlQIdE6HckOEwNLWcpyjxbCoYPnWGyFrbfovtuvaAK4HMnbFXdgV+7Mr1mH/
 zzUCwgSkTI4mM53RvKJi9kdp5JmaHFV6VFpWphn4f65tyeptB3WTs1EWgAmABUABLgsTv+NN
 SpOIFfLPchl11gfqHCWjsYBwASGTiknD5jQJlS7PZj5mmH2M+omKCYTrtNhTHz4nanDaHZvi
 X+27EuE97Sopifw8sfLcKqF096JxBzN/YNIEehWdIc7v9qy62rZ9NEtFH9mSmSJ/r+y18lTs
 8qDTUtn843z+nS7fxIPbG79/O6LaeL3Q+PTP4SpVpCv6rXdvvH92PD5uIvmTDMO34RWNlwp2
 xtq2t2QdzThdpu984fDfCdrXi5oqw4tCn5/XnVL0ZXsSTiX1qgFRfrB7/ejaUIodLzM9+ii/
 1kpL+DFkrsKEvo5bAFRz4tLArANdvntV3rw/5STCL6m7xgoO5W4VVg3kxSftiQxLf1R8+xnf
 0MxjpWXXF9MFOcm7p9ZUp1pfZDcofdVY09mO0jornSgjNHvlMZtxtUb+L+OI/KYoBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsVy+t/xu7o3JH2TDdr3clncuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBaT7k9gsfiyaQKbxYt7F1kszja9YbfonLiE3WL5hH1sFpseX2O1
 6Pq1ktlixvl9TBZv2hoZLU4/Ws9scaqxlcXi0pTDbBafZj0Eyk5+yWZx8cQnZovvv88yO4h5
 rP14n9Vj3qwTLB5TThxh9TjXc5fNY+esu+wesztmsnos3vOSyePI1cWsHneu7WHzuN99nMlj
 85J6j43vdjB59G1ZxejxeZNcAF+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWR
 qZK+nU1Kak5mWWqRvl2CXsaVTQdZCmaIV6z88om1gfGnUBcjJ4eEgInEjwntTCC2kMBSRont
 5xgh4jISJ6c1sELYwhJ/rnWxdTFyAdW8Z5T49msPM0iCV8BO4sMbiCIWAVWJ3TduskHEBSVO
 znzCAmKLCqRIrF69F8wWFvCUmH97C1gvs4C4xK0n88EWiwh4SPx7sY0FZAGzwC02iVNnVjBD
 bHvBLLHv7X2wKjYBQ4mut11gGzgFrCV2Xb/ABjHJTKJraxcjhC0v0bx1NvMERqFZSA6ZhWTh
 LCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iRGYZLYd+7l5B+O8Vx/1DjEycTAe
 YpTgYFYS4XX74pMsxJuSWFmVWpQfX1Sak1p8iNEUGBoTmaVEk/OBaS6vJN7QzMDU0MTM0sDU
 0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoEpVGDpvac8n37m8b3xCFAPsM7q8/rWfki3
 VGFr62Q2r9JLZfdvnZjAzfgorOqPnPQxt3N/5mVWu+h0vBN5c2RDNMOUiaqm5d57tJKWe7vn
 ffd4w24r+3niUs/KwLjEhwXz3pw45MzetWjplBrH3SdT3yQKcK5WLJt7guXG1B1Sf2vq/gb/
 2Mltpint+mjemddK7IdY31ZVSl9nmrwg4wW7+wwjH/b361jzVFblrIuXbd+57//R2s6PubdO
 fLbe8vJUMvvO1b9itwvoTbS021t566vRQc4Gmb8Ob46Lfl5s/1r6HtfUIwmKOY/EXSJnsbdO
 yQhfnFNmzLRAKfyq52aVRUwLUy4v1py9Wkk2a9V2JZbijERDLeai4kQAycRD57sDAAA=
X-CMS-MailID: 20221017090112eucas1p14c4188aedb9fc8127e274eb6bbc4dc72
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221017084832eucas1p190091bef8dce651ad0bf582880a56117
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221017084832eucas1p190091bef8dce651ad0bf582880a56117
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-2-jagan@amarulasolutions.com>
 <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
 <CAMty3ZAw-iXKcYgWuPCT_RwksKHVSipxL6tXb6WNLEeB7YvYmA@mail.gmail.com>
 <bad48f67-5fe6-d69c-51b0-bac3fa9d2719@denx.de>
 <CAMty3ZBLQu8YijrSVdt84-J9hoOx8qcRSaGF-FvZVsJEWVaXjQ@mail.gmail.com>
 <CGME20221017084832eucas1p190091bef8dce651ad0bf582880a56117@eucas1p1.samsung.com>
 <76423028-e58e-7271-0d74-fb4bb2bf65c8@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17.10.2022 10:48, Marek Vasut wrote:
> On 10/17/22 09:43, Jagan Teki wrote:
>> On Mon, Oct 17, 2022 at 12:49 PM Marek Vasut <marex@denx.de> wrote:
>>> On 10/17/22 04:49, Jagan Teki wrote:
>>>> On Sun, Oct 16, 2022 at 3:16 AM Marek Vasut <marex@denx.de> wrote:
>>>>>
>>>>> On 10/5/22 17:13, Jagan Teki wrote:
>>>>>> Samsung MIPI DSIM controller is common DSI IP that can be used in 
>>>>>> various
>>>>>> SoCs like Exynos, i.MX8M Mini/Nano.
>>>>>>
>>>>>> In order to access this DSI controller between various platform 
>>>>>> SoCs,
>>>>>> the ideal way to incorporate this in the drm stack is via the drm 
>>>>>> bridge
>>>>>> driver.
>>>>>>
>>>>>> This patch is trying to differentiate platform-specific and 
>>>>>> bridge driver
>>>>>> code by maintaining exynos platform glue code in exynos_drm_dsi.c 
>>>>>> driver
>>>>>> and common bridge driver code in samsung-dsim.c providing that 
>>>>>> the new
>>>>>> platform-specific glue should be supported in the bridge driver, 
>>>>>> unlike
>>>>>> exynos platform drm drivers.
>>>>>>
>>>>>> - Add samsung_dsim_plat_data for keeping platform-specific 
>>>>>> attributes like
>>>>>>      host_ops, irq_ops, and hw_type.
>>>>>>
>>>>>> - Initialize the plat_data hooks for exynos platform in 
>>>>>> exynos_drm_dsi.c.
>>>>>>
>>>>>> - samsung_dsim_probe is the common probe call across 
>>>>>> exynos_drm_dsi.c and
>>>>>>      samsung-dsim.c.
>>>>>>
>>>>>> - plat_data hooks like host_ops and irq_ops are invoked during the
>>>>>>      respective bridge call chains.
>>>>>
>>>>> Maybe the Subject should say "Split ... driver" or "Move ... 
>>>>> driver" ,
>>>>> since it is not adding a new driver here ?
>>>>
>>>> Though it is not added a completely new driver, it is adding more
>>>> infrastructure platform code to be compatible with both Exynos and
>>>> i.MX8M. This is the prime reason for adding that commit head and
>>>> explaining the same in the commit body.
>>>
>>> Diffstat looks like this:
>>>
>>>    drivers/gpu/drm/bridge/samsung-dsim.c   | 1703 
>>> ++++++++++++++++++++++
>>>    drivers/gpu/drm/exynos/Kconfig          |    1 +
>>>    drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1766 
>>> ++---------------------
>>>    include/drm/bridge/samsung-dsim.h       |  113 ++
>>>    7 files changed, 1952 insertions(+), 1653 deletions(-)
>>>
>>> Looks to me like most of the code is just moved from existing driver in
>>> this patch.
>>
>> Yeah, as I explained (from commit) it is moved, updated, and written
>> the plat code. How about this head?
>>
>> "drm: bridge: Add Samsung DSIM bridge (Split from exynos_drm_dsi)"
>
> I disagree with the "Add" part of the Subject, but I'll wait for 
> others' opinion here.

Maybe something like a "Generalize Exynos-DSI DRM driver into a generic 
Samsung DSIM bridge"?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

