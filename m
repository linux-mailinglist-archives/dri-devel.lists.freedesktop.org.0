Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67A6104138
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A160C6EA8E;
	Wed, 20 Nov 2019 16:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905986EA8E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:45:53 +0000 (UTC)
X-Originating-IP: 90.76.211.102
Received: from aptenodytes (lfbn-1-2154-102.w90-76.abo.wanadoo.fr
 [90.76.211.102])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 081036000B;
 Wed, 20 Nov 2019 16:45:48 +0000 (UTC)
Date: Wed, 20 Nov 2019 17:45:48 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add xylon logicvc bindings
 documentation
Message-ID: <20191120164548.GA168745@aptenodytes>
References: <20190910153409.111901-1-paul.kocialkowski@bootlin.com>
 <20190910153409.111901-2-paul.kocialkowski@bootlin.com>
 <20190913143510.GA9504@bogus> <20190913155815.GA1554@aptenodytes>
 <CAL_Jsq+dzT1xrfBy2QQHLx9MUNukWWq5eXyOecVV8h0z5ziC8g@mail.gmail.com>
 <20190923153311.GE57525@aptenodytes>
 <CAL_JsqJLfAb0xhmBoX+GUcv5wsuHBOs8wZ=Hkw3x03kfsPgOqg@mail.gmail.com>
 <20191120144957.GA167553@aptenodytes>
 <CAL_Jsq+n2HYz3BLm3Nad=Uv6qiJNM2=fQmCxzkXJZx-0=VQTFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+n2HYz3BLm3Nad=Uv6qiJNM2=fQmCxzkXJZx-0=VQTFQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0145462994=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0145462994==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 20 Nov 19, 10:02, Rob Herring wrote:
> On Wed, Nov 20, 2019 at 8:50 AM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > Hi,
> >
> > Circling back to this thread now, sorry for the delay.
> >
> > On Tue 24 Sep 19, 09:58, Rob Herring wrote:
> > > On Mon, Sep 23, 2019 at 10:33 AM Paul Kocialkowski
> > > <paul.kocialkowski@bootlin.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Fri 13 Sep 19, 20:16, Rob Herring wrote:
> > > > > On Fri, Sep 13, 2019 at 4:58 PM Paul Kocialkowski
> > > > > <paul.kocialkowski@bootlin.com> wrote:
> > > > > >
> > > > > > Hi Rob and thanks for the review!
> > > > > >
> > > > > > On Fri 13 Sep 19, 15:35, Rob Herring wrote:
> > > > > > > On Tue, Sep 10, 2019 at 05:34:08PM +0200, Paul Kocialkowski w=
rote:
> > > > > > > > The Xylon LogiCVC is a display controller implemented as pr=
ogrammable
> > > > > > > > logic in Xilinx FPGAs.
> > > > > > > >
> > > > > > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin=
=2Ecom>
> > > > > > > > ---
> > > > > > > >  .../bindings/display/xylon,logicvc.txt        | 188 ++++++=
++++++++++++
> > > > > > > >  1 file changed, 188 insertions(+)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/displ=
ay/xylon,logicvc.txt
> > > > > > >
> > > > > > > Consider converting this to DT schema format. See
> > > > > > > Documentation/devicetree/writing-schema.rst (.md in 5.3).
> > > > > >
> > > > > > Oh right, that would certainly be much more future-proof!
> > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/display/xylo=
n,logicvc.txt b/Documentation/devicetree/bindings/display/xylon,logicvc.txt
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..eb4b1553888a
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/display/xylon,logic=
vc.txt
> > > > > > > > @@ -0,0 +1,188 @@
> > > > > > > > +Xylon LogiCVC display controller
> > > > > > > > +
> > > > > > > > +The Xylon LogiCVC is a display controller that supports mu=
ltiple layers.
> > > > > > > > +It is usually implemented as programmable logic and was op=
timized for use
> > > > > > > > +with Xilinx Zynq-7000 SoCs and Xilinx FPGAs.
> > > > > > > > +
> > > > > > > > +Because the controller is intended for use in a FPGA, most=
 of the configuration
> > > > > > > > +of the controller takes place at logic configuration bitst=
ream synthesis time.
> > > > > > > > +As a result, many of the device-tree bindings are meant to=
 reflect the
