Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9FC81D18B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 04:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813AF10E023;
	Sat, 23 Dec 2023 03:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8992310E023
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 03:01:09 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7b71e389fb2so108216739f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 19:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703300469; x=1703905269; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J8OoqAiM//Ec8KyRzYnGWKahzmDJ4khoTmwRNIjxv3I=;
 b=Omq5zRsp/lPZcnPDuJgI2U9zKfDyLZ4K9cb4Fuu/KWZaOOqYJYHJwvKtPAyPTztSgR
 his/hmJjMbP4nSLryfCBy1ZuE+fJlKyVOzfBSmBin0X50/2H1aVM1H8vefLZtw2oYWT9
 dA1ukDy1zz0WkRciUZgbyuEZ/82GmeZ5N7XYE5yE/kzCIib/kkH3tNc5Tz/YVTmBSXgx
 jN14QyaVIhhCa9fZeQsgySPxZvz0tS42YqdvIgS8/CKnDPzKZ9Cn8AvXJ0sQX9fhAp0o
 5rbW+3wHlLa6Jj4mGIKxYSljjRbAS0135taHd104AqCwWTonw8uFNvgiTueIicNjdq4x
 TqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703300469; x=1703905269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8OoqAiM//Ec8KyRzYnGWKahzmDJ4khoTmwRNIjxv3I=;
 b=ufrqfy5mM4moJ3dN7Va8AX8GDshSYajgPNDdj6zmnolgG7d4tSXFITkQ9elDe4+Ji7
 a/GH7mmLBAACjOggGle018ADMWEo7KOYFuoffX25FdfFFAFTkVX/TTKJvN4bXjgmqxzb
 /GPWyyWvHkvSyHGi3/VO8824oEeaTL728vbDWkLbZpVBZDQNgHSSAjUzqxB9h07OGbhF
 ptosgsnJSVL3ijYUOlrzexXggECK7A+j2FGOlt7e6LdqbFrrKfRvednrZB73Q/X6Codd
 cufzf9+01y+lVc1PIM2mH7QGAqRFyHg4PLS1y0OXOMkLdwzORxHIy48FLRoC6eBdWF4h
 0Wwg==
X-Gm-Message-State: AOJu0YwA4SRTO4hJJnt4ht+5l3iuUigHqmWrJdXHJuu1kEYq9FkhNxzg
 FpFLdWnCqkXUSIedFgzDcB09bH+BuZCjUJTWbHk=
X-Google-Smtp-Source: AGHT+IGGQNHVY11KYqlpzCvOtz5O3eCysFRigaLzsJ7bhd+IOCocMo+8AMyQ75OsMpXnCU/hkwmTTbKD9TikM+6vv+4=
X-Received: by 2002:a5e:a803:0:b0:7b7:fde0:ccfb with SMTP id
 c3-20020a5ea803000000b007b7fde0ccfbmr2699501ioa.9.1703300468716; Fri, 22 Dec
 2023 19:01:08 -0800 (PST)
MIME-Version: 1.0
References: <ZXM9pG-53V4S8E2H@smile.fi.intel.com>
 <7c848801-cf7f-4293-8a29-084dd20efb8e@tronnes.org>
 <ZXcMTBKbHiuTLAfR@smile.fi.intel.com>
In-Reply-To: <ZXcMTBKbHiuTLAfR@smile.fi.intel.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Sat, 23 Dec 2023 11:00:32 +0800
Message-ID: <CAL9mu0+PDhFEWM7TKbMOQfKF0kSgGxo67qd1MRuCLpzq=d_Edg@mail.gmail.com>
Subject: Re: State of affairs with Ilitek 9341 support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, Priit Laes <plaes@plaes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Lechner <dlechner@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 at 21:19, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Dec 08, 2023 at 09:18:20PM +0100, Noralf Tr=C3=B8nnes wrote:
> > On 12/8/23 17:00, Andy Shevchenko wrote:
> > > Included authors and latest (non-white-space) contributors to the dri=
vers
> > > in question along with relevant mailing list and respective (active i=
n the
> > > area) maintainers.
> > >
> > > I already had risen the question in times when 4th (sic!) driver for =
the same
> > > hardware was about to be pulled into upstream that we have to somehow=
 reduce
> > > the code base and unify device properties.
> > >
> > > So, the main question here "What is the plan and where are we now?"
> > >
> > > I admit that fbtft case is special as it supports, in particular, pla=
tform
> > > device (parallel interface) and also well established in the embedded=
 world.
> > > What about the rest?
> > >
> > > N.B. Besides the fact that panel drivers are too OF-centric, which is=
 bad
