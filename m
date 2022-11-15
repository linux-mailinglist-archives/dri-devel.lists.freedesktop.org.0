Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610746292F9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 09:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8F610E374;
	Tue, 15 Nov 2022 08:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFB110E374
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 08:09:45 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221115080943euoutp01786a79535450329f36686218a0cd3025~ns7Z2uLQj2407224072euoutp01u
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 08:09:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221115080943euoutp01786a79535450329f36686218a0cd3025~ns7Z2uLQj2407224072euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668499783;
 bh=44tbPwKCuHTSozLXnbTA8C1enz9cryZUjc9DVJaG81o=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=gKPxWkrDgQ1VcSlPTFTJJt+xpTCXFl+MuV4x66Bb9ChwzLjW6MjA0/yAMGmlWkKCr
 pkXhFzUcILZ9eUnLV0P0G8pDrJVSdPvE44gpGZQ1vUA1fl1hlWp8Lnrt6LC47iW2BP
 YAX/4jZOaUH6upA09keZW4rg510h1Ck0tn/aA4/0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221115080942eucas1p28bb759d87b4ab816472ac419fc533acc~ns7ZeXMy51520815208eucas1p26;
 Tue, 15 Nov 2022 08:09:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2E.58.09549.64943736; Tue, 15
 Nov 2022 08:09:42 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221115080942eucas1p21db7e8d7ffc6f825a95059495e75d959~ns7ZCeV0a0491604916eucas1p2n;
 Tue, 15 Nov 2022 08:09:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221115080942eusmtrp1458b6cfaacb7eea6b2ffd0a75a79fa16~ns7ZBWIMr1130911309eusmtrp1d;
 Tue, 15 Nov 2022 08:09:42 +0000 (GMT)
X-AuditID: cbfec7f5-f47ff7000000254d-37-6373494623b6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 42.2D.08916.64943736; Tue, 15
 Nov 2022 08:09:42 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221115080941eusmtip261c09f683fcac978c32d8a78b43a162c~ns7X8zezX1955519555eusmtip2u;
 Tue, 15 Nov 2022 08:09:41 +0000 (GMT)
