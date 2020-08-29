Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31A9256A9C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 00:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203776E20F;
	Sat, 29 Aug 2020 22:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623F46E172
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 22:12:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4926920025;
 Sun, 30 Aug 2020 00:12:47 +0200 (CEST)
Date: Sun, 30 Aug 2020 00:12:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: panel: Fix bpc for OrtusTech COM43H4M85ULC panel
Message-ID: <20200829221245.GA830656@ravnborg.org>
References: <20200824003254.21904-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824003254.21904-1-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=YnnDwqg15_elmFGQwgkA:9
 a=H_9rZ1zGNNFgPB8C:21 a=_rGA9Ch8NIhrHKqD:21 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 03:32:54AM +0300, Laurent Pinchart wrote:
> The OrtusTech COM43H4M85ULC panel is a 18-bit RGB panel. Commit
> f098f168e91c ("drm: panel: Fix bus format for OrtusTech COM43H4M85ULC
> panel") has fixed the bus formats, but forgot to address the bpc value.
> Set it to 6.
> 
> Fixes: f098f168e91c ("drm: panel: Fix bus format for OrtusTech COM43H4M85ULC panel")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4eabfdd3be2d..723e9c879dfc 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3024,7 +3024,7 @@ static const struct drm_display_mode ortustech_com43h4m85ulc_mode  = {
>  static const struct panel_desc ortustech_com43h4m85ulc = {
>  	.modes = &ortustech_com43h4m85ulc_mode,
>  	.num_modes = 1,
> -	.bpc = 8,
> +	.bpc = 6,
>  	.size = {
>  		.width = 56,
>  		.height = 93,

Thanks, applied to drm-misc-next.
Did not see this was material for any -fixes branch.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
