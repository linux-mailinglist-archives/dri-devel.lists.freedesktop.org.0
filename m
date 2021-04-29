Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7DF36F02A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1276E2E1;
	Thu, 29 Apr 2021 19:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD6E6E500
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 19:17:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id j28so15877487edy.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eIC8M6IL/ou732ZPdfiIpNrSNDycEPi1eZMZv4RXVF4=;
 b=GNngvPf9C/MSWvql+4B6rRIS/eGEEF0RclaClXcemei4YB2wdHTt1SAWmP6a+E8v0M
 57Wg2v/YqDeIqEMpw7ND2+Yq5eTIU/ksXRlzUMVpTM1USmOR2r/GxLMe/R/heNzIH3Cy
 XIcfL/knNTEMOPmR79mVfKxlPx4QS8mt86RpQ94jntNT4xPktScg4cIazeUmUz0MmR3z
 pKsSL1b0XcpH3QZM2l0IaM3qOQfhkpOgpdZuwQATu199/6o2eKG8ouv/IaMRqkqJYQsp
 9XSo6ecHZqAXcqNuJ0LBO+CFeRncShdCbOk/wSlU7OT+jncob0u/aiFK+OW4aDZR/njJ
 Lx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eIC8M6IL/ou732ZPdfiIpNrSNDycEPi1eZMZv4RXVF4=;
 b=CyzpvvVmqJbchJ+9Zfg84fLK7ncgmOm2eNAPuP++WrVlDSJzKTuCVTgHP+EaLmNtqK
 9EQKZ9ZZmAcq0Kxz7fdJ22i2MZ0mXwYNArm743ue0asq9WIpYTyqqh+5nKD2+fp7qO/r
 wkJEcpzTaFkH5KujlM7xFk5a0EiUO67+x62iAccvD8gKa4ECKvSCaFeN1psSvTueIvHm
 MGRorp2QxSqG6hGw9F5mROi0/Mo2OR+BHVvgIlOF7wwVcPKOifDe6GjG3yX+Ui4KUAt7
 eQnJ/LW6zDT2NhPfDnfho38QvEBBWlgn7PvCJwTQ6Mv/5zbpBeyutZjLEP+aNct+chrc
 ecNg==
X-Gm-Message-State: AOAM530/tHpn1h8z+vpcw+XX923lc7kZz7/pjYa0FbrcVaIF0eoWgZ50
 ImPXDHvn9irdNOevxh5gVMRjU4kEsZZ4UbzreOKKyg==
X-Google-Smtp-Source: ABdhPJyc9GyFfE3B7NfBKfJOG7ODbJDwkcd4/9nil3SVC2B5nqgD/T36uSsI3mzB0qFrOSctk7UBnwUSPvjgpyaw6WE=
X-Received: by 2002:a05:6402:b88:: with SMTP id
 cf8mr1387187edb.227.1619723825796; 
 Thu, 29 Apr 2021 12:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-10-jason@jlekstrand.net>
 <YIk14zVfa8Mw4rUF@phenom.ffwll.local>
 <6b388d4d-1d50-94f3-344a-5b6b3639e8ad@linux.intel.com>
 <YIlrCmvC10oAiRcL@phenom.ffwll.local>
 <27db8ded-3b17-748e-f602-a8c1aef7367f@linux.intel.com>
 <CAOFGe94czhE=SHZLOWmH6vPRs1ujhsP9BBxc6i+N_bkPZ+6UHw@mail.gmail.com>
 <8a1e496c-683d-0a26-03a7-14993ba82acf@linux.intel.com>
In-Reply-To: <8a1e496c-683d-0a26-03a7-14993ba82acf@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 29 Apr 2021 14:16:54 -0500
Message-ID: <CAOFGe97mDV4RqgWSQTKq5jhGJEMCT+QAwNsoDduD-rRmd=1nBw@mail.gmail.com>
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

