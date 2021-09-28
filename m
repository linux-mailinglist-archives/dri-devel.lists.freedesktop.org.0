Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4DA41B3E2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 18:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618EB8906C;
	Tue, 28 Sep 2021 16:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DDD8906C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 16:27:51 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210928162749euoutp0198d1ed1d2017934e98199df7c6941eb2~pCTaRI8GY2148421484euoutp01P
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 16:27:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210928162749euoutp0198d1ed1d2017934e98199df7c6941eb2~pCTaRI8GY2148421484euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632846469;
 bh=+2JoTXS966b647ps2IBDcC4GQJbzvALJJFGxMynRyaw=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=bB7KzA8o/m4M4IXxLcRYkNkwqnpXi4VHPjRquH+f3IRbrEVAA5zMJKMT7tBlfXAIh
 tP3y+1TN5BNzFh3iSaCEXDEFCdM6OKFk4G8CqUy7Z+JMkBCKVmNym1L7IrzUSFlS7I
 8VOY4drpuXqKMfE9a172U50MS+Cpa6NGaobwVAiw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210928162749eucas1p2a3b3372808c58968437467aaefae9b6a~pCTZ3ch2g1420014200eucas1p2f;
 Tue, 28 Sep 2021 16:27:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0F.8F.42068.58243516; Tue, 28
 Sep 2021 17:27:49 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210928162748eucas1p1f1b19d419d184f65589da75619551c3d~pCTZKTVoV3196331963eucas1p1u;
 Tue, 28 Sep 2021 16:27:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210928162748eusmtrp2fc2a141b500ba2e26f64c322a11effb9~pCTZJjyy82869628696eusmtrp2B;
 Tue, 28 Sep 2021 16:27:48 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-d2-615342857fb9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 27.D8.31287.48243516; Tue, 28
 Sep 2021 17:27:48 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210928162748eusmtip1c98346e91eca798ba5d1a27923759a60~pCTYkpJa10403304033eusmtip1j;
 Tue, 28 Sep 2021 16:27:48 +0000 (GMT)
Message-ID: <538d9195-0552-0721-83c1-f7c717c7fd84@samsung.com>
Date: Tue, 28 Sep 2021 18:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0)
 Gecko/20100101 Thunderbird/93.0
