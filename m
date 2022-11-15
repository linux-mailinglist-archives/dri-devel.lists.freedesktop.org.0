Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C376297E6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 13:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED9310E3BA;
	Tue, 15 Nov 2022 12:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E5B10E3BA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 12:01:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 633D185131;
 Tue, 15 Nov 2022 13:00:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1668513667;
 bh=IJxgP1EpXEQ/FEqlAEx7cM8MHNdIUTzcVgAgAF53b2M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HsYOxYtqVM9xo6sFrkZZ7jRJRmWPR/dkD5BfrkShHRfIoWxl8G7iIixxGavYKbmHW
 ZZ4fKSPDz75CbdwB6RMN98WB/vEXN9PVCErLOKcmmi0N36LUKtla+kzlB7KZN+LN3B
 UKGqTHH0N2QC59Is+w+yI0e0HIjWci5QQ49LYSkgoyRsemLa/ON4dz440zzuhb6rla
 tXYWRxYE0vicM/XFZy0WEiL7cPvEJChnAL1VsxMQMt+JglwfzMVbqfludlnHSOkKbu
 Yjr+VB5DhuDuGK8bT7aAZpwiAUcbNp18Krdq2oRv46JmYsd5el8VxQZQeXBNrAgcua
 KGweRLwd5Y9oQ==
Message-ID: <35a96ba1-1022-5f7a-ffb6-b3400279e244@denx.de>
Date: Tue, 15 Nov 2022 13:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com>
 <694ccb10-15ad-5192-dd1b-86628227fb65@denx.de>
 <CAMty3ZDE4gt_Hhb3pgXW570d6F5f8F3WeEEHiMVuXyrqmka9Kw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZDE4gt_Hhb3pgXW570d6F5f8F3WeEEHiMVuXyrqmka9Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/14/22 08:49, Jagan Teki wrote:
> On Sun, Nov 13, 2022 at 5:51 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 11/10/22 19:38, Jagan Teki wrote:
>>> Finding the right input bus format throughout the pipeline is hard
>>> so add atomic_get_input_bus_fmts callback and initialize with the
>>> proper input format from list of supported output formats.
>>>
>>> This format can be used in pipeline for negotiating bus format between
>>> the DSI-end of this bridge and the other component closer to pipeline
>>> components.
>>>
>>> List of Pixel formats are taken from,
>>> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>> 3.7.4 Pixel formats
>>> Table 14. DSI pixel packing formats
>>>
>>> v8:
>>> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2
>>>
>>> v7, v6, v5, v4:
>>> * none
>>>
>>> v3:
>>> * include media-bus-format.h
>>>
>>> v2:
>>> * none
>>>
>>> v1:
>>> * new patch
>>>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 53 +++++++++++++++++++++++++++
>>>    1 file changed, 53 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> index 0fe153b29e4f..33e5ae9c865f 100644
>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> @@ -15,6 +15,7 @@
>>>    #include <linux/clk.h>
>>>    #include <linux/delay.h>
>>>    #include <linux/irq.h>
>>> +#include <linux/media-bus-format.h>
>>>    #include <linux/of_device.h>
>>>    #include <linux/phy/phy.h>
>>>
>>> @@ -1321,6 +1322,57 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>        pm_runtime_put_sync(dsi->dev);
>>>    }
>>>
>>> +/*
>>> + * This pixel output formats list referenced from,
>>> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>> + * 3.7.4 Pixel formats
>>> + * Table 14. DSI pixel packing formats
>>> + */
>>> +static const u32 samsung_dsim_pixel_output_fmts[] = {
>>
>> You can also add :
>>
>> MEDIA_BUS_FMT_YUYV10_1X20
>>
>> MEDIA_BUS_FMT_YUYV12_1X24
> 
> Are these for the below formats?
> 
> "Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
>   Packed Pixel Stream, 24-bit YCbCr, 4:2:2"
>>
>>> +     MEDIA_BUS_FMT_UYVY8_1X16,
>>> +     MEDIA_BUS_FMT_RGB101010_1X30,
>>> +     MEDIA_BUS_FMT_RGB121212_1X36,
>>> +     MEDIA_BUS_FMT_RGB565_1X16,
>>> +     MEDIA_BUS_FMT_RGB666_1X18,
>>> +     MEDIA_BUS_FMT_RGB888_1X24,
>>> +};
>>> +
>>> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
>>> +{
>>> +     int i;
>>> +
>>> +     for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); i++) {
>>> +             if (samsung_dsim_pixel_output_fmts[i] == fmt)
>>> +                     return true;
>>> +     }
>>> +
>>> +     return false;
>>> +}
>>> +
>>> +static u32 *
>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>> +                                    struct drm_bridge_state *bridge_state,
>>> +                                    struct drm_crtc_state *crtc_state,
>>> +                                    struct drm_connector_state *conn_state,
>>> +                                    u32 output_fmt,
>>> +                                    unsigned int *num_input_fmts)
>>> +{
>>> +     u32 *input_fmts;
>>> +
>>> +     if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
>>> +             return NULL;
>>> +
>>> +     *num_input_fmts = 1;
>>
>> Shouldn't this be 6 ?
>>
>>> +     input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
>>> +     if (!input_fmts)
>>> +             return NULL;
>>> +
>>> +     input_fmts[0] = output_fmt;
>>
>> Shouldn't this be a list of all 6 supported pixel formats ?
> 
> Negotiation would settle to return one input_fmt from the list of
> supporting output_fmts. so the num_input_fmts would be 1 rather than
> the number of fmts in the supporting list. This is what I understood
> from the atomic_get_input_bus_fmts API. let me know if I miss
> something here.

How does the negotiation work for this kind of pipeline:

LCDIFv3<->DSIM<->HDMI bridge<->HDMI connector

where all elements (LCDIFv3, DSIM, HDMI bridge) can support either 
RGB888 or packed YUV422 ?

Who decides the format used by such pipeline ?

Why should it be the DSIM bridge and not e.g. the HDMI bridge or the 
LCDIFv3 ?
