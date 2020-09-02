Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E460B25B1F6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 18:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CA36E4DE;
	Wed,  2 Sep 2020 16:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DF16E936
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 16:48:39 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200902164838euoutp020b8e4e4f1159643d13d8ed543766959d~xBW9IGZrY2875628756euoutp02z
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 16:48:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200902164838euoutp020b8e4e4f1159643d13d8ed543766959d~xBW9IGZrY2875628756euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599065318;
 bh=bl8UBhj/kn2mKNDhz4ITEK82bDvTZE2Im/t+jg9aKCI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=u805GjCkm12NQu0mZaNfvZXPkM8F+7L9q4PFRj7OmYw/7jAEr6n3k+618DZBTWF3s
 hjqPsOMOBFLZuPqFhwfBz0nXYBA3DzXNOYV8YM0JG5a0hgWr6Hw/Lxl543Eh/rvcuZ
 1AfjUImKftV2dkEXtq5wjxXvAGWBb1Aj/ceeL1Fw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200902164837eucas1p1cddeef951b0cff09d35ff58b9bb038db~xBW8V69p53073530735eucas1p1a;
 Wed,  2 Sep 2020 16:48:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 18.93.06318.5ECCF4F5; Wed,  2
 Sep 2020 17:48:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200902164836eucas1p24b4453049a906b0047c256cb789d8e3e~xBW7rHOj32723827238eucas1p2G;
 Wed,  2 Sep 2020 16:48:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200902164836eusmtrp1074393d089687307eff97cfd86b0ccde~xBW7qM2HR0932209322eusmtrp1Y;
 Wed,  2 Sep 2020 16:48:36 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-20-5f4fcce5a6dc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 81.A5.06314.4ECCF4F5; Wed,  2
 Sep 2020 17:48:36 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200902164835eusmtip17cba81138d5abcaff180c18bac6bb3ff~xBW68IZZf0423804238eusmtip1Z;
 Wed,  2 Sep 2020 16:48:35 +0000 (GMT)
Subject: Re: [PATCH v4 03/15] drm/bridge: tc358764: drop
 drm_connector_(un)register
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <224526db-6c43-b37c-a5d9-d53d95e227f1@samsung.com>
Date: Wed, 2 Sep 2020 18:48:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200726203324.3722593-4-sam@ravnborg.org>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTYRD27263S7VkKRAmSGKs+oAJV+BhjQYVfFgTA774ohGssgEily1F
 OdRaQcuNQkSqERWU04DcVziq4SoQRAiIQgMREaQpAoWgotIuRt6++b6Z+eZLhsTEY3xHMjQi
 mpVFSMMkhBCv61wfcJnp8w90f9hsSw+bjAQ9sjaH0T0LIzidfK9QQM/fnibo8k5rWveyAqO1
 GefoVUMyoovXaxG93vQEP7aTMY4lCZiN2VGcSV3WYkyjZkLAPFLn8ZmCljke0501xGP0qV08
 pvDBCMG0p2fjp4VnhUeC2LDQGFbm5n1BGKKb6caiXlPXHqrnCSXqFqUgKxIoL9COJ6MUJCTF
 VDGCHlXLVrGCYHFcy+OKZQR/ZuvRv5G5vnyCE4oQlDwpw7nCiGDtZabA3GVLnYGy2W98M7aj
 EmDyXZ5lL0YN8aDhbRPPLBCUM2xUfyDMWER5Q29LncUCp/bDz55lC7anAqCzdxrnemygJ++z
 BVtRNNTkTlvMMGoP1BseYxx2ANVKCd9sBpRJAJk5SgF39wkwdjZuZbCF+a6aLd4JdNlpOIdv
 gr44EeOG1QhqKxsxTjgMnwZ+bF5Kbjo4Q0WTG0cfB1V7F99MA2UNYwYb7gZruF+Xi3G0CNR3
 xFz3XtD3124tdIAXgyYiC0k025JptqXRbEuj+e/7FOGlyIFVyMODWblnBHvVVS4Nlysigl0v
 RYZXoc1/0/3uMjWg1l8XtYgikWSXqLvWP1DMl8bIY8O1CEhMYify6dcFiEVB0tg4VhYZKFOE
 sXIt2k3iEgeR5/O582IqWBrNXmbZKFb2T+WRVo5KVH6LtVszxp5dVA7F7fPNVTa3fgzJ2Fuu
 um54s6SvcRo+oDgU3Tvle+Powvc9jw3p8ZMrVYOqKff1JjzHwzhQipWstiWdGm2rr8xT6It2
 pKUuJY52xFT4nazsOGD/JSGu2MvvvW9BTf5XdW5ffgCfrY7PHrzyinyWrb47YXLJSfGR4PIQ
 qcdBTCaX/gUPy9UcawMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsVy+t/xu7pPzvjHGxzdr2Rx5et7Nour318y
 W5x8c5XFonPiEnaLV82P2CzWHOOzOL1sPbPFob5oi29vOxktVvzcymjxc9c8Fgduj/c3Wtk9
 /j6/zuLR/fkQs8fOWXfZPWZ3zGT1WLznJZPHiQmXmDzudx9n8lgy7Sqbx4HeySwBXFF6NkX5
 pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GaefnmAu2ChQ
 MaPjFVsD4wneLkZODgkBE4mXZ+azdTFycQgJLGWU2DRnOTtEQlxi9/y3zBC2sMSfa11QRW8Z
 JS4d/g+WEBYIlVj9/DUriC0iUCPx9vNWZpAiZoErTBJ3L01lhujYySixcON1sLFsApoSfzff
 ZAOxeQXsJE7t2cYIYrMIqEj8PvkZzBYViJM40/MCqkZQ4uTMJywgNqeAhcSW6Y/A5jALmEnM
 2/yQGcKWl9j+dg6ULS7R9GUl6wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLDfWKE3OL
 S/PS9ZLzczcxAiN627Gfm3cwXtoYfIhRgINRiYf3xFb/eCHWxLLiytxDjBIczEoivE5nT8cJ
 8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4w2eSVxBuaGppbWBqaG5sbm1koifN2CByMERJI
 TyxJzU5NLUgtgulj4uCUamBs8rwhpL12e5K+wFTxC6vmBUwJ032WxHH9xK3TOdM5FOsCfrKy
 fS/pnvfp1+TZ9SfsHrGz7N/eE5rhsvzORt2LO288cRSI8S498Ec4g31r/yurbre7Tv/upL+Z
 cMhxdsDMdzd3PCj7WM8zhdGkmPXjVY/btoJRBdtk33pJTNVYp5Pxq1xkxuI9SizFGYmGWsxF
 xYkAcQgNH/4CAAA=
