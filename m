Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA18324A38
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 06:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B246EC48;
	Thu, 25 Feb 2021 05:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DB76EC67
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 05:37:52 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id c10so3898865ilo.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 21:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l5d9tiVZiSmpYw9Kzo6OPD2MnxpXtmVp9YVqjAIMjME=;
 b=N4/1dq8IxosfqqcyRqFUKzf0LEF+uEbdtBPMjcXviAg8s3TEjBbtQPKgXjcEsC2zFw
 63MzRx2oMJeSEBepMA/RhLLvF4VDJvL3cuMoZIoDbP4Rdk9UUXYBh0v8N5RQK2qCZ+yN
 yedIew1DWaEoPXcTa47tEmILM4wUMo1aq1+gJWZcWroXQR664VLei5soaSN6YkR9OWsS
 11hatA1aJOEu1d5OEdBMfmCvkJSHJaQGRmc8zffpHOZTPLGr+0XGq5rxQqy0pf0h6PNN
 jXgJLv0NU8CiERAQVL4gsFu7KClcmg1MnqiiLdmQWOnn0KEWM0CBRoj8i1d3aR/STm4O
 sfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l5d9tiVZiSmpYw9Kzo6OPD2MnxpXtmVp9YVqjAIMjME=;
 b=oA1kcfGx4jc8tD3h1Y2BW55TzbsoK/mXh7EN44OiqehkEQ3DUJK6T9bk3tXQdRKYrY
 GeuTZ1BEZ5N2zDvnSrrsGcVKkfGa64Tf6iiqvnoyaYcgBBlXLx3wr71GrDT/AoUjZf6u
 HBPocPFEwPKt7dVglChNoB8/WhvqZjbfYkPfiAGu3j6e66yz53t7dTQBYoPVhiV6lUUU
 NXAjU8iVsWNKPWCBg0Ko+TVmYuc4zJ1geY4DvzIpBULKZUNqN19jA3debJjEUJE86hyc
 QiAevO7h4Ej3IRyb3/rkYrjs56q5+uwCgRIi/AbrQxL3swIfbFZsdPPQo8UFrdMl4DR7
 3PEw==
X-Gm-Message-State: AOAM530y6MHitPjxut1PX/mUVHcl8YrTWrL39JvC0tyffhm5Gn8LMmc4
 EyUn4r9oV8k7qa6jYaqIgQ63OeaiW9RUfr1Kxuc=
X-Google-Smtp-Source: ABdhPJwOX4LdSs88ZQuWV3zM9JR/5lpinl1Y/17aNQwTMSnOrxFgeHzdFQlA0MjmlzuQve8I48uu2pf2cv/QB520s3o=
X-Received: by 2002:a05:6e02:12e2:: with SMTP id
 l2mr1158655iln.91.1614231471697; 
 Wed, 24 Feb 2021 21:37:51 -0800 (PST)
MIME-Version: 1.0
References: <20210216161924.1687-1-diego.viola@gmail.com>
 <CAAVeFuLLw+pb-vvxPbbgDGGLo4Vi-ReJAh_YH-3xUZEDyhDb-Q@mail.gmail.com>
 <CACAvsv43MhF2JUUhLbxk+aaMkforpF1bvggyfJR=MOnv3wMCfA@mail.gmail.com>
 <CA+ToGPHOb46YRJmKbEUXv9hqo0fjeGxPQEoQiWniX7WUuVJypA@mail.gmail.com>
In-Reply-To: <CA+ToGPHOb46YRJmKbEUXv9hqo0fjeGxPQEoQiWniX7WUuVJypA@mail.gmail.com>
From: Diego Viola <diego.viola@gmail.com>
Date: Thu, 25 Feb 2021 02:37:40 -0300
Message-ID: <CA+ToGPH+afKCW=e_Z5a=WmzpUbg9JaJh0pCGujXx+D6US0SypQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau/pmu: fix timeout on GP108
To: Ben Skeggs <skeggsb@gmail.com>
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
Cc: Alexandre Courbot <gnurou@gmail.com>, Roy Spliet <nouveau@spliet.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 2:22 AM Diego Viola <diego.viola@gmail.com> wrote:
>
> Hi Ben,
>
> I can confirm that your last two patches[0][1] fix the timeout issues
> (those from a normal boot and from suspend/resume).
>
> [0] https://github.com/skeggsb/linux/commit/90224a17437b1f39dbecbb385567c1fce958f992
> [1] https://github.com/skeggsb/linux/commit/0ee6dc49601359042fd254bbd8ba6b4685b4d0d7
>
> Tested-by: Diego Viola <diego.viola@gmail.com>
>
> on both patches.
>
> Thanks, I appreciate it a lot.
>
> Diego
>
> On Wed, Feb 24, 2021 at 6:50 AM Ben Skeggs <skeggsb@gmail.com> wrote:
> >
> > On Wed, 17 Feb 2021 at 13:30, Alexandre Courbot <gnurou@gmail.com> wrote:
> > >
> > > On Wed, Feb 17, 2021 at 1:20 AM Diego Viola <diego.viola@gmail.com> wrote:
> > > >
> > > > This code times out on GP108, probably because the BIOS puts it into a
> > > > bad state.
> > > >
> > > > Since we reset the PMU on driver load anyway, we are at no risk from
> > > > missing a response from it since we are not waiting for one to begin
> > > > with.
> > >
> > > This looks safe to me, provided indeed that the PMU's reset is not
> > > called outside of initialization (which for GP108 is shouldn't be
> > > IIRC?).
> > ISTR that the PMU FW we use prior to GM200 might depend on that being there.
> >
> > I've posted a proposed alternate fix here[1], as we probably shouldn't
> > have been touching PMU there anyway on those GPUs.
> >
> > Ben.
> >
> > [1] https://github.com/skeggsb/linux/commit/90224a17437b1f39dbecbb385567c1fce958f992
> >
> > >
> > > >
> > > > Signed-off-by: Diego Viola <diego.viola@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c | 6 +-----
> > > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> > > > index a0fe607c9c07..5c802f2d00cb 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> > > > @@ -102,12 +102,8 @@ nvkm_pmu_reset(struct nvkm_pmu *pmu)
> > > >         if (!pmu->func->enabled(pmu))
> > > >                 return 0;
> > > >
> > > > -       /* Inhibit interrupts, and wait for idle. */
> > > > +       /* Inhibit interrupts. */
> > > >         nvkm_wr32(device, 0x10a014, 0x0000ffff);
> > > > -       nvkm_msec(device, 2000,
> > > > -               if (!nvkm_rd32(device, 0x10a04c))
> > > > -                       break;
> > > > -       );
> > > >
> > > >         /* Reset. */
> > > >         if (pmu->func->reset)
> > > > --
> > > > 2.30.1
> > > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

Ugh, sorry for breaking the regular email flow/order. Damn you gmail!

Regards,
Diego
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
