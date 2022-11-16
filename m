Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F95D62B489
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 09:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB0410E1D5;
	Wed, 16 Nov 2022 08:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA23110E1D5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 08:07:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221116080712euoutp0172f1e9c2b9d54794f8eccf0adc72f2e6~oAiferrHu2032020320euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 08:07:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221116080712euoutp0172f1e9c2b9d54794f8eccf0adc72f2e6~oAiferrHu2032020320euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668586032;
 bh=1dvfyZJzIch4ops1Y1TmH/ZkJapEUvVcJx91QRUj8q4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=aesPu5uorwgOjYlhl5YBJGXPuSafA/AV9pauL7NiEVdHl+9ATCy7Rv5Lhvb6h1xg4
 y8EWFAdJJ6nyZxc67wFvmFsNfGxExmu7x2yiUy2+imROGOdzW36qaYRcdpwXhyTNX6
 mc2rBr3GuyOrw1B9B+q30nuyKyJOsbDKmBwB4Zvk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221116080711eucas1p1d179bf6626c54f1ed2712a02cc0d8636~oAifAtKb83025630256eucas1p1T;
 Wed, 16 Nov 2022 08:07:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F1.B3.09561.F2A94736; Wed, 16
 Nov 2022 08:07:11 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221116080710eucas1p2f18eb7a627b9b40d5f01dfeb6000e7b0~oAieWVrtK1437514375eucas1p2a;
 Wed, 16 Nov 2022 08:07:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221116080710eusmtrp281daf1d1e0f0796b19de988948bcc920~oAieVbd-M0136101361eusmtrp2V;
 Wed, 16 Nov 2022 08:07:10 +0000 (GMT)
X-AuditID: cbfec7f2-0c9ff70000002559-35-63749a2f14b4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E5.42.08916.E2A94736; Wed, 16
 Nov 2022 08:07:10 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221116080709eusmtip2b5a676ea336b438560e0e8d61268b0df~oAidVlsJx0112001120eusmtip2O;
 Wed, 16 Nov 2022 08:07:09 +0000 (GMT)
