Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501825C472
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 17:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6696E090;
	Thu,  3 Sep 2020 15:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10C36E090
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 15:10:55 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200903151053euoutp01677a69694f474fde5dcdc6e440836023~xTq52hlUJ2109121091euoutp01o
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 15:10:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200903151053euoutp01677a69694f474fde5dcdc6e440836023~xTq52hlUJ2109121091euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599145853;
 bh=orucg+jeJjOHz+OYxTUlFUgM2xvI9APjaGmUc8IrmH8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=oni5gn4MoRB8hDbe3czDrHIHP5E0RgJ0VFKzAiDHZyjYfIIq1SPQ/KeB38wHrbVhv
 edjJmlqQiu/wJ99B3CW147MTF5Jrj46kVV0XY0JsDoezdCsNaiAawAGyXYy8Tv1Obi
 KAG1rwnwEZIzruZVBqY3IyGF8dHjYiIHMy1T6gB8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200903151053eucas1p1fd12fdadf29a9c453e7372efb4238836~xTq5ppw9E1515715157eucas1p1a;
 Thu,  3 Sep 2020 15:10:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 35.6A.05997.D77015F5; Thu,  3
 Sep 2020 16:10:53 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200903151053eucas1p21c64ead2b5b94468f878cf396f77d7a5~xTq5VI9AJ0282302823eucas1p2V;
 Thu,  3 Sep 2020 15:10:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200903151053eusmtrp24579849d323c89bbaa99c0a8fce696e7~xTq5Ud81T2887828878eusmtrp27;
 Thu,  3 Sep 2020 15:10:53 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-cf-5f51077dd34f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 7D.8A.06017.D77015F5; Thu,  3
 Sep 2020 16:10:53 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200903151052eusmtip25ea4307022baa9504a8ab65bd99d68b3~xTq4vNIad0444404444eusmtip2e;
 Thu,  3 Sep 2020 15:10:52 +0000 (GMT)
Subject: Re: [PATCH v4 04/15] drm/bridge: tc358764: add drm_panel_bridge
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <8274fd56-0046-912f-46ff-078f59d1c6ff@samsung.com>
Date: Thu, 3 Sep 2020 17:10:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903095932.GC6492@pendragon.ideasonboard.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTYRTGe3fv7uZ0cl3KTiVFIyKDtFLi0qeF0Y2E7IP+MHRNvWjkpuw2
 TTMyrfy2ZaG1IsWsLFIrdeWKilXOD0wRLUtTUyO2GivcEr8yt6vkf7/znOe85znwCjHJB/5S
 4XHVSUatUsTLCBGubxxvX3dGcEC+vqJgDdXlsBFU95gZo5p/duNUzuUKAWXJHCKoh42eVOvd
 GowyFh6l/lhzEFU5Xo+occMtPNidtvVcENDT3z/idN6oEaMbdF8E9I3s63z69gszj27SdvLo
 gTwTj64o7ibo1wVX8DBRuGhrDBN/PIlRB2w/Joqb1A/jidX7T2nNhXg6uhWci9yEQAbBRPcM
 4WQJWYngceamXCSaZTuC/pJJgitGEVwdvEnMT7RfKse5xj0EnS/fIK6wIaj6lcl3uhaTB8Hx
 tsU14U1SUFBe4jJhZDEGWcZXyNkgSD+Yrv3kMonJ7dCuL3fpOLkKJjKmXOxDRkJjyxDOebyg
 +fqIi93IHZA11Iw5GSNXwFPrzTmWQob9Pp+L6hBAm2UPxyGQ12XFOF4MFlOdgGNfmGko5XF8
 FgYqz2POoEBmI6h/1DA3sAX63k/MBhXOLvCDGkMAJ+8Eq72X55SB9IQeqxcXwROK9CUYJ4sh
 +6KEc6+Egbb6uQelcKfDQWiRTLfgMN2CY3QLjtH931uG8AdIymhYZSzDblQxyf6sQslqVLH+
 0QnKJ2j2t7X+NdmfIcNUlBGRQiTzEPfYwuQSviKJTVEaEQgxmbd4V1trpEQco0hJZdQJcrUm
 nmGNaJkQl0nFgeXmCAkZqzjJnGCYREY93+UJ3Zamo4OO4OTqwJE0Q7RkUX74cJBUzg7WpjS6
 u+9T9n/L8OidTvBAqYKMxG2n7bVFRFmuuqtjamY8NES822v586aAoFFjrUYlE9NnPsste5vf
 7IjIWRKaX7qsKv33zk+Eh/ZH3W2NuvBITW/ahqS+r77nsLFrhySHmc2rGxKi3oX7mBgZzsYp
 NqzF1KziH7g6WIBpAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsVy+t/xe7q17IHxBivPC1lc+fqezeLq95fM
 FiffXGWx6Jy4hN3iVfMjNos1x/gsTi9bz2xxqC/a4tvbTkaLFT+3Mlr83DWPxYHb4/2NVnaP
 v8+vs3h0fz7E7LFz1l12j9kdM1k9Fu95yeRxYsIlJo/73ceZPJZMu8rmcaB3MksAV5SeTVF+
 aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexu9tj1kK1vlX
 THjZx9LAOM+hi5GTQ0LAROJ8/yKWLkYuDiGBpYwSW879YYdIiEvsnv+WGcIWlvhzrYsNougt
 o0Tz2iYmkISwQJDE1yOn2EBsEQELid5F0xlBipgFZjBL/N53gRWiYzGTxNazCxlBqtgENCX+
 br4J1sErYCdxftsisDiLgIrEr6Y/YLaoQJzEmZ4XUDWCEidnPmEBsTkF7CXaH50EO4lZwExi
 3uaHULa8xPa3c6BscYmmLytZJzAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtc
 mpeul5yfu4kRGNHbjv3csoOx613wIUYBDkYlHt4b7wPihVgTy4orcw8xSnAwK4nwOp09HSfE
 m5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cBkk1cSb2hqaG5haWhubG5sZqEkztshcDBGSCA9
 sSQ1OzW1ILUIpo+Jg1OqgVFc/PRshT//Vu1XlOL5v8Xx+LvjnrP1jUqjTb+lvdbrOLLJKVsw
 Xb90Tfexg/N2cjypEIyZzKIaMa1+teqFDomn+kyvFHlePzD575Nm6R3zivNLo6xZpKdf1ISE
 uscFti7PTf5qflqst/tY6e9v5dEPHl21P3PM8OyRMyc2d61jyxNqnMHBY63EUpyRaKjFXFSc
 CACCiLCj/gIAAA==
