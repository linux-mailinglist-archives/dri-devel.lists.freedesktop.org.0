Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732FF1F5732
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 17:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A516E5B4;
	Wed, 10 Jun 2020 15:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B676E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 15:01:01 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E177480615;
 Wed, 10 Jun 2020 17:00:59 +0200 (CEST)
Date: Wed, 10 Jun 2020 17:00:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 4/4] drm/panel: simple: add Tianma TM070JVHG33
Message-ID: <20200610150058.GB135509@ravnborg.org>
References: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
 <20200610120131.3069-5-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610120131.3069-5-matthias.schiffer@ew.tq-group.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8f9FM25-AAAA:8 a=MJQEDvMior-I7x-TAk4A:9
 a=CjuIK1q_8ugA:10 a=uSNRK0Bqq4PXrUp6LDpb:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias.

Thanks,
also a few details here to fix.

	Sam

On Wed, Jun 10, 2020 at 02:01:31PM +0200, Matthias Schiffer wrote:
> From: Max Merchel <Max.Merchel@tq-group.com>
> 
> Add support for the Tianma Micro-electronics TM070JVHG33 7.0" WXGA display
> to panel-simple.
> 
> Signed-off-by: Max Merchel <Max.Merchel@tq-group.com>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 1673113e5a5a..68fcf68da1f3 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3421,6 +3421,17 @@ static const struct panel_desc tianma_tm070jdhg30 = {
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> +static const struct panel_desc tianma_tm070jvhg33 = {
> +	.timings = &tianma_tm070jdhg30_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 150,
> +		.height = 94,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
.bus_flags??
And again .connector_type.

	Sam

> +};
> +
>  static const struct display_timing tianma_tm070rvhg71_timing = {
>  	.pixelclock = { 27700000, 29200000, 39600000 },
>  	.hactive = { 800, 800, 800 },
> @@ -4029,6 +4040,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "tianma,tm070jdhg30",
>  		.data = &tianma_tm070jdhg30,
> +	}, {
> +		.compatible = "tianma,tm070jvhg33",
> +		.data = &tianma_tm070jvhg33,
>  	}, {
>  		.compatible = "tianma,tm070rvhg71",
>  		.data = &tianma_tm070rvhg71,
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
