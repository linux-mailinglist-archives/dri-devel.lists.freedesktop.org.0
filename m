Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3DF1C782A
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 19:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0CF6E8BA;
	Wed,  6 May 2020 17:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8773F6E8BA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 17:41:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6599A803E8;
 Wed,  6 May 2020 19:40:59 +0200 (CEST)
Date: Wed, 6 May 2020 19:40:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] video: fbdev: i810: use true,false for bool variables
Message-ID: <20200506174052.GF19296@ravnborg.org>
References: <20200422071826.49038-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422071826.49038-1-yanaijie@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=t5bY3fDbLEjA0SOcjXMA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, b.zolnierkie@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 03:18:26PM +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> drivers/video/fbdev/i810/i810_main.c:1969:3-7: WARNING: Assignment of
> 0/1 to bool variable
> drivers/video/fbdev/i810/i810_main.c:1971:3-8: WARNING: Assignment of
> 0/1 to bool variable
> drivers/video/fbdev/i810/i810_main.c:1973:3-9: WARNING: Assignment of
> 0/1 to bool variable
> drivers/video/fbdev/i810/i810_main.c:1975:3-7: WARNING: Assignment of
> 0/1 to bool variable
> drivers/video/fbdev/i810/i810_main.c:2001:3-9: WARNING: Assignment of
> 0/1 to bool variable
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Thanks.

I have pushed this and your other three patches to drm-misc-next.
They will show up in the mainline kernel in the next merge window.

	Sam

> ---
>  drivers/video/fbdev/i810/i810_main.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
> index aa7583d963ac..13bbf7fe13bf 100644
> --- a/drivers/video/fbdev/i810/i810_main.c
> +++ b/drivers/video/fbdev/i810/i810_main.c
> @@ -1966,13 +1966,13 @@ static int i810fb_setup(char *options)
>  	
>  	while ((this_opt = strsep(&options, ",")) != NULL) {
>  		if (!strncmp(this_opt, "mtrr", 4))
> -			mtrr = 1;
> +			mtrr = true;
>  		else if (!strncmp(this_opt, "accel", 5))
> -			accel = 1;
> +			accel = true;
>  		else if (!strncmp(this_opt, "extvga", 6))
> -			extvga = 1;
> +			extvga = true;
>  		else if (!strncmp(this_opt, "sync", 4))
> -			sync = 1;
> +			sync = true;
>  		else if (!strncmp(this_opt, "vram:", 5))
>  			vram = (simple_strtoul(this_opt+5, NULL, 0));
>  		else if (!strncmp(this_opt, "voffset:", 8))
> @@ -1998,7 +1998,7 @@ static int i810fb_setup(char *options)
>  		else if (!strncmp(this_opt, "vsync2:", 7))
>  			vsync2 = simple_strtoul(this_opt+7, NULL, 0);
>  		else if (!strncmp(this_opt, "dcolor", 6))
> -			dcolor = 1;
> +			dcolor = true;
>  		else if (!strncmp(this_opt, "ddc3", 4))
>  			ddc3 = true;
>  		else
> -- 
> 2.21.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
