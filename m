Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3234A103DB5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 15:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9506EA6A;
	Wed, 20 Nov 2019 14:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 88688 seconds by postgrey-1.36 at gabe;
 Wed, 20 Nov 2019 14:50:02 UTC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885446E607
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 14:50:02 +0000 (UTC)
X-Originating-IP: 90.76.211.102
Received: from aptenodytes (lfbn-1-2154-102.w90-76.abo.wanadoo.fr
 [90.76.211.102])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 41C8540005;
 Wed, 20 Nov 2019 14:49:58 +0000 (UTC)
Date: Wed, 20 Nov 2019 15:49:57 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add xylon logicvc bindings
 documentation
Message-ID: <20191120144957.GA167553@aptenodytes>
References: <20190910153409.111901-1-paul.kocialkowski@bootlin.com>
 <20190910153409.111901-2-paul.kocialkowski@bootlin.com>
 <20190913143510.GA9504@bogus> <20190913155815.GA1554@aptenodytes>
 <CAL_Jsq+dzT1xrfBy2QQHLx9MUNukWWq5eXyOecVV8h0z5ziC8g@mail.gmail.com>
 <20190923153311.GE57525@aptenodytes>
 <CAL_JsqJLfAb0xhmBoX+GUcv5wsuHBOs8wZ=Hkw3x03kfsPgOqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJLfAb0xhmBoX+GUcv5wsuHBOs8wZ=Hkw3x03kfsPgOqg@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1989752019=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1989752019==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Circling back to this thread now, sorry for the delay.

On Tue 24 Sep 19, 09:58, Rob Herring wrote:
> On Mon, Sep 23, 2019 at 10:33 AM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > Hi,
> >
> > On Fri 13 Sep 19, 20:16, Rob Herring wrote:
> > > On Fri, Sep 13, 2019 at 4:58 PM Paul Kocialkowski
> > > <paul.kocialkowski@bootlin.com> wrote:
> > > >
> > > > Hi Rob and thanks for the review!
> > > >
> > > > On Fri 13 Sep 19, 15:35, Rob Herring wrote:
> > > > > On Tue, Sep 10, 2019 at 05:34:08PM +0200, Paul Kocialkowski wrote:
> > > > > > The Xylon LogiCVC is a display controller implemented as progra=
mmable
> > > > > > logic in Xilinx FPGAs.
> > > > > >
> > > > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > > ---
> > > > > >  .../bindings/display/xylon,logicvc.txt        | 188 ++++++++++=
++++++++
> > > > > >  1 file changed, 188 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/display/x=
ylon,logicvc.txt
> > > > >
> > > > > Consider converting this to DT schema format. See
> > > > > Documentation/devicetree/writing-schema.rst (.md in 5.3).
> > > >
> > > > Oh right, that would certainly be much more future-proof!
> > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/xylon,lo=
gicvc.txt b/Documentation/devicetree/bindings/display/xylon,logicvc.txt
> > > > > > new file mode 100644
> > > > > > index 000000000000..eb4b1553888a
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/display/xylon,logicvc.t=
xt
> > > > > > @@ -0,0 +1,188 @@
> > > > > > +Xylon LogiCVC display controller
> > > > > > +
> > > > > > +The Xylon LogiCVC is a display controller that supports multip=
le layers.
> > > > > > +It is usually implemented as programmable logic and was optimi=
zed for use
> > > > > > +with Xilinx Zynq-7000 SoCs and Xilinx FPGAs.
> > > > > > +
> > > > > > +Because the controller is intended for use in a FPGA, most of =
the configuration
> > > > > > +of the controller takes place at logic configuration bitstream=
 synthesis time.
