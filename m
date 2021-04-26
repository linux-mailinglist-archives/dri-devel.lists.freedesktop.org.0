Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D929236B5A4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 17:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1206E83A;
	Mon, 26 Apr 2021 15:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AFC6E835
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 15:22:33 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id zg3so3418761ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 08:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THfQT9sSuBB1ts1GzB0cs5toJ/Am/MCJiMUt8Jd6Df8=;
 b=A1K1UxAn0T2qup5GdLp1rF7DC60YP594y7L2KdNeINYzD+NgjmGnooKBQcTZZ32yww
 rEYN9rNkA/PDlLaJsByP1P3MrcwhdjnEyJXv+2VSSnha7PTs9z7Ez38wzeBBcmg3SU5e
 Nj2fq/dAdSTb+I6APi7dfjL8Bg8WJzqHcMiGJTMiCVuHyhqeYcWPaa86GmYA4fGrP7yM
 m8+ZtkPnY8ZWpAHcNEBUXpAAaYMry6qeM55am3jxOY8GwQMkFTl5cfnhqJfY939FVUSV
 wZZtO9O7dFmn/keFSrSbZIBQ8uGMTLm4kmwLX17om9vvqWrfCQqrURjUAa0vEeoO0/OW
 jBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THfQT9sSuBB1ts1GzB0cs5toJ/Am/MCJiMUt8Jd6Df8=;
 b=c435JyStAq+wuAkSeEBaTpWLthzrmv/PoziHyCJHyMNwNtRI15vltVwXV6bzGvE0Li
 GfNjY10V1KITCGhc+zXaj3aAtyvesD1ncuFRc3lpToN+Dr3Wdhkgx3K6d159J50v8xoy
 GkzC3+EisQsjSH7LLmha9beyOo6xzZabB51HLfNFVDlxQ++aaCYU6JGRscYuns+h3DAe
 hxQF47lcZNGAxGT32UZnLS2ueRThoYQ9XChDqZTXHFFacR1ihLtwIEG6o4me85lgPj68
 K/teEdqH0uAXyOYFbChL24QCPToHAmjchRUkpfmfmoRWeMVLmpWUsd60gGckeS5zEY0l
 dtZA==
X-Gm-Message-State: AOAM533Z80MugZGgFt1QKJoLGKcsGouDwuDT4tN6Lv7ORrkOUZvboH6e
 Ss1i3ijiDefg3s5PF9qswrnLpdXqdunTyTgyObJKFA==
X-Google-Smtp-Source: ABdhPJxi7+HHWMlxSjD1k5PvewlJmWyK/MOz6jb0gUtIHPppCtOloBKrFYnRe+EMFzqdKWl8AMNfqOynPGRUuszKCgM=
X-Received: by 2002:a17:906:dc90:: with SMTP id
 cs16mr18880241ejc.210.1619450552132; 
 Mon, 26 Apr 2021 08:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-4-matthew.auld@intel.com>
 <CAOFGe96QALJa4FbWkVxczTdOA6b41zk1GxdYwRsrP7GwSZ4zvw@mail.gmail.com>
 <6cf790c7-84bf-4d35-c1c3-4cf826655faf@intel.com>
 <CAOFGe95gMUuqXX=Yn_xMRVxQmcwiqNEN0m3PgyNACcm0iNTyKg@mail.gmail.com>
 <5a412489-75ed-e971-0e0b-388f0f964fac@linux.intel.com>
 <CAOFGe97HuFOe08ttq7yyuiTVphjvwRB2542at6uEEb5YX671Rw@mail.gmail.com>
 <db6f3015-654b-17fa-0d72-4339c4ab338d@linux.intel.com>
 <CAOFGe95FqvMnnH82o_uQtffpFNKarB0Gvs+vLkhQ-UKjiXO0Mg@mail.gmail.com>
 <5c572f88-dac8-5b00-e75b-209a772e4082@linux.intel.com>
 <CAOFGe97BCf8YKUkJcXHFumv4aF44N91Y19CX4XUhOcLu-9gWyA@mail.gmail.com>
 <9841933a-e3ae-eabf-bcbe-88602378c88f@linux.intel.com>
 <CAKMK7uG+7we_mtTs7TDDWTecqbzzha8UBPVuhZm0EwrGpiCC7A@mail.gmail.com>
