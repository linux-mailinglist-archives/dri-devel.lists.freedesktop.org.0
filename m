Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4B153E55E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3A011207A;
	Mon,  6 Jun 2022 15:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6368E11207A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:22:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0FEDB5C0180;
 Mon,  6 Jun 2022 11:22:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 06 Jun 2022 11:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1654528927; x=1654615327; bh=5ITxZxvR1U
 lRTYtQl9N1pR+J3NyPRM9g+aD58BJaVd4=; b=OjuClaajF/eirW2Z9aHqQUxNTE
 sUI51qTu/wStJIUps/cFueadz5P9GPjR6ChIhFvQGWaKZqGmDZs2i0oheaUi0t1G
 3sEiy/MXiLXtI5K4I5RT/k6ODDlK0CogBj5FEfM6PzybCUd9Mx9lBfhpsHxaFeh2
 IkadfScVvH/UJmQbfj6NCZzoFYa977DLFONh543nQ6KhF0LYWjeZgHZuf1Jcgf4H
 ayHQLjkUmu3jUSfjZDtbKjrAScpe+x+6YVRnREC8ao37YmVr0az+/dnpfriVJQct
 ybxXV/dFqgIc1nAYZT/wbKqyBkaE/lXsdUP2jPkfS2PdfrBwv+P6aYIlNSWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654528927; x=1654615327; bh=5ITxZxvR1UlRTYtQl9N1pR+J3NyP
 RM9g+aD58BJaVd4=; b=izqgZLioq8aklMwfTl4hqaFTY/rnYctpSmnX9FMQkuOz
 tp8Z881d3PFmihqGrSbqqa9s6SvEk1YiRsb2qlFt9uydneEYhL2D2n3xrttBkqfM
 dHijjfs7Tk6ymtIaNn2Sbya4Lku50zdcj4hX7oVDYq8qbM4K8APpqyP7eOBS48ul
 tX7n9tA4bP3AlLvN2zIkSMdWlWZimzEE2sUHqVaXjcRb3UOCMu3jcRAfEzJL0xhu
 pOK8/rOqnuYAZ3pZuka2tZAPveqE7B6zNLEBy8kP/zoSDfgGMfa6B3BzR351jRjh
 NSTnxyZ/nVv/UMJKhAXJceoRSut8HRXTGHNTFRVYcQ==
X-ME-Sender: <xms:nhueYuglc_InoQNB6GttWHlFl-3riobk4oqIHoUDBVnbzCgztQPX-w>
 <xme:nhueYvCv6xi_x3xouXP9GKa6wjYhZ6VnkP6wbKXRTXQ9xfxlX5TuxJxEjL8XgqC4N
 -rgKwZHJXXpVQ>
X-ME-Received: <xmr:nhueYmHhC6V5Hx3XYVU0paluWuacZD1HxQbXttofQkFbltLzWslX5Tvq_Uv7zY-Ub4qDXzeK5gIzTFDQG1B8JBJ-nOreLSNh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:nhueYnSI2xqLrxCR_rnVh3jUr1SbtiB6mofB0vsrzvjL8CiT12EUwQ>
 <xmx:nhueYrwVRUtDy61NE8chSESXAKeaXWT3fzCcrEHMxeL3qWllJkNW1g>
 <xmx:nhueYl7FJ7AwX4kbqirM7NYVML5ivcWsbGDpGcLFbxk7n9qsvkn-OA>
 <xmx:nxueYgqPTJCJTk5tOKOe8SP_1v66zB52d_QQu06I5592Or1Ocd5EgA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 11:22:06 -0400 (EDT)
Date: Mon, 6 Jun 2022 17:22:03 +0200
From: Greg KH <greg@kroah.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
Message-ID: <Yp4bmxFEBHwOlSf3@kroah.com>
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
 <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
 <YphX2erQp3e4mUba@kroah.com>
 <CtTIPo68VAvDRUp7-QFc0m-2SnikPFd0QpdogNj2xueFfyQKa3DQqiw3Meqtsu8vQgEuKX_-MPKbe7jQdf49-Y3z2TAYbajUrC5GKF0Dolk=@emersion.fr>
 <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
 <97e77916-93c9-4be2-a734-2b9f4170276f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97e77916-93c9-4be2-a734-2b9f4170276f@arm.com>
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
 Jason Ekstrand <jason.ekstrand@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 06, 2022 at 04:10:09PM +0100, Robin Murphy wrote:
> On 2022-06-02 07:47, Daniel Vetter wrote:
> > On Thu, 2 Jun 2022 at 08:34, Simon Ser <contact@emersion.fr> wrote:
> > > 
> > > On Thursday, June 2nd, 2022 at 08:25, Greg KH <greg@kroah.com> wrote:
> > > 
> > > > On Thu, Jun 02, 2022 at 06:17:31AM +0000, Simon Ser wrote:
> > > > 
> > > > > On Thursday, June 2nd, 2022 at 07:40, Greg KH greg@kroah.com wrote:
> > > > > 
> > > > > > On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
> > > > > > 
> > > > > > > To discover support for new DMA-BUF IOCTLs, user-space has no
> > > > > > > choice but to try to perform the IOCTL on an existing DMA-BUF.
> > > > > > 
> > > > > > Which is correct and how all kernel features work (sorry I missed the
> > > > > > main goal of this patch earlier and focused only on the sysfs stuff).
> > > > > > 
> > > > > > > However, user-space may want to figure out whether or not the
> > > > > > > IOCTL is available before it has a DMA-BUF at hand, e.g. at
> > > > > > > initialization time in a Wayland compositor.
> > > > > > 
> > > > > > Why not just do the ioctl in a test way? That's how we determine kernel
> > > > > > features, we do not poke around in sysfs to determine what is, or is
> > > > > > not, present at runtime.
> > > > > > 
> > > > > > > Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> > > > > > > subsystem to advertise supported features. Add a
> > > > > > > sync_file_import_export entry which indicates that importing and
> > > > > > > exporting sync_files from/to DMA-BUFs is supported.
> > > > > > 
> > > > > > No, sorry, this is not a sustainable thing to do for all kernel features
> > > > > > over time. Please just do the ioctl and go from there. sysfs is not
> > > > > > for advertising what is and is not enabled/present in a kernel with
> > > > > > regards to functionality or capabilities of the system.
> > > > > > 
> > > > > > If sysfs were to export this type of thing, it would have to do it for
> > > > > > everything, not just some random tiny thing of one kernel driver.
> > > > > 
> > > > > I'd argue that DMA-BUF is a special case here.
> > > > 
> > > > So this is special and unique just like everything else? :)
> > > > 
> > > > > To check whether the import/export IOCTLs are available, user-space
> > > > > needs a DMA-BUF to try to perform the IOCTL. To get a DMA-BUF,
> > > > > user-space needs to enumerate GPUs, pick one at random, load GBM or
> > > > > Vulkan, use that heavy-weight API to allocate a "fake" buffer on the
> > > > > GPU, export that buffer into a DMA-BUF, try the IOCTL, then teardown
> > > > > all of this. There is no other way.
> > > > > 
> > > > > This sounds like a roundabout way to answer the simple question "is the
> > > > > IOCTL available?". Do you have another suggestion to address this
> > > > > problem?
> > > > 
> > > > What does userspace do differently if the ioctl is present or not?
> > > 
> > > Globally enable a synchronization API for Wayland clients, for instance
> > > in the case of a Wayland compositor.
> > > 
> > > > And why is this somehow more special than of the tens of thousands of
> > > > other ioctl calls where you have to do exactly the same thing you list
> > > > above to determine if it is present or not?
> > > 
> > > For other IOCTLs it's not as complicated to obtain a FD to do the test
> > > with.
> > 
> > Two expand on this:
> > 
> > - compositor opens the drm render /dev node
> > - compositor initializes the opengl or vulkan userspace driver on top of that
> > - compositor asks that userspace driver to allocate some buffer, which
> > can be pretty expensive
> > - compositor asks the userspace driver to export that buffer into a dma-buf
> > - compositor can finally do the test ioctl, realizes support isn't
> > there and tosses the entire thing
> > 
> > read() on a sysfs file is so much more reasonable it's not even funny.
> 
> Just a drive-by observation, so apologies if I'm overlooking something
> obvious, but it sounds like the ideal compromise would be to expose a sysfs
> file which behaves as a dummy exported dma-buf. That way userspace could
> just open() it and try ioctl() directly - assuming that supported operations
> can fail distinctly from unsupported ones, or succeed as a no-op - which
> seems even simpler still.

ioctl() will not work on a sysfs file, sorry.
