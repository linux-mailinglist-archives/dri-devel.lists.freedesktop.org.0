Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6AE5436ED
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AC310FE6E;
	Wed,  8 Jun 2022 15:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85E310FFA9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:15:20 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-edeb6c3642so27576479fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 08:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8odD3TB7mwFVmetTxgeIp8SNhTbmTpg+qLJgJqfIXX4=;
 b=GCLaE97XF3ja2+1UhtUCU2iCwrPCDAWvQeydvgfGreW9EWdohyyCz08BpaEFB34Mv+
 K8uXCPimKWbTocQBb5MP1arw+WbH3sJIUiyOTHKmQPz2ccHjb0pS93KTstRx9o1ArbX6
 IfP+z4F9ufOHZahq3AHdXj4zAJohDU8pOFxeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8odD3TB7mwFVmetTxgeIp8SNhTbmTpg+qLJgJqfIXX4=;
 b=c7MYyhTaSMFNFX2lVju1M8VXJf6lKCILSc8Q2URIP7Lt4d6Wc+jkpDY0uxQzzPU2KH
 KnHkquCk4QpVdq/fO03f+xalUpF7C3yTV0b/zcfPwSWXLYpOXe92l3HWbU07gvS0H7oL
 4HHXpBnyuC7JjBvmfxH7vc456QmgfBZsvK9hS5vznFfJBOH0qEDiIGXCXOZm44GrpcLE
 Q5B2RaB45lQYEpsSPlZb69ULKir9iO3+Q+RqS/RPyHqNsGDhGHT/RU+WTanCvfMmtD6P
 O4BY1IRZ7efsX/l9YRATn55/D7/k5HV5cw61gYOVjAsFCotC1i90//dRYMv0Ob99F5SU
 RCPA==
X-Gm-Message-State: AOAM532/CREJRcCgGxR/mois9h/eUoy4rR+w/7NrsjUbBYuW6GcDI88p
 H3Yl3V0FVd/9exYdMxLufsgxs2hxTHYMsDvKGiz/qw==
X-Google-Smtp-Source: ABdhPJzMRfGCmxBgntvPyaeZyG9mwgqJhzRJIFN+TgrLxB9q+yn9yDyNbX+/NQTp/R4cZD4z6NvXls+9449amiIcfYE=
X-Received: by 2002:a05:6870:e98b:b0:fe:219a:2449 with SMTP id
 r11-20020a056870e98b00b000fe219a2449mr716416oao.228.1654701319780; Wed, 08
 Jun 2022 08:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
 <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
 <YphX2erQp3e4mUba@kroah.com>
 <CtTIPo68VAvDRUp7-QFc0m-2SnikPFd0QpdogNj2xueFfyQKa3DQqiw3Meqtsu8vQgEuKX_-MPKbe7jQdf49-Y3z2TAYbajUrC5GKF0Dolk=@emersion.fr>
 <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
 <Yp8umMtviDqDeDWV@kroah.com>
 <93adb5b2ba50a9879a085c10695b9ec9daf7a21e.camel@collabora.com>
 <Yp92ag5+jonHtJo1@kroah.com>
