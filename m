Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F151F75F
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 11:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DBC10E5EC;
	Mon,  9 May 2022 09:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704A710E61E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 09:00:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220509090016euoutp01569cd25d98b2dc149803d88d9aaf3121~tZDTLJdpv1963519635euoutp01W
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 09:00:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220509090016euoutp01569cd25d98b2dc149803d88d9aaf3121~tZDTLJdpv1963519635euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652086816;
 bh=xHGwgyfWcy9H8EY4YfLHXODHjPqPIGpTdaVHb+9SW3g=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=omhFfmODVdXeOOkMy4dzNzC8X9EWr90dnyh0Nx/5FkPuPhDJEOc5l/AgyJfV2Ncnc
 wyCGVDFoTJNmedlCIcczJWmD3jVvEtmpv+zNaUVabLSbq2AslmLLMckZ4FDCGK/inK
 N3gnEzxVCrm8kK4liwJpsmYlhYxAzw5t+xFUUV6M=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220509090015eucas1p2c6374150c3e52fe48bf399852132291e~tZDSsvJQB3116831168eucas1p2H;
 Mon,  9 May 2022 09:00:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CC.23.10009.F18D8726; Mon,  9
 May 2022 10:00:15 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220509090015eucas1p2627c009bd9e399ad59a97f4bd0e5a99e~tZDSFJk-E2905829058eucas1p2h;
 Mon,  9 May 2022 09:00:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220509090015eusmtrp25cd4312d4d321a6091b912f5d2adbe18~tZDSEFh-F0642106421eusmtrp2a;
 Mon,  9 May 2022 09:00:15 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-86-6278d81fd523
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F4.A5.09404.E18D8726; Mon,  9
 May 2022 10:00:14 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220509090013eusmtip16f527f3083a24fcd364d47ebbd7f3f34~tZDQZ76SQ0550705507eusmtip1c;
 Mon,  9 May 2022 09:00:13 +0000 (GMT)
Message-ID: <eacd32d6-f2a7-b397-630d-2e07f2bf4a49@samsung.com>
Date: Mon, 9 May 2022 11:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: (EXT) Re: (EXT) [PATCH v2 00/12] drm: bridge: Add Samsung MIPI
 DSIM bridge
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAPY8ntD2uPqrb8mHy5ButBpWoBV5Z-epkHsL7SPha=TjMzP9jw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7djP87ryNyqSDJ59VbO4c/s0s8XrKWuZ
 LO4v/sxi8fr2CjaLt3MXs1hc+fqezaJ36TlWiy+bJrBZvLh3kcXibNMbdovOiUvYLZZP2Mdm
 senxNVaLrl8rmS1mnN/HZHH60Xpmi1ONrSwWh/qiLT7NeggUn/ySzeL777PMDqIeaz/eZ/V4
 f6OV3WPKiSOsHi8m/GPy2DnrLrvH7I6ZrB6L97xk8jhydTGrx51re9g87ncfZ/LYvKTeY+O7
 HUwerUd/sXj0bVnF6PF5k1wAfxSXTUpqTmZZapG+XQJXxrlLm5kKvhlUnPl7mrGB8Zl6FyMn
 h4SAicSbhx9YQWwhgRWMEsvXl3UxcgHZXxglnm25yALhfGaUeP/9CztMx4Ob65khOpYzSrw9
 IQBR9JFRYsP76WBFvAJ2EtNOH2IDsVkEVCRuXt/ICBEXlDg58wkLiC0qkCTx5s1VsEHCApES
 nV0rweqZBcQlbj2ZzwRiiwgYSxxbdZcNZAGzwER2iZ27esAWsAkYSnS97QJr4BQIlNjwYikT
 RLO8xPa3c5ghLu3jkpi5QwvCdpGYO3MyI4QtLPHq+Baob2Qk/u8EWcYBZOdL/J1hDBGukLj2
 eg3UGGuJO+d+sYGUMAtoSqzfpQ8RdpR4fbeLGaKTT+LGW0GIA/gkJm2bDhXmlehoE4KoVpOY
 dXwd3M6DFy4xT2BUmoUUJrOQ/D4LySuzEPYuYGRZxSieWlqcm55abJiXWq5XnJhbXJqXrpec
 n7uJEZhoT/87/mkH49xXH/UOMTJxMB5ilOBgVhLh3d9XkSTEm5JYWZValB9fVJqTWnyIUZqD
 RUmcNzlzQ6KQQHpiSWp2ampBahFMlomDU6qBqVH5j/2EPxyNwSLZDJUzQ5OOlm1xFlKZ9v/F
 iw2Xc6ZH9El/XTT5Z/U5049lay50GNWlipyvOXGI9VS3QPKM2vPx206t8GTTThJbNM0j50nb
 ulQuoQULoh3dQx44MLCd2h99tlagU8Ukoyd3xcucGffZH7PwNnPk1j1v2pi+yXTKxstrnRbN
 P35l8Z6U1ffVCrSW2y+co75qc0ji39N/eu2Zfayb9Nu1Q57n7tqrxVbwdfZPl8wTjuwVhxMv
 5k7xT7uxT2fGhSUzdiq2GUru+p8laTaxteW82rHJn6Ov3Fm4YH/hggvz2IV19ugtaFhQWqXD
 s3jFrr0Lrm9QNMuJakp2qXmbdds8i3PtCt7+bCWW4oxEQy3mouJEACSaEOEjBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsVy+t/xu7pyNyqSDH4fs7S4c/s0s8XrKWuZ
 LO4v/sxi8fr2CjaLt3MXs1hc+fqezaJ36TlWiy+bJrBZvLh3kcXibNMbdovOiUvYLZZP2Mdm
 senxNVaLrl8rmS1mnN/HZHH60Xpmi1ONrSwWh/qiLT7NeggUn/ySzeL777PMDqIeaz/eZ/V4
 f6OV3WPKiSOsHi8m/GPy2DnrLrvH7I6ZrB6L97xk8jhydTGrx51re9g87ncfZ/LYvKTeY+O7
 HUwerUd/sXj0bVnF6PF5k1wAf5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGp
 kr6dTUpqTmZZapG+XYJexrlLm5kKvhlUnPl7mrGB8Zl6FyMnh4SAicSDm+uZuxi5OIQEljJK
 vPqzlwkiISNxcloDK4QtLPHnWhcbRNF7Rok7E2exgyR4Bewkpp0+xAZiswioSNy8vpERIi4o
 cXLmE5YuRg4OUYEkiSOH+UHCwgKREp1dK8HKmQXEJW49mQ+2S0TAWOLYqrtg85kFprJLvGud
 zQSxbBqzxNnbk8Gq2AQMJbredoF1cwoESmx4sZQJYpKZRNfWLkYIW15i+9s5zBMYhWYhuWMW
 koWzkLTMQtKygJFlFaNIamlxbnpusZFecWJucWleul5yfu4mRmCK2Xbs55YdjCtffdQ7xMjE
 wXiIUYKDWUmEd39fRZIQb0piZVVqUX58UWlOavEhRlNgYExklhJNzgcmubySeEMzA1NDEzNL
 A1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBibLuK4Q1sXpTRHnGrYuiuRcP6ksjYvr
 ar3XPO7JfEvz27O+iZi7agr+Ld81LU79hGLDlR29DH8Wm218OE/O0OVRS7D6/Mk8SUF+Fw/H
 CyavZWrqenhjYtSWzYddqucZzAkqPPPxYmSz8azZfGHO565u7Pzyx84ixiU5NvZG/Jre/oMB
 JvxCs9Mn6mtxvitbk891SvXspE/yXU+bJjQ8tv7Ytr1CO3xdZLSP3cdXObq7YrPvVZ2Z5L4z
 P6Toue0ZRrYnGgx/tiXJf5JVFXO4ZHQwZ/ufeUs0Ts4TCPmZc2Mup/0v7f2/HEXcLjYXOdif
 3j6pdMFGh0rVaX/fPWouDl18uH/9qf+ynVprFq6IrlViKc5INNRiLipOBAAQMif5ugMAAA==
