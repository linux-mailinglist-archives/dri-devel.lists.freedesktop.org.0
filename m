Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAA721C89D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jul 2020 12:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCCC6E079;
	Sun, 12 Jul 2020 10:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1125A6E079
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jul 2020 10:49:09 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D74C3804D9;
 Sun, 12 Jul 2020 12:49:04 +0200 (CEST)
Date: Sun, 12 Jul 2020 12:49:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: panel: simple: Fix bpc for LG LB070WV8 panel
Message-ID: <20200712104903.GA1065457@ravnborg.org>
References: <20200711225317.28476-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711225317.28476-1-laurent.pinchart+renesas@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=uv1mSn0-uf4r_lssLwYA:9
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Heiko Schocher <hs@denx.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 12, 2020 at 01:53:17AM +0300, Laurent Pinchart wrote:
> The LG LB070WV8 panel incorrectly reports a 16 bits per component value,
> while the panel uses 8 bits per component. Fix it.
> 
> Fixes: dd0150026901 ("drm/panel: simple: Add support for LG LB070WV8 800x480 7" panel")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Applied to drm-misc-next.
Considered if this was -fixes material but the checks was only recently
introduced. So I assume the display drivers using this panel do not yet use
bpc. So it ended up in -next and not -fixes.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3a35f74d6cb7..dfb62821932a 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2365,7 +2365,7 @@ static const struct drm_display_mode lg_lb070wv8_mode = {
>  static const struct panel_desc lg_lb070wv8 = {
>  	.modes = &lg_lb070wv8_mode,
>  	.num_modes = 1,
> -	.bpc = 16,
> +	.bpc = 8,
>  	.size = {
>  		.width = 151,
>  		.height = 91,
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
