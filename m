Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6206282E5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 15:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A20D10E0AB;
	Mon, 14 Nov 2022 14:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B124A10E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 14:41:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221114144058euoutp018ae30cdeb3ae40791f30429408926026~nenvGH2db0643606436euoutp01f
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 14:40:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221114144058euoutp018ae30cdeb3ae40791f30429408926026~nenvGH2db0643606436euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668436859;
 bh=9XDQ/r4dHi7QLOq7VZg2a3ZYAQ5YTASO4sDldwMGtVY=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=fcrZfW3mQJH1EFR0YzaZueItRT3zJrWJxfGaT5CeYGSUSMVtVQ1nE5T0uJzOwqF+M
 b4aMNNxy0OCbcX7YW9LT/toRmhWdvQr7fmLHaKVtCKXF3enwnIItzgiA3h8B74oRH3
 zPCDgB1vhOAIPdfzpB0RyW5EcHk539cWvk7NjTUo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221114144058eucas1p211f3c2ab63eb6fabf271b009bdbaddc1~nenuvR2t52870928709eucas1p2V;
 Mon, 14 Nov 2022 14:40:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id DB.87.09549.A7352736; Mon, 14
 Nov 2022 14:40:58 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221114144058eucas1p294ae581a3a350dd46da05bb8072dbd31~nenuWxOvy1717417174eucas1p2v;
 Mon, 14 Nov 2022 14:40:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221114144058eusmtrp269a251061a3bdb446eccd2f54b3c8151~nenuVpdTB3063930639eusmtrp2l;
 Mon, 14 Nov 2022 14:40:58 +0000 (GMT)
X-AuditID: cbfec7f5-f47ff7000000254d-c9-6372537a9c43
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 41.7E.09026.A7352736; Mon, 14
 Nov 2022 14:40:58 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221114144057eusmtip1ee3281904e5f6640cda293e4a6c827c3~nentVy8im1815918159eusmtip14;
 Mon, 14 Nov 2022 14:40:57 +0000 (GMT)
