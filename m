Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F771202987
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 10:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1E26E047;
	Sun, 21 Jun 2020 08:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C54C6E047
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 08:13:57 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 84F6320024;
 Sun, 21 Jun 2020 10:13:55 +0200 (CEST)
Date: Sun, 21 Jun 2020 10:13:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2] video: fbdev: uvesafb: fix "noblank" option handling
Message-ID: <20200621081354.GI74146@ravnborg.org>
References: <CGME20200422071952eucas1p219bc9ef0a74220149966ecb03688681c@eucas1p2.samsung.com>
 <20200422071845.403-1-yanaijie@huawei.com>
 <81c9f140-d6fb-803a-18c8-04dae1007ab3@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81c9f140-d6fb-803a-18c8-04dae1007ab3@samsung.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=7gkXJVJtAAAA:8 a=hD80L64hAAAA:8
 a=e5mUnYsNAAAA:8 a=ioZTcgJbLEScLCjKLxgA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 09, 2020 at 11:29:43AM +0200, Bartlomiej Zolnierkiewicz wrote:
> Fix the recent regression.
> 
> Fixes: dbc7ece12a38 ("video: uvesafb: use true,false for bool variables")
> Cc: Jason Yan <yanaijie@huawei.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Bartlomiej

I was processing drm-misc-fixes patches so I went ahead and applied
this.
Thanks for fixing this up.

	Sam

> ---
> v2:
> - added Reviewed-by tag from Sam
> - removed no longer working Michal's email address from Cc:
> 
>  drivers/video/fbdev/uvesafb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: b/drivers/video/fbdev/uvesafb.c
> ===================================================================
> --- a/drivers/video/fbdev/uvesafb.c
> +++ b/drivers/video/fbdev/uvesafb.c
> @@ -1836,7 +1836,7 @@ static int uvesafb_setup(char *options)
>  		else if (!strcmp(this_opt, "noedid"))
>  			noedid = true;
>  		else if (!strcmp(this_opt, "noblank"))
> -			blank = true;
> +			blank = false;
>  		else if (!strncmp(this_opt, "vtotal:", 7))
>  			vram_total = simple_strtoul(this_opt + 7, NULL, 0);
>  		else if (!strncmp(this_opt, "vremap:", 7))
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
