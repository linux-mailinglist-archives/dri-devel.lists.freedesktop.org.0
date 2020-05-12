Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EE61CECD9
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 08:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65356E832;
	Tue, 12 May 2020 06:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF5E6E831
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 06:12:23 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id z17so9612853oto.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 23:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rDVhfwcqSVyx9q5/p16CBADSN5ABq1zW6fY3UNoJRwE=;
 b=GJU6+oDml8xnoT95xGt/51ibXnSnWHbS6L44A1d4aAxTIhM+TRN0GsMjxc6tOiQxij
 W1HgnyhjOqVZ4EeXD2+Ya67BUUhQZNpILTKhwGGkEyj+lgqcYywNl95I6T/MARS6UR7u
 VIlXBE4FZi1iC3oSuefMY08HMZx+TFAs4C+u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rDVhfwcqSVyx9q5/p16CBADSN5ABq1zW6fY3UNoJRwE=;
 b=q4aF/7ZDhUel1yQEAWGIGEYtoRqbbdU1TnAkqVEu/EZzywaf64UXGPM00kmAEyE0aF
 2Rlj5aLlHf17ms0N/JvM6BR3qU4CMsjpOsN8g/Ie1RI5chiF7yRgC+GWandRk1iZJCEw
 UsfMb9US5Rv+c7xcVFG1Rslr0Q8EnkgDFMr4RoMp+03H1hIW/2/w9THSmoXWAj42hCy4
 d9yLEu78ISeeREfTlEB3OFZahfJQaTmcVZqErToCDZ4yV0eiDzedu43uJsPjyMuVD1LU
 ROXNJk4ipwzMbuYgpXYYq3xwbzyuPbaWZYsMhGU5KuFsXH/vcitcO2lyp7RCR4CxQJxY
 /NSA==
X-Gm-Message-State: AGi0PuaXIr8EiIrP/CSFho1/MPTum93LmUMuUgiyaFzzj0w+xn8BzNbB
 NDfTCCEfqR2u+VFBsrQSFmUfLVd3gYharRVsnhrKrg==
X-Google-Smtp-Source: APiQypJhNRGRhinzAhGDFhJNon3eFMcfMUO5uhBHXbuwUw5/kLPwp8toKCD2lNCnnnIIniHhPlp9X7sj/2mlYxXCY6k=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr14792604ota.303.1589263942718; 
 Mon, 11 May 2020 23:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-3-daniel.vetter@ffwll.ch>
 <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
 <CAPM=9tyukFdDiM6-Mxd+ouXCt9Z4t6LRZwxq7DGoX9drrHnMdQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyukFdDiM6-Mxd+ouXCt9Z4t6LRZwxq7DGoX9drrHnMdQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 12 May 2020 08:12:11 +0200
Message-ID: <CAKMK7uF=SzeEBtZ9xH+jPzeML4V0QQuwBnPVw+OL+MUgTaaLzQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] misc/habalabs: don't set default
 fence_ops->wait
To: Dave Airlie <airlied@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 12, 2020 at 4:14 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 11 May 2020 at 19:37, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> >
> > On Mon, May 11, 2020 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > It's the default.
> > Thanks for catching that.
> >
> > >
> > > Also so much for "we're not going to tell the graphics people how to
> > > review their code", dma_fence is a pretty core piece of gpu driver
> > > infrastructure. And it's very much uapi relevant, including piles of
> > > corresponding userspace protocols and libraries for how to pass these
> > > around.
> > >
> > > Would be great if habanalabs would not use this (from a quick look
> > > it's not needed at all), since open source the userspace and playing
> > > by the usual rules isn't on the table. If that's not possible (because
> > > it's actually using the uapi part of dma_fence to interact with gpu
> > > drivers) then we have exactly what everyone promised we'd want to
> > > avoid.
> >
> > We don't use the uapi parts, we currently only using the fencing and
> > signaling ability of this module inside our kernel code. But maybe I
> > didn't understand what you request. You want us *not* to use this
> > well-written piece of kernel code because it is only used by graphics
> > drivers ?
> > I'm sorry but I don't get this argument, if this is indeed what you meant.
>
> We would rather drivers using a feature that has requirements on
> correct userspace implementations of the feature have a userspace that
> is open source and auditable.
>
> Fencing is tricky, cross-device fencing is really tricky, and having
> the ability for a closed userspace component to mess up other people's
> drivers, think i915 shared with closed habana userspace and shared
> fences, decreases ability to debug things.
>
> Ideally we wouldn't offer users known untested/broken scenarios, so
> yes we'd prefer that drivers that intend to expose a userspace fencing
> api around dma-fence would adhere to the rules of the gpu drivers.
>
> I'm not say you have to drop using dma-fence, but if you move towards
> cross-device stuff I believe other drivers would be correct in
> refusing to interact with fences from here.

The flip side is if you only used dma-fence.c "because it's there",
and not because it comes with an uapi attached and a cross-driver
kernel internal contract for how to interact with gpu drivers, then
there's really not much point in using it. It's a custom-rolled
wait_queue/event thing, that's all. Without the gpu uapi and gpu
cross-driver contract it would be much cleaner to just use wait_queue
directly, and that's a construct all kernel developers understand, not
just gpu folks. From a quick look at least habanalabs doesn't use any
of these uapi/cross-driver/gpu bits.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
