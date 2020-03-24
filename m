Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E974A191A32
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 20:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F43A6E063;
	Tue, 24 Mar 2020 19:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E896E063;
 Tue, 24 Mar 2020 19:42:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d198so4659331wmd.0;
 Tue, 24 Mar 2020 12:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tcB+tq5Rgj7hEjAm6kQlVEkLWTkSJ/gNL53xHmD0Uck=;
 b=loukMwfTiUhp+6HSA/DQrYEvGm4YpFdj/AZfft93YrG45642/xWkNAz+KiBQ//2Fhu
 KYi2mcD+sf0TPAbxvqar6SsFqJCdutLLxZCMnFoWmw4vhOABdBN2QakoJsWLuRwXLuYd
 x/9zJJF1hjNB/yowWZXOGBKrfRefrCM7logsrjjfZ3+rKbV5xXpbFXFPUnoUWDXBpyyy
 AFBIPqgdpNmuh4mx+3HpDF7idzcXJXlbMFf3U/gBXqDBfGOVY/QnTmvxVQcb9+2GAiEm
 /LB/GkdLOVCz+2nMe5yn4uqWV5AqN6CTg2mffguLfmarOc2DmX4zZ+v5JlDxxmXYdpSQ
 YcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tcB+tq5Rgj7hEjAm6kQlVEkLWTkSJ/gNL53xHmD0Uck=;
 b=GUKPJRpobFlVlkNzRRPoPV88Ncy4KR/mIK8lfMsrtz0rWJaTLHFq6tUgqHRJ2ePhdi
 y4MjZ9Y7HgGbvPUSU2A1FYEhJeM1YPT2M6A4NuVtCCxVUAhD7yIdMTrn1J6+W2LeFUH2
 mgQffh+NkSRl8rIpFJFENoORcetlFlTfQt5Uybn25GqGXMGgXP/L1mL93P61v1j8BtSq
 20FpMmHgJPFIsC8HDvHlvkbwGwu7fL/cOUkjyRcG9fsKU+jxcQjFi/B/YOaiL7QTlktZ
 W+XKPUfouJ4xm7pdMvMzbK3WmEi49RwFOZI8TGYr7imP75EXdYm4+0/1ktiXoQIaptMP
 PLig==
X-Gm-Message-State: ANhLgQ0Cbp6EY3FOKy6tFhx8ICvgyRiG8snea58T00DJ9YptElS5hJSn
 GE52miyDHaAxJQclqytYLINwqDcbH1ouLDe9wKOOtQ==
X-Google-Smtp-Source: ADFU+vsVLJ3Wj1PXVDBegxztfsXqTfDXiYljZ9KRzUr6EG1nA8pDji3GfkC+UKjBBDi2SC8Erl5pb8UqUJ/LI8O7+zo=
X-Received: by 2002:a1c:2842:: with SMTP id o63mr7494442wmo.73.1585078968451; 
 Tue, 24 Mar 2020 12:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200213153928.28407-1-masahiroy@kernel.org>
 <CAK7LNARvxFk=ct9AoRLwjZ9cKRsA_bjiLaq0di12TRe5+fpmGA@mail.gmail.com>
In-Reply-To: <CAK7LNARvxFk=ct9AoRLwjZ9cKRsA_bjiLaq0di12TRe5+fpmGA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Mar 2020 15:42:37 -0400
Message-ID: <CADnq5_Mieh9G-8hheKRdKe=qMbAQjwTheM2TWWSaZjeGU3635Q@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?B?Q2hyaXN0aWFuIEvvv73vv73Dk25pZw==?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 12:48 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi,
>
> I think this series is a good clean-up.
>
> Could you take a look at this please?

Can you resend?  I don't seem to have gotten it.  Must have ended up
getting flagged a spam or something.

Alex

>
>
>
> On Fri, Feb 14, 2020 at 12:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > A header include path without $(srctree)/ is suspicious because it does
> > not work with O= builds.
> >
> > You can build drivers/gpu/drm/radeon/ without this include path.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  drivers/gpu/drm/radeon/Makefile | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
> > index c693b2ca0329..9d5d3dc1011f 100644
> > --- a/drivers/gpu/drm/radeon/Makefile
> > +++ b/drivers/gpu/drm/radeon/Makefile
> > @@ -3,8 +3,6 @@
> >  # Makefile for the drm device driver.  This driver provides support for the
> >  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> >
> > -ccflags-y := -Idrivers/gpu/drm/amd/include
> > -
> >  hostprogs := mkregtable
> >  clean-files := rn50_reg_safe.h r100_reg_safe.h r200_reg_safe.h rv515_reg_safe.h r300_reg_safe.h r420_reg_safe.h rs600_reg_safe.h r600_reg_safe.h evergreen_reg_safe.h cayman_reg_safe.h
> >
> > --
> > 2.17.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