X-CMS-MailID: 20220509090015eucas1p2627c009bd9e399ad59a97f4bd0e5a99e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220505115537eucas1p16234d185961ff5f3fd8c6c1e5e4fb8d0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220505115537eucas1p16234d185961ff5f3fd8c6c1e5e4fb8d0
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <2184168.iZASKD2KPV@steina-w>
 <CAMty3ZAuTzdzj9v4weqJfxQKhM57XuwSzSAX86NHTcCp14uBBw@mail.gmail.com>
 <CGME20220505115537eucas1p16234d185961ff5f3fd8c6c1e5e4fb8d0@eucas1p1.samsung.com>
 <3104069.5fSG56mABF@steina-w>
 <5671f394-763d-a999-a300-a230199e1eda@samsung.com>
 <CAPY8ntD2uPqrb8mHy5ButBpWoBV5Z-epkHsL7SPha=TjMzP9jw@mail.gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Robert Foss <robert.foss@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On 06.05.2022 12:50, Dave Stevenson wrote:
> On Fri, 6 May 2022 at 09:57, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 05.05.2022 13:55, Alexander Stein wrote:
>>> Am Donnerstag, 5. Mai 2022, 09:38:48 CEST schrieb Jagan Teki:
>>>> On Thu, May 5, 2022 at 12:57 PM Alexander Stein
>>>>
>>>> <alexander.stein@ew.tq-group.com> wrote:
>>>>> Hello Jagan,
>>>>>
>>>>> thanks for the second version of this patchset.
>>>>>
>>>>> Am Mittwoch, 4. Mai 2022, 13:40:09 CEST schrieb Jagan Teki:
>>>>>> This series supports common bridge support for Samsung MIPI DSIM
>>>>>> which is used in Exynos and i.MX8MM SoC's.
>>>>>>
>>>>>> Previous v1 can be available here [1].
>>>>>>
>>>>>> The final bridge supports both the Exynos and i.MX8MM DSI devices.
>>>>>>
>>>>>> On, summary this patch-set break the entire DSIM driver into
>>>>>> - platform specific glue code for platform ops, component_ops.
>>>>>> - common bridge driver which handle platform glue init and invoke.
>>>>>>
>>>>>> Patch 0000:   Samsung DSIM bridge
>>>>>>
>>>>>> Patch 0001:   Common lookup code for OF-graph or child
>>>>>>
>>>>>> Patch 0002:   platform init flag via driver_data
>>>>>>
>>>>>> Patch 0003/10:  bridge fixes, atomic API's
>>>>>>
>>>>>> Patch 0011:   document fsl,imx8mm-mipi-dsim
>>>>>>
>>>>>> Patch 0012:   add i.MX8MM DSIM support
>>>>>>
>>>>>> Tested in Engicam i.Core MX8M Mini SoM.
>>>>>>
>>>>>> Anyone interested, please have a look on this repo [2]
>>>>>>
>>>>>> [2] https://protect2.fireeye.com/v1/url?k=569d5207-09066afa-569cd948-000babff317b-7f7572918a36c54e&q=1&e=1305c5cc-33c8-467e-a498-6862a854cf94&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v2
>>>>>> [1]
>>>>>> https://patchwork.kernel.org/project/dri-devel/cover/20220408162108.1845
>>>>>> 83-> 1-jagan@amarulasolutions.com/
>>>>>>
>>>>>> Any inputs?
>>>>> I was able to get my LVDS display running using this driver and an LVDS
>>>>> bridge. Actually my setup is similar to yours. My chain is like this:
>>>>> MIPI-DSI -> sn65dsi83 -> LVDS panel
>>>>> I noticed some things though:
>>>>> My setup only works if I use less than 4 lanes. See [1]. When using 4
>>>>> lanes
>>>>> the image is flickering, but the content is "visible". Your DT has only 2
>>>>> lanes configured, do you have the possibility to use 4 lanes? I have no
>>>>> idea how to tackle this. It might be the DSIM side or the bridge side.
>>>>> Apparently the downstream kernel from NXP supports 4 lanes, if I can trust
>>>>> the config. I have no way to verify this though.
>>>> What is dsi_lvds_bridge node? have you added your dts changes on top
>>>> of imx8mm-dsi-v2 branch I'm pointing it.
>>>>
>>>> I will check 4 lanes and let you know.
>>>>
>>>>> Another thing is I get the following warning
>>>>>
>>>>>> sn65dsi83 2-002d: Unsupported LVDS bus format 0x100a, please check
>>>>>> output
>>>>> bridge driver. Falling back to SPWG24.
>>>> This couldn't be much affected but will fix it.
>>> I found the cause. You need the following diff:
>>> ----8<-----
>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/
>>> samsung-dsim.c
>>> index 138323dec0eb..7fb96dc7bb2e 100644
>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> @@ -1427,7 +1427,7 @@ static int samsung_dsim_attach(struct drm_bridge
>>> *bridge,
>>>    {
>>>           struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>>>
>>> -       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL,
>>> flags);
>>> +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
>>> flags);
>>>    }
>>>
>>>    static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
>>> ----8<-----
>> Well, basically, the above change breaks DSI panels. :(
>>
>> I've spent another evening playing with that code and I have some more
>> thoughts...
>>
>> I agree that logically this should be like you pointed. However the the
>> code has been hacked in such a way, that it forces a proper order of
>> pre-enable operations of the DSI and the client (panel, next bridge).
>> This works somehow with a chain of 2 entities (Trats board: DSI and a
>> panel) or even 3 entities (Arndale board: DSI, TC358764 bridge, panel),
>> but probably it fails in your case.
>>
>> I really have no clue how to fix this mess. It has been pointed many
>> times that this insane per-order call chain of the pre_enable()
>> operations is completely useless for the DSI hardware and noone pointed
>> how to solve this. Exynos DSI (and VC4) called those operations directly
>> to achieve proper order. So what happened? Now Exynos DSI got converted
>> to the generic bridge call chain. To get it working with existing hw,
>> the order of the bridges has been hacked. Probably in the next few
>> releases more mess will come to get around this known issue, especially
>> when support for the next set of imx boards is added.
>>
>> I'm really open to help fixing this issue. I've spent a lot of time
>> analyzing this code and I have boards to test. Just please give me some
>> advice how to avoid this reverse-order call chain of the pre_enable()
>> operations in the widely accepted, non-hacky way.
> I sent [1] to try and offer a solution for DSI back in March, but no
> one has responded to it at all. Care to review it?

Thanks, I will post my comments there soon. It finally resolves all the 
issues I found with the Exynos DSI driver converted to DRM bridge.

> As noted in the cover letter for that series, splitting the
> bridge_chain (as Exynos and vc4 do) does not work with atomic
> operations due to the bridges beyond the split never being added to
> the state. That approach is a dead end, and I'm trying to move vc4
> away from it. That's not possible until the framework issue is
> resolved, unless you adopt the hack done by dw-mipi and msm to power
> up the DSI host in mode_set.

Well, it is the first time one has pointed me WHY moving the bridge 
chain management to DRM core is really needed and what are the drawbacks 
of the old approach! Thanks again!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