Message-ID: <928ec100-83c0-cbfe-8005-ccf872538999@samsung.com>
Date: Tue, 15 Nov 2022 09:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZD_+m_3aj2-rXThaEDtP=m3Knfo=bmXvMPH_7LSf6N5qA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0xTVxjdfe/19dGk9bY6uQO3mc4NZa7AcNldtjFNzPKYk2HcH0aWuaa8
 gFpKaWXozMaPbB1UJKVSgTfUDtBWEyDrSAfOmVjUAhVQI8qk0rGxOZAKyC8BYbM83fjvfOd8
 J985N5chFTY6gtmt28cZdGqtkpZQ7sszna+9n2jUxJrvRmF/r4/EgZpxCt/rddL4xuQIjQ+f
 7BRha8BC4QmXhcZ/912jcEfBsBgXldaKscNynsauP26KsHn2NIkrus4TeNiUD7Dv9wYSt+d/
 Q+HrZS00fsD3P1aPDNL4WusDEk/PdZAbV7J1YwERe5xvpdiy1ositrP4Ds0283fE7HeFlSK2
 5twgwV7srhGx/pvnaDZwyEuwP9bmsj/cbyLYksYzgB13vZAs2yl5J5XT7v6cM8QkfCZJ/+3R
 EKHnVfsHOo6L80D7GjMIYxDcgIrmSwkzkDAK6ATI5G4TC8MEQJes/aQwjAPkuFAofmpx9Dc8
 sTgA+rl0hAgJCjgGULX1XTNgGClMQHPOxBBNwZfRVL6HDGEplKO2ygEqhJ+Fqej7xp5F63K4
 A/1iO7nIkzAc3R44scivgK+iqcp7dOgWCSdpdMLdCkICDeOQOWimQzgMbkMzowuEYH4R/RSs
 WkyNoE2Cps0DhJB6M3LaHaSAl6Mhb+OTNquQ70gxJRi+Bcg+FyCEwQJQ3t3bQNh6G/k7Z+lQ
 NRKuQw1nYwR6E+opcBEhGkEZ6gnKhRAyZHWXkwItRYUmhbD9CuK99f+dvXD1OmkBSn7Ju/BL
 +vNL6vD/37UD6gwI57KNGWmcMV7H5aiM6gxjti5NpcnMcIHHP9e34J1sAs6hMZUHEAzwAMSQ
 yhXSA3KjRiFNVR/4gjNk7jJkazmjB0QylDJcSldEaxQwTb2P28txes7wVCWYsIg8wv7GXjVO
 yFunb7FsHu2Tdfs3rF9W0dITWzSx8Hw7J2lJ2lL3EZ7T6gqimjXcrD6xOL4vhcgM/ytZcWtV
 ZdJLW/Rl8NTrsNdjaY3+c23xI3D0zdio0qy0Xe7BiZLtp/mPr8Z8PTKYdKs6fZt8q/Vh3P7L
 G6s+4f35oz3HBg5vXdO2J6Utsii9EJtSj83nmrpyamxZwWqje/jDLIPMXl1Vp1nZwcgDo2z8
 pvd2rv9Um5NhHSl/zvtwGepSJz9z8J8U1VDDjo5y+6l521dNaXOOMV9uWPPMnu31dWt/1a6+
 cpCf+hIenZ4+5Kolb5D3P9A3Oucjz75FN126Uh8sWd1d6YpQUsZ0dVw0aTCq/wUlDicnKAQA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsVy+t/xe7punsXJBs8u8VjcuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBaT7k9gsfiyaQKbxYt7F1kszja9YbfonLiE3WL5hH1sFpseX2O1
 6Pq1ktlixvl9TBZv2hoZLU4/Ws9scaqxlcXi0pTDbBafZj0Eyk5+yWZx8cQnZovvv88yO4h5
 rP14n9Vj3qwTLB5TThxh9TjXc5fNY+esu+wesztmsnos3vOSyePI1cWsHneu7WHzuN99nMlj
 85J6j43vdjB59G1ZxejxeZNcAF+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWR
 qZK+nU1Kak5mWWqRvl2CXsaDP6+YCmbpVTw5O4+9gfGUShcjJ4eEgInE8ofrmboYuTiEBJYy
 Sqw/+ZEVIiEjcXJaA5QtLPHnWhcbRNF7Rom5C98BORwcvAJ2Er9XeILUsAioSnxrPMQMYvMK
 CEqcnPmEBaREVCBFYt2RKJCwsECExN6pS1lAbGYBcYlbT+YzgdgiAtoS32a+BhvPLPCdTWLm
 9yksELv+M0lcenUMrIpNwFCi6y3IEZwcnAKBEj8//GOCmGQm0bW1ixHClpfY/nYO8wRGoVlI
 7piFZOEsJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJEZhith37uXkH47xXH/UO
 MTJxMB5ilOBgVhLhrRQsThbiTUmsrEotyo8vKs1JLT7EaAoMjInMUqLJ+cAkl1cSb2hmYGpo
 YmZpYGppZqwkzutZ0JEoJJCeWJKanZpakFoE08fEwSnVwFS78pvvWvWnerc+PHZkX2Egsn8L
 09QLCnkdTo0tGyenXUs8Y6H6UFlyK+engO18E9f/6/+1g0lBLfjOjSU5r7sPfsg59zvI6WFC
 bYew0u+d6wTD26NSJx5l/+1qsa/wx5IPHu83ih68dNXryFKGizkS3HNu/rxZ8+bp1LrsGy6F
 mlIbDGX2M1eciNvjeHFn9M872rnrdzcoOXx68zywx+jqtNB5hmsWJ1V9nay7MDMkNTnt0xNV
 19eb5/192R7G/lPD16vv2aQZOz6v+jopsdimnl/ONn7mds3WmoXf92X/qNsxkfO8oZKdXPNn
 pRnFcpk2e7jm3dLaurbpeobIxV2HDhj2GzXck3NOu+J0r3e1EktxRqKhFnNRcSIAw+MZCLoD
 AAA=
X-CMS-MailID: 20221115080942eucas1p21db7e8d7ffc6f825a95059495e75d959
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221110184122eucas1p11379ff6b85cf9a66455a026259c93340
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221110184122eucas1p11379ff6b85cf9a66455a026259c93340
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <CGME20221110184122eucas1p11379ff6b85cf9a66455a026259c93340@eucas1p1.samsung.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com>
 <b13635de-26ce-a8e8-e38e-13c49a99312d@samsung.com>
 <56cab7d0-d9fb-d890-0b1c-678980eafd9c@samsung.com>
 <CAMty3ZD_+m_3aj2-rXThaEDtP=m3Knfo=bmXvMPH_7LSf6N5qA@mail.gmail.com>
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
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
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

Hi Jagan,

