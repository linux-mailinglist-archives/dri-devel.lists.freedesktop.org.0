Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCBF191E79
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 02:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A6E6E0DE;
	Wed, 25 Mar 2020 01:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 30372 seconds by postgrey-1.36 at gabe;
 Wed, 25 Mar 2020 01:14:20 UTC
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD88D6E0DE;
 Wed, 25 Mar 2020 01:14:20 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 02P1E35L032209;
 Wed, 25 Mar 2020 10:14:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 02P1E35L032209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585098844;
 bh=Du0zvU/kKAL8IvGiRqHBSbx7z6kjBsdUMl9fi/jYHfU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CmBBqcd636qqSj5ss3/pAlUApkkQw3SpDtaGjLBFVNgUjopNWmBHijKJ2t1GIv9sV
 ABjbr6WG0sDnmRZ9Mu7Q7ndHoShX0IVAagRmAnN07RUwv3Q2nK8KZnuxkn4pZAIO9i
 EUWCuFL5WUeO5/69pqB+6rLy+r7sXZjRilBNUWvWXyGifkZXknW/7sBGBCYqyyB72P
 ut72XASzzrV5vxCZQVb9nxcXov5YhyQ56W+EJsmsR2mYgeN9SFYj9igEHSbpD0LZLQ
 jezIoot7mFSV0RVZ1KSVAaekJDvlhsh6YZrP9pDmdVqTSkEepBu9siGl1VWwdfBVXL
 zEgAweVZWeU0A==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id m18so163058uap.9;
 Tue, 24 Mar 2020 18:14:04 -0700 (PDT)
X-Gm-Message-State: ANhLgQ39mqk4RjIgiq7EQ8B49JKUfSvIl14wQWYZZJUWjdSfCpF046Ef
 4w0Ej07cyexfCIxSMKyFKn3SHtVBkXrHYVT2VzY=
X-Google-Smtp-Source: ADFU+vsMC3zRa6ZCPZj56ljmM8HiIe+u3r7TwuTb0+ibRUQbbRZXBTBPHZ2fpKGbyXecBLtrlGGqLwlnGLzcN6iVsgo=
X-Received: by 2002:ab0:3485:: with SMTP id c5mr688955uar.109.1585098843120;
 Tue, 24 Mar 2020 18:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200213153928.28407-1-masahiroy@kernel.org>
 <CAK7LNARvxFk=ct9AoRLwjZ9cKRsA_bjiLaq0di12TRe5+fpmGA@mail.gmail.com>
 <CADnq5_Mieh9G-8hheKRdKe=qMbAQjwTheM2TWWSaZjeGU3635Q@mail.gmail.com>
In-Reply-To: <CADnq5_Mieh9G-8hheKRdKe=qMbAQjwTheM2TWWSaZjeGU3635Q@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 25 Mar 2020 10:13:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT2r3Octg-Pdjn6xNzGM49_PiGqoJSTzbmL4iBpH6_AaQ@mail.gmail.com>
Message-ID: <CAK7LNAT2r3Octg-Pdjn6xNzGM49_PiGqoJSTzbmL4iBpH6_AaQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/radeon: remove unneeded header include path
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?B?Q2hyaXN0aWFuIEvvv73vv73Dk25pZw==?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 25, 2020 at 4:42 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Mar 24, 2020 at 12:48 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi,
> >
> > I think this series is a good clean-up.
> >
> > Could you take a look at this please?
>
> Can you resend?  I don't seem to have gotten it.  Must have ended up
> getting flagged a spam or something.


Can you take it from patchwork ?  (4 patches)

https://lore.kernel.org/patchwork/project/lkml/list/?series=429491


Thanks.






> Alex
>
> >
> >
> >
> > On Fri, Feb 14, 2020 at 12:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > A header include path without $(srctree)/ is suspicious because it does
> > > not work with O= builds.
> > >
> > > You can build drivers/gpu/drm/radeon/ without this include path.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  drivers/gpu/drm/radeon/Makefile | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
> > > index c693b2ca0329..9d5d3dc1011f 100644
> > > --- a/drivers/gpu/drm/radeon/Makefile
> > > +++ b/drivers/gpu/drm/radeon/Makefile
> > > @@ -3,8 +3,6 @@
> > >  # Makefile for the drm device driver.  This driver provides support for the
> > >  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> > >
> > > -ccflags-y := -Idrivers/gpu/drm/amd/include
> > > -
> > >  hostprogs := mkregtable
> > >  clean-files := rn50_reg_safe.h r100_reg_safe.h r200_reg_safe.h rv515_reg_safe.h r300_reg_safe.h r420_reg_safe.h rs600_reg_safe.h r600_reg_safe.h evergreen_reg_safe.h cayman_reg_safe.h
> > >
> > > --
> > > 2.17.1
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
