Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E63249FF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 06:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4276E8C3;
	Thu, 25 Feb 2021 05:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C236E8C3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 05:22:51 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id o1so3861022ila.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 21:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NBGLbUHfWX61SiPuGbVl+z4WV/5RdoCYOnTg8ALW4Zg=;
 b=DVAmSyuk+BaSYeGygm5m0R8sQPLdVwq/XOvT42QyATnyJ5AE2bLe8sVQkhInWYpMVi
 cxUKfMBwiHIEmztfiZ/3h8TJKddNEekmOm7GYYwuiwIaIuwnMUtjKsbbf0q5bNxK5d2k
 9C2G/EDOFR2Pnd+Hzr92cMjuy+1rrwZvgriKT/V1A2LxTSoy+BrndozazEO1we9OQTFT
 L1LD8lsG/Kqfc86TNHyh4iGNhhFL96QFkfPdvNqnAiDXzU+nFNQe9iXtxlQzKqwt32Bz
 6T2jB/7TCecIvKmuHUArNRm/1MmVohOaOzc0IKLkh51jCYd5H/r+AdOMkQW5Iob6gRkZ
 qQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBGLbUHfWX61SiPuGbVl+z4WV/5RdoCYOnTg8ALW4Zg=;
 b=Mq+kJYFFPFnroeVE2ZyEnr5y9fJQBEgT1y6l2ccB+4YB51JwJjEiFi7cQy/J0XI+p0
 FGHgMokCcplj6+x4W8qkNxmLNiLXZAq9AW3vo6+8zz4IN6YgBiaEluFi1M++si3VNKgO
 SVSsYJx7CB/oQbgfCp5nWLsC0KA5Mxjt3sQ8Tdu2LV3dtdk+lOIO5KxzABl6H1mUB0jc
 Oq9vTVMw/PFJBE9/YMzx2x52qNIZfOz7X6bT4dBaPPTOLrFHRo+9X0Mpk7/rWuYih/id
 rbk1UOd1pyI5MedDOq4e33asDesmINUVz0Oui4eSDVvD8PO0WvR8CCOAXaZspds7Xcw2
 T4+Q==
X-Gm-Message-State: AOAM5339Ii4N60dSYNEQQZRG4QYoWNuUx6UTU3IVdDVQz48ydP3Z/Pge
 YZ6SR9Sj7+73o9vmHv4JdXccXwCVcNWiRJJXfOPLaU010TY0vw==
X-Google-Smtp-Source: ABdhPJxcuyMPHuz3RT7RRJD234eggZ4GCOSwBDp7tCEvVpntXbijLoSuT8C44xvcJuxdkHusqs1wDwa5dBlSFQ6Tcb4=
X-Received: by 2002:a05:6e02:b46:: with SMTP id
 f6mr1015099ilu.230.1614230570310; 
 Wed, 24 Feb 2021 21:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20210216161924.1687-1-diego.viola@gmail.com>
 <CAAVeFuLLw+pb-vvxPbbgDGGLo4Vi-ReJAh_YH-3xUZEDyhDb-Q@mail.gmail.com>
 <CACAvsv43MhF2JUUhLbxk+aaMkforpF1bvggyfJR=MOnv3wMCfA@mail.gmail.com>
In-Reply-To: <CACAvsv43MhF2JUUhLbxk+aaMkforpF1bvggyfJR=MOnv3wMCfA@mail.gmail.com>
From: Diego Viola <diego.viola@gmail.com>
Date: Thu, 25 Feb 2021 02:22:39 -0300
Message-ID: <CA+ToGPHOb46YRJmKbEUXv9hqo0fjeGxPQEoQiWniX7WUuVJypA@mail.gmail.com>
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

Hi Ben,

I can confirm that your last two patches[0][1] fix the timeout issues
(those from a normal boot and from suspend/resume).

[0] https://github.com/skeggsb/linux/commit/90224a17437b1f39dbecbb385567c1fce958f992
[1] https://github.com/skeggsb/linux/commit/0ee6dc49601359042fd254bbd8ba6b4685b4d0d7

Tested-by: Diego Viola <diego.viola@gmail.com>

on both patches.

Thanks, I appreciate it a lot.

Diego

On Wed, Feb 24, 2021 at 6:50 AM Ben Skeggs <skeggsb@gmail.com> wrote:
>
> On Wed, 17 Feb 2021 at 13:30, Alexandre Courbot <gnurou@gmail.com> wrote:
> >
> > On Wed, Feb 17, 2021 at 1:20 AM Diego Viola <diego.viola@gmail.com> wrote:
> > >
> > > This code times out on GP108, probably because the BIOS puts it into a
> > > bad state.
> > >
> > > Since we reset the PMU on driver load anyway, we are at no risk from
> > > missing a response from it since we are not waiting for one to begin
> > > with.
> >
> > This looks safe to me, provided indeed that the PMU's reset is not
> > called outside of initialization (which for GP108 is shouldn't be
> > IIRC?).
> ISTR that the PMU FW we use prior to GM200 might depend on that being there.
>
> I've posted a proposed alternate fix here[1], as we probably shouldn't
> have been touching PMU there anyway on those GPUs.
>
> Ben.
>
> [1] https://github.com/skeggsb/linux/commit/90224a17437b1f39dbecbb385567c1fce958f992
>
> >
> > >
> > > Signed-off-by: Diego Viola <diego.viola@gmail.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> > > index a0fe607c9c07..5c802f2d00cb 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> > > @@ -102,12 +102,8 @@ nvkm_pmu_reset(struct nvkm_pmu *pmu)
> > >         if (!pmu->func->enabled(pmu))
> > >                 return 0;
> > >
> > > -       /* Inhibit interrupts, and wait for idle. */
> > > +       /* Inhibit interrupts. */
> > >         nvkm_wr32(device, 0x10a014, 0x0000ffff);
> > > -       nvkm_msec(device, 2000,
> > > -               if (!nvkm_rd32(device, 0x10a04c))
> > > -                       break;
> > > -       );
> > >
> > >         /* Reset. */
> > >         if (pmu->func->reset)
> > > --
> > > 2.30.1
> > >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
