Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A78640540
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E1910E6CB;
	Fri,  2 Dec 2022 10:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0902210E6D8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 10:52:56 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221202105254euoutp01edfd7b22455b7f84d18364e38e10e830~s9Hu961Dd1487114871euoutp01Z
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 10:52:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221202105254euoutp01edfd7b22455b7f84d18364e38e10e830~s9Hu961Dd1487114871euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1669978374;
 bh=Be7d+VUUizscCpFMc8crNI2MYa71Vg39o0U/okpypdk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=LB9OVjn3JwYpBrd3HElH/m/NuK7+cZ7Wx1gCI4k6ewlabQRUkZAxCEFKqO5ss+QVp
 9KWyKvZrkP8tKbfiLhHfzsbq6ltJB5zryp0oibtx7yhXYWxjMdXmQq8a5DqcCkp5MT
 Q6s2Wpp+9Wq7Y39WhwgHj5ul9P7Fz7opxA7N6USM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221202105253eucas1p133a44229e9163eb491913c8b79d80aa3~s9HulfF6s2296822968eucas1p1q;
 Fri,  2 Dec 2022 10:52:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 51.AB.09561.509D9836; Fri,  2
 Dec 2022 10:52:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221202105253eucas1p2ca6098ecf49cfcd3fb5d608fb5db9105~s9HuCG8nl2967329673eucas1p2t;
 Fri,  2 Dec 2022 10:52:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221202105253eusmtrp1b71010da3a1bc5f3dd37e4acb8fdd915~s9HuBP6Mb3152531525eusmtrp1f;
 Fri,  2 Dec 2022 10:52:53 +0000 (GMT)
X-AuditID: cbfec7f2-0c9ff70000002559-b5-6389d9057a0f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 44.18.08916.409D9836; Fri,  2
 Dec 2022 10:52:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221202105251eusmtip29fe7f0f364f4ae5715c095b4bea3a295~s9Hs62_2-1842118421eusmtip2b;
 Fri,  2 Dec 2022 10:52:51 +0000 (GMT)
