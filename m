Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DF36132F1
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 10:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B3310E178;
	Mon, 31 Oct 2022 09:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BB610E178
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1667209300; bh=Z25McFAq/fZg6Nt+RMlIuZnOqxW+HHMoOOGINtr8RnE=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=miTlzDsqy/dEfPKSFyutFeBV6FTEu4pUayowICHqq6GCZk1LanhFDTIkxJSu2wHdA
 gxRGjfdIDnm3rftNQbHvZBHCeDp9RyOs9n0BXDc/bSNA3zVo07jXTCFAIUZq/rZUFn
 U7SVyrxlyw2zq/rIS76bbX6plIe+sE2svV8xU13M=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP via [213.182.55.206]
 Mon, 31 Oct 2022 10:41:40 +0100 (CET)
X-EA-Auth: L7i+ZqFQ7hgqy31RkIacIVqE5ujQIRhCaBIpvwogTIgXp2OOAi4Mvw1d9cH/ZGNmRhS0i3i4FpQXhSQ+0jbDduANPyttGcxR
Date: Mon, 31 Oct 2022 15:11:36 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] staging: fbtft: Use ARRAY_SIZE() to get argument count
Message-ID: <Y1+YUMCog7K5fVep@ubunlion>
References: <Y1vZXUi0Bjiub8HZ@ubunlion> <Y1zXIjCe3LGwApWD@kroah.com>
 <Y11b0oCmle2pbRel@ubunlion>
 <alpine.DEB.2.22.394.2210291931590.2917@hadrien>
 <Y191LI7zKVRA5LEb@ubunlion> <Y1+YC5OuycA5hLFx@ubunlion>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SJmkD8dY3dyTpnMo"
