Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BA42C2FDD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 19:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DC789A5E;
	Tue, 24 Nov 2020 18:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D6B89A5E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 18:19:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOIJngE032238;
 Tue, 24 Nov 2020 12:19:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606241989;
 bh=u6oXETzVtnUFg3QaOpLfvuLtcRUuRk3ixx3hVpaZu5U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=VuLCeO9LbjXHTXJMsnccInF2K0WlUMTd4wU+SL7XkXQMcjQAVknYjHyAoNMkFTKfd
 nqKFuJE4pXfCpyGkAxvULxvXyVw1DSBqUfaETh5/6nU+ta+zj6sNzgX27k6Fl4Uvoe
 0HjocrXwDln5+6XWx/H6RpN70Cp7jDYYvqSacKq0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOIJn0V047895
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 12:19:49 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 12:19:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 12:19:48 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOIJkRt109702;
 Tue, 24 Nov 2020 12:19:46 -0600
Subject: Re: [PATCH v4 60/80] drm/panel: panel-dsi-cm: set column & page at
 setup
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-61-tomi.valkeinen@ti.com>
 <20201124173041.GB56262@ravnborg.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8950293e-4d0e-41a9-4a0d-813f070593c6@ti.com>
Date: Tue, 24 Nov 2020 20:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124173041.GB56262@ravnborg.org>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/11/2020 19:30, Sam Ravnborg wrote:
> On Tue, Nov 24, 2020 at 02:45:18PM +0200, Tomi Valkeinen wrote:
>> Set the column & page address once during setup, instead of relying the
>> DSI host driver to set those.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> But one comment below.
> 
>> ---
>>  drivers/gpu/drm/panel/panel-dsi-cm.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
>> index 59e8e6b18e97..1e7f73340736 100644
>> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
>> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
>> @@ -171,6 +171,26 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
>>  	return 0;
>>  }
>>  
>> +static int dsicm_set_update_window(struct panel_drv_data *ddata)
>> +{
>> +	struct mipi_dsi_device *dsi = ddata->dsi;
>> +	int r;
>> +	u16 x1 = 0;
>> +	u16 x2 = ddata->mode.hdisplay - 1;
>> +	u16 y1 = 0;
>> +	u16 y2 = ddata->mode.vdisplay - 1;
> 
> It does not help the readability with the variables.
> 
> Using
> 
> 	r = mipi_dsi_dcs_set_column_address(dsi, 0, ddata->mode.hdisplay - 1);
> 
> would IMO be easier to parse.
> 
> Then the pointless assignment of x1 and y1 are dropped too.

I think I agree with you here, although the variables do make it clearer to the reader that the
parameters are x1 and x2, not x and w.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
