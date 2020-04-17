Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050F71ADDBE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 15:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F5D6EBD8;
	Fri, 17 Apr 2020 13:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A766EBD8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:00:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HD0a3l014435;
 Fri, 17 Apr 2020 08:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587128436;
 bh=8K1EskntSxZHIxZmyy2txvYQjJGQ+2kpAWBWVbd5rpg=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=Xv3FrY7QcUv6TmQambnfItnPMCHm4JlhlDLr3bEC+zRqgqnKrhbY9Ir0Ax6VDM6qI
 h4iNPo7WuxI1thnohKTnZtik4p4HC5SJHvdy228jxkH6OF04tyBHaQHN3EVSJL/yrk
 LRu/MCDdTXJ2LdIg8XpNZwq0JUiwTEeoNVwU4hso=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03HD0aN7064875
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 Apr 2020 08:00:36 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 08:00:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 08:00:35 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HD0YOS035896;
 Fri, 17 Apr 2020 08:00:34 -0500
Subject: Re: [PATCH] drm/panel: panel-simple: Set AUO G101EVN010 panel type
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Alex Gonzalez <alex.gonzalez@digi.com>
References: <20200417114043.25381-1-tomi.valkeinen@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1163e6e1-254d-07c9-496b-7bf2d3157a51@ti.com>
Date: Fri, 17 Apr 2020 16:00:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417114043.25381-1-tomi.valkeinen@ti.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Adding Alex to the thread)

On 17/04/2020 14:40, Tomi Valkeinen wrote:
> The AUO G101EVN010 is a 18-bit LVDS panel, not a parallel panel, as
> indicated by the current bus_format.
> 
> Fix the bus_format to MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, and also set the
> connector_type to LVDS.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3ad828eaefe1..bf781e260fe7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -836,7 +836,8 @@ static const struct panel_desc auo_g101evn010 = {
>   		.width = 216,
>   		.height = 135,
>   	},
> -	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
>   static const struct drm_display_mode auo_g104sn02_mode = {
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