Content-Disposition: inline
In-Reply-To: <Y1+YC5OuycA5hLFx@ubunlion>
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
Cc: linux-fbdev@vger.kernel.org, outreachy@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--SJmkD8dY3dyTpnMo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 31, 2022 at 03:10:27PM +0530, Deepak Varma wrote:
> On Mon, Oct 31, 2022 at 12:41:40PM +0530, Deepak Varma wrote:
> > On Sat, Oct 29, 2022 at 07:34:26PM +0200, Julia Lawall wrote:
> > >
> > >
> > > On Sat, 29 Oct 2022, Deepak R Varma wrote:
> > >
> > > > On Sat, Oct 29, 2022 at 09:32:50AM +0200, Greg Kroah-Hartman wrote:
> > > > > On Fri, Oct 28, 2022 at 07:00:05PM +0530, Deepak R Varma wrote:
> > > > > > The ARRAY_SIZE(foo) macro should be preferred over sizeof operator
> > > > > > based computation such as sizeof(foo)/sizeof(foo[0]) for finding
> > > > > > number of elements in an array. Issue identified using coccicheck.
> > > > > >
> > > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > > > ---
> > > > > >  drivers/staging/fbtft/fbtft.h | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
> > > > > > index 2c2b5f1c1df3..5506a473be91 100644
> > > > > > --- a/drivers/staging/fbtft/fbtft.h
> > > > > > +++ b/drivers/staging/fbtft/fbtft.h
> > > > > > @@ -231,7 +231,7 @@ struct fbtft_par {
> > > > > >  	bool polarity;
> > > > > >  };
> > > > > >
> > > > > > -#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> > > > > > +#define NUMARGS(...)  ARRAY_SIZE(((int[]){ __VA_ARGS__ }))
> > > > >
> > > > > Please please please test-build your patches before sending them out.
> > > > > To not do so just wastes reviewer resources :(
> > > >
> > > > Hello Greg,
> > > > I did build the .ko files by making the driver/staging/fbtft/ path. I verified
> > > > .o and .ko files were built.
> > > >
> > > > I did a make clean just now and was again able to rebuild without any errors.
> > > > Please see the attached log file.
> > > >
> > > > Is there something wrong with the way I am firing the build?
> > >
> > > The change is in the definition of a macro.  The compiler won't help you
> > > in this case unless the macro is actually used in code that is compiled.
> > > Find the uses and check for any nearby ifdefs.  For file foo.c you can
> > > also do make foo.i to see the result of reducing ifdef and expanding
> > > macros.  Then you can see if the code you changed is actually included in
> > > the build.
> >
> > Okay. This is helpful. I understand. Looking into the file where the macro
> > expansion is reported to be failed.
>
> Hi Julia,
> I could see the macro expansions in the .i files for the fbtft-core.c and
> fb_hx8353d.c file. I am not sure why it built successfully on my x86 though. The
> error in Kerbel bot seems to be specific to ARM arch. I will try that later
> today. I am on the right track to the build error triage?
>
> Also, while reviewing the macro expansion, I saw change in the computation that
> seems odd to me. In the denominator of the expanded macro, there is a "+
> ((int)...." computation that I am not sure if is result of ARRAY_SIZE. I have
> attached the old anf the new .i file diff for your review. If you get a change
> could you help me understand why this additional computation is added to the
> denominator?

File now attached.

>
> Thank you,
> ./drv
> >
> > Thank you,
> > ./drv
> >
> > >
> > > julia
> > >
> >
> >
> >
>
>
>

--SJmkD8dY3dyTpnMo
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="fbtft-core.diff"

74422c74422,74428
< # 242 "drivers/staging/fbtft/fbtft.h"
---
> 
> 
> 
> 
> 
> 
> 
74644c74650
<  ((par)->fbtftops.write_register(par, (sizeof((int[]){MIPI_DCS_SET_COLUMN_ADDRESS, (xs >> 8) & 0xFF, xs & 0xFF, (xe >> 8) & 0xFF, xe & 0xFF}) / sizeof(int)), MIPI_DCS_SET_COLUMN_ADDRESS, (xs >> 8) & 0xFF, xs & 0xFF, (xe >> 8) & 0xFF, xe & 0xFF))
---
>  ((par)->fbtftops.write_register(par, (sizeof(((int[]){ MIPI_DCS_SET_COLUMN_ADDRESS, (xs >> 8) & 0xFF, xs & 0xFF, (xe >> 8) & 0xFF, xe & 0xFF })) / sizeof((((int[]){ MIPI_DCS_SET_COLUMN_ADDRESS, (xs >> 8) & 0xFF, xs & 0xFF, (xe >> 8) & 0xFF, xe & 0xFF }))[0]) + ((int)(sizeof(struct { int:(-!!(__builtin_types_compatible_p(typeof((((int[]){ MIPI_DCS_SET_COLUMN_ADDRESS, (xs >> 8) & 0xFF, xs & 0xFF, (xe >> 8) & 0xFF, xe & 0xFF }))), typeof(&(((int[]){ MIPI_DCS_SET_COLUMN_ADDRESS, (xs >> 8) & 0xFF, xs & 0xFF, (xe >> 8) & 0xFF, xe & 0xFF }))[0])))); })))), MIPI_DCS_SET_COLUMN_ADDRESS, (xs >> 8) & 0xFF, xs & 0xFF, (xe >> 8) & 0xFF, xe & 0xFF))
74647c74653
<  ((par)->fbtftops.write_register(par, (sizeof((int[]){MIPI_DCS_SET_PAGE_ADDRESS, (ys >> 8) & 0xFF, ys & 0xFF, (ye >> 8) & 0xFF, ye & 0xFF}) / sizeof(int)), MIPI_DCS_SET_PAGE_ADDRESS, (ys >> 8) & 0xFF, ys & 0xFF, (ye >> 8) & 0xFF, ye & 0xFF))
---
>  ((par)->fbtftops.write_register(par, (sizeof(((int[]){ MIPI_DCS_SET_PAGE_ADDRESS, (ys >> 8) & 0xFF, ys & 0xFF, (ye >> 8) & 0xFF, ye & 0xFF })) / sizeof((((int[]){ MIPI_DCS_SET_PAGE_ADDRESS, (ys >> 8) & 0xFF, ys & 0xFF, (ye >> 8) & 0xFF, ye & 0xFF }))[0]) + ((int)(sizeof(struct { int:(-!!(__builtin_types_compatible_p(typeof((((int[]){ MIPI_DCS_SET_PAGE_ADDRESS, (ys >> 8) & 0xFF, ys & 0xFF, (ye >> 8) & 0xFF, ye & 0xFF }))), typeof(&(((int[]){ MIPI_DCS_SET_PAGE_ADDRESS, (ys >> 8) & 0xFF, ys & 0xFF, (ye >> 8) & 0xFF, ye & 0xFF }))[0])))); })))), MIPI_DCS_SET_PAGE_ADDRESS, (ys >> 8) & 0xFF, ys & 0xFF, (ye >> 8) & 0xFF, ye & 0xFF))
74650c74656
<  ((par)->fbtftops.write_register(par, (sizeof((int[]){MIPI_DCS_WRITE_MEMORY_START}) / sizeof(int)), MIPI_DCS_WRITE_MEMORY_START));
---
>  ((par)->fbtftops.write_register(par, (sizeof(((int[]){ MIPI_DCS_WRITE_MEMORY_START })) / sizeof((((int[]){ MIPI_DCS_WRITE_MEMORY_START }))[0]) + ((int)(sizeof(struct { int:(-!!(__builtin_types_compatible_p(typeof((((int[]){ MIPI_DCS_WRITE_MEMORY_START }))), typeof(&(((int[]){ MIPI_DCS_WRITE_MEMORY_START }))[0])))); })))), MIPI_DCS_WRITE_MEMORY_START));

--SJmkD8dY3dyTpnMo--