Subject: Re: [PATCH 1/3] drm/bridge: Add a function to abstract away panels
Content-Language: pl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard
 <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <YUvKcTv2hSrUqIvF@pendragon.ideasonboard.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRmVeSWpSXmKPExsWy7djPc7qtTsGJBkfOiFr0njvJZLH8zDpm
 iytf37NZPJ+/jtHi5JurLBadE5ewWyz8uJXFYsaPf4wWh/qiLT7NeshsseXNRFYHbo/3N1rZ
 Pe6cO8/msXPWXXaP2R0zWT0W73nJ5HFiwiUmjzvX9rB5bP/2gNVj3slAj/vdx5k8Np+uDuCO
 4rJJSc3JLEst0rdL4Mp4eGcOU8ENvYoXt3MbGI+odjFyckgImEj0nTvB1sXIxSEksIJR4syn
 f0wQzhdGifeH1kFlPjNKHDmwkR2m5dHuTVBVyxklVq/uZYFw3gM5c46xglTxCthJPJ7dwwZi
 swioSlxbPhsqLihxcuYTFhBbVCBB4vW9TWA1wgLeEq9e7gCrYRYQkbjxqIWxi5GDQ0QgVuLY
 rTSI8GcmielLwkFsNgFNib+bb4K1cgpYScz4P5UZokZeonnrbGaQeyQEFnNKfN26kgniaheJ
 ha9mQdnCEq+Ob4H6Rkbi/875UPF6ifsrWqCaOxgltm7YyQyRsJa4c+4XG8hBzECb1+/SBzEl
 BBwlzlzihzD5JG68FYQ4gU9i0rbpzBBhXomONiGIGYoS989uhZonLrH0wle2CYxKs5DCZBaS
 32cheWYWwtoFjCyrGMVTS4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAtPb6X/Hv+xgXP7qo94h
 RiYOxkOMEhzMSiK8P8SDE4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzJm1ZEy8kkJ5YkpqdmlqQ
 WgSTZeLglGpgWrD7xNxp3Af2SP/0NxL+pScqGPnd9/XZE5ttOzosDdbtlAyfcWxuNN/xV3JN
 +xxmLrt2/9r/WTU/001TjadcEZZ/U7DzWI9jb+iHxr6nF+ed3xSqWM5hzXSZX3l91CGmZLcN
 R+/E9q++cqte9g1/97t3qr6eTbL3GQq+LT3bXG177/oXiUWr5RdXJ4Y07erWqz794q+m7rSL
 1ivU8i5+bJsqaPHn6JVT3jKXn8zUrredt99uXrdyefxk9+C6lmmbl2RvvjfV3SGZ6+mFt1xL
 N+67OvvVzs7SZ/7Lpl9+8FDghYmlj8GcKpW/ZcZSG3qYH00Ovbrf+U5Ddf32Rcp/Hje+l4/Q
 ElK7827K0i07d7AqsRRnJBpqMRcVJwIAeixGnd4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsVy+t/xu7otTsGJBv9uK1v0njvJZLH8zDpm
 iytf37NZPJ+/jtHi5JurLBadE5ewWyz8uJXFYsaPf4wWh/qiLT7NeshsseXNRFYHbo/3N1rZ
 Pe6cO8/msXPWXXaP2R0zWT0W73nJ5HFiwiUmjzvX9rB5bP/2gNVj3slAj/vdx5k8Np+uDuCO
 0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mt4eGcO
 U8ENvYoXt3MbGI+odjFyckgImEg82r2JqYuRi0NIYCmjREfTRRaIhLjE7vlvmSFsYYk/17rY
 IIreMkps+niMCSTBK2An8Xh2DxuIzSKgKnFt+WxWiLigxMmZT8AGiQokSEy+OQ8sLizgLfHq
 5Q4wm1lAROLGoxZGEFtEIFbi8pR2sCuYBb4ySez+3M8Ose01o8Tv5ilg29gENCX+br4Jto1T
 wEpixv+pzBCTzCS6tnYxQtjyEs1bZzNPYBSaheSQWUgWzkLSMgtJywJGllWMIqmlxbnpucWG
 esWJucWleel6yfm5mxiBcb3t2M/NOxjnvfqod4iRiYPxEKMEB7OSCO8P8eBEId6UxMqq1KL8
 +KLSnNTiQ4ymwNCYyCwlmpwPTCx5JfGGZgamhiZmlgamlmbGSuK8W+euiRcSSE8sSc1OTS1I
 LYLpY+LglGpgkhbdV/KX06ebg2nNyiedgo/E/6m/3/NOJvXNxSUe84pLHk+fPEs8ZckK9tz6
 zUfED7pJVWiJ6+9Ui5fivyG0WrZfMunyuxmPvIPlJOPnJLu4ef1cLd5fvPFrbL/oswnc149M
 MUxg8jLzb4lnupzufshme9Vie5E9874I+poqprw7vUTjSICv4TXm38t3LRa9+lZ3+SHf6Pgp
 v59ITwhZEibZKt0cu2Gh0Y/Q51kzpC9u0dIsEROIjn/stV/vRmxz98kJ9cVmu/rkHG5sXPwr
 9MLiZ4eCijZvbnJSlXQXbf5Ror/1fGd1yAvjZYb3Hmx5dMBwafa5b284jRjiOc3/8/j2zqvV
 rMpfv+lVjdJqJZbijERDLeai4kQAPtPrP3QDAAA=
X-CMS-MailID: 20210928162748eucas1p1f1b19d419d184f65589da75619551c3d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210923002950eucas1p246a4e095a09fb8e230ebb717d16be888
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210923002950eucas1p246a4e095a09fb8e230ebb717d16be888
References: <20210910130941.1740182-1-maxime@cerno.tech>
 <20210910130941.1740182-2-maxime@cerno.tech>
 <CGME20210923002950eucas1p246a4e095a09fb8e230ebb717d16be888@eucas1p2.samsung.com>
 <YUvKcTv2hSrUqIvF@pendragon.ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