In-Reply-To: <CAKMK7uG+7we_mtTs7TDDWTecqbzzha8UBPVuhZm0EwrGpiCC7A@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Apr 2021 10:22:20 -0500
Message-ID: <CAOFGe96K5KLbXVe8mFSPgg=4-WOXyJx0f6YF6c-aSG+iYh7kog@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH v3 4/4] drm/doc/rfc: i915 DG1 uAPI
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 2:23 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Apr 21, 2021 at 8:28 PM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> > On 21/04/2021 18:17, Jason Ekstrand wrote:
> > > On Wed, Apr 21, 2021 at 9:25 AM Tvrtko Ursulin
> > > <tvrtko.ursulin@linux.intel.com> wrote:
> > >> On 21/04/2021 14:54, Jason Ekstrand wrote:
> > >>> On Wed, Apr 21, 2021 at 3:22 AM Tvrtko Ursulin
> > >>> <tvrtko.ursulin@linux.intel.com> wrote:
> > >>>> On 20/04/2021 18:00, Jason Ekstrand wrote:
> > >>>> I am not claiming to know memory region query will end up the same, and
> > >>>> I definitely agree we cannot guess the future. I am just saying rsvd
> > >>>> fields are inconsequential really in terms of maintenance burden and
> > >>>> have been proven useful in the past. So I disagree with the drive to
> > >>>> kick them all out.
> > >>>
> > >>> Sure, it doesn't cost anything to have extra zeros in the struct.
> > >>> However, if/when the API grows using rsvd fields, we end up with "if
> > >>> CAP_FOO is set, rsvd[5] means blah" which makes for a horribly
> > >>> confusing API.  As a userspace person who has to remember how to use
> > >>> this stuff, I'd rather make another call or chain in a struct than try
> > >>> to remember and/or figure out what all 8 rsvd fields mean.
> > >>
> > >> Well it's not called rsvd in the uapi which is aware of the new field
> > >> but has a new name.
> > >
> > > Are we allowed to do that?  This is a genuine question.  When I've
> > > tried in the past (cliprects), I was told we couldn't rename it even
> > > though literally no one had used it in code for years.
> >
> > Well we did the union for pad_to_size so I thought we are allowed that
> > trick at least. From my experience backward source level compatibility
> > is not always there even with things like glibc. Despite that, are we
> > generally required to stay backward source compatible I will not claim
> > either way.

I'm starting to lose the will to care about this particular bike shed.
I think I'm fine with keeping some RSVD fields as long as:

 1. We're very clear in the docs with flags and caps about what things
are inputs and what things are outputs and how they interact.
Preferably, everything is an output.
 2. If we already know that caps is useless without supported_caps,
let's either add supported_caps in now or throw out both and use some
rsvd for them when they begin to be needed.
 3. We have a plan for how we're going to use them in a
backwards-compatible way.

On 3, it sounds like we have a rough sketch of a plan but I'm still
unclear on some details.  In particular, we have an rsvd[8] at the end
but, if we're going to replace individual bits of it, we can't ever
shorten or re-name that array.  We could, potentially, do

union {
    __u32 rsvd[8];
    struct {
        __u32 new_field;
    };
};

and trust C to put all the fields of our anonymous struct at the top.
Otherwise, we've got to fill out our struct with more rsvd and that
gets to be a mess.

Another option would be to have

__u32 rsvd1;
__u32 rsvd2;
__u32 rsvd3;
/* etc... */

and we can replace them one at a time.

Again, my big point is that I want us to have a PLAN and not end up in
a scenario where we end up with rsvd[5] having magical meaning.  What
I see in DII does not give me confidence.  However, I do believe that
such a plan can exist.

--Jason

> I think the anonymous union with exactly same sized field is ok. We
> also try hard to be source compatible, but we have screwed up in the
> past and shrugged it off. The one example that comes to mind is
> extended structures at the bottom with new field, which the kernel
> automatically zero-extends for old userspace. But when you recompile,
> your new-old userspace might no longer clear the new fields because
> the ioctl code didn't start out by memset()ing the entire struct.

Also, we need to ensure that we memset everything to 0. :-)

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