X-CMS-MailID: 20200902164836eucas1p24b4453049a906b0047c256cb789d8e3e
X-Msg-Generator: CA
X-RootMTR: 20200726203355eucas1p2808ffd795badd5bec56363948fe8b6ed
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200726203355eucas1p2808ffd795badd5bec56363948fe8b6ed
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <CGME20200726203355eucas1p2808ffd795badd5bec56363948fe8b6ed@eucas1p2.samsung.com>
 <20200726203324.3722593-4-sam@ravnborg.org>
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
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 26.07.2020 22:33, Sam Ravnborg wrote:
> Drop drm_connector handling that is not needed:
>
> - drm_dev_register() in the display controller driver takes
>    care of registering connectors.
>    So the call to drm_connector_register() call is not needed in the bridge
>    driver.
>
> - Use of drm_connector_unregister() is only required for drivers that
>    explicit have called drm_dev_register.
>
> - The reference counting using drm_connector_put() is likewise not needed.


All three statements above are true in case of statically allocated 
connectors.

Here the connector is allocated dynamically, so it must be 
registered/deregistered by the driver itself.


Regards

Andrzej


>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>   drivers/gpu/drm/bridge/tc358764.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> index 5ac1430fab04..a277739fab58 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -375,7 +375,6 @@ static int tc358764_attach(struct drm_bridge *bridge,
>   	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
>   	drm_panel_attach(ctx->panel, &ctx->connector);
>   	ctx->connector.funcs->reset(&ctx->connector);
> -	drm_connector_register(&ctx->connector);
>   	return 0;
>   }
> @@ -384,10 +383,8 @@ static void tc358764_detach(struct drm_bridge *bridge)
>   {
>   	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>   
> -	drm_connector_unregister(&ctx->connector);
>   	drm_panel_detach(ctx->panel);
>   	ctx->panel = NULL;
> -	drm_connector_put(&ctx->connector);
>   }
>   
>   static const struct drm_bridge_funcs tc358764_bridge_funcs = {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
