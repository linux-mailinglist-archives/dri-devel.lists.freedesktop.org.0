Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6620869D1E0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 18:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4294E10E716;
	Mon, 20 Feb 2023 17:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DED10E703;
 Mon, 20 Feb 2023 17:07:34 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1720ea61e29so1860053fac.12; 
 Mon, 20 Feb 2023 09:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6+c6yVEI50BDixiDB9XraGiheD7HZXbfaTAPQnoB+Vc=;
 b=f5wdj0rWOYF3nmFVq4vDzcPnjamNg979XFTjPKeibaZt+WPvPaYvN+pYqXyZw7Hga4
 BuisXMVxH3rwcQsveF6Dt+zPfseDmtVogUyYsbsS8/BKhSbwDqVAZaHDphea7p/qpoTK
 yA6QcnTy0vduSIr6gMSILkOoXHhbZQNMku2CmTNS3ApW/4liOkMVPg3qbpuYOzlx3nog
 uVqzYJEV8Y3BuSq95wnRgU/gUI5tmoa79tmiTsvkKWhfMyz37vVpThpem4LaniaA9bZf
 RuobiZKMjTPZ5C1s1MLJxUi11+7O4nApYTW+6MbN9qCE1m5NQWemNRszfpLaeBTDhAA9
 s2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6+c6yVEI50BDixiDB9XraGiheD7HZXbfaTAPQnoB+Vc=;
 b=SuiTAUmuIHO/ww5BhG55V026A5NJ2jYhboW71nZG/EegtRQyb4RDbDMoAqOK70gZv4
 NgV58/mpXdXM0UHtNPlt+lnwO/0MMSQVl46qsdQ9YFWugs19GuVWxT3AfnQZ6qREEFNq
 gKNJvTHe1l1dOYHxSfZPFvN1hCC5CiX6w144K7Xw5SjnQTjW84z8c568xX2k3SMbNj4i
 sq/qFssx1iWYi0dPcHgXzehnPi3jZqSrzocFt4c7SkqyOXt8pIDZ0wtFa/yFo1Kul1wL
 fE2x16LAgV5+P/eIC6Qh3dxIgb5yAOlLEbj2uOjljGGoGOX+OpzfwMCsATPyhU4i7FfJ
 bdsg==
X-Gm-Message-State: AO0yUKUU9Y8awueC9wzQaGhz0mMjOmTbXty4cjH8nlYy3RQgHXlKlzRT
 KT9SfmfEgCfbzYATDRIasepGNT9lglKIoo/JGXI=
X-Google-Smtp-Source: AK7set8k17pKDYs1JnU3CpyPYZCMzAmmAlSrLh5Xc7MRGRhV8Evi88VMFPnwVrfIAaM7irW49z4LdjjLa3QdIvXctY0=
X-Received: by 2002:a05:6870:32d4:b0:16e:5e5a:49da with SMTP id
 r20-20020a05687032d400b0016e5e5a49damr1198223oac.58.1676912853693; Mon, 20
 Feb 2023 09:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <Y+5zyeSncSbsXHWG@intel.com>
 <7e059e8c-41c3-b56c-26c8-c0e2230616b1@linux.intel.com>
 <CAF6AEGuN2dv+Lsk3R43oPRA9c8ZoMjzCCKR+L41wNT8Sc3TgsQ@mail.gmail.com>
 <c0663648-5567-2d7a-43b1-dfa043109051@linux.intel.com>
 <CAF6AEGsGqjbL_tA8x_xwygBccKMP2DTbSy-B5_dEakpQVep8vg@mail.gmail.com>
 <Y+/ndNIu/kYGiVh5@intel.com>
 <6832ba1a-c6b0-4631-3b4e-bfcd31d8b59c@linux.intel.com>
 <CAF6AEGsEq7Pyc6PMenPjufLDzw5VFtLPjZwOXim71DN5J5TcJw@mail.gmail.com>
 <43aff648-df2d-4fa2-356c-b74f5e3a92e7@linux.intel.com>
In-Reply-To: <43aff648-df2d-4fa2-356c-b74f5e3a92e7@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Feb 2023 09:07:23 -0800
Message-ID: <CAF6AEGuSPUeS2zquNn_s78z7tjAwyy0CXJjgo13rp_AYHuBg2g@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 20, 2023 at 8:44 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 20/02/2023 15:52, Rob Clark wrote:
> > On Mon, Feb 20, 2023 at 3:33 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 17/02/2023 20:45, Rodrigo Vivi wrote:
>
> [snip]
>
> >> Yeah I agree. And as not all media use cases are the same, as are not
> >> all compute contexts someone somewhere will need to run a series of
> >> workloads for power and performance numbers. Ideally that someone would
> >> be the entity for which it makes sense to look at all use cases, from
> >> server room to client, 3d, media and compute for both. If we could get
> >> the capability to run this in some automated fashion, akin to CI, we
> >> would even have a chance to keep making good decisions in the future.
> >>
> >> Or we do some one off testing for this instance, but we still need a
> >> range of workloads and parts to do it properly..
> >>
> >>>> I also think the "arms race" scenario isn't really as much of a
> >>>> problem as you think.  There aren't _that_ many things using the GPU
> >>>> at the same time (compared to # of things using CPU).   And a lot of
> >>>> mobile games throttle framerate to avoid draining your battery too
> >>>> quickly (after all, if your battery is dead you can't keep buying loot
> >>>> boxes or whatever).
> >>>
> >>> Very good point.
> >>
> >> On this one I still disagree from the point of view that it does not
> >> make it good uapi if we allow everyone to select themselves for priority
> >> handling (one flavour or the other).
> >
> > There is plenty of precedent for userspace giving hints to the kernel
> > about scheduling and freq mgmt.  Like schedutil uclamp stuff.
> > Although I think that is all based on cgroups.
>
> I knew about SCHED_DEADLINE and that it requires CAP_SYS_NICE, but I did
> not know about uclamp. Quick experiment with uclampset suggests it
> indeed does not require elevated privilege. If that is indeed so, it is
> good enough for me as a precedent.
>
> It appears to work using sched_setscheduler so maybe could define
> something similar in i915/xe, per context or per client, not sure.
>
> Maybe it would start as a primitive implementation but the uapi would
> not preclude making it smart(er) afterwards. Or passing along to GuC to
> do it's thing with it.
>
> > In the fence/syncobj case, I think we need per-wait hints.. because
> > for a single process the driver will be doing both housekeeping waits
> > and potentially urgent waits.  There may also be some room for some
> > cgroup or similar knobs to control things like what max priority an
> > app can ask for, and whether or how aggressively the kernel responds
> > to the "deadline" hints.  So as far as "arms race", I don't think I'd
>
> Per wait hints are okay I guess even with "I am important" in their name
> if sched_setscheduler allows raising uclamp.min just like that. In which
> case cgroup limits to mimick cpu uclamp also make sense.
>
> > change anything about my "fence deadline" proposal.. but that it might
> > just be one piece of the overall puzzle.
>
> That SCHED_DEADLINE requires CAP_SYS_NICE does not worry you?

This gets to why the name "fence deadline" is perhaps not the best..
it really isn't meant to be analogous to SCHED_DEADLINE, but rather
just a hint to the driver about what userspace is doing.  Maybe we
just document it more strongly as a hint?

BR,
-R

> Regards,
>
> Tvrtko
