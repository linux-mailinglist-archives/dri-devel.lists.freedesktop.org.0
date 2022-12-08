Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC2646F79
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 13:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AAA10E1E7;
	Thu,  8 Dec 2022 12:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B85510E1FB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 12:21:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221208122108euoutp022ae9e39a91b3ac1972b6325e93b46e59~u0MfhDMSB1870318703euoutp02k
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 12:21:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221208122108euoutp022ae9e39a91b3ac1972b6325e93b46e59~u0MfhDMSB1870318703euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670502068;
 bh=NbiZIFa1LbzOKBCHdFsM46hCHi/HmmuLv2EyyJEgnGM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Ra4uxc1VeZxyu96jdnsKcqkTvr4MGV7iGqeeEuje9n5PSzU+SixVCS1MAg6UCun9G
 syg3tADHV7D/jOmTMAOmmeugmEJSbjTzw4mwvKmo8JSLiRFcjVMXT1yUi0dxBlI19v
 Nzc/DMvfit2ltIsHWW5R4gD6tuQg3SMcpFS12SmI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221208122108eucas1p1a327a8f7eb3830c47fad6e42318c878b~u0MfKiGJG1436614366eucas1p1V;
 Thu,  8 Dec 2022 12:21:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 51.A0.10112.4B6D1936; Thu,  8
 Dec 2022 12:21:08 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221208122107eucas1p16d0e59d81a1c2936948d700553006aa8~u0MetR9uQ1439014390eucas1p1_;
 Thu,  8 Dec 2022 12:21:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221208122107eusmtrp2774eb4b9eaf26e3c56d24e17ac0c5c81~u0MeruarX1377213772eusmtrp2K;
 Thu,  8 Dec 2022 12:21:07 +0000 (GMT)
X-AuditID: cbfec7f4-cf3ff70000002780-db-6391d6b444d1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5F.69.08916.3B6D1936; Thu,  8
 Dec 2022 12:21:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221208122106eusmtip2112227613b53e8a3d24ef3a2fbab41ab~u0MddLAAY1427714277eusmtip2S;
 Thu,  8 Dec 2022 12:21:06 +0000 (GMT)
