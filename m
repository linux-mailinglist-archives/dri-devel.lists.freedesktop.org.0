Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 333B02AB659
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6D689956;
	Mon,  9 Nov 2020 11:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365C789954
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:16:58 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9BGmPp000513;
 Mon, 9 Nov 2020 05:16:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604920608;
 bh=0wikF8xI6fvtG6MCBj8B+xXuomkCGzX4G5uZFqKMpMs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ho9txX1rBTbXko8bciaUgrkNysFWukxsXxVMBynJF83YEQRwo6ocacucvpk1/UNct
 7anHcpFADPLcxe4fzz22eZqGycXE73eL71ggb0Tl9UzSZiATIvEUALSw/N0g0ZznjD
 nhpwCS/mnP8xQ5BP5pB1IkMHHYqWsin2El2Lwows=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9BGlqr087973
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 05:16:47 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 05:16:47 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 05:16:47 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9BGjii128161;
 Mon, 9 Nov 2020 05:16:45 -0600
Subject: Re: [PATCH v3 15/56] drm/omap: dsi: request VC via mipi_dsi_attach
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-16-tomi.valkeinen@ti.com>
 <20201109084208.GL6029@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9c98fed4-ccde-1ced-830e-27779cd3633d@ti.com>
Date: Mon, 9 Nov 2020 13:16:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109084208.GL6029@pendragon.ideasonboard.com>
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

On 09/11/2020 10:42, Laurent Pinchart wrote:
> Hi Tomi and Sebastian,
> 
> Thank you for the patch.
> 
> On Thu, Nov 05, 2020 at 02:02:52PM +0200, Tomi Valkeinen wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> Drop custom request_vc/release_vc callbacks by using the
>> generic mipi_dsi_attach/mipi_dsi_detach functions.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 24 +++++---
>>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 61 ++++++++-----------
>>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  3 -
>>  3 files changed, 41 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> index ec36e62ddc3a..b1ca9b34ce17 100644
>> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> @@ -693,14 +693,6 @@ static int dsicm_connect(struct omap_dss_device *src,
>>  			 struct omap_dss_device *dst)
>>  {
>>  	struct panel_drv_data *ddata = to_panel_data(dst);
>> -	struct device *dev = &ddata->dsi->dev;
>> -	int r;
>> -
>> -	r = src->ops->dsi.request_vc(src, ddata->channel);
>> -	if (r) {
>> -		dev_err(dev, "failed to get virtual channel\n");
>> -		return r;
>> -	}
>>  
>>  	ddata->src = src;
>>  	return 0;
>> @@ -711,7 +703,6 @@ static void dsicm_disconnect(struct omap_dss_device *src,
>>  {
>>  	struct panel_drv_data *ddata = to_panel_data(dst);
>>  
>> -	src->ops->dsi.release_vc(src, ddata->channel);
>>  	ddata->src = NULL;
>>  }
>>  
>> @@ -1276,8 +1267,21 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>>  		goto err_bl;
>>  	}
>>  
>> +	dsi->lanes = 3;
>> +	dsi->format = MIPI_DSI_FMT_RGB888;
>> +	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
>> +			  MIPI_DSI_MODE_EOT_PACKET;
>> +	dsi->hs_rate = 300000000;
>> +	dsi->lp_rate = 10000000;
> 
> Should this change be explained in the commit message ?

I added:

To use mipi_dsi_attach() we need to fill in the mipi_dsi_device fields,
and some of these fields overlap with the fields in omap_dss_dsi_config.
In later patches the latter will get dropped.

>> +
>> +	r = mipi_dsi_attach(dsi);
>> +	if (r < 0)
>> +		goto err_dsi_attach;
>> +
>>  	return 0;
>>  
>> +err_dsi_attach:
>> +	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
>>  err_bl:
>>  	destroy_workqueue(ddata->workqueue);
>>  err_reg:
>> @@ -1294,6 +1298,8 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
>>  
>>  	dev_dbg(&dsi->dev, "remove\n");
>>  
>> +	mipi_dsi_detach(dsi);
>> +
>>  	omapdss_device_unregister(dssdev);
>>  
>>  	if (omapdss_device_is_enabled(dssdev))
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index d1187a8af37f..a16427f3bc23 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -349,7 +349,7 @@ struct dsi_data {
>>  
>>  	struct {
>>  		enum dsi_vc_source source;
>> -		struct omap_dss_device *dssdev;
>> +		struct mipi_dsi_device *dest;
> 
> How about naming this dsidev ?

Maybe, but... dsidev was used to refer to the DSI host not that long ago. While going through these
patches, I thought about renaming "dest", but then I decided that "dest" a new name and perhaps a
good one to have during this transition period.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