Message-ID: <56cab7d0-d9fb-d890-0b1c-678980eafd9c@samsung.com>
Date: Mon, 14 Nov 2022 15:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>, Marek Vasut <marex@denx.de>
In-Reply-To: <b13635de-26ce-a8e8-e38e-13c49a99312d@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTZxT2vV8tzUoulck7FXRF9+EmYmTzTVRgc3HXaHSZ2UKWJdDBFVAK
 pAXGUDYUJ1I77ESGbTeBtAzUlIaOqWysEWQUVikgSjpAqraOD4sVKFFsAqO9++Df8zznOe9z
 zsnLx0UV1Ep+emYOK8uUZIgpAXGlY862seCALDl6wLUGDQ9ZceTQzRDo0VA9hW7Peij0Ta2N
 RGcdKgJ5TSoKjY30Eaj7uJuHSr/V81Cdykwhk3OARIrnF3F0vseMIffJYwBZHxhx9Mexrwl0
 69wNCk1r7i9Wy8cp1Nc5jaOnvm48fgVjmHKQzAVNJ8Gc62wnGZvyLsU0a+7yGO0pNcnoWsYx
 pv2OjmSGB1ooxnHagjE/6b9iGh9fw5iypkuAmTFFfBD8iWB7CpuRnsfKNsUmCdIun9iWbXgj
 /0RvE1kE7OsUIIgP6RioftgAFEDAF9H1AJr7VCRHvAD2lPgwjswA6LtRyVMAfqClpvIwp9ct
 msb0FEemAPSOeym/SUjHwosV0f4Igl4PrY8nMD8W0iGwS+0i/PhFOgXWNNkD+nI6Af5WURvQ
 cToMDrqqAjpFb4aKSUXg/VDaQMKyH5UBgvvDlM/u435XEB0HK5uVJNe9Bhb/rMX9JkhXCKCr
 6hnBbfoe1F21kBxeDicsTTwOr4YLzVUY11ACYLXP8Q9RAVg0Ogg41zY4bHse2A2nX4fGXzZx
 8jvQftyEcXcJhvbJEG6IYHj2SiXOyUJ46qSIc78CNZaG/2Jbe2/hKiDWLDmMZskBNEvW0fyf
 Ww2ISyCMzZVLU1n5lkz28yi5RCrPzUyNSs6SmsDiz7XOW2avgfqJqag2gPFBG4B8XBwqvLA6
 K1kkTJF8UcDKshJluRmsvA2s4hPiMCF1fkOyiE6V5LCHWTablf1bxfhBK4uwcN2+0RJ3J+H5
 +NGnucV700MT5rfvCe9jE2t91z2vLTi7fPOtW4qnfo15a+iI72C8s/HPffFuB3EwHg926eVz
 H+7ski/TqrrxtOn8jbu2jicuczdejXPnpZevsN3cJS0p0z3sHZks9fa79EeNsWtnDd/ds0dU
 f/R+f0zIy4dU2po5NX50f+uhPMPtnd31kUmfeV6Kaz/tG9g7efnJ7v5wU8GD0uuj93rKPG+2
 T3+5fta8+/e5p2einRnqv979oSXNpjH7blrXRSTJxiITDtS9EOlc1TFSoN1RaN/6dkdYbU72
 q/2Dd5xDY1Ijz/h9B7+wMJ9UyZ8wNQut+4PK9yjzGnasPSIm5GmSzRtwmVzyN2frlgsoBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7pVwUXJBt3vWS3u3D7NbHF/8WcW
 i9e3V7BZXPn6ns2id+k5VotJ9yewWHzZNIHN4sW9iywWZ5vesFt0TlzCbrF8wj42i02Pr7Fa
 dP1ayWwx4/w+Jos3bY2MFqcfrWe2ONXYymJxacphNotPsx4CZSe/ZLO4eOITs8X332eZHcQ8
 1n68z+oxb9YJFo8pJ46wepzrucvmsXPWXXaP2R0zWT0W73nJ5HHk6mJWjzvX9rB53O8+zuSx
 eUm9x8Z3O5g8+rasYvT4vEkugC9Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srI
 VEnfziYlNSezLLVI3y5BL2N1i3XBWu2KlgtbWBsYb6h0MXJwSAiYSCycnt3FyMUhJLCUUeLJ
 nHtMXYycQHEZiZPTGlghbGGJP9e62CCK3jNKvNnwigmkmVfATmLlVAOQGhYBVYnT716B9fIK
 CEqcnPmEBaREVCBFYt2RKJCwsECExN6pS1lAbGYBcYlbT+aDlbMJGEp0vYUYLyKwmVVi77sJ
 TCAOs8BHRolLk7ewQyxuZpKYsmEyI0gLp4C9xPSdPawQo8wkurZ2MULY8hLNW2czT2AUmoXk
 kFlINs5C0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgQlm27GfW3Ywrnz1Ue8Q
 IxMH4yFGCQ5mJRHeeTL5yUK8KYmVValF+fFFpTmpxYcYTYGhMZFZSjQ5H5ji8kriDc0MTA1N
 zCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUamEJzJvNHZi45Nd06akHJDbOAvYVH
 V5dMrHhs+Opj28X4risWPv+33Pmsfrji4p5vK9muff7VrvqP8WCnYOYTU92OOFmzNr7PV3TN
 rYrvPuJWXVdWlrHn7/m79oeFp5faMVWabPDYtef/zN98S/08dyqk1fza8+pg16rsmWrbpFUP
 ccT63A7iu5N0Xq3et3jTmaNmwR94jqUzzblvsayl12ffvkOpb5gTBa9a9h6evln+wN22t9lP
 Yh+G8j4TWn6pv+wWU1zjx8Lvon0LI3tquqTNY84qLLgSKqm2LPGd1F29pBOzVy+Qsz929ENP
 XujTl7u4wnXOy/XeXbbh/9nfUy5vFgmM6kxynb3vw5ETO5WVWIozEg21mIuKEwFwcXe6uQMA
 AA==