> > > > > > > > +synthesis configuration. These do not allow configuring th=
e controller
> > > > > > > > +differently than synthesis configuration.
> > > > > > > > +
> > > > > > > > +Layers are declared in the "layers" sub-node and have dedi=
cated configuration.
> > > > > > > > +In version 3 of the controller, each layer has fixed memor=
y offset and address
> > > > > > > > +starting from the video memory base address for its frameb=
uffer. With version 4,
> > > > > > > > +framebuffers are configured with a direct memory address i=
nstead.
> > > > > > > > +
> > > > > > > > +Matching synthesis parameters are provided when applicable.
> > > > > > > > +
> > > > > > > > +Required properties:
> > > > > > > > +- compatible: Should be one of:
> > > > > > > > +  "xylon,logicvc-3.02.a-display"
> > > > > > > > +  "xylon,logicvc-4.01.a-display"
> > > > > > > > +- reg: Physical base address and size for the controller r=
egisters.
> > > > > > > > +- clocks: List of phandle and clock-specifier pairs, one f=
or each entry
> > > > > > > > +  in 'clock-names'
> > > > > > > > +- clock-names: List of clock names that should at least co=
ntain:
> > > > > > > > +  - "vclk": The VCLK video clock input.
> > > > > > > > +- interrupts: The interrupt to use for VBLANK signaling.
> > > > > > > > +- xylon,display-interface: Display interface in use, shoul=
d be one of:
> > > > > > > > +  - "lvds-4bits": 4-bit LVDS interface (C_DISPLAY_INTERFAC=
E =3D=3D 4).
> > > > > > > > +- xylon,display-colorspace: Display output colorspace in u=
se, should be one of:
> > > > > > > > +  - "rgb": RGB colorspace (C_DISPLAY_COLOR_SPACE =3D=3D 0).
> > > > > > > > +- xylon,display-depth: Display output depth in use (C_PIXE=
L_DATA_WIDTH).
> > > > > > > > +- xylon,row-stride: Fixed number of pixels in a framebuffe=
r row (C_ROW_STRIDE).
> > > > > > > > +- xylon,layers-count: The number of available layers (C_NU=
M_OF_LAYERS).
> > > > > > >
> > > > > > > Presumably some of this is determined by the display attached=
=2E Isn't it
> > > > > > > safe to assume the IP was configured correctly for the intend=
ed display
> > > > > > > and you can just get this from the panel?
> > > > > >
> > > > > > Layers are what corresponds to DRM planes, which are not actual=
ly indicated
> > > > > > by the panel but are a charasteristic of the display controller=
=2E In our case,
> > > > > > this is directly selected at bitstream synthesis time for the c=
ontroller.
> > > > > >
> > > > > > So I'm afraid there is no way we can auto-detect this from the =
driver.
> > > > >
> > > > > Sorry, I referring to the set of properties above. In particular,
> > > > > xylon,display-interface and xylon,display-colorspace, though I do=
n't
> > > > > know if the latter is talking in memory format or on the wire for=
mat.
> > > >
> > > > Both of these are about the wire format, which is also "hardcoded" =
at synthesis
> > > > time with no way to be detected afterwards, as far as I know. Memor=
y format is
> > > > described in the layer sub-nodes.
> > >
> > > You have to attach the controller to something at the other end of the
> > > wire. A panel is only going to support 1 or a few wire formats, so you
> > > do likely know because the panel knows. In the case that a panel
> > > supports multiple wire formats, we do have some standard properties
> > > there. See the LVDS panel binding.
> >
> > Looking at the LVDS panel binding, I see that the LVDS types that I have
> > described as lvds-4bits and lvds-3bits are called jeida-24 and jeida-18.
> >
> > Either way, the controller cannot be dynamically configured to use one =
or
> > another: it is configured to support one at synthesis time and this doe=
sn't
> > change.
>=20
> Understood, but I was assuming you need to know how it was configured
> for some reason?

Well, the information that is really useful for the driver is whether it's
configured as LVDS or something else. The detail of 3bit vs 4bit doesn't re=
ally
matter for Linux/DRM but I kept it to that precision to stick close to the
hardware description. But yeah, having a single "lvds" choice in the
display-interface property for these two cases would work too and I can do =
that
if you prefer.

> > I'm not sure exactly what you implied here. Even if we can retreive the
> > wire format from the lvds-panel's data-mapping property, I don't think =
it shall
> > describe what the display controller was configured to. This informatio=
n could
> > be used to make sure that both are compatible (in the driver), but that=
's about
> > it as far as I can see.
>=20
> It's not the kernel's job to validate the DT is correct. Someone could
> just as easily define a panel that doesn't match with the configured
> format as they could having lvds-?bits set incorrectly.

So this is a situation that we are supposed to allow?
I assumed it would be in everyone's best interest to detect that there is a
mismatch, but I don't have any strong opinion about that.

> So get the wire format from the panel driver (either implied or by DT
> property) and assume that matches the configuration of the controller.

To be honest, it feels a bit weird to depend on a panel being connected to =
know
what display interface the driver should register. It might work in practice
since these media bus formats are specific to LVDS, so it can be correctly
deduced, but I don't understand the advantage of doing that.

It will probably also require parsing the panel remote endpoint's dt props =
as
I don't think we can get the bus format information from DRM before having
registered an encoder/connector on the controller side (so that's a
chicken-and-egg problem).

More generally, I don't see the issue behind describing this in the control=
ler's
bindings: is it because of unwanted redundency or such?

> Though, I guess if the model is each end of the wire should advertise
> what it supports and the core picks the best format, then that only
> works if you advertise both formats. Or we could allow jeida-{24,18}
> property at both ends of the graph.

I don't think there is such negotiation currently implemented in DRM
(and many driver actually have a strong assumption that only one bus format
is provided).

If we want the DRM core to deal with that, we need drivers to report their =
bus
format abilities for each concerned encoder/connector. I'm not sure this co=
uld
be done in a generic way with a generic dt property since the of_graph to
encoder/connector association seems to be quite driver-specific anyway.
This would just be deporting a description of capabilities of the hardware =
=66rom
the driver to dt, with no particular gain as far as I can see.

But maybe I'm missing the bigger picture here and describing hardware
capabilities in device-tree is something we want to go towards. I must admit
that I find the boundary quite blurry.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl3VbbwACgkQ3cLmz3+f
v9HE5Af+NjaJizxPkgLR7nGRCau5YpFK4UQrReXr0C3+W39U8TozvwO48gHl2s6c
+YzmFrzjmlHGCovaD+3+Dos3fhYmcmJ78+RikCHwe5Vo7k1oPNxSJQAFtouw/GeR
xhcovRaufy1OTRz7/lJBKYIYc+uKCMxxeQwY28tH058qNg13Go9SG1cZoi1NmSAK
hn2WC/l3ndDbjwGNOgVVCa1BuiGyHBQFGBUXjnqbhiLdwZGF2PmiQAO1sNPav00x
qMrfO2P2h1iSLaqSk1wXWYXyxu+vzW4sRNeN046xplA62XIKusS9FQ3oxDFr4/9D
63OeDPwHSP4IGizIwOlt8Oih8U+2zw==
=9mgd
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--

--===============0145462994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0145462994==--
