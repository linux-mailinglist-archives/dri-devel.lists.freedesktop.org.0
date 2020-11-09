Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F1C2AB24F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE8D89339;
	Mon,  9 Nov 2020 08:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF28289339
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:20:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A98KA7i041533;
 Mon, 9 Nov 2020 02:20:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604910010;
 bh=9DVEbiZewaOVjXQFfj+2Ci+gwiTUpJGts+1rhtSb9p0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=eywi2w0VEC3QBO/GL+iiFPM+mYG1r6TheAhl+DUYE6WY07/60LFlUSq/T1OqGhSkn
 8+PaLczgoFAmGClf6WF5Ji9E0bV7yFb7qfJM67uyv7x6WmD4dqnMnws/2/N1oph8cz
 rs6J6pmo+Ecz7F2gcl92FTsaqo9QQzmPaV9lx1k8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A98KAv4080936
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 02:20:10 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 02:20:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 02:20:10 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A98K8L6059388;
 Mon, 9 Nov 2020 02:20:08 -0600
Subject: Re: [PATCH v3 09/56] drm/omap: dsi: drop virtual channel logic
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-10-tomi.valkeinen@ti.com>
 <20201109081450.GE6029@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <34e04d90-af9a-1482-4761-3cd633d132fe@ti.com>
Date: Mon, 9 Nov 2020 10:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109081450.GE6029@pendragon.ideasonboard.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2020 10:14, Laurent Pinchart wrote:
> Hi Tomi and Sebastian,
> 
> Thank you for the patch.
> 
> On Thu, Nov 05, 2020 at 02:02:46PM +0200, Tomi Valkeinen wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> This drops the virtual channel logic. Afterwards DSI clients
>> request their channel number and get the virtual channel with
>> the same number or -EBUSY if already in use.
> 
> It could be useful to explain the reason for this patch (which, if I
> understand the patch correctly, is to replace dynamic allocation of
> virtual channels with a fixed allocation by the DSI panel, I assume
> because dynamic allocation isn't actually useful ?).

Yes, I can elaborate on that in v4. I also just sent a separate mail about it.

>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 11 ++---
>>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 46 ++++---------------
>>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 +-
>>  3 files changed, 12 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> index 8b2e80129bd8..ea76a89d1833 100644
>> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> @@ -768,19 +768,12 @@ static int dsicm_connect(struct omap_dss_device *src,
>>  	struct device *dev = &ddata->pdev->dev;
>>  	int r;
>>  
>> -	r = src->ops->dsi.request_vc(src, &ddata->channel);
>> +	r = src->ops->dsi.request_vc(src, ddata->channel);
>>  	if (r) {
>>  		dev_err(dev, "failed to get virtual channel\n");
>>  		return r;
>>  	}
>>  
>> -	r = src->ops->dsi.set_vc_id(src, ddata->channel, TCH);
>> -	if (r) {
>> -		dev_err(dev, "failed to set VC_ID\n");
>> -		src->ops->dsi.release_vc(src, ddata->channel);
>> -		return r;
>> -	}
>> -
>>  	ddata->src = src;
>>  	return 0;
>>  }
>> @@ -1215,6 +1208,8 @@ static int dsicm_probe_of(struct platform_device *pdev)
>>  	struct display_timing timing;
>>  	int err;
>>  
>> +	ddata->channel = TCH;
> 
> I'd drop the macro, but no big deal.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

It's dropped in a later patch.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
