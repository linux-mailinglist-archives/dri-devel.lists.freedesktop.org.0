Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6E1E9A6A
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 23:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A406C89F27;
	Sun, 31 May 2020 21:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD4289F27
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 21:01:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AFC83804BB;
 Sun, 31 May 2020 23:01:28 +0200 (CEST)
Date: Sun, 31 May 2020 23:01:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] staging: fbtft: fb_st7789v: make HSD20_IPS numeric and
 not a string
Message-ID: <20200531210127.GD138722@ravnborg.org>
References: <20200521135038.345878-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521135038.345878-1-colin.king@canonical.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=DfNHnWVPAAAA:8 a=e5mUnYsNAAAA:8
 a=O1M_s53xj7QJbslopEUA:9 a=CjuIK1q_8ugA:10 a=rjTVMONInIDnV1a_A2c_:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Colin/Greg.

On Thu, May 21, 2020 at 02:50:38PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently HSD20_IPS is defined as "true" and will always result in a
> non-zero result even if it is defined as "false" because it is an array
> and that will never be zero. Fix this by defining it as an integer 1
> rather than a literal string.
> 
> Addessses-Coverity: ("Array compared against 0")
> Fixes: f03c9b788472 ("staging: fbtft: fb_st7789v: Initialize the Display")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/fbtft/fb_st7789v.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> index ebc17e05ecd0..3a280cc1892c 100644
> --- a/drivers/staging/fbtft/fb_st7789v.c
> +++ b/drivers/staging/fbtft/fb_st7789v.c
> @@ -24,7 +24,7 @@
>  	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
>  	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"
>  
> -#define HSD20_IPS "true"
> +#define HSD20_IPS 1
>  
>  /**
>   * enum st7789v_command - ST7789V display controller commands

Patch does not apply to drm-misc-next, seems to be a staging thing.
So do not expext the DRM people to pick it up.

	Sam

> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