Message-ID: <60729cf5-04b1-b9aa-fb0f-60efacde285d@samsung.com>
Date: Wed, 16 Nov 2022 09:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <35a96ba1-1022-5f7a-ffb6-b3400279e244@denx.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7djPc7r6s0qSDWbcVrK4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFpSmH2Sw+zXoIlJ38ks3i4olPzBbff59ldhDz
 WPvxPqvHvFknWDymnDjC6nGu5y6bx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH
 5iX1Hhvf7WDy6NuyitHj8ya5AL4oLpuU1JzMstQifbsEroxVP7exFfzUrFj//DJTA+Nk5S5G
 Tg4JAROJB8+msHcxcnEICaxglJgz8wwzhPOFUaJ5yksWCOczo8SMb09YYFp2rzvNBmILCSxn
 lFg3Rxai6COjxOrlD4FmcXDwCthJdLyxAqlhEVCVmDyvC6yXV0BQ4uRMiDmiAikSC7fcYAKx
 hQUiJPZOXQoWZxYQl7j1ZD5YXETAQ+Lfi21gRzAL3GCT+NR5ESzBJmAo0fW2C+wITgFriRsN
 TawQzfISzVtng70gITCVS2LqtQVMEFe7SNx7OJcNwhaWeHV8CzuELSPxfyfINpCGdkaJBb/v
 QzkTGCUant9ihKiylrhz7hcbyGvMApoS63fpQ4QdJRYePc0KEpYQ4JO48VYQ4gg+iUnbpjND
 hHklOtqEIKrVJGYdXwe39uCFS8wTGJVmIYXLLCT/z0LyziyEvQsYWVYxiqeWFuempxYb5qWW
 6xUn5haX5qXrJefnbmIEptzT/45/2sE499VHvUOMTByMhxglOJiVRHjzJ5ckC/GmJFZWpRbl
 xxeV5qQWH2KU5mBREudlm6GVLCSQnliSmp2aWpBaBJNl4uCUamBqO9Ittkazl9N3r4WseOj8
 A8/de/33v8h6uktQ1s8k8lWU0oHwIu3PtdOTbn7f9Pb9WaPOjYFzw8+FSAfp7qvbEqDmofnj
 d/urrijPNK2Ti20NGY/oG2sxPWDkvvemrFkhyd7owgk3mZlCXM6ZcfUJeuadl+eomNY+Czy9
 5kv2kUk7ynU+fH13LiT9V/6EH28OqiQtTb6Tzub/dWr/yY0Kk57vW3gzsMB3xY8mc+4DZ1eo
 Nnbz3F55hsN0ZeSBMxW6t7ft8BJfOsEz68ixxfKB9znE1nZcfyO9//XhSW1SOnquAqm7jrnu
 COy2dm4uPa9kc36BObfFlyyG2X4TbC5/adXwTxLlvHOl3DjNYo8SS3FGoqEWc1FxIgDpGTRe
 KAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsVy+t/xe7p6s0qSDTa8MrO4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFpSmH2Sw+zXoIlJ38ks3i4olPzBbff59ldhDz
 WPvxPqvHvFknWDymnDjC6nGu5y6bx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH
 5iX1Hhvf7WDy6NuyitHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
 UyV9O5uU1JzMstQifbsEvYxVP7exFfzUrFj//DJTA+Nk5S5GTg4JAROJ3etOs3UxcnEICSxl
 lJi+9xsjREJG4uS0BlYIW1jiz7UuqKL3jBIXm6cBORwcvAJ2Eh1vrEBqWARUJSbP62IBsXkF
 BCVOznzCAlIiKpAise5IFEhYWCBCYu/UpWAlzALiEreezGcCsUUEPCT+vdjGAjKeWeAWm8Sp
 MyuYIXZ9Z5L4uO0gO0gVm4ChRNdbkCM4OTgFrCVuNDSxQkwyk+ja2sUIYctLNG+dzTyBUWgW
 kjtmIVk4C0nLLCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgSmmG3Hfm7ewTjv1Ue9
 Q4xMHIyHGCU4mJVEePMnlyQL8aYkVlalFuXHF5XmpBYfYjQFBsZEZinR5HxgkssriTc0MzA1
 NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamDa/GiGwHRG9vL9Xyy6CzUL63dx
 VAun8H5nvnrMLovd9blZ7+GC1/ePBCRqfoiZ/cdyxavgribPnafNU656s1xMTXlxIr0lrTp5
 We0Jg22GHbsZrM+UmdtvfKr27OCkCcvWBoT8q3hjvLTvxtS5RW+trbTZkm59MebPPcN+ijV3
 fY8tQ9HNGoFFjmoN+k172a5ckLJSPCT5f0/3vxk25jKTF/1V/vHOxc1WyHNJ5/1jyrPZ07fX
 58fLar5x6FCdve37XdmrHyReCcqGBepymfjZ3Fq0ROX0Bp/pm3tcd3+o6jdo07qhzVrnOzfZ
 kNts77lLM+8t/aXLvLem2HH+zZeW1+4cE8s8H7T/SrV2/xYlluKMREMt5qLiRADcWaXBugMA
 AA==
X-CMS-MailID: 20221116080710eucas1p2f18eb7a627b9b40d5f01dfeb6000e7b0
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

