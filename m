Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706713239DE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 10:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2BD6EA6F;
	Wed, 24 Feb 2021 09:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8C96EA6F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 09:50:33 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id m9so1256790ybk.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 01:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bm8OUtTjcP/3TkU7F1PFj1hpkFAw65wsKNu4InM5dSA=;
 b=ghwVW9pCKdDCdJ2w+KuW98xcoDHpSu8mKT7O8puj6+BGRaaTOLu50cNN6NHfJKU8+M
 gymvKlPEtKqpOYsOIN8Gku2i3S6XqsEWAZLiacVeSFr4UY/Su+KZIor7hmHRR8Yw7Q/0
 Fc1CEWh/oU8WEFJfcWUBQtZr4KhuUXlbmwdsIfqxzvkSWmzm/zTOlRLA0yOiiN8nqyGE
 9XpajQ+xfVqUThQ0o4IyDRlQraZvXBX0J3+VR3rZLBVpBjHcIeCUlUQgmllYBEY+hmXH
 a7YH0pyLrfj6xoWBPuGmnW8AI64pljl5ckhBbqZH69diz2v3NSBGi+RKf4ACGgu7iE5m
 qhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bm8OUtTjcP/3TkU7F1PFj1hpkFAw65wsKNu4InM5dSA=;
 b=sOu+RQ080AnVleLYZ5yfL8t0h+u9n2tjfScX8RFHeKKmX9HddhPnpldbYgD5MKDJaO
 dxlt210hedvVynWCDTmOsAP7duR0qJCp6nrEJk2Ve5MC5rTS4qjbVREV7dyCTT0LnrNO
 OPWIy8Qq6XzyhD1gLmWn5oAiGbUArXTQL/dthDIldl1rKNR1r8JLpDrSt3V8gvKgvPRS
 MCSOEToNuk43tWjc+Ymy1fJpoD5W8AXl60xokLGeChWRMjixtSXHkHZyOp2+Sb7O00oG
 hX8QigCqTDD6FcdcN3u6mmL2hEXmvBLierX82qEj4Z9LahR/j28wEwXmkUMjKL+5sRLy
 D6RA==
X-Gm-Message-State: AOAM533CUyEnE3L5GWD57T9/Vyc2myJr5V4unWCAqbRZXJBXtDzW7+24
 hqkzDpcT2PH7kL3z69/K2bWg80JSSchswMIcehQ=
X-Google-Smtp-Source: ABdhPJzmW7yuMW6jXgJWPEx5Uh7ezt0D71mmBkwTAAytvOkuI+mVWOE04yNfIK2XycFgQMot+cLd0uIH4JzUwIP/Jlo=
X-Received: by 2002:a25:e68c:: with SMTP id d134mr49378328ybh.94.1614160232205; 
 Wed, 24 Feb 2021 01:50:32 -0800 (PST)
MIME-Version: 1.0
References: <20210216161924.1687-1-diego.viola@gmail.com>
 <CAAVeFuLLw+pb-vvxPbbgDGGLo4Vi-ReJAh_YH-3xUZEDyhDb-Q@mail.gmail.com>
In-Reply-To: <CAAVeFuLLw+pb-vvxPbbgDGGLo4Vi-ReJAh_YH-3xUZEDyhDb-Q@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 24 Feb 2021 19:50:21 +1000
Message-ID: <CACAvsv43MhF2JUUhLbxk+aaMkforpF1bvggyfJR=MOnv3wMCfA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau/pmu: fix timeout on GP108
To: Alexandre Courbot <gnurou@gmail.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Roy Spliet <nouveau@spliet.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Diego Viola <diego.viola@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Feb 2021 at 13:30, Alexandre Courbot <gnurou@gmail.com> wrote:
>
> On Wed, Feb 17, 2021 at 1:20 AM Diego Viola <diego.viola@gmail.com> wrote:
> >
> > This code times out on GP108, probably because the BIOS puts it into a
> > bad state.
> >
> > Since we reset the PMU on driver load anyway, we are at no risk from
> > missing a response from it since we are not waiting for one to begin
> > with.
>
> This looks safe to me, provided indeed that the PMU's reset is not
> called outside of initialization (which for GP108 is shouldn't be
> IIRC?).
ISTR that the PMU FW we use prior to GM200 might depend on that being there.

I've posted a proposed alternate fix here[1], as we probably shouldn't
have been touching PMU there anyway on those GPUs.

Ben.

[1] https://github.com/skeggsb/linux/commit/90224a17437b1f39dbecbb385567c1fce958f992

>
> >
> > Signed-off-by: Diego Viola <diego.viola@gmail.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> > index a0fe607c9c07..5c802f2d00cb 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
> > @@ -102,12 +102,8 @@ nvkm_pmu_reset(struct nvkm_pmu *pmu)
> >         if (!pmu->func->enabled(pmu))
> >                 return 0;
> >
> > -       /* Inhibit interrupts, and wait for idle. */
> > +       /* Inhibit interrupts. */
> >         nvkm_wr32(device, 0x10a014, 0x0000ffff);
> > -       nvkm_msec(device, 2000,
> > -               if (!nvkm_rd32(device, 0x10a04c))
> > -                       break;
> > -       );
> >
> >         /* Reset. */
> >         if (pmu->func->reset)
> > --
> > 2.30.1
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
