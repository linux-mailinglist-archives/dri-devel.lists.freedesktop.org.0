Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4746D3466B8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE57A6EC5A;
	Tue, 23 Mar 2021 17:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72EC6EB86
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:50:34 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so20278403ota.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rXvUsdbNXzHyLk1/BNNOwZVwfRfSWQXYX4uJxFpoCqw=;
 b=SBSKgCBEIYmod0KcNcbBfYt4aHUuSehP9+S+INdtj/GM90Zkjr2uBxQTkRS78goyI2
 m8az9HeOp4RzOXpfd7deFDW7aa8FVxKpWAEFaYwdBtojmj88aW3UKVk5kIkPzZdJ1SxY
 iSdm42hsSQjiclr+9zxWPa6+VdQkF2N1rs85AjcIne8NmGyi0k+eiYWp+eEk6YSr1p6K
 4LtoMTqjNffm/ShS/mTnt7/id/zTqyHJhISPmrOLfh2AwwRld6/zgko4/oiJagF1lQFs
 WkK008PD1wHgYeb80Lo5Ur87Ef3MCyIGQ9CkCm7J8Fvys9bZkchwRCxvP6OWhnEu9COd
 RXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rXvUsdbNXzHyLk1/BNNOwZVwfRfSWQXYX4uJxFpoCqw=;
 b=BBe/e+SBMQZsSA1iQZc/aNfw/bn24m1cdqIIsvq3WmbMqbdtKqAZspOWver2Xkcu+P
 5NOmBrrgpKNjtU8Vi84oph+WwWEsrKUnpSG6QCceDebdpGIFsNAJaMgls9hl1D2woKEG
 D/FGkb+05lecx3+xgtwtJcNYQIh3OFImm4kCeVLCCrFbxQN7IO/biKf3EEd38cBs0ROZ
 azdMZI0CLx/21oUm24qmwfe+mdbmW4J5uLEJR+osuYsM23y6o3/oi+q0Gq0BEw3zTW5f
 +nnN7+JU7kuwsqLf8l+tptXU/pz9a1yEcK+f1oYA6Fr0e9nyvi/3xPkVqy/6fFa4EQd/
 K4rA==
X-Gm-Message-State: AOAM531Nx+7kgVzDBjzqNxmV+bl+IvtRWPJNMgGWj/wRYPCcl19LhhBR
 EUxs9yvD15c44Xq7BboXXD/SGqpafa2tELJV0yNQ+w==
X-Google-Smtp-Source: ABdhPJzgmBmjHFWdZMEgU8r22Owi+e7cFfrPOOEJVc2LW9vYIEJjELLwMHCSF5Vy/qOlYayS5LRLIh5YcTp6yi/ySPk=
X-Received: by 2002:a05:6830:558:: with SMTP id
 l24mr5478593otb.209.1616521833933; 
 Tue, 23 Mar 2021 10:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-4-jason@jlekstrand.net>
 <7918db68-835c-b416-6187-1e62892ce5ed@linux.intel.com>
 <YFilKSbKYd+0HbCn@phenom.ffwll.local>
 <d83162e2-4b9e-c7e9-5324-6612bb9561d6@linux.intel.com>
 <CAKMK7uG0GLPu+auqDgMgD7ugvWo3E7W7DL6eALKxmp6hk-aZiA@mail.gmail.com>
 <fb406aca-1211-e1e5-b6a0-830c26d327ae@linux.intel.com>
 <CAKMK7uEf5p+UJNtr0sBRRjegn=88Pr=BCYhGpTy_J1hpRspk7Q@mail.gmail.com>
 <c2cab688-5e54-078b-7eed-7437ec2377e0@linux.intel.com>
 <YFnr1iNxXnNCyhgf@phenom.ffwll.local>
 <97366f4f-f2e3-8e5c-0250-83e3cdd108e2@linux.intel.com>
