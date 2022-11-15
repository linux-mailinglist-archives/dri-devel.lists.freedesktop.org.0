Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF6462A43A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 22:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F14C10E168;
	Tue, 15 Nov 2022 21:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488D710E168
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 21:38:07 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221115213805euoutp02953f644ed03966646040bc600240a192~n39NA4hE_2850628506euoutp029
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 21:38:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221115213805euoutp02953f644ed03966646040bc600240a192~n39NA4hE_2850628506euoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668548285;
 bh=dlOLGbeYtAmwruWt2LJODfBxsN3pSZ4ADjhaTswTmQk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=SIAyy+QgGVXwfwFxxrdRtIPJX+C6syDRp6/m8lEhzQfxdjanj6XcMgVRLtZ8Uvxtu
 KDc3iuWlWcZH59j3IH29LidXvd+kr6xVjUQS6Ucf9uXhmHKUTuR85c+EyXl2hf1j5F
 OvKZPMWovgAFfAU+vRHySHTYgeghTZj3iayoO7Ho=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221115213805eucas1p216f593703c13a980cde146708bcbe103~n39MtUTUO1159611596eucas1p2j;
 Tue, 15 Nov 2022 21:38:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id FB.70.10112.CB604736; Tue, 15
 Nov 2022 21:38:04 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221115213804eucas1p2f6d363e597ab713cf4db3628a53f6161~n39LvjpqG1160011600eucas1p2i;
 Tue, 15 Nov 2022 21:38:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221115213803eusmtrp145baea1c17142b9755297df323463f11~n39LtbGfa2532225322eusmtrp1j;
 Tue, 15 Nov 2022 21:38:03 +0000 (GMT)
X-AuditID: cbfec7f4-d09ff70000002780-e3-637406bc2fd9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4F.0F.08916.BB604736; Tue, 15
 Nov 2022 21:38:03 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221115213802eusmtip1e30e4837f7ca7a88d59ee3dfe4c6eac0~n39Klh5eq2080920809eusmtip1a;
 Tue, 15 Nov 2022 21:38:02 +0000 (GMT)
