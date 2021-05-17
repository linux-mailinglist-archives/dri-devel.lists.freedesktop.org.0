Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699C386B12
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127C36E3AA;
	Mon, 17 May 2021 20:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AC26E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:15:24 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w12so668988edx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Y4Zt/spCP5Fst/xVgrkd+tbQ+aQ176xdPOIiO/pSJU=;
 b=0W1qwOhEL31KDbsc15sQYqR68mIWjZilwaRzYy/SpGdx6Yj+zmniGJ6MYb+j4Dk5eM
 +AfmFGeuzHLwHH87u46sgiLs7jKKSQ5gYziw8ck7fSNpfmc67LmsitK3DMlF8ZmykQOr
 3WCC+3Ovzk6r48AtQGTMhsvIbxOLw7Pn/c/bdeCVxjhClB28sDeDYArgQyhhm96sp+LD
 TMWN8e28GvnnSVUdCC7Toy+/I5cfFO7Xq6VGQ77FHBfEcMMwGRoVNLMMLgqoAYLaBBLf
 LakwUlAYTIXyOzrPzf9TXDIDXnnipPTi/jjctNQTm59t/xzfFka10lNSJ6kof8ftnAXC
 aIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Y4Zt/spCP5Fst/xVgrkd+tbQ+aQ176xdPOIiO/pSJU=;
 b=csRC76ER+g7P7IPLi6Hm2Q+3rIoPOsknrarTTZt2xs6D3RJpizD7aFCatygJT2QgX0
 PzJ75ELmevKSQ6qz5kmuRXcwWzJAjuPBcJVqv2xRwpto6KBBnYq3WKjXsMC0QWwo8PAt
 C7AOr9iIBV5oSXuHDn69Elt0LKngFcOjKOfAWsm43gAPQv8IGqRJedXGr69lVr1t5nUG
 0JJDObQ8WwyJlZ94mvwfvMYPyVFIfXk3qc4udz2kEhogmak20KopgQr55DIMaBXpznXt
 6ZVjbGjIxh7qdSWo6tgR4hPH1x4DL13A5WB96SwG3GAi+YQAezBC0ghCeCWPenl2bOb1
 x1xw==
X-Gm-Message-State: AOAM531+N9HCCO5wPETpD07DQAbfzAHiMQpgPgPrI6bgyFWTEgpmp/S6
 07ddKrbQ5j4RTxu6pwsuxR0jFqJG6g0IdwOwFJrxrybHjC4=
X-Google-Smtp-Source: ABdhPJwksK82kYQ0ipXDBeszp6jSGigMSF0JJP/pOSR3PUOFCPcowLATiQb8h/JuaIxq87jcuZorViwXIGa78d1aAes=
X-Received: by 2002:a05:6402:1719:: with SMTP id
 y25mr2192086edu.304.1621282523048; 
 Mon, 17 May 2021 13:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
In-Reply-To: <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 17 May 2021 15:15:11 -0500
Message-ID: <CAOFGe95+r=Q9TeapHKZfjmuWCVfJLQ_hYrGOPDeupyNiEvJUHg@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linaro-mm-sig@lists.linaro.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 2:38 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 17.05.21 um 17:04 schrieb Daniel Vetter:
> > On Mon, May 17, 2021 at 04:11:18PM +0200, Christian K=C3=B6nig wrote:
> >> We had a long outstanding problem in amdgpu that buffers exported to
> >> user drivers by DMA-buf serialize all command submissions using them.
> >>
> >> In other words we can't compose the buffer with different engines and
> >> then send it to another driver for display further processing.
> >>
> >> This was added to work around the fact that i915 didn't wanted to wait
> >> for shared fences in the dma_resv objects before displaying a buffer.
> >>
> >> Since this problem is now causing issues with Vulkan we need to find a
> >> better solution for that.
> >>
> >> The patch set here tries to do this by adding an usage flag to the
> >> shared fences noting when and how they should participate in implicit
> >> synchronization.
> > So the way this is fixed in every other vulkan driver is that vulkan
> > userspace sets flags in the CS ioctl when it wants to synchronize with
> > implicit sync. This gets you mostly there. Last time I checked amdgpu
> > isn't doing this, and yes that's broken.
>
> And exactly that is a really bad approach as far as I can see. The
> Vulkan stack on top simply doesn't know when to set this flag during CS.

Yes and no...  First off, I should preface this by saying that there
are no truly good solutions here that I'm aware of.  We've got one
thing in ANV that mostly works, RADV does something else that mostly
works.  Neither is great.  I think with
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037 we get
most of the way to a half-decent solution.

