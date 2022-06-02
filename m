Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9660753B380
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 08:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B89B1134A2;
	Thu,  2 Jun 2022 06:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAD71134A1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 06:25:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D0F6E5C00F2;
 Thu,  2 Jun 2022 02:25:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 02 Jun 2022 02:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654151131; x=1654237531; bh=khYq3RZfhv
 rbCVcdh3HO5f95girVUD4ZX9Ex1x3ephw=; b=MwOLiMrvgRt3hPRe8Wx04eO8ej
 pHs1P4DC+paM132z+J5lj97+kN2gnhUn7Mb5n68XnF8aG5lauCD/lW5TPZ9NJIRZ
 d0MEIn7AZoHt+NCZH9320eV4ZJJzgPJuCBxHKjpPX0NhWABz7y8e4F0ogDlxHIrV
 wI5VIOMuDRqSyqknXMbiP9Xv8aGr35qSajkvxIaltmG1novDDtLH5M7T/RiTTH4Y
 fpHEvE0PiyQC5erJGqo34tqtKuiTriY2l+DdhlpjsxSNpr+PGCimit/WxXFsO1yv
 lYpeay/a/IF+3EvoYf27jV1oVdBLfAlIcrUvkgETwK0WS9mrEbOtHLWL27Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654151131; x=1654237531; bh=khYq3RZfhvrbCVcdh3HO5f95girV
 UD4ZX9Ex1x3ephw=; b=QFCK/FEu7RFMQxt3zxrqEfvdIP9+8b4xBNyW5V/bmXRH
 uEXuPxj4fHr+xCc+ljiF86r1VfTV58Vw81H7wUgKywz2Eaqc95/JNELph/8NszTO
 A5CQ4vCBmF39mj5LytFS8/TA3pHCeQolU3LfrYp0ad78iHg7Y2y/Rorc/jnakIjw
 PG2+9DeKspRql7y5GJDYYFomaUoJDeRqBWFDlWtQ+qIEz7Z8yonTuBRD+Jky2oMl
 qMaWoD8NcvcSsMUNTi5D1oyncEo64wpWhhprmL8L6+J3yKN7hpzdRPJ+EZi6BOMv
 jATvW8bso24sSbiBRLoA3vgVEWID349/fdM5svlhGg==
X-ME-Sender: <xms:21eYYhas9LZ8ExHA21kzN_6V0L4Fr0zIx2BsB33-HaCe_k_Bxpk8mg>
 <xme:21eYYoYlB7m7kRnLEMqSJJqzHMU5xiUYOQcfXdtA746yNYJ7SWbQxKnH1qBBQncBC
 9n44xgJC0LesQ>
X-ME-Received: <xmr:21eYYj-2qfboVKKGcoGvsdL9rVNoOqIqZm0-HfPMW57IR_TckpL67weWQ0WAswrFqnzD8sPG1I9Y39LyTEiIV-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledugddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:21eYYvqe9mjyUyhB-yCQKWCK6r1Dk_mPqZluZtp5hG2-cj2y4HaQgg>
 <xmx:21eYYsoQktrjeeEFXluQQlhJ6Dk9JTC6bhsVdrby0sQ22PZ6rV8nMw>
 <xmx:21eYYlQ-ZXLBqWY78tu8gcfHx9IvZ-7J2PvZisnpi9MPgvYEjypD2w>
 <xmx:21eYYphpJo9jzXcrMBWuUACM2itSvIoMOr--ugIQNBdTbc_CbFro1g>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 02:25:30 -0400 (EDT)
Date: Thu, 2 Jun 2022 08:25:29 +0200
From: Greg KH <greg@kroah.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
Message-ID: <YphX2erQp3e4mUba@kroah.com>
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
 <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 02, 2022 at 06:17:31AM +0000, Simon Ser wrote:
> On Thursday, June 2nd, 2022 at 07:40, Greg KH <greg@kroah.com> wrote:
> 
> > On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
> >
> > > To discover support for new DMA-BUF IOCTLs, user-space has no
> > > choice but to try to perform the IOCTL on an existing DMA-BUF.
> >
> > Which is correct and how all kernel features work (sorry I missed the
> > main goal of this patch earlier and focused only on the sysfs stuff).
> >
> > > However, user-space may want to figure out whether or not the
> > > IOCTL is available before it has a DMA-BUF at hand, e.g. at
> > > initialization time in a Wayland compositor.
> >
> > Why not just do the ioctl in a test way? That's how we determine kernel
> > features, we do not poke around in sysfs to determine what is, or is
> > not, present at runtime.
> >
> > > Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> > > subsystem to advertise supported features. Add a
> > > sync_file_import_export entry which indicates that importing and
> > > exporting sync_files from/to DMA-BUFs is supported.
> >
> > No, sorry, this is not a sustainable thing to do for all kernel features
> > over time. Please just do the ioctl and go from there. sysfs is not
> > for advertising what is and is not enabled/present in a kernel with
> > regards to functionality or capabilities of the system.
> >
> > If sysfs were to export this type of thing, it would have to do it for
> > everything, not just some random tiny thing of one kernel driver.
> 
> I'd argue that DMA-BUF is a special case here.

So this is special and unique just like everything else?  :)

> To check whether the import/export IOCTLs are available, user-space
> needs a DMA-BUF to try to perform the IOCTL. To get a DMA-BUF,
> user-space needs to enumerate GPUs, pick one at random, load GBM or
> Vulkan, use that heavy-weight API to allocate a "fake" buffer on the
> GPU, export that buffer into a DMA-BUF, try the IOCTL, then teardown
> all of this. There is no other way.
> 
> This sounds like a roundabout way to answer the simple question "is the
> IOCTL available?". Do you have another suggestion to address this
> problem?

What does userspace do differently if the ioctl is present or not?

And why is this somehow more special than of the tens of thousands of
other ioctl calls where you have to do exactly the same thing you list
above to determine if it is present or not?

And how have you specifically tied this sysfs to the ioctl so that if it
changes or is ported elsewhere, that sysfs attribute will also know to
be added?

You already have shipping kernels today without this attribute, you
can't go back in time and add the attribute to those kernels just to
reflect the ioctl being present or not, so you have to handle this case
in userspace today, making this not needed at all.  Do you want to have
two test cases in your userspace code, one that does "is the sysfs file
there?  No, ok, let's see if we are on an older kernel without it, yet
the ioctl is present..."  When really you can just do "let's see if the
ioctl is present" logic as you already do that today.

DMA bufs are not special, they are merely one of tens of thousands of
ioctls in the kernel.  Think of the overall picture here please, that's
the only way to create a maintainable system over long periods of time,
like the kernel needs to be.

thanks,

greg k-h
