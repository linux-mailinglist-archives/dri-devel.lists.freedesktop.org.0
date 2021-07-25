Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C22823D4FD2
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 22:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC26B6E06D;
	Sun, 25 Jul 2021 20:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D466E06D
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 20:13:45 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id d382de0a-ed84-11eb-9082-0050568c148b;
 Sun, 25 Jul 2021 20:13:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CC180194B77;
 Sun, 25 Jul 2021 22:14:03 +0200 (CEST)
Date: Sun, 25 Jul 2021 22:13:42 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3] drm/panel: panel-simple: Fix proper bpc for
 ytc700tlag_05_201c
Message-ID: <YP3F9hlNIG718OxK@ravnborg.org>
References: <20210725174737.891106-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725174737.891106-1-jagan@amarulasolutions.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,
On Sun, Jul 25, 2021 at 11:17:37PM +0530, Jagan Teki wrote:
> ytc700tlag_05_201c panel support 8 bpc not 6 bpc as per
> recent testing in i.MX8MM platform.
> 
> Fix it.
> 
> Fixes: 7a1f4fa4a629 ("drm/panel: simple: Add YTC700TLAG-05-201C")
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Thanks, applied to drm-misc-fixes.

	Sam

> ---
> Changes for v3:
> - add fixes tag
> Changes for v2:
> - none
> 
>  drivers/gpu/drm/panel/panel-simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9be050ab372f..6f4151729fb7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4164,7 +4164,7 @@ static const struct drm_display_mode yes_optoelectronics_ytc700tlag_05_201c_mode
>  static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
>  	.modes = &yes_optoelectronics_ytc700tlag_05_201c_mode,
>  	.num_modes = 1,
> -	.bpc = 6,
> +	.bpc = 8,
>  	.size = {
>  		.width = 154,
>  		.height = 90,
> -- 
> 2.25.1