Message-ID: <cbae1c2d-d4e0-1cc2-e4dd-f01ff8e150a3@samsung.com>
Date: Tue, 15 Nov 2022 22:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Marek Vasut <marex@denx.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZB-uxzTP0umnkhhdw1nBRYab_K+EdYheGmS_SO+v8dcBg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTZxjNe+/t7aWx5FJwvFGC0CkJbKI4595Ew1hj5lW3ycfMmDGTrlyB
 UJC04CY/NkDHoBRXofLRqah8VTLH6BBEkUyGwNYUhCF0Au1cMZaP6oAyBwUy6NWNf+ec5zw5
 53nzUriolNxAJaWms4pUqVxMCoimzvnera1kumz7nHo3Ghk24shaOUugyWE9iQbmnpGosLqH
 h4qsGgI5DRoS2S19BDLlTPFR/rkqPqrVtJHIYBvkIdXCNRyV9bZhaCo3GyDjn/U4+jX7KwL1
 a38m0Yzu0cq0eJxEfd0zOHruMuERrzDXp6085pKum2C03R08pkc9SjItulE+821eOY+pbB3H
 mI4HlTxmZLCVZKwFXRjzY9WXTMPTmxhztrEOMLMG/0jPI4I98aw86SSr2BYeJ0hs1hn5aR37
 Ph9Q6/lZwP6WCnhQkN4JW+7m4CogoES0HsC80et8jjgBLLbcfkFmAfzpuRN/uXKm5CzgBrUA
 Xh0+zePINIDV8xZi1SWkw+Hknd+wVUzQW6D9xt8vdC/4S/mYG6+n4+GVRrPb403Hwjvnq906
 TvvCh2MVbt2HzoSu8UV3DZyuIaF+yeiuQdJhUOVQkavYg46CTQ0/8LnlTbDZccF9EaRVAniu
 4SnG9d4L+/u4dpD2hhNdjXwO+0FjsZrgFr4G8LLLinFEA2DWk4eAc+2GIz0LK3HUSkQwrL+1
 jZPfgeYcA7YqQ9oTmh1eXAlPWNRUinOyEOblijh3ENR1ff9f7N37/bgGiHVr3kW35n7dmnN0
 /+deBkQd8GUzlCkJrHJHKvtZqFKaosxITQiVnUgxgJW/a1zuct4EtRPToe0Ao0A7gBQu9hHG
 lihlImG89FQmqzhxTJEhZ5XtYCNFiH2FZFmITEQnSNPZZJZNYxUvpxjlsSELC7BeiSw8cIzs
 XJY8Sr/42rVMeXCRz+/IXn4gIfPB4eP6Cg0vzlVv/0gC5KY/dli0iR8ElfXFJBXUbEkLTf6n
 ZnlpuqHHNNTyRjxmnovcFXD06BBv3TfPok5VRQVuqko+uN1j8tMn+xYGbodJYus+9s+zVoYY
 tRGvD723uezw/ff3R5Dr/bSOuk8OUUTQ0D3LGW/JRZuDbgtofDx579X5wZnCjYEfHhwzd2YP
 TrxbcXqmd5dEH7g1OHy2I/xI0KJMbYqOLtgb992ex0mjXSWbs9Y5sb+Y/X4mW8XJW8tLX9jM
 /ogHoxZLwdvVS1cnbAPNXm9m35jKrY925e+81Nsqy4+JOS4mlInSsBBcoZT+C1MhfaIqBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7q72UqSDS6fM7K4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFpSmH2Sw+zXoIlJ38ks3i4olPzBbff59ldhDz
 WPvxPqvHvFknWDymnDjC6nGu5y6bx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH
 5iX1Hhvf7WDy6NuyitHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
 UyV9O5uU1JzMstQifbsEvYzts06zFxxxr7jSs4K9gfGFeRcjJ4eEgIlEy7Q+RhBbSGApo8TW
 tewQcRmJk9MaWCFsYYk/17rYIGreM0r0z9AHsXkF7CRe773MBGKzCKhKvNj6jQUiLihxcuYT
 IJuDQ1QgRWLdkSiQsLBAhMTeqUvBSpgFxCVuPZkP1ioiUCVx6fZF5i5GLqD4CjaJAz3TWUEc
 IYH1LBLPL/8HO4hNwFCi6y3EEZwCgRLbNm5gh5hkJtG1tYsRwpaX2P52DvMERqFZSO6YhWTh
 LCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iRGYYLYd+7l5B+O8Vx/1DjEycTAe
 YpTgYFYS4Y2YVpwsxJuSWFmVWpQfX1Sak1p8iNEUGBgTmaVEk/OBKS6vJN7QzMDU0MTM0sDU
 0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoFp8a7sZVtk1wWp1VRLRbObnZRfuvb7hu6+
 1kO6KxNK9mcaPq1aySRaHLbt+fJFHs1BfzK7Fh3lSqv4n9IUnxql58f+7kaiee/mJ8GOjTuV
 HjGf4lFom7vo3lvjsGdZu/5GrUvXnn5w1iqzc7b11ruSD78MUsrt77+S3vHuXJ5Wu+TODQKd
 UZILbj3hu9le4XH21nczydiKCSE6pYterFv03FP578b/Oh/PLlcTy0liVzFN47yxSsjdwfHr
 rW1x/OYr2NkijMyvtk7jkHVZb/Ql1HKW0JLjVWczFBf8vzP5Rlnd7ktmdhMdAi4Xit54u7RY
 et3b54aKXkofFDw1pP8ECJiHzssVe1n7rGemxXQlluKMREMt5qLiRADwO6SauQMAAA==
X-CMS-MailID: 20221115213804eucas1p2f6d363e597ab713cf4db3628a53f6161
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
 <928ec100-83c0-cbfe-8005-ccf872538999@samsung.com>
 <4f9dd1bd-a5c8-c14a-fabd-bcc53406a4a9@kontron.de>
 <CAMty3ZB-uxzTP0umnkhhdw1nBRYab_K+EdYheGmS_SO+v8dcBg@mail.gmail.com>
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

Hi Jagan,

