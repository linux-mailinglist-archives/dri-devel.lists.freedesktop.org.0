Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7249A53FC7D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 12:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE67112D62;
	Tue,  7 Jun 2022 10:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B4A112D62
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 10:55:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2141F3200998;
 Tue,  7 Jun 2022 06:55:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 07 Jun 2022 06:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1654599324; x=1654685724; bh=y8SMUqaWeI
 216djbxpeTcRyKgXTNBmTvxJxBXz/Ti0U=; b=d53iHQQ+9gRinlvNLos77f4e4q
 2BRyDxeDdze+0EkqqD4xbT7Vmc5pPttjbYnYZwAVi97YYqmH9mu72jpYCz664nFd
 W2rSN7VyuO1988etu5SM89BUOWeQoLCKgA+h7e5JsnNQdnCTn6K2d0wlkDDY7gLo
 mQtykCXLUcU4NacbMVGClptv9pUC1apaQi8n2VruXeAtI+IupFZ9VXnGLa2ADepw
 bmRf0H+BEoOoh2wWk+7O6smTbvjF+0IuQ62Abtd04t0L42BZWZkfULdW6SK2Kdmf
 RAFR0YV9I2VztawCpAj5RwOrx78ofHqhP3O/N1IMf3z94MlA3a2IhOSkliQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654599324; x=1654685724; bh=y8SMUqaWeI216djbxpeTcRyKgXTN
 BmTvxJxBXz/Ti0U=; b=XylwXJWDeRNat7tz4IiEUgqym5JLwmBRNwIb4tSWchZk
 S5IWv2wLFOPXAzIS90Q2OYyV947vPN9k4SxXz08fx3oV1bC0NznlxUn42vNsbRCT
 QFsGf9TFnHMIS0lvggaedO+NLNEm8odILCXqW70LBQZtnzn31wbZx632MXEo5Qs9
 d+QAO/qrpyhoTqJibMuoj71F0voONa+T4F2ANxb/dyE7yuxvLb64cfNDRHO+IUUW
 J2ES3CXErTf+SF1TJCYfLIqy0UfnedDrPEFaJHE4BIMTx1eL4ojbiHQcUU2ndE5u
 xmKOs5yK0SjbOzY+JzF+5G5a5/CW0916h+PUNFLC4w==
X-ME-Sender: <xms:nC6fYrQUU98yZdlrP-cuAgu-4dICnZYQeb4DJ1zI28dzSx0a3iP6lg>
 <xme:nC6fYsyk3zAT2EbcVHfBp7OQoVoes-yY5Ml6o2tb2ASTbiavzgUotib4TassBS1ej
 LkqC3_uUGd9Xg>
X-ME-Received: <xmr:nC6fYg3LuIhcAl5MbBBPtNCcSVR-El3wEXR4ZKdtWxKSIox8IJ-Z_HtmJckS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:nC6fYrCO-_cqgUV7b4P4RZumNplTOr9IePvLshtO9poWNA9nXJ_tBQ>
 <xmx:nC6fYkil0f7bdf_zxAnGQn6-k5UUteyxfVE0Ep3jNJsvD1wdsEqnpQ>
 <xmx:nC6fYvqrCCmP0m1c4-cpoWxnU2jF3qDvgs9aXAdRR14P4YP5p-YbKw>
 <xmx:nC6fYpYZjMt1YY0to4M3NIkhbJ7cQF17JFVoZdMoniaLAvx2pn4oHw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 06:55:22 -0400 (EDT)
Date: Tue, 7 Jun 2022 12:55:20 +0200
From: Greg KH <greg@kroah.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
Message-ID: <Yp8umMtviDqDeDWV@kroah.com>
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
 <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
 <YphX2erQp3e4mUba@kroah.com>
 <CtTIPo68VAvDRUp7-QFc0m-2SnikPFd0QpdogNj2xueFfyQKa3DQqiw3Meqtsu8vQgEuKX_-MPKbe7jQdf49-Y3z2TAYbajUrC5GKF0Dolk=@emersion.fr>
 <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Jason Ekstrand <jason.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 02, 2022 at 08:47:56AM +0200, Daniel Vetter wrote:
> On Thu, 2 Jun 2022 at 08:34, Simon Ser <contact@emersion.fr> wrote:
> >
> > On Thursday, June 2nd, 2022 at 08:25, Greg KH <greg@kroah.com> wrote:
> >
> > > On Thu, Jun 02, 2022 at 06:17:31AM +0000, Simon Ser wrote:
> > >
> > > > On Thursday, June 2nd, 2022 at 07:40, Greg KH greg@kroah.com wrote:
> > > >
> > > > > On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
> > > > >
> > > > > > To discover support for new DMA-BUF IOCTLs, user-space has no
> > > > > > choice but to try to perform the IOCTL on an existing DMA-BUF.
> > > > >
> > > > > Which is correct and how all kernel features work (sorry I missed the
> > > > > main goal of this patch earlier and focused only on the sysfs stuff).
> > > > >
> > > > > > However, user-space may want to figure out whether or not the
> > > > > > IOCTL is available before it has a DMA-BUF at hand, e.g. at
> > > > > > initialization time in a Wayland compositor.
> > > > >
> > > > > Why not just do the ioctl in a test way? That's how we determine kernel
> > > > > features, we do not poke around in sysfs to determine what is, or is
> > > > > not, present at runtime.
> > > > >
> > > > > > Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> > > > > > subsystem to advertise supported features. Add a
> > > > > > sync_file_import_export entry which indicates that importing and
> > > > > > exporting sync_files from/to DMA-BUFs is supported.
> > > > >
> > > > > No, sorry, this is not a sustainable thing to do for all kernel features
> > > > > over time. Please just do the ioctl and go from there. sysfs is not
> > > > > for advertising what is and is not enabled/present in a kernel with
> > > > > regards to functionality or capabilities of the system.
> > > > >
> > > > > If sysfs were to export this type of thing, it would have to do it for
> > > > > everything, not just some random tiny thing of one kernel driver.
> > > >
> > > > I'd argue that DMA-BUF is a special case here.
> > >
> > > So this is special and unique just like everything else? :)
> > >
> > > > To check whether the import/export IOCTLs are available, user-space
> > > > needs a DMA-BUF to try to perform the IOCTL. To get a DMA-BUF,
> > > > user-space needs to enumerate GPUs, pick one at random, load GBM or
> > > > Vulkan, use that heavy-weight API to allocate a "fake" buffer on the
> > > > GPU, export that buffer into a DMA-BUF, try the IOCTL, then teardown
> > > > all of this. There is no other way.
> > > >
> > > > This sounds like a roundabout way to answer the simple question "is the
> > > > IOCTL available?". Do you have another suggestion to address this
> > > > problem?
> > >
> > > What does userspace do differently if the ioctl is present or not?
> >
> > Globally enable a synchronization API for Wayland clients, for instance
> > in the case of a Wayland compositor.
> >
> > > And why is this somehow more special than of the tens of thousands of
> > > other ioctl calls where you have to do exactly the same thing you list
> > > above to determine if it is present or not?
> >
> > For other IOCTLs it's not as complicated to obtain a FD to do the test
> > with.
> 
> Two expand on this:
> 
> - compositor opens the drm render /dev node
> - compositor initializes the opengl or vulkan userspace driver on top of that
> - compositor asks that userspace driver to allocate some buffer, which
> can be pretty expensive
> - compositor asks the userspace driver to export that buffer into a dma-buf
> - compositor can finally do the test ioctl, realizes support isn't
> there and tosses the entire thing
> 
> read() on a sysfs file is so much more reasonable it's not even funny.

I agree it seems trivial and "simple", but that is NOT how to determine
what is, and is not, a valid ioctl command for a device node.

The only sane way to do this is like we have been doing for the past 30+
years, make the ioctl and look at the return value.

Now if we want to come up with a new generic "here's the
capabilities/ioctls/whatever" that the kernel currently supports at this
point in time api, wonderful, but PLEASE do not overload sysfs to do
something like this as that is not what it is for at this moment in
time.

Don't just do this for one specific ioctl as there really is nothing
special about it at all ("it's special and unique just like all other
ioctls...")

> Plan B we discussed is to add a getparam to signify this to the drm
> ioctl interface, but that has the design problem that a feature in the
> dma-buf subsystem is announced in a totally different subsystem (ok
> same maintainers), and if that ever gets out of sync your userspace
> breaks. So really no good.

getparam makes sense in a way, if it doesn't change over time (i.e. if
you call it now, will it be the same if you call it again if some kernel
module is added/removed in the meantime?)  Also be aware of
suspend/resume where you can swap out the kernel underneath running
userspace and that kernel might have different capabilities now.  So you
can't just not check error values of ioctl commands (not that you are
saying you want to here, just that it's more complex than might
originally seem.)

> So if sysfs also isn't the right approach, and the getparam ioctl on
> drm is defo worse, what is the right approach? Ideally without setting
> up the entire userspace render driver and doing some expensive-ish
> (depending upon driver at least) buffer allocations just to check for
> a feature.
> 
> Note that some compositors want to gate their "should I use vk for
> rendering and expose some additional features to client" decision on
> this, so setting up the wrong renderer just to test whether that would
> work is not a very great approach.
> 
> Also the last time we added a feature to dma-buf was in 3.17, so I
> guess everyone just hardcodes nowadays that all dma-buf features are
> present. Which isn't great, and that's why we're trying to fix here.

Why can't you call the test ioctl with an invalid value to see if it is
present or not (-ENOTTY vs. -EINVAL) right at the beginning before you
set up anything?

thanks,

greg k-h
