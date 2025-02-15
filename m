Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F6A36DD2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 12:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D513A10E053;
	Sat, 15 Feb 2025 11:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GxSocOrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF64710E053
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 11:48:05 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43967004304so11141945e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 03:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739620084; x=1740224884; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQ/7+76o2RkF0Tl1UnQ8iR0C7JbSGtAyttTSJZXazLM=;
 b=GxSocOrmivr6RtqZy00OgdU34B+rz/hmTRhi1TX4I2G0FVVn0dAuF0BZzVSCAtzgXb
 gZBElwWEO4gV8Ei4CUxMjX8xYdFOICnD185iWgcwVcZm1G+beGnLvgdiL7b8R/nhUfRc
 2PNox4IgLl3BW3qPDmf7quvcTBwysaBIPH7QVd7omaK/WvOlPV/DOwEaIhEnhDdfkihZ
 6tqJUm3nMMtj6PtiesF2iSecqWt1eIdRYQSa95KJQG3eMvfXw1Ubtd6/zO649XaEnDMB
 /h3X+Na30wFzhdtg25SUdEN/v14HspxWD/4P7ZNg3CWitf2iT8z1lFbYTEI4bojF/E4k
 U4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739620084; x=1740224884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQ/7+76o2RkF0Tl1UnQ8iR0C7JbSGtAyttTSJZXazLM=;
 b=JzdW7MfqOlvNRPbEYy+d8J+UznK4IF7Neb0qhu1kQfn7/bKvc5Sr8zjjN3xOQFhsRS
 2TNwYw9XOq9kyWRwUraddccB4J7nhlTtw9BEaqTSyOXnZbnkOouyAz0IPmxFKq7sPCxa
 cN6k7vLxdp0wrXscZibAv0wu5UN7S+fNR8gXT+ZPhxVlC6lHvQBf1rUEmVz13djndHUU
 P3MCFbYE66igBqKM/ieJgPeBT+Ivl0g/rxe/NK7BAk8jtXAJssFpCPtoBenEDr00yH3O
 LpSa84/EeempCvYhyknSs++HuND+r7xWdRHg7uAHNqPGyZA4+EQNh8DEve1ud6vIwVkg
 4M4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuLL8czjMGxA9VyEpPIB4A8iw9AL70h2/mmqusHmW4UsGMTutrzvyjPA1wzP7SNabNm43uPqwKS1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2fRJrjc28H+YN8poMZzdNo5RIOVVqG/I6Q3/9UuQDCRZCdvku
 JIfzSN/2nIUBvE2OghJbH4HVNVjaUeP4yGy5aC/YFhMv98spyxN1
X-Gm-Gg: ASbGncvmevcdLw47J1e9+U45y3o/I3bhbxmtan6yi+ENsVSE3HWJSnaWx/gCQlRgUBq
 uxZGsalY220Qs8AZj+cCDTPG7xgtpbFKuRjW8gho1ypPb9rEQDKUxvQyBrIpwQax8xDZ5GD3eDX
 FeiLk4Gtp5708AVzl9TdXoGzO3Q/tMMl42s5bo3Tto6C9SrwB3q+xAryqJF1/PANKvqTScA2IcA
 AWPqTDSoehD3uWlka6PLHjfjeshd6Z+p7crh7YgUXNumbhoWAryS5Q5iGbdPg5zEMgrHypCt8J3
 YGBr2Rzzf4ZWqL8Th2WwN/uaieo9cdvO/j5HdCjvL7Pn6wI98xI02w==
X-Google-Smtp-Source: AGHT+IG9wAuFKj8al+/9GVnUsbtRcAxewKh3xIAG7tudThRlYZibB8RpchKc8FmJB8sL1EQNhWvqTg==
X-Received: by 2002:a05:600c:4711:b0:434:a315:19c with SMTP id
 5b1f17b1804b1-4396e6ab01dmr31632435e9.3.1739620083758; 
 Sat, 15 Feb 2025 03:48:03 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439618262d3sm68067885e9.22.2025.02.15.03.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 03:48:03 -0800 (PST)
Date: Sat, 15 Feb 2025 11:48:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Noralf =?UTF-8?B?VHI=?=
 =?UTF-8?B?w7hubmVz?= <noralf@tronnes.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] drm/repaper: fix integer overflows in repeat functions