Message-ID: <9f08a902-049c-1c00-7fed-3d7ee18b3d2c@samsung.com>
Date: Fri, 2 Dec 2022 11:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Marek Vasut <marex@denx.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZDVZJ6TjKjtq9wSHudmeD+7O1vB_j0V1xKjYGWnwMKa6Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRzved93717WDV5A4lG6upZpYExnuZ4T9eD6ce91eafn9Y/d2Xbw
 NjxgepuUBir4CzaJmzBLhhgxiEUFOhUpaCk/GmMxYCAKbIwIFZBpDLIlB7XtzeK/z/fz+X6e
 z/f7vYfCo0rJVdRe5QFWpZRnikgB0fjzXz2JvCFN6oar02uQa8SOI49xjkD3R0wkGvjjIYk+
 rXHwUIlHR6B5s45Ek6N9BOo+NsNHmjPVfFSrs5DI/NsgD2kff42jcz0WDM2cygfIPt6Ao678
 kwRy6ttI5DP8GlBLp0jU1+nD0Z8L3XjyM8x3sx4ec8HQSTD6znYe4yhyk8z3BjefKS8s4zHG
 limMab9p5DGuwRaS8Zy2Yszl6qPMpQdNGFN8pQ4wc+bndoTvFmxJYzP3fsSq1m+TCdJtZ1ux
 /V9KDxac350HutdpQRgF6dfg+LdfgSCOok0AnrRs1QJBAM8DODh8AXDFHICjQ4vEE0fX/VmM
 E2oBzLN3Y5x9FsDeRRTEQnobLLP/EjIQ9GpYU28BHB8JbWUTIT6GToPO9iaeFlBUNC2Dw7ac
 II3TsXB44ovQkytoBpb0z/ODWTh9m4Q+TV9IIGkJ1Hq1ZBCH0Tuh0TZGcubn4TXveTxogHSx
 AJabKkhu6jeh68HDf3E0nLZe4XP4WWgvLSI4QwGAlQsejCt0gdXuDQOuKwm6HI/J4Kg4HQ8b
 fljP0SnwnG0pREM6HN72RnJDhMOSxs9xjhbCwlNRXPcaaLDW/xd7o9eJ64DIsOwshmX7G5at
 Y/g/txIQdSCWzVZnKVi1RMl+LFbLs9TZSoU4dV+WGQT+rX3J6msCFdOz4laAUaAVQAoXrRB+
 WF+YGiVMkx/6hFXt+0CVncmqW0EcRYhihSZ9QKIV8gNsBsvuZ1VPVIwKW5WHySKOHH7XnbLJ
 fOPFp3svva4YoxI7Mhf8r/T1Rr9hjugfKVq7smxs80RJ0gbFxshD+gH+UzUNcUdfxaeMI4q3
 Dq9L0ExObWYODvyY5L2IL7Xh/VKf5nqdZOWtUbe/oCp/SLWlkdA8avzmfWeOufzv5qrmVOxO
 7nFjR1jbaPzWXOme7ceO47IjRpkk4eoLooiLl/M7YheX9twtPpGLke8wd87GvXdTv6OrWEe1
 /dTjcFZur7NO4ig5PkNwZrU/ZSLBP2PeVHA9wyWuHc9w5N/z7vJTLY8kFgOoupYmPSF1V/vF
 nzUP3qrQ5Lwdo0w/nTn3klN417RxoGVXjDg5cefa318WEep0uSQBV6nl/wDTn5EHJgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xe7qsNzuTDR5/ZLS4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFpSmH2Sw+zXoIlJ38ks3i4olPzBbff59ldhDz
 WPvxPqvHvFknWDymnDjC6nGu5y6bx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH
 5iX1Hhvf7WDy6NuyitHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
 UyV9O5uU1JzMstQifbsEvYyTUw8xFSw0q2ifE9XAeFa7i5GTQ0LAROLU649MXYxcHEICSxkl
 pu8+wASRkJE4Oa2BFcIWlvhzrYsNoug9o8S/kwvBErwCdhIzT59hAbFZBFQklq7bxwgRF5Q4
 OfMJWFxUIEXi9MVXQPUcHMICCRK3TlaDhJkFxCVuPZkPtktEwENi0uUv7CDzmQVusUmcOrOC
 GSQhJLCYReL54VgQm03AUKLrLcgRnBycAoESi08+YIMYZCbRtbWLEcKWl9j+dg7zBEahWUjO
 mIVk3ywkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRmGC2Hfu5eQfjvFcf9Q4x
 MnEwHmKU4GBWEuFNW9eRLMSbklhZlVqUH19UmpNafIjRFBgWE5mlRJPzgSkuryTe0MzA1NDE
 zNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBaX1B1wz7Of0qCw0q5k3KmfgkLvD8
 w4/G3vbx7hPaxQOmsvT2PTzQIXUn9OYM75ubLeoaIubvfvjQTMThC/9ecXaG4h6ZgM3bT21a
 6id61UIiqHtGzeK6FxJK/O4ProtudgubKTfvfGmf25wVIe9is0Iv70wVcz2lwu4ZtWvVg8VK
 BsvEDwbIz2aasLH6xYMtKfsXyy6dWjbRsfr2v18f7crC3s8zFr5U95mhuV9ry+9XJw3l707f
 Pt/8HAuz5MmkMBeNGTuEOPhKjVnK3SeU3FmqfPnHYvPFTxY7Tv9xV+OCR4fO47ykgMuPLTNV
 BM3vPGVbeVRf7ubxRRVd+24pXWU7w/aPJ3TXHKV/gW6dLkosxRmJhlrMRcWJAIJKYhW5AwAA
X-CMS-MailID: 20221202105253eucas1p2ca6098ecf49cfcd3fb5d608fb5db9105
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

Sorry for delay, I was on a sick leave last 2 weeks.

