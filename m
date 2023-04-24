Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842EE6EC959
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0BC10E47B;
	Mon, 24 Apr 2023 09:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D91010E448
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 09:47:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230424094712euoutp0183d77b839cfff6c3a5eb1af93f041435~Y1eMckQ9y2145721457euoutp01X
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 09:47:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230424094712euoutp0183d77b839cfff6c3a5eb1af93f041435~Y1eMckQ9y2145721457euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682329632;
 bh=+ECNoN9lOwErDMm+2aZSyoKQLu5elYTteQWVwjBA/Jc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=QttYVcI2WOecNc3UCI/RX88SJBtLJnrIM0GPLMdODenMdM7f7G8uBzLHiG8RjFrAm
 UwTe/ZdBXV7jK+ynU2glQ+RyypkmXa4S4jN9GAA/pRoSl2Nk66JPWVFZfvXhdUWWPy
 dGdMpPxrJkWeUp5WwH9+F2Kp7Bjbb8WF9lql/nr8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230424094711eucas1p2781b0136735b714193d21cff5590cf74~Y1eMNu4CD1796617966eucas1p2k;
 Mon, 24 Apr 2023 09:47:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 29.DC.09966.F1056446; Mon, 24
 Apr 2023 10:47:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230424094711eucas1p23429bbf3a6b2bf9c1f521d817b4b35be~Y1eLrMjGo2062420624eucas1p2A;
 Mon, 24 Apr 2023 09:47:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230424094711eusmtrp176e1029dd6946ad2185622801bbfcdde~Y1eLqWtFg1647016470eusmtrp1G;
 Mon, 24 Apr 2023 09:47:11 +0000 (GMT)
X-AuditID: cbfec7f4-d4fff700000026ee-15-6446501fea58
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 86.A3.22108.F1056446; Mon, 24
 Apr 2023 10:47:11 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230424094709eusmtip243525c2abb95580c9c7eea2503ff636f~Y1eKWbVrJ0427804278eusmtip2c;
 Mon, 24 Apr 2023 09:47:09 +0000 (GMT)