Message-ID: <20250215114800.5c8d8d2b@pumpkin>
In-Reply-To: <cx4efp5kx3hahymdtgrjwu64373du4vg2v7errm3t34exrgezn@weo6exjuq2fu>
References: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
 <ejsf4dwcyg7j4wdpdtbs56lbwokzlq65fxn2gxio4l5xg6di2r@pmnpafv3nwxz>
 <20250214132910.2611f9cd@pumpkin>
 <cx4efp5kx3hahymdtgrjwu64373du4vg2v7errm3t34exrgezn@weo6exjuq2fu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Feb 2025 20:02:01 -0500
Alex Lanzano <lanzano.alex@gmail.com> wrote:

> On Fri, Feb 14, 2025 at 01:29:10PM +0000, David Laight wrote:
> > On Thu, 13 Feb 2025 20:54:59 -0500
> > Alex Lanzano <lanzano.alex@gmail.com> wrote:
> >   
> > > On Thu, Jan 16, 2025 at 05:48:01AM -0800, Nikita Zhandarovich wrote:  
> > > > There are conditions, albeit somewhat unlikely, under which right hand
> > > > expressions, calculating the end of time period in functions like
> > > > repaper_frame_fixed_repeat(), may overflow.
> > > > 
> > > > For instance, if 'factor10x' in repaper_get_temperature() is high
> > > > enough (170), as is 'epd->stage_time' in repaper_probe(), then the
> > > > resulting value of 'end' will not fit in unsigned int expression.
> > > > 
> > > > Mitigate this by casting 'epd->factored_stage_time' to wider type before
> > > > any multiplication is done.
> > > > 
> > > > Found by Linux Verification Center (linuxtesting.org) with static
> > > > analysis tool SVACE.
> > > > 
> > > > Fixes: 3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> > > > ---
> > > >  drivers/gpu/drm/tiny/repaper.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> > > > index 77944eb17b3c..d76c0e8e05f5 100644
> > > > --- a/drivers/gpu/drm/tiny/repaper.c
> > > > +++ b/drivers/gpu/drm/tiny/repaper.c
> > > > @@ -456,7 +456,7 @@ static void repaper_frame_fixed_repeat(struct repaper_epd *epd, u8 fixed_value,
> > > >  				       enum repaper_stage stage)
> > > >  {
> > > >  	u64 start = local_clock();
> > > > -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> > > > +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
> > > >  
> > > >  	do {
> > > >  		repaper_frame_fixed(epd, fixed_value, stage);
> > > > @@ -467,7 +467,7 @@ static void repaper_frame_data_repeat(struct repaper_epd *epd, const u8 *image,
> > > >  				      const u8 *mask, enum repaper_stage stage)
> > > >  {
> > > >  	u64 start = local_clock();
> > > > -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> > > > +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
> > > >  
> > > >  	do {
> > > >  		repaper_frame_data(epd, image, mask, stage);    
> > > 
> > > It might be best to change the underlying type in the struct instead of
> > > type casting  
> > 
> > That'll just make people think there is a different overflow.  
> The commit message should describe which overflow this applies to regardless.
> 
> > It'd also force the compiler to use a wider multiply.
> > 
> > A more subtle approach is to change the type of the first 1000 to 1000ull.
> >   
> My reasoning for favoring the type change route is as follows:
> 
> 1. I'm not a big fan of using the standard C integer types especially
> mixing them with the fixed sized kernel integer types for these kinds of
> overflow scenarios

I'm not sure whether the code is converting seconds to us or ms to ns.
But in either case 32bit is plenty for the configured timeout.
Whether that is 'unsigned int' or 'u32' doesn't really matter.
If you change the type to u64 someone is going to decide that the
multiply needs an overflow check.

OTOH use of 'unsigned long' is often an 'accident waiting to happen'.
There are far too many of them used for clock frequencies and similar.
I'm sure 'long' has been used because of worries that 'int' might be 16bit.
Even when Linux was started that was never going to be true.

	David

> 
> 2. It would remove the chances of this field causing the same overflow
> issues in future development
> 
> > Personally I like to see the units on variables containing times (x_s, _ms, _ns)
> > since it makes off-by-1000 errors less likely and you can more easily tell
> > whether overflow if likely.  
> Agreed but this is out of scope of this patch
> 
> Best regards,
> Alex

