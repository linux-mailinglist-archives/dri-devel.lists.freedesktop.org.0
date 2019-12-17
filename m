Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59375121F5B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 01:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB0D89166;
	Tue, 17 Dec 2019 00:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF5C89166
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 00:20:53 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id z76so3856410qka.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rcYYKKReUBGWXboa3Z4PDSMxQ6wy4qq00yPn8VnaL78=;
 b=kGD+FtXdPF7QRzcW2IP44zpgI2q7QaRgxUPXiyCLiuv64Y/hkDwru4JYYvrkztcv9Y
 tdsztdkovO2wkp7Y7cQhrVAa9Tp2bp0dnQBc2jB5YOIOT3tuiIFYv8C6Wot5IgE842Tz
 h/4pyvv6ChAwWtmHxO6Z8ct/Wz4vtUu+AYXDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rcYYKKReUBGWXboa3Z4PDSMxQ6wy4qq00yPn8VnaL78=;
 b=lAGuusv6+TSMJTc3Y2xVS/XSVaIadylKCACIYfBUMgKTMwpks9J3iXBFOPlP/VpmcR
 0dr0kmbDl3XpqbbJVp9gODGRRiYYzucC8AdVZ5UYUT1z15svJuHxoRCSor25/RJ0UUYY
 gtWnq4Kkk6cnAp6JLR+dPis4HGFCRdpqYM/7VzYmLederGaeSpNDs3KGXBPkZyJjxdqD
 RkPK7uuc5KWN0AoD3V6Hwa0VIi9auJI2lIuOnzqNzQZcspICdQFdJ65Vk/FxO7CQmhlX
 B6aDD+P8ZEP5YHTz5Zqhxlf7kircEQVC+vu6bzRTok0H19IFwhs9DM2VUusPU173jXq+
 W37A==
X-Gm-Message-State: APjAAAWUBYLrIx+MaR8/5lgk4btzHsKS9lbpQ1mj4axHEZ995xXLh9Nf
 4OOXmpTQcoVO0ZMqFnQVMDnizoZQXabaQ7we0nLpkQ==
X-Google-Smtp-Source: APXvYqyP5uRGDWxRzTHJYRZv0g5YA40ZLZyjzpB+invEA05QeaZ3PxSeg+5HXDzapVTOIOHGRyDs1T4M33+Y4pRvirA=
X-Received: by 2002:a05:620a:6d7:: with SMTP id
 23mr2207995qky.299.1576542052213; 
 Mon, 16 Dec 2019 16:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-3-hsinyi@chromium.org>
 <20191213223816.GS4860@pendragon.ideasonboard.com>
 <CAJMQK-gFn8WeokxGfAZ-akNvdEbQhPj_3Ax2sD7Ti6JcSvjF4g@mail.gmail.com>
 <CANMq1KDh=ehp0RDFRLQ5OCTibrK=Uzp2UFVLM+7AhwpVp-X=yQ@mail.gmail.com>
 <20191216163910.GC14502@pendragon.ideasonboard.com>
In-Reply-To: <20191216163910.GC14502@pendragon.ideasonboard.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 17 Dec 2019 08:20:41 +0800
Message-ID: <CANMq1KA1OMMzwLVMhFeb-zLuPLJsXrvVMji=u0RZ_kWnQprvoA@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/4] drm: bridge: anx7688: Add anx7688 bridge
 driver support.
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Matthias Brugger <mbrugger@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: multipart/mixed; boundary="===============0300286281=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0300286281==
Content-Type: multipart/alternative; boundary="000000000000fef3aa0599db4c85"

