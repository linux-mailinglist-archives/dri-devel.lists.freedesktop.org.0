Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A71131180
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 12:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2A289D5B;
	Mon,  6 Jan 2020 11:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D63489A5C;
 Mon,  6 Jan 2020 11:40:29 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id u17so16075068uap.9;
 Mon, 06 Jan 2020 03:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sQQaQG+AfXGj+Me2z6DyEv2JkQjyKmIl3bRQbolFe1o=;
 b=p/3kQwdYgtdlg1Os6Dci9lDS2z6w0R6zDWSmBg6T5FzjjaAEGbtILr2ByFyBtXlu2X
 y1ZPwJgJZPcy8SS3iwlNTITYTOoYCk9KgIPsW/ZxexHYLQxyQYbX8CzMsCY4JmFWvsjl
 wr2stfKPxV+k+JXteIJ+iVb3/JcICbol7ToO+0ZSMRuQImeLHX+i+/lpVLeSBwPv7auj
 Hk4WdSrOD5Yk0bXiytAgx/zpUwqOocgksGqpPr9DQXKWDtO6H1R06z2Tc5Y5q/6C/rZw
 WRuL+A2cY/lPMhGNjeHdGUG/GgaWynnKuOnRXcKHKGkR/6iMld/AQMsHAn+cpB6bSiZr
 WczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sQQaQG+AfXGj+Me2z6DyEv2JkQjyKmIl3bRQbolFe1o=;
 b=He+Q9GBE0k8DYxUT3w5p2Qbq929frxFJx6nzSDGjdIUeC/LjWjJIFH+6rh+s+m/q52
 xnjlgR1yLUny3zBSh4N7XN4M8vapReBDZVu18n7Kz7u/c485WEBxRbVChBcDgCz1vcga
 +EfvxO4K0qb1xZ4acbXpqwy9k+D2GO7GOwAYlBflakrBdHPYzUxefbAMGAZym6Xt7XKI
 Bigxx0CU0p+0qTNg1eDf8jpQqgC1MNSYETcXOcjFx953uc5nCN9RUk5+Bl3TBHAbLARh
 NhPCq6xMpKl2QOL5JLdBwfeDpbUH3DWQqHoCtJaPEDoNUxNs31divdjJWQuJGCV4hgdM
 0trw==
X-Gm-Message-State: APjAAAXIgcBjlW9AKO34Z0tb4cM1CLzq/htOGo0l4Wa3WQ9dPPlV5zjy
 kkMDRGRZaplV6qL4c0d4FFuImgG2CQ2G0W7r+Fs=
X-Google-Smtp-Source: APXvYqyARdYJ0Kv1+Q19Ys5V5NIUzl/nDmV8rlIGXvTTdimxNf06lz1HDqT5HBc5YnWk46mVryIwSq7M5NQ1lRFYgao=
X-Received: by 2002:ab0:74ce:: with SMTP id f14mr58376764uaq.118.1578310828234; 
 Mon, 06 Jan 2020 03:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
 <20200102100230.420009-3-christian.gmeiner@gmail.com>
 <5cd1dc11df43d86d9db0dc2520de9b2e839ea7cc.camel@pengutronix.de>
 <CAH9NwWddNNc+2rRsntm+_eYF0S9uwC0kTszpPysbzmkc4dNuNA@mail.gmail.com>
 <191213c32908a217cf78590464c9b9519865f3e0.camel@pengutronix.de>
In-Reply-To: <191213c32908a217cf78590464c9b9519865f3e0.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 6 Jan 2020 12:40:18 +0100
Message-ID: <CAH9NwWc-M2TvPGnDY5d_aWxrtrb+SZZOObd9KSAAzN+K7WMpOg@mail.gmail.com>
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

Am Mo., 6. Jan. 2020 um 12:22 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> On Mo, 2020-01-06 at 11:57 +0100, Christian Gmeiner wrote:
> > Hi Lucas
> >
> > Am Mo., 6. Jan. 2020 um 11:03 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
> > > On Do, 2020-01-02 at 11:02 +0100, Christian Gmeiner wrote:
> > > > They will be used for extended HWDB support. The eco id logic was taken
> > > > from galcore kernel driver sources.
> > > >
> > > > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 17 +++++++++++++++++
> > > >  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  6 +++---
> > > >  2 files changed, 20 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > > index d47d1a8e0219..253301be9e95 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > > @@ -321,6 +321,18 @@ static void etnaviv_hw_specs(struct etnaviv_gpu *gpu)
> > > >               gpu->identity.varyings_count -= 1;
> > > >  }
> > > >
> > > > +static void etnaviv_hw_eco_id(struct etnaviv_gpu *gpu)
> > > > +{
> > > > +     const u32 chipDate = gpu_read(gpu, VIVS_HI_CHIP_DATE);
> > > > +     gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
> > > > +
> > > > +     if (etnaviv_is_model_rev(gpu, GC1000, 0x5037) && (chipDate == 0x20120617))
> > > > +             gpu->identity.eco_id = 1;
> > > > +
> > > > +     if (etnaviv_is_model_rev(gpu, GC320, 0x5303) && (chipDate == 0x20140511))
> > > > +             gpu->identity.eco_id = 1;
> > >
> > > I'm not sure if those two checks warrant a separate function. Maybe
> > > just place them besides the other ID fixups?
> > >
> >
> > This is almost a 1:1 copy of _GetEcoID(..) but will try to move the fixups.
> >
> >
> > > > +}
> > > > +
> > > >  static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
> > > >  {
> > > >       u32 chipIdentity;
> > > > @@ -362,6 +374,8 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
> > > >                       }
> > > >               }
> > > >
> > > > +             gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
> > > > +
> > > >               /*
> > > >                * NXP likes to call the GPU on the i.MX6QP GC2000+, but in
> > > >                * reality it's just a re-branded GC3000. We can identify this
> > > > @@ -375,6 +389,9 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
> > > >               }
> > > >       }
> > > >
> > > > +     etnaviv_hw_eco_id(gpu);
> > > > +     gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
> > >
> > > I don't like this scattering of identity register reads. Please move
> > > all of those reads to the else clause where we currently read
> > > model/rev. I doubt that the customer ID register is available on the
> > > really early cores, that only have the VIVS_HI_CHIP_IDENTITY register.
> > >
> >
> > There is feature bit for it: chipMinorFeatures5_HAS_PRODUCTID
> > Will change the code to make use of it. Shall I still put it in the
> > else clause then?
>
> If there's a feature bit we need to move the read toward the end of the
> function, as we currently read the features as the last step in the
> hw_identify.
>
> But then I'm not sure if the HAS_PRODUCTID feature bit is correct. At
> least wumpus' gpus_comparison says that none of the known <= GC3000
> cores has it set, which seems... suspicious.
>

Hmm... what if I just mimic what is done here?
https://github.com/etnaviv/vivante_kernel_drivers/blob/master/imx8_v6.2.3.129602/hal/kernel/arch/gc_hal_kernel_hardware.c#L220

Unconditionally read the product id at the end of the else clause. The
same is done in the stm32 galcore kernel driver.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