On 14.11.2022 18:07, Jagan Teki wrote:
> On Mon, Nov 14, 2022 at 8:10 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 14.11.2022 11:57, Marek Szyprowski wrote:
>>> On 10.11.2022 19:38, Jagan Teki wrote:
>>>> Finding the right input bus format throughout the pipeline is hard
>>>> so add atomic_get_input_bus_fmts callback and initialize with the
>>>> proper input format from list of supported output formats.
>>>>
>>>> This format can be used in pipeline for negotiating bus format between
>>>> the DSI-end of this bridge and the other component closer to pipeline
>>>> components.
>>>>
>>>> List of Pixel formats are taken from,
>>>> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>> 3.7.4 Pixel formats
>>>> Table 14. DSI pixel packing formats
>>>>
>>>> v8:
>>>> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2
>>>>
>>>> v7, v6, v5, v4:
>>>> * none
>>>>
>>>> v3:
>>>> * include media-bus-format.h
>>>>
>>>> v2:
>>>> * none
>>>>
>>>> v1:
>>>> * new patch
>>>>
>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>> ---
>>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 53 +++++++++++++++++++++++++++
>>>>    1 file changed, 53 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> index 0fe153b29e4f..33e5ae9c865f 100644
>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> @@ -15,6 +15,7 @@
>>>>    #include <linux/clk.h>
>>>>    #include <linux/delay.h>
>>>>    #include <linux/irq.h>
>>>> +#include <linux/media-bus-format.h>
>>>>    #include <linux/of_device.h>
>>>>    #include <linux/phy/phy.h>
>>>>    @@ -1321,6 +1322,57 @@ static void
>>>> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>>        pm_runtime_put_sync(dsi->dev);
>>>>    }
>>>>    +/*
>>>> + * This pixel output formats list referenced from,
>>>> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>> + * 3.7.4 Pixel formats
>>>> + * Table 14. DSI pixel packing formats
>>>> + */
>>>> +static const u32 samsung_dsim_pixel_output_fmts[] = {
>>>> +    MEDIA_BUS_FMT_UYVY8_1X16,
>>>> +    MEDIA_BUS_FMT_RGB101010_1X30,
>>>> +    MEDIA_BUS_FMT_RGB121212_1X36,
>>>> +    MEDIA_BUS_FMT_RGB565_1X16,
>>>> +    MEDIA_BUS_FMT_RGB666_1X18,
>>>> +    MEDIA_BUS_FMT_RGB888_1X24,
>>>> +};
>>>> +
>>>> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); i++) {
>>>> +        if (samsung_dsim_pixel_output_fmts[i] == fmt)
>>>> +            return true;
>>>> +    }
>>>> +
>>>> +    return false;
>>>> +}
>>>> +
>>>> +static u32 *
>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>> +                       struct drm_bridge_state *bridge_state,
>>>> +                       struct drm_crtc_state *crtc_state,
>>>> +                       struct drm_connector_state *conn_state,
>>>> +                       u32 output_fmt,
>>>> +                       unsigned int *num_input_fmts)
>>>> +{
>>>> +    u32 *input_fmts;
>>>> +
>>>> +    if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
>>>> +        return NULL;
>>>
>>> Please add support for MEDIA_BUS_FMT_FIXED and maybe default to
>>> MEDIA_BUS_FMT_RGB888_1X24 if requested format is not matched.
>>>
>>> Otherwise the above check breaks all current clients of the Samsung
>>> DSIM/Exynos DSI. I didn't dig into the bus matching code yet, but all
>>> DSI panels requests such format on my test systems...
>> I've checked a bit more the bus format related code and it looks that
>> there are more issues. The DSI panels don't use the MEDIA_BUS_FMT_*
>> formats thus the bridge negotiation code selects MEDIA_BUS_FMT_FIXED for
>> them. On Arndale board with Toshiba tc358764 bridge the
>> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG output_fmt is requested in
>> samsung_dsim_atomic_get_input_bus_fmts() (forwarded from the LVDS panel,
> dsim => tc358764 => panel-simple
>
> If I understand the bridge format negotiation correctly - If
> atomic_get_input_bus_fmts is not implemented in tc358764 then
> MEDIA_BUS_FMT_FIXED will be the output_fmt for dsim so we can assign
> MEDIA_BUS_FMT_RGB888_1X24 for FIXED formats.
>
> from include/drm/drm_bridge.h:
>
>           * This method is called on all elements of the bridge chain as part of
>           * the bus format negotiation process that happens in
>           * drm_atomic_bridge_chain_select_bus_fmts().
>           * This method is optional. When not implemented, the core will bypass
>           * bus format negotiation on this element of the bridge without
>           * failing, and the previous element in the chain will be passed
>           * MEDIA_BUS_FMT_FIXED as its output bus format.
>
> As I can see tc358764 is not implemented either
> atomic_get_input_bus_fmts or atomic API, so I think dsim gets the
> MEDIA_BUS_FMT_FIXED bridge pipeline. I have tested sn65dsi without
> atomic_get_input_bus_fmts I can see the dsim is getting
> MEDIA_BUS_FMT_FIXED.
>
> Can you check the same from your side?

Here in case of Arndale 5250 with the following pipeline:

dsim => tc358764 => panel-simple (boe,hv070wsa-100 panel)

the DRM core requests MEDIA_BUS_FMT_RGB888_1X7X4_SPWG format, taken from the boe_hv070wsa panel (see from drivers/gpu/drm/panel/panel-simple.c). Please note that in case of Exynos, the reversed bridge chain order is used for dsim, so this is another nasty consequence of that hack. :/

Maybe if no compatible bus format is found, the driver should force 
MEDIA_BUS_FMT_RGB888_1X24 until a proper format negotiation is 
implemented and hacks removed?


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

