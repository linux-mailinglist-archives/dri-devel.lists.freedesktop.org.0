Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E667E4260D4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 02:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3686E04E;
	Fri,  8 Oct 2021 00:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0976A6E04E;
 Fri,  8 Oct 2021 00:00:12 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id r1so17147880ybo.10;
 Thu, 07 Oct 2021 17:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=525REZtEeK0PFXhhzxFmSB8FcMG0mIL99+Md9Sh4UyI=;
 b=DqOdOwDJqcLiF+La2Dg1kaSYIsThJfYHt2LFa1VQB0w9gkLXQhokJtJHWFs9t73bWJ
 fea3c/m79MMYnmyW2Of9Aq6uq730fKdC58YSS+1/M/g1ErZfid3pPx9juNi+kzUPm4cR
 99rKU82ARLFAlyKv/dOxu/oiSBCVbDzUdnwuSYtjQPul7N6UoPHiigCj2Q9tobEiEm/i
 NZ+hThm9NrfLxaZQywggKUcGbruAcdfGFG0UtAzzyHGQUCOLqP1w9HSZZg0NUPE2iIBm
 waJ+e+vAJVxvvp+TwDIw349XikDiY2N6xn95uMyTPYGfaMkQFLaFbWHJniNGvVY4CGAy
 wNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=525REZtEeK0PFXhhzxFmSB8FcMG0mIL99+Md9Sh4UyI=;
 b=jJxs1X+pKK4gCUEY7oY91ilhOBCdaGgOCDEC8Kj7yfR4Pk40J+pYrWGboQKsL3+n7T
 HMiHVFR65XIN/ZEtXSQbaoJWtPCJ0u9LP5256NC2FTuupf4HnKb7W0L3dmvRqPB/sA9r
 anTrDTdcHiUdBjE1nKTz/yGI9oWWuCgYSL2N2KUi7p2bCNYuxPmenIxSVRnTEXQpRoeI
 zek+zqVG1o8x1RsvAJHOPtSfWt44fXz9wxfA4hWz9t6x7DoBl6wQX8EqCiFgDElameCP
 Cvlu4wI/+ofXzq1N936gxnNpJtGD1CeMoBINVe+Bm2beBgLWeiftYAGbAG2vBCkszeN4
 SCzw==
X-Gm-Message-State: AOAM530t5yJY8+5+qnBAXmFKzBH6lK4mAqiTZMT4JfHlbyMBx0A4Y49h
 xnhKihhARaem5F3aBa3oApBTSV+kw2rrgHChkDc=
X-Google-Smtp-Source: ABdhPJxxm5SOn3w6dvn60Fm3ACaWzgy85Fy4Tbn0+YzDCnyr8cOPzcronUtgdAdVZYUPd+W8tWCocGA70ZXQDwQY8s0=
X-Received: by 2002:a25:9a81:: with SMTP id s1mr24781ybo.230.1633651210963;
 Thu, 07 Oct 2021 17:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211007214117.231472-1-marex@denx.de>
 <CACO55tsgmtR1CqdJOBMu9oQEEojfpnUwWNvab9gA7ZuZmyiSmA@mail.gmail.com>
In-Reply-To: <CACO55tsgmtR1CqdJOBMu9oQEEojfpnUwWNvab9gA7ZuZmyiSmA@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 8 Oct 2021 09:59:59 +1000
Message-ID: <CACAvsv54TiYbG1SFnkRdcbO0yiUR6wuHn=wWJFDGEr5shhQ5wQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/fifo: Reinstate the correct engine bit
 programming
To: Karol Herbst <kherbst@redhat.com>
Cc: Marek Vasut <marex@denx.de>, dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <nouveau@lists.freedesktop.org>, stable@vger.kernel.org, 
 Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>
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

On Fri, 8 Oct 2021 at 07:46, Karol Herbst <kherbst@redhat.com> wrote:
>
> Reviewed-by: Karol Herbst <kherbst@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

>
> I haven't checked if other places need fixing up yet, and I still want
> to test this patch, but I won't get to it until Monday. But if
> everything is in place we can get this pushed next week so we can
> finally fix this annoying issue :) I was also seeing some minor
> graphical corruptions which would be cool if this patch fixes it as
> well.
>
> Thanks for the patch and poking us about the bug again.
>
> On Thu, Oct 7, 2021 at 11:41 PM Marek Vasut <marex@denx.de> wrote:
> >
> > Commit 64f7c698bea9 ("drm/nouveau/fifo: add engine_id hook") replaced
> > fifo/chang84.c g84_fifo_chan_engine() call with an indirect call of
> > fifo/g84.c g84_fifo_engine_id(). The G84_FIFO_ENGN_* values returned
> > from the later g84_fifo_engine_id() are incremented by 1 compared to
> > the previous g84_fifo_chan_engine() return values.
> >
> > This is fine either way for most of the code, except this one line
> > where an engine bit programmed into the hardware is derived from the
> > return value. Decrement the return value accordingly, otherwise the
> > wrong engine bit is programmed into the hardware and that leads to
> > the following failure:
> > nouveau 0000:01:00.0: gr: 00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 1 [003fbce000 DRM] subc 3 class 0000 mthd 085c data 00000420
> >
> > On the following hardware:
> > lspci -s 01:00.0
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GT216GLM [Quadro FX 880M] (rev a2)
> > lspci -ns 01:00.0
> > 01:00.0 0300: 10de:0a3c (rev a2)
> >
> > Fixes: 64f7c698bea9 ("drm/nouveau/fifo: add engine_id hook")
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: <stable@vger.kernel.org> # 5.12+
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
> > index 353b77d9b3dc..3492c561f2cf 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
> > @@ -82,7 +82,7 @@ g84_fifo_chan_engine_fini(struct nvkm_fifo_chan *base,
> >         if (offset < 0)
> >                 return 0;
> >
> > -       engn = fifo->base.func->engine_id(&fifo->base, engine);
> > +       engn = fifo->base.func->engine_id(&fifo->base, engine) - 1;
> >         save = nvkm_mask(device, 0x002520, 0x0000003f, 1 << engn);
> >         nvkm_wr32(device, 0x0032fc, chan->base.inst->addr >> 12);
> >         done = nvkm_msec(device, 2000,
> > --
> > 2.33.0
> >
>