On 28.11.2022 15:43, Jagan Teki wrote:
> ,On Sat, Nov 26, 2022 at 3:44 AM Marek Vasut <marex@denx.de> wrote:
>> On 11/23/22 21:09, Jagan Teki wrote:
>>> On Sat, Nov 19, 2022 at 7:45 PM Marek Vasut <marex@denx.de> wrote:
>>>> On 11/17/22 14:04, Marek Szyprowski wrote:
>>>>> On 17.11.2022 05:58, Marek Vasut wrote:
>>>>>> On 11/10/22 19:38, Jagan Teki wrote:
>>>>>>> DSI host initialization handling in previous exynos dsi driver has
>>>>>>> some pitfalls. It initializes the host during host transfer() hook
>>>>>>> that is indeed not the desired call flow for I2C and any other DSI
>>>>>>> configured downstream bridges.
>>>>>>>
>>>>>>> Host transfer() is usually triggered for downstream DSI panels or
>>>>>>> bridges and I2C-configured-DSI bridges miss these host initialization
>>>>>>> as these downstream bridges use bridge operations hooks like pre_enable,
>>>>>>> and enable in order to initialize or set up the host.
>>>>>>>
>>>>>>> This patch is trying to handle the host init handler to satisfy all
>>>>>>> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
>>>>>>> flag to ensure that host init is also done on first cmd transfer, this
>>>>>>> helps existing DSI panels work on exynos platform (form Marek
>>>>>>> Szyprowski).
>>>>>>>
>>>>>>> v8, v7, v6, v5:
>>>>>>> * none
>>>>>>>
>>>>>>> v4:
>>>>>>> * update init handling to ensure host init done on first cmd transfer
>>>>>>>
>>>>>>> v3:
>>>>>>> * none
>>>>>>>
>>>>>>> v2:
>>>>>>> * check initialized state in samsung_dsim_init
>>>>>>>
>>>>>>> v1:
>>>>>>> * keep DSI init in host transfer
>>>>>>>
>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
>>>>>>>      include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>>>>      2 files changed, 20 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> index bb1f45fd5a88..ec7e01ae02ea 100644
>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct
>>>>>>> samsung_dsim *dsi)
>>>>>>>          disable_irq(dsi->irq);
>>>>>>>      }
>>>>>>>      -static int samsung_dsim_init(struct samsung_dsim *dsi)
>>>>>>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int
>>>>>>> flag)
>>>>>>>      {
>>>>>>>          const struct samsung_dsim_driver_data *driver_data =
>>>>>>> dsi->driver_data;
>>>>>>>      +    if (dsi->state & flag)
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>>          samsung_dsim_reset(dsi);
>>>>>>> -    samsung_dsim_enable_irq(dsi);
>>>>>>> +
>>>>>>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>>>>>> +        samsung_dsim_enable_irq(dsi);
>>>>>>>            if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
>>>>>>>              samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
>>>>>>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
>>>>>>> samsung_dsim *dsi)
>>>>>>>          samsung_dsim_set_phy_ctrl(dsi);
>>>>>>>          samsung_dsim_init_link(dsi);
>>>>>>>      +    dsi->state |= flag;
>>>>>>> +
>>>>>>>          return 0;
>>>>>>>      }
>>>>>>>      @@ -1269,6 +1276,10 @@ static void
>>>>>>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>>>>>>          }
>>>>>>>            dsi->state |= DSIM_STATE_ENABLED;
>>>>>>> +
>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>>>> +    if (ret)
>>>>>>> +        return;
>>>>>>>      }
>>>>>>>        static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>>>>>> @@ -1458,12 +1469,9 @@ static ssize_t
>>>>>>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>>>>>>>          if (!(dsi->state & DSIM_STATE_ENABLED))
>>>>>>>              return -EINVAL;
>>>>>>>      -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>>>>>>> -        ret = samsung_dsim_init(dsi);
>>>>>>> -        if (ret)
>>>>>>> -            return ret;
>>>>>>> -        dsi->state |= DSIM_STATE_INITIALIZED;
>>>>>>> -    }
>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
>>>>>> This triggers full controller reset and reprogramming upon first
>>>>>> command transfer, is such heavy handed reload really necessary ?
>>>>> Yes it is, otherwise the proper DSI panels doesn't work with Exynos DRM
>>>>> DSI. If this is a real issue for you, then maybe the driver could do the
>>>>> initialization conditionally, in prepare() callback in case of IMX and
>>>>> on the first transfer in case of Exynos?
>>>> That's odd , it does actually break panel support for me, without this
>>>> double reset the panel works again. But I have to wonder, why would such
>>>> a full reset be necessary at all , even on the exynos ?
>>> Is it breaking samsung_dsim_reset from host_transfer? maybe checking
>>> whether a reset is required before calling it might fix the issue.  I
>>> agree with double initialization is odd but it seems it is required on
>>> some panels in Exynos, I think tweaking them and adjusting the panel
>>> code might resolve this discrepancy.
>> Can someone provide further details on the exynos problem ?
> If I'm correct this sequence is required in order to work the existing
> panel/bridges on exynos. Adjusting these panel/bridge codes can
> possibly fix the sequence further.
>
> Marek Szyprowski, please add if you have anything.


Well, frankly speaking the double initialization is not a correct 
sequence, but this is the only one that actually works on Exynos based 
boards with DSI panels after moving the initialization to bridge's 
.prepare() callback. I've already explained this and shared the results 
of my investigation in my replies to the previous versions of this 
patchset. The original Exynos DSI driver does the initialization on the 
first DSI command. This however doesn't work for Jagan with I2C 
controlled panels/bridges, so he moved the initialization to the 
.prepare() callback, what broke the Exynos case (in-short - all tested 
panels works fine only if the DSI host initialization is done AFTER 
turning the panel's power on). For more information, see this thread: 
https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/

Now, the more I think of it, the more I'm convinced that we simply 
should add a hack based on the HW type: do the initialization in 
.prepare() for non-Exynos case and before the first transfer for the 
Exynos case, as there is no way to detect the panel/next bridge type 
(I2C or DSI controlled).


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

