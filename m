Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6066BBA2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4000610E2BC;
	Mon, 16 Jan 2023 10:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE1510E2BC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:24:23 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id fd15so14295798qtb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 02:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IYdsinSzk5zIWgJ0I9pYyCEIzflLz/cd6reL0ZUmYS0=;
 b=FlF2aSovSbmPeh3UxrwrlJlW+mRKLG+J3mAHaG42n+De3T/GvHwk+aqvXqK31TTihp
 T6r4zqkEiufV9xhhFJrO4EDsf1KzVOA8japWt9PnqUOpp3jzT299u8Slx/PgF68NUVlN
 QaNLGKE4ZtqgQVGv1opEvf/2bUJKGpMYosM1Ez5gRe0abycgmHjzzlYtCQjBTQ4XlHwK
 K45D7NqwM4MjBsTSJbCD96CGK05NSyhnyVEA16rr9S9L9mpQ7H8YDWIf3mIDyfJ983dj
 cWuZTTLsmNP1CyIIK2ommo1V1UFN0LCcJ7rdLB+8B6UtxsMt0dvnwAHT+X/KepAHU6/x
 LBDw==
X-Gm-Message-State: AFqh2kqfjb+/ZPcPTBqZoaKhvSN8iCMc6MC4ePcD+WPbj0oIB0nXGhN6
 zwdJcYNqju/Ucny9/JNcbISreNWhrKBJCQ==
X-Google-Smtp-Source: AMrXdXvSlrtNXYq2u5mgae96x8O4v/bMlyW8LgGnHNxaBd4yT9I2AP0UoIa29vqD/ev8pwB33OpwJQ==
X-Received: by 2002:ac8:7349:0:b0:3b6:36c2:8066 with SMTP id
 q9-20020ac87349000000b003b636c28066mr1172821qtp.68.1673864662689; 
 Mon, 16 Jan 2023 02:24:22 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 w22-20020ac87196000000b003b62deadddcsm2050407qto.42.2023.01.16.02.24.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 02:24:22 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-4d4303c9de6so223754697b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 02:24:21 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr4742811ywb.47.1673864661520; Mon, 16
 Jan 2023 02:24:21 -0800 (PST)
MIME-Version: 1.0
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
 <Y8LJkPLghb/8Y+iQ@pendragon.ideasonboard.com>
In-Reply-To: <Y8LJkPLghb/8Y+iQ@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jan 2023 11:24:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnssq_tGbg+vL7BuLK5sa4Lg1xx0106uMFthRfUoq7=Q@mail.gmail.com>
Message-ID: <CAMuHMdXnssq_tGbg+vL7BuLK5sa4Lg1xx0106uMFthRfUoq7=Q@mail.gmail.com>
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

CC linux-renesas-soc

On Sat, Jan 14, 2023 at 4:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Geert, could you please take this in your tree for v6.3 ? The two
> patches that the DT changes depend on have been merged in v6.2.

Thank you, I had missed these.

> On Thu, Jun 16, 2022 at 01:14:09AM +0300, Laurent Pinchart wrote:
> > Now that a header exists with macros for the media interface bus-type
> > values, replace hardcoding numerical constants with the corresponding
> > macros in the DT sources.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > ---
> >  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
> >  .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
> >  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
> >  3 files changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > index 4e58c54cde17..33ac4bd1e63b 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > @@ -7,6 +7,9 @@
> >   */
> >
> >  /dts-v1/;
> > +
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> >  #include "r8a7742-iwg21d-q7.dts"
> >
> >  / {
> > @@ -242,7 +245,7 @@ port {
> >               vin0ep: endpoint {
> >                       remote-endpoint = <&cam0ep>;
> >                       bus-width = <8>;
> > -                     bus-type = <6>;
> > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> >               };
> >       };
> >  };
> > @@ -273,7 +276,7 @@ port {
> >               vin1ep: endpoint {
> >                       remote-endpoint = <&cam1ep>;
> >                       bus-width = <8>;
> > -                     bus-type = <6>;
> > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> >               };
> >       };
> >  };
> > @@ -305,7 +308,7 @@ vin2ep: endpoint {
> >                       remote-endpoint = <&cam2ep>;
> >                       bus-width = <8>;
> >                       data-shift = <8>;
> > -                     bus-type = <6>;
> > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> >               };
> >       };
> >  };
> > @@ -335,7 +338,7 @@ port {
> >               vin3ep: endpoint {
> >                       remote-endpoint = <&cam3ep>;
> >                       bus-width = <8>;
> > -                     bus-type = <6>;
> > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> >               };
> >       };
> >  };
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > index 40cef0b1d1e6..c73160df619d 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > @@ -7,6 +7,8 @@
> >   * Copyright (C) 2020 Renesas Electronics Corp.
> >   */
> >
> > +#include <dt-bindings/media/video-interfaces.h>

This .dtsi file is only intended to be included by
arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts, which already has
the include.  Hence if you don't mind, I would like to drop this part
while applying  and queuing in renesas-devel for v6.3.

> > +
> >  #define CAM_ENABLED  1
> >
> >  &CAM_PARENT_I2C {
> > @@ -26,7 +28,7 @@ port {
> >                       CAM_EP: endpoint {
> >                               bus-width = <8>;
> >                               data-shift = <2>;
> > -                             bus-type = <6>;
> > +                             bus-type = <MEDIA_BUS_TYPE_BT656>;
> >                               pclk-sample = <1>;
> >                               remote-endpoint = <&VIN_EP>;
> >                       };
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
> > index f5e77f024251..a7f5cfec64b8 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
> > @@ -7,6 +7,8 @@
> >   * Copyright (C) 2020 Renesas Electronics Corp.
> >   */
> >
> > +#include <dt-bindings/media/video-interfaces.h>

Likewise

> > +
> >  #define CAM_ENABLED  1
> >
> >  &CAM_PARENT_I2C {
> > @@ -21,7 +23,7 @@ ov7725@21 {
> >               port {
> >                       CAM_EP: endpoint {
> >                               bus-width = <8>;
> > -                             bus-type = <6>;
> > +                             bus-type = <MEDIA_BUS_TYPE_BT656>;
> >                               remote-endpoint = <&VIN_EP>;
> >                       };
> >               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
