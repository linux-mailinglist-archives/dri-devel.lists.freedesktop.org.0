Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3C20EF69
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEED89C9B;
	Tue, 30 Jun 2020 07:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1199 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jun 2020 11:37:43 UTC
Received: from pmg01-out2.zxcs.nl (pmg01-out2.zxcs.nl [185.104.28.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CA36E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:37:43 +0000 (UTC)
Received: from pmg01.zxcs.nl (localhost.localdomain [127.0.0.1])
 by pmg01.zxcs.nl (Zxcs) with ESMTP id BE0761035FD;
 Mon, 29 Jun 2020 12:59:04 +0200 (CEST)
Received: from web0081.zxcs.nl (web0081.zxcs.nl [IPv6:2a06:2ec0:1::81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pmg01.zxcs.nl (Zxcs) with ESMTPS;
 Mon, 29 Jun 2020 12:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID
 :References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BeEd1bjgVqI+6WM8IxHn3yBv6gBN5vUlSzEvbSv2GPY=; b=yMmYS8VgDQ27kiSVRfsNHb29iE
 LPmdLaagH+bhjYa54+X3DMcJw/nqLZV5COm0Da2zOkefygoaxdrpUEvEHZmBtFVSzEFG9x1NIuXin
 I1E5JmsDND6n2nkV9HZuv+1p5MFjUc+FoJDbKytPhTvY0MRa2F7TDed2QfZrlyxmEPFezW39If8ZR
 llTMADSiNPRmBiZ72ZBx/mxD1WsEvyqYe2WHWTx83dzz1qTw7J73QFk0CDdeDSqELEzDMvAGMy+OK
 9/A/IOH366nZ3vtIYr10sHMVvuSCsLkY1HJ6TRYo0Gx2ZTuUb633j1zBZovb0Pz192M3r0YlsTIN3
 zIejNerg==;
Received: from spamrelay.zxcs.nl ([185.104.28.12]:48016
 helo=mail-slave02.zxcs.nl)
 by web0081.zxcs.nl with esmtp (Exim 4.93.0.4)
 (envelope-from <dev@pascalroeleven.nl>)
 id 1jprV9-004AMs-6x; Mon, 29 Jun 2020 12:59:03 +0200
MIME-Version: 1.0
Date: Mon, 29 Jun 2020 12:59:02 +0200
From: Pascal Roeleven <dev@pascalroeleven.nl>
To: laurent.pinchart@ideasonboard.com
Subject: Re: [linux-sunxi] Re: [PATCH v2 2/5] drm: panel: Add Starry KR070PE2T
In-Reply-To: <20200628072819.GB8391@pendragon.ideasonboard.com>
References: <20200320112205.7100-1-dev@pascalroeleven.nl>
 <20200320112205.7100-3-dev@pascalroeleven.nl>
 <20200628072819.GB8391@pendragon.ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.6
Message-ID: <d43b324fa26638c179650e3c52adbf32@pascalroeleven.nl>
X-Sender: dev@pascalroeleven.nl
X-AuthUser: 
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:53 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Good catch. It's actually the connector type which is wrong. The 
connector_type should be DRM_MODE_CONNECTOR_DPI. If you would include 
this in your patch series, you can have my acked-by.

Regards,
Pascal

On 2020-06-28 09:28, Laurent Pinchart wrote:
> Hi Pascal,
> 
> On Fri, Mar 20, 2020 at 12:21:33PM +0100, Pascal Roeleven wrote:
>> The KR070PE2T is a 7" panel with a resolution of 800x480.
>> 
>> KR070PE2T is the marking present on the ribbon cable. As this panel is
>> probably available under different brands, this marking will catch
>> most devices.
>> 
>> As I can't find a datasheet for this panel, the bus_flags are instead
>> from trial-and-error. The flags seem to be common for these kind of
>> panels as well.
>> 
>> Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
>> ---
>>  drivers/gpu/drm/panel/panel-simple.c | 29 
>> ++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c 
>> b/drivers/gpu/drm/panel/panel-simple.c
>> index e14c14ac6..b3d257257 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -2842,6 +2842,32 @@ static const struct panel_desc 
>> shelly_sca07010_bfn_lnn = {
>>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
>>  };
>> 
>> +static const struct drm_display_mode starry_kr070pe2t_mode = {
>> +	.clock = 33000,
>> +	.hdisplay = 800,
>> +	.hsync_start = 800 + 209,
>> +	.hsync_end = 800 + 209 + 1,
>> +	.htotal = 800 + 209 + 1 + 45,
>> +	.vdisplay = 480,
>> +	.vsync_start = 480 + 22,
>> +	.vsync_end = 480 + 22 + 1,
>> +	.vtotal = 480 + 22 + 1 + 22,
>> +	.vrefresh = 60,
>> +};
>> +
>> +static const struct panel_desc starry_kr070pe2t = {
>> +	.modes = &starry_kr070pe2t_mode,
>> +	.num_modes = 1,
>> +	.bpc = 8,
>> +	.size = {
>> +		.width = 152,
>> +		.height = 86,
>> +	},
>> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | 
>> DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
>> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> 
> I'm trying to fix inconsistencies in the panel-simple driver, and this
> caught my eyes. MEDIA_BUS_FMT_RGB888_1X24 isn't a correct format for
> LVDS panels. MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG or MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA
> should be used instead. As I couldn't find documentation for the panel,
> I can't tell which format is correct. Could you please help ?
> 
>> +};
>> +
>>  static const struct drm_display_mode starry_kr122ea0sra_mode = {
>>  	.clock = 147000,
>>  	.hdisplay = 1920,
>> @@ -3474,6 +3500,9 @@ static const struct of_device_id 
>> platform_of_match[] = {
>>  	}, {
>>  		.compatible = "shelly,sca07010-bfn-lnn",
>>  		.data = &shelly_sca07010_bfn_lnn,
>> +	}, {
>> +		.compatible = "starry,kr070pe2t",
>> +		.data = &starry_kr070pe2t,
>>  	}, {
>>  		.compatible = "starry,kr122ea0sra",
>>  		.data = &starry_kr122ea0sra,
> 
> --
> Regards,
> 
> Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