Message-ID: <71d8ef7c-9257-ebae-95d7-8cd58b07cdbf@samsung.com>
Date: Thu, 8 Dec 2022 13:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZC+iyUmGgydjT-r1Nbbpipq+dm9tCAzeUvJyM7FAechGw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRz3ed93794hs5cN3XPYaTc7urqERLx7MrJQ73r1sos/vCuMdI23
 YTGkTWhJ5cADaQQN3R3whoIhMhAdDk5g7ThbyBgc40dKHDIWCqY0sMkSwcIcLxb/fT+f7+f7
 +Xy/zz0ULjlNRlAH0w6zmjRFqpwMIS53zPVubBosVr5yZlqMRm5048hbNUOgP26YSTR1qopA
 1/66R6LCarcAnfAaCRSwGkl0Z7SfQD05PiH6pvisENUY20hkvTUoQIb5WhyV9rZhyJeXDVD3
 TQuOurJzCTRg+plE97mxJ92Td0nU33kfR7OPevA3ZcwFv1fAnOY6CcbU2S5g3N96SKaV8wiZ
 7/PLBEyV/S7GtF+vEjAjg3aS8RY4Mabx7FHm0nQLxuRenSeYoqY6wMxY1737TGJIXDKbejCT
 1URvOxCS4jo/BtKb0nU97SVAD3KSDEBEQToW5l50EwYQQkloM4Az0xUkDwIAtpk5jAczAF4Y
 aSKejviq+5dUNQA25zuWgB/AscLvQFAlprdBc1GL0AAoiqCfh9XdG3k6DLrKxheNVtPJ8Epr
 DxaUSOkDcNiVFaRxWgaHxyuwYB1OJ8HH/r/xoD1OPyBh7VX7oj1Jb4KGKQMZrEV0Apz4pxzn
 h9fD5qnyxQFInwmBDUVGIhgA6Z1wblLEHyCFk84mIV8/Cx+3VmC8/jiAlY+8S8AIoP73YcCr
 XoMj7nkyaITTL0KLLZqn42Gpa4Hk/VfBoakwfodV8MTlEpynxTA/T8KrIyHnvPhf7E99A7gR
 yLllr8ItO59bdg33f24lIOqAjM3QqlWsNiaN/TxKq1BrM9JUUcpDait48oW7F5yBFlAz6Y9y
 AIwCDgApXB4uPneuWCkRJyu+OMJqDu3XZKSyWgdYSxFymdhsyldKaJXiMPspy6azmqddjBJF
 6DH57ucqdvWv83wsK34/bq/kLV2i99p+pWNDWH3y7iuvzyVsPtL19T6bb+vwsT2W+HttsZWj
 Re/Vuj+cLihU9R3V5QSYUM32mNYXtp6KiMX91pK+laIfygfGRLF5iccfrvB5PshMGa/j7DPx
 c+vfCDSuzYyxvrp9zYqh8N82RO4xlfTtyC7f1yBNVHaxslv1W6LPD42mVP4yG6sPz+08ufOB
 Ve35ytQRV/kljMqyhRdQWb17b9YbnfrNhokf3ZmuMpXZdmnLguVte3mDsvP27V8HPjPe+UQt
 1SlsNsVEh/Sdh6G5pStbanesvj7rejmh4JhalNRoKf6zVZAempUcr/uoa01zpJzQpig2vYRr
 tIp/ARn8lLgxBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsVy+t/xe7qbr01MNtjwXdvizu3TzBb3F39m
 sXh9ewWbxdu5i1ksrnx9z2bRu/Qcq8Wk+xNYLL5smsBm8eLeRRaLs01v2C06Jy5ht1g+YR+b
 xabH11gtun6tZLaYcX4fk8WbtkZGi9OP1jNbnGpsZbG4NOUwm8WnWQ+BspNfsllcPPGJ2eL7
 77PMDuIeaz/eZ/WYN+sEi8eUE0dYPc713GXz2DnrLrvH7I6ZrB6L97xk8jhydTGrx51re9g8
 7ncfZ/LYvKTeY+O7HUwerUd/sXj0bVnF6PF5k1wAf5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWF
 npGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexsnVDxkLthRUnD0ynbGBsSm2i5GTQ0LAROLN
 0otsXYxcHEICSxkluma9ZYdIyEicnNbACmELS/y51gVV9J5RYu/7w2AJXgE7iRV9O4AaODhY
 BFQklp7WhQgLSpyc+YQFxBYVSJFo7/nHBFIiLJAgcetkNUiYWUBc4taT+UwgtohArMSlBZ+Y
 QMYzC/xgk7h9o5sFYtcvdolth48xglSxCRhKdL0FOYKTg1MgUOLp3znMEJPMJLq2djFC2PIS
 29/OYZ7AKDQLyR2zkCychaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLTzrZj
 PzfvYJz36qPeIUYmDsZDjBIczEoivMuWTUwW4k1JrKxKLcqPLyrNSS0+xGgKDIuJzFKiyfnA
 xJdXEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliSmp2aWpBaBNPHxMEp1cDkNDOlT8vNXzLk
 xtcJzGwSNXYKEgHPDy8oOPb64solwX4P6r48TNUrso8JbTl1wYLz2JuHXCe+T7og6NCesGvy
 7L3h576/eiLg/0XT9nq1c/1NnbtXDC+WLVCojth3UHqvSHxvc8R1z/a0Cf6LBWymr77Lfvkm
 68ySew1Nv+s3bfnuwCeUa1r+/b9sWm7Q6QV9Z6dfKMw9v6D0LdP/C6sLtM4UltRldGlb5s+/
 LmL+cU9exZEF16bmSv2JSnK46mhzs/PRgXPNf46J9Yd83s6triZUxdJpu3/2RUvvJUuDWxOX
 H3kUVLlv2g7pVScm51r9rVZi9+3011O/F6SS58B0tcPK+ce0X2xp05MMJBcpsRRnJBpqMRcV
 JwIAeTj0a8QDAAA=
