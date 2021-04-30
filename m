Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BED36FB2F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 15:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026DA6E492;
	Fri, 30 Apr 2021 13:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B346E6E488
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 13:08:01 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 y14-20020a056830208eb02902a1c9fa4c64so27841410otq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xTdgjZkcZvluSV+BHOGmzugr3rwAzaVe2Go9aqqc698=;
 b=lPCMkYPLFbyqF0t7dkM1MZiVUm8F20lwygWgtWMUpX6h4fn3UtiqwVy7eiIGBnkfaw
 AF82PBd8kbcvCBavfwshyjqRpNRQXRocM/tomBDJsssZ5Auvl3yjWZB9F4u/r6GsLo3F
 l5Ol6NzaFnAShNtAilDh24Q3uNONlZf74Inh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xTdgjZkcZvluSV+BHOGmzugr3rwAzaVe2Go9aqqc698=;
 b=RVmvztP3ZDFuPpTmbI7t0ytSE2UAHZ5qcHQc1lOBMvyxeTOwim5VkLy4XatXohBfZb
 UD/0U+3IVbdoeQuWvlju3B3sHZf9bS+aOpEGQSKfLAhIzIMyRFq9c2fjzfB/Ksh9Fkw0
 lqUn+RgHrU+e8/4VtlCcVzEatt/WdqZUL2WGj/dp+txn0j5Neq8ccSntWel8ZaFUdKVL
 N9mJfnyOJCOLmhKwSxDlB54Nij2ed9XqDNqd1MCrr79Cyv7RIDNHszAdQLXO+Xf9qd/x
 7fZzZRGtJfnN2LrNtq1xp/ItSzDidbQRmBLlWwrejs0V952oSSMz2qYTHbZQv/PcNRJc
 mU0A==
X-Gm-Message-State: AOAM532y+iTjOFRz7x03do7B881LFB/d9HgI8KPbOUPavYwMJusvXO+V
 P5R44q8c+ycsMqy5N5zv81voM60HmN6ZiNOX73Ce5A==
X-Google-Smtp-Source: ABdhPJwPsuNSCHyJ6HftPVkuFpec0/i8SlEqJDkpgni0CoEdd3pwqimNvHSwTZ0Hvx0spHxpsn81DBphwfvC0AbUyCI=
X-Received: by 2002:a9d:10a:: with SMTP id 10mr3636090otu.188.1619788081031;
 Fri, 30 Apr 2021 06:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-17-jason@jlekstrand.net>
 <YIrWB3fX3TseroSh@phenom.ffwll.local>
 <CAOFGe97b_LSGfrLo3LBhBuvx8wduVJLf0ySC=gG7Z+L6v2dPzQ@mail.gmail.com>
 <YIsBSRwNGiiF/kxE@phenom.ffwll.local>
 <CAOFGe97qi=jB+MGPtJyX-QYmjvTe2QPeijsNCeJ2z+E19x6ZNg@mail.gmail.com>
 <YIsD8OSFdLnjz5cL@phenom.ffwll.local>
 <CAOFGe96DXzFVX77f5qVMrCzJq2Cuco1pOyCfYmo_1v6rmxpMKg@mail.gmail.com>
 <CAKMK7uGzAGDS97hoj0xjzw8EJoPZazsLF=wxUz90cswjPSHthQ@mail.gmail.com>
 <1eb8d34d-463e-3199-cdb0-0dff95e17f7b@linux.intel.com>
 <CAKMK7uGHaoMxcaye=ij0-jYE041+xUVneQv6a_J88dgFOh=hiQ@mail.gmail.com>
 <e224426b-a76e-fe8f-7d51-1bb4c811711c@linux.intel.com>
