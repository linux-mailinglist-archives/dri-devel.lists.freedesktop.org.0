Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31458192D64
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 16:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C798981B;
	Wed, 25 Mar 2020 15:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7CB895E2;
 Wed, 25 Mar 2020 15:51:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u10so3759190wro.7;
 Wed, 25 Mar 2020 08:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jdzCJSQMgm0oyL98baNgXzwRjxVHoWxbruLDM0oUMk4=;
 b=BX/mueElGQ2pf5TxuXX1CUbBcr7X3BOPwGSt2wLZHkfy08N/rTANbsO/1zOe1fkxGE
 4XZAV/FMJvqzZZyr6Wv4pXgV0+Fip/4hAZs5GPTXS2vDmoC8VA76e0QA8XEGwSGvxNrf
 zYigoBJngcvnWPAFT4E10OhZ7R+76I0d0w7MN7nrfqpV3GKVqxxaUdzS3GjbVLD9TRML
 rregJC2ikLGw+s59YJ/ActxK4orduHalzGtdQKpIML/MvCQ2lMlI7NZvr44yANbgI+rz
 hVLc/W9TKopWDTISoc0dn5PgSIu6lX63hlQbFbv3cFWxf4iPByzQsAxns94rQFpz9p1/
 rE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jdzCJSQMgm0oyL98baNgXzwRjxVHoWxbruLDM0oUMk4=;
 b=KB2Ic1BZ9Ky1eTQTelm7FROEPGs3jXoqXfDQT+09LLjVqwdqCFfXiuSZeLdNLrHKAx
 KT7wAEkHtN6eciCd6QSvPRe35DY6ioBpQqsKnDOdqnUlgUZYOEfp8DLSwTWXpSG9V/ev
 QvjSO1QIYusvBSsdDVeLkbzl2bxph67yxMFXSPTrPLK6a4Tnd+yqGUicwtX6iPfUGbu4
 Ahzi23ekcK2pQlDhf57X4cBQWb7M2UUCoyR6/d40XqZPEI7PB24be9Ah37DftlvRwd0c
 MXGsFJK5pN5Dto+7H80aqf5RIHLOCDxuZ47vDZev2c/xujpJBuoPpV0uxK0kVj2Iu4kP
 Ymnw==
X-Gm-Message-State: ANhLgQ37Z7CtlHDDbauo67XyzrpHZDgzfgSftOXcrHnmcCRj6vld26vC
 tnuoS5AgcecgXoq+4E7r2AVUchGH8YHGYqIQfMc=
X-Google-Smtp-Source: ADFU+vv+tNQ8YPWvfibugvCnhwLOYJlgXo6GRSCXcpR6TQyErbNU+Sksiez3chDL5nslTuI6gv9Wi3hMfyEPl8slG1Q=
X-Received: by 2002:a05:6000:111:: with SMTP id
 o17mr4069115wrx.111.1585151471221; 
 Wed, 25 Mar 2020 08:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200213153928.28407-1-masahiroy@kernel.org>
 <CAK7LNARvxFk=ct9AoRLwjZ9cKRsA_bjiLaq0di12TRe5+fpmGA@mail.gmail.com>
 <CADnq5_Mieh9G-8hheKRdKe=qMbAQjwTheM2TWWSaZjeGU3635Q@mail.gmail.com>
 <CAK7LNAT2r3Octg-Pdjn6xNzGM49_PiGqoJSTzbmL4iBpH6_AaQ@mail.gmail.com>
In-Reply-To: <CAK7LNAT2r3Octg-Pdjn6xNzGM49_PiGqoJSTzbmL4iBpH6_AaQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Mar 2020 11:50:59 -0400
Message-ID: <CADnq5_PN4orASM4F9VMtrmuL6W7B4MwvgOX00_Tdw2c-UJ6WrA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/radeon: remove unneeded header include path
To: Masahiro Yamada <masahiroy@kernel.org>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?B?Q2hyaXN0aWFuIEvvv73vv73Dk25pZw==?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 9:14 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Mar 25, 2020 at 4:42 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Tue, Mar 24, 2020 at 12:48 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > I think this series is a good clean-up.
> > >
> > > Could you take a look at this please?
> >
> > Can you resend?  I don't seem to have gotten it.  Must have ended up
> > getting flagged a spam or something.
>
>
> Can you take it from patchwork ?  (4 patches)
>
> https://lore.kernel.org/patchwork/project/lkml/list/?series=429491


Applied.  thanks!

Alex

>
>
> Thanks.
>
>
>
>
>
>
> > Alex
> >
> > >
> > >
> > >
> > > On Fri, Feb 14, 2020 at 12:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > A header include path without $(srctree)/ is suspicious because it does
> > > > not work with O= builds.
> > > >
> > > > You can build drivers/gpu/drm/radeon/ without this include path.
> > > >
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/radeon/Makefile | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
> > > > index c693b2ca0329..9d5d3dc1011f 100644
> > > > --- a/drivers/gpu/drm/radeon/Makefile
> > > > +++ b/drivers/gpu/drm/radeon/Makefile
> > > > @@ -3,8 +3,6 @@
> > > >  # Makefile for the drm device driver.  This driver provides support for the
> > > >  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> > > >
> > > > -ccflags-y := -Idrivers/gpu/drm/amd/include
> > > > -
> > > >  hostprogs := mkregtable
> > > >  clean-files := rn50_reg_safe.h r100_reg_safe.h r200_reg_safe.h rv515_reg_safe.h r300_reg_safe.h r420_reg_safe.h rs600_reg_safe.h r600_reg_safe.h evergreen_reg_safe.h cayman_reg_safe.h
> > > >
> > > > --
> > > > 2.17.1
> > > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Best Regards
> Masahiro Yamada
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
