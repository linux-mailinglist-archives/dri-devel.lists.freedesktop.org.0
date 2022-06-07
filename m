Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380DC540340
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 18:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D7910E18A;
	Tue,  7 Jun 2022 16:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F0F10E18A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 16:01:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B9FA13200B6E;
 Tue,  7 Jun 2022 12:01:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 07 Jun 2022 12:01:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1654617710; x=
 1654704110; bh=6wLLqEhSv+YINKxGEmumamp/QA0BtU+xPxLLRBF4dcw=; b=A
 F/wos4pE6S6AoMwPgCtxqDR9oSatPNXTTpfbDhXYID+SnovVcNSTWOSLyceG+97Q
 U/r9vkPrSUWu2IWRPsbg85aD1n9ssSR4kaLI9kbxlLioQEZ10Waq9FPPs2jvU/FV
 44Fj2JSKrTvPp0xKcM/aqoegkg+xY6At9EheqG+8omckODUkjRJCQNi24sHGYwPc
 ZroKm04t4fDlOsdr1FEwGLVLS4KJMVZUFnp/1lElBWWMboyvF1qWVfyj2wFGyFXO
 rKDg8CphGF8YJQWhvkibPLWQ3x9gUaZgDhctdNxVapm5/8upgYLziy4wKVWhnEYs
 z6xyFIZthfEK8FiIGYO/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654617710; x=
 1654704110; bh=6wLLqEhSv+YINKxGEmumamp/QA0BtU+xPxLLRBF4dcw=; b=C
 pAAHNt6fxz6P85A7TluUppWn0LZvINNDkboJg8nAFO3iWQqaQxQHnHVMWcu6VRkD
 Qd5wS1rwXu60YSnxSemxnSe4oKwyLhGw6GADynJnsbJKs8zP+Y/iRI24JSamZeMU
 oZ+WIIDkIuTInMOJdBiWTlizA4gyK49W5QJ4eaUBCFuuEhQ1E2zoP4TOS/GKUgRz
 DatfEZIdlcRvS1yMrwbK7AcPMBxSw+CLeK7g1HsjjB8outGg1DzZRKfabWWDWzfM
 p5z4iCzzdatORYprdGfwevU4a7d4anw8+gEYpbSZ+X9P6EmZQFmb+Hldh0C/SC+Z
 JidoldV9cLdTyZgbfuMnA==
X-ME-Sender: <xms:bXafYvL4LXiRweNg5s_uv-QgBFxj7pYJHVGFxSOCNwgk-Ag5_Km5Mg>
 <xme:bXafYjKHShw8vEvKLudgxOGC3nvDmqqI_doEfXwEQmV9c1sQShwWoN7l0welWpOvP
 1YhpUDBZvloLg>
X-ME-Received: <xmr:bXafYnvUqva2ZZJtTVoL05g0x5JPEBXneg8voWktpM4IHq_KX9itmRYKYNegM9J88CSk_WMRCXpI58ebdE59fWPsMUpb8_2R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeelhe
 ehudduueeggeejgfehueduffehveeukefgkeeufeeltdejteeiuedtkeekleenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
 grhhdrtghomh
X-ME-Proxy: <xmx:bXafYoZm6lFHWNJdWZl7TGSei5d9aBYbtNz-1nUsOdauEcarW-QYTQ>
 <xmx:bXafYmbPtWyHYuqtRi65oDR4nhjg5kp8eJ3zJOLAK9EHpRHsf4k3Uw>
 <xmx:bXafYsCOrcgKoCAzBgtplhcryPo67AKLtMwzC1lTi6afBvLNMY9g3Q>
 <xmx:bnafYjQHZ9De3WZuOA-KQaRaC2N_aHbIXBPL3-F9mmAxUXPbCjI1HQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 12:01:49 -0400 (EDT)
Date: Tue, 7 Jun 2022 18:01:46 +0200
From: Greg KH <greg@kroah.com>
To: Jason Ekstrand <jason.ekstrand@collabora.com>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
Message-ID: <Yp92ag5+jonHtJo1@kroah.com>
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
 <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
 <YphX2erQp3e4mUba@kroah.com>
 <CtTIPo68VAvDRUp7-QFc0m-2SnikPFd0QpdogNj2xueFfyQKa3DQqiw3Meqtsu8vQgEuKX_-MPKbe7jQdf49-Y3z2TAYbajUrC5GKF0Dolk=@emersion.fr>
 <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
 <Yp8umMtviDqDeDWV@kroah.com>
 <93adb5b2ba50a9879a085c10695b9ec9daf7a21e.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93adb5b2ba50a9879a085c10695b9ec9daf7a21e.camel@collabora.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 09:52:56AM -0500, Jason Ekstrand wrote:
> On Tue, 2022-06-07 at 12:55 +0200, Greg KH wrote:
> > On Thu, Jun 02, 2022 at 08:47:56AM +0200, Daniel Vetter wrote:
> > > On Thu, 2 Jun 2022 at 08:34, Simon Ser <contact@emersion.fr> wrote:
> > > > 
> > > > On Thursday, June 2nd, 2022 at 08:25, Greg KH <greg@kroah.com>
> > > > wrote:
> > > > 
> > > > > On Thu, Jun 02, 2022 at 06:17:31AM +0000, Simon Ser wrote:
> > > > > 
> > > > > > On Thursday, June 2nd, 2022 at 07:40, Greg KH
> > > > > > greg@kroah.com wrote:
> > > > > > 
> > > > > > > On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
> > > > > > > 
> > > > > > > > To discover support for new DMA-BUF IOCTLs, user-space
> > > > > > > > has no
> > > > > > > > choice but to try to perform the IOCTL on an existing
> > > > > > > > DMA-BUF.
> > > > > > > 
> > > > > > > Which is correct and how all kernel features work (sorry I
> > > > > > > missed the
> > > > > > > main goal of this patch earlier and focused only on the
> > > > > > > sysfs stuff).
> > > > > > > 
> > > > > > > > However, user-space may want to figure out whether or not
> > > > > > > > the
> > > > > > > > IOCTL is available before it has a DMA-BUF at hand, e.g.
> > > > > > > > at
> > > > > > > > initialization time in a Wayland compositor.
> > > > > > > 
> > > > > > > Why not just do the ioctl in a test way? That's how we
> > > > > > > determine kernel
> > > > > > > features, we do not poke around in sysfs to determine what
> > > > > > > is, or is
> > > > > > > not, present at runtime.
> > > > > > > 
> > > > > > > > Add a /sys/kernel/dmabuf/caps directory which allows the
> > > > > > > > DMA-BUF
> > > > > > > > subsystem to advertise supported features. Add a
> > > > > > > > sync_file_import_export entry which indicates that
> > > > > > > > importing and
> > > > > > > > exporting sync_files from/to DMA-BUFs is supported.
> > > > > > > 
> > > > > > > No, sorry, this is not a sustainable thing to do for all
> > > > > > > kernel features
> > > > > > > over time. Please just do the ioctl and go from there.
> > > > > > > sysfs is not
> > > > > > > for advertising what is and is not enabled/present in a
> > > > > > > kernel with
> > > > > > > regards to functionality or capabilities of the system.
> > > > > > > 
> > > > > > > If sysfs were to export this type of thing, it would have
> > > > > > > to do it for
> > > > > > > everything, not just some random tiny thing of one kernel
> > > > > > > driver.
> > > > > > 
> > > > > > I'd argue that DMA-BUF is a special case here.
> > > > > 
> > > > > So this is special and unique just like everything else? :)
> > > > > 
> > > > > > To check whether the import/export IOCTLs are available,
> > > > > > user-space
> > > > > > needs a DMA-BUF to try to perform the IOCTL. To get a DMA-
> > > > > > BUF,
> > > > > > user-space needs to enumerate GPUs, pick one at random, load
> > > > > > GBM or
> > > > > > Vulkan, use that heavy-weight API to allocate a "fake" buffer
> > > > > > on the
> > > > > > GPU, export that buffer into a DMA-BUF, try the IOCTL, then
> > > > > > teardown
> > > > > > all of this. There is no other way.
> > > > > > 
> > > > > > This sounds like a roundabout way to answer the simple
> > > > > > question "is the
> > > > > > IOCTL available?". Do you have another suggestion to address
> > > > > > this
> > > > > > problem?
> > > > > 
> > > > > What does userspace do differently if the ioctl is present or
> > > > > not?
> > > > 
> > > > Globally enable a synchronization API for Wayland clients, for
> > > > instance
> > > > in the case of a Wayland compositor.
> > > > 
> > > > > And why is this somehow more special than of the tens of
> > > > > thousands of
> > > > > other ioctl calls where you have to do exactly the same thing
> > > > > you list
> > > > > above to determine if it is present or not?
> > > > 
> > > > For other IOCTLs it's not as complicated to obtain a FD to do the
> > > > test
> > > > with.
> > > 
> > > Two expand on this:
> > > 
> > > - compositor opens the drm render /dev node
> > > - compositor initializes the opengl or vulkan userspace driver on
> > > top of that
> > > - compositor asks that userspace driver to allocate some buffer,
> > > which
> > > can be pretty expensive
> > > - compositor asks the userspace driver to export that buffer into a
> > > dma-buf
> > > - compositor can finally do the test ioctl, realizes support isn't
> > > there and tosses the entire thing
> > > 
> > > read() on a sysfs file is so much more reasonable it's not even
> > > funny.
> > 
> > I agree it seems trivial and "simple", but that is NOT how to
> > determine
> > what is, and is not, a valid ioctl command for a device node.
> > 
> > The only sane way to do this is like we have been doing for the past
> > 30+
> > years, make the ioctl and look at the return value.
> > 
> > Now if we want to come up with a new generic "here's the
> > capabilities/ioctls/whatever" that the kernel currently supports at
> > this
> > point in time api, wonderful, but PLEASE do not overload sysfs to do
> > something like this as that is not what it is for at this moment in
> > time.
> > 
> > Don't just do this for one specific ioctl as there really is nothing
> > special about it at all ("it's special and unique just like all other
> > ioctls...")
> > 
> > > Plan B we discussed is to add a getparam to signify this to the drm
> > > ioctl interface, but that has the design problem that a feature in
> > > the
> > > dma-buf subsystem is announced in a totally different subsystem (ok
> > > same maintainers), and if that ever gets out of sync your userspace
> > > breaks. So really no good.
> > 
> > getparam makes sense in a way, if it doesn't change over time (i.e.
> > if
> > you call it now, will it be the same if you call it again if some
> > kernel
> > module is added/removed in the meantime?)  Also be aware of
> > suspend/resume where you can swap out the kernel underneath running
> > userspace and that kernel might have different capabilities now.  So
> > you
> > can't just not check error values of ioctl commands (not that you are
> > saying you want to here, just that it's more complex than might
> > originally seem.)
> > 
> > > So if sysfs also isn't the right approach, and the getparam ioctl
> > > on
> > > drm is defo worse, what is the right approach? Ideally without
> > > setting
> > > up the entire userspace render driver and doing some expensive-ish
> > > (depending upon driver at least) buffer allocations just to check
> > > for
> > > a feature.
> > > 
> > > Note that some compositors want to gate their "should I use vk for
> > > rendering and expose some additional features to client" decision
> > > on
> > > this, so setting up the wrong renderer just to test whether that
> > > would
> > > work is not a very great approach.
> > > 
> > > Also the last time we added a feature to dma-buf was in 3.17, so I
> > > guess everyone just hardcodes nowadays that all dma-buf features
> > > are
> > > present. Which isn't great, and that's why we're trying to fix
> > > here.
> > 
> > Why can't you call the test ioctl with an invalid value to see if it
> > is
> > present or not (-ENOTTY vs. -EINVAL) right at the beginning before
> > you
> > set up anything?
> 
> Because we need a file descriptor to call that ioctl on.  Currently,
> that file descriptor is the dma-buf itself.  We could move it to be a
> DRM IOCTL but then it ends up unnecessarily tied to DRM even if
> someone's trying to use it with V4L or some other dma-buf
> producer/consumer.  IDK if that's a real problem in practice but there
> didn't seem to be a good reason to tie it to things outside dma-buf.

So you all have an api that is so hard to use, you can't use it until
you know what the capabilities of that api is before you call it.  So
you want an "out-of-band" way to know if this api is present or not.

Sounds like your api is the problem here, not the capability issue...

Again, I understand your problem, but sysfs is NOT the place for this.
Linux has a well-defined way to tell userspace if an ioctl is present or
not.  Just because it is "hard" to get to does not mean you get to
create a-brand-new-way-to-do-things for this, sorry.

Kernel API design and evolution is hard, that's the job description of a
kernel developer.  Boiler-plate code that you write once to do this
"does the kernel support this ioctl for a dma-buf" will be able to be
used by everyone for forever.  Best of all, it will already be done for
when you have this issue for the next ioctl you create :)

greg k-h