--000000000000fef3aa0599db4c85
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Tue, Dec 17, 2019 at 12:39 AM Laurent Pinchart <
laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Nicolas and Hsin-Yi,
>
> On Mon, Dec 16, 2019 at 06:19:24PM +0800, Nicolas Boichat wrote:
> > On Mon, Dec 16, 2019 at 4:46 PM Hsin-Yi Wang wrote:
> > > On Sat, Dec 14, 2019 at 6:38 AM Laurent Pinchart wrote:
> > > > On Wed, Dec 11, 2019 at 02:19:09PM +0800, Hsin-Yi Wang wrote:
> > > > > From: Nicolas Boichat <drinkcat@chromium.org>
> > > > >
> > > > > ANX7688 is a HDMI to DP converter (as well as USB-C port
controller),
> > > > > that has an internal microcontroller.
> > > > >
> > > > > The only reason a Linux kernel driver is necessary is to reject
> > > > > resolutions that require more bandwidth than what is available on
> > > > > the DP side. DP bandwidth and lane count are reported by the
bridge
> > > > > via 2 registers on I2C.
> > > >
> > > > How about power, doesn't this chip have power supplies that
potentially
> > > > need to be controlled ?
> > > >
> > > Ideally we should add power supplies as well, but the power is
> > > supplied by ec in mt8173 oak board. And we only have this board can
> > > test this driver. If we add power supplies in driver we can't test it.
> >
> > To clarify a bit more, this is because this chip is actually a
> > TCPC+mux+HDMI=>DP converter
> > (https://www.analogix.com/en/products/convertersbridges/anx7688). In
> > Chromebook architecture, TCPC+mux is controlled by the EC (including
> > power and other control pins), and the only reason we need a driver
> > for the HDMI=>DP converter is to get the number of lanes on the DP
> > side and filter out resolutions. Also, the converter is on a different
> > I2C address and it could almost be considered as a separate device.
> >
> > (of course we could write a kernel driver for the TCPC+mux but we'll
> > leave that to others if there's ever a board that is built with the
> > TCPC part connected to the AP)
>
> Is the mux the one that is handled through a gpio-mux driver in this
> series, or a different mux ?

It's a different mux: it's the usual USB-C mux that takes in USB 3.0 and DP
(internally converted from HDMI), and decides which 2 lanes to use for
each, and flip if necessary. This is all controlled by the EC (like on most
other Chromebook), so this is transparent to the kernel, at least on
Chromebooks.

> It would really, really help if you could
> show a block diagram of the related hardware (including the EC), as this
> is quite confusing. With every e-mail exchanged there's a bit more
> information that change my understanding of the issue, I can't really
> provide guidance without a full overview.

https://lkml.org/lkml/2019/12/9/548 that you drew is accurate for the
display part of the problem.

You can just add a USB3 connection to the above (there's also I2C interface
to the EC of course to control the TCPC/mux aspect of it, but that's on
different I2C addresses).

                                     +-----------+
+---------+         +------+    /--> | HDMI      |
| MT8173  |  HDMI   |   -->| --/     | Connector |
|  HDMI   | ------> |--/   |         +-----------+
| Encoder |         |    ->| --\     +-----------+      +-----------+
+---------+         +------+    \--> | ANX7688   | ---> | USB-C     |
                                     | Bridge    |      | Connector |
                             USB3--> | + mux     |      |           |
				     +-----------+      +-----------+
                                         ^

The ANX7688 brige could _almost_ work driverless (and it does already), the
_only_ thing that the driver is doing is filtering out impossible
resolution based on DP (over USB-C) number of lanes and bandwidth.

> > > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/Kconfig            |   9 +
> > > > >  drivers/gpu/drm/bridge/Makefile           |   1 +
> > > > >  drivers/gpu/drm/bridge/analogix-anx7688.c | 202
++++++++++++++++++++++
> > > > >  3 files changed, 212 insertions(+)
> > > > >  create mode 100644 drivers/gpu/drm/bridge/analogix-anx7688.c
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/Kconfig
b/drivers/gpu/drm/bridge/Kconfig
> > > > > index 34362976cd6f..1f3fc6bec842 100644
> > > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > > @@ -16,6 +16,15 @@ config DRM_PANEL_BRIDGE
> > > > >  menu "Display Interface Bridges"
> > > > >       depends on DRM && DRM_BRIDGE
> > > > >
> > > > > +config DRM_ANALOGIX_ANX7688
> > > > > +     tristate "Analogix ANX7688 bridge"
> > > > > +     select DRM_KMS_HELPER
> > > > > +     select REGMAP_I2C
> > > > > +     ---help---
> > > > > +       ANX7688 is a transmitter to support DisplayPort over
USB-C for
> > > > > +       smartphone and tablets.
> > > > > +       This driver only supports the HDMI to DP component of the
chip.
> > > > > +
> > > > >  config DRM_ANALOGIX_ANX78XX
> > > > >       tristate "Analogix ANX78XX bridge"
> > > > >       select DRM_KMS_HELPER
> > > > > diff --git a/drivers/gpu/drm/bridge/Makefile
b/drivers/gpu/drm/bridge/Makefile
> > > > > index 4934fcf5a6f8..7a1e0ec032e6 100644
> > > > > --- a/drivers/gpu/drm/bridge/Makefile
> > > > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > > > @@ -1,4 +1,5 @@
> > > > >  # SPDX-License-Identifier: GPL-2.0
> > > > > +obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
> > > > >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> > > > >  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> > > > >  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
> > > > > diff --git a/drivers/gpu/drm/bridge/analogix-anx7688.c
b/drivers/gpu/drm/bridge/analogix-anx7688.c
> > > > > new file mode 100644
> > > > > index 000000000000..baaed48d6201
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/bridge/analogix-anx7688.c
> > > > > @@ -0,0 +1,202 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +/*
> > > > > + * ANX7688 HDMI->DP bridge driver
> > > > > + *
> > > > > + * Copyright 2016 Google LLC
> > > > > + */
> > > > > +
> > > > > +#include <linux/i2c.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/regmap.h>
> > > > > +#include <drm/drm_bridge.h>
> > > > > +
> > > > > +/* Register addresses */
> > > > > +#define VENDOR_ID_REG 0x00
> > > > > +#define DEVICE_ID_REG 0x02
> > > > > +
> > > > > +#define FW_VERSION_REG 0x80
> > > > > +
> > > > > +#define DP_BANDWIDTH_REG 0x85
> > > > > +#define DP_LANE_COUNT_REG 0x86
> > > >
> > > > Are these registers defined by the ANX7688 hardware, or by the
firmware
> > > > running on the chip (and, I assume, developed by Google) ?
> > > >
> > > By firmware developed by ANX provided to Google.
> >
> > We asked for these registers to be added to ANX FW, and this is the FW
> > that is used by all elm/hana Chromebooks (I have no idea about other
> > ANX customers...). We have facilities to update the ANX FW from
> > coreboot/depthcharge on Chromebooks, but that does not really matter:
> > the factory FW of all MP Chromebooks does provide these registers.
>
> So the driver is specific to Chromebooks, it doesn't support all
> ANX7688. Sweet :-(

FWIW, this is a 3+ year old part, so it appears that nobody else cares
anyway?

Also, this driver is only required to implement the mode filtering, which,
possibly, is only supported by the Google version of the FW (I have no idea
what other customers ANX has for this part).

> --
> Regards,
>
> Laurent Pinchart

--000000000000fef3aa0599db4c85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"monospace">Hi Laurent,<br><br>On Tue, Dec 17=
, 2019 at 12:39 AM Laurent Pinchart &lt;<a href=3D"mailto:laurent.pinchart@=
ideasonboard.com" target=3D"_blank">laurent.pinchart@ideasonboard.com</a>&g=
t; wrote:<br>&gt;<br>&gt; Hello Nicolas and Hsin-Yi,<br>&gt;<br>&gt; On Mon=
, Dec 16, 2019 at 06:19:24PM +0800, Nicolas Boichat wrote:<br>&gt; &gt; On =
Mon, Dec 16, 2019 at 4:46 PM Hsin-Yi Wang wrote:<br>&gt; &gt; &gt; On Sat, =
Dec 14, 2019 at 6:38 AM Laurent Pinchart wrote:<br>&gt; &gt; &gt; &gt; On W=
ed, Dec 11, 2019 at 02:19:09PM +0800, Hsin-Yi Wang wrote:<br>&gt; &gt; &gt;=
 &gt; &gt; From: Nicolas Boichat &lt;<a href=3D"mailto:drinkcat@chromium.or=
g" target=3D"_blank">drinkcat@chromium.org</a>&gt;<br>&gt; &gt; &gt; &gt; &=
gt;<br>&gt; &gt; &gt; &gt; &gt; ANX7688 is a HDMI to DP converter (as well =
as USB-C port controller),<br>&gt; &gt; &gt; &gt; &gt; that has an internal=
 microcontroller.<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; T=
he only reason a Linux kernel driver is necessary is to reject<br>&gt; &gt;=
 &gt; &gt; &gt; resolutions that require more bandwidth than what is availa=
ble on<br>&gt; &gt; &gt; &gt; &gt; the DP side. DP bandwidth and lane count=
 are reported by the bridge<br>&gt; &gt; &gt; &gt; &gt; via 2 registers on =
I2C.<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; How about power, doesn&#=
39;t this chip have power supplies that potentially<br>&gt; &gt; &gt; &gt; =
need to be controlled ?<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; Ideally we=
 should add power supplies as well, but the power is<br>&gt; &gt; &gt; supp=
lied by ec in mt8173 oak board. And we only have this board can<br>&gt; &gt=
; &gt; test this driver. If we add power supplies in driver we can&#39;t te=
st it.<br>&gt; &gt;<br>&gt; &gt; To clarify a bit more, this is because thi=
s chip is actually a<br>&gt; &gt; TCPC+mux+HDMI=3D&gt;DP converter<br>&gt; =
&gt; (<a href=3D"https://www.analogix.com/en/products/convertersbridges/anx=
7688" target=3D"_blank">https://www.analogix.com/en/products/convertersbrid=
ges/anx7688</a>). In<br>&gt; &gt; Chromebook architecture, TCPC+mux is cont=
rolled by the EC (including<br>&gt; &gt; power and other control pins), and=
 the only reason we need a driver<br>&gt; &gt; for the HDMI=3D&gt;DP conver=
ter is to get the number of lanes on the DP<br>&gt; &gt; side and filter ou=
t resolutions. Also, the converter is on a different<br>&gt; &gt; I2C addre=
ss and it could almost be considered as a separate device.<br>&gt; &gt;<br>=
&gt; &gt; (of course we could write a kernel driver for the TCPC+mux but we=
&#39;ll<br>&gt; &gt; leave that to others if there&#39;s ever a board that =
is built with the<br>&gt; &gt; TCPC part connected to the AP)<br>&gt;<br>&g=
t; Is the mux the one that is handled through a gpio-mux driver in this<br>=
&gt; series, or a different mux ?<br><br>It&#39;s a different mux: it&#39;s=
 the usual USB-C mux that takes in USB 3.0 and DP (internally converted fro=
m HDMI), and decides which 2 lanes to use for each, and flip if necessary. =
This is all controlled by the EC (like on most other Chromebook), so this i=
s transparent to the kernel, at least on Chromebooks.<br><br>&gt; It would =
really, really help if you could<br>&gt; show a block diagram of the relate=
d hardware (including the EC), as this<br>&gt; is quite confusing. With eve=
ry e-mail exchanged there&#39;s a bit more<br>&gt; information that change =
my understanding of the issue, I can&#39;t really<br>&gt; provide guidance =
without a full overview.<br><br><a href=3D"https://lkml.org/lkml/2019/12/9/=
548" target=3D"_blank">https://lkml.org/lkml/2019/12/9/548</a> that you dre=
w is accurate for the display part of the problem.<br><br>You can just add =
a USB3 connection to the above (there&#39;s also I2C interface to the EC of=
 course to control the TCPC/mux aspect of it, but that&#39;s on different I=
2C addresses).<br></font><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0=
)">                                     +-----------+<br>+---------+       =
  +------+    /--&gt; | HDMI      |<br>| MT8173  |  HDMI   |   --&gt;| --/ =
    | Connector |<br>|  HDMI   | ------&gt; |--/   |         +-----------+<=
br>| Encoder |         |    -&gt;| --\     +-----------+      +-----------+=
<br>+---------+         +------+    \--&gt; | ANX7688   | ---&gt; | USB-C  =
   |<br>                                     | Bridge    |      | Connector=
 |<br>                             USB3--&gt; | + mux     |      |         =
  |<br>				     +-----------+      +-----------+
                                         ^</pre><font face=3D"monospace"><d=
iv>The ANX7688 brige could _almost_ work driverless (and it does already), =
the _only_ thing that the driver is doing is filtering out impossible resol=
ution based on DP (over USB-C) number of lanes and bandwidth.</div><div><br=
></div>&gt; &gt; &gt; &gt; &gt; Signed-off-by: Nicolas Boichat &lt;<a href=
=3D"mailto:drinkcat@chromium.org" target=3D"_blank">drinkcat@chromium.org</=
a>&gt;<br>&gt; &gt; &gt; &gt; &gt; Signed-off-by: Hsin-Yi Wang &lt;<a href=
=3D"mailto:hsinyi@chromium.org" target=3D"_blank">hsinyi@chromium.org</a>&g=
t;<br>&gt; &gt; &gt; &gt; &gt; ---<br>&gt; &gt; &gt; &gt; &gt; =C2=A0driver=
s/gpu/drm/bridge/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
9 +<br>&gt; &gt; &gt; &gt; &gt; =C2=A0drivers/gpu/drm/bridge/Makefile =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +<br>&gt; &gt; &gt; &gt; &gt; =
=C2=A0drivers/gpu/drm/bridge/analogix-anx7688.c | 202 +++++++++++++++++++++=
+<br>&gt; &gt; &gt; &gt; &gt; =C2=A03 files changed, 212 insertions(+)<br>&=
gt; &gt; &gt; &gt; &gt; =C2=A0create mode 100644 drivers/gpu/drm/bridge/ana=
logix-anx7688.c<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; dif=
f --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig<b=
r>&gt; &gt; &gt; &gt; &gt; index 34362976cd6f..1f3fc6bec842 100644<br>&gt; =
&gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/bridge/Kconfig<br>&gt; &gt; &gt; =
&gt; &gt; +++ b/drivers/gpu/drm/bridge/Kconfig<br>&gt; &gt; &gt; &gt; &gt; =
@@ -16,6 +16,15 @@ config DRM_PANEL_BRIDGE<br>&gt; &gt; &gt; &gt; &gt; =C2=
=A0menu &quot;Display Interface Bridges&quot;<br>&gt; &gt; &gt; &gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 depends on DRM &amp;&amp; DRM_BRIDGE<br>&gt; &gt; &gt;=
 &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; +config DRM_ANALOGIX_ANX7688<br>&gt;=
 &gt; &gt; &gt; &gt; + =C2=A0 =C2=A0 tristate &quot;Analogix ANX7688 bridge=
&quot;<br>&gt; &gt; &gt; &gt; &gt; + =C2=A0 =C2=A0 select DRM_KMS_HELPER<br=
>&gt; &gt; &gt; &gt; &gt; + =C2=A0 =C2=A0 select REGMAP_I2C<br>&gt; &gt; &g=
t; &gt; &gt; + =C2=A0 =C2=A0 ---help---<br>&gt; &gt; &gt; &gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 ANX7688 is a transmitter to support DisplayPort over USB-=
C for<br>&gt; &gt; &gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 smartphone and tab=
lets.<br>&gt; &gt; &gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 This driver only s=
upports the HDMI to DP component of the chip.<br>&gt; &gt; &gt; &gt; &gt; +=
<br>&gt; &gt; &gt; &gt; &gt; =C2=A0config DRM_ANALOGIX_ANX78XX<br>&gt; &gt;=
 &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 tristate &quot;Analogix ANX78XX bridge=
&quot;<br>&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 select DRM_KMS_HELP=
ER<br>&gt; &gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/bridge/Makefile=
 b/drivers/gpu/drm/bridge/Makefile<br>&gt; &gt; &gt; &gt; &gt; index 4934fc=
f5a6f8..7a1e0ec032e6 100644<br>&gt; &gt; &gt; &gt; &gt; --- a/drivers/gpu/d=
rm/bridge/Makefile<br>&gt; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/bridge=
/Makefile<br>&gt; &gt; &gt; &gt; &gt; @@ -1,4 +1,5 @@<br>&gt; &gt; &gt; &gt=
; &gt; =C2=A0# SPDX-License-Identifier: GPL-2.0<br>&gt; &gt; &gt; &gt; &gt;=
 +obj-$(CONFIG_DRM_ANALOGIX_ANX7688) +=3D analogix-anx7688.o<br>&gt; &gt; &=
gt; &gt; &gt; =C2=A0obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) +=3D analogix-anx78x=
x.o<br>&gt; &gt; &gt; &gt; &gt; =C2=A0obj-$(CONFIG_DRM_CDNS_DSI) +=3D cdns-=
dsi.o<br>&gt; &gt; &gt; &gt; &gt; =C2=A0obj-$(CONFIG_DRM_DUMB_VGA_DAC) +=3D=
 dumb-vga-dac.o<br>&gt; &gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/br=