What ANV does today is to set EXEC_OBJECT_ASYNC on all BOs almost all
the time to disable implicit sync.  There are two exceptions to this:

 1. When we go to kick a buffer off to the window system, we do a
(possibly dummy) submit which takes in whatever explicit VkSemaphore
objects the client provides and uses a mesa-internal vkQueueSubmit
extension to mark the window-system buffer as being written by that
submit.
 2a. In vkAcquireNextImage, when we hand the next back buffer to the
client, it also provides a VkSemaphore.  We stuff the image BO into
said semaphore and, whenever it's used as a wait dependency by the
client, we throw the BO in that submit's object list and flag it as
being read.

This works pretty well.  The biggest problem is that there is some
potential for over-sync thanks to 2a because, as soon as the client
throws in a render which depends on the acquire semaphore, that BO is
marked as used and it can end up over-syncing on itself.  This is
entirely solved by the patch Daniel mentioned below.  With the patch
daniel mentioned and MR4037 linked above, 2 gets replaced with

2b. In vkAcquireNextImage, we fetch a sync_file out of the dma-buf and
stuff it into the semaphore.

This totally solves the over-sync problem because the sync_file used
represents the exact point on the CPU timeline where X handed the
image back to us and any fences added after that point don't count.
Since the client can't do a vkQueueSubmit using that image until
vkAcquireNextImage returns, there's no way it will contain any of our
fences unless they were from the previous frame rendered to that
image.

> That's also the reason the Valve guys came up with a solution where each
> BO gets a flag for explicit sync, but that only works for exports and
> not for imports.

Yes, RADV uses a different mechanism.  They have a per-BO flag for "am
I owned" and they sync on all the external+owned stuff.  The owned
flag is flipped on and off when buffers are handed between the client
and the compositor.

Which is better?  I think the final solution I'm driving towards in
ANV is the best we can do at the moment.  I also like the fact that it
is pretty cross-driver.  It does still depend on a dummy submit but
I'm not sure it's worth trying to get around that for now.

> > I915 and iirc msm has explicit flags for this, panfrost was designed to
> > support this correctly from the start (also with flags I think). That's=
 at
> > least what I remember from all the discussions at XDC and #dri-devel, b=
ut
> > didn't check the code again to give you the list of uapi flags you need
> > for each driver.
> >
> > The other piece is making sure you're only picking up implicit fences w=
hen
> > you should, and not any later ones, for which Jason has a solution:
> >
> > https://lore.kernel.org/dri-devel/20210317221940.2146688-1-jason@jlekst=
rand.net/
>
> Yes, I helped with that as well. But I think that this is just another
> workaround without really addressing the underlying problem.

I think that depends on how we're defining "the underlying problem"
I'm afraid I'm a bit unclear on that.

> > If amdgpu isn't using those, then you will suffer from
> > over-synchronization in vulkan and pay a price. The entire point of vul=
kan
> > is that you pick up sync points very explicitly, and we also need to ha=
ve
> > very explicit uapi for userspace to pick up/set the implicit fences.
> >
> > Trying to paper over this with more implicit magic is imo just wrong, a=
nd
> > definitely not the long term explicit sync model we want.
>
> I completely disagree.
>
> In my opinion the implicit sync model we have for dma_resv currently is
> just not well designed at all, since it always requires cooperation from
> userspace.
>
> In other words you need to know when to enable implicit sync in
> userspace and that information is simply not present all of the time.

Then I don't see how this helps.  If userspace doesn't know when to
sync so it can set it at submit time, why would it know on
import/export?  If you think we don't know when to sync, we certainly
don't know when it's read vs. write.

Also, making this all happen at import/export time totally blows away
Vulkan's model.  We don't want to have to destroy the BO object to
stop syncing on it and re-import it every frame.  That's a
non-starter.

Or am I really badly missing something?

> What we have done here is just keeping the old reader/writer flags i915,
> radeon and nouveau once had and pushed that out to everybody else making
> the assumption that everybody would follow that without documenting the
> actual rules of engagement you need to follow here.
>
> That was a really big mistake and we should try to fix that sooner or
> later. The only other clean alternative I see is to use a flag on the
> exporter to tell the importer if it should sync to shared fences or not.
>
> Additional to that I'm perfectly fine with implicit sync. Explicit sync
> certainly has some use cases as well, but I don't see it as an absolute
> advantage over the implicit model.

I'm not going to make any broad sweeping arguments about the future
here.  Implicit sync may be here to stay and I think that discussion
is sort-of beside the point anyway.

--Jason
