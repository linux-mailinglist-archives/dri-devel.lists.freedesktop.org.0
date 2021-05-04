Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF29372CCA
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 17:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894376EB1E;
	Tue,  4 May 2021 15:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE526EB1B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 15:11:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u13so8176257edd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=c9ODgwUeNFDb+0iPnyOQYPa9bWFQvqIIWPf/zYHvfPg=;
 b=QKugxlkKFQWjzoKO0SdCNXbdOurpPWPExFXeJURcGd4q7CAHmakcR+5kYEPo20Nv4U
 7DV/+e2ZxPC6L67QT+rq3HUayeYL2ZqkPn1KJId4bZiXTq7gA8LYUCQ7S9rW3cr5epTq
 1+Nb5J8uKxq6D/LWyyuyhd9OEETlStUHpDp8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=c9ODgwUeNFDb+0iPnyOQYPa9bWFQvqIIWPf/zYHvfPg=;
 b=XQtvWGO6JBDeBD9KnySmZYVQB4k7b8uPfK56bW5975psPWsy/deQ8qTe1QTbJ/+b4D
 Te/4phn2Dnnh4O9La1HpQK+ltQBu7p5xUiEw8R/DysUACzhK37J5oLjlTKiQL1fwX14I
 p6ifX5w6xVcj4CBpb6wUqPvJVWy0YMGgvTy8EseU3ujb9r3Txn20Mj/RXkKs0Q42LFEY
 2WdUtGg12NjDSLTAsO1dEphRKhk95myqVHDlSbkUTsHeKhvVGCBSAwFso0JqJP880+Q0
 SLRly0tS2MXLlQc6HWZhfpLK/1jKquOpHvjS+UH7VgQoRzxDIogG0Swsd2mjp0mP7wlI
 3cZg==
X-Gm-Message-State: AOAM5318h/7qvpjiT+q/1Xg9N6t8PB7fzt6+uR3iyxDDIwE+y4RWPyeo
 wIi+g2+JTwk0Ay9IqOss+GZttA==
X-Google-Smtp-Source: ABdhPJyUtncO37gruGFZ3dvvIOlduiryRwtP8szSNngF2tfPOoqCKnyZL5+a0UC/l2Uzh13TPqlK0Q==
X-Received: by 2002:a05:6402:110b:: with SMTP id
 u11mr27683988edv.356.1620141113435; 
 Tue, 04 May 2021 08:11:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id sb20sm1533292ejb.100.2021.05.04.08.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 08:11:52 -0700 (PDT)
Date: Tue, 4 May 2021 17:11:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC] Implicit vs explicit user fence sync
Message-ID: <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
References: <20210504132729.2046-1-christian.koenig@amd.com>
 <YJFXG/THrjXqQjyN@phenom.ffwll.local>
 <d266ccd2-3259-99ce-5fd6-b8ae81ac14e9@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d266ccd2-3259-99ce-5fd6-b8ae81ac14e9@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 04, 2021 at 04:26:42PM +0200, Christian K=F6nig wrote:
> Hi Daniel,
> =

> Am 04.05.21 um 16:15 schrieb Daniel Vetter:
> > Hi Christian,
> > =

> > On Tue, May 04, 2021 at 03:27:17PM +0200, Christian K=F6nig wrote:
> > > Hi guys,
> > > =

> > > with this patch set I want to look into how much more additional work=
 it
> > > would be to support implicit sync compared to only explicit sync.
> > > =

> > > Turned out that this is much simpler than expected since the only
> > > addition is that before a command submission or flip the kernel and
> > > classic drivers would need to wait for the user fence to signal before
> > > taking any locks.
> > It's a lot more I think
> > - sync_file/drm_syncobj still need to be supported somehow
> =

> You need that with explicit fences as well.
> =

> I'm just concentrating on what extra burden implicit sync would get us.

It's not just implicit sync. Currently the best approach we have for
explicit sync is hiding them in drm_syncobj. Because for that all the work
with intentional stall points and userspace submit thread already exists.

None of this work has been done for sync_file. And looking at how much
work it was to get drm_syncobj going, that will be anything but easy.

