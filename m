Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFF1DBC5E
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 20:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4D86E873;
	Wed, 20 May 2020 18:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211EC8932D;
 Wed, 20 May 2020 18:10:13 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id x22so3273834otq.4;
 Wed, 20 May 2020 11:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tx9re6lXGFdfxVUAVwva8EahuEz3Z+j2jfuKERIypGA=;
 b=dZP/+Ezyao2q+g8UeMH7UCWOKPM2rUJz762yFGC8HBceR93568dZwtO5olvMji49Kw
 hEFJyjeG4dsi9+JmPSTjCeXXKuiqj0hGeAE1EhgcsbqTtFzlb2YXv/Kpftg/fF1kcRi3
 rEYiIiO6n0Hjllej82qDcasPEHahE1iPUkKzmdTzhZsddaMzMVqJp/jUsszHB4I9K4wM
 TnqWaN21p2xUge4/Ie4sNg6PVHtDFnBcO1bVtsdn30YyGe2g5q1Ph5HD0mi3FNrqcHct
 iwweP+6OfIZsahDggQGT/c92eZhpe1SDn/glDgk9w2BziuLYJPYzqcV2oh2ADOUoUSdZ
 Izvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tx9re6lXGFdfxVUAVwva8EahuEz3Z+j2jfuKERIypGA=;
 b=GN87LLnqzVosvj+gTrQRmFsZjKH+yc/tssfbehjKVF+hceuWUTqZA79NbcIN+gys/N
 uynfcTAxKzPx0ay4Iplmcc75OubfgSd6trnrpkaWqv/X1R+yHyH0TadvWFiPYlLkZuJn
 XsO80RtL/IW3HGfrEgpfBf8+HKmZwKzvSrF8Ft5tHaTxd/LdhBzrRVMN8RrYLZb8FkY2
 GQE8U6IisonROdtUK1P803CtHjeQKsiGNIleayQYFUkQgLYqIOmq7LcSQWTjPdeTBoLi
 D5WsENp2oxtPDTCwf24tzTJXvZRi5OUm53YS/laRM12EwPVj/B3RYVPYa9/5+ssez20C
 QfRg==
X-Gm-Message-State: AOAM533Bs4gZDkOpQauKxwNNWmLIgHkrxoi/VLJ/A4i6tqJ78zuTPLLr
 7KNRObyH1fj4p/r4E50a1uLW4yk9o+6JaCOJ1uk=
X-Google-Smtp-Source: ABdhPJwoSeRQqKhyxkLlOF1QXnKRkw6Q0I8K11tOPLyQ2ECm09g1/OdzJ2KuQAmdH5Tb6w7Z2yIJxgImrYj8J+weL4M=
X-Received: by 2002:a4a:88e4:: with SMTP id q33mr4005168ooh.27.1589998212250; 
 Wed, 20 May 2020 11:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-3-daniel.vetter@ffwll.ch>
 <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
 <CAPM=9tyukFdDiM6-Mxd+ouXCt9Z4t6LRZwxq7DGoX9drrHnMdQ@mail.gmail.com>
 <CAKMK7uF=SzeEBtZ9xH+jPzeML4V0QQuwBnPVw+OL+MUgTaaLzQ@mail.gmail.com>
 <CAFCwf110j5EDNH9nvrVX9fQ5JkEt5B217snyiTyfpFz8yAkxNg@mail.gmail.com>
 <20200520180456.GC206103@phenom.ffwll.local>
In-Reply-To: <20200520180456.GC206103@phenom.ffwll.local>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 20 May 2020 21:09:42 +0300
Message-ID: <CAFCwf10Hx85bqDKKrP8M=nyaLdDo=pTQtWK0QFPh1EPUfsxEoA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] misc/habalabs: don't set default
 fence_ops->wait
To: Oded Gabbay <oded.gabbay@gmail.com>, Dave Airlie <airlied@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Olof Johansson <olof@lixom.net>, 
 Daniel Vetter <daniel.vetter@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 20, 2020 at 9:05 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, May 14, 2020 at 02:38:38PM +0300, Oded Gabbay wrote:
> > On Tue, May 12, 2020 at 9:12 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > On Tue, May 12, 2020 at 4:14 AM Dave Airlie <airlied@gmail.com> wrote:
> > > >
> > > > On Mon, 11 May 2020 at 19:37, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> > > > >
> > > > > On Mon, May 11, 2020 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > >
> > > > > > It's the default.
> > > > > Thanks for catching that.
> > > > >
> > > > > >
> > > > > > Also so much for "we're not going to tell the graphics people how to
> > > > > > review their code", dma_fence is a pretty core piece of gpu driver
> > > > > > infrastructure. And it's very much uapi relevant, including piles of
> > > > > > corresponding userspace protocols and libraries for how to pass these
> > > > > > around.
> > > > > >
> > > > > > Would be great if habanalabs would not use this (from a quick look
> > > > > > it's not needed at all), since open source the userspace and playing
> > > > > > by the usual rules isn't on the table. If that's not possible (because
> > > > > > it's actually using the uapi part of dma_fence to interact with gpu
> > > > > > drivers) then we have exactly what everyone promised we'd want to
> > > > > > avoid.
> > > > >
> > > > > We don't use the uapi parts, we currently only using the fencing and
> > > > > signaling ability of this module inside our kernel code. But maybe I
> > > > > didn't understand what you request. You want us *not* to use this
> > > > > well-written piece of kernel code because it is only used by graphics
> > > > > drivers ?
> > > > > I'm sorry but I don't get this argument, if this is indeed what you meant.
> > > >
> > > > We would rather drivers using a feature that has requirements on
> > > > correct userspace implementations of the feature have a userspace that
> > > > is open source and auditable.
> > > >
> > > > Fencing is tricky, cross-device fencing is really tricky, and having
> > > > the ability for a closed userspace component to mess up other people's
> > > > drivers, think i915 shared with closed habana userspace and shared
> > > > fences, decreases ability to debug things.
> > > >
> > > > Ideally we wouldn't offer users known untested/broken scenarios, so
> > > > yes we'd prefer that drivers that intend to expose a userspace fencing
> > > > api around dma-fence would adhere to the rules of the gpu drivers.
> > > >
> > > > I'm not say you have to drop using dma-fence, but if you move towards
> > > > cross-device stuff I believe other drivers would be correct in
> > > > refusing to interact with fences from here.
> > >
> > > The flip side is if you only used dma-fence.c "because it's there",
> > > and not because it comes with an uapi attached and a cross-driver
> > > kernel internal contract for how to interact with gpu drivers, then
> > > there's really not much point in using it. It's a custom-rolled
> > > wait_queue/event thing, that's all. Without the gpu uapi and gpu
> > > cross-driver contract it would be much cleaner to just use wait_queue
> > > directly, and that's a construct all kernel developers understand, not
> > > just gpu folks. From a quick look at least habanalabs doesn't use any
> > > of these uapi/cross-driver/gpu bits.
> > > -Daniel
> >
> > Hi Daniel,
> > I want to say explicitly that we don't use the dma-buf uapi parts, nor
> > we intend to use them to communicate with any GPU device. We only use
> > it as simple completion mechanism as it was convenient to use.
> > I do understand I can exchange that mechanism with a simpler one, and
> > I will add an internal task to do it (albeit not in a very high
> > priority) and upstream it, its just that it is part of our data path
> > so we need to thoroughly validate it first.
>
> Sounds good.
>
> Wrt merging this patch here, can you include that in one of your next
> pulls? Or should I toss it entirely, waiting for you to remove dma_fence
> outright?

I'll include it in the next pull.
Thanks,
Oded
>
> Thanks, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
