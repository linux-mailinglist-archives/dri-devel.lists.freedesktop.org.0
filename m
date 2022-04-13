Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A4B4FF402
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E158510F164;
	Wed, 13 Apr 2022 09:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF54B10F164
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:45:17 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ec04a2ebadso15539627b3.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hSGkeFmhZfCY7bl7ojSYYAKHWJgwDxi7Ir4Ci3tcsLs=;
 b=EHhDC//D1WFuHO2mC3qY0H5LUeqIEu3S+UoBGhJBXAY9T75gVi03ZTpc6bpwcdOr8B
 FY4l8ChOfdKNhMYWjZjTk5egTQV2UDeLZ/ZiG/cEj1guH0XKT6s4JAxStva4dIG77o4N
 UBmjbmgVS3Olp9yG8Qm3xtJQ/96v9m4L9Ua20Nx2jh9Vcq24iZRV6md6Bjq0AcysSSQv
 dwqf1cAQhelarKL0mLJVtIFbFk76jkglip1+0k6qcZon7R5YBFCfwfFM/XbxMEJaXN0h
 0FzdpzvVOODTdh3woz94BbGj3lVQXLWfHQpu1TSkYkRL+QeWDbS36pluipt8gnF3eUux
 hZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hSGkeFmhZfCY7bl7ojSYYAKHWJgwDxi7Ir4Ci3tcsLs=;
 b=ChlNExUvuXC9iEqBiAvgSzlk8H0sCO+esarPgFn5MDEaPxsk8UhKfKvCX2QrB3baLA
 4dETCJ4c4dc9xG8SACMqNs4FPoLumHLfCj62ppUwCrnZNWKF65+0bnK+ot5EFRMyYkOc
 6Yg5IN5nIufWQXi2x7VxugaMxivXwU9gP7fR5HRwJXtpFKc2Bb7NnTtu/BXdg7+BGR/e
 7HFnloPJfAS5Gai+2f1MJ7rv2RKM6OfEFW978acJIVKkuTq09+NNR2PpNUvZzHuWKTcb
 ykFJJJzvVwUvArlJBOWdskECx1lh5niwMn6ePGRqMBsWZhp7/8up0CDtSXjXnEJwSQjJ
 9jjg==
X-Gm-Message-State: AOAM531TMaYhTL8+0vpTRI3XX4TlJKx4/ptIaMUWSatfXHv2/nRGQWcH
 Iw/bFpL/rrI6HuC3buV4cbBzv2jyZw1aHYlBeOqJUN3gnkkj1FCQ
X-Google-Smtp-Source: ABdhPJwCc2DnthjLQRJgg14l5/s7mFdrjCmBRV3wTI5sXrdFwYYDbnc1nLlpoMNz+ntecEZNuhiP0XOW/t8xtziBpJY=
X-Received: by 2002:a81:1187:0:b0:2eb:ee1b:7d00 with SMTP id
 129-20020a811187000000b002ebee1b7d00mr18431819ywr.55.1649843116980; Wed, 13
 Apr 2022 02:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <064d8958-a288-64e1-b2a4-c2302a456d5b@amd.com>
 <a04733af-5ff1-a1b4-527d-68b28a037231@collabora.com>
 <f6de2b9a-005f-d1f5-9818-cfbee2bdddc5@amd.com>
 <CAK4VdL3VOtVGi36SY0TEL4P2jW33dM4TOmFXYmewE7cGNhY4Zw@mail.gmail.com>
 <7f0d7ade-1d59-2c43-c1b2-1fa847eb741a@collabora.com>
In-Reply-To: <7f0d7ade-1d59-2c43-c1b2-1fa847eb741a@collabora.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 13 Apr 2022 11:45:05 +0200
Message-ID: <CAK4VdL1b3i4fddp00o6ZLbnK1-5ehoyyYtEhGx8t1DAQmBj=dA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 8:05 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 4/13/22 01:59, Erico Nunes wrote:
> > On Tue, Apr 12, 2022 at 9:41 PM Andrey Grodzovsky
> > <andrey.grodzovsky@amd.com> wrote:
> >>
> >>
> >> On 2022-04-12 14:20, Dmitry Osipenko wrote:
> >>> On 4/12/22 19:51, Andrey Grodzovsky wrote:
> >>>> On 2022-04-11 18:15, Dmitry Osipenko wrote:
> >>>>> Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
> >>>>> mutex when job is released, and thus, that code can sleep. This results
> >>>>> into "BUG: scheduling while atomic" if locks are contented while job is
> >>>>> freed. There is no good reason for releasing scheduler's jobs in IRQ
> >>>>> context, hence use normal context to fix the trouble.
> >>>>
> >>>> I am not sure this is the beast Idea to leave job's sw fence signalling
> >>>> to be
> >>>> executed in system_wq context which is prone to delays of executing
> >>>> various work items from around the system. Seems better to me to leave the
> >>>> fence signaling within the IRQ context and offload only the job freeing or,
> >>>> maybe handle rescheduling to thread context within drivers implemention
> >>>> of .free_job cb. Not really sure which is the better.
> >>> We're talking here about killing jobs when driver destroys context,
> >>> which doesn't feel like it needs to be a fast path. I could move the
> >>> signalling into drm_sched_entity_kill_jobs_cb() and use unbound wq, but
> >>> do we really need this for a slow path?
> >>
> >>
> >> You can't move the signaling back to drm_sched_entity_kill_jobs_cb
> >> since this will bring back the lockdep splat that 'drm/sched: Avoid
> >> lockdep spalt on killing a processes'
> >> was fixing.
> >>
> >> I see your point and i guess we can go this way too. Another way would
> >> be to add to
> >> panfrost and msm job a  work_item and reschedule to thread context from
> >> within their
> >> .free_job callbacks but that probably to cumbersome to be justified here.
> >
> > FWIW since this mentioned individual drivers, commit 'drm/sched: Avoid
> > lockdep spalt on killing a processes' also introduced problems for
> > lima.
> > There were some occurrences in our CI
> > https://gitlab.freedesktop.org/mesa/mesa/-/jobs/20980982/raw .
> > Later I found it also reproducible on normal usage when just closing
> > applications, so it may be affecting users too.
> >
> > I tested this patch and looks like it fixes things for lima.
>
> This patch indeed should fix that lima bug. Feel free to give yours
> tested-by :)

Sure:
Tested-by: Erico Nunes <nunes.erico@gmail.com>

Thanks

Erico
