Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE1051D3D6
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 10:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC3F10F3D3;
	Fri,  6 May 2022 08:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DD810F063
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 08:57:09 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220506085707euoutp027a963cf822143763b0af6fddbdbfe6e5~seEsn_vo31037910379euoutp02j
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 08:57:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220506085707euoutp027a963cf822143763b0af6fddbdbfe6e5~seEsn_vo31037910379euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651827427;
 bh=sfveXk3E0NDI8KjdEG//oYNe5peEe1lkpBeOGWSeZI4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=UO7582sgOxIZiG+EEd+RH2/pNNYPs0t66aWSi5ShSAs1lqRX/2skSodUN/ust2udt
 Yayx3p0l0FyKR0sk5OiE79W95qJZbFPDC9My+IAWbp0cP1iSwcKIsaiS9Vmdr7p59e
 WTEXVn4YetEbIUXHY+V/D1m3Rmk7epR095HgCbcg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220506085707eucas1p13df99c84d4f9a02c87cceb55fa9fbde1~seEsLVXGA3265632656eucas1p16;
 Fri,  6 May 2022 08:57:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5D.CD.09887.2E2E4726; Fri,  6
 May 2022 09:57:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220506085706eucas1p1f4b633218180f12cbc3e0cd0caa09311~seEromJYk0433304333eucas1p1L;
 Fri,  6 May 2022 08:57:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220506085706eusmtrp2707f8ab766dba8090aa700b48c3a376a~seErnlhaB2204722047eusmtrp2Q;
 Fri,  6 May 2022 08:57:06 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-03-6274e2e27e09
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id AC.BA.09522.2E2E4726; Fri,  6
 May 2022 09:57:06 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220506085705eusmtip1a8bc1e0761edc10040dbb4f134c5b559~seEqjM_Fy3217232172eusmtip10;
 Fri,  6 May 2022 08:57:05 +0000 (GMT)
