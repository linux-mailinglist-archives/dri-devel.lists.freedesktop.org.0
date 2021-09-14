Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C29740B25B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 16:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB476E4D0;
	Tue, 14 Sep 2021 14:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C949189E98;
 Tue, 14 Sep 2021 14:58:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96DB461159;
 Tue, 14 Sep 2021 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631631532;
 bh=sO7K4nLD8Mc8xn5UOKFPrX2HuHh5LR3bGo163cAsds0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TuPr7CDZ2U59DvY4KHWGuvehlmcWjNymmIyLtQaAaj/NwxOHHRNQO1VVC+pBgARe8
 Yxy43DJXh9XXc8cxch3+TK0OdCSoQjaupzvOTJncIEANBTmkPiyHjfbRMlR45k+c6Y
 g1tli811VotLCkESNMjsSvXuof0EgR3Z3UcmQ2YXlueBLGAvDwJnU/QhsZRicMlTNZ
 wmYxbK5u2dXZjd94Zx52ijl/ZMppJR21A2+Czo+oBtDMZ+jmzqW3diz2UiA9X+Qzu3
 /gU7KTkp7c5iYkcPnoK1yIEby3iBvDfXPsKwtVVmzHAmt2K2g0xdGkBLtwmCrjmDRm
 Kh9MVHTOTnCuQ==
Received: by mail-oi1-f177.google.com with SMTP id bi4so19367328oib.9;
 Tue, 14 Sep 2021 07:58:52 -0700 (PDT)
X-Gm-Message-State: AOAM530qUv6us7s8YQOusybaLdvLzyDbj05axIVjIaAwsCmONk611vKF
 ExrxB6oIDVDv/Eh1/PJr5J8k0leZ5SOgRwoZf3c=
X-Google-Smtp-Source: ABdhPJxVeTS/4JNRGwC903f+QhF2hSvwhyPj5Invrv2ftY17blLAru1BVfAfSs8MB5gXv2vQOjWBkLQJdnquJptLcZc=
X-Received: by 2002:a05:6808:2193:: with SMTP id
 be19mr1741155oib.102.1631631531843; 
 Tue, 14 Sep 2021 07:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <YUCvNzpyC091KeaJ@phenom.ffwll.local>
In-Reply-To: <YUCvNzpyC091KeaJ@phenom.ffwll.local>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 14 Sep 2021 17:58:25 +0300
X-Gmail-Original-Message-ID: <CAFCwf13WxpconckKoJOnsSGOaiqL=1RHMrpqOFVRcd2zm6iFmQ@mail.gmail.com>
Message-ID: <CAFCwf13WxpconckKoJOnsSGOaiqL=1RHMrpqOFVRcd2zm6iFmQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add p2p via dmabuf to habanalabs
To: Oded Gabbay <ogabbay@kernel.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Gal Pressman <galpress@amazon.com>, Yossi Leybovich <sleybo@amazon.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, 
 Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dsinger@habana.ai
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

On Tue, Sep 14, 2021 at 5:18 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Sep 12, 2021 at 07:53:07PM +0300, Oded Gabbay wrote:
> > Hi,
> > Re-sending this patch-set following the release of our user-space TPC
> > compiler and runtime library.
> >
> > I would appreciate a review on this.
>
> I think the big open we have is the entire revoke discussions. Having the
> option to let dma-buf hang around which map to random local memory ranges,
> without clear ownership link and a way to kill it sounds bad to me.
>
Hi Daniel, thanks for the reply.

What is this revocation requirement ?
Is it relevant to my case, where our device has a single user at a
time (only a single process can open the device character file) and
that user has ownership of the entire device local memory ?

Because I don't care if the user has this dma-buf object lying around,
as it only wastes device memory for that user. And the user can't
close the fd of the device until it has closed the fd of the dmabuf.

Or is the revocation referring to something else entirely ?

> I think there's a few options:
> - We require revoke support. But I've heard rdma really doesn't like that,
>   I guess because taking out an MR while holding the dma_resv_lock would
>   be an inversion, so can't be done. Jason, can you recap what exactly the
>   hold-up was again that makes this a no-go?
>
> - The other option I discussed is a bit more the exlusive device ownership
>   model we've had for gpus in drm of the really old kind. Roughly this
>   would work like this, in terms of drm_device:
>   - Only the current owner (drm_master in current drm code, but should
>     probably rename that to drm_owner) is allowed to use the accel driver.
>     So all ioctl would fail if you're not drm_master.
>   - On dropmaster/file close we'd revoke as much as possible, e.g.
>     in-flight commands, mmaps, anything really that can be revoked.
>   - For non-revokable things like these dma-buf we'd keep a drm_master
>     reference around. This would prevent the next open to acquire
>     ownership rights, which at least prevents all the nasty potential
>     problems.
>   - admin (or well container orchestrator) then has responsibility to
>     shoot down all process until the problem goes away (i.e. until you hit
>     the one with the rdma MR which keeps the dma-buf alive)
>
> - Not sure there's another reasonable way to do this without inviting some
>   problems once we get outside of the "single kernel instance per tenant"
>   use-case.
>
> Wrt implementation there's the trouble of this reinventing a bunch of drm
> stuff and concepts, but that's maybe for after we've figured out
> semantics.
>
> Also would be great if you have a pull request for the userspace runtime
> that shows a bit how this all gets used and tied together. Or maybe some
> pointers, since I guess retconning a PR in github is maybe a bit much.

hmm.. so actually this has only an API in the hl-thunk library. I have
not put it in github but I can do it fairly quickly.
But the callee of this API is not the userspace runtime. The callee is
another library which is responsible for doing scale-out of training
outside of a box of gaudi devices. That library implements collective
operations (e.g. all gather, all reduce) over multiple gaudi devices.
And in fact, the real user is the training framework (e.g. tensorflow,
pytorch) that calls these collective operations. The framework then
passes the dmabuf fd to libfabric (open source project) which uses
rdma-core to pass it to the rdma driver.

I can give you a short presentation on that if you want :)

>
> Cheers, Daniel
>
> >
> > Thanks,
> > Oded
> >
> > Oded Gabbay (1):
> >   habanalabs: define uAPI to export FD for DMA-BUF
> >
> > Tomer Tayar (1):
> >   habanalabs: add support for dma-buf exporter
> >
> >  drivers/misc/habanalabs/Kconfig             |   1 +
> >  drivers/misc/habanalabs/common/habanalabs.h |  22 +
> >  drivers/misc/habanalabs/common/memory.c     | 522 +++++++++++++++++++-
> >  drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
> >  drivers/misc/habanalabs/goya/goya.c         |   1 +
> >  include/uapi/misc/habanalabs.h              |  28 +-
> >  6 files changed, 570 insertions(+), 5 deletions(-)
> >
> > --
> > 2.17.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