X-CMS-MailID: 20221208122107eucas1p16d0e59d81a1c2936948d700553006aa8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com>
 <CGME20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15@eucas1p1.samsung.com>
 <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de>
 <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
 <b66b44fc-5d4c-d3a8-8538-79003b14691e@denx.de>
 <CAMty3ZBfAY86fp7XxS9frrBiT9FRkJaNSRY-4CVpqGOvdpn1fw@mail.gmail.com>
 <58671662-9242-c7ef-53ef-60f9cdc3399a@denx.de>
 <CAMty3ZDVZJ6TjKjtq9wSHudmeD+7O1vB_j0V1xKjYGWnwMKa6Q@mail.gmail.com>
 <9f08a902-049c-1c00-7fed-3d7ee18b3d2c@samsung.com>
 <2ef1aae1-8ff9-22bc-9817-69d1eae8b485@denx.de>
 <CAPY8ntDH7QgLfg_MsXSeyD4uwiG7EHMd75qQA6SbDbO1P6ftow@mail.gmail.com>
 <cc3814d2-a300-be10-168c-7313a7cd9006@kontron.de>
 <CAPY8ntCpOitHktqd4W=teYQJ+UDimCZ2czcaxgG5rA6A4XB11Q@mail.gmail.com>
 <e32280e4-0c8e-f823-051b-8d0802d6fdb5@kontron.de>
 <fcef073d-3046-2714-d87c-4c42d6a4bce0@kontron.de>
 <CAMty3ZC+iyUmGgydjT-r1Nbbpipq+dm9tCAzeUvJyM7FAechGw@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.12.2022 12:32, Jagan Teki wrote:
> On Tue, Dec 6, 2022 at 2:32 PM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>> On 05.12.22 16:37, Frieder Schrempf wrote:
>>> Hi Dave,
>>>
>>> On 05.12.22 16:20, Dave Stevenson wrote:
>>>> Hi Frieder
>>>>
>>>> On Mon, 5 Dec 2022 at 07:30, Frieder Schrempf
>>>> <frieder.schrempf@kontron.de> wrote:
>>>>> On 02.12.22 15:55, Dave Stevenson wrote:
>>>>>> Hi Marek
>>>>>>
>>>>>> On Fri, 2 Dec 2022 at 12:21, Marek Vasut <marex@denx.de> wrote:
>>>>>>> On 12/2/22 11:52, Marek Szyprowski wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Sorry for delay, I was on a sick leave last 2 weeks.
>>>>>>>>
>>>>>>>> On 28.11.2022 15:43, Jagan Teki wrote:
>>>>>>>>> ,On Sat, Nov 26, 2022 at 3:44 AM Marek Vasut <marex@denx.de> wrote:
>>>>>>>>>> On 11/23/22 21:09, Jagan Teki wrote:
>>>>>>>>>>> On Sat, Nov 19, 2022 at 7:45 PM Marek Vasut <marex@denx.de> wrote:
>>>>>>>>>>>> On 11/17/22 14:04, Marek Szyprowski wrote:
>>>>>>>>>>>>> On 17.11.2022 05:58, Marek Vasut wrote:
>>>>>>>>>>>>>> On 11/10/22 19:38, Jagan Teki wrote:
>>>>>>>>>>>>>>> DSI host initialization handling in previous exynos dsi driver has
>>>>>>>>>>>>>>> some pitfalls. It initializes the host during host transfer() hook
>>>>>>>>>>>>>>> that is indeed not the desired call flow for I2C and any other DSI
>>>>>>>>>>>>>>> configured downstream bridges.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Host transfer() is usually triggered for downstream DSI panels or
>>>>>>>>>>>>>>> bridges and I2C-configured-DSI bridges miss these host initialization
>>>>>>>>>>>>>>> as these downstream bridges use bridge operations hooks like pre_enable,
>>>>>>>>>>>>>>> and enable in order to initialize or set up the host.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> This patch is trying to handle the host init handler to satisfy all
>>>>>>>>>>>>>>> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
>>>>>>>>>>>>>>> flag to ensure that host init is also done on first cmd transfer, this
>>>>>>>>>>>>>>> helps existing DSI panels work on exynos platform (form Marek
>>>>>>>>>>>>>>> Szyprowski).
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> v8, v7, v6, v5:
>>>>>>>>>>>>>>> * none
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> v4:
>>>>>>>>>>>>>>> * update init handling to ensure host init done on first cmd transfer
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> v3:
>>>>>>>>>>>>>>> * none
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> v2:
>>>>>>>>>>>>>>> * check initialized state in samsung_dsim_init
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> v1:
>>>>>>>>>>>>>>> * keep DSI init in host transfer
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>>>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>        drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
>>>>>>>>>>>>>>>        include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>>>>>>>>>>>>        2 files changed, 20 insertions(+), 10 deletions(-)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>>>>> index bb1f45fd5a88..ec7e01ae02ea 100644
>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>>>>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct
>>>>>>>>>>>>>>> samsung_dsim *dsi)
>>>>>>>>>>>>>>>            disable_irq(dsi->irq);
>>>>>>>>>>>>>>>        }
>>>>>>>>>>>>>>>        -static int samsung_dsim_init(struct samsung_dsim *dsi)
>>>>>>>>>>>>>>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int
>>>>>>>>>>>>>>> flag)
>>>>>>>>>>>>>>>        {
>>>>>>>>>>>>>>>            const struct samsung_dsim_driver_data *driver_data =
>>>>>>>>>>>>>>> dsi->driver_data;
>>>>>>>>>>>>>>>        +    if (dsi->state & flag)
>>>>>>>>>>>>>>> +        return 0;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>            samsung_dsim_reset(dsi);
>>>>>>>>>>>>>>> -    samsung_dsim_enable_irq(dsi);
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>>>>>>>>>>>>>> +        samsung_dsim_enable_irq(dsi);
>>>>>>>>>>>>>>>              if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
>>>>>>>>>>>>>>>                samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
>>>>>>>>>>>>>>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
>>>>>>>>>>>>>>> samsung_dsim *dsi)
>>>>>>>>>>>>>>>            samsung_dsim_set_phy_ctrl(dsi);
>>>>>>>>>>>>>>>            samsung_dsim_init_link(dsi);
>>>>>>>>>>>>>>>        +    dsi->state |= flag;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>            return 0;
>>>>>>>>>>>>>>>        }
>>>>>>>>>>>>>>>        @@ -1269,6 +1276,10 @@ static void
>>>>>>>>>>>>>>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>>>>>>>>>>>>>>            }
>>>>>>>>>>>>>>>              dsi->state |= DSIM_STATE_ENABLED;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>>>>>>>>>>>> +    if (ret)
>>>>>>>>>>>>>>> +        return;
>>>>>>>>>>>>>>>        }
>>>>>>>>>>>>>>>          static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>>>>>>>>>>>>>> @@ -1458,12 +1469,9 @@ static ssize_t
>>>>>>>>>>>>>>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>>>>>>>>>>>>>>>            if (!(dsi->state & DSIM_STATE_ENABLED))
>>>>>>>>>>>>>>>                return -EINVAL;
>>>>>>>>>>>>>>>        -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>>>>>>>>>>>>>>> -        ret = samsung_dsim_init(dsi);
>>>>>>>>>>>>>>> -        if (ret)
>>>>>>>>>>>>>>> -            return ret;
>>>>>>>>>>>>>>> -        dsi->state |= DSIM_STATE_INITIALIZED;
>>>>>>>>>>>>>>> -    }
>>>>>>>>>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
>>>>>>>>>>>>>> This triggers full controller reset and reprogramming upon first
>>>>>>>>>>>>>> command transfer, is such heavy handed reload really necessary ?
>>>>>>>>>>>>> Yes it is, otherwise the proper DSI panels doesn't work with Exynos DRM
>>>>>>>>>>>>> DSI. If this is a real issue for you, then maybe the driver could do the
>>>>>>>>>>>>> initialization conditionally, in prepare() callback in case of IMX and
>>>>>>>>>>>>> on the first transfer in case of Exynos?
>>>>>>>>>>>> That's odd , it does actually break panel support for me, without this
>>>>>>>>>>>> double reset the panel works again. But I have to wonder, why would such
>>>>>>>>>>>> a full reset be necessary at all , even on the exynos ?
>>>>>>>>>>> Is it breaking samsung_dsim_reset from host_transfer? maybe checking
>>>>>>>>>>> whether a reset is required before calling it might fix the issue.  I
>>>>>>>>>>> agree with double initialization is odd but it seems it is required on
>>>>>>>>>>> some panels in Exynos, I think tweaking them and adjusting the panel
>>>>>>>>>>> code might resolve this discrepancy.
>>>>>>>>>> Can someone provide further details on the exynos problem ?
>>>>>>>>> If I'm correct this sequence is required in order to work the existing
>>>>>>>>> panel/bridges on exynos. Adjusting these panel/bridge codes can
>>>>>>>>> possibly fix the sequence further.
>>>>>>>>>
>>>>>>>>> Marek Szyprowski, please add if you have anything.
>>>>>>>>
>>>>>>>> Well, frankly speaking the double initialization is not a correct
>>>>>>>> sequence, but this is the only one that actually works on Exynos based
>>>>>>>> boards with DSI panels after moving the initialization to bridge's
>>>>>>>> .prepare() callback.
>>>>>>> Somehow, I suspect this is related to the LP11 mode handling, which
>>>>>>> differs for different panels, right ? I think the RPi people worked on
>>>>>>> fixing that.
>>>>>>>
>>>>>>> +CC Dave
>>>>>> Yes. I've just sent out a v3 of that patch set.
>>>>>>
>>>>>> Hopefully setting the pre_enable_prev_first flag on your peripheral's
>>>>>> drm_bridge, or prepare_prev_first if a drm_panel, will result in a
>>>>>> more sensible initialisation order for your panel.
>>>>>>
>>>>>> Note that host_transfer should ensure that the host is initialised, as
>>>>>> it is valid to call it with the host in any state. If it has to
>>>>>> initialise, then it should deinitialise once the transfer has
>>>>>> completed.
>>>>>>
>>>>>> Dave
>>>>>>
>>>>>>>> I've already explained this and shared the results
>>>>>>>> of my investigation in my replies to the previous versions of this
>>>>>>>> patchset. The original Exynos DSI driver does the initialization on the
>>>>>>>> first DSI command. This however doesn't work for Jagan with I2C
>>>>>>>> controlled panels/bridges, so he moved the initialization to the
>>>>>>>> .prepare() callback, what broke the Exynos case (in-short - all tested
>>>>>>>> panels works fine only if the DSI host initialization is done AFTER
>>>>>>>> turning the panel's power on). For more information, see this thread:
>>>>>>>> https://protect2.fireeye.com/v1/url?k=b96d9a6f-d8e68f59-b96c1120-74fe485fffe0-6f8ca12c5049bf4e&q=1&e=b9def28e-897a-4edd-bfe3-86e02b64eb27&u=https%3A%2F%2Feur04.safelinks.protection.outlook.com%2F%3Furl%3Dhttps%253A%252F%252Flore.kernel.org%252Fall%252Fe96197f9-948a-997e-5453-9f9d179b5f5a%2540samsung.com%252F%26amp%3Bdata%3D05%257C01%257Cfrieder.schrempf%2540kontron.de%257Cee7b57ee420e45a73b1d08dad6d45306%257C8c9d3c973fd941c8a2b1646f3942daf1%257C0%257C0%257C638058504671330145%257CUnknown%257CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%253D%257C3000%257C%257C%257C%26amp%3Bsdata%3DTQIIKNa4OVGP1dZo3tM%252FOMO3dlXrjLr04U%252FJFhd2rAs%253D%26amp%3Breserved%3D0
>>>>>>>>
>>>>>>>> Now, the more I think of it, the more I'm convinced that we simply
>>>>>>>> should add a hack based on the HW type: do the initialization in
>>>>>>>> .prepare() for non-Exynos case and before the first transfer for the
>>>>>>>> Exynos case, as there is no way to detect the panel/next bridge type
>>>>>>>> (I2C or DSI controlled).
>>>>>>> Let's see what Dave has to say about this, maybe there is some further help.
>>>>> Could we agree on adding the HW type based hack Marek S. proposed as a
>>>>> quick fix?
>>>>>
>>>>> This patchset was tested on Exynos so it's likely to not break any
>>>>> existing setups. And for i.MX8, this is a new driver so there's not
>>>>> really a requirement to have all setups working/supported from the
>>>>> beginning.
>>>>>
>>>>> Also having one or two hacks (marked with FIXME) in the code doesn't
>>>>> hurt. As we can see there are drafts to fix them in conjunction with
>>>>> changes in the DRM framework.
>>>>>
>>>>> This has been pending for months and in my opinion if there's a chance
>>>>> to get this into v6.2-rc1 we should take it.
>>>> My patchset was sent in March with no one seeming to care enough to review it.
>>> I wasn't referring to your patchset but rather to the Samsung DSIM
>>> bridge transformation patchset.
>>>
>>> My point was simply to not try getting everything done in one big step
>>> because this will fail. The patchset this refers to needs testing on two
>>> separate platforms which is painful enough (thanks to Marek for covering
>>> the Exynos side!). I think we should focus on getting the DSIM bridge
>>> transformation merged and accept a few small hacks that will be taken
>>> care of in the next step.
>>>
>>>> If the situation is that your devices fall into the same camp as those
>>>> for vc4 (the host needs to be initialised before the peripheral), at
>>>> least verifying that would be useful before rushing into a hack.
>>>>
>>>> Your other comment references using a TI SN65DSI84. I know for certain
>>>> that falls into the category of needing the DSI bus initialised before
>>>> it is brought out of reset.
>>> I'm actually working on this right now and when I received your message
>>> I was about to start typing a reply to your patchset.
>>>
>>> The SN65DSI84 works with the i.MX8MM DSIM even using the default order
>>> of host init after peripheral init in our setup, but this configuration
>>> doesn't seem to be stable and occasionally the bridge doesn't come up
>>> properly.
>>>
>>> We are still in the process of verifying if the reversed order fixes
>>> this reliably. But regardless of the results, without the reversal the
>>> initialization sequence is way out of spec and we need to fix this in
>>> any case.
>>>
>>> See here for my testing branch including some follow-up patches that
>>> improve the initialization flow for my setup:
>>> https://protect2.fireeye.com/v1/url?k=0a67acf1-6becb9c7-0a6627be-74fe485fffe0-38ee812d7e32f480&q=1&e=b9def28e-897a-4edd-bfe3-86e02b64eb27&u=https%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommits%2Fv6.1-dsim-mx8mm.
>> To recap my thoughts on the two hacks for the DSIM bridge driver
>> discussed before:
>>
>> (1) Passing null to previous bridge in samsung_dsim_attach()
>> (2) Always initialize host on first transfer (see this patch, 06/14)
>>
>> My wild guess would be that both could be fixed up properly in the long
>> run by the following changes:
>>
>> * Apply Dave's patchset [1]
>> * Set pre_enable_prev_first flag in the downstream bridge drivers and
>>    fix init flow if required ([2] for ti-sn65dsi83)
>> * Fix DSIM init to keep data lanes in LP11 until enable() is called [3]
>> * Only call init on transfer when not already initialized and deinit
>>    after transfer (tbd)
>>
>> As that route needs proper testing on the affected hardware setups and
>> includes changes to other drivers and the framework, I would suggest the
>> following for the v9 of this patchset:
> I did it on drm-misc-next [1].
>
>> * Keep hack (1)
> This has gone, not needed.
>
>> * Make hack (2) dependent on the platform (Exynos)
> I think with pre_enable_prev_first flag the Exynos pipeline will start
> from bridge funcs like pre_enable so initializing the host will work
> for exynos to work. [2]
>
> Marek Sz. Can you confirm this?

Host initialization is orthogonal to the hack used on the bridge list. 
Dave's patchset removes the need for that hack, but the DSI host still 
has to be initialized on the first DSI command transfer for Exynos HW, 
otherwise the tested DSI panels display nothing.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

