Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55339ACA7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB066F50B;
	Thu,  3 Jun 2021 21:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457916F50B;
 Thu,  3 Jun 2021 21:20:15 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id v142so7274319oie.9;
 Thu, 03 Jun 2021 14:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3YJN7GqQliEDcugYU63yT6vV0lXDZBVNAhjtD1631UI=;
 b=rr9JlXDXnM8E+0v+LLp92r9gL01eQF5EftuX9Jq4SZvbGv5IEVdbxDDjrt1u4LmAzU
 JWFdsxyS70eav6qatxTDmFDJlZP9Ri7kXkmKazF4nX8UDwRw3n2SetZOqb7lGTzylS2r
 Eaqsg65Bl6Whyyqb2yuiAB/UvVdFCDFngQ16luUP9DV1KQrZm9NPEP3F85c67SB2k8bN
 i7YJ/rk6U8MzZTvFKdktCdyLzWrm3WD46uLbi7+XZCtHMoLc6nw3DOt8nN6lfxG9TyDS
 oCEKZrnsHc95OvPN5hbUNfSfeaxNORqGTxlUkfs4ecx1ZGQzNzYCh7aTijjy79sIc3jU
 lHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3YJN7GqQliEDcugYU63yT6vV0lXDZBVNAhjtD1631UI=;
 b=NUH2tNsgI2uOup4trXbCt04Vh5SrNcqrczI1sz1d9i1ZUWH8GUGSIji+TayS0z1z4A
 EgPicruM5E3kgNVr4/MHl+AD357jjfL9VLNjZpJqAK6pO8/U1flxntBR/bLinGQnmYn1
 WcuXaKon0R1jFdj0NmjJlmmziZb31gMSKShih0Xk1QeJNaREvGgyIHw/vRWNVgqJcj7a
 xcSyCRqp2vGQi2y7CHTClyPNRfI0ja5ghpy+6y02cy9bqyIDDqESR9EsRdK25ybaTViZ
 Sd+cCM8GTfetUiqWqaKcYmgDf9CcMzFTQn2Hqcx352cB2Ep79VwGv0XReOLWlJxWSvZq
 osdQ==
X-Gm-Message-State: AOAM532fjAFxXPFUkOH9yorI3a+NYL8s20YxJiIYfqiL0TyOcHs0RzT2
 8iOEnMeVJaq0fbG4ESYic24SNWdzp9phGfFegTvhPW69
X-Google-Smtp-Source: ABdhPJyQB5LiOZIkfs3tDcC+xROBB87qQxVIMHWeliHVuM1LvRLMkkrEJ1Dw/UpZhVdwYajjDcOuF09EUCPFRPyV9TA=
X-Received: by 2002:a05:6808:206:: with SMTP id l6mr8296234oie.5.1622755214598; 
 Thu, 03 Jun 2021 14:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
 <CAKMK7uFoLmOFCTkPMm4mMSScF0xa+MnHvY2FVmfBUM8b8S0_PQ@mail.gmail.com>
 <de4b3521-42f7-7fc2-7271-e4fa3cd91708@amd.com>
 <baf1d1f8-48c7-ed83-8e42-a4a317bfa74d@amd.com>
 <YLlFlq1orNnGLXRH@phenom.ffwll.local>
In-Reply-To: <YLlFlq1orNnGLXRH@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Jun 2021 17:20:03 -0400
Message-ID: <CADnq5_MZ=WTF_Pmt7G=E1_T4UtQ6C6zpGAUmdhOt9jmgGVwEsw@mail.gmail.com>
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug feature
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 5:11 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jun 03, 2021 at 10:22:37AM -0400, Andrey Grodzovsky wrote:
> > Ping
> >
> > Andrey
> >
> > On 2021-06-02 10:20 a.m., Andrey Grodzovsky wrote:
> > >
> > > On 2021-06-02 3:59 a.m., Daniel Vetter wrote:
> > > > On Tue, Jun 1, 2021 at 10:17 PM Andrey Grodzovsky
> > > > <andrey.grodzovsky@amd.com> wrote:
> > > > > Adding some tests to acompany the recently added hot-unplug
> > > > > feature. For now the test suite is disabled until the feature
> > > > > propagates from drm-misc-next to drm-next.
> > > > >
> > > > > Andrey Grodzovsky (7):
> > > > >    tests/amdgpu: Fix valgrind warning
> > > > >    xf86drm: Add function to retrieve char device path
> > > > >    test/amdgpu: Add helper functions for hot unplug
> > > > >    test/amdgpu/hotunplug: Add test suite for GPU unplug
> > > > >    test/amdgpu/hotunplug: Add basic test
> > > > >    tests/amdgpu/hotunplug: Add unplug with cs test.
> > > > >    tests/amdgpu/hotunplug: Add hotunplug with exported bo test
> > > > Given how nasty hotunplug is I really think collaborating on igt tests
> > > > on this would be best for everyone ... do we have to keep doing
> > > > parallel tests here for amdgpu?
> > > > -Daniel
> > >
> > > AFAIK as far as AMD goes a lot of developers use libdrm for regression
> > > testing
> > > while developing their features and also QA as i can see from some
> > > internal ticket
> > > specifically opened for failing to pass libdrm tests. From my bitter
> > > experience with
> > > GPU reset - features which are not part of a common use case such as
> > > device loading,
> > > mode setting or commands submissions tend to very quickly break as
> > > people develop
> > > features but never test them in those uncommon use cases - this is why I
> > > feel it will be
> > > very helpful to include those tests in libdrm.
> > >
> > > Also given that this is libdrm amdgpu code it fits naturally into libdrm.
> > >
> > > Regarding IGT - as you may remember I have them there too -
> > > https://gitlab.freedesktop.org/agrodzov/igt-gpu-tools/-/commits/master
> > > I hit some compile breakage on debian platform there which i need to
> > > resolve before i will submit for review there too.
>
> Why can't amd run the igt tests? Afaiui on the display side this is
> happening already, at least sometimes.
>
> And yes regression tests matter, it just feels silly that we need to have
> them 2x for amdgpu. For old stuff the old repo is all fine, but for new
> feature it looks a bit silly.

Different teams, different CI infrastructures...  It ends up being
easier to port tests between frameworks than to switch frameworks in
some cases.

Alex


> -Daniel
>
> > >
> > > Andrey
> > >
> > >
> > > >
> > > > >   tests/amdgpu/amdgpu_test.c     |  42 +++-
> > > > >   tests/amdgpu/amdgpu_test.h     |  26 +++
> > > > >   tests/amdgpu/basic_tests.c     |   5 +-
> > > > >   tests/amdgpu/hotunplug_tests.c | 357
> > > > > +++++++++++++++++++++++++++++++++
> > > > >   tests/amdgpu/meson.build       |   1 +
> > > > >   xf86drm.c                      |  23 +++
> > > > >   xf86drm.h                      |   1 +
> > > > >   7 files changed, 450 insertions(+), 5 deletions(-)
> > > > >   create mode 100644 tests/amdgpu/hotunplug_tests.c
> > > > >
> > > > > --
> > > > > 2.25.1
> > > > >
> > > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