X-CMS-MailID: 20221114144058eucas1p294ae581a3a350dd46da05bb8072dbd31
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.11.2022 11:57, Marek Szyprowski wrote:
> On 10.11.2022 19:38, Jagan Teki wrote:
>> Finding the right input bus format throughout the pipeline is hard
>> so add atomic_get_input_bus_fmts callback and initialize with the
>> proper input format from list of supported output formats.
>>
>> This format can be used in pipeline for negotiating bus format between
>> the DSI-end of this bridge and the other component closer to pipeline
>> components.
>>
>> List of Pixel formats are taken from,
>> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>> 3.7.4 Pixel formats
>> Table 14. DSI pixel packing formats
>>
>> v8:
>> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2
>>
>> v7, v6, v5, v4:
>> * none
>>
>> v3:
>> * include media-bus-format.h
>>
>> v2:
>> * none
>>
>> v1:
>> * new patch
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>>   drivers/gpu/drm/bridge/samsung-dsim.c | 53 +++++++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 0fe153b29e4f..33e5ae9c865f 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>>   #include <linux/irq.h>
>> +#include <linux/media-bus-format.h>
>>   #include <linux/of_device.h>
>>   #include <linux/phy/phy.h>
>>   @@ -1321,6 +1322,57 @@ static void 
>> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>       pm_runtime_put_sync(dsi->dev);
>>   }
>>   +/*
>> + * This pixel output formats list referenced from,
>> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>> + * 3.7.4 Pixel formats
>> + * Table 14. DSI pixel packing formats
>> + */
>> +static const u32 samsung_dsim_pixel_output_fmts[] = {
>> +    MEDIA_BUS_FMT_UYVY8_1X16,
>> +    MEDIA_BUS_FMT_RGB101010_1X30,
>> +    MEDIA_BUS_FMT_RGB121212_1X36,
>> +    MEDIA_BUS_FMT_RGB565_1X16,
>> +    MEDIA_BUS_FMT_RGB666_1X18,
>> +    MEDIA_BUS_FMT_RGB888_1X24,
>> +};
>> +
>> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); i++) {
>> +        if (samsung_dsim_pixel_output_fmts[i] == fmt)
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +static u32 *
>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>> +                       struct drm_bridge_state *bridge_state,
>> +                       struct drm_crtc_state *crtc_state,
>> +                       struct drm_connector_state *conn_state,
>> +                       u32 output_fmt,
>> +                       unsigned int *num_input_fmts)
>> +{
>> +    u32 *input_fmts;
>> +
>> +    if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
>> +        return NULL;
>
>
> Please add support for MEDIA_BUS_FMT_FIXED and maybe default to 
> MEDIA_BUS_FMT_RGB888_1X24 if requested format is not matched.
>
> Otherwise the above check breaks all current clients of the Samsung 
> DSIM/Exynos DSI. I didn't dig into the bus matching code yet, but all 
> DSI panels requests such format on my test systems...

I've checked a bit more the bus format related code and it looks that 
there are more issues. The DSI panels don't use the MEDIA_BUS_FMT_* 
formats thus the bridge negotiation code selects MEDIA_BUS_FMT_FIXED for 
them. On Arndale board with Toshiba tc358764 bridge the 
MEDIA_BUS_FMT_RGB888_1X7X4_SPWG output_fmt is requested in 
samsung_dsim_atomic_get_input_bus_fmts() (forwarded from the LVDS panel, 
but this doesn't look like a format really needed on that bridge). A bit 
more logic seems to be needed there to make it working properly.

I suggest to move all this bus format related changes into a separate 
patchset and adjust other bridges/panels/etc as needed in it.

>
>> +
>> +    *num_input_fmts = 1;
>> +
>> +    input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
>> +    if (!input_fmts)
>> +        return NULL;
>> +
>> +    input_fmts[0] = output_fmt;
>> +
>> +    return input_fmts;
>> +}
>> +
>>   static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
>>                        struct drm_bridge_state *bridge_state,
>>                        struct drm_crtc_state *crtc_state,
>> @@ -1385,6 +1437,7 @@ static const struct drm_bridge_funcs 
>> samsung_dsim_bridge_funcs = {
>>       .atomic_duplicate_state        = 
>> drm_atomic_helper_bridge_duplicate_state,
>>       .atomic_destroy_state        = 
>> drm_atomic_helper_bridge_destroy_state,
>>       .atomic_reset            = drm_atomic_helper_bridge_reset,
>> +    .atomic_get_input_bus_fmts    = 
>> samsung_dsim_atomic_get_input_bus_fmts,
>>       .atomic_check            = samsung_dsim_atomic_check,
>>       .atomic_pre_enable        = samsung_dsim_atomic_pre_enable,
>>       .atomic_enable            = samsung_dsim_atomic_enable,
>
> Best regards

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

