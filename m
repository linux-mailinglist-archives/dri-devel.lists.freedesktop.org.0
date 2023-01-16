Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6309166BC11
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CAD10E3BE;
	Mon, 16 Jan 2023 10:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49CE10E3BE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:44:26 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id z9so1623044qtv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 02:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oMEZtvQFEJvynFRYn/XTZlOzrmSM7ZI6rZSGm2BSCxc=;
 b=jkPix+KKa5ccm1009qtT/kLXTi58x/ICSk9q62mu5StsTtPZVZWngRKEAGwp3ZXkmH
 lTJ8or67bJ8DWxCczecN+8/aHmH8yQtUB3gYSAzyuIM4DQMB0JKEg9lMA6E5DHlsZswu
 QXoYGva5usJ2C/BBtoxI0H0zV3AY98468RmYAntnpQpr5cBKvY41SBcdNsaBaVvjGHEo
 4/ZQvVRFQyw8OvA5OiakYYTPs9SQWBAzVakJcoLWqKGbq9QdTa59KEeUQ1EcSvXU99Js
 JhAgc0T6mdl6sq6X+LP9OU777gWGqERDGOpl6Glsgp66S0vKq4VjC7pAbsH4rWW57dSG
 askw==
X-Gm-Message-State: AFqh2kpXnQ9YQM4JGYTZi6QdnGifRMEsyHWoisQIootxOWbjR51LPbMv
 EP1Sc/j/5Bq605lEPKTo+VYTbavesRcQ1g==
X-Google-Smtp-Source: AMrXdXtAWqGnD5WfQOGNsShl1DyZCmhjIQSsiM5AOK+NR7DOWbH7DsJi0rTn23fQA+qm9n3yTRyjEA==
X-Received: by 2002:ac8:460f:0:b0:3b6:34e5:3640 with SMTP id
 p15-20020ac8460f000000b003b634e53640mr1992461qtn.56.1673865865556; 
 Mon, 16 Jan 2023 02:44:25 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 h6-20020ac81386000000b003a7fef41526sm14332613qtj.77.2023.01.16.02.44.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 02:44:25 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id l139so29746145ybl.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 02:44:25 -0800 (PST)
X-Received: by 2002:a25:46c6:0:b0:7b8:a0b8:f7ec with SMTP id
 t189-20020a2546c6000000b007b8a0b8f7ecmr4722674yba.36.1673865864824; Mon, 16
 Jan 2023 02:44:24 -0800 (PST)
MIME-Version: 1.0
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
 <Y8LJkPLghb/8Y+iQ@pendragon.ideasonboard.com>
 <CAMuHMdXnssq_tGbg+vL7BuLK5sa4Lg1xx0106uMFthRfUoq7=Q@mail.gmail.com>
 <Y8UpDsTixfacduXl@pendragon.ideasonboard.com>
In-Reply-To: <Y8UpDsTixfacduXl@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jan 2023 11:44:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHnJ2Q1CCDUiTUPcESp2cExu6BynoscTGOiD6UA1u7_w@mail.gmail.com>
Message-ID: <CAMuHMdVHnJ2Q1CCDUiTUPcESp2cExu6BynoscTGOiD6UA1u7_w@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] ARM: dts: renesas: Use new media bus type macros
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Jan 16, 2023 at 11:38 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 16, 2023 at 11:24:10AM +0100, Geert Uytterhoeven wrote:
> > On Sat, Jan 14, 2023 at 4:26 PM Laurent Pinchart wrote:
> > > Geert, could you please take this in your tree for v6.3 ? The two
> > > patches that the DT changes depend on have been merged in v6.2.
> >
> > Thank you, I had missed these.
> >
> > > On Thu, Jun 16, 2022 at 01:14:09AM +0300, Laurent Pinchart wrote:
> > > > Now that a header exists with macros for the media interface bus-type
> > > > values, replace hardcoding numerical constants with the corresponding
> > > > macros in the DT sources.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > > ---
> > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
> > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
> > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
> > > >  3 files changed, 13 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > index 4e58c54cde17..33ac4bd1e63b 100644
> > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > @@ -7,6 +7,9 @@
> > > >   */
> > > >
> > > >  /dts-v1/;
> > > > +
> > > > +#include <dt-bindings/media/video-interfaces.h>
> > > > +
> > > >  #include "r8a7742-iwg21d-q7.dts"
> > > >
> > > >  / {
> > > > @@ -242,7 +245,7 @@ port {
> > > >               vin0ep: endpoint {
> > > >                       remote-endpoint = <&cam0ep>;
> > > >                       bus-width = <8>;
> > > > -                     bus-type = <6>;
> > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > >               };
> > > >       };
> > > >  };
> > > > @@ -273,7 +276,7 @@ port {
> > > >               vin1ep: endpoint {
> > > >                       remote-endpoint = <&cam1ep>;
> > > >                       bus-width = <8>;
> > > > -                     bus-type = <6>;
> > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > >               };
> > > >       };
> > > >  };
> > > > @@ -305,7 +308,7 @@ vin2ep: endpoint {
> > > >                       remote-endpoint = <&cam2ep>;
> > > >                       bus-width = <8>;
> > > >                       data-shift = <8>;
> > > > -                     bus-type = <6>;
> > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > >               };
> > > >       };
> > > >  };
> > > > @@ -335,7 +338,7 @@ port {
> > > >               vin3ep: endpoint {
> > > >                       remote-endpoint = <&cam3ep>;
> > > >                       bus-width = <8>;
> > > > -                     bus-type = <6>;
> > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > >               };
> > > >       };
> > > >  };
> > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > index 40cef0b1d1e6..c73160df619d 100644
> > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > @@ -7,6 +7,8 @@
> > > >   * Copyright (C) 2020 Renesas Electronics Corp.
> > > >   */
> > > >
> > > > +#include <dt-bindings/media/video-interfaces.h>
> >
> > This .dtsi file is only intended to be included by
> > arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts, which already has
> > the include.  Hence if you don't mind, I would like to drop this part
> > while applying  and queuing in renesas-devel for v6.3.
>
> Isn't it better to include headers as needed to avoid depending on
> indirect includes ?

In general, I agree.
In this particular case, (the multiple inclusions of) the
r8a7742-iwg21d-q7-dbcm-ov*-single.dtsi files are tied very intimately
to r8a7742-iwg21d-q7-dbcm-ca.dts.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
