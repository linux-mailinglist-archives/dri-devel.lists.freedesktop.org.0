Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E245167B00
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 11:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C6B6E270;
	Fri, 21 Feb 2020 10:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073846E270
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 10:43:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LAhW1o094026;
 Fri, 21 Feb 2020 04:43:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582281812;
 bh=AEQZl1stVNCyYiQ2uYf0+iWIzY42kDBnkpNU3d42SXQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=wNdjBGFCM8Ky8PtqwENmYr/oSgd194UBZVXt+MqEK9Ie47yDKpkS/z0OC5+rUzixP
 cECFlCe9Z4c0dTKflBxLDq2/ti6FCfSOT7a7k4o0WkTjNkD6+kf3kuCZISJhl1lmFf
 AcmDuodRcysxdOVR1NYaXg3x5VPkvK2IHPM2mrrg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LAhWdp014099
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 21 Feb 2020 04:43:32 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 04:43:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 04:43:31 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LAhTtK025236;
 Fri, 21 Feb 2020 04:43:30 -0600
Subject: Re: [PATCH 3/3] drm/panel: simple: fix osd070t1718_19ts sync drive
 edge
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-4-tomi.valkeinen@ti.com>
 <20191202130717.GI4929@pendragon.ideasonboard.com>
 <a9cf515c-dbdd-e70d-5a89-1211c1049d16@ti.com>
 <20200214213902.GA22233@ravnborg.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <b36c42ea-3162-7462-7a51-c7b63620404f@ti.com>
Date: Fri, 21 Feb 2020 12:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214213902.GA22233@ravnborg.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 14/02/2020 23:39, Sam Ravnborg wrote:
> Hi Tomi.
> 
> On Mon, Feb 10, 2020 at 10:15:33AM +0200, Tomi Valkeinen wrote:
>> Hi Thierry,
>>
>> On 02/12/2019 15:07, Laurent Pinchart wrote:
>>> Hi Tomi,
>>>
>>> Thank you for the patch.
>>>
>>> On Thu, Nov 14, 2019 at 11:39:50AM +0200, Tomi Valkeinen wrote:
>>>> The panel datasheet says that the panel samples at falling edge, but
>>>> does not say anything about h/v sync signals. Testing shows that if the
>>>> sync signals are driven on falling edge, the picture on the panel will
>>>> be slightly shifted right.
>>>>
>>>> Setting sync drive edge to the same as data drive edge fixes this issue.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>>
>>> I don't have access to the documentation, but this makes sense, so
>>>
>>> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>>> ---
>>>>    drivers/gpu/drm/panel/panel-simple.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>>>> index 5d487686d25c..0784536ae6af 100644
>>>> --- a/drivers/gpu/drm/panel/panel-simple.c
>>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>>>> @@ -2397,7 +2397,8 @@ static const struct panel_desc osddisplays_osd070t1718_19ts = {
>>>>    		.height = 91,
>>>>    	},
>>>>    	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>>>> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>>>> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
>>>> +		DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
>>>>    	.connector_type = DRM_MODE_CONNECTOR_DPI,
>>>>    };
>>
>> Can this be merged?
> 
> I have lost the original mail.
> Can you re-send or provide a patchwork pointer or similar.
> Then I will apply.

Here are lore and patchwork links. Note that the first two patches in the series have already been handled.

https://lore.kernel.org/dri-devel/20191114093950.rT5m86Xh0-a9FZGq7JipQ3O3vldctJYcvRdhxUMGBVE@z/#t

https://patchwork.freedesktop.org/series/69459/

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
