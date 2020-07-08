Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FAC218115
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6920E89B18;
	Wed,  8 Jul 2020 07:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC16989B18
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 07:23:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f18so1820140wml.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Llds+mPOUza3dTSrFFU5ex60UXtBcz9dAWm8qF93OdE=;
 b=FydZjkB+CTczXTz5wKz7lSK08Ab9LGok1llzE7Qxc2C2PgchBOSxQfg8IGrUjoXOuX
 7XdEZHsZmecGuEkJX51jU8a4r5gtGYMxBlc2jtpb878xrPjCR3TKh5doM1P8CBGcOQ/5
 HnmWuJM2IW6hH+pz4psOZfJGfUoaNefcjDgow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Llds+mPOUza3dTSrFFU5ex60UXtBcz9dAWm8qF93OdE=;
 b=bnUFeCUKLVP2QHvUgC1L9DwsVy/FX/2VwByJUDcjV77Vg3AzUl4oefKTQSmZbIpKZU
 oFtVHlHTkWue8qkKxV++DNVZfu4+SE8hsVacOcW0XEs+F03oZZIZdGO49b8Mo6K0WI0q
 p7gXAA5Qx5nf4pRuacKOqahDnbg0IhMZ/YHmJXXZ9NCXolg3Zpm1WBHrju4RmeXz8Hn7
 ERlTMjsZ0hNvz0zFChdDvwuSljojiGcsXE36QDawHyQluY7vbx3lfPZrUG9q8mrpIZV2
 ZF6gBIuN/xlaTQiZig8GdDKYvaQ15NzJd53OhRd1C8Ouqd2I7UwjqL1ykrmv3k1lK5f4
 9VSw==
X-Gm-Message-State: AOAM533JAMoxpvfeWIxARBV3knFg+OBpdGVYjd20cKcLJBA61Rvh+Drp
 yQUUv9knCJKR4VgZezOmtBqTFw==
X-Google-Smtp-Source: ABdhPJx53GpKF8tjXBaV+mV2rIjMctui2MiyfkMSv8SxEPLqQV0+ehPbKCMFU+1BE8ykcZJYcrOfew==
X-Received: by 2002:a05:600c:2483:: with SMTP id
 3mr7796443wms.120.1594192994417; 
 Wed, 08 Jul 2020 00:23:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 30sm4638600wrm.74.2020.07.08.00.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 00:23:13 -0700 (PDT)
Date: Wed, 8 Jul 2020 09:23:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 0/4] DSI/DBI and TinyDRM driver
Message-ID: <20200708072311.GH3278063@phenom.ffwll.local>
References: <20200607133832.1730288-1-paul@crapouillou.net>
 <c20796dd-d4d2-a989-ba58-7c3c71c15dc2@tronnes.org>
 <20200703172606.GA161457@ravnborg.org>
 <6de49852-bf93-e480-1a1e-6485391bf56c@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6de49852-bf93-e480-1a1e-6485391bf56c@tronnes.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dillon min <dillon.minfei@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 04:32:25PM +0200, Noralf Tr=F8nnes wrote:
> (cc Dillon)
> =

> Den 03.07.2020 19.26, skrev Sam Ravnborg:
> > Hi Noralf/Paul.
> > =

> > Trying to stir up this discussion again.
> > =

> > On Sun, Jun 14, 2020 at 06:36:22PM +0200, Noralf Tr=F8nnes wrote:
> >>
> >>
> >> Den 07.06.2020 15.38, skrev Paul Cercueil:
> >>> Hi,
> >>>
> >>> Here's a follow-up on the previous discussion about the current state=
 of
