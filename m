Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83CC67282C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 20:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DDC10E809;
	Wed, 18 Jan 2023 19:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F89110E809
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 19:30:07 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s25so37789602lji.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 11:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UnILwVyNd7xmIZc2IMFLzY42VBVipQZo7g1Qav7SDag=;
 b=ZbWuwZe3/miuIRNol6xbuMxnn2KqdPqG/kMD5o/wOm6hixX+LeIUn71ijzCdE8Fmav
 Ov8JPc849HnaOs1e+O0OMGpRm5TdNBzwztvRGsjkn8zQnz8BgMVYsttizTvqlPsh0VHp
 6EWjuhxFYbl1qqEyur/FWjQFpsceqajzP+oftyRcWquvKwePDGlMKKEjz2li7irVdNGk
 ttGd5UtUOq+RexdJxKyINOegNPb9IaVm5HkUAlgMmSQyT7pOgglCOJubW9hVmwuauBGo
 YyjKfoL/qEhCY8gONwZRDzCxlXmxW3sUkB4j/NqOg6Voc93U4Z6U8/DCEtNvIQANk0g9
 piKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UnILwVyNd7xmIZc2IMFLzY42VBVipQZo7g1Qav7SDag=;
 b=ZHxdqYycb64GTWGwNGus7gN5Vh7g8n0O7iZCRIabPtNYcwYVr0yugI7I+0eRhB7cRR
 4a9t3WDtynYjfBZthwgRpDBizeP9TtB4ClFevcCDHdYKrijNURrZDB+siKcaPjeiRlwD
 GtR/TfrQgPdY/xa+sooJPGkUcE0LRtchUDvfKw66rG/2T97f0uula7CwpoL4kWlwcOIp
 e2JzG4YAqpma1wzzTBTITWH/uqVV8NOFeYmJxXbeLm4GXINpEmGuONyS4vPAtiwWIxht
 Q3m//W8ijMjW6/CWU+gc6C0I0tTcDXj+bGrA87366UWBQt5mkLYDZCxa23cnUiHiHTD8
 BOJQ==
X-Gm-Message-State: AFqh2krmSP2EOBaxXdYs0iiqoucGcgoszOZ6B/7m0bhjLB0jPAtP/tIN
 ryW5OJ2lXnleLHzEWh8KxM91tcpoCAz7Dj0+k9Y=
X-Google-Smtp-Source: AMrXdXuY0QS3Tp1ei/71ka/uAgmv/R4GTdqfYumUyji7bn+iOotc99bi2/vp3H2DTLweO2TXaexuSCz37HwCPUuCzU4=
X-Received: by 2002:a2e:9c57:0:b0:28b:7bbf:2892 with SMTP id
 t23-20020a2e9c57000000b0028b7bbf2892mr736163ljj.433.1674070205750; Wed, 18
 Jan 2023 11:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20230108060401.391061-1-pbrobinson@gmail.com>
 <Y8hFiZVPi8XCRPxa@pendragon.ideasonboard.com>
In-Reply-To: <Y8hFiZVPi8XCRPxa@pendragon.ideasonboard.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 18 Jan 2023 19:29:54 +0000
Message-ID: <CALeDE9Nft3vbQAoaQYf6RO=NPWGeZs2Z-sgcWQNmWzjeLqYirQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: rcar-du: depend on DRM_RCAR_DU for components on
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

On Wed, Jan 18, 2023 at 7:16 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Peter,
>
> Thank you for the patch.
>
> On Sun, Jan 08, 2023 at 06:04:01AM +0000, Peter Robinson wrote:
> > There's a few components in the rcar-du drm directory that
> > don't make sense to be selectable if DRM_RCAR_DU isn't because
> > they are part of the IP block so add a dependency and add
> > compile check to ensure they're still tested.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >
> > v2:
> > - typo fix in commit message
> > - s/ARCH_RENESAS/DRM_RCAR_DU
> >
> >  drivers/gpu/drm/rcar-du/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index b2bddbeca878..362fb6099e9f 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
> >  config DRM_RCAR_DW_HDMI
> >       tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
> >       depends on DRM && OF
> > +     depends on DRM_RCAR_DU || COMPILE_TEST
>
> How about dropping COMPILE_TEST ? DRM_RCAR_DU itself has
>
>         depends on ARCH_RENESAS || COMPILE_TEST
>
> so if COMPILE_TEST is set we'll be able to test these drivers when
> DRM_RCAR_DU is enabled. Same below.
>
> I can update this when taking the patch in my tree, there's no need to
> send a v3.

Works for me! Thanks

> >       select DRM_DW_HDMI
> >       help
> >         Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
> > @@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
> >  config DRM_RCAR_USE_LVDS
> >       bool "R-Car DU LVDS Encoder Support"
> >       depends on DRM_BRIDGE && OF
> > +     depends on DRM_RCAR_DU || COMPILE_TEST
> >       default DRM_RCAR_DU
> >       help
> >         Enable support for the R-Car Display Unit embedded LVDS encoders.
> > @@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
> >  config DRM_RCAR_USE_MIPI_DSI
> >       bool "R-Car DU MIPI DSI Encoder Support"
> >       depends on DRM_BRIDGE && OF
> > +     depends on DRM_RCAR_DU || COMPILE_TEST
> >       default DRM_RCAR_DU
> >       help
> >         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
>
> --
> Regards,
>
> Laurent Pinchart
