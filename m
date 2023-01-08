Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0963661399
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 05:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807BF10E1DA;
	Sun,  8 Jan 2023 04:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C4710E1DA
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 04:51:02 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id g14so5537757ljh.10
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 20:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I2Zzn4ApGlRGrmRfQkLTkwb2Z8A7POpE/5KfqxDRud8=;
 b=i8LqaqBEFPGeEPjX7CtjsGizANC5gohDb+WmPIMvi5XmpIa6EEROvU/LPqn5ToqoMO
 bQ1fohMNSQvGnc8NZ8kPiQUPSBJzwXc1oV5P38+wEZwVVMQAvOLn4WiFvmU4ZdNEvpM9
 YRRus1GXW/UuV4Jc4Q0LxLiPzsQxIvelmBV5+bjmSmWLhlifmyN+FUhWUgubGBxS4HLZ
 JQKhYIrhGL+QB9cRU1GuKPvPHOPzShGMDAeY8kAa2OgK6HNLXaBVUyBJ+5F3JvfsiRdi
 r2aFBsonnuaiDl05Jnpe9ANd29eFBT8SPQnuJl/WGK+YmSc6+4l6+q/3nRmGOVf5sZOE
 GXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I2Zzn4ApGlRGrmRfQkLTkwb2Z8A7POpE/5KfqxDRud8=;
 b=z7hAmqygYOFCPfiUBXD3XDPb7lzi0tB/xgxrKgEorL/h3lAMMgjfih7AmTr4aK7Jsn
 WJiQ5iygEj/cZbAUIl40/pIuHqpK6e93OW5bd7GU2kTfGFOVHLt+zCh52SdV6iryXPXL
 zUxMevhdH1O9XgSBKGvDomv2NzRMjq0wdr9IcdbbwZgQGLoXrCJVjxk62gYha2jwH6qb
 Z7RIO+Zo9dbsDYrWLl6ulyncPInszi07A4EHl55ZuANeuvaF35Wq02krJnsNdQjnWkz0
 lFzAnv75KQ90fGF5TlVYc8yK/fA1pzXHyzQDN5xz8/VgKdFuCjDygC2moznc3o5jgo7r
 qMRg==
X-Gm-Message-State: AFqh2kov2Ohkw7DMCJGt28Eu5D8u6SpBNIjfP+bBe0edhmZsHZ6b5v0E
 MI5ZP//E58gi0OO/FqWn4SWALdLA1GicVfh0Daw=
X-Google-Smtp-Source: AMrXdXs7Vx7He4kItXJYZHGHkTfEsQmad+r++6ozgDJwMiLF/oKRQHBS4UM/XQVzKj4qEbBnJ5R4Nb7bApZ9NX8y6Go=
X-Received: by 2002:a2e:bc13:0:b0:27f:ecef:bec2 with SMTP id
 b19-20020a2ebc13000000b0027fecefbec2mr1042952ljf.97.1673153460116; Sat, 07
 Jan 2023 20:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20230108043147.346349-1-pbrobinson@gmail.com>
 <Y7pKUfdYSR6IDW7A@pendragon.ideasonboard.com>
In-Reply-To: <Y7pKUfdYSR6IDW7A@pendragon.ideasonboard.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sun, 8 Jan 2023 04:50:48 +0000
Message-ID: <CALeDE9NV8WctWcFMuW4nqwi-piane-YWxidCWjjaZ3XJEXSTXw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: depend on ARCH_RENESAS for components on
 that SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

> Thank you for the patch.
>
> On Sun, Jan 08, 2023 at 04:31:47AM +0000, Peter Robinson wrote:
> > There's a few components in the rcar-du drm directory that
> > don't make sense to be slectedable if ARCH_RENESAS isn't because
>
> s/slectedable/selectable/
>
> > they are part of those SoCs so add a dependency and add compile
> > check to ensure they're still tested.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index b2bddbeca878..4d2bff78a559 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
> >  config DRM_RCAR_DW_HDMI
> >       tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
> >       depends on DRM && OF
> > +     depends on ARCH_RENESAS || COMPILE_TEST
>
> As this module isn't useful without the DU driver, wouldn't it be better
> to add a dependency on DRM_RCAR_DU, which itself already depends on
> ARCH_RENESAS || COMPILE_TEST ? Same for the other two below.

I had considered both options but as I suspected that it would have at
least been compile tested by I wasn't 100% sure of the dependency
within the actually SoC as I don't really know the HW but I am happy
to go that route too.

Also the DRM_RCAR_USE_ options seem a little weird too the
DRM_RCAR_USE_MIPI_DSI vs just using DRM_RCAR_MIPI_DSI, seems like
extra logic just in the Kconfig that provides little, but ultimately
that bit doesn't affect me overall.

Will do a v2

Peter

> >       select DRM_DW_HDMI
> >       help
> >         Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
> > @@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
> >  config DRM_RCAR_USE_LVDS
> >       bool "R-Car DU LVDS Encoder Support"
> >       depends on DRM_BRIDGE && OF
> > +     depends on ARCH_RENESAS || COMPILE_TEST
> >       default DRM_RCAR_DU
> >       help
> >         Enable support for the R-Car Display Unit embedded LVDS encoders.
> > @@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
> >  config DRM_RCAR_USE_MIPI_DSI
> >       bool "R-Car DU MIPI DSI Encoder Support"
> >       depends on DRM_BRIDGE && OF
> > +     depends on ARCH_RENESAS || COMPILE_TEST
> >       default DRM_RCAR_DU
> >       help
> >         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
>
> --
> Regards,
>
> Laurent Pinchart
