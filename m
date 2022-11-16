Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E46B62BAEE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 12:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72BA10E472;
	Wed, 16 Nov 2022 11:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7110E036
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 11:07:08 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221116110706euoutp01c2aded9f7fb1f0829091e92d3ef7e926~oC-kPtsFQ2489024890euoutp01a
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 11:07:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221116110706euoutp01c2aded9f7fb1f0829091e92d3ef7e926~oC-kPtsFQ2489024890euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668596826;
 bh=GCeAHRBhUM4hDV5qmoB1gpn1sI1NsvvafognEIXV4HM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=NGflG5LUPThw2SoCgLuBYBzzvurTpLPrwH/uvfSg6J/S1Aspo6C2IMe7o36s0AKQP
 9EHqztNtsLTeBs4OgbwwWZJNUvszzcn6Bq8GZZ0FsB9Jodug5q4pPa/E+Erv2rJCj+
 kYYtw0I/mMqfJjnrhKvnsW30EbZLKDF39UomSPGY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221116110705eucas1p10e5b7411d452c21f91a967feafa928bc~oC-j9Bf4I1135811358eucas1p1t;
 Wed, 16 Nov 2022 11:07:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 41.BD.10112.954C4736; Wed, 16
 Nov 2022 11:07:05 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221116110705eucas1p24aa99e75f1eaecdadccf1ad1af885137~oC-jd6Vhs1278612786eucas1p28;
 Wed, 16 Nov 2022 11:07:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221116110705eusmtrp2fdcbcb4315dd50b950f2450529694749~oC-jdCXzo1042210422eusmtrp2o;
 Wed, 16 Nov 2022 11:07:05 +0000 (GMT)
X-AuditID: cbfec7f4-cf3ff70000002780-40-6374c4598601
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4F.F3.08916.954C4736; Wed, 16
 Nov 2022 11:07:05 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221116110704eusmtip13670a376b6106dbfa7d7f9a752eae09b~oC-iXcbVk2116721167eusmtip13;
 Wed, 16 Nov 2022 11:07:04 +0000 (GMT)
Message-ID: <bfd2eea0-04eb-9c98-e8a2-967455d6e5ad@samsung.com>
Date: Wed, 16 Nov 2022 12:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <7635358a-fc32-5a78-6130-7c5f4dd2d81b@denx.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTdxT21/vopazsUlB+UeOjbpCxAXMj2Y9AzEzccueMUReywbJA016q
 EYprYboxFSRFrYV1UmIpG4LAip2DUB6iEXXYUbTlUV7reNW5miEqrjw0A5WV3rnx33e+73z5
 zjk5FCYqIVdT+xRZrFIhSReTAryl4+/uqCRrlvTNqfxYNDpix5C7agZH90dqSTQw94hEhTXd
 BDrt1uFo1qIj0cS4E0ddxx7w0clvq/nIpLtKIssfQwTSzJ/HkKHnKg89KMgDyH6nHkO38tQ4
 6tPfING08XefWnyPRM7OaQw9WejC3l3F/OR1E0y5sRNn9J1WgunWjpHMJeMYnyk7UUowVVfu
 8RjrYBXBjA5dIRn3KRuPaaw+yjRMtfKYoiYzYGYs63YFJQsSZGz6vi9YZcyWVMFex1A5caA0
 5pDnx3P8XPA4QgMCKEjHwgJ3D08DBJSIrgXQ6riBccUsgPXeC4ArZgCsqXbhLyx5zb+RS1hE
 mwCsuC3nmrwAzi+o/YKQ3gI14+N+A06/CrUD1zCOD4Y3Sz1+fiUtg5VNLt4SDqE/gW0lNX4e
 o8PgsOesnw+lGfh8ogVfCsBoFwmnTzr9AklvhpqHGn9YAB0PTU8rAGdeD/ObyzBu0iIBLGoL
 5fA2eF09SXI4BE7amvgcXgsXL531HwDSx33bLLj/LXQA5v45DLiueDjaPe9zU76E12D95RiO
 3gorf7ETSzSkg6DrYTA3QxA83XIG42ghPFEg4rrDodFW91/sz719mA6IjcvOYly2vnHZNsb/
 cysAbgZhbLYqQ86q3lKwB6NVkgxVtkIeLc3MsADf59qf22ZbgWnSG90OeBRoB5DCxKHCzOIs
 qUgok3z5FavMTFFmp7OqdrCGwsVhQtIQKRXRckkWu59lD7DKFyqPClidy5NGzm3kr78moZ7s
 SpzOD7we9PjzgvctJPPxivGjCpa4fLE/8Mjg/Rq8/5vADxrPnXLqt2NKsm+q8HDbzruRTeaO
 ulpgSBPf0e6QhQ/fOrZpMsm1H++VrXkpdicMM3x0ZPfAVlFsXJUs3pmCtZYVpWhzjiePPSp8
 1vNdS/FhfnLJ8IdptOVu9meO8MUe018RzpyvC99IvHio0lwuKPFsSyPlrzQHezberlhx3iHd
 83qEOvEd7XzqSFzDr10XvE+xg5ZVSRsaflB9GjVDbOevtK6rqy/bo5cHv5y6I8rR22jKeTth
 g/lMqeb7OvieOrpjrWGwsn/C5tQvztl740Ke3UxIUohx1V7J5khMqZL8A5V3TCsoBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsVy+t/xu7qRR0qSDZ5vErK4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFpSmH2Sw+zXoIlJ38ks3i4olPzBbff59ldhDz
 WPvxPqvHvFknWDymnDjC6nGu5y6bx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH
 5iX1Hhvf7WDy6NuyitHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
 UyV9O5uU1JzMstQifbsEvYwz1+axFszUr3iyehF7A+M39S5GTg4JAROJxq032boYuTiEBJYy
 SnQ1HmWGSMhInJzWwAphC0v8udYFVfSeUeJu/21GkASvgJ1E1717LCA2i4CqRM+V/cwQcUGJ
 kzOfAMU5OEQFUiTWHYkCCQsLREjsnboUrJxZQFzi1pP5TCC2iICHxL8X21hA5jML3GKTOHVm
 BTPEsrvMElPOLAVbxiZgKNH1FuQKTg5OAWuJ5X8WMEJMMpPo2toFZctLNG+dzTyBUWgWkjtm
 IVk4C0nLLCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgQmmW3Hfm7ewTjv1Ue9Q4xM
 HIyHGCU4mJVEePMnlyQL8aYkVlalFuXHF5XmpBYfYjQFBsZEZinR5HxgmssriTc0MzA1NDGz
 NDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamDq3huev/XrBOGV64omCu6IjP156YlH
 s83v6A1KB1xNH67+OI/vAWun+rGq3Xw1TVrMed/05l2dukqnSy64uVK8wHNNp/mejw5HN/Mn
 KBeXlfyqanVaY1Hj1fs/fxnHhu0+nfcD76rVnG6fLpG5oviXefPaCOeU2wHcHNZaOdP+FbF/
 mJf/10liSwX3vjXav4oN7ZvuqKju6Y7KirzY8TmtrubR7G6+93UPylRXfru2/u/EiNWux6eo
 ZwT/bThdIXuyTPn1/4WWSYFH60Jkjr16+5Rd8bmZj8dMM4fryyNvz/xh2xZxqCb0zXL+lcmh
 wifLzBuleuN/yDMW203pfDf1HMff2zFHsjZPtPwatVmJpTgj0VCLuag4EQA6AumzuwMAAA==
