Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C48345F8F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FFC6E8A3;
	Tue, 23 Mar 2021 13:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177E26E8A3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 13:23:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b9so20761072wrt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5LNwVGo2JfdYYDu+UqyLlQQXc0p8gS/kb24bTlSb2vQ=;
 b=BerUZMuvqFDev6lmR1p2JDW+6R3cYG6TJ7zt3tIDLAHGQxljea3e4255NBPil9eUzW
 /dI3wm7dMo9yFbM4Eq/gRb/UFPW2jr5KWJ8f8Ao/9Sir1AnEH5KNDRoRIyNHKF4RKmar
 OUdAdDwUGEBc4Tjw4Lr6x5G/uO9OvzDJdsb4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5LNwVGo2JfdYYDu+UqyLlQQXc0p8gS/kb24bTlSb2vQ=;
 b=RTgUSEtMUwICV5RXQ1CBIlhOANonQQHShubldDRZ9CquosgK06FVNjS2CUDIpIulaR
 IYR5qsaCSJIJu6hSlxKUTvG4UbvsPbQ+Bq+Wckjo42W9aoMDAAs1r2eYMA8mYZFlMHsf
 G2PnAUfMoV58ZxnmO08fDU3ngshKpc9ST3VyjVOXcP+Y7Ks91oQG/zmnYtx009pTvsvV
 1AKDeZ0FVHpP7hN9wqdV3DI+Uo0gQX4Gevx/0gkoXVp1i1FN8JW+IrqQFE/Z7tnhIGmq
 sBP7n3v9oY2AhKlNWx0qibjGToWDWVfVJVOkl1Vl1RiW3a8qjoWbJOZ9dfZtJchK6M0W
 SN4g==
X-Gm-Message-State: AOAM532k1/qPe3paqGhT6Q6npEQYufc74QqyfHsr/LHlk9Fk+fdVQr31
 C6mpVcItBSchXLV6LC0ztJbV2w==
X-Google-Smtp-Source: ABdhPJxjHNDP5XhmFtnF+V6LCIydneunJQp24NbMr8l654Ml7pWwf5MZK0HIAI+0kdgDipMsOjwjNg==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr4126933wrt.18.1616505817776;
 Tue, 23 Mar 2021 06:23:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm23141151wrv.25.2021.03.23.06.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:23:36 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:23:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Drop the CONTEXT_CLONE API
Message-ID: <YFnr1iNxXnNCyhgf@phenom.ffwll.local>
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-4-jason@jlekstrand.net>
 <7918db68-835c-b416-6187-1e62892ce5ed@linux.intel.com>
 <YFilKSbKYd+0HbCn@phenom.ffwll.local>
 <d83162e2-4b9e-c7e9-5324-6612bb9561d6@linux.intel.com>
 <CAKMK7uG0GLPu+auqDgMgD7ugvWo3E7W7DL6eALKxmp6hk-aZiA@mail.gmail.com>
 <fb406aca-1211-e1e5-b6a0-830c26d327ae@linux.intel.com>
 <CAKMK7uEf5p+UJNtr0sBRRjegn=88Pr=BCYhGpTy_J1hpRspk7Q@mail.gmail.com>
 <c2cab688-5e54-078b-7eed-7437ec2377e0@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2cab688-5e54-078b-7eed-7437ec2377e0@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 09:14:36AM +0000, Tvrtko Ursulin wrote:
> 
> On 22/03/2021 16:43, Daniel Vetter wrote:
> > On Mon, Mar 22, 2021 at 4:31 PM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> > > 
> > > 
> > > On 22/03/2021 14:57, Daniel Vetter wrote:
> > > > On Mon, Mar 22, 2021 at 3:33 PM Tvrtko Ursulin
> > > > <tvrtko.ursulin@linux.intel.com> wrote:
> > > > > 
> > > > > 
> > > > > On 22/03/2021 14:09, Daniel Vetter wrote:
> > > > > > On Mon, Mar 22, 2021 at 11:22:01AM +0000, Tvrtko Ursulin wrote:
> > > > > > > 
> > > > > > > On 19/03/2021 22:38, Jason Ekstrand wrote:
> > > > > > > > This API allows one context to grab bits out of another context upon
> > > > > > > > creation.  It can be used as a short-cut for setparam(getparam()) for
> > > > > > > > things like I915_CONTEXT_PARAM_VM.  However, it's never been used by any
> > > > > > > > real userspace.  It's used by a few IGT tests and that's it.  Since it
> > > > > > > > doesn't add any real value (most of the stuff you can CLONE you can copy
> > > > > > > > in other ways), drop it.
> > > > > > > 
> > > > > > > No complaints to remove if it ended up unused outside IGT. Latter is a _big_
> > > > > > > problem though, since it is much more that a few IGT tests. So I really
> > > > > > > think there really needs to be an evaluation and a plan for that (we don't
> > > > > > > want to lose 50% of the coverage over night).
> > > > > > > 
> > > > > > > > There is one thing that this API allows you to clone which you cannot
> > > > > > > > clone via getparam/setparam: timelines.  However, timelines are an
> > > > > > > > implementation detail of i915 and not really something that needs to be
> > > > > > > 
> > > > > > > Not really true timelines are i915 implementation detail. They are in fact a
> > > > > > > dma-fence context:seqno concept, nothing more that than. I think you are
> > > > > > > probably confusing struct intel_timeline with the timeline wording in the
> > > > > > > uapi. Former is i915 implementation detail, but context:seqno are truly
> > > > > > > userspace timelines.
> > > > > > 
> > > > > > I think you're both saying the same thing and talking a bit past each
> > > > > > another.
> > > > > > 
> > > > > > Yes the timeline is just a string of dma_fence, that's correct. Now
> > > > > > usually if you submit batches with execbuf, we have 3 ways to synchronize
> > > > > > concurrent submission: implicit sync, sync_file and drm_syncob. They all
> > > > > > map to different needs in different protocols/render apis.
> > > > > > 
> > > > > > Now in one additional case the kernel makes sure that batchbuffers are
> > > > > > ordered, and that's when you submit them to the same hw ctx. Because
> > > > > > there's only 1 hw context and you really can't have batchbuffers run on
> > > > > > that single hw context out of order. That's what the timeline object we
> > > > > > talk about here is. But that largely is an internal implementation detail,
> > > > > > which happens to also use most/all the same infrastructure as the
> > > > > > dma_fence uapi pieces above.
> > > > > > 
> > > > > > Now the internal implementation detail leaking here is that we exposed
> > > > > > this to userspace, without there being any need for this. What Jason
> > > > > > implements with syncobj in the next patch is essentially what userspace
> > > > > > should have been using for cross-engine sync. media userspace doesn't care
> > > > > > about interop with winsys/client apis, so they equally could have used
> > > > > > implicit sync or sync_file here (which I think is the solution now for the
> > > > > > new uapi prepped internally), since they all are about equally powerful
> > > > > > for stringing batchbuffers together.
> > > > > 
> > > > > Are you saying we exposed a single timeline of execution per hw context
> > > > > via the single timeline flag?!
> > > > 
> > > > Nope.
> > > > 
> > > > > Timelines of execution were always exposed. Any "engine" (ring
> > > > > previously) in I915_EXEC_RING_MASK was a single timeline of execution.
> > > > > It is completely the same with engine map engines, which are also
> > > > > different indices into I915_EXEC_RING_MASK space.
> > > > > 
> > > > > Userspace was aware of these timelines forever as well. Media was
> > > > > creating multiple contexts to have multiple timelines (so parallelism).
> > > > > Everyone knew that engine-hopping submissions needs to be either
> > > > > implicitly or explicitly synchronised, etc.
> > > > 
> > > > Yup, I think we're saying the same thing here.
> > > > 
> > > > > So I really don't see that we have leaked timelines as a concept *now*.
> > > > > What the patch has exposed to userspace is a new way to sync between
> > > > > timelines and nothing more.
> > > > 
> > > > We've leaked it as something you can now share across hw context.
> > > 
> > > Okay so we agree on most things but apparently have different
> > > definitions of what it means to leak internal implementation details.
> > > 
> > > While at the same time proof that we haven't leaked the internal
> > > implementation details is that Jason was able to implement the single
> > > timeline flag with a drm syncobj at the execbuf top level. (Well mostly,
> > > ignoring the probably inconsequential difference of one vs multiple
> > > fence contexts.)
> > 
> > It's not a matching implementation. It's only good enough for what
> > media needs, and essentially what media should have done to begin
> > with.
> > 
> > There's substantially different behaviour between SINGLE_TIMELINE and
> > what Jason has done here when you race concurrent execbuf calls:
> > Former guarantees total ordering, the latter doesn't even try. They
> > are not the same thing, but luckily userspace doesn't care about that
> > difference.
> 
> Sounds like a very important difference to stress in the commit message.
> 
> Secondly, I am unclear whether we have agreement on whether the single
> timeline flag is leaking implementation details of the execlists scheduler
> to userspace or not?

I do think Jason&me agree on that it does leak an internal concept to
userspace that we shouldn't leak.

I'm honestly not entirely understanding your argument for why
single_timeline isn't an internal concept somehow, and how exposing it to
userspace doesn't leak that concept to userspace. Whether internally that
concept is now perfectly represented by just struct intel_timeline, or
maybe more the seqno/hswp, or more diffused through the code doesn't
really change that we have an internal concept that we're now exposing for
sharing in ways that wasn't possible before.
-Daniel

> Regards,
> 
> Tvrtko
> 
> > 
> > Aside, just to make sure this wont get lost: I do agree that we should
> > only allow this up to maybe ADL, and reject it on anything new (maybe
> > including dg1 while we're at it, since the pci ids for that aren't
> > even close to upstream yet).
> > -Daniel
> > 
> > > > Which is possible because of how it's internally implemented (I think
> > > > load balancer relies on that), but not really a synchronization
> > > 
> > > Virtual engine is a single timeline by definition and it is still that
> > > regardless of the implementation details (execlists or GuC, in both
> > > cases it is a single hardware context and a single timeline).
> > > 
> > > > primitive we want to export as such to userspace. We have other
> > > > interfaces and concepts for that.
> > > 
> > > Yes, that is the only point to argue IMO. We can say it wasn't needed
> > > and should have been avoided, but I still maintain we can't really say
> > > we leaked anything backend specific to userspace via it.
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > 
> > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
