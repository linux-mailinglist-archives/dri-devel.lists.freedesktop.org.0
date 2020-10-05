Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D8283097
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 09:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEEF89FA6;
	Mon,  5 Oct 2020 07:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3978B89FA6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 07:07:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h7so4599777wre.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 00:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vrohg36P0AZbHBSqRV5jqlVokCKEytO/oqHskmI6OCI=;
 b=HB+mmY5DLcYDJtqB8PG65fwN1JyMlPyrrwuuu5ZIBuUAuhgoFb8+gkeJnItzrmmtor
 2jksBIY2GIouqiHka7LEVPIv5izCgt63cTVAX1RID95nmb3lf6G71Y8Qpui+nTBJiWxC
 xdEKxK3Go4wF3FxqLu3cGWMIgeidAF2Lz+Ii+fHbBNIQHU8AvtrMXoDPd1dloEYS11Hw
 wekNXkfJQBknKUjtpTlCa83i1r+8MktyL0jzXvyA2+wlHUUFhG5c4NB6rU1qzFNZ3Cih
 1HBc0du6v3Q7yUTTyYeDUSPBghraEUGX6t+Y/W5Il4lqjQ1MBWXkEtUtx4VrwI8tnBFJ
 YKcg==
X-Gm-Message-State: AOAM533DBFj+sefrrI0qomI4pwqTm0poIFqOdj77jmMUffhWq10z6464
 9IGV3szpMCaxyBCN9wtT6Rn5xX0Zxq1C0KIHD9I=
X-Google-Smtp-Source: ABdhPJyyg8vHJsEqsfgfWlhj6Sg/nDU8VQLjXtiu1sCdUWtt7OKm0LW5Q8a0KePzR8KBxOSJN6PBoHUAhpVm97hJhj8=
X-Received: by 2002:a05:6000:104c:: with SMTP id
 c12mr15352084wrx.133.1601881628903; 
 Mon, 05 Oct 2020 00:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
 <20200611085900.49740-2-tomeu.vizoso@collabora.com>
 <1b72d5ad-365f-e7fb-624e-b88420ff264b@arm.com>
 <CAAObsKBHe1a4cSe0LS64ikEVzU55FBK4yQbLpMxvOJsP9s=1Nw@mail.gmail.com>
In-Reply-To: <CAAObsKBHe1a4cSe0LS64ikEVzU55FBK4yQbLpMxvOJsP9s=1Nw@mail.gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Mon, 5 Oct 2020 09:06:57 +0200
Message-ID: <CAAObsKBxnxHiQ_ZcTgF4iuJr7w7L=OcL_Eha23Z2U66gpK-8gg@mail.gmail.com>
Subject: Re: [PATCH 2/2] panfrost: Add compatible string for bifrost
To: Steven Price <steven.price@arm.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 Oct 2020 at 08:44, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>
> On Fri, 19 Jun 2020 at 11:00, Steven Price <steven.price@arm.com> wrote:
> >
> > On 11/06/2020 09:58, Tomeu Vizoso wrote:
> > > Mesa now supports some Bifrost devices, so enable it.
> > >
> > > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >
> > Reviewed-by: Steven Price <steven.price@arm.com>
> >
> > I've also dug out my Hikey960 (from the box it's been in since lock down
> > started), so I'll see if I can get things running on there, at the
> > moment I'm seeing some DATA_INVALID_FAULT regressions running my hacked
> > DDK :(
>
> Hi!
>
> Has this one fallen through the cracks?

Oops, sorry about the noise, I had an old checkout.

Cheers,

Tomeu

> Thanks,
>
> Tomeu
>
> >
> > Steve
> >
> > > ---
> > >   drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > > index 882fecc33fdb..8ff8e140f91e 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > > @@ -677,6 +677,7 @@ static const struct of_device_id dt_match[] = {
> > >       { .compatible = "arm,mali-t830", .data = &default_data, },
> > >       { .compatible = "arm,mali-t860", .data = &default_data, },
> > >       { .compatible = "arm,mali-t880", .data = &default_data, },
> > > +     { .compatible = "arm,mali-bifrost", .data = &default_data, },
> > >       {}
> > >   };
> > >   MODULE_DEVICE_TABLE(of, dt_match);
> > >
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
