Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCAA21BE3D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 22:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2556ED02;
	Fri, 10 Jul 2020 20:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CA66E175
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 20:02:32 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w17so5760136oie.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 13:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hlzdQKgtPmO74k0pNR7vHuIZBrt/Pc63RtVTndWe5dA=;
 b=SqNPnTQbjsymEOAYWvf7HTkD0FI+HW6j/e6KRe6XGJh3lSuGZ0C7kP/iBUFjVJ03M5
 t8w6HTmvlfEqaW7ZR4/WDh2zFfGdT+tuiUcDAyD+AEP04wFuCMGfRQQM26yq17Soms89
 nnpW0b1zmvAznK5+R6nx5wurVKlahUyCP/oLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hlzdQKgtPmO74k0pNR7vHuIZBrt/Pc63RtVTndWe5dA=;
 b=JsiTOZOQ1KB9N6I4VMjius9XvljR1bVHVBKQezQfMquXgeCmRfZi5WueomuQ+LfA6O
 LASqAm+CsjYYNJ0XF/9Wb3LlQmcx/AWCTOsSgjTu4lwhJnRHLiBdZG8j7y5RxiGwKmcV
 3OW/tfD7dWiWv8oNe6zeCEIouHC1C1Igi3QUoiz6dRVIYhSOvTPfAxubcwBNiaoSb0aZ
 kQLm4rMDT9HT6B0I9SvQh3Gyayg0GK++mGMvlH2WqSm6zU0HnKy/Gi/GX0GQ19pUSp3B
 Enw/UZiYUY4fks9jaBQbTT1u+DETAr1WF94Vl1rJ/Ba1sZ6Clpl/Bvb7/9k6Fyh3StyB
 hrng==
X-Gm-Message-State: AOAM530BE3hoxcOoOw8db/HyeAEx1VOrtjeFfF87xhm5fKZoXDlMzjVN
 ZKmuzK2ioMkCdo1Hsbxl95eereInssd7djWnLr6ERERW
X-Google-Smtp-Source: ABdhPJyXe/UuJLRx5f5TlPpv/BPhnkWHORX2InNLi0AlJObIla3gh+GkiBljOI27Z+bfXCvGSQK4tsearkrRp5oifn8=
X-Received: by 2002:aca:da03:: with SMTP id r3mr5553679oig.14.1594411351996;
 Fri, 10 Jul 2020 13:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-3-daniel.vetter@ffwll.ch>
 <20200709080911.GP3278063@phenom.ffwll.local>
 <20200710124357.GB23821@mellanox.com>
 <5c163d74-4a28-1d74-be86-099b4729a2e0@amd.com>
 <20200710125453.GC23821@mellanox.com>
 <4f4a2cf7-f505-8494-1461-bd467870481e@amd.com>
 <20200710134826.GD23821@mellanox.com>
 <CAKMK7uGSUULTmL=bDXty6U4e37dzLHzu7wgUyOxo2CvR9KvXGg@mail.gmail.com>
 <20200710142347.GE23821@mellanox.com>
In-Reply-To: <20200710142347.GE23821@mellanox.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 10 Jul 2020 22:02:20 +0200
Message-ID: <CAKMK7uFK6Os5ALHEBr7tqCMtmHS1FpuDeOvqs40GVMv2kqJ90g@mail.gmail.com>
Subject: Re: [PATCH 02/25] dma-fence: prime lockdep annotations
To: Jason Gunthorpe <jgg@mellanox.com>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>, kernel test robot <lkp@intel.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 4:23 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Fri, Jul 10, 2020 at 04:02:35PM +0200, Daniel Vetter wrote:
>
> > > dma_fence only possibly makes some sense if you intend to expose the
> > > completion outside a single driver.
> > >
> > > The prefered kernel design pattern for this is to connect things with
> > > a function callback.
> > >
> > > So the actual use case of dma_fence is quite narrow and tightly linked
> > > to DRM.
> > >
> > > I don't think we should spread this beyond DRM, I can't see a reason.
> >
> > Yeah v4l has a legit reason to use dma_fence, android wants that
> > there.
>
> 'legit' in the sense the v4l is supposed to trigger stuff in DRM when
> V4L DMA completes? I would still see that as part of DRM

Yes, and also the other way around. But thus far it didn't land.
-Daniel

> Or is it building a parallel DRM like DMA completion graph?
>
> > > Trying to improve performance of limited HW by using sketchy
> > > techniques at the cost of general system stability should be a NAK.
> >
> > Well that's pretty much gpu drivers, all the horrors for a bit more speed :-)
> >
> > On the text itself, should I upgrade to "must not" instead of "should
> > not"? Or more needed?
>
> Fundamentally having some unknowable graph of dependencies where parts
> of the graph can be placed in critical regions like notifiers is a
> complete maintenance nightmare.
>
> I think building systems like this should be discouraged :\

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
