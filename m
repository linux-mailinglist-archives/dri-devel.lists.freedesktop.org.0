Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C70A3BD801
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 15:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4F86E4AB;
	Tue,  6 Jul 2021 13:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8206E49A;
 Tue,  6 Jul 2021 13:46:04 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id h9so24604995oih.4;
 Tue, 06 Jul 2021 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P8uEMl95CcElB/VMdkCpxQdT/gNuuy9S+LwKiPgsqZY=;
 b=JnNq6A1PzKrmVm04br5T+cm8I9KY4qBZPOkNrk9HUTPLW1TQXae287oX0gIMl2b7Aj
 j5wgUydF+bW5O7Q3fktCfPQrM0ECZiLgktOTRS5J3yNaQET4mHFVw9+E/CJpJ3n1GuLb
 pFwHGCkhVD6KMOsgTpUXYxoPcq2TS5uuW5uZO0YwtBvNUFkl9qR2cCHxd1ayML8jGo48
 1suYx40m2Rf0rfmLTlPH5BjJKoplC6HETWN+YaD2M5oCVvMdIRoYvltAu1gVnLSTxv6k
 4GQaE7IYqIo5B2rqHhACt9LSw9MjCsOc42qikKf4r988dlw+Yb7v89C8bFKoJ42a/tOw
 uLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8uEMl95CcElB/VMdkCpxQdT/gNuuy9S+LwKiPgsqZY=;
 b=MyZEU5FUYI9h5QqSTaxLTa+QvzlkV+SdsQUWeiaf6Br3c3ZSwmiwF7A5ftJwVn63JR
 /ZzK0h++Q/ME6H7qunnMGoqo+9VfhQwzKXYY1XNpQsa3clla21x9q7qXGWJUp5MMvNay
 iW2Nc2sbvCSVhP2Yv+xhnJN8V3nFsEZ9B+iymRnj1K4OAjWsj+dOys4N2kziYvUCoHmI
 C+kajZdpuLPYGNxrZfbkSBaHpXFPGbe9Fbd9++q4oA0MIrE2edceibDO2G2Yc0CCITPr
 3dO+huElUicnrv7CQCYB/oZZUcz1Zp9FRXUWPQWg+QjUH/eBw1KsrAlVFO5KRKNx+DGL
 kIRA==
X-Gm-Message-State: AOAM531kHlMDNTlPn7IjoH7p2yWwiR9pYzB8ughpyn3ENSHxTDGkq93i
 DS6YNQpq5z7jdFFIVE+TCQCFQJOAOLNTZsMhTB4=
X-Google-Smtp-Source: ABdhPJwkExmHGJOJByLgza0xDf2376NCdcPCGetUEbvBprZgERi3BWg3OcXrM2D0nNnQMkdKxEFEevgjnQXUmb/8m1o=
X-Received: by 2002:aca:5843:: with SMTP id m64mr529242oib.130.1625579163840; 
 Tue, 06 Jul 2021 06:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <20210706122110.GA18273@lst.de> <YORLTmyoXDtoM9Ta@phenom.ffwll.local>
 <CAFCwf114KEH-kO6w+nmbqKKdaGuqy3iOpHJi=5ZWqT3cgDm4Cw@mail.gmail.com>
 <CAKMK7uHfCbNQJwbXgLC9ibk71kVG7TBK4bfFxzX82ziSgqG9nw@mail.gmail.com>