In-Reply-To: <e224426b-a76e-fe8f-7d51-1bb4c811711c@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 30 Apr 2021 15:07:49 +0200
Message-ID: <CAKMK7uH=BAib9MNSEhxruHQKKqshxgPSRR0+2yvSde-_qtJMVQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 16/21] drm/i915/gem: Delay context creation
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 2:44 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
>
> On 30/04/2021 13:30, Daniel Vetter wrote:
> > On Fri, Apr 30, 2021 at 1:58 PM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >> On 30/04/2021 07:53, Daniel Vetter wrote:
> >>> On Thu, Apr 29, 2021 at 11:35 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >>>>
> >>>> On Thu, Apr 29, 2021 at 2:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>>>>
> >>>>> On Thu, Apr 29, 2021 at 02:01:16PM -0500, Jason Ekstrand wrote:
> >>>>>> On Thu, Apr 29, 2021 at 1:56 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>>>>>> On Thu, Apr 29, 2021 at 01:16:04PM -0500, Jason Ekstrand wrote:
> >>>>>>>> On Thu, Apr 29, 2021 at 10:51 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>>>>>>>>> +     ret = set_proto_ctx_param(file_priv, pc, args);
> >>>>>>>>>
> >>>>>>>>> I think we should have a FIXME here of not allowing this on some future
> >>>>>>>>> platforms because just use CTX_CREATE_EXT.
> >>>>>>>>
> >>>>>>>> Done.
> >>>>>>>>
> >>>>>>>>>> +     if (ret == -ENOTSUPP) {
> >>>>>>>>>> +             /* Some params, specifically SSEU, can only be set on fully
> >>>>>>>>>
> >>>>>>>>> I think this needs a FIXME: that this only holds during the conversion?
> >>>>>>>>> Otherwise we kinda have a bit a problem me thinks ...
> >>>>>>>>
> >>>>>>>> I'm not sure what you mean by that.
> >>>>>>>
> >>>>>>> Well I'm at least assuming that we wont have this case anymore, i.e.
> >>>>>>> there's only two kinds of parameters:
> >>>>>>> - those which are valid only on proto context
> >>>>>>> - those which are valid on both (like priority)
> >>>>>>>
> >>>>>>> This SSEU thing looks like a 3rd parameter, which is only valid on
> >>>>>>> finalized context. That feels all kinds of wrong. Will it stay? If yes
> >>>>>>> *ugh* and why?
> >>>>>>
> >>>>>> Because I was being lazy.  The SSEU stuff is a fairly complex param to
> >>>>>> parse and it's always set live.  I can factor out the SSEU parsing
> >>>>>> code if you want and it shouldn't be too bad in the end.
> >>>>>
> >>>>> Yeah I think the special case here is a bit too jarring.
> >>>>
> >>>> I rolled a v5 that allows you to set SSEU as a create param.  I'm not
> >>>> a huge fan of that much code duplication for the SSEU set but I guess
> >>>> that's what we get for deciding to "unify" our context creation
> >>>> parameter path with our on-the-fly parameter path....
> >>>>
> >>>> You can look at it here:
> >>>>
> >>>> https://gitlab.freedesktop.org/jekstrand/linux/-/commit/c805f424a3374b2de405b7fc651eab551df2cdaf#474deb1194892a272db022ff175872d42004dfda_283_588
> >>>
> >>> Hm yeah the duplication of the render engine check is a bit annoying.
> >>> What's worse, if you tthrow another set_engines on top it's probably
> >>> all wrong then. The old thing solved that by just throwing that
> >>> intel_context away.
> >>>
> >>> You're also not keeping the engine id in the proto ctx for this, so
> >>> there's probably some gaps there. We'd need to clear the SSEU if
> >>> userspace puts another context there. But also no userspace does that.
> >>>
> >>> Plus cursory review of userspace show
> >>> - mesa doesn't set this
> >>> - compute sets its right before running the batch
> >>> - media sets it as the last thing of context creation
> >>
> >> Noticed a long sub-thread so looked inside..
> >>
> >> SSEU is a really an interesting one.
> >>
> >> For current userspace limiting to context creation is fine, since it is
> >> only allowed for Icelake/VME use case. But if you notice the comment inside:
> >>
> >>                  /* ABI restriction - VME use case only. */
> >>
> >> It is a hint there was, or could be, more to this uapi than that.
> >>
> >> And from memory I think limiting to creation time will nip the hopes
> >> media had to use this dynamically on other platforms in the bud. So not
> >> that good really. They had convincing numbers what gets significantly
> >> better if we allowed dynamic control to this, just that as always, open
> >> source userspace was not there so we never allowed it. However if you
> >> come up with a new world order where it can only be done at context
> >> creation, as said already, the possibility for that improvement (aka
> >> further improving the competitive advantage) is most likely dashed.
> >
> > Hm are you sure that this is create-time only? media-driver uses it
> > like that, but from my checking compute-runtime updates SSEU mode
> > before every execbuf call. So it very much looked like we have to keep
> > this dynamic.
>
> Ah okay, I assumed it's more of the overall drive to eliminate
> set_param. If sseu set_param stays then it's fine for what I had in mind.
>
> > Or do you mean this is defacto dead code? this = compute setting it
> > before every batch I mean here.
>
> No idea, wasn't aware of the compute usage.
>
> Before every execbuf is not very ideal though since we have to inject a
> foreign context operation to update context image, which means stream of
> work belonging to the context cannot be coalesced (assuming it could to
> start with). There is also a hw cost to reconfigure the sseu which adds
> latency on top.

They filter out no-op changes. I just meant that from look at
compute-runtime, it seems like sseu can change whenever.
-Daniel

> Anyway, I was only aware of the current media usage, which is static as
> you say, and future/wishlist media usage, which would be dynamic, but a
> complicated story to get right (partly due downsides mentioned in the
> previous paragraph mean balancing benefit vs cost of dynamic sseu is not
> easy).
>
> Regards,
>
> Tvrtko



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
