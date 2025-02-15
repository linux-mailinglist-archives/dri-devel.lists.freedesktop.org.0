Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9523A36A70
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 02:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E5510E368;
	Sat, 15 Feb 2025 01:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GoMNQvyK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514A310E368
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 01:02:08 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6dd049b5428so22393666d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739581327; x=1740186127; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Nqj7o49OtvRT5iEEonYD4OZw5LtydwFI4sGb/0Fu3BU=;
 b=GoMNQvyKibcVRzOMo/C5sYuawKOqv1zKmZtKrDpogBCuGDAsSp6+XijKk6EEAkLXzk
 vrEX3DE29fhyReljdo0ksqwbwxHCgMkYxyarouwKzX6BO6nqhTb1aBESbiKHmg2f69F6
 HgT2NVw8lfTIVCXriCXzDPrsK/PHyocspqHuPqFIiedP+QxENz7HcnWF5yXaRWKDAeTj
 XUftYkR9x+omsPzKXnEoWul4njtezowmv5auOEJvlgBxAbAgqIJMwWN4Je5BnIsusJXw
 LT2cCvGIL9j8HTJEWVHvrQLCiwSoZJv4mvgHKcZbB1JqHe2XQZZFg4koqPLrJjs3VFz3
 j3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739581327; x=1740186127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nqj7o49OtvRT5iEEonYD4OZw5LtydwFI4sGb/0Fu3BU=;
 b=a6RV3hhHgns5aZUKJzhiV4QNOfWLgSEU92S78gLih/+2PmZlKpxcGItfYw8FzZKJ2u
 qEheeY3erjoKg2jB7dLnZZ/CrMmBi3aX7GYG01A/hp3QFo7TvXEPQl/Vp9yN1J/zNkM6
 10vNWr403bm8SAKxVh04kqSIVuAmyH0P9loojUFLKpvYTLVanYtFRBdjXil5v5oxXKvT
 +irtZDoKXrov/HsX34YcEy/tb9OwNjkzQtVSENG69jmIrvQIfFHl/47fpOTdaipad4wc
 xgSUZnNmfJWYTjOZi1/f7h95Tz+k4+AGwByZgz3fW9wavzGKPT1a9QvdtMTLeiPHq33e
 Te2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLg+Gtt7s25fYmJeo7U3j18fomq3WSkHnXVK9SetMIyR+7ZrtgOsVmSLJ3mXSIPsxI/ldBuNTPwG4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzntlejO9izNzerCplH1aYyP0ue+hO9HloM2oEj/kgDQLKHqLAL
 bqEcZnsB/JoluH5hyNI7FOfwSETjib3qHO4rDsDhxw/kruTj7RDoCLk7iKUa
X-Gm-Gg: ASbGncv6iGhJhoJUI4kFE7N545ecdTgpX7WPrsLZ9XW8FjIP/5KB53vj2TqVb4B8DSZ
 CrEsSodsrlYK59ZS1fnjOfV93OQjHGf4AGPti7aaCviH59dTLBKPRhxvKIWOtmyO+Hqvpwtoj2s
 QPy4Sp7898fP4W8EgpukddU5Fi6Zc/r1weNdXB3U2Ph6K4vHn0QJeEZukFRUvhjQob+QCBKb3Ru
 KmEthyR5uRIN3OUtqK9NvvR+sJgRQrPXDZUsL2WOWIGiV0CKqj0A/TF7AX5UInC14oiLLNedrnH
 f0bf7ZYjRWcWtsVxm3LJPQ2A2jzFsqg5qCuRoLvzomNshdeEXI1W
X-Google-Smtp-Source: AGHT+IH7l3+IZX/ugOgcY6A74TGp0xIfa8Wyi4jjlu0EfUXnGzlNsMg/wysPtqN1cyANXGt8N8uQlg==
X-Received: by 2002:a05:6214:d07:b0:6e6:62fb:3503 with SMTP id
 6a1803df08f44-6e66ccbcb4cmr17810096d6.12.1739581327183; 
 Fri, 14 Feb 2025 17:02:07 -0800 (PST)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-471c2b048e7sm23215831cf.74.2025.02.14.17.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 17:02:06 -0800 (PST)
Date: Fri, 14 Feb 2025 20:02:01 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, 
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] drm/repaper: fix integer overflows in repeat functions
Message-ID: <cx4efp5kx3hahymdtgrjwu64373du4vg2v7errm3t34exrgezn@weo6exjuq2fu>
References: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
 <ejsf4dwcyg7j4wdpdtbs56lbwokzlq65fxn2gxio4l5xg6di2r@pmnpafv3nwxz>
 <20250214132910.2611f9cd@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214132910.2611f9cd@pumpkin>
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

On Fri, Feb 14, 2025 at 01:29:10PM +0000, David Laight wrote:
> On Thu, 13 Feb 2025 20:54:59 -0500
> Alex Lanzano <lanzano.alex@gmail.com> wrote:
> 
> > On Thu, Jan 16, 2025 at 05:48:01AM -0800, Nikita Zhandarovich wrote:
> > > There are conditions, albeit somewhat unlikely, under which right hand
> > > expressions, calculating the end of time period in functions like
> > > repaper_frame_fixed_repeat(), may overflow.
> > > 
> > > For instance, if 'factor10x' in repaper_get_temperature() is high
> > > enough (170), as is 'epd->stage_time' in repaper_probe(), then the
> > > resulting value of 'end' will not fit in unsigned int expression.
> > > 
> > > Mitigate this by casting 'epd->factored_stage_time' to wider type before
> > > any multiplication is done.
> > > 
> > > Found by Linux Verification Center (linuxtesting.org) with static
> > > analysis tool SVACE.
> > > 
> > > Fixes: 3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> > > ---
> > >  drivers/gpu/drm/tiny/repaper.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> > > index 77944eb17b3c..d76c0e8e05f5 100644
> > > --- a/drivers/gpu/drm/tiny/repaper.c
> > > +++ b/drivers/gpu/drm/tiny/repaper.c
> > > @@ -456,7 +456,7 @@ static void repaper_frame_fixed_repeat(struct repaper_epd *epd, u8 fixed_value,
> > >  				       enum repaper_stage stage)
> > >  {
> > >  	u64 start = local_clock();
> > > -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> > > +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
> > >  
> > >  	do {
> > >  		repaper_frame_fixed(epd, fixed_value, stage);
> > > @@ -467,7 +467,7 @@ static void repaper_frame_data_repeat(struct repaper_epd *epd, const u8 *image,
> > >  				      const u8 *mask, enum repaper_stage stage)
> > >  {
> > >  	u64 start = local_clock();
> > > -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> > > +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
> > >  
> > >  	do {
> > >  		repaper_frame_data(epd, image, mask, stage);  
> > 
> > It might be best to change the underlying type in the struct instead of
> > type casting
> 
> That'll just make people think there is a different overflow.
The commit message should describe which overflow this applies to regardless.

> It'd also force the compiler to use a wider multiply.
> 
> A more subtle approach is to change the type of the first 1000 to 1000ull.
> 
My reasoning for favoring the type change route is as follows:

1. I'm not a big fan of using the standard C integer types especially
mixing them with the fixed sized kernel integer types for these kinds of
overflow scenarios

2. It would remove the chances of this field causing the same overflow
issues in future development

> Personally I like to see the units on variables containing times (x_s, _ms, _ns)
> since it makes off-by-1000 errors less likely and you can more easily tell
> whether overflow if likely.
Agreed but this is out of scope of this patch

Best regards,
Alex