X-CMS-MailID: 20200903151053eucas1p21c64ead2b5b94468f878cf396f77d7a5
X-Msg-Generator: CA
X-RootMTR: 20200726203348eucas1p19db397b6847501d17de6ae168813c9d8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200726203348eucas1p19db397b6847501d17de6ae168813c9d8
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <CGME20200726203348eucas1p19db397b6847501d17de6ae168813c9d8@eucas1p1.samsung.com>
 <20200726203324.3722593-5-sam@ravnborg.org>
 <cebb8200-db9e-5c3f-6808-f4e8068e4eeb@samsung.com>
 <20200903095932.GC6492@pendragon.ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>, Sam Ravnborg <sam@ravnborg.org>,
 kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 03.09.2020 11:59, Laurent Pinchart wrote:
> Hi Andrzej,
>
> On Thu, Sep 03, 2020 at 11:40:58AM +0200, Andrzej Hajda wrote:
>> On 26.07.2020 22:33, Sam Ravnborg wrote:
>>> Prepare the tc358764 bridge driver for use in a chained setup by
>>> replacing direct use of drm_panel with drm_panel_bridge support.
>>>
>>> The bridge panel will use the connector type reported by the panel,
>>> where the connector for this driver hardcodes DRM_MODE_CONNECTOR_LVDS.
>>>
>>> The tc358764 did not any additional info the the connector so the
>>> connector creation is passed to the bridge panel driver.
>>>
>>> v3:
>>>     - Merge with patch to make connector creation optional to avoid
>>>       creating two connectors (Laurent)
>>>     - Pass connector creation to bridge panel, as this bridge driver
>>>       did not add any extra info to the connector.
>>>     - Set bridge.type to DRM_MODE_CONNECTOR_LVDS.
>>>
>>> v2:
>>>     - Use PTR_ERR_OR_ZERO() (kbuild test robot)
>>>
>>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Cc: kbuild test robot <lkp@intel.com>
>>> Cc: Andrzej Hajda <a.hajda@samsung.com>
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
>>> ---
>>>    drivers/gpu/drm/bridge/tc358764.c | 107 +++++-------------------------
>>>    1 file changed, 16 insertions(+), 91 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
>>> index a277739fab58..fdde4cfdc724 100644
>>> --- a/drivers/gpu/drm/bridge/tc358764.c
>>> +++ b/drivers/gpu/drm/bridge/tc358764.c
>>> @@ -153,10 +153,9 @@ static const char * const tc358764_supplies[] = {
>>>    struct tc358764 {
>>>    	struct device *dev;
>>>    	struct drm_bridge bridge;
>>> -	struct drm_connector connector;
>>>    	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
>>>    	struct gpio_desc *gpio_reset;
>>> -	struct drm_panel *panel;
>>> +	struct drm_bridge *panel_bridge;
>>>    	int error;
>>>    };
>>>    
>>> @@ -210,12 +209,6 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
>>>    	return container_of(bridge, struct tc358764, bridge);
>>>    }
>>>    
>>> -static inline
>>> -struct tc358764 *connector_to_tc358764(struct drm_connector *connector)
>>> -{
>>> -	return container_of(connector, struct tc358764, connector);
>>> -}
>>> -
>>>    static int tc358764_init(struct tc358764 *ctx)
>>>    {
>>>    	u32 v = 0;
>>> @@ -278,43 +271,11 @@ static void tc358764_reset(struct tc358764 *ctx)
>>>    	usleep_range(1000, 2000);
>>>    }
>>>    
>>> -static int tc358764_get_modes(struct drm_connector *connector)
>>> -{
>>> -	struct tc358764 *ctx = connector_to_tc358764(connector);
>>> -
>>> -	return drm_panel_get_modes(ctx->panel, connector);
>>> -}
>>> -
>>> -static const
>>> -struct drm_connector_helper_funcs tc358764_connector_helper_funcs = {
>>> -	.get_modes = tc358764_get_modes,
>>> -};
>>> -
>>> -static const struct drm_connector_funcs tc358764_connector_funcs = {
>>> -	.fill_modes = drm_helper_probe_single_connector_modes,
>>> -	.destroy = drm_connector_cleanup,
>>> -	.reset = drm_atomic_helper_connector_reset,
>>> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>> -};
>>> -
>>> -static void tc358764_disable(struct drm_bridge *bridge)
>>> -{
>>> -	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>>> -	int ret = drm_panel_disable(bridge_to_tc358764(bridge)->panel);
>>> -
>>> -	if (ret < 0)
>>> -		dev_err(ctx->dev, "error disabling panel (%d)\n", ret);
>>> -}
>>> -
>>>    static void tc358764_post_disable(struct drm_bridge *bridge)
>>>    {
>>>    	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>>>    	int ret;
>>>    
>>> -	ret = drm_panel_unprepare(ctx->panel);
>>> -	if (ret < 0)
>>> -		dev_err(ctx->dev, "error unpreparing panel (%d)\n", ret);
>>
>> Using this bridge_panel thing you reverse order of hw
>> initialization/de-initialization, this is incorrect.
>>
>> For example:
>>
>> - panel_unprepare should be called before tc35* turn off,
>>
>> - panel_prepare should be called after tc35* on.
>>
>> This is why I avoid the whole "bridge chaining" - it enforces ridiculous
>> order of initialization.
>>
>>
>>>    	tc358764_reset(ctx);
>>>    	usleep_range(10000, 15000);
>>>    	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>> @@ -335,70 +296,28 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
>>>    	ret = tc358764_init(ctx);
>>>    	if (ret < 0)
>>>    		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
>>> -	ret = drm_panel_prepare(ctx->panel);
>>> -	if (ret < 0)
>>> -		dev_err(ctx->dev, "error preparing panel (%d)\n", ret);
>>> -}
>>> -
>>> -static void tc358764_enable(struct drm_bridge *bridge)
>>> -{
>>> -	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>>> -	int ret = drm_panel_enable(ctx->panel);
>>> -
>>> -	if (ret < 0)
>>> -		dev_err(ctx->dev, "error enabling panel (%d)\n", ret);
>>>    }
>>>    
>>>    static int tc358764_attach(struct drm_bridge *bridge,
>>>    			   enum drm_bridge_attach_flags flags)
>>> -{
>>> -	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>>> -	struct drm_device *drm = bridge->dev;
>>> -	int ret;
>>> -
>>> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>>> -		DRM_ERROR("Fix bridge driver to make connector optional!");
>>> -		return -EINVAL;
>>> -	}
>>> -
>>> -	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
>>> -	ret = drm_connector_init(drm, &ctx->connector,
>>> -				 &tc358764_connector_funcs,
>>> -				 DRM_MODE_CONNECTOR_LVDS);
>>> -	if (ret) {
>>> -		DRM_ERROR("Failed to initialize connector\n");
>>> -		return ret;
>>> -	}
>>> -
>>> -	drm_connector_helper_add(&ctx->connector,
>>> -				 &tc358764_connector_helper_funcs);
>>> -	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
>>> -	drm_panel_attach(ctx->panel, &ctx->connector);
>>> -	ctx->connector.funcs->reset(&ctx->connector);
>>
>> I guess lack of calling .reset here is direct cause of WARN reported by
>> Marek.
>>
>>
>> Summarizing my findings:
>>
>> 1. drm_panel_bridge does not fit to this scenario - it relays on 'bridge
>> chaining" which has crazy assumption that order of hw initalization in
>> the display chain follows the same fixed order of calls for all hw.
> This would need to be addressed in the bridge core. I don't want to go
> back to manual chaining of operations, that opens the door to creating
> incompatibilities between bridges and display controllers. The pre/post
> enable/disable operations probably need to be better defined, and if a
> sink requires a smaller granularity, then new operations need to be
> added.


