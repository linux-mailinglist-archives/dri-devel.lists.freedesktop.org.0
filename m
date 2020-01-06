Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0E1310E1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 11:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC51A6E255;
	Mon,  6 Jan 2020 10:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7710C6E255;
 Mon,  6 Jan 2020 10:58:01 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id f8so31333079vsq.8;
 Mon, 06 Jan 2020 02:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iz48PIJknU2j/A4zRHc/Rgg36rOPCVo1fXVtuRuysh0=;
 b=RfbOUFacPPh2IC/QVAVcCcFV4ZIDaLQYpHmb1lF3qUmFz3qo7AOG5AtHg1TtJFXdke
 yLnJwxHe/6VGC/9EXUxJ+QjepIhJviuughwTLnXtgZ3DU8xg/sH8qXnZQqDPtCk06FFV
 BLWCwLB2l+8h1R1mncjklU5vwAryEVaF5tko/JFGnX3k5K8e+qY6P9/R5w2FsmczJyRj
 +9h5v5qZMABAbDKRBWy/Z2aKq8tDVTwYsPcJpRpJV4xFtOE/9DA5j6jI9BquVLv1jGWk
 ADKFJYxXEDqxJqm600HrfHOcQUwLyff0bhoKrC8uCW0b7lLlnFj4nYl+3au9/QLXXfQa
 q5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iz48PIJknU2j/A4zRHc/Rgg36rOPCVo1fXVtuRuysh0=;
 b=ojJ2wuv6/c6FLl6xkcsedU/uSI9ylyiTE4zQ243DuUZ0WwsKORgkVyVLgPY/2xWIUf
 NS4QwdX+HWNc1x1amJOYT1JTF0hYfBhZuLO5H4aZRsqJ6O12j/2fCvIyTiwMXKkEVQV7
 2LF9Z8pPsX8PZZB8Z4qnotg4v/lCUOF93F2bjfV0RhFAiafAi5EssudZPoMhzBl5nMER
 MLiTtPBb+nJyVARXnInf+CwuVbbP2uwhviJOnKAkQOcV09fKeBE12/NYNNJ9UDyx6/IJ
 aNzRNUUrH78LH6iMF2SQogXc+Wg8a194F63F6XMRy4/vQECQCAgLV99CCRhbzzXPcldO
 Rihw==
X-Gm-Message-State: APjAAAWSlTgwxGtNmqkqWPykIz0LYWCLxqQqAve4tE0Il2zxEFchiewi
 EKJb/iGJNk21HCGDVnOpjs3AAjPkDKSc3o6htgQ=
X-Google-Smtp-Source: APXvYqzZYEYA6D40qqN8qfRYSNveoTvP+3l+AWVJQQU5FusthP8LMTWjWcFH4nhlUSEsQov459UNeISOmykUZ+o87LE=
X-Received: by 2002:a05:6102:535:: with SMTP id
 m21mr51039090vsa.95.1578308280617; 
 Mon, 06 Jan 2020 02:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
 <20200102100230.420009-3-christian.gmeiner@gmail.com>
 <5cd1dc11df43d86d9db0dc2520de9b2e839ea7cc.camel@pengutronix.de>
In-Reply-To: <5cd1dc11df43d86d9db0dc2520de9b2e839ea7cc.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 6 Jan 2020 11:57:49 +0100
Message-ID: <CAH9NwWddNNc+2rRsntm+_eYF0S9uwC0kTszpPysbzmkc4dNuNA@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/etnaviv: determine product, customer and eco id
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

Am Mo., 6. Jan. 2020 um 11:03 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> On Do, 2020-01-02 at 11:02 +0100, Christian Gmeiner wrote:
> > They will be used for extended HWDB support. The eco id logic was taken
> > from galcore kernel driver sources.
> >
> > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 17 +++++++++++++++++
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  6 +++---
> >  2 files changed, 20 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > index d47d1a8e0219..253301be9e95 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -321,6 +321,18 @@ static void etnaviv_hw_specs(struct etnaviv_gpu *gpu)
> >               gpu->identity.varyings_count -= 1;
> >  }
> >
> > +static void etnaviv_hw_eco_id(struct etnaviv_gpu *gpu)
> > +{
> > +     const u32 chipDate = gpu_read(gpu, VIVS_HI_CHIP_DATE);
> > +     gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
> > +
> > +     if (etnaviv_is_model_rev(gpu, GC1000, 0x5037) && (chipDate == 0x20120617))
> > +             gpu->identity.eco_id = 1;
> > +
> > +     if (etnaviv_is_model_rev(gpu, GC320, 0x5303) && (chipDate == 0x20140511))
> > +             gpu->identity.eco_id = 1;
>
> I'm not sure if those two checks warrant a separate function. Maybe
> just place them besides the other ID fixups?
>

This is almost a 1:1 copy of _GetEcoID(..) but will try to move the fixups.


> > +}
> > +
> >  static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
> >  {
> >       u32 chipIdentity;
> > @@ -362,6 +374,8 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
> >                       }
> >               }
> >
> > +             gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
> > +
> >               /*
> >                * NXP likes to call the GPU on the i.MX6QP GC2000+, but in
> >                * reality it's just a re-branded GC3000. We can identify this
> > @@ -375,6 +389,9 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
> >               }
> >       }
> >
> > +     etnaviv_hw_eco_id(gpu);
> > +     gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
>
> I don't like this scattering of identity register reads. Please move
> all of those reads to the else clause where we currently read
> model/rev. I doubt that the customer ID register is available on the
> really early cores, that only have the VIVS_HI_CHIP_IDENTITY register.
>

There is feature bit for it: chipMinorFeatures5_HAS_PRODUCTID
Will change the code to make use of it. Shall I still put it in the
else clause then?

--
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