In-Reply-To: <Yp92ag5+jonHtJo1@kroah.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 8 Jun 2022 17:15:08 +0200
Message-ID: <CAKMK7uHiTHU=zy7VJvHn3ACuzk1kDw6j1ubT6ncbqKi2PJyovA@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
To: Greg KH <greg@kroah.com>
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Jun 2022 at 18:01, Greg KH <greg@kroah.com> wrote:
>
> On Tue, Jun 07, 2022 at 09:52:56AM -0500, Jason Ekstrand wrote:
> > On Tue, 2022-06-07 at 12:55 +0200, Greg KH wrote:
> > > On Thu, Jun 02, 2022 at 08:47:56AM +0200, Daniel Vetter wrote:
> > > > On Thu, 2 Jun 2022 at 08:34, Simon Ser <contact@emersion.fr> wrote:
> > > > >
> > > > > On Thursday, June 2nd, 2022 at 08:25, Greg KH <greg@kroah.com>
> > > > > wrote:
> > > > >
> > > > > > On Thu, Jun 02, 2022 at 06:17:31AM +0000, Simon Ser wrote:
> > > > > >
> > > > > > > On Thursday, June 2nd, 2022 at 07:40, Greg KH
> > > > > > > greg@kroah.com wrote:
> > > > > > >
> > > > > > > > On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
> > > > > > > >
> > > > > > > > > To discover support for new DMA-BUF IOCTLs, user-space
> > > > > > > > > has no
> > > > > > > > > choice but to try to perform the IOCTL on an existing
> > > > > > > > > DMA-BUF.
> > > > > > > >
> > > > > > > > Which is correct and how all kernel features work (sorry I
> > > > > > > > missed the
> > > > > > > > main goal of this patch earlier and focused only on the
> > > > > > > > sysfs stuff).
> > > > > > > >
> > > > > > > > > However, user-space may want to figure out whether or not
> > > > > > > > > the
> > > > > > > > > IOCTL is available before it has a DMA-BUF at hand, e.g.
> > > > > > > > > at
> > > > > > > > > initialization time in a Wayland compositor.
> > > > > > > >
> > > > > > > > Why not just do the ioctl in a test way? That's how we
> > > > > > > > determine kernel
> > > > > > > > features, we do not poke around in sysfs to determine what
> > > > > > > > is, or is
> > > > > > > > not, present at runtime.
> > > > > > > >
> > > > > > > > > Add a /sys/kernel/dmabuf/caps directory which allows the
> > > > > > > > > DMA-BUF
> > > > > > > > > subsystem to advertise supported features. Add a
> > > > > > > > > sync_file_import_export entry which indicates that
> > > > > > > > > importing and
> > > > > > > > > exporting sync_files from/to DMA-BUFs is supported.
> > > > > > > >
> > > > > > > > No, sorry, this is not a sustainable thing to do for all
> > > > > > > > kernel features
> > > > > > > > over time. Please just do the ioctl and go from there.
> > > > > > > > sysfs is not
> > > > > > > > for advertising what is and is not enabled/present in a
> > > > > > > > kernel with
> > > > > > > > regards to functionality or capabilities of the system.
> > > > > > > >
> > > > > > > > If sysfs were to export this type of thing, it would have
> > > > > > > > to do it for
> > > > > > > > everything, not just some random tiny thing of one kernel
> > > > > > > > driver.
> > > > > > >
> > > > > > > I'd argue that DMA-BUF is a special case here.
> > > > > >
> > > > > > So this is special and unique just like everything else? :)
> > > > > >
> > > > > > > To check whether the import/export IOCTLs are available,
> > > > > > > user-space
> > > > > > > needs a DMA-BUF to try to perform the IOCTL. To get a DMA-
> > > > > > > BUF,
> > > > > > > user-space needs to enumerate GPUs, pick one at random, load
> > > > > > > GBM or
> > > > > > > Vulkan, use that heavy-weight API to allocate a "fake" buffer
> > > > > > > on the
> > > > > > > GPU, export that buffer into a DMA-BUF, try the IOCTL, then
> > > > > > > teardown
> > > > > > > all of this. There is no other way.
> > > > > > >
> > > > > > > This sounds like a roundabout way to answer the simple
> > > > > > > question "is the
> > > > > > > IOCTL available?". Do you have another suggestion to address
> > > > > > > this
> > > > > > > problem?
> > > > > >
> > > > > > What does userspace do differently if the ioctl is present or
> > > > > > not?
> > > > >
> > > > > Globally enable a synchronization API for Wayland clients, for
> > > > > instance
> > > > > in the case of a Wayland compositor.
> > > > >
> > > > > > And why is this somehow more special than of the tens of
> > > > > > thousands of
> > > > > > other ioctl calls where you have to do exactly the same thing
> > > > > > you list
> > > > > > above to determine if it is present or not?
> > > > >
> > > > > For other IOCTLs it's not as complicated to obtain a FD to do the
> > > > > test
> > > > > with.
> > > >
> > > > Two expand on this:
> > > >
> > > > - compositor opens the drm render /dev node
> > > > - compositor initializes the opengl or vulkan userspace driver on
> > > > top of that
> > > > - compositor asks that userspace driver to allocate some buffer,
> > > > which
> > > > can be pretty expensive
> > > > - compositor asks the userspace driver to export that buffer into a
> > > > dma-buf
> > > > - compositor can finally do the test ioctl, realizes support isn't
> > > > there and tosses the entire thing
> > > >
> > > > read() on a sysfs file is so much more reasonable it's not even
> > > > funny.
> > >
> > > I agree it seems trivial and "simple", but that is NOT how to
> > > determine
> > > what is, and is not, a valid ioctl command for a device node.
> > >
> > > The only sane way to do this is like we have been doing for the past
> > > 30+
> > > years, make the ioctl and look at the return value.
> > >
> > > Now if we want to come up with a new generic "here's the
> > > capabilities/ioctls/whatever" that the kernel currently supports at
> > > this
> > > point in time api, wonderful, but PLEASE do not overload sysfs to do
> > > something like this as that is not what it is for at this moment in
> > > time.
> > >
> > > Don't just do this for one specific ioctl as there really is nothing
> > > special about it at all ("it's special and unique just like all other
> > > ioctls...")
> > >
> > > > Plan B we discussed is to add a getparam to signify this to the drm
> > > > ioctl interface, but that has the design problem that a feature in
> > > > the
> > > > dma-buf subsystem is announced in a totally different subsystem (ok
> > > > same maintainers), and if that ever gets out of sync your userspace
> > > > breaks. So really no good.
> > >
> > > getparam makes sense in a way, if it doesn't change over time (i.e.
> > > if
> > > you call it now, will it be the same if you call it again if some
> > > kernel
> > > module is added/removed in the meantime?)  Also be aware of
> > > suspend/resume where you can swap out the kernel underneath running
> > > userspace and that kernel might have different capabilities now.  So
> > > you
> > > can't just not check error values of ioctl commands (not that you are
> > > saying you want to here, just that it's more complex than might
> > > originally seem.)
> > >
> > > > So if sysfs also isn't the right approach, and the getparam ioctl
> > > > on
> > > > drm is defo worse, what is the right approach? Ideally without
> > > > setting
> > > > up the entire userspace render driver and doing some expensive-ish
> > > > (depending upon driver at least) buffer allocations just to check
> > > > for
> > > > a feature.
> > > >
> > > > Note that some compositors want to gate their "should I use vk for
> > > > rendering and expose some additional features to client" decision
> > > > on
> > > > this, so setting up the wrong renderer just to test whether that
> > > > would
> > > > work is not a very great approach.
> > > >
> > > > Also the last time we added a feature to dma-buf was in 3.17, so I
> > > > guess everyone just hardcodes nowadays that all dma-buf features
> > > > are
> > > > present. Which isn't great, and that's why we're trying to fix
> > > > here.
> > >
> > > Why can't you call the test ioctl with an invalid value to see if it
> > > is
> > > present or not (-ENOTTY vs. -EINVAL) right at the beginning before
> > > you
> > > set up anything?
> >
> > Because we need a file descriptor to call that ioctl on.  Currently,
> > that file descriptor is the dma-buf itself.  We could move it to be a
> > DRM IOCTL but then it ends up unnecessarily tied to DRM even if
> > someone's trying to use it with V4L or some other dma-buf
> > producer/consumer.  IDK if that's a real problem in practice but there
> > didn't seem to be a good reason to tie it to things outside dma-buf.
>
> So you all have an api that is so hard to use, you can't use it until
> you know what the capabilities of that api is before you call it.  So
> you want an "out-of-band" way to know if this api is present or not.
>
> Sounds like your api is the problem here, not the capability issue...
>
> Again, I understand your problem, but sysfs is NOT the place for this.
> Linux has a well-defined way to tell userspace if an ioctl is present or
> not.  Just because it is "hard" to get to does not mean you get to
> create a-brand-new-way-to-do-things for this, sorry.
>
> Kernel API design and evolution is hard, that's the job description of a
> kernel developer.  Boiler-plate code that you write once to do this
> "does the kernel support this ioctl for a dma-buf" will be able to be
> used by everyone for forever.  Best of all, it will already be done for
> when you have this issue for the next ioctl you create :)

This code exists. It is:

- load your userspace gl/vk driver
- the userspace gl/vk driver knows how to create a dma-buf

It's the entire "load userspace gl/vk driver" step we'd like to avoid,
at least in some cases. And the way to do that would be:
- some random thing in sysfs
- some random thing in procfs
- some randome getparam ioctl on each subsystem supporting dma-buf
- some random syscall/ioctl/char-misc to create an fd you can call
dma-buf ioctl on, but _only_ to figure out whether that ioctl is in
theory support on a real dma-buf, but the fd you get through this is
entirely fake and not a real dma-buf

They're all kinda crap, especially the fake fd thing because
- where do you create that fake fd? You're just back to adding a
random crap interface in one of the above places
(sysfs/procfs/subsystem ioctl)
- you need to make sure that this fake dma-buf fd is only good for
"does this ioctl exist", but not "can I actually use this as a dma-buf
with a driver/subsystem", since it's not the real thing.

This are all crap options, and we know.

Consensus among userspace developers (aside from the vk/gl driver,
which can do the "right" check) is that they'll check the kernel
version number. Which is also crap, but it has the upside that it
doesn't need an ack from kernel developers.

I'm still hoping we can get something better than that, which is at
least somewhat tied to the actual code running in the kernel?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
