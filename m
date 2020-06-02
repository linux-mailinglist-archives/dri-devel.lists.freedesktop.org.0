Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A691EC3FF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 22:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0DE6E466;
	Tue,  2 Jun 2020 20:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C9D6E466
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 20:50:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 139228050E;
 Tue,  2 Jun 2020 22:50:34 +0200 (CEST)
Date: Tue, 2 Jun 2020 22:50:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: uvesafb: use true,false for bool variables
Message-ID: <20200602205033.GA56418@ravnborg.org>
References: <CGME20200422071952eucas1p219bc9ef0a74220149966ecb03688681c@eucas1p2.samsung.com>
 <20200422071845.403-1-yanaijie@huawei.com>
 <4b460d82-b23c-f6ce-6593-735a726e4d8a@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b460d82-b23c-f6ce-6593-735a726e4d8a@samsung.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=hD80L64hAAAA:8 a=7gkXJVJtAAAA:8
 a=7mOBRU54AAAA:8 a=pQOkFE01E-EqrLGc8Q0A:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=wa9RWnbW_A1YIeRBVszw:22
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
Cc: linux-kernel@vger.kernel.org, spock@gentoo.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bartlomiej

On Mon, Jun 01, 2020 at 12:37:00PM +0200, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On 4/22/20 9:18 AM, Jason Yan wrote:
> > Fix the following coccicheck warning:
> > 
> > drivers/video/fbdev/uvesafb.c:48:12-17: WARNING: Assignment of 0/1 to
> > bool variable
> > drivers/video/fbdev/uvesafb.c:1827:3-13: WARNING: Assignment of 0/1 to
> > bool variable
> > drivers/video/fbdev/uvesafb.c:1829:3-13: WARNING: Assignment of 0/1 to
> > bool variable
> > drivers/video/fbdev/uvesafb.c:1835:3-9: WARNING: Assignment of 0/1 to
> > bool variable
> > drivers/video/fbdev/uvesafb.c:1837:3-9: WARNING: Assignment of 0/1 to
> > bool variable
> > drivers/video/fbdev/uvesafb.c:1839:3-8: WARNING: Assignment of 0/1 to
> > bool variable
> > 
> > Signed-off-by: Jason Yan <yanaijie@huawei.com>
> > ---
> >  drivers/video/fbdev/uvesafb.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
> > index 1b385cf76110..bee29aadc646 100644
> > --- a/drivers/video/fbdev/uvesafb.c
> > +++ b/drivers/video/fbdev/uvesafb.c
> > @@ -45,7 +45,7 @@ static const struct fb_fix_screeninfo uvesafb_fix = {
> >  };
> >  
> >  static int mtrr		= 3;	/* enable mtrr by default */
> > -static bool blank	= 1;	/* enable blanking by default */
> > +static bool blank	= true;	/* enable blanking by default */
> >  static int ypan		= 1;	/* 0: scroll, 1: ypan, 2: ywrap */
> >  static bool pmi_setpal	= true; /* use PMI for palette changes */
> >  static bool nocrtc;		/* ignore CRTC settings */
> > @@ -1824,19 +1824,19 @@ static int uvesafb_setup(char *options)
> >  		else if (!strcmp(this_opt, "ywrap"))
> >  			ypan = 2;
> >  		else if (!strcmp(this_opt, "vgapal"))
> > -			pmi_setpal = 0;
> > +			pmi_setpal = false;
> >  		else if (!strcmp(this_opt, "pmipal"))
> > -			pmi_setpal = 1;
> > +			pmi_setpal = true;
> >  		else if (!strncmp(this_opt, "mtrr:", 5))
> >  			mtrr = simple_strtoul(this_opt+5, NULL, 0);
> >  		else if (!strcmp(this_opt, "nomtrr"))
> >  			mtrr = 0;
> >  		else if (!strcmp(this_opt, "nocrtc"))
> > -			nocrtc = 1;
> > +			nocrtc = true;
> >  		else if (!strcmp(this_opt, "noedid"))
> > -			noedid = 1;
> > +			noedid = true;
> >  		else if (!strcmp(this_opt, "noblank"))
> > -			blank = 0;
> > +			blank = true;
> 
> The above conversion is incorrect.
> 
> The follow-up fix is included below (the original patch has been
> already applied).
Good spot, sorry for missing this when I applied the original patch.

> 
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> 
> From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Subject: [PATCH] video: fbdev: uvesafb: fix "noblank" option handling
> 
> Fix the recent regression.
> 
> Fixes: dbc7ece12a38 ("video: uvesafb: use true,false for bool variables")
> Cc: Jason Yan <yanaijie@huawei.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Michal Januszewski <spock@gentoo.org>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