Bigger granularity of operations is source of incompatibilities. We have 
already multiple issues with only two operations - pre_enable, 
post_enable, developers are confused what put where, especially if they 
can test bridge driver only with only fixed chain determined by the 
platform they are working on.

Adding new operations will make things worse. On the other hand explicit 
calling ops of downstream device has following advantages:

- we see explicitly how the bridge and its sink is initialized, it is 
even easier to compare it with docs,

- in case the stream is split or duplicated to two or more sinks, and/or 
eventually joined then later, it is much easier and straightforward to 
program it with explicit ops. With bridge chaining it is impossible 
without workarounds - all the cases with dual DSI etc.


Regards

Andrzej


>> 2. tc35* bridge allocates/deallocates connector dynamically - to safely
>> handle drivers load/unload, and to avoid multiple deferred probe issues
>> , drm_panel_bridge does not support it.
>>
>> This and previous patch violates both points.
>>
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -static void tc358764_detach(struct drm_bridge *bridge)
>>>    {
>>>    	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>>>    
>>> -	drm_panel_detach(ctx->panel);
>>> -	ctx->panel = NULL;
>>> +	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
>>> +				 bridge, flags);
>>>    }
>>>    
>>>    static const struct drm_bridge_funcs tc358764_bridge_funcs = {
>>> -	.disable = tc358764_disable,
>>>    	.post_disable = tc358764_post_disable,
>>> -	.enable = tc358764_enable,
>>>    	.pre_enable = tc358764_pre_enable,
>>>    	.attach = tc358764_attach,
>>> -	.detach = tc358764_detach,
>>>    };
>>>    
>>>    static int tc358764_parse_dt(struct tc358764 *ctx)
>>>    {
>>> +	struct drm_bridge *panel_bridge;
>>>    	struct device *dev = ctx->dev;
>>> +	struct drm_panel *panel;
>>>    	int ret;
>>>    
>>>    	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>>> @@ -407,12 +326,17 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
>>>    		return PTR_ERR(ctx->gpio_reset);
>>>    	}
>>>    
>>> -	ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
>>> -					  NULL);
>>> -	if (ret && ret != -EPROBE_DEFER)
>>> -		dev_err(dev, "cannot find panel (%d)\n", ret);
>>> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
>>> +	if (ret)
>>> +		return ret;
>>>    
>>> -	return ret;
>>> +	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
>>> +
>>> +	if (IS_ERR(panel_bridge))
>>> +		return PTR_ERR(panel_bridge);
>>> +
>>> +	ctx->panel_bridge = panel_bridge;
>>> +	return 0;
>>>    }
>>>    
>>>    static int tc358764_configure_regulators(struct tc358764 *ctx)
>>> @@ -458,6 +382,7 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
>>>    		return ret;
>>>    
>>>    	ctx->bridge.funcs = &tc358764_bridge_funcs;
>>> +	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
>>>    	ctx->bridge.of_node = dev->of_node;
>>>    
>>>    	drm_bridge_add(&ctx->bridge);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