idge/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix-anx7688.c<br>&gt;=
 &gt; &gt; &gt; &gt; new file mode 100644<br>&gt; &gt; &gt; &gt; &gt; index=
 000000000000..baaed48d6201<br>&gt; &gt; &gt; &gt; &gt; --- /dev/null<br>&g=
t; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/bridge/analogix-anx7688.c<br>&=
gt; &gt; &gt; &gt; &gt; @@ -0,0 +1,202 @@<br>&gt; &gt; &gt; &gt; &gt; +// S=
PDX-License-Identifier: GPL-2.0-only<br>&gt; &gt; &gt; &gt; &gt; +/*<br>&gt=
; &gt; &gt; &gt; &gt; + * ANX7688 HDMI-&gt;DP bridge driver<br>&gt; &gt; &g=
t; &gt; &gt; + *<br>&gt; &gt; &gt; &gt; &gt; + * Copyright 2016 Google LLC<=
br>&gt; &gt; &gt; &gt; &gt; + */<br>&gt; &gt; &gt; &gt; &gt; +<br>&gt; &gt;=
 &gt; &gt; &gt; +#include &lt;linux/i2c.h&gt;<br>&gt; &gt; &gt; &gt; &gt; +=
#include &lt;linux/module.h&gt;<br>&gt; &gt; &gt; &gt; &gt; +#include &lt;l=
inux/regmap.h&gt;<br>&gt; &gt; &gt; &gt; &gt; +#include &lt;drm/drm_bridge.=
h&gt;<br>&gt; &gt; &gt; &gt; &gt; +<br>&gt; &gt; &gt; &gt; &gt; +/* Registe=
r addresses */<br>&gt; &gt; &gt; &gt; &gt; +#define VENDOR_ID_REG 0x00<br>&=
gt; &gt; &gt; &gt; &gt; +#define DEVICE_ID_REG 0x02<br>&gt; &gt; &gt; &gt; =
&gt; +<br>&gt; &gt; &gt; &gt; &gt; +#define FW_VERSION_REG 0x80<br>&gt; &gt=
; &gt; &gt; &gt; +<br>&gt; &gt; &gt; &gt; &gt; +#define DP_BANDWIDTH_REG 0x=
85<br>&gt; &gt; &gt; &gt; &gt; +#define DP_LANE_COUNT_REG 0x86<br>&gt; &gt;=
 &gt; &gt;<br>&gt; &gt; &gt; &gt; Are these registers defined by the ANX768=
