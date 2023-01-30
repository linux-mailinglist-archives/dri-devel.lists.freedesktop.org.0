Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4A681F8D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 00:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ADC10E29C;
	Mon, 30 Jan 2023 23:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4139710E29C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 23:22:57 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id e19so10000438qvw.13
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 15:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rNCl69CdaeUhcl7H+1Js2BjsI9pjnQlMd9x/8sqTI6g=;
 b=PxfkuZ7MrFF2reNqHHmrKZ2HZtLe8Ujb/mjMmFDzDu9yHRoetltNwBU/i/Ijy+RGmx
 ZVKLTyiAhIHhpVH1xsD/fvB0L1G2aB7OjUVLhsityL0UNuWJB94kPjr4iWPWkt0pW6R/
 xq16GoUnQ6SLK7I65T1h0gMsPSu3+vVqvRANeYANJymbCOq93yNz6iRsw/qCF17FpRmn
 tM9GYr1QC83AQVlw4kMlpUjEwS8Td1Qtc3mV5tCHS2gMcG+TOlrMgLgmvs819/eishZd
 Rjso+gcd9EefripLmWuEUArnumBcqaFcYq5jY5olAmlLnmWXmZ6NRiKH6QohbST48xkq
 GySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rNCl69CdaeUhcl7H+1Js2BjsI9pjnQlMd9x/8sqTI6g=;
 b=LBR5RBo6qKT4LRexYmBQIh5lVEUXerQwNPr9K8zrVsGsOaPSUCzVZymAMOrKbehENU
 QLqknNuG89gWC4lUQFNlm98Lkc5ApgkdfxtVGxzyucQeDOLWrcPuj3iM0GdmwNdxe3oN
 Fm+zx6ZO4PmLZGKW0T4O3Msbpvv8CzAb+ej2o4yVQo/QAmGyQ6u6SkdmIuAJloPjHoZc
 aT68lpCEZoT1MlAANlCC8VZ+YllnPXpy3541gJX2BxDvKxThgwpduOzjUiqblZhBBeZL
 5i5SH1ZHaQ8haNm+3DsEyF+LBNr8KqilaV6Te71pI6omAiEFvqrQ6psY4U/Y3V+4L9DX
 mWAg==
X-Gm-Message-State: AO0yUKWTxTDk3zIjcAqe6WqEv54c7I47Xq04NnuJCSKBkwBW2KWPPSXi
 RbIEat5yy2DFAklEtmwI4wx2mCbrMpZj/1nI646OOwf3
X-Google-Smtp-Source: AK7set+4CqsmPccLpBJjyz9/ISfLTf77JyO2xim6rHoWCP9v+lzgXL2twqbLfxu8eYwFm8bMbX8dq5EfYDOFLrAhWOI=
X-Received: by 2002:a0c:f510:0:b0:53c:b367:9e51 with SMTP id
 j16-20020a0cf510000000b0053cb3679e51mr339569qvm.9.1675120976107; Mon, 30 Jan
 2023 15:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20230130223715.1831509-1-bskeggs@redhat.com>
 <2641c2cd5b1cabd09af96b36899d72abab244cec.camel@redhat.com>
In-Reply-To: <2641c2cd5b1cabd09af96b36899d72abab244cec.camel@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 31 Jan 2023 09:22:43 +1000
Message-ID: <CACAvsv4zqf2oYRy+FLJTedi5yxxNqU9HaKRf7H7H4_O38xB5jw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/nouveau/devinit/tu102-: wait for
 GFW_BOOT_PROGRESS == COMPLETED
To: Lyude Paul <lyude@redhat.com>
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
Cc: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Jan 2023 at 09:19, Lyude Paul <lyude@redhat.com> wrote:
>
> For the whole series:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> Will push to drm-misc-fixes in just a moment
Thank you Lyude!  Much appreciated.

Ben.

>
> On Tue, 2023-01-31 at 08:37 +1000, Ben Skeggs wrote:
> > Starting from Turing, the driver is no longer responsible for initiating
> > DEVINIT when required as the GPU started loading a FW image from ROM and
> > executing DEVINIT itself after power-on.
> >
> > However - we apparently still need to wait for it to complete.
> >
> > This should correct some issues with runpm on some systems, where we get
> > control of the HW before it's been fully reinitialised after resume from
> > suspend.
> >
> > Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> > ---
> >  .../drm/nouveau/nvkm/subdev/devinit/tu102.c   | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
> > index 634f64f88fc8..81a1ad2c88a7 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
> > @@ -65,10 +65,33 @@ tu102_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
> >       return ret;
> >  }
> >
> > +static int
> > +tu102_devinit_wait(struct nvkm_device *device)
> > +{
> > +     unsigned timeout = 50 + 2000;
> > +
> > +     do {
> > +             if (nvkm_rd32(device, 0x118128) & 0x00000001) {
> > +                     if ((nvkm_rd32(device, 0x118234) & 0x000000ff) == 0xff)
> > +                             return 0;
> > +             }
> > +
> > +             usleep_range(1000, 2000);
> > +     } while (timeout--);
> > +
> > +     return -ETIMEDOUT;
> > +}
> > +
> >  int
> >  tu102_devinit_post(struct nvkm_devinit *base, bool post)
> >  {
> >       struct nv50_devinit *init = nv50_devinit(base);
> > +     int ret;
> > +
> > +     ret = tu102_devinit_wait(init->base.subdev.device);
> > +     if (ret)
> > +             return ret;
> > +
> >       gm200_devinit_preos(init, post);
> >       return 0;
> >  }
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>
