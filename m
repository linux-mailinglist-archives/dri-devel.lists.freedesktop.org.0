Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B23BD6DE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 14:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F076E069;
	Tue,  6 Jul 2021 12:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FDC6E069;
 Tue,  6 Jul 2021 12:46:17 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 t24-20020a9d7f980000b029046f4a1a5ec4so21461754otp.1; 
 Tue, 06 Jul 2021 05:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=sCjXp3xF1YSalO2+qz5OYyZixLhy0ty98Vfkg+SLNfU=;
 b=NebIVlImsk/VQNEBC9xhHI8KKnEPayGZn2ZyIMxFnPx0YDhqtNAWoIKAXIXd7A6yI1
 Z/ZqdKIIzbjxYaq/e/KIf4Ty2v8ZKxhCT2fZu+d5f+oLC5pZRukodlHjEJ63d9cYEnZH
 Z8FGRRxvPytz47HM1SRivXkHFZHPHo67ltwBZfLhKd4wvK1s2l09//DgjYPbQ2QzlM1w
 UwYRJ80jYqhAcKo/vKem03qSyf3ye/3jPTBdjCxDdMDf4kgNIN0M8pNZTgQviynWgyra
 a1HZFz50KvOSjqacuprw+IsW3+7YMHolQy0dGBV0wg4zyt0xWwtlY8NdkbeuXI9GWgZ1
 H/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=sCjXp3xF1YSalO2+qz5OYyZixLhy0ty98Vfkg+SLNfU=;
 b=kFjKT5FFCCjhHTaIPpw1aa1/zCrxDn+lg7NlDKuyWj386Qqs327bpFfFIxm1x3HCYi
 QDLDDNuqsNNBV2BLbBbqTvqYpixgpX7TA67Zc2OJxRjF+mYGWVNWE7H5Kfusz5dCMb36
 h4DqVqgyYXz3ieN1v12LGMytWKVDJn1NHINFMM9IhjtJLaFNvkH6s96kYwicU5XM0g7r
 CCxxKtRJuxxgGyoxoquolJLUKHGkIJHB/YwuoketqurwI8fOwHoJrUrDScjI/yKibXfU
 t/Mom9E3kXb3+lsPLS/JWDWqFV5EVCpPfl9uflJ949ICetmNbEeIBgWjFKJWDgKXAyLL
 41JA==
X-Gm-Message-State: AOAM533gexpDUgdINlPEQwuLCxzj7m7Dr4+nnjkR4CHog9KlGg6DI2DG
 aC4i5YqIuqgsXc7xzh2byyW9QhcRRV71tQETaio=
X-Google-Smtp-Source: ABdhPJzKl+ncA9+SgwqYnKj9X6RvPNw8/DFp4We+uboCS13WvUQF4K4WE0yutJoNe8KTfvhc9SuTE16Alt3g9Wb5p6M=
X-Received: by 2002:a05:6830:159a:: with SMTP id
 i26mr5598551otr.339.1625575576243; 
 Tue, 06 Jul 2021 05:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <20210706122110.GA18273@lst.de> <YORLTmyoXDtoM9Ta@phenom.ffwll.local>
In-Reply-To: <YORLTmyoXDtoM9Ta@phenom.ffwll.local>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 6 Jul 2021 15:45:49 +0300
Message-ID: <CAFCwf114KEH-kO6w+nmbqKKdaGuqy3iOpHJi=5ZWqT3cgDm4Cw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To: Christoph Hellwig <hch@lst.de>, Oded Gabbay <ogabbay@kernel.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Gal Pressman <galpress@amazon.com>, sleybo@amazon.com, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma <linux-rdma@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, 
 Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Leon Romanovsky <leonro@nvidia.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 3:23 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jul 06, 2021 at 02:21:10PM +0200, Christoph Hellwig wrote:
> > On Tue, Jul 06, 2021 at 10:40:37AM +0200, Daniel Vetter wrote:
> > > > Greg, I hope this will be good enough for you to merge this code.
> > >
> > > So we're officially going to use dri-devel for technical details review
> > > and then Greg for merging so we don't have to deal with other merge
> > > criteria dri-devel folks have?
> > >
> > > I don't expect anything less by now, but it does make the original claim
> > > that drivers/misc will not step all over accelerators folks a complete
> > > farce under the totally-not-a-gpu banner.
> > >
> > > This essentially means that for any other accelerator stack that doesn't
> > > fit the dri-devel merge criteria, even if it's acting like a gpu and uses
> > > other gpu driver stuff, you can just send it to Greg and it's good to go.
> > >
> > > There's quite a lot of these floating around actually (and many do have
> > > semi-open runtimes, like habanalabs have now too, just not open enough to
> > > be actually useful). It's going to be absolutely lovely having to explain
> > > to these companies in background chats why habanalabs gets away with their
> > > stack and they don't.
> >
> > FYI, I fully agree with Daniel here.  Habanlabs needs to open up their
> > runtime if they want to push any additional feature in the kernel.
> > The current situation is not sustainable.
Well, that's like, your opinion...

>
> Before anyone replies: The runtime is open, the compiler is still closed.
> This has become the new default for accel driver submissions, I think
> mostly because all the interesting bits for non-3d accelerators are in the
> accel ISA, and no longer in the runtime. So vendors are fairly happy to
> throw in the runtime as a freebie.
>
> It's still incomplete, and it's still useless if you want to actually hack
> on the driver stack.
> -Daniel
> --
I don't understand what's not sustainable here.

There is zero code inside the driver that communicates or interacts
with our TPC code (TPC is the Tensor Processing Core).
Even submitting works to the TPC is done via a generic queue
interface. And that queue IP is common between all our engines
(TPC/DMA/NIC). The driver provides all the specs of that queue IP,
because the driver's code is handling that queue. But why is the TPC
compiler code even relevant here ?

btw, you can today see our TPC code at
https://github.com/HabanaAI/Habana_Custom_Kernel
There is a link there to the TPC user guide and link to download the
LLVM compiler.

Oded