Message-ID: <5671f394-763d-a999-a300-a230199e1eda@samsung.com>
Date: Fri, 6 May 2022 10:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: (EXT) Re: (EXT) [PATCH v2 00/12] drm: bridge: Add Samsung MIPI
 DSIM bridge
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Jagan Teki
 <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <3104069.5fSG56mABF@steina-w>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdRzH/T7Ps2cPu6aPY8o3MuyWoHIK0c9vvxSTo+eu6LzrjjLuiA0f
 JwKbbVDmVYIFyRw4EAmGhjUIpUQFmmIbneOXtAMCYxAb7gQuxzYwYERaWIxnFv+9Pu/P+32f
 z+d7XwoXlZGhVJoii1UppBkSUkAYO+72bh0dzZI9ccT2AnLYrTjylJ7HkNMwSyCP/SyJfpm7
 Q6LCmh4eKnHqCORr0JHIdbOPQN1HvHxUUFzNR7W6FhI1jNl4SHPvHI7Ke1swZB29gKOfcvMI
 ZClKQjP6W4v6iQkS9V2fwdH8X9147Frm/LSTx9wZyuMzpdfbeIxLdx9jerQjJNOsH+EzlUcr
 eIzBNIExbQMGHuOwmUjGeawTYxqrDzOXpq5gTFFTHWBmG8J2rXpH8NIeNiPtfVYVvS1FsK/G
 McE/cGbjwePthbwccHu9BgRRkH4aXjb18zRAQInoswDO2wwEV/gAtDtzA8UsgJ6LZfwHkWZn
 ayBSC+CcywS4YhrAttKpxQhFCelt8FIr5g8Q9AY4tuBbYiG9GnZVjBN+XkPLoNc7gPs5mN4N
 CzTnSD/jdAgcHq9a8ovpFHiyXE9w+jAJT7Yq/EzSMVAzqVnyB9GRcNjm5nOe9fDy5Cncvw+k
 iwQw/+8hjNs6Drq/rcQ5DobuzqbANevgP83+YdQiK+FC+VOcfBDaPN8F7C9CR8890m/B6c3w
 wtVoTt4BPSManEuuhEOTq7kNVsIS4xcBWQiP5os4dwTUd9b/N/Paz/24Dkj0y95Ev+x2/bJb
 9P/PPQOIOhDCZqsz5az6SQX7QZRamqnOVsijUpWZDWDx61rvd/qugFr3dJQFYBSwAEjhErEw
 WJ8lEwn3SD88xKqU76qyM1i1BTxCEZIQYWraRamIlkuz2HSWPcCqHnQxKig0B5O/ZzJbTwx1
 nd7y+qpabeP4M3M3QzvEoU2/OuL/jHc/HtkX/mny3fwYp8h8PHHH15oVtqrPf3zOu/EGpn3W
 VvRyMS/2of79phtBxh8qahIf+6gjuT1FNXBssPkPhy4VdzU2JsyrFiQOgcT7VhS9qb5qzJEK
 b4WldOlmdhnNeXnxlNFwuKBOXLb1kxWnd+83r/0q9mGXdvvH0Qn8pHBZhEA+ldD7mWzc/mjO
 XmV9vj3M2WIqHCzR3rb87nt1LP0bJN6UZM8ofz7ztfZDCdYcZYRiMnm74LdXdu7sXoh++w3j
 ug2Vhd43vwz5PnFwtC5OVzxrjZvuPRWea10DGGvc5uoYczopIdT7pDGRuEot/Rds6SYiKQQA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsVy+t/xu7qPHpUkGXzcKmJx5/ZpZovXU9Yy
 Wdxf/JnF4vXtFWwWV76+Z7PoXXqO1WLS/QksFl82TWCzeHHvIovF2aY37BadE5ewWyyfsI/N
 YtPja6wWXb9WMlvMOL+PyeL0o/XMFqcaW1ksDvVFW3ya9RAoPvklm8XFE5+YLb7/PsvsIOax
 9uN9Vo/3N1rZPaacOMLq8WLCPyaPcz132Tx2zrrL7jG7Yyarx+I9L5k8jlxdzOpx59oeNo/7
 3ceZPDYvqffY+G4Hk0ffllWMHp83yQXwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hka
 m8daGZkq6dvZpKTmZJalFunbJehlLL3zkr1ggXpF/9Fe1gbG5/JdjJwcEgImEjvvH2btYuTi
 EBJYyiixfPMURoiEjMTJaQ2sELawxJ9rXWwQRe8ZJXb+P8nUxcjBwStgJ7HxMBNIDYuAisTj
 v1/AbF4BQYmTM5+wgJSICiRJHDnMDxIWFoiU6OxayQZiMwuIS9x6Mh+sXEQgQeL7hUVQ8Tts
 ErMeqEKsmsUk8Xx5J1gRm4ChRNfbLrAiTgEtiVvXXrFDNJhJdG3tYoSw5SW2v53DPIFRaBaS
 M2Yh2TcLScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBCaabcd+bt7BOO/VR71D
 jEwcjIcYJTiYlUR4hWeVJAnxpiRWVqUW5ccXleakFh9iNAWGxURmKdHkfGCqyyuJNzQzMDU0
 MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYOo44pIwb0Z1S+1T+0VN4WFZdzNP
 CYou27JEhUH73c+8WtO8vqc1ebZbpTrO1lpd7WsMcPW+d8N2sp+t3boz273zzvzOcjvzbUFK
 VI+fIo/9O5V27/veonsfedn1HTnWfF/u4zKv3vkZn1lrJ+p41BT+rlspynT6XnHqyq6jiS/W
 x25N9DrzvX9JD5uSwe+5TAK5ytu3xs5m+HMg0KZj8Z3e+6WRbueW6AS9PBtzqXVdYko6W8Li
 yRvcImpZwhLsjYvSrzPdmMcg7++1cENrIaP3vYm7jqct1FpzaGJGtM7Pmt3/C57ZH33yU33b
 lTYd5vtv1kzaprzD4ttE7kBlMbaPNZqPtuqtqX4zb19FihJLcUaioRZzUXEiAN9R7e+9AwAA
X-CMS-MailID: 20220506085706eucas1p1f4b633218180f12cbc3e0cd0caa09311
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
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
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

Hi Alexander,

