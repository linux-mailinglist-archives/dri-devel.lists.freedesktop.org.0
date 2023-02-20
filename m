Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB469D1F7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 18:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D10A10E272;
	Mon, 20 Feb 2023 17:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6914110E269;
 Mon, 20 Feb 2023 17:14:37 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id bq17so1957028oib.8;
 Mon, 20 Feb 2023 09:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cLzVwAEjokWdmIFhw9weWJSdyvEOd3i/Dj9HmQ0145k=;
 b=aFdBO1af/5ZismMesXlA9FcRBRD3ucS0ZB3hca/lC7qRMM7JMKPut7gdokl5FNCcLR
 JF5oPPhUsxwQOi/mZhOHzE6X41ew0Aq7W9dGEJAy6WpNXKPvmxiplOKU8RpfqAzLNdaK
 bgHjaBfoilqyyE5TYayIrBklc7x35OJvXCe51TShkPOMoKfemCPeqU1QwcqxU7AaBvr2
 YO5DspMF7EdUSohByaeG085kqqnKIQsOQYbd1KcrRjsrXeAO7+LiGBcv65UaZ3TjKjdK
 QlMu0ozMSokG52bfifLuN6Mdcgd23nN7fzz1vKkBwUguuH8ThbrW0ABQnj4H0hsxojZN
 txmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cLzVwAEjokWdmIFhw9weWJSdyvEOd3i/Dj9HmQ0145k=;
 b=BgB6PtuA4dd2mmwr7HsRumHH0k0Mc3UcGE7lZKQZmRpO085lqaySy+oyjcXHCfpZ/H
 h0MaapdWfwTS1jrJRZwxecRSgymf0PBeWyGo98K5mpVFygax6wmVT3BNe36bEMYTn7rX
 wElHyeLySUWKc5+qiJcA1c2LWj9mErRsyIInBuEEL3XtjDTZj/nkOsXI6+OAHgLTMAY3
 wwJ+GStmb4orDQfGjNpE2VPuKyrxv3SmBRyzRl5tQKvYtZJeCRHg8bI875f3+A95ge7O
 RoUcxQUEYQU3CJkDCRQ9gOFq8A4SPiw+7nr9cWk3BeTHJgbj/PXoGAIQ63iOj2YIXGJE
 KgcQ==
X-Gm-Message-State: AO0yUKV0I+HyXnFqaZ/v50hxtxRdY964hQIQou4T2xprOJb4GGabul80
 Wz+n16rDQWRrw0OUFTM6C4XWCE3L4iaWzLQH0r17y4Mn
X-Google-Smtp-Source: AK7set+DdhPgGTijbryHc48WL440EVq6tWuDqE1uPGv4cMt8F0RZWwyzGwRN8t6tchycctGvkk2GE0rKkc19Nh67TFk=
X-Received: by 2002:a05:6808:ec7:b0:364:c0a5:1fcf with SMTP id
 q7-20020a0568080ec700b00364c0a51fcfmr1118511oiv.58.1676913276623; Mon, 20 Feb
 2023 09:14:36 -0800 (PST)
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
 <f20cbde9-1c81-e52f-4509-3e771fe4a7fa@linux.intel.com>
In-Reply-To: <f20cbde9-1c81-e52f-4509-3e771fe4a7fa@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Feb 2023 09:14:26 -0800
Message-ID: <CAF6AEGv6ezoHSuA=T73h9eF0JbWJqZErc2eCA0wu8TepzCye+w@mail.gmail.com>
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

On Mon, Feb 20, 2023 at 8:51 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 20/02/2023 16:44, Tvrtko Ursulin wrote:
> >
> > On 20/02/2023 15:52, Rob Clark wrote:
> >> On Mon, Feb 20, 2023 at 3:33 AM Tvrtko Ursulin
> >> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>
> >>>
> >>> On 17/02/2023 20:45, Rodrigo Vivi wrote:
> >
> > [snip]
> >
> >>> Yeah I agree. And as not all media use cases are the same, as are not
> >>> all compute contexts someone somewhere will need to run a series of
> >>> workloads for power and performance numbers. Ideally that someone would
> >>> be the entity for which it makes sense to look at all use cases, from
> >>> server room to client, 3d, media and compute for both. If we could get
> >>> the capability to run this in some automated fashion, akin to CI, we
> >>> would even have a chance to keep making good decisions in the future.
> >>>
> >>> Or we do some one off testing for this instance, but we still need a
> >>> range of workloads and parts to do it properly..
> >>>
> >>>>> I also think the "arms race" scenario isn't really as much of a
> >>>>> problem as you think.  There aren't _that_ many things using the GPU
> >>>>> at the same time (compared to # of things using CPU).   And a lot of
> >>>>> mobile games throttle framerate to avoid draining your battery too
> >>>>> quickly (after all, if your battery is dead you can't keep buying loot
> >>>>> boxes or whatever).
> >>>>
> >>>> Very good point.
> >>>
> >>> On this one I still disagree from the point of view that it does not
> >>> make it good uapi if we allow everyone to select themselves for priority
> >>> handling (one flavour or the other).
> >>
> >> There is plenty of precedent for userspace giving hints to the kernel
> >> about scheduling and freq mgmt.  Like schedutil uclamp stuff.
> >> Although I think that is all based on cgroups.
> >
> > I knew about SCHED_DEADLINE and that it requires CAP_SYS_NICE, but I did
> > not know about uclamp. Quick experiment with uclampset suggests it
> > indeed does not require elevated privilege. If that is indeed so, it is
> > good enough for me as a precedent.
> >
> > It appears to work using sched_setscheduler so maybe could define
> > something similar in i915/xe, per context or per client, not sure.
> >
> > Maybe it would start as a primitive implementation but the uapi would
> > not preclude making it smart(er) afterwards. Or passing along to GuC to
> > do it's thing with it.
>
> Hmmm having said that, how would we fix clvk performance using that? We
> would either need the library to do a new step when creating contexts,
> or allow external control so outside entity can do it. And then the
> question is based on what it decides to do it? Is it possible to know
> which, for instance, Chrome tab will be (or is) using clvk so that tab
> management code does it?

I am not sure.. the clvk usage is, I think, not actually in chrome
itself, but something camera related?

Presumably we could build some cgroup knobs to control how the driver
reacts to the "deadline" hints (ie. ignore them completely, or impose
some upper limit on how much freq boost will be applied, etc).  I
think this sort of control of how the driver responds to hints
probably fits best with cgroups, as that is how we are already
implementing similar tuning for cpufreq/sched.  (Ie. foreground app or
tab gets moved to a different cgroup.)  But admittedly I haven't
looked too closely at how cgroups work on the kernel side.

BR,
-R

> Regards,
>
> Tvrtko
>
> >> In the fence/syncobj case, I think we need per-wait hints.. because
> >> for a single process the driver will be doing both housekeeping waits
> >> and potentially urgent waits.  There may also be some room for some
> >> cgroup or similar knobs to control things like what max priority an
> >> app can ask for, and whether or how aggressively the kernel responds
> >> to the "deadline" hints.  So as far as "arms race", I don't think I'd
> >
> > Per wait hints are okay I guess even with "I am important" in their name
> > if sched_setscheduler allows raising uclamp.min just like that. In which
> > case cgroup limits to mimick cpu uclamp also make sense.
> >
> >> change anything about my "fence deadline" proposal.. but that it might
> >> just be one piece of the overall puzzle.
> >
> > That SCHED_DEADLINE requires CAP_SYS_NICE does not worry you?
> >
> > Regards,
> >
> > Tvrtko