In-Reply-To: <97366f4f-f2e3-8e5c-0250-83e3cdd108e2@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 23 Mar 2021 12:50:23 -0500
Message-ID: <CAOFGe97VMNhL5+PYqxaWuxV-66urrPa4ZZk_qQwTVryeeELHVw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Drop the CONTEXT_CLONE API
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 11:23 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 23/03/2021 13:23, Daniel Vetter wrote:
> > On Tue, Mar 23, 2021 at 09:14:36AM +0000, Tvrtko Ursulin wrote:
> >>
> >> On 22/03/2021 16:43, Daniel Vetter wrote:
> >>> On Mon, Mar 22, 2021 at 4:31 PM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>
> >>>>
> >>>> On 22/03/2021 14:57, Daniel Vetter wrote:
> >>>>> On Mon, Mar 22, 2021 at 3:33 PM Tvrtko Ursulin
> >>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 22/03/2021 14:09, Daniel Vetter wrote:
> >>>>>>> On Mon, Mar 22, 2021 at 11:22:01AM +0000, Tvrtko Ursulin wrote:
> >>>>>>>>
> >>>>>>>> On 19/03/2021 22:38, Jason Ekstrand wrote:
> >>>>>>>>> This API allows one context to grab bits out of another context upon
> >>>>>>>>> creation.  It can be used as a short-cut for setparam(getparam()) for
> >>>>>>>>> things like I915_CONTEXT_PARAM_VM.  However, it's never been used by any
> >>>>>>>>> real userspace.  It's used by a few IGT tests and that's it.  Since it
> >>>>>>>>> doesn't add any real value (most of the stuff you can CLONE you can copy
> >>>>>>>>> in other ways), drop it.
> >>>>>>>>
> >>>>>>>> No complaints to remove if it ended up unused outside IGT. Latter is a _big_
> >>>>>>>> problem though, since it is much more that a few IGT tests. So I really
> >>>>>>>> think there really needs to be an evaluation and a plan for that (we don't
> >>>>>>>> want to lose 50% of the coverage over night).
> >>>>>>>>
> >>>>>>>>> There is one thing that this API allows you to clone which you cannot
> >>>>>>>>> clone via getparam/setparam: timelines.  However, timelines are an
> >>>>>>>>> implementation detail of i915 and not really something that needs to be
> >>>>>>>>
> >>>>>>>> Not really true timelines are i915 implementation detail. They are in fact a
> >>>>>>>> dma-fence context:seqno concept, nothing more that than. I think you are
> >>>>>>>> probably confusing struct intel_timeline with the timeline wording in the
> >>>>>>>> uapi. Former is i915 implementation detail, but context:seqno are truly
> >>>>>>>> userspace timelines.
> >>>>>>>
> >>>>>>> I think you're both saying the same thing and talking a bit past each
> >>>>>>> another.
> >>>>>>>
> >>>>>>> Yes the timeline is just a string of dma_fence, that's correct. Now
> >>>>>>> usually if you submit batches with execbuf, we have 3 ways to synchronize
> >>>>>>> concurrent submission: implicit sync, sync_file and drm_syncob. They all
> >>>>>>> map to different needs in different protocols/render apis.
> >>>>>>>
> >>>>>>> Now in one additional case the kernel makes sure that batchbuffers are
> >>>>>>> ordered, and that's when you submit them to the same hw ctx. Because
> >>>>>>> there's only 1 hw context and you really can't have batchbuffers run on
> >>>>>>> that single hw context out of order. That's what the timeline object we
> >>>>>>> talk about here is. But that largely is an internal implementation detail,
> >>>>>>> which happens to also use most/all the same infrastructure as the
> >>>>>>> dma_fence uapi pieces above.
> >>>>>>>
> >>>>>>> Now the internal implementation detail leaking here is that we exposed
> >>>>>>> this to userspace, without there being any need for this. What Jason
> >>>>>>> implements with syncobj in the next patch is essentially what userspace
> >>>>>>> should have been using for cross-engine sync. media userspace doesn't care
> >>>>>>> about interop with winsys/client apis, so they equally could have used
> >>>>>>> implicit sync or sync_file here (which I think is the solution now for the
> >>>>>>> new uapi prepped internally), since they all are about equally powerful
> >>>>>>> for stringing batchbuffers together.
> >>>>>>
> >>>>>> Are you saying we exposed a single timeline of execution per hw context
> >>>>>> via the single timeline flag?!
> >>>>>
> >>>>> Nope.
> >>>>>
> >>>>>> Timelines of execution were always exposed. Any "engine" (ring
> >>>>>> previously) in I915_EXEC_RING_MASK was a single timeline of execution.
> >>>>>> It is completely the same with engine map engines, which are also
> >>>>>> different indices into I915_EXEC_RING_MASK space.
> >>>>>>
> >>>>>> Userspace was aware of these timelines forever as well. Media was
> >>>>>> creating multiple contexts to have multiple timelines (so parallelism).
> >>>>>> Everyone knew that engine-hopping submissions needs to be either
> >>>>>> implicitly or explicitly synchronised, etc.
> >>>>>
> >>>>> Yup, I think we're saying the same thing here.
> >>>>>
> >>>>>> So I really don't see that we have leaked timelines as a concept *now*.
> >>>>>> What the patch has exposed to userspace is a new way to sync between
> >>>>>> timelines and nothing more.
> >>>>>
> >>>>> We've leaked it as something you can now share across hw context.
> >>>>
> >>>> Okay so we agree on most things but apparently have different
> >>>> definitions of what it means to leak internal implementation details.
> >>>>
> >>>> While at the same time proof that we haven't leaked the internal
> >>>> implementation details is that Jason was able to implement the single
> >>>> timeline flag with a drm syncobj at the execbuf top level. (Well mostly,
> >>>> ignoring the probably inconsequential difference of one vs multiple
> >>>> fence contexts.)
> >>>
> >>> It's not a matching implementation. It's only good enough for what
> >>> media needs, and essentially what media should have done to begin
> >>> with.
> >>>
> >>> There's substantially different behaviour between SINGLE_TIMELINE and
> >>> what Jason has done here when you race concurrent execbuf calls:
> >>> Former guarantees total ordering, the latter doesn't even try. They
> >>> are not the same thing, but luckily userspace doesn't care about that
> >>> difference.
> >>
> >> Sounds like a very important difference to stress in the commit message.
> >>
> >> Secondly, I am unclear whether we have agreement on whether the single
> >> timeline flag is leaking implementation details of the execlists scheduler
> >> to userspace or not?
> >
> > I do think Jason&me agree on that it does leak an internal concept to
> > userspace that we shouldn't leak.
> >
> > I'm honestly not entirely understanding your argument for why
> > single_timeline isn't an internal concept somehow, and how exposing it to
> > userspace doesn't leak that concept to userspace. Whether internally that
> > concept is now perfectly represented by just struct intel_timeline, or
> > maybe more the seqno/hswp, or more diffused through the code doesn't
> > really change that we have an internal concept that we're now exposing for
> > sharing in ways that wasn't possible before.
>
> Don't know, obviously we think with very different paradigms.
>
> GEM context always had as many timelines as there are engines in it's
> map so multiple timelines is the default mode everyone is aware of.
>
> Single timeline flag added a new mode where instead of multiple
> timelines single GEM context becomes a single timeline.
>
> The fact that userspace can achieve the single timeline execution on its
> own should be an argument enough that it is not a new concept that got
> leaked out. Definitely not any backend specific implementation details.
> It simply added a new feature which may or may not have been needed.

I just commented on the SINGLE_TIMELINE patch and will send the v3
momentarily.  I think you'll find the commit message much more to your
liking. :-)

--Jason

> Regards,
>
> Tvrtko
>
> P.S.
> Or rename the flag in your mind to "I915_GEM_CONTEXT_SERIAL_EXECUTION"
> or something and see if that still leaks the timeline or some
> implementation details.
>
> P.P.S Keep in mind I am arguing on wording in single timeline flag
> removal. Removal of timeline cloning is not controversial.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