On 05.05.2022 13:55, Alexander Stein wrote:
> Am Donnerstag, 5. Mai 2022, 09:38:48 CEST schrieb Jagan Teki:
>> On Thu, May 5, 2022 at 12:57 PM Alexander Stein
>>
>> <alexander.stein@ew.tq-group.com> wrote:
>>> Hello Jagan,
>>>
>>> thanks for the second version of this patchset.
>>>
>>> Am Mittwoch, 4. Mai 2022, 13:40:09 CEST schrieb Jagan Teki:
>>>> This series supports common bridge support for Samsung MIPI DSIM
>>>> which is used in Exynos and i.MX8MM SoC's.
>>>>
>>>> Previous v1 can be available here [1].
>>>>
>>>> The final bridge supports both the Exynos and i.MX8MM DSI devices.
>>>>
>>>> On, summary this patch-set break the entire DSIM driver into
>>>> - platform specific glue code for platform ops, component_ops.
>>>> - common bridge driver which handle platform glue init and invoke.
>>>>
>>>> Patch 0000:   Samsung DSIM bridge
>>>>
>>>> Patch 0001:   Common lookup code for OF-graph or child
>>>>
>>>> Patch 0002:   platform init flag via driver_data
>>>>
>>>> Patch 0003/10:  bridge fixes, atomic API's
>>>>
>>>> Patch 0011:   document fsl,imx8mm-mipi-dsim
>>>>
>>>> Patch 0012:   add i.MX8MM DSIM support
>>>>
>>>> Tested in Engicam i.Core MX8M Mini SoM.
>>>>
>>>> Anyone interested, please have a look on this repo [2]
>>>>
>>>> [2] https://protect2.fireeye.com/v1/url?k=569d5207-09066afa-569cd948-000babff317b-7f7572918a36c54e&q=1&e=1305c5cc-33c8-467e-a498-6862a854cf94&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v2
>>>> [1]
>>>> https://patchwork.kernel.org/project/dri-devel/cover/20220408162108.1845
>>>> 83-> 1-jagan@amarulasolutions.com/
>>>>
>>>> Any inputs?
>>> I was able to get my LVDS display running using this driver and an LVDS
>>> bridge. Actually my setup is similar to yours. My chain is like this:
>>> MIPI-DSI -> sn65dsi83 -> LVDS panel
>>> I noticed some things though:
>>> My setup only works if I use less than 4 lanes. See [1]. When using 4
>>> lanes
>>> the image is flickering, but the content is "visible". Your DT has only 2
>>> lanes configured, do you have the possibility to use 4 lanes? I have no
>>> idea how to tackle this. It might be the DSIM side or the bridge side.
>>> Apparently the downstream kernel from NXP supports 4 lanes, if I can trust
>>> the config. I have no way to verify this though.
>> What is dsi_lvds_bridge node? have you added your dts changes on top
>> of imx8mm-dsi-v2 branch I'm pointing it.
>>
>> I will check 4 lanes and let you know.
>>
>>> Another thing is I get the following warning
>>>
>>>> sn65dsi83 2-002d: Unsupported LVDS bus format 0x100a, please check
>>>> output
>>> bridge driver. Falling back to SPWG24.
>> This couldn't be much affected but will fix it.
> I found the cause. You need the following diff:
> ----8<-----
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/
> samsung-dsim.c
> index 138323dec0eb..7fb96dc7bb2e 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1427,7 +1427,7 @@ static int samsung_dsim_attach(struct drm_bridge
> *bridge,
>   {
>          struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>   
> -       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL,
> flags);
> +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> flags);
>   }
>   
>   static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
> ----8<-----

Well, basically, the above change breaks DSI panels. :(

I've spent another evening playing with that code and I have some more 
thoughts...

I agree that logically this should be like you pointed. However the the 
code has been hacked in such a way, that it forces a proper order of 
pre-enable operations of the DSI and the client (panel, next bridge). 
This works somehow with a chain of 2 entities (Trats board: DSI and a 
panel) or even 3 entities (Arndale board: DSI, TC358764 bridge, panel), 
but probably it fails in your case.

I really have no clue how to fix this mess. It has been pointed many 
times that this insane per-order call chain of the pre_enable() 
operations is completely useless for the DSI hardware and noone pointed 
how to solve this. Exynos DSI (and VC4) called those operations directly 
to achieve proper order. So what happened? Now Exynos DSI got converted 
to the generic bridge call chain. To get it working with existing hw, 
the order of the bridges has been hacked. Probably in the next few 
releases more mess will come to get around this known issue, especially 
when support for the next set of imx boards is added.

I'm really open to help fixing this issue. I've spent a lot of time 
analyzing this code and I have boards to test. Just please give me some 
advice how to avoid this reverse-order call chain of the pre_enable() 
operations in the widely accepted, non-hacky way.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