> > > > > > +As a result, many of the device-tree bindings are meant to ref=
lect the
> > > > > > +synthesis configuration. These do not allow configuring the co=
ntroller
> > > > > > +differently than synthesis configuration.
> > > > > > +
> > > > > > +Layers are declared in the "layers" sub-node and have dedicate=
d configuration.
> > > > > > +In version 3 of the controller, each layer has fixed memory of=
fset and address
> > > > > > +starting from the video memory base address for its framebuffe=
r. With version 4,
> > > > > > +framebuffers are configured with a direct memory address inste=
ad.
> > > > > > +
> > > > > > +Matching synthesis parameters are provided when applicable.
> > > > > > +
> > > > > > +Required properties:
> > > > > > +- compatible: Should be one of:
> > > > > > +  "xylon,logicvc-3.02.a-display"
> > > > > > +  "xylon,logicvc-4.01.a-display"
> > > > > > +- reg: Physical base address and size for the controller regis=
ters.
> > > > > > +- clocks: List of phandle and clock-specifier pairs, one for e=
ach entry
> > > > > > +  in 'clock-names'
> > > > > > +- clock-names: List of clock names that should at least contai=
n:
> > > > > > +  - "vclk": The VCLK video clock input.
> > > > > > +- interrupts: The interrupt to use for VBLANK signaling.
> > > > > > +- xylon,display-interface: Display interface in use, should be=
 one of:
> > > > > > +  - "lvds-4bits": 4-bit LVDS interface (C_DISPLAY_INTERFACE =
=3D=3D 4).
> > > > > > +- xylon,display-colorspace: Display output colorspace in use, =
should be one of:
> > > > > > +  - "rgb": RGB colorspace (C_DISPLAY_COLOR_SPACE =3D=3D 0).
> > > > > > +- xylon,display-depth: Display output depth in use (C_PIXEL_DA=
TA_WIDTH).
> > > > > > +- xylon,row-stride: Fixed number of pixels in a framebuffer ro=
w (C_ROW_STRIDE).
> > > > > > +- xylon,layers-count: The number of available layers (C_NUM_OF=
_LAYERS).
> > > > >
> > > > > Presumably some of this is determined by the display attached. Is=
n't it
> > > > > safe to assume the IP was configured correctly for the intended d=
isplay
> > > > > and you can just get this from the panel?
> > > >
> > > > Layers are what corresponds to DRM planes, which are not actually i=
ndicated
> > > > by the panel but are a charasteristic of the display controller. In=
 our case,
> > > > this is directly selected at bitstream synthesis time for the contr=
oller.
> > > >
> > > > So I'm afraid there is no way we can auto-detect this from the driv=
er.
> > >
> > > Sorry, I referring to the set of properties above. In particular,
> > > xylon,display-interface and xylon,display-colorspace, though I don't
> > > know if the latter is talking in memory format or on the wire format.
> >
> > Both of these are about the wire format, which is also "hardcoded" at s=
ynthesis
> > time with no way to be detected afterwards, as far as I know. Memory fo=
rmat is
> > described in the layer sub-nodes.
>=20
> You have to attach the controller to something at the other end of the
> wire. A panel is only going to support 1 or a few wire formats, so you
> do likely know because the panel knows. In the case that a panel
> supports multiple wire formats, we do have some standard properties
> there. See the LVDS panel binding.

Looking at the LVDS panel binding, I see that the LVDS types that I have
described as lvds-4bits and lvds-3bits are called jeida-24 and jeida-18.

Either way, the controller cannot be dynamically configured to use one or
another: it is configured to support one at synthesis time and this doesn't
change.

I'm not sure exactly what you implied here. Even if we can retreive the
wire format from the lvds-panel's data-mapping property, I don't think it s=
hall
describe what the display controller was configured to. This information co=
uld
be used to make sure that both are compatible (in the driver), but that's a=
bout
it as far as I can see.