W dniu 23.09.2021 o 02:29, Laurent Pinchart pisze:
> Hi Maxime,
>
> Thank you for the patch.
>
> I know this has already been merged, but I have a question.
>
> On Fri, Sep 10, 2021 at 03:09:39PM +0200, Maxime Ripard wrote:
>> Display drivers so far need to have a lot of boilerplate to first
>> retrieve either the panel or bridge that they are connected to using
>> drm_of_find_panel_or_bridge(), and then either deal with each with ad-hoc
>> functions or create a drm panel bridge through drm_panel_bridge_add.
>>
>> In order to reduce the boilerplate and hopefully create a path of least
>> resistance towards using the DRM panel bridge layer, let's create the
>> function devm_drm_of_get_next to reduce that boilerplate.
>>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> ---
>>   drivers/gpu/drm/drm_bridge.c | 42 ++++++++++++++++++++++++++++++++----
>>   drivers/gpu/drm/drm_of.c     |  3 +++
>>   include/drm/drm_bridge.h     |  2 ++
>>   3 files changed, 43 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index a8ed66751c2d..10ddca4638b0 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -28,6 +28,7 @@
>>   #include <drm/drm_atomic_state_helper.h>
>>   #include <drm/drm_bridge.h>
>>   #include <drm/drm_encoder.h>
>> +#include <drm/drm_of.h>
>>   #include <drm/drm_print.h>
>>   
>>   #include "drm_crtc_internal.h"
>> @@ -51,10 +52,8 @@
>>    *
>>    * Display drivers are responsible for linking encoders with the first bridge
>>    * in the chains. This is done by acquiring the appropriate bridge with
>> - * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
>> - * panel with drm_panel_bridge_add_typed() (or the managed version
>> - * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall be
>> - * attached to the encoder with a call to drm_bridge_attach().
>> + * devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to the
>> + * encoder with a call to drm_bridge_attach().
>>    *
>>    * Bridges are responsible for linking themselves with the next bridge in the
>>    * chain, if any. This is done the same way as for encoders, with the call to
>> @@ -1233,6 +1232,41 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>>   	return NULL;
>>   }
>>   EXPORT_SYMBOL(of_drm_find_bridge);
>> +
>> +/**
>> + * devm_drm_of_get_bridge - Return next bridge in the chain
>> + * @dev: device to tie the bridge lifetime to
>> + * @np: device tree node containing encoder output ports
>> + * @port: port in the device tree node
>> + * @endpoint: endpoint in the device tree node
>> + *
>> + * Given a DT node's port and endpoint number, finds the connected node
>> + * and returns the associated bridge if any, or creates and returns a
>> + * drm panel bridge instance if a panel is connected.
>> + *
>> + * Returns a pointer to the bridge if successful, or an error pointer
>> + * otherwise.
>> + */
>> +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
>> +					  struct device_node *np,
>> +					  unsigned int port,
>> +					  unsigned int endpoint)
>> +{
>> +	struct drm_bridge *bridge;
>> +	struct drm_panel *panel;
>> +	int ret;
>> +
>> +	ret = drm_of_find_panel_or_bridge(np, port, endpoint,
>> +					  &panel, &bridge);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	if (panel)
>> +		bridge = devm_drm_panel_bridge_add(dev, panel);
>> +
>> +	return bridge;
> I really like the idea, I've wanted to do something like this for a long
> time. I however wonder if this is the best approach, or if we could get
> the panel core to register the bridge itself. The part that bothers me
> here is the assymetry in the lifetime of the bridges, the returned
> pointer is either looked up or allocated.


When drm_panel_bridge was proposed 1st time I suggested that instead of 
it we should just merge panels with bridges (maybe with new name, my 
favorite is drm_sink), but I was outvoted :)

Apparently with this patch we go to the same direction: since panels 
will be accessed only via drm_panel_bridge they will become actually 
bridges :) Somebody could then clean-up the whole intermediate code.


Regards

Andrzej


>
> Bridge lifetime is such a mess that it may not make a big difference,
> but eventually we'll have to address that problem globally.
>
>> +}
>> +EXPORT_SYMBOL(devm_drm_of_get_bridge);
>>   #endif
>>   
>>   MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
>> index 997b8827fed2..37c34146eea8 100644
>> --- a/drivers/gpu/drm/drm_of.c
>> +++ b/drivers/gpu/drm/drm_of.c
>> @@ -231,6 +231,9 @@ EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
>>    * return either the associated struct drm_panel or drm_bridge device. Either
>>    * @panel or @bridge must not be NULL.
>>    *
>> + * This function is deprecated and should not be used in new drivers. Use
>> + * devm_drm_of_get_bridge() instead.
>> + *
>>    * Returns zero if successful, or one of the standard error codes if it fails.
>>    */
>>   int drm_of_find_panel_or_bridge(const struct device_node *np,
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index 46bdfa48c413..f70c88ca96ef 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -911,6 +911,8 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
>>   struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>>   						   struct drm_panel *panel,
>>   						   u32 connector_type);
>> +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
>> +					unsigned int port, unsigned int endpoint);
>>   struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
>>   #endif
>>   
