Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807742AF07A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 13:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432C889FCE;
	Wed, 11 Nov 2020 12:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F3489FCE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 12:25:05 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABCOsG2028371;
 Wed, 11 Nov 2020 06:24:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605097494;
 bh=ASRNOHEr+40d5rkM1LJeMOpcnajdXscG/sSMLjTfjaI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=IDdQ2BBMA/qN6g4E9HfC28P7lvtfRNCNnexrq0afR+KkEhh90/u7Ze+OvcDsy4yM9
 uNgtd68UdAIoU55kEoqaM+NpTMJW6sYzfmZ6ygeEzVcSQ5+p6aAoHq93xCPn4ju/cE
 41mZQQ76flik9Sqjn4+PNveYKkhnzKs4g6L/TJJo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABCOsY9083391
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 06:24:54 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 06:24:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 06:24:54 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABCOpE6056538;
 Wed, 11 Nov 2020 06:24:52 -0600
Subject: Re: [PATCH v3 50/56] drm/omap: dsi: simplify pin config
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-51-tomi.valkeinen@ti.com>
 <20201109110932.GU6029@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ba48d022-eecc-1f28-9ade-8a427d714b42@ti.com>
Date: Wed, 11 Nov 2020 14:24:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109110932.GU6029@pendragon.ideasonboard.com>
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

On 09/11/2020 13:09, Laurent Pinchart wrote:
> Hi Tomi and Sebastian,
> 
> Thank you for the patch.
> 
> On Thu, Nov 05, 2020 at 02:03:27PM +0200, Tomi Valkeinen wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> Simplify DSI pin config, which always originates from DT
>> nowadays. With the code being fully contained in the DSI
>> encoder, we can drop the public structure.
>>
>> Since the function is no longer exposed, it now directly
>> takes the private DSI data pointer. This drop a pointless
> 
> s/drop/drops/
> 
>> conversion and means the pins can be configured earlier.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 33 +++++++++------------------
>>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 15 ------------
>>  2 files changed, 11 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index f47d7e3bb631..76e4f607d8cf 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -3568,12 +3568,9 @@ static void dsi_proto_timings(struct dsi_data *dsi)
>>  	}
>>  }
>>  
>> -static int dsi_configure_pins(struct omap_dss_device *dssdev,
>> -		const struct omap_dsi_pin_config *pin_cfg)
>> +static int dsi_configure_pins(struct dsi_data *dsi,
>> +		int num_pins, const u32 *pins)
>>  {
>> -	struct dsi_data *dsi = to_dsi_data(dssdev);
>> -	int num_pins;
>> -	const int *pins;
>>  	struct dsi_lane_config lanes[DSI_MAX_NR_LANES];
>>  	int num_lanes;
>>  	int i;
>> @@ -3586,9 +3583,6 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
>>  		DSI_LANE_DATA4,
>>  	};
>>  
>> -	num_pins = pin_cfg->num_pins;
>> -	pins = pin_cfg->pins;
>> -
>>  	if (num_pins < 4 || num_pins > dsi->num_lanes_supported * 2
>>  			|| num_pins % 2 != 0)
>>  		return -EINVAL;
>> @@ -3600,7 +3594,7 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
>>  
>>  	for (i = 0; i < num_pins; i += 2) {
>>  		u8 lane, pol;
>> -		int dx, dy;
>> +		u32 dx, dy;
> 
> Is this change needed ?

The pins array is now u32, so the above is correct. However, a bit below we check if dx < 0, which
doesn't make sense anymore, so I'll drop that check.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