On 15.11.2022 10:20, Jagan Teki wrote:
> On Tue, Nov 15, 2022 at 2:18 PM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>> On 15.11.22 09:09, Marek Szyprowski wrote:
>>> On 14.11.2022 18:07, Jagan Teki wrote:
>>>> On Mon, Nov 14, 2022 at 8:10 PM Marek Szyprowski
>>>> <m.szyprowski@samsung.com> wrote:
>>>>> On 14.11.2022 11:57, Marek Szyprowski wrote:
>>>>>> On 10.11.2022 19:38, Jagan Teki wrote:
>>>>>>> Finding the right input bus format throughout the pipeline is hard
>>>>>>> so add atomic_get_input_bus_fmts callback and initialize with the
>>>>>>> proper input format from list of supported output formats.
>>>>>>>
>>>>>>> This format can be used in pipeline for negotiating bus format between
>>>>>>> the DSI-end of this bridge and the other component closer to pipeline
>>>>>>> components.
>>>>>>>
>>>>>>> List of Pixel formats are taken from,
>>>>>>> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>>>>> 3.7.4 Pixel formats
>>>>>>> Table 14. DSI pixel packing formats
>>>>>>>
>>>>>>> v8:
>>>>>>> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2
>>>>>>>
>>>>>>> v7, v6, v5, v4:
>>>>>>> * none
>>>>>>>
>>>>>>> v3:
>>>>>>> * include media-bus-format.h
>>>>>>>
>>>>>>> v2:
>>>>>>> * none
>>>>>>>
>>>>>>> v1:
>>>>>>> * new patch
>>>>>>>
>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/bridge/samsung-dsim.c | 53 +++++++++++++++++++++++++++
>>>>>>>     1 file changed, 53 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> index 0fe153b29e4f..33e5ae9c865f 100644
>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> @@ -15,6 +15,7 @@
>>>>>>>     #include <linux/clk.h>
>>>>>>>     #include <linux/delay.h>
>>>>>>>     #include <linux/irq.h>
>>>>>>> +#include <linux/media-bus-format.h>
>>>>>>>     #include <linux/of_device.h>
>>>>>>>     #include <linux/phy/phy.h>
>>>>>>>     @@ -1321,6 +1322,57 @@ static void
>>>>>>> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>>>>>         pm_runtime_put_sync(dsi->dev);
>>>>>>>     }
>>>>>>>     +/*
>>>>>>> + * This pixel output formats list referenced from,
>>>>>>> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>>>>> + * 3.7.4 Pixel formats
>>>>>>> + * Table 14. DSI pixel packing formats
>>>>>>> + */
>>>>>>> +static const u32 samsung_dsim_pixel_output_fmts[] = {
>>>>>>> +    MEDIA_BUS_FMT_UYVY8_1X16,
>>>>>>> +    MEDIA_BUS_FMT_RGB101010_1X30,
>>>>>>> +    MEDIA_BUS_FMT_RGB121212_1X36,
>>>>>>> +    MEDIA_BUS_FMT_RGB565_1X16,
>>>>>>> +    MEDIA_BUS_FMT_RGB666_1X18,
>>>>>>> +    MEDIA_BUS_FMT_RGB888_1X24,
>>>>>>> +};
>>>>>>> +
>>>>>>> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
>>>>>>> +{
>>>>>>> +    int i;
>>>>>>> +
>>>>>>> +    for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); i++) {
>>>>>>> +        if (samsung_dsim_pixel_output_fmts[i] == fmt)
>>>>>>> +            return true;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return false;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static u32 *
>>>>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>>>>> +                       struct drm_bridge_state *bridge_state,
>>>>>>> +                       struct drm_crtc_state *crtc_state,
>>>>>>> +                       struct drm_connector_state *conn_state,
>>>>>>> +                       u32 output_fmt,
>>>>>>> +                       unsigned int *num_input_fmts)
>>>>>>> +{
>>>>>>> +    u32 *input_fmts;
>>>>>>> +
>>>>>>> +    if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
>>>>>>> +        return NULL;
>>>>>> Please add support for MEDIA_BUS_FMT_FIXED and maybe default to
>>>>>> MEDIA_BUS_FMT_RGB888_1X24 if requested format is not matched.
>>>>>>
>>>>>> Otherwise the above check breaks all current clients of the Samsung
>>>>>> DSIM/Exynos DSI. I didn't dig into the bus matching code yet, but all
>>>>>> DSI panels requests such format on my test systems...
>>>>> I've checked a bit more the bus format related code and it looks that
>>>>> there are more issues. The DSI panels don't use the MEDIA_BUS_FMT_*
>>>>> formats thus the bridge negotiation code selects MEDIA_BUS_FMT_FIXED for
>>>>> them. On Arndale board with Toshiba tc358764 bridge the
>>>>> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG output_fmt is requested in
>>>>> samsung_dsim_atomic_get_input_bus_fmts() (forwarded from the LVDS panel,
>>>> dsim => tc358764 => panel-simple
>>>>
>>>> If I understand the bridge format negotiation correctly - If
>>>> atomic_get_input_bus_fmts is not implemented in tc358764 then
>>>> MEDIA_BUS_FMT_FIXED will be the output_fmt for dsim so we can assign
>>>> MEDIA_BUS_FMT_RGB888_1X24 for FIXED formats.
>>>>
>>>> from include/drm/drm_bridge.h:
>>>>
>>>>            * This method is called on all elements of the bridge chain as part of
>>>>            * the bus format negotiation process that happens in
>>>>            * drm_atomic_bridge_chain_select_bus_fmts().
>>>>            * This method is optional. When not implemented, the core will bypass
>>>>            * bus format negotiation on this element of the bridge without
>>>>            * failing, and the previous element in the chain will be passed
>>>>            * MEDIA_BUS_FMT_FIXED as its output bus format.
>>>>
>>>> As I can see tc358764 is not implemented either
>>>> atomic_get_input_bus_fmts or atomic API, so I think dsim gets the
>>>> MEDIA_BUS_FMT_FIXED bridge pipeline. I have tested sn65dsi without
>>>> atomic_get_input_bus_fmts I can see the dsim is getting
>>>> MEDIA_BUS_FMT_FIXED.
>>>>
>>>> Can you check the same from your side?
>>> Here in case of Arndale 5250 with the following pipeline:
>>>
>>> dsim => tc358764 => panel-simple (boe,hv070wsa-100 panel)
>>>
>>> the DRM core requests MEDIA_BUS_FMT_RGB888_1X7X4_SPWG format, taken from the boe_hv070wsa panel (see from drivers/gpu/drm/panel/panel-simple.c). Please note that in case of Exynos, the reversed bridge chain order is used for dsim, so this is another nasty consequence of that hack. :/
>>>
>>> Maybe if no compatible bus format is found, the driver should force
>>> MEDIA_BUS_FMT_RGB888_1X24 until a proper format negotiation is
>>> implemented and hacks removed?
>> For this specific case, wouldn't it be better to just fix the format
>> negotiation for tc358764 using atomic_get_input_bus_fmts()? It should
>> probably do the same as sn65dsi83 and request MEDIA_BUS_FMT_RGB888_1X24
>> from the DSI.
>>
>> Forwarding the LVDS-specific format to the input is obviously the wrong
>> thing for the tc358764 driver to do.
>>
>> But I agree, if there are other problematic pipelines with other
>> bridge/display drivers that don't pass a correct format, we should
>> accept them for now and fall back to a sane default
>> (MEDIA_BUS_FMT_RGB888_1X24) and fix the other drivers afterwards.
>>
>> Let's not delay this series any further and better work on how to get it
>> merged before we miss another merge window.
> Agreed this point, here is the updated diff (on top of this patch) for
> falling back to the default format for those.
>
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1387,6 +1387,8 @@ static const u32 samsung_dsim_pixel_output_fmts[] = {
>          MEDIA_BUS_FMT_RGB565_1X16,
>          MEDIA_BUS_FMT_RGB666_1X18,
>          MEDIA_BUS_FMT_RGB888_1X24,
> +
> +       MEDIA_BUS_FMT_FIXED,
>   };
>
>   static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
> @@ -1412,7 +1414,13 @@ samsung_dsim_atomic_get_input_bus_fmts(struct
> drm_bridge *bridge,
>          u32 *input_fmts;
>
>          if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
> -               return NULL;
> +               /*
> +                * Some bridge/display drivers are still not able to pass
> +                * the correct format, so handle those pipelines by falling
> +                * back to the default format till the supported format list
> +                * gets finalized.
> +                */
> +               output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
>
>          *num_input_fmts = 1;
>
> @@ -1420,7 +1428,14 @@ samsung_dsim_atomic_get_input_bus_fmts(struct
> drm_bridge *bridge,
>          if (!input_fmts)
>                  return NULL;
>
> -       input_fmts[0] = output_fmt;
> +       switch (output_fmt) {
> +       case MEDIA_BUS_FMT_FIXED:
> +               input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +               break;
> +       default:
> +               input_fmts[0] = output_fmt;
> +               break;
> +       }
>
>          return input_fmts;
>
> If all is okay, I will send v9 which would probably test it for the
> final version to merge.

This works for me (I've manually applied the above changes, due to 
malformed diff).

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

