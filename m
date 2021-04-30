Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1413136FE1D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E916F6F55B;
	Fri, 30 Apr 2021 15:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194026F558
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 15:54:32 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id f24so7419333ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yq5cZPS69GDHfJIQy9ckZyn3IgQsoU+yfKcaUj98JGY=;
 b=Mr9CYHpjf9kVnLHJK/WXCvxzq2YgyGWGT9D4pJAnA1Tx7YL8wNam5Q0UJpbn1xmJ+l
 9vxuHLDkcHo/1vPD4JJWoaM9HH+DXeTFh+86zVBzbgcOumB2m67Ejzul3XpdMCkjX9H9
 TjfsSpA0dRkxkFpL0icNCdRqAgl1kOHnQMvWQpHsogScsvJZjksvFgkhZs+oRG6gZCl7
 kjGrxRj/Z8Kb/fdLX1sTvpufSAQnym9F/T9wG95tSgpbsddPdg9OwabzD6fPYgfQ+AxO
 dxTmaCSRPwoC49MV4Eaqg7VSgn8YaBHxuBQyj5/zQhj41HLgjzFrlk0c8/PpsKlDVw3C
 N71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yq5cZPS69GDHfJIQy9ckZyn3IgQsoU+yfKcaUj98JGY=;
 b=GH3ociE7kA2Mj/xhO5zJKbGyS5SSGL7jkDjWv5tfSFGlKTiaBDhc1880+NINIYFqaQ
 tuZwazynr5Gu3R7gScAOLR1biZ92JDs8KyeDkCfSisXdZ0oVD/HdBl9VLr6VMvT/uBtz
 bvDqGAWhER2l4XtL0hp+vxhuJdinwN/jnvv28PSNI0TnvNJAOu4RN0DdIhTvJ9htnhWB
 ZaXdzi5Ruqv7F91zzVbPa0F7gNuGQ/1vAXab51uvbJailRcvv5FENECy+YXzuFKNrMYy
 RLuCY0wCMTfSXQqkOs6yqzcFlAZh3cttONS/bPH5qzuQjOG4TlTe4e7tpXKCMqlQWMF2
 HvOQ==
X-Gm-Message-State: AOAM531faL7sLKrFDJ3GUiEcRUWxiVFjMHGZmHuufLE4t3v/Pkna8ECW
 Br34TLTSg5BK5GEqYylbeUMaHoQjpE+UR6HT69bbpA==
X-Google-Smtp-Source: ABdhPJwtlpDwFrf8xCfgVP/60guHnzg3gi3Om4Svu4L1vxnyJIOOr9CvUkZg1S07jrguoFdetN2dRDua5zR/XF2W0v8=
X-Received: by 2002:a17:906:dc90:: with SMTP id
 cs16mr5104704ejc.210.1619798070464; 
 Fri, 30 Apr 2021 08:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-10-jason@jlekstrand.net>
 <YIk14zVfa8Mw4rUF@phenom.ffwll.local>
 <6b388d4d-1d50-94f3-344a-5b6b3639e8ad@linux.intel.com>
 <YIlrCmvC10oAiRcL@phenom.ffwll.local>
 <27db8ded-3b17-748e-f602-a8c1aef7367f@linux.intel.com>
 <CAOFGe94czhE=SHZLOWmH6vPRs1ujhsP9BBxc6i+N_bkPZ+6UHw@mail.gmail.com>
 <8a1e496c-683d-0a26-03a7-14993ba82acf@linux.intel.com>
 <CAOFGe97mDV4RqgWSQTKq5jhGJEMCT+QAwNsoDduD-rRmd=1nBw@mail.gmail.com>
 <e1ae064c-6eec-85f5-e267-5987929da7d9@linux.intel.com>