8 hardware, or by the firmware<br>&gt; &gt; &gt; &gt; running on the chip (=
and, I assume, developed by Google) ?<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &=
gt; By firmware developed by ANX provided to Google.<br>&gt; &gt;<br>&gt; &=
gt; We asked for these registers to be added to ANX FW, and this is the FW<=
br>&gt; &gt; that is used by all elm/hana Chromebooks (I have no idea about=
 other<br>&gt; &gt; ANX customers...). We have facilities to update the ANX=
 FW from<br>&gt; &gt; coreboot/depthcharge on Chromebooks, but that does no=
t really matter:<br>&gt; &gt; the factory FW of all MP Chromebooks does pro=
vide these registers.<br>&gt;<br>&gt; So the driver is specific to Chromebo=
oks, it doesn&#39;t support all<br>&gt; ANX7688. Sweet :-(<br><br>FWIW, thi=
s is a 3+ year old part, so it appears that nobody else cares anyway?</font=
><div><font face=3D"monospace"><br></font></div><div><font face=3D"monospac=
e">Also, this driver is only required to implement the mode filtering, whic=
h, possibly, is only supported by the Google version of the FW (I have no i=
dea what other customers ANX has for this part).<br><br>&gt; --<br>&gt; Reg=
ards,<br>&gt;<br>&gt; Laurent Pinchart</font></div></div>

--000000000000fef3aa0599db4c85--

--===============0300286281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0300286281==--