On 15.11.2022 13:00, Marek Vasut wrote:
> On 11/14/22 08:49, Jagan Teki wrote:
>> On Sun, Nov 13, 2022 at 5:51 AM Marek Vasut <marex@denx.de> wrote:
>>>
>>> On 11/10/22 19:38, Jagan Teki wrote:
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
>>>> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI 
>>>> DSI/CSI-2
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
>>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 53 
>>>> +++++++++++++++++++++++++++
>>>>    1 file changed, 53 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> index 0fe153b29e4f..33e5ae9c865f 100644
>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> @@ -15,6 +15,7 @@
>>>>    #include <linux/clk.h>
>>>>    #include <linux/delay.h>
>>>>    #include <linux/irq.h>
>>>> +#include <linux/media-bus-format.h>
>>>>    #include <linux/of_device.h>
>>>>    #include <linux/phy/phy.h>
>>>>
>>>> @@ -1321,6 +1322,57 @@ static void 
>>>> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>>        pm_runtime_put_sync(dsi->dev);
>>>>    }
>>>>
>>>> +/*
>>>> + * This pixel output formats list referenced from,
>>>> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>> + * 3.7.4 Pixel formats
>>>> + * Table 14. DSI pixel packing formats
>>>> + */
>>>> +static const u32 samsung_dsim_pixel_output_fmts[] = {
>>>
>>> You can also add :
>>>
>>> MEDIA_BUS_FMT_YUYV10_1X20
>>>
>>> MEDIA_BUS_FMT_YUYV12_1X24
>>
>> Are these for the below formats?
>>
>> "Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
>>   Packed Pixel Stream, 24-bit YCbCr, 4:2:2"
>>>
>>>> +     MEDIA_BUS_FMT_UYVY8_1X16,
>>>> +     MEDIA_BUS_FMT_RGB101010_1X30,
>>>> +     MEDIA_BUS_FMT_RGB121212_1X36,
>>>> +     MEDIA_BUS_FMT_RGB565_1X16,
>>>> +     MEDIA_BUS_FMT_RGB666_1X18,
>>>> +     MEDIA_BUS_FMT_RGB888_1X24,
>>>> +};
>>>> +
>>>> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
>>>> +{
>>>> +     int i;
>>>> +
>>>> +     for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); 
>>>> i++) {
>>>> +             if (samsung_dsim_pixel_output_fmts[i] == fmt)
>>>> +                     return true;
>>>> +     }
>>>> +
>>>> +     return false;
>>>> +}
>>>> +
>>>> +static u32 *
>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>> +                                    struct drm_bridge_state 
>>>> *bridge_state,
>>>> +                                    struct drm_crtc_state 
>>>> *crtc_state,
>>>> +                                    struct drm_connector_state 
>>>> *conn_state,
>>>> +                                    u32 output_fmt,
>>>> +                                    unsigned int *num_input_fmts)
>>>> +{
>>>> +     u32 *input_fmts;
>>>> +
>>>> +     if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
>>>> +             return NULL;
>>>> +
>>>> +     *num_input_fmts = 1;
>>>
>>> Shouldn't this be 6 ?
>>>
>>>> +     input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
>>>> +     if (!input_fmts)
>>>> +             return NULL;
>>>> +
>>>> +     input_fmts[0] = output_fmt;
>>>
>>> Shouldn't this be a list of all 6 supported pixel formats ?
>>
>> Negotiation would settle to return one input_fmt from the list of
>> supporting output_fmts. so the num_input_fmts would be 1 rather than
>> the number of fmts in the supporting list. This is what I understood
>> from the atomic_get_input_bus_fmts API. let me know if I miss
>> something here.
>
> How does the negotiation work for this kind of pipeline:
>
> LCDIFv3<->DSIM<->HDMI bridge<->HDMI connector
>
> where all elements (LCDIFv3, DSIM, HDMI bridge) can support either 
> RGB888 or packed YUV422 ?
>
> Who decides the format used by such pipeline ?
>
> Why should it be the DSIM bridge and not e.g. the HDMI bridge or the 
> LCDIFv3 ?


If I got it right, the drivers reports their preference for the returned 
formats. The format that is first in the reported array is the most 
preferred one. This probably means that in your case the HDMI bridge 
decides by reporting RGB or YUV first (if all elements supports both).


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