> > - we need userspace to handle the stall in a submit thread at least
> > - there's nothing here that sets the sync object
> > - implicit sync isn't just execbuf, it's everything. E.g. the various
> >    wait_bo ioctl also need to keep working, including timeout and
> >    everything
> =

> Good point, but that should be relatively easily to add as well.
> =

> > - we can't stall in atomic kms where you're currently stalling, that's =
for
> >    sure. The uapi says "we're not stalling for fences in there", and yo=
u're
> >    breaking that.
> =

> Again as far as I can see we run into the same problem with explicit sync.
> =

> So the question is where could we block for atomic modeset for user fences
> in general?

Nah, I have an idea. But it only works if userspace is aware, because the
rules are essentialyl:

- when you supply a userspace in-fence, then you only get a userspace
  out-fence
- mixing in fences between dma-fence and user fence is ok
- mixing out fences isn't

And we currently do have sync_file out fence. So it's not possible to
support implicit user fence in atomic in a way which doesn't break the
uapi somewhere.

Doing the explicit user fence support first will make that very obvious.

And that's just the one ioctl I know is big trouble, I'm sure we'll find
more funny corner cases when we roll out explicit user fencing.

Anotherone that looks very sketchy right now is buffer sharing between
different userspace drivers, like compute <-> media (if you have some
fancy AI pipeline in your media workload, as an example).

> > - ... at this point I stopped pondering but there's definitely more
> > =

> > Imo the only way we'll even get the complete is if we do the following:
> > 1. roll out implicit sync with userspace fences on a driver-by-driver b=
asis
		s/implicit/explicit/

But I think you got that.

> >     1a. including all the winsys/modeset stuff
> =

> Completely agree, that's why I've split that up into individual patches.
> =

> I'm also fine if drivers can just opt out of user fence based
> synchronization and we return an error from dma_buf_dynamic_attach() if s=
ome
> driver says it can't handle that.

Yeah, but that boils down to us just breaking those use-cases. Which is
exactly what you're trying to avoid by rolling out implicit user fence I
think.

> > 2. roll out support for userspace fences to drm_syncobj timeline for
> >     interop, both across process/userspace and across drivers
> >     2a. including all the winsys/modeset stuff, but hopefully that's
> >         largely solved with 1. already.
> =

> Correct, but again we need this for explicit fencing as well.
> =

> > 3. only then try to figure out how to retroshoehorn this into implicit
> >     sync, and whether that even makes sense.
> > =

> > Because doing 3 before we've done 1&2 for at least 2 drivers (2 because
> > interop fun across drivers) is just praying that this time around we're
> > not collectively idiots and can correctly predict the future. That never
> > worked :-)
> > =

> > > For this prototype this patch set doesn't implement any user fence
> > > synchronization at all, but just assumes that faulting user pages is
> > > sufficient to make sure that we can wait for user space to finish
> > > submitting the work. If necessary this can be made even more strict, =
the
> > > only use case I could find which blocks this is the radeon driver and
> > > that should be handle able.
> > > =

> > > This of course doesn't give you the same semantic as the classic
> > > implicit sync to guarantee that you have exclusive access to a buffer=
s,
> > > but this is also not necessary.
> > > =

> > > So I think the conclusion should be that we don't need to concentrate=
 on
> > > implicit vs. explicit sync, but rather how to get the synchronization
> > > and timeout signalling figured out in general.
> > I'm not sure what exactly you're proving here aside from "it's possible=
 to
> > roll out a function with ill-defined semantics to all drivers". This
> > really is a lot harder than just this one function and just this one pa=
tch
> > set.
> =

> No it isn't. The hard part is getting the user sync stuff up in general.
> =

> Adding implicit synchronization on top of that is then rather trivial.

Well that's what I disagree with, since I already see some problems that I
don't think we can overcome (the atomic ioctl is one). And that's with us
only having a fairly theoretical understanding of the overall situation.

Like here at intel we have internal code for compute, and we're starting
to hit some interesting cases with interop with media already, but that's
it. Nothing even close to desktop/winsys/kms, and that's where I expect
will all the pain be at.

Cheers, Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
