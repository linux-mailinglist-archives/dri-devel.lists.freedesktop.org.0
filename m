Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039A21CEAA3
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 04:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4480E6E093;
	Tue, 12 May 2020 02:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47A26E087;
 Tue, 12 May 2020 02:14:33 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id s21so1556172ejd.2;
 Mon, 11 May 2020 19:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6gJvFOJgRmCUuHQ9KCv0CAQBXJvMZ3ZEqpa1faKKd80=;
 b=D6meoNPiM/kyzO8itLiSOkXRVo2//1y42iO0SvsJphtgJc+98LNMkQyuYCgzAGZueb
 MCqVzNdD6z41HnSMAh6Nq4oQc+co5pwat8b0NK+qxYWE4hBAcuwkjPeFRL6eMIPtmsOc
 CHgXW0JqigelR2oxmJ6ZpGfv7ABk4iGu5Le9PUPfojeEZpjHcpl+bBDOqejGvLFgHLNP
 L64GyHrJFQ+dXLZeKuHP5qNfLXqcMotUKFo+0JjY+SeZ7aSKN+pky2j9aB2GCQxxYEOe
 0KK7mN6qN0ZprKspu11gTihjR5yE0Nts47MfgiP2KZjQInixK+KnscSeSP26B5iI+rT+
 KZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6gJvFOJgRmCUuHQ9KCv0CAQBXJvMZ3ZEqpa1faKKd80=;
 b=ZLGUhgCyq6wux2bdcw679c9XoPJJwjhrk3xB0WAFdxmAZBquz0omoEJ6iEQUpjolK1
 6LiNCZM1ecswYuVyQOpZQmFbo0rvxZ0N4RElc55vION/4D28wvG+r8d2t6GMzL3V/MOZ
 yIUs1UkXfP0tB09IfoEYAv0x1eh4uAhkTg4gXwreOpyh27AKl4onstIF1rYazmsszC/F
 QT7mr08441kIta/tPrHVTrqfXzgc1vgzdqUmOf8ICH7OGfGjmZMyuwQxr+8rgZxpwJCF
 OV4+oMlaH1qfFfNM28H2aSyhtFTvDJOBnnHZkKWv+rhMIa7jEbPq0aA92djxKGVnRjwn
 WOsw==
X-Gm-Message-State: AGi0PuYE96Js3f5AVRY9JiLtNh9RTk3QXAuowOeZukUlcovHlovUIX8y
 fUkZ6mVUGM2x1ZNEQHwu3PoA13msO+rSlYRsECk=
X-Google-Smtp-Source: APiQypKvoGJ05XwMC2ywwTCNcJ1snijF1Y8YHOxuAycdEcZGBHIMpEuM9QUFeK3xCS81J/YmfWca02XITf2P9jmfZVw=
X-Received: by 2002:a17:907:2155:: with SMTP id
 rk21mr16482845ejb.163.1589249672229; 
 Mon, 11 May 2020 19:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-3-daniel.vetter@ffwll.ch>
 <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
In-Reply-To: <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 12 May 2020 12:14:20 +1000
Message-ID: <CAPM=9tyukFdDiM6-Mxd+ouXCt9Z4t6LRZwxq7DGoX9drrHnMdQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] misc/habalabs: don't set default
 fence_ops->wait
To: Oded Gabbay <oded.gabbay@gmail.com>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 May 2020 at 19:37, Oded Gabbay <oded.gabbay@gmail.com> wrote:
>
> On Mon, May 11, 2020 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > It's the default.
> Thanks for catching that.
>
> >
> > Also so much for "we're not going to tell the graphics people how to
> > review their code", dma_fence is a pretty core piece of gpu driver
> > infrastructure. And it's very much uapi relevant, including piles of
> > corresponding userspace protocols and libraries for how to pass these
> > around.
> >
> > Would be great if habanalabs would not use this (from a quick look
> > it's not needed at all), since open source the userspace and playing
> > by the usual rules isn't on the table. If that's not possible (because
> > it's actually using the uapi part of dma_fence to interact with gpu
> > drivers) then we have exactly what everyone promised we'd want to
> > avoid.
>
> We don't use the uapi parts, we currently only using the fencing and
> signaling ability of this module inside our kernel code. But maybe I
> didn't understand what you request. You want us *not* to use this
> well-written piece of kernel code because it is only used by graphics
> drivers ?
> I'm sorry but I don't get this argument, if this is indeed what you meant.

We would rather drivers using a feature that has requirements on
correct userspace implementations of the feature have a userspace that
is open source and auditable.

Fencing is tricky, cross-device fencing is really tricky, and having
the ability for a closed userspace component to mess up other people's
drivers, think i915 shared with closed habana userspace and shared
fences, decreases ability to debug things.

Ideally we wouldn't offer users known untested/broken scenarios, so
yes we'd prefer that drivers that intend to expose a userspace fencing
api around dma-fence would adhere to the rules of the gpu drivers.

I'm not say you have to drop using dma-fence, but if you move towards
cross-device stuff I believe other drivers would be correct in
refusing to interact with fences from here.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