> >
> > > Actually for xylon,layers-count, You should just count the child nodes
> > > of 'layers'.
> >
> > Oh that's a good point, thanks!
> >
> > > > > > +Optional properties:
> > > > > > +- memory-region: phandle to a node describing memory, as speci=
fied in:
> > > > > > +  Documentation/devicetree/bindings/reserved-memory/reserved-m=
emory.txt
> > > > > > +- clock-names: List of clock names that can optionally contain:
> > > > > > +  - "vclk2": The VCLK2 doubled-rate video clock input.
> > > > > > +  - "lvdsclk": The LVDS clock.
> > > > > > +  - "lvdsclkn": The LVDS clock inverted.
> > > > >
> > > > > How are these really optional?
> > > >
> > > > Well, the controller currently only supports LVDS, but more interfa=
ces may be
> > > > added later, so the lvdsclk clock will be optional when another int=
erface
> > > > is used instead. Maybe I'm mistaken about how to categorize them th=
ough.
> > > >
> > > > My understanding is that the need for vclk2 and lvdsclkn depend on =
the target
> > > > FPGA family. I've developped the driver without the need for them, =
but the
> > > > datasheet states that they may be needed (but doesn't provide signi=
ficant
> > > > details about their role though).
> > >
> > > Not sure what to tell you then. You'll see it becomes a bit messy to
> > > describe in schema. Ideally we define the exact number, order, and
> > > values possible (or sets of those).
> >
> > I'll try to do my best.
> >
> > > > > > +- xylon,syscon: Syscon phandle representing the logicvc instan=
ce.
> > > > > > +- xylon,dithering: Dithering module is enabled (C_XCOLOR).
> > > > > > +- xylon,background-layer: The last layer is used to display a =
black background
> > > > > > +  (C_USE_BACKGROUND). It must still be registered.
> > > > > > +- xylon,layers-configurable: Configuration of layers' size, po=
sition and offset
> > > > > > +  is enabled (C_USE_SIZE_POSITION).
> > > > >
> > > > > I would think this will effectively have to be enabled to make th=
is
> > > > > usable with DRM. I'm not sure if a "standard" userspace would use=
 any of
> > > > > the layers if all this is fixed.
> > > >
> > > > I was going with the same assumption, but drm_atomic_helper_check_p=
lane_state
> > > > has a can_position parameter, which will check that the plane cover=
s the
> > > > whole CRTC if set to false. So I guess it is somewhat expected that=
 this can
> > > > be the case and some drivers (e.g. arm/hdlcd_crtc.c) also set this =
to false.
> > >
> > > Certainly atomic can fail on anything not supported. My question is
> > > more whether userspace has some minimum requirements. A cursor
> > > couldn't deal with can_position=3Dfalse for example.
> >
> > Right, so I suppose that using an overlay plane as cursor wouldn't work
> > in this situation. Well, I haven't found any formal definition of what =
minimal
> > requirements are expected from overlay planes. I would expect userspace=
 that
> > tries to use an overlay plane as a cursor to have a software fallback a=
s soon
> > as something goes wrong. My feeling is that overlay planes are provided=
 on a
> > "best-effort" basis, though contradiction is welcome here.
>=20
> For sure, there's always a software fallback. While we shouldn't let a
> specific OS's requirements dictate DT bindings, I just wonder if some
> of the configuration ends up always having to be set a certain way.
> Clearly, you could be writing the whole software stack and do a fixed
> configuration, but would you still be using DT at that point?

=46rom my understanding, all the possible combinations make sense here.
The ability to position layers is of course quite welcome for a generic
use case, but it certainly makes sense to reduce the controller's gate coun=
t by
removing the feature if the final use case doesn't need it. So I don't think
some of these properties end having to be set in a specific way to make sen=
se.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl3VUpUACgkQ3cLmz3+f
v9H+PggAh21Ub4YH9twTROpVaY52bId6HiUHJMZL4Q8aC8fCaRoXkpQsWjxoIEZt
6S480LFhx7wSIFZVGa9mjQ+yNW99fykvqjjiuhfxpcVoB2ihN5AbnPwy/jTRZotc
8EQ6sHJXeg6HosIlf6B8AF1EwtbVVX9YAy8X82NOyNICQ5rkjUEgCvtoxDbwU9zv
/azmMNqhGlwvi+UJKORlBRNG4o5AdW98iH9WSDl/pdAvu6Zrpp4D+gLclhdPLa0K
piHnswOW+IWhbzgLsQ+TyT3oOIFZudp4lAu4FEE1410ASpyXeBNi0d/Dx6Rdx9WB
dWW2kwmhKx/K+ce2yO4eg14qDEWOvA==
=oNgS
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

--===============1989752019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1989752019==--
