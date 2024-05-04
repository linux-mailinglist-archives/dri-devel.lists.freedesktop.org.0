Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424278BB90B
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 03:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D56F10F085;
	Sat,  4 May 2024 01:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="erWe6wZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6CC10F085;
 Sat,  4 May 2024 01:03:17 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51f300b318cso204598e87.3; 
 Fri, 03 May 2024 18:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714784596; x=1715389396; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dGqSC7Lfj+HWo8QLaR4IF1q8XWQgyH1xzdJwd+C0goY=;
 b=erWe6wZv8aN00txa7ViANMTZkNcF8WC0/19U7Cxpmmkx04JJhXuTtABMaqwg5Z6nv1
 q9faSGpE8BkJker/T7rKrgxG8vSWBtqmn7ClVDNw/Ahg/wd/oUoRRwNsvPXgzvWlNlGO
 kQPlbkWWbTGA/FfxfjSDpQ+B1LNWFpOwsvMSeUGjnZVsxIfAafwOrhXe/0t1RIu8S4VY
 NtOkCIELCvliqDEdK3//UQbLpn3xDJdJFJvF+59aI7IGhsg4NSpN/jI9DO+k13WsebR2
 heDAnnPwYpJ4LpveWNcihasI4W1ZS/lQyoCNAJ/pCc2XpNfZ/Il0g2/lTdqwHYUhP7kO
 4Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714784596; x=1715389396;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dGqSC7Lfj+HWo8QLaR4IF1q8XWQgyH1xzdJwd+C0goY=;
 b=dpyYLoNcZRc4ouBxzWvEtpNdU9TY5hlNhs8VhKxSVKBYrGT+5w4th/l7M9CFNPL32v
 jaHBIiSpRN8qT60xTohc0uNYKw+5eJxjGQTbWsDDIubh6PkIZnGVjI2WjR1cJreM6Cag
 3bKm8XUTmGG3jcWyXp/OHaDECYjd4KCLvqKQxDqEwNGktjpeFCXsALuev0qeVbdMk6fA
 spgAB5cK6Q3UxIEu5+mUHrABTK7C/yzgVv/mxUVYm1WfH9/oQC24T2t9GMwQ2Pw68TaC
 W+ptn960FwPtb27gJ3d3yQXHznbit590LAtZqwF77RrPQ4m7bZGIyQlAuojVyBWWl/bT
 6IqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO9oqO2bK9z8RFy1Rsu2b/y/L4nIStk5U3eSzf2sWy45WlphseKyEGerOTit+1kr3zB5Nu2AtTU17yodMPK+vWWdNPTKQcegk+e9otYZNml1rFxr/QNrBFNqhzGP6aElvbhUJYK0hPT9axHc3pIzk=
X-Gm-Message-State: AOJu0Yz/66ywkmCCBvEdkDyBPrUAHXVGAY1Oxuj0k/J5+UM++QLXWE7P
 4AUVfgNZCXziSWTR7ZbQQ/MuFDkASRCTZ385bHC7MvmXmvAjmTPhqRIe63/ApcSZr26Ymced/XK
 pnlzWThxTHP3uzUnq4qb7mTvLaVY=
X-Google-Smtp-Source: AGHT+IHbTb1WXnmJcyDnIRZhAl4+Ez0UUgP9EmnzUuyExzzF9HOmG6SKYTENkLY3bSx2CLy+/hcReBqxQdTVVvD+lZI=
X-Received: by 2002:a19:2d56:0:b0:51f:3d37:91d5 with SMTP id
 t22-20020a192d56000000b0051f3d3791d5mr2760832lft.10.1714784595580; Fri, 03
 May 2024 18:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240430173002.GV941030@nvidia.com>
 <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
 <20240501000915.GY941030@nvidia.com> <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
 <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
 <20240502124632.GB3341011@nvidia.com>
 <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
 <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503133732.GD3341011@nvidia.com>
 <SA1PR11MB699156AB3B2603DF1762BEA7921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503162812.GF3341011@nvidia.com>
 <SA1PR11MB69911B3E675B1072A17A3E49921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB69911B3E675B1072A17A3E49921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 4 May 2024 11:03:03 +1000
Message-ID: <CAPM=9tw0w4fY3+fHV4kx8oGUvSM3vzH4KXKFDxg_aqBq4duSsA@mail.gmail.com>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
To: "Zeng, Oak" <oak.zeng@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, 
 "Welty, Brian" <brian.welty@intel.com>, 
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, 
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>, 
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

> Let me know if this understanding is correct.
>
> Or what would you like to do in such situation?
>
> >
> > Not sure how it is really a good idea.
> >
> > Adaptive locality of memory is still an unsolved problem in Linux,
> > sadly.
> >
> > > > However, the migration stuff should really not be in the driver
> > > > either. That should be core DRM logic to manage that. It is so
> > > > convoluted and full of policy that all the drivers should be working
> > > > in the same way.
> > >
> > > Completely agreed. Moving migration infrastructures to DRM is part
> > > of our plan. We want to first prove of concept with xekmd driver,
> > > then move helpers, infrastructures to DRM. Driver should be as easy
> > > as implementation a few callback functions for device specific page
> > > table programming and device migration, and calling some DRM common
> > > functions during gpu page fault.
> >
> > You'd be better to start out this way so people can look at and
> > understand the core code on its own merits.
>
> The two steps way were agreed with DRM maintainers, see here:  https://lore.kernel.org/dri-devel/SA1PR11MB6991045CC69EC8E1C576A715925F2@SA1PR11MB6991.namprd11.prod.outlook.com/, bullet 4)

After this discussion and the other cross-device HMM stuff I think we
should probably push more for common up-front, I think doing this in a
driver without considering the bigger picture might not end up
extractable, and then I fear the developers will just move onto other
things due to management pressure to land features over correctness.

I think we have enough people on the list that can review this stuff,
and even if the common code ends up being a little xe specific,
iterating it will be easier outside the driver, as we can clearly
demark what is inside and outside.

Dave.