On Thu, Apr 29, 2021 at 3:01 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 28/04/2021 18:09, Jason Ekstrand wrote:
> > On Wed, Apr 28, 2021 at 9:26 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >> On 28/04/2021 15:02, Daniel Vetter wrote:
> >>> On Wed, Apr 28, 2021 at 11:42:31AM +0100, Tvrtko Ursulin wrote:
> >>>>
> >>>> On 28/04/2021 11:16, Daniel Vetter wrote:
> >>>>> On Fri, Apr 23, 2021 at 05:31:19PM -0500, Jason Ekstrand wrote:
> >>>>>> There's no sense in allowing userspace to create more engines than it
> >>>>>> can possibly access via execbuf.
> >>>>>>
> >>>>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/i915/gem/i915_gem_context.c | 7 +++----
> >>>>>>     1 file changed, 3 insertions(+), 4 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>>> index 5f8d0faf783aa..ecb3bf5369857 100644
> >>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>>> @@ -1640,11 +1640,10 @@ set_engines(struct i915_gem_context *ctx,
> >>>>>>                     return -EINVAL;
> >>>>>>             }
> >>>>>> -  /*
> >>>>>> -   * Note that I915_EXEC_RING_MASK limits execbuf to only using the
> >>>>>> -   * first 64 engines defined here.
> >>>>>> -   */
> >>>>>>             num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
> >>>>>
> >>>>> Maybe add a comment like /* RING_MASK has not shift, so can be used
> >>>>> directly here */ since I had to check that :-)
> >>>>>
> >>>>> Same story about igt testcases needed, just to be sure.
> >>>>>
> >>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>>
> >>>> I am not sure about the churn vs benefit ratio here. There are also patches
> >>>> which extend the engine selection field in execbuf2 over the unused
> >>>> constants bits (with an explicit flag). So churn upstream and churn in
> >>>> internal (if interesting) for not much benefit.
> >>>
> >>> This isn't churn.
> >>>
> >>> This is "lock done uapi properly".
> >
> > Pretty much.
>
> Still haven't heard what concrete problems it solves.
>
> >> IMO it is a "meh" patch. Doesn't fix any problems and will create work
> >> for other people and man hours spent which no one will ever properly
> >> account against.
> >>
> >> Number of contexts in the engine map should not really be tied to
> >> execbuf2. As is demonstrated by the incoming work to address more than
> >> 63 engines, either as an extension to execbuf2 or future execbuf3.
> >
> > Which userspace driver has requested more than 64 engines in a single context?
>
> No need to artificially limit hardware capabilities in the uapi by
> implementing a policy in the kernel. Which will need to be
> removed/changed shortly anyway. This particular patch is work and
> creates more work (which other people who will get to fix the fallout
> will spend man hours to figure out what and why broke) for no benefit.
> Or you are yet to explain what the benefit is in concrete terms.

You keep complaining about how much work it takes and yet I've spent
more time replying to your e-mails on this patch than I spent writing
the patch and the IGT test.  Also, if it takes so much time to add a
restriction, then why are we spending time figuring out how to modify
the uAPI to allow you to execbuf on a context with more than 64
engines?  If we're worried about engineering man-hours, then limiting
to 64 IS the pragmatic solution.

> Why don't you limit it to number of physical engines then? Why don't you
> filter out duplicates? Why not limit the number of buffer objects per
> client or global based on available RAM + swap relative to minimum
> object size? Reductio ad absurdum yes, but illustrating the, in this
> case, a thin line between "locking down uapi" and adding too much policy
> where it is not appropriate.

All this patch does is say that  you're not allowed to create a
context with more engines than the execbuf API will let you use.  We
already have an artificial limit.  All this does is push the error
handling further up the stack.  If someone comes up with a mechanism
to execbuf on engine 65 (they'd better have an open-source user if it
involves changing API), I'm very happy for them to bump this limit at
the same time.  It'll take them 5 minutes and it'll be something they
find while writing the IGT test.

> > Also, for execbuf3, I'd like to get rid of contexts entirely and have
> > engines be their own userspace-visible object.  If we go this
> > direction, you can have UINT32_MAX of them.  Problem solved.
>
> Not the problem I am pointing at though.

You listed two ways that accessing engine 65 can happen: Extending
execbuf2 and adding a new execbuf3.  When/if execbuf3 happens, as I
pointed out above, it'll hopefully be a non-issue.  If someone extends
execbuf2 to support more than 64 engines and does not have a userspace
customer that wants said new API change, I will NAK the patch.  If
you've got a 3rd way that someone can get at engine 65 such that this
is a problem, I'd love to hear about it.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
