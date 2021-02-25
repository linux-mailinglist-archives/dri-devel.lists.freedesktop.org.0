Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D28953249A3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 05:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A3D898BE;
	Thu, 25 Feb 2021 04:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8F4898BE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 04:05:09 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id a7so4443163iok.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 20:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XD17gQa9AzXjPB2+GwY8mzC45sraIQo5gpXDP4ure1o=;
 b=bPb6mNiXnQc/cPMp9kwbrwkLzyQHc606ZvE4kAzY3fqBNnKzWdh2eoI/6JO3Q7H1mr
 dWFjQTo23H3mLPbhxV0YC1GqpUAM13cfIQ5j9h0mjwjSFtylke6BtT8fAA4MsRwwg7qm
 joaFjTJUJp2mi/x0JFuiTrIaDQhGJUtO6jHGpufvQfyxD7bLQQYY1ju1cfn/W8tUQ/lJ
 5YOg1pW6UVaG1+N/+40KDOyUWtmD9/dEX8n+4csH2s9dh2AlZ82n2QxObfoNPYcQfzd8
 BQWHuMYDRVjh5zOGmRDZbD14hTH8GbtKyW1e5k2X0a7R6P+8Q7deEZbnGe7lzffm1fPN
 hHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XD17gQa9AzXjPB2+GwY8mzC45sraIQo5gpXDP4ure1o=;
 b=azfTM10ThF4b7lUZ2F41RCVkNNUQ03GNUbnJ62BnyM104x33rB3oQqkrn7eJK7hJdt
 AchgcXSgrzS8FmLaTHAL9sehpBBxcOI7QkOn0qwNFKZrUsCNFKCVP/5lwBNSro2Jn800
 I594xQ7oi21vg2C6jUwOAVYUV5wOjtAYcFIJYs4vRVnucEQLUAokBt6Vz+owSNpGp0S8
 nsJPrYNyyQxZA2ugPanT0oUFZWoLJZ9wJ6KCE7LfTMfUrFoXnP1NuIQfg4deobu057gx
 k/lvlm37P+bq4nwa3WbxDuX55PjERF6s+aT/aZcclo5h3oKZ+zTYyJ8hLKqdYxOyiBb6
 6oOw==
X-Gm-Message-State: AOAM532WKuVaGN4jnMMiNKUNFOLsJC96A1RekApkiIbb0ktrO9lFLNtd
 6BDlPSVMWUOiSi0wjEbrof8ogElJCUeiQoUa33Y=
X-Google-Smtp-Source: ABdhPJxMw5BHpEmnhuE/5xT/Q0PWhkJj1c6h9DIQ2pkBnQBM5DiitsjnA+siDqMH3cEe40ib+U+JwvYOdG2wbS350PM=
X-Received: by 2002:a5e:dd0c:: with SMTP id t12mr1064581iop.50.1614225908176; 
 Wed, 24 Feb 2021 20:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20210216161924.1687-1-diego.viola@gmail.com>
 <CAAVeFuLLw+pb-vvxPbbgDGGLo4Vi-ReJAh_YH-3xUZEDyhDb-Q@mail.gmail.com>
 <CACAvsv43MhF2JUUhLbxk+aaMkforpF1bvggyfJR=MOnv3wMCfA@mail.gmail.com>
In-Reply-To: <CACAvsv43MhF2JUUhLbxk+aaMkforpF1bvggyfJR=MOnv3wMCfA@mail.gmail.com>
From: Diego Viola <diego.viola@gmail.com>
Date: Thu, 25 Feb 2021 01:04:57 -0300
Message-ID: <CA+ToGPErqo46Eu_ryzBb9nOAw4FKyhUD5sd9xciBqn231n=9Mw@mail.gmail.com>
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

I tested your patch and can confirm that the timeout is gone after
booting my system, but unfortunately it's back after doing a
suspend/resume.

Any ideas about that?

Thanks,
Diego
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