In-Reply-To: <e1ae064c-6eec-85f5-e267-5987929da7d9@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 30 Apr 2021 10:54:19 -0500
Message-ID: <CAOFGe954d0rPLJ89+xWzatusQ_kKU4Dkk--irtwSxs4ezyuq7A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 09/21] drm/i915/gem: Disallow creating
 contexts with too many engines
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 6:40 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 29/04/2021 20:16, Jason Ekstrand wrote:
> > On Thu, Apr 29, 2021 at 3:01 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >> On 28/04/2021 18:09, Jason Ekstrand wrote:
> >>> On Wed, Apr 28, 2021 at 9:26 AM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>> On 28/04/2021 15:02, Daniel Vetter wrote:
> >>>>> On Wed, Apr 28, 2021 at 11:42:31AM +0100, Tvrtko Ursulin wrote:
> >>>>>>
> >>>>>> On 28/04/2021 11:16, Daniel Vetter wrote:
> >>>>>>> On Fri, Apr 23, 2021 at 05:31:19PM -0500, Jason Ekstrand wrote:
> >>>>>>>> There's no sense in allowing userspace to create more engines than it
> >>>>>>>> can possibly access via execbuf.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >>>>>>>> ---
> >>>>>>>>      drivers/gpu/drm/i915/gem/i915_gem_context.c | 7 +++----
> >>>>>>>>      1 file changed, 3 insertions(+), 4 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>>>>> index 5f8d0faf783aa..ecb3bf5369857 100644
> >>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>>>>> @@ -1640,11 +1640,10 @@ set_engines(struct i915_gem_context *ctx,
> >>>>>>>>                      return -EINVAL;
> >>>>>>>>              }
> >>>>>>>> -  /*
> >>>>>>>> -   * Note that I915_EXEC_RING_MASK limits execbuf to only using the
> >>>>>>>> -   * first 64 engines defined here.
> >>>>>>>> -   */
> >>>>>>>>              num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
> >>>>>>>
> >>>>>>> Maybe add a comment like /* RING_MASK has not shift, so can be used
> >>>>>>> directly here */ since I had to check that :-)
> >>>>>>>
> >>>>>>> Same story about igt testcases needed, just to be sure.
> >>>>>>>
> >>>>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>>>>
> >>>>>> I am not sure about the churn vs benefit ratio here. There are also patches
> >>>>>> which extend the engine selection field in execbuf2 over the unused
> >>>>>> constants bits (with an explicit flag). So churn upstream and churn in
> >>>>>> internal (if interesting) for not much benefit.
> >>>>>
> >>>>> This isn't churn.
> >>>>>
> >>>>> This is "lock done uapi properly".
> >>>
> >>> Pretty much.
> >>
> >> Still haven't heard what concrete problems it solves.
> >>
> >>>> IMO it is a "meh" patch. Doesn't fix any problems and will create work
> >>>> for other people and man hours spent which no one will ever properly
> >>>> account against.
> >>>>
> >>>> Number of contexts in the engine map should not really be tied to
> >>>> execbuf2. As is demonstrated by the incoming work to address more than
> >>>> 63 engines, either as an extension to execbuf2 or future execbuf3.
> >>>
> >>> Which userspace driver has requested more than 64 engines in a single context?
> >>
> >> No need to artificially limit hardware capabilities in the uapi by
> >> implementing a policy in the kernel. Which will need to be
> >> removed/changed shortly anyway. This particular patch is work and
> >> creates more work (which other people who will get to fix the fallout
> >> will spend man hours to figure out what and why broke) for no benefit.
> >> Or you are yet to explain what the benefit is in concrete terms.
> >
> > You keep complaining about how much work it takes and yet I've spent
> > more time replying to your e-mails on this patch than I spent writing
> > the patch and the IGT test.  Also, if it takes so much time to add a
> > restriction, then why are we spending time figuring out how to modify
> > the uAPI to allow you to execbuf on a context with more than 64
> > engines?  If we're worried about engineering man-hours, then limiting
> > to 64 IS the pragmatic solution.
>
> a)
>
> Question of what problem does the patch fix is still unanswered.
>
> b)
>
> You miss the point. I'll continue in the next paragraph..
>
> >
> >> Why don't you limit it to number of physical engines then? Why don't you
> >> filter out duplicates? Why not limit the number of buffer objects per
> >> client or global based on available RAM + swap relative to minimum
> >> object size? Reductio ad absurdum yes, but illustrating the, in this
> >> case, a thin line between "locking down uapi" and adding too much policy
> >> where it is not appropriate.
> >
> > All this patch does is say that  you're not allowed to create a
> > context with more engines than the execbuf API will let you use.  We
> > already have an artificial limit.  All this does is push the error
> > handling further up the stack.  If someone comes up with a mechanism
> > to execbuf on engine 65 (they'd better have an open-source user if it
> > involves changing API), I'm very happy for them to bump this limit at
> > the same time.  It'll take them 5 minutes and it'll be something they
> > find while writing the IGT test.
>
> .. no it won't take five minutes.
>
> If I need to spell everything out - you will put this patch in, which
> fixes nothing, and it will propagate to the internal kernel at some
> point. Then a bunch of tests will start failing in a strange manner.
> Which will result in people triaging them, then assigning them, then
> reserving machines, setting them up, running the repro, then digging
> into the code, and eventually figuring out what happened.