X-CMS-MailID: 20221116110705eucas1p24aa99e75f1eaecdadccf1ad1af885137
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221115120119eucas1p1c57ca32b0a372d00cfb7b6dfb86cc1a7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221115120119eucas1p1c57ca32b0a372d00cfb7b6dfb86cc1a7
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com>
 <694ccb10-15ad-5192-dd1b-86628227fb65@denx.de>
 <CAMty3ZDE4gt_Hhb3pgXW570d6F5f8F3WeEEHiMVuXyrqmka9Kw@mail.gmail.com>
 <CGME20221115120119eucas1p1c57ca32b0a372d00cfb7b6dfb86cc1a7@eucas1p1.samsung.com>
 <35a96ba1-1022-5f7a-ffb6-b3400279e244@denx.de>
 <60729cf5-04b1-b9aa-fb0f-60efacde285d@samsung.com>
 <7635358a-fc32-5a78-6130-7c5f4dd2d81b@denx.de>
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

On 16.11.2022 11:49, Marek Vasut wrote:
> On 11/16/22 09:07, Marek Szyprowski wrote:
>> On 15.11.2022 13:00, Marek Vasut wrote:
>>> On 11/14/22 08:49, Jagan Teki wrote:
>>>> On Sun, Nov 13, 2022 at 5:51 AM Marek Vasut <marex@denx.de> wrote:
>>>>>
>>>>> On 11/10/22 19:38, Jagan Teki wrote:
>>>>>> Finding the right input bus format throughout the pipeline is hard
>>>>>> so add atomic_get_input_bus_fmts callback and initialize with the
>>>>>> proper input format from list of supported output formats.
>>>>>>
>>>>>> This format can be used in pipeline for negotiating bus format 
>>>>>> between
>>>>>> the DSI-end of this bridge and the other component closer to 
>>>>>> pipeline
>>>>>> components.
>>>>>>
>>>>>> List of Pixel formats are taken from,
>>>>>> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>>>> 3.7.4 Pixel formats
>>>>>> Table 14. DSI pixel packing formats
>>>>>>
>>>>>> v8:
>>>>>> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI
>>>>>> DSI/CSI-2
>>>>>>
>>>>>> v7, v6, v5, v4:
>>>>>> * none
>>>>>>
>>>>>> v3:
>>>>>> * include media-bus-format.h
>>>>>>
>>>>>> v2:
>>>>>> * none
>>>>>>
>>>>>> v1:
>>>>>> * new patch
>>>>>>
>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/bridge/samsung-dsim.c | 53
>>>>>> +++++++++++++++++++++++++++
>>>>>>     1 file changed, 53 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>> index 0fe153b29e4f..33e5ae9c865f 100644
>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>> @@ -15,6 +15,7 @@
>>>>>>     #include <linux/clk.h>
>>>>>>     #include <linux/delay.h>
>>>>>>     #include <linux/irq.h>
>>>>>> +#include <linux/media-bus-format.h>
>>>>>>     #include <linux/of_device.h>
>>>>>>     #include <linux/phy/phy.h>
>>>>>>
>>>>>> @@ -1321,6 +1322,57 @@ static void
>>>>>> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>>>>         pm_runtime_put_sync(dsi->dev);
>>>>>>     }
>>>>>>
>>>>>> +/*
>>>>>> + * This pixel output formats list referenced from,
>>>>>> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>>>> + * 3.7.4 Pixel formats
>>>>>> + * Table 14. DSI pixel packing formats
>>>>>> + */
>>>>>> +static const u32 samsung_dsim_pixel_output_fmts[] = {
>>>>>
>>>>> You can also add :
>>>>>
>>>>> MEDIA_BUS_FMT_YUYV10_1X20
>>>>>
>>>>> MEDIA_BUS_FMT_YUYV12_1X24
>>>>
>>>> Are these for the below formats?
>>>>
>>>> "Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
>>>>    Packed Pixel Stream, 24-bit YCbCr, 4:2:2"
>>>>>
>>>>>> +     MEDIA_BUS_FMT_UYVY8_1X16,
>>>>>> +     MEDIA_BUS_FMT_RGB101010_1X30,
>>>>>> +     MEDIA_BUS_FMT_RGB121212_1X36,
>>>>>> +     MEDIA_BUS_FMT_RGB565_1X16,
>>>>>> +     MEDIA_BUS_FMT_RGB666_1X18,
>>>>>> +     MEDIA_BUS_FMT_RGB888_1X24,
>>>>>> +};
>>>>>> +
>>>>>> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
>>>>>> +{
>>>>>> +     int i;
>>>>>> +
>>>>>> +     for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts);
>>>>>> i++) {
>>>>>> +             if (samsung_dsim_pixel_output_fmts[i] == fmt)
>>>>>> +                     return true;
>>>>>> +     }
>>>>>> +
>>>>>> +     return false;
>>>>>> +}
>>>>>> +
>>>>>> +static u32 *
>>>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>>>> +                                    struct drm_bridge_state
>>>>>> *bridge_state,
>>>>>> +                                    struct drm_crtc_state
>>>>>> *crtc_state,
>>>>>> +                                    struct drm_connector_state
>>>>>> *conn_state,
>>>>>> +                                    u32 output_fmt,
>>>>>> +                                    unsigned int *num_input_fmts)
>>>>>> +{
>>>>>> +     u32 *input_fmts;
>>>>>> +
>>>>>> +     if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
>>>>>> +             return NULL;
>>>>>> +
>>>>>> +     *num_input_fmts = 1;
>>>>>
>>>>> Shouldn't this be 6 ?
>>>>>
>>>>>> +     input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
>>>>>> +     if (!input_fmts)
>>>>>> +             return NULL;
>>>>>> +
>>>>>> +     input_fmts[0] = output_fmt;
>>>>>
>>>>> Shouldn't this be a list of all 6 supported pixel formats ?
>>>>
>>>> Negotiation would settle to return one input_fmt from the list of
>>>> supporting output_fmts. so the num_input_fmts would be 1 rather than
>>>> the number of fmts in the supporting list. This is what I understood
>>>> from the atomic_get_input_bus_fmts API. let me know if I miss
>>>> something here.
>>>
>>> How does the negotiation work for this kind of pipeline:
>>>
>>> LCDIFv3<->DSIM<->HDMI bridge<->HDMI connector
>>>
>>> where all elements (LCDIFv3, DSIM, HDMI bridge) can support either
>>> RGB888 or packed YUV422 ?
>>>
>>> Who decides the format used by such pipeline ?
>>>
>>> Why should it be the DSIM bridge and not e.g. the HDMI bridge or the
>>> LCDIFv3 ?
>>
>>
>> If I got it right, the drivers reports their preference for the returned
>> formats. The format that is first in the reported array is the most
>> preferred one. This probably means that in your case the HDMI bridge
>> decides by reporting RGB or YUV first (if all elements supports both).
>
> But in that case, we need to list input_fmts[0]...input_fmts[n-1] in 
> samsung_dsim_atomic_get_input_bus_fmts() and also set *num_input_fmts 
> = n, correct ?
>
Yes, if I got the bus format negotiation code right, but I didn't check 
the details.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