Message-ID: <ceee0290-211b-a675-2ba5-9342ee27fc49@samsung.com>
Date: Mon, 24 Apr 2023 11:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH V2 4/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Adam Ford <aford173@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAGXv+5H34ojUAPWWpF+-=XpdF6Jj_Q7nqiPg3TEKVNXu4F6JAQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTH89x3GsoupYQTIJg1m8lkIA6z3UXnnG+5sn1wbpjFL1roFdxo
 Ib3t1GWZ3cBikbkCmcjtKDqcdRJgQ1DelkVwtl03FCwvMqTIJMamgAQwTDOc5bKNb7//Of8n
 /3NOHgZXjZPxzEGDSTAatHkaSkFcvv7XjZRVu3bo0qY60rmRP3w419F/guYCtbMEV9bqoDj/
 /DTFzTXZKe5+TQPivKF+grOVnaO5W+3fUFzI+jniptuGEVfuvE1yp623yM1RfP1MgOQfuCw4
 77D0ErxT8hB8m3SH5h3Hq0i+tvMBxjddtFG8x96H8SMDnRQfOOHG+NmmpF2RexUbdULewY8F
 49pN+xW5xb2JBYXPHw4NZViQL74EMQyw62HR+1oJUjAq9gICh32YksUcgtLxRlwWswjO9bqe
 iYilF9ODX2Jyw4WgZdC5LGYQ3Px6gg67lOwmWBgcWGKCfRGmmu8Scj0avFX3ljiWFeALR2jJ
 E8Puhd4FDwozzsbB8L0aLMxqdjtYKn6kwwE468Xh70kHGW5Q7DoomSyhwhzBvguL14uWH6+C
 whbH8qg/R4B9HpN5GzSMPqFkjoGgu5mWORF8FaVEOADYYgRnngQwWdgRWO4PI9m1AUZ6HlPh
 k+HsS9DYvlYuvwW2X1tJ+ZJRMDQZLc8QBeWXK3G5rITjVpXsXg2Su+G/2Ks3+3A70kgrziKt
 WF9asY30f+4ZRFxEcYJZ1OcI4isG4VCqqNWLZkNOana+vgk9+4a+RfdcK3IFZ1K7EMagLgQM
 rlErefMWnUqp0x75RDDm7zOa8wSxCyUwhCZOmfyGN1vF5mhNwkeCUCAY/+1iTES8BROL5jfG
 quuz0C9jD5P8aeqt10xiuit6OlZX4d995bNIp6XtVE/db39uf09h6S7LfP3qhvyBYHVB9Xqp
 Kv3uDzUZ35v31Tmf7p8oPrLtd7vq8QdvX6vF+4+dbowrDB3LTGsfakioHl3wXKK+83Bb8/0n
 f0qLTDowJnxVpJi1PqqeCaxO7nSd5w5vZhsv1E6cvULned/M7Yp1nMo90IKPJzzyNc+XZ+x4
 7v2zu0/qjj5spsumet6JoXfqE+90vKqvqiSyxtQ39nxYYD6Urfg02T0aNIKp/tskOqvPv2cy
 s/Jl26Xg08QU6YXS7vNbRpwp5M54g4m09q85WqexmW7XJ4jKbg0h5mrXrcGNovYferLpu/UD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGIsWRmVeSWpSXmKPExsVy+t/xe7ryAW4pBre2ClvcuX2a2WL31W52
 i/uLP7NYTNwxm83iytf3bBZfNk1gs3g+fx2jxck3V1ksOicuYbe4vGsOm8WbtkZGi/c7bzFa
 TJp3k9ViRttlVgc+j7Uf77N6vFzewOwxu+Eii8e8WSdYPHbOusvuMbtjJqvH4j0vmTw2repk
 8zgx4RKTx51re9g87ncfZ/L4vEkugCdKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng8
 1srIVEnfziYlNSezLLVI3y5BL6P9okxBs2LFmxteDYynpboYOTkkBEwk3l/vZepi5OIQEljK
 KHGtbSczREJG4uS0BlYIW1jiz7UuNoii94wS63e8ASviFbCT+HH9GjuIzSKgKvFuy0MWiLig
 xMmZT8BsUYFUiRt7/rCB2MICURIXf5xgBLGZBcQlbj2ZzwRiiwi4SjRM3sgOsoBZ4CSzxINX
 HSwQ2yYxS5z5ehzsDDYBQ4mut11gkzgFAiX+HWuBmmQm0bW1C8qWl2jeOpt5AqPQLCSHzEKy
 cBaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQITADbjv3cvINx3quPeocYmTgY
 DzFKcDArifB6lDqlCPGmJFZWpRblxxeV5qQWH2I0BYbGRGYp0eR8YArKK4k3NDMwNTQxszQw
 tTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgEtZkOqqUVb0hs/vjETa9Je6fpfhUSioO
 zEtc1dHBcEg2JNRQ/PWESX0Ba5M/zTCf+edSRV/sDG+Vx4LvbeU5f+kev1jSk13El6W9q0v0
 4uL0dK0lsfwLplRMEZvPLWyoaS/150X79rvOtww8jrltezBFT2zyshNsKpYdT4tv3zv6WfnO
 bT3Gi+fLl+ffE74YfuD7Me179r23TkZHyvYyP5gnG6o68eXrmv2zjY+sjtXijms948tcsX55
 uXvwyWen/nq+bp5QcZrDWSSZs3ux4cX5jJoO3ScOLHgTL/ar1nRH9y3/EIlVz76w3XTqEBD6
 VT1xx+TrLKvSDESWTp/0T+irYu3BM/tlIgRYT4gWKLEUZyQaajEXFScCAHpY4AmJAwAA
X-CMS-MailID: 20230424094711eucas1p23429bbf3a6b2bf9c1f521d817b4b35be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230424094440eucas1p1ca3d678493aef1d6a893abdfcaf01584
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230424094440eucas1p1ca3d678493aef1d6a893abdfcaf01584
References: <20230423121232.1345909-1-aford173@gmail.com>
 <20230423121232.1345909-5-aford173@gmail.com>
 <CAGXv+5GHcigEahCp+UefxR+AboF7i-kYJjiNftz8fPDLAZVMow@mail.gmail.com>
 <CAHCN7x+i41UkpdqLbK8s+OJmS=ExsctZwZL0YAQAic=N6kCbAw@mail.gmail.com>
 <CGME20230424094440eucas1p1ca3d678493aef1d6a893abdfcaf01584@eucas1p1.samsung.com>
 <CAGXv+5H34ojUAPWWpF+-=XpdF6Jj_Q7nqiPg3TEKVNXu4F6JAQ@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.04.2023 11:44, Chen-Yu Tsai wrote:
> On Mon, Apr 24, 2023 at 5:31 PM Adam Ford <aford173@gmail.com> wrote:
>> On Mon, Apr 24, 2023 at 1:12 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>> On Sun, Apr 23, 2023 at 8:13 PM Adam Ford <aford173@gmail.com> wrote:
>>>> The DPHY timings are currently hard coded. Since the input
>>>> clock can be variable, the phy timings need to be variable
>>>> too.  Add an additional variable to the driver data to enable
>>>> this feature to prevent breaking boards that don't support it.
>>>>
>>>> The phy_mipi_dphy_get_default_config function configures the
>>>> DPHY timings in pico-seconds, and a small macro converts those
>>>> timings into clock cycles based on the pixel clock rate.
>>>>
>>>> Signed-off-by: Adam Ford <aford173@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/bridge/samsung-dsim.c | 79 +++++++++++++++++++++++----
>>>>   include/drm/bridge/samsung-dsim.h     |  1 +
>>>>   2 files changed, 70 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> index 5b6e7825b92f..f165483d5044 100644
>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> @@ -18,9 +18,7 @@
>>>>   #include <linux/media-bus-format.h>
>>>>   #include <linux/of_device.h>
>>>>   #include <linux/phy/phy.h>
>>>> -
>>>>   #include <video/mipi_display.h>
>>>> -
>>>>   #include <drm/bridge/samsung-dsim.h>
>>>>   #include <drm/drm_panel.h>
>>>>   #include <drm/drm_print.h>
>>>> @@ -218,6 +216,8 @@
>>>>
>>>>   #define OLD_SCLK_MIPI_CLK_NAME         "pll_clk"
>>>>
>>>> +#define PS_TO_CYCLE(PS, MHz) DIV64_U64_ROUND_CLOSEST(((PS) * (MHz)), 1000000000000ULL)
>>>> +
>>>>   static const char *const clk_names[5] = {
>>>>          "bus_clk",
>>>>          "sclk_mipi",
>>>> @@ -487,6 +487,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
>>>>          .m_min = 64,
>>>>          .m_max = 1023,
>>>>          .vco_min = 1050,
>>>> +       .dynamic_dphy = 1,
>>>>   };
>>>>
>>>>   static const struct samsung_dsim_driver_data *
>>>> @@ -698,13 +699,50 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
>>>>          const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
>>>>          const unsigned int *reg_values = driver_data->reg_values;
>>>>          u32 reg;
>>>> +       struct drm_display_mode *m = &dsi->mode;
>>>> +       int bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>>>> +       struct phy_configure_opts_mipi_dphy cfg;
>>>> +       int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
>>>> +       int hs_exit, hs_prepare, hs_zero, hs_trail;
>>>> +       unsigned long long clock_in_hz = m->clock * 1000;
>>>>
>>>>          if (driver_data->has_freqband)
>>>>                  return;
>>>>
>>>> +       /* The dynamic_phy has the ability to adjust PHY Timing settings */
>>>> +       if (driver_data->dynamic_dphy) {
>>>> +               phy_mipi_dphy_get_default_config(clock_in_hz, bpp, dsi->lanes, &cfg);
>>> This requires adding "select GENERIC_PHY_MIPI_DPHY" to DRM_SAMSUNG_DSIM,
>>> otherwise with CONFIG_DRM_SAMSUNG_DSIM=m:
>>>
>>> ERROR: modpost: "phy_mipi_dphy_get_default_config"
>>> [drivers/gpu/drm/bridge/samsung-dsim.ko] undefined!
>>> make[5]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
>>> make[4]: *** [Makefile:1978: modpost] Error 2
>>> make[3]: *** [Makefile:357: __build_one_by_one] Error 2
>>>
>>> I'm sure there'll be a similar error if CONFIG_DRM_SAMSUNG_DSIM=y.
>> That's interesting, I didn't come across that.
>> What did you use for a starting point when you applied the patches?
>> I want to see if I can replicate it.
> next-20230421. My config is pretty much tailored to the Hummingbird Pulse.
> Device drivers for other hardware or things that I can't enable are all
> disabled. For example I don't have PHY_MIXEL_MIPI_DPHY enabled.
>
> Maybe you have some other bridge or phy that selects it enabled?


I've observed similar issue while building exynos_defconfig for arm 32bit.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