So we have internal patches for more than 64 engines and corresponding
tests?  If so, I repeat the question I asked 3-4 e-mails ago, "What
userspace is requesting this?"  If it's some super-secret thing, feel
free to tell me via internal e-mail but I doubt it is.  If there is no
userspace requesting this and it's just kernel people saying "Ah!  We
should improve this API!" then the correct answer is that those
patches and corresponding tests should be deleted from DII.  It's
extra delta from upstream for no point.

> It will take hours not five minutes. And there will likely be multiple
> bug reports which most likely won't be joined so mutliple people will be
> doing multi hour debug. All for nothing. So it is rather uninteresting
> how small the change is. Interesting part is how much pointless effort
> it will create across the organisation.

Yes, "5 minutes" was a bit glib.  In practice, if this runs through
the usual triage process, it'll take someone somewhere a lot more
time.  However, if someone tries to pull this patch series into DII
and isn't pulling in the IGT changes ahead of time and carefully
looking at every patch and looking out for these issues, this is the
smallest of the problems it will cause.  Doesn't mean that this patch
won't cause additional work but in the grand scheme of things, it's
small.

> Of course you may not care that much about that side of things, or you
> are just not familiar in how it works in practice since you haven't been
> involved in the past years. I don't know really, but I have to raise the
> point it makes no sense to do this. Cost vs benefit is simply not nearly
> there.

I do care.  But, to a certain extent, some of that is just a cost we
have to pay.  For the last 2-3 years we've been off architecting in
the dark and building a giant internal tree with hundreds of patches
on top of upstream.  Some of that delta is necessary for new hardware.
Some of it could have been avoided had we done TTM earlier.  Some of
it is likely cases where someone did something just because it seemed
like a good idea and never bothered to try and upstream it.  Upstream
needs to be allowed to move forward, as unfettered as possible.  If
there wasn't a good reason to put it in DII in the first place, then
it existing in DII isn't a good reason to block upstream.

Again, if you can give me a use-case or a user, this whole
conversation ends.  If not, delete the patch from DII and we move on.

--Jason

> >>> Also, for execbuf3, I'd like to get rid of contexts entirely and have
> >>> engines be their own userspace-visible object.  If we go this
> >>> direction, you can have UINT32_MAX of them.  Problem solved.
> >>
> >> Not the problem I am pointing at though.
> >
> > You listed two ways that accessing engine 65 can happen: Extending
> > execbuf2 and adding a new execbuf3.  When/if execbuf3 happens, as I
> > pointed out above, it'll hopefully be a non-issue.  If someone extends
> > execbuf2 to support more than 64 engines and does not have a userspace
> > customer that wants said new API change, I will NAK the patch.  If
> > you've got a 3rd way that someone can get at engine 65 such that this
> > is a problem, I'd love to hear about it.
>
> It's ever so easy to take a black and white stance but the world is more
> like shades of grey. I too am totally perplexed why we have to spend
> time arguing on a inconsequential patch.
>
> Context create is not called "create execbuf2 context" so why be so
> wedded to adding execbuf2 restrictions into it I have no idea. If you
> were fixing some vulnerability or something I'd understand but all I've
> heard so far is along the lines of "This is proper locking down of uapi
> - end of". And endless waste of time discussion follows

To me, it's not just locking down the API.  It's defensive design and
moving the error condition further to the front.  If a client tries to
create a context with 65 engines and use engine 64, they will fail
today.  They won't fail when they create the context, they'll fail
when they try to execbuf on it.  Assuming, that is, that they actually
get a failure and not just a wrap-around to the wrong context.  By
moving the error earlier, we're doing the user a service by preventing
them from getting into a bad situation.

No, it's not called "execbuf2 context" but, given that execbuf2 is the
only way to do any work on a context, it might as well be.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