> >>> DSI/DBI panel drivers, TinyDRM, and the need of a cleanup.
> >>>
> >>> This patchset introduces the following:
> >>> * It slightly tweaks the MIPI DSI code so that it supports MIPI DBI o=
ver
> >>>   various buses. This patch has been tested with a non-upstream DRM
> >>>   panel driver for a ILI9331 DBI/8080 panel, written with the DSI
> >>>   framework (and doesn't include <drm/drm_mipi_dbi.h>), and non-upstr=
eam
> >>>   DSI/DBI host driver for the Ingenic SoCs.
> >>>
> >>> * A SPI DBI host driver, using the current MIPI DSI framework. It all=
ows
> >>>   MIPI DSI/DBI drivers to be written with the DSI framework, even if
> >>>   they are connected over SPI, instead of registering as SPI device
> >>>   drivers. Since most of these panels can be connected over various
> >>>   buses, it permits to reuse the same driver independently of the bus
> >>>   used.
> >>>
> >>> * A TinyDRM driver for DSI/DBI panels, once again independent of the =
bus
> >>>   used; the only dependency (currently) being that the panel must
> >>>   understand DCS commands.
> >>>
> >>> * A DRM panel driver to test the stack. This driver controls Ilitek
> >>>   ILI9341 based DBI panels, like the Adafruit YX240QV29-T 320x240 2.4"
> >>>   TFT LCD panel. This panel was converted from
> >>>   drivers/gpu/drm/tiny/ili9341.c.
> >>>
> >>> I would like to emphasize that while it has been compile-tested, I did
> >>> not test it with real hardware since I do not have any DBI panel
> >>> connected over SPI. I did runtime-test the code, just without any pan=
el
> >>> connected.
> >>>
> >>> Another thing to note, is that it does not break Device Tree ABI. The
> >>> display node stays the same:
> >>>
> >>> display@0 {
> >>> 	compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
> >>> 	reg =3D <0>;
> >>> 	spi-max-frequency =3D <32000000>;
> >>> 	dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> >>> 	reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> >>> 	rotation =3D <270>;
> >>> 	backlight =3D <&backlight>;
> >>> };
> >>>
> >>> The reason it works, is that the "adafruit,yx240qv29" device is probed
> >>> on the SPI bus, so it will match with the SPI/DBI host driver. This w=
ill
> >>> in turn register the very same node with the DSI bus, and the ILI9341
> >>> DRM panel driver will probe. The driver will detect that no controller
> >>> is linked to the panel, and eventually register the DBI/DSI TinyDRM
> >>> driver.
> >>>
> >>> I can't stress it enough that this is a RFC, so it still has very rou=
gh
> >>> edges.
> >>>
> >>
> >> I don't know bridge and dsi drivers so I can't comment on that, but one
> >> thing I didn't like is that the DT compatible string has to be added to
> >> 2 different modules.
> >>
> >> As an example, a MI0283QT panel (ILI9341) supports these interface opt=
ions:
> >>
> >> 1. SPI
> >>    Panel setup/control and framebuffer upload over SPI
> >>
> >> 2. SPI + DPI
> >>    Panel setup/control over SPI, framebuffer scanout over DPI
> >>
> >> 3. Parallel bus
> >>    Panel setup/control and framebuffer upload over parallel bus
> > =

> > To continue the configurations we should support:
> > - Panels where the chip can be configured to SPI, SPI+DPI, Parallel bus
> >   (as detailed by Noralf above)
> > - Panels that supports only 6800 or 8080 - connected via GPIO pins or
> >   memory mapped (maybe behind some special IP to support this)
> >   Command set is often special.
> > =

> > We will see a number of chips with many different types of displays.
> > So the drivers should be chip specific with configuration depending on
> > the connected display.
> > =

> > What I hope we can find a solution for is a single file/driver that can
> > support all the relevant interface types for a chip.
> > So we would end up with a single file that included the necessary
> > support for ili9341 in all interface configurations with the necessary
> > support for the relevant displays.
> > =

> > I do not know how far we are from this as I have not dived into the
> > details of any of the proposals.
> =

> In an ideal world I would have liked to see the MIPI DBI parallel
> interface implemented using a new Linux parallel bus type. It could have
> drivers for gpio bitbanging and mmio in addition to other hw specific
> drivers. Now we could have a drm_mipi_dbi DRM driver that registers as a
> SPI client driver and a Parallel bus client driver. Or it can be a
> component driver for the existing DRM driver on the SoC.
> =

> I had plans to do this and made a prototype, but dropped it since it
> would probably require a lot of work getting in a new Linux bus type.

Channelling my inner Greg KH:

Please just create a new bus, it should be quite easy and boilerplate is
manageable.

Greg, did I get this right? Maybe any recommendations for a simple
parallel bus with perhaps different register access paths depending upon
how it's all wired up exactly?
-Daniel

> However if we're going to treat this parallel bus only as a MIPI DBI
> display interface but support gpio bitbanging and mmio as well, then we
> could add DRM drivers for each MIPI DBI bus (that don't have special
> parallel bus hw):
> - mipi-dbi-spi
> - mipi-dbi-gpio
> - mipi-dbi-mmio
> =

> These drivers will register as a mipi_dsi_host adapted like Paul suggeste=
d.
> =

> The panel drivers will be mipi_dsi_drivers. Now the panels should work
> regardless of bus type. They probably need to know about the bus type,
> at least whether the parallell bus is 8-bit or 16-bit wide.
> =

> The current MIPI DBI SPI drivers (drm/tiny) will need to be treated
> specially to keep working with old Device Trees when moved over to
> drm/panel.
> =

> Noralf.
> =

> =

> >>
> >> My suggestion is to have one panel driver module that can support all =
of
> >> these like this:
> > So I think we agree here.
> > =

> >>
> >> For 1. and 2. a SPI driver is registered and if I understand your
> >> example correctly of_graph_get_port_by_id() can be used during probe to
> >> distinguish between the 2 options and register a full DRM driver for 1.
> >> and add a DRM panel for 2.
> >>
> >> For 3. a DSI driver is registered (adapted for DBI use like you're
> >> suggesting).
> >>
> >> Note that the interface part of the controller initialization will
> >> differ between these, the panel side init will be the same I assume.
> > =

> > 	Sam
> > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
