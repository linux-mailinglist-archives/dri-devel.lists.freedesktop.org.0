Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 094EA66BCCC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111BF10E3CD;
	Mon, 16 Jan 2023 11:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DD010E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:24:11 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id y8so19331969qvn.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CC4suAhGO9ZHb6FRYObqt22bnmss3lWiFC78zfUA2eM=;
 b=lsctg8TFUjQPR9Rpz5Ke+QDLKZZ0Yc/eMPWfR4aeRgzj7pJVFaLl2U1sLgs4lIAb6s
 3kV69634qX4YC2uFRmn3rrpvO/CKH2BoJ6ZCWeXU5uqIMeZdwuNOuaIhJ+3tKoSwpfU6
 4rBTawzdcGuGGAhoD5RII6Vy4W0RjZl2mzw2j8J6ivTBueLrQZoLGX3gTNXe6z51PTST
 jTfvfVIE7m+Qk7D+7zXn2W7ng3+TTx4/eObeHeokOMvZdYhwyAHw2pK2OL0uWtWZT7O1
 G2dEnfkaL2w66m+6pWok+jiyatirEs4eD7vatTv6miGX2Qt0TDMj1xg1LX22+exA1kSa
 Vqcw==
X-Gm-Message-State: AFqh2kpugptIqkPRgEmoDGZ/6pYrTw1kTKPHb7FnwDkgeLZMPfCONqKn
 iFss5Jb+vYSZcoa/9GARToqQNo/jjT4+sQ==
X-Google-Smtp-Source: AMrXdXvf+Jqs+L2njz02SFL/p5GkfFQT2XiszDqHq1+km9xTjcveNJEwAzhxV37xZKt1Z6K29eoFXA==
X-Received: by 2002:ad4:5426:0:b0:532:2409:2eec with SMTP id
 g6-20020ad45426000000b0053224092eecmr25971805qvt.18.1673868250261; 
 Mon, 16 Jan 2023 03:24:10 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 q30-20020a05620a025e00b006fc40dafaa2sm17859680qkn.8.2023.01.16.03.24.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 03:24:10 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-4a263c4ddbaso376866307b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:24:09 -0800 (PST)
X-Received: by 2002:a81:578e:0:b0:4d9:3858:392 with SMTP id
 l136-20020a81578e000000b004d938580392mr1318541ywb.502.1673868249495; Mon, 16
 Jan 2023 03:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
 <Y8LJkPLghb/8Y+iQ@pendragon.ideasonboard.com>
 <CAMuHMdXnssq_tGbg+vL7BuLK5sa4Lg1xx0106uMFthRfUoq7=Q@mail.gmail.com>
 <Y8UpDsTixfacduXl@pendragon.ideasonboard.com>
 <CAMuHMdVHnJ2Q1CCDUiTUPcESp2cExu6BynoscTGOiD6UA1u7_w@mail.gmail.com>
 <Y8UrsSnhGd7GQEIJ@pendragon.ideasonboard.com>
In-Reply-To: <Y8UrsSnhGd7GQEIJ@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jan 2023 12:23:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYDS7+tRB-Brva4AjuKD6Z6eyoe3fB3wQCeK3p1GpHKw@mail.gmail.com>
Message-ID: <CAMuHMdUYDS7+tRB-Brva4AjuKD6Z6eyoe3fB3wQCeK3p1GpHKw@mail.gmail.com>
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

On Mon, Jan 16, 2023 at 11:49 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 16, 2023 at 11:44:13AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 16, 2023 at 11:38 AM Laurent Pinchart wrote:
> > > On Mon, Jan 16, 2023 at 11:24:10AM +0100, Geert Uytterhoeven wrote:
> > > > On Sat, Jan 14, 2023 at 4:26 PM Laurent Pinchart wrote:
> > > > > Geert, could you please take this in your tree for v6.3 ? The two
> > > > > patches that the DT changes depend on have been merged in v6.2.
> > > >
> > > > Thank you, I had missed these.
> > > >
> > > > > On Thu, Jun 16, 2022 at 01:14:09AM +0300, Laurent Pinchart wrote:
> > > > > > Now that a header exists with macros for the media interface bus-type
> > > > > > values, replace hardcoding numerical constants with the corresponding
> > > > > > macros in the DT sources.
> > > > > >
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > > > ---
> > > > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
> > > > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
> > > > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
> > > > > >  3 files changed, 13 insertions(+), 6 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > > index 4e58c54cde17..33ac4bd1e63b 100644
> > > > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > > @@ -7,6 +7,9 @@
> > > > > >   */
> > > > > >
> > > > > >  /dts-v1/;
> > > > > > +
> > > > > > +#include <dt-bindings/media/video-interfaces.h>
> > > > > > +
> > > > > >  #include "r8a7742-iwg21d-q7.dts"
> > > > > >
> > > > > >  / {
> > > > > > @@ -242,7 +245,7 @@ port {
> > > > > >               vin0ep: endpoint {
> > > > > >                       remote-endpoint = <&cam0ep>;
> > > > > >                       bus-width = <8>;
> > > > > > -                     bus-type = <6>;
> > > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > > >               };
> > > > > >       };
> > > > > >  };
> > > > > > @@ -273,7 +276,7 @@ port {
> > > > > >               vin1ep: endpoint {
> > > > > >                       remote-endpoint = <&cam1ep>;
> > > > > >                       bus-width = <8>;
> > > > > > -                     bus-type = <6>;
> > > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > > >               };
> > > > > >       };
> > > > > >  };
> > > > > > @@ -305,7 +308,7 @@ vin2ep: endpoint {
> > > > > >                       remote-endpoint = <&cam2ep>;
> > > > > >                       bus-width = <8>;
> > > > > >                       data-shift = <8>;
> > > > > > -                     bus-type = <6>;
> > > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > > >               };
> > > > > >       };
> > > > > >  };
> > > > > > @@ -335,7 +338,7 @@ port {
> > > > > >               vin3ep: endpoint {
> > > > > >                       remote-endpoint = <&cam3ep>;
> > > > > >                       bus-width = <8>;
> > > > > > -                     bus-type = <6>;
> > > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > > >               };
> > > > > >       };
> > > > > >  };
> > > > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > > index 40cef0b1d1e6..c73160df619d 100644
> > > > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > > @@ -7,6 +7,8 @@
> > > > > >   * Copyright (C) 2020 Renesas Electronics Corp.
> > > > > >   */
> > > > > >
> > > > > > +#include <dt-bindings/media/video-interfaces.h>
> > > >
> > > > This .dtsi file is only intended to be included by
> > > > arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts, which already has
> > > > the include.  Hence if you don't mind, I would like to drop this part
> > > > while applying  and queuing in renesas-devel for v6.3.
> > >
> > > Isn't it better to include headers as needed to avoid depending on
> > > indirect includes ?
> >
> > In general, I agree.
> > In this particular case, (the multiple inclusions of) the
> > r8a7742-iwg21d-q7-dbcm-ov*-single.dtsi files are tied very intimately
> > to r8a7742-iwg21d-q7-dbcm-ca.dts.
>
> I'd still prefer keeping the #include here, but you're the maintainer
> :-)

OK, will keep them.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