> > > practice for the new kernel code in general and has to be stopped. I.=
o.w.
> > > seeing of_property_*() or alike in the driver after ca. 2020 should b=
e
> > > immediate NAK unless it's very well justified why it may not be used =
on
> > > non-OF systems.
>
> Noralf, thanks for your response, my comments below.
>
> TBH I would also like to hear from maintainers, because it seems they got
> an additional burden for no benefit.
>
> > Last year drivers/gpu/drm/tiny/panel-mipi-dbi.c was added to support al=
l
> > MIPI DBI compatible (ili9341) SPI displays.
> > It loads the initialisation commands from a firmware file. For more inf=
o
> > see https://github.com/notro/panel-mipi-dbi/wiki.
> >
> > When I started on fbtft in 2013 I didn't know about MIPI DBI so I made
> > some common bus access functions and one driver per controller and that
> > driver had an initialisation sequence to match the panel I had. Then I
> > discovered that displays using the same controller could have different
> > init sequences so I added a Device Tree <init> property that could
> > override the driver init.
> >
> > In 2015 fbtft was added to drivers/staging, but later that year fbdev
> > was closed for new drivers so it was a dead end.
> >
> > I started to work on porting fbtft to DRM and almost 2 years later
> > support for the MI0283QT panel (ILI9341) was added.
> > I had now learned about MIPI DBI so a library to handle that was added.
> > I had asked on the Device Tree ML about the <init> property and I was
> > told that I couldn't have that which meant that I couldn't get away wit=
h
> > having just one driver for the MIPI DBI compatible display panels as I
> > was first hoping for.
> >
> > I was aware that there was a challenge going from fbtft to DRM because
> > in fbtft there is support for all panel setups using the <init>
> > property, but in DRM every panel needed support in a driver. So I
> > started to look at adding Device Tree properties to describe the setup
> > for one controller. This would make it easy to describe a new panel in
> > Device Tree for a supported controller. Maxime Ripard came up with the
> > idea to have the controller initialisation commands in a firmware file
> > which meant that we could get away with having just one driver for all
> > MIPI DBI SPI panels (which is the vast majority of these SPI pixel
> > upload panels).
> >
> > This meant that SPI support could be removed from all the MIPI DBI
> > compatible controllers in fbtft
>
> I believe it can't. Otherwise we _must_ provide the DT (device property)
> parser that uses what is provided for fbtft SPI to be enabled in the othe=
r
> driver.
>
> > since there's now a solution for them in
> > DRM. The drivers themselves must stay since they also have parallel bus
> > support which is lacking in DRM. My plan was to wait for panel-mipi-dbi
> > to hit an LTS and then either prepare patches to remove MIPI DBI SPI
> > support from fbtft or at least send an email to staging about the new
> > driver.
>
> > Unfortunately my health problems got worse and many plans went
> > out the window.
>
> Oh, sad to hear this, hope you will get better sooner than later!
>
> > ILI9341 DRM drivers
> >
> > - drivers/gpu/drm/tiny/mi0283qt.c
> >   This was the first driver added for the MI0283QT panel series
> >
> > - drivers/gpu/drm/tiny/ili9341.c
> >   Later ili9341 based panels was decided to be added to a controller
> >   specific driver.
>
> Why was it appeared in the first place? :-(
>
> > - drivers/gpu/drm/tiny/panel-mipi-dbi.c
> >   Generic MIPI DBI SPI driver that loads init commands from a firmware
> >   file. It uses of_property_read_string_index() and
> >   of_get_drm_panel_display_mode(). I don't know if it's possible to mak=
e
> >   device_property_*() versions of those.
>
> Everything like this is possible, just somebody needs to fulfill that.
> And as I said, new OF-centric code, has to be NAKed by default.
>
> > - drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> >   This driver supports the MIPI DPI (RGB) interface on the controller.
> >   Controller init is done over MIPI DBI SPI. The driver does also for
> >   some reason support the same panel as the ili9341.c driver does.
> >   So 2 drivers for the same panel...
> >   Sidenote: It is possible to make a generic panel-mipi-dpi.c driver fo=
r
> >   panels that use DPI for pixels and DBI for init loaded from a firmwar=
e
> >   file.
>
> I wonder who has enough experience and time to at least point out or do
> something about this...
>
> At least we can start combining the two in tinydrm, to reduce the variety=
.
>

I wrote drivers/gpu/drm/panel/panel-ilitek-ili9341.c to support ili9341
on stm32f429-disco board via dbi or dpi.
https://www.st.com/resource/en/schematic_pack/mb1075-f429i-c01_schematic.pd=
f

As one driver for one panel reason, so porting the mipi_dbi code and
dts binding from tiny/ili9341.c
It's true confused two driver for one panel in current kernel.
I can remove the mipi_dbi code from panel-ilitek-ili9341.c or do something =
else.

Anyway, I'd like to rewrite it based on the agreement.

> --
> With Best Regards,
> Andy Shevchenko
>
>