In-Reply-To: <CAKMK7uHfCbNQJwbXgLC9ibk71kVG7TBK4bfFxzX82ziSgqG9nw@mail.gmail.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 6 Jul 2021 16:45:36 +0300
Message-ID: <CAFCwf12DJbk-CYJeRc3E5RCu+++ghO=9xwRo7vy=8VhH+z3bHA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Christoph Hellwig <hch@lst.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jul 6, 2021 at 2:46 PM Oded Gabbay <oded.gabbay@gmail.com> wrote:
> >
> > On Tue, Jul 6, 2021 at 3:23 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Jul 06, 2021 at 02:21:10PM +0200, Christoph Hellwig wrote:
> > > > On Tue, Jul 06, 2021 at 10:40:37AM +0200, Daniel Vetter wrote:
> > > > > > Greg, I hope this will be good enough for you to merge this code.
> > > > >
> > > > > So we're officially going to use dri-devel for technical details review
> > > > > and then Greg for merging so we don't have to deal with other merge
> > > > > criteria dri-devel folks have?
> > > > >
> > > > > I don't expect anything less by now, but it does make the original claim
> > > > > that drivers/misc will not step all over accelerators folks a complete
> > > > > farce under the totally-not-a-gpu banner.
> > > > >
> > > > > This essentially means that for any other accelerator stack that doesn't
> > > > > fit the dri-devel merge criteria, even if it's acting like a gpu and uses
> > > > > other gpu driver stuff, you can just send it to Greg and it's good to go.
> > > > >
> > > > > There's quite a lot of these floating around actually (and many do have
> > > > > semi-open runtimes, like habanalabs have now too, just not open enough to
> > > > > be actually useful). It's going to be absolutely lovely having to explain
> > > > > to these companies in background chats why habanalabs gets away with their
> > > > > stack and they don't.
> > > >
> > > > FYI, I fully agree with Daniel here.  Habanlabs needs to open up their
> > > > runtime if they want to push any additional feature in the kernel.
> > > > The current situation is not sustainable.
> > Well, that's like, your opinion...
> >
> > >
> > > Before anyone replies: The runtime is open, the compiler is still closed.
> > > This has become the new default for accel driver submissions, I think
> > > mostly because all the interesting bits for non-3d accelerators are in the
> > > accel ISA, and no longer in the runtime. So vendors are fairly happy to
> > > throw in the runtime as a freebie.
> > >
> > > It's still incomplete, and it's still useless if you want to actually hack
> > > on the driver stack.
> > > -Daniel
> > > --
> > I don't understand what's not sustainable here.
> >
> > There is zero code inside the driver that communicates or interacts
> > with our TPC code (TPC is the Tensor Processing Core).
> > Even submitting works to the TPC is done via a generic queue
> > interface. And that queue IP is common between all our engines
> > (TPC/DMA/NIC). The driver provides all the specs of that queue IP,
> > because the driver's code is handling that queue. But why is the TPC
> > compiler code even relevant here ?
>
> Can I use the hw how it's intended to be used without it?
You can use the h/w with the userspace stack we are providing in our
github repos + website.
Part of the userspace stack is open sourced, part is closed source.
And I'm actively working on opening up more stuff as we go along.

>
> If the answer is no, then essentially what you're doing with your
> upstream driver is getting all the benefits of an upstream driver,
> while upstream gets nothing. We can't use your stack, not as-is. Sure
> we can use the queue, but we can't actually submit anything
> interesting. And I'm pretty sure the point of your hw is to do more
> than submit no-op packets to a queue.
>
> This is all "I want my cake and eat it too" approach to upstreaming,
> and it's totally fine attitude to have, but if you don't see why
> there's maybe an different side to it then I don't get what you're
> arguing. Upstream isn't free lunch for nothing.
>
> Frankly I'm starting to assume you're arguing this all in bad faith
> just because habanalabds doesn't want to actually have an open driver
> stack, so any attack is good, no matter what. Which is also what
> everyone else does who submits their accel driver to upstream, and
> which gets us back to the starting point of this sub-thread of me
> really appreciation how this will improve background discussions going
> forward for everyone.
>
> Like if the requirement for accel drivers truly is that you can submit
> a dummy command to the queues then I have about 5-10 drivers at least
> I could merge instantly. For something like the intel gpu driver it
> would be about 50 lines of code (including all the structure boiler
> plate the ioctls require)in userspace to submit a dummy queue command.
> GPU and accel vendors would really love that, because it would allow
> them to freeload on upstream and do essentially nothing in return.
>
> And we'd end up with an unmaintainable disaster of a gpu or well
> accelerator subsystem because there's nothing you can change or
> improve because all the really useful bits of the stack are closed.
> And ofc that's not any companies problem anymore, so ofc you with the
> habanalabs hat on don't care and call this *extreme*.
>
> > btw, you can today see our TPC code at
> > https://github.com/HabanaAI/Habana_Custom_Kernel
> > There is a link there to the TPC user guide and link to download the
> > LLVM compiler.
>
> I got stuck clicking links before I found the source for that llvm
> compiler. Can you give me a direct link to the repo with sourcecode
> instead please?
The source code for the LLVM compiler is not available yet. That's one
of the parts I'm working on getting in the open.
Having said that, I don't think (and I'm not alone at this) that this
should be a pre-requirement for upstreaming kernel drivers of any
type.
And we had this discussion in the past, I'm sure we are both tired of
repeating ourselves.

>
> Thanks, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
