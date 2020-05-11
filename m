Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 546941CD58F
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DC16E421;
	Mon, 11 May 2020 09:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A315D6E421;
 Mon, 11 May 2020 09:43:55 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id t199so14588847oif.7;
 Mon, 11 May 2020 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YO2ZrbWa/GjLyrkjg6sCgnAZgQAjgJWk4AMO7gsTNVw=;
 b=W4za8q6xCq1PKmE8TDaVI/YbrU6tqAlPw3FphOaONDGWKNRL+n6K8rSmWR95gSdRiB
 Pc72TnO3EiTLrsUZOm9sQ9P1mv8VLDl/jEofb3UQT982ll1L4zGpE+upTgjddatOLAGi
 vTjZ7BJoLpiDK2xvIqRWE4g2aK6pBxn4ErUuAAbwgR00NO6t/QQ0GQnRF7+CCx8vg5jb
 Z6vodzvYigvmI1gybtXoYIhvzlrouuL/Dah9ipcyPIL3UHonNON0i7OGh1x9WaaQwXl+
 9FErOVivQrBuiln/MSiNpAGkh7eH59IlB1cI28gkmcyr6hMcDhyW46K97SROLNgAiiej
 SryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YO2ZrbWa/GjLyrkjg6sCgnAZgQAjgJWk4AMO7gsTNVw=;
 b=V2Qj+VcixFkBVSyHMn1/WxOroTsn8RvJRiTWUJo3hxR/HdAdr/6ji6kt+o8NniFByc
 eVb7eadlrOH7T4hBoCS6nPVTR5+mPjpOI63dYCygugU7Nz51E0mEF1X2AFEXyY3FEnAa
 ydey96eSgIBkJ78S672Ko8p2IqOvMhamMtXi8FrT3FpJe2go87YXHAABoAV4hDOfE56E
 Y3qQA6zEUylQRF1VhAR5rwVwfb+EEnd2rJDbNeU7T3pb6/BN9vKN+AQvIrOhhmmgOmnG
 M6MkA9d8QW84jzS4ngCXEDOOR+SUfKTdY8Sm98X3ZLaT1RdTkTQ0SocScb3181bnfB/N
 YBrg==
X-Gm-Message-State: AGi0PuYeoMuAgII4j1mPV5Tl/n7BMdi9BrgWih5Yt3DSWCZUCUJ9Q1Yn
 30VbIPrwsSyxMvjbNPdnH2sb08k7a1pyBaxcnrw=
X-Google-Smtp-Source: APiQypK+nD0Gmx36F2wXwHrGVNh8L6LLcNUzenp1CD2DqFB/EQ8oek6utcYJ1Lr3zoWhnSPdbH5CwdqJePlWg1ebiqY=
X-Received: by 2002:aca:abd0:: with SMTP id
 u199mr18301648oie.130.1589190234071; 
 Mon, 11 May 2020 02:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-3-daniel.vetter@ffwll.ch>
 <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
In-Reply-To: <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Mon, 11 May 2020 12:43:09 +0300
Message-ID: <CAFCwf11MrovJbcutkuyhJpvAY9v9rtRdHAkY8wJF7S-z5vrWTg@mail.gmail.com>
Subject: Re: [PATCH 3/3] misc/habalabs: don't set default fence_ops->wait
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

And just FYI, the driver was written internally at 2016-17, where the
dma-buf module didn't check the .wait ops before calling it and that's
why the initialization of the default wait was there in the first
place.
I should have removed it when I upstreamed it but it missed my review.
Thanks,
Oded

On Mon, May 11, 2020 at 12:36 PM Oded Gabbay <oded.gabbay@gmail.com> wrote:
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
>
> Oded
>
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc:     Olof Johansson <olof@lixom.net>
> > Cc: Oded Gabbay <oded.gabbay@gmail.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  drivers/misc/habanalabs/command_submission.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/misc/habanalabs/command_submission.c b/drivers/misc/habanalabs/command_submission.c
> > index 409276b6374d..cc3ce759b6c3 100644
> > --- a/drivers/misc/habanalabs/command_submission.c
> > +++ b/drivers/misc/habanalabs/command_submission.c
> > @@ -46,7 +46,6 @@ static const struct dma_fence_ops hl_fence_ops = {
> >         .get_driver_name = hl_fence_get_driver_name,
> >         .get_timeline_name = hl_fence_get_timeline_name,
> >         .enable_signaling = hl_fence_enable_signaling,
> > -       .wait = dma_fence_default_wait,
> >         .release = hl_fence_release
> >  };
> >
> > --
> > 2.26.2
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
