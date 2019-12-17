Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D3123A47
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 23:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6BB6E194;
	Tue, 17 Dec 2019 22:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C075F6E194
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 22:53:29 +0000 (UTC)
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ihLiZ-0001PQ-VJ; Tue, 17 Dec 2019 23:53:27 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: Add binding document
 for Xinpeng XPP055C272
Date: Tue, 17 Dec 2019 23:53:27 +0100
Message-ID: <2955240.JQMRd6mdPG@diego>
In-Reply-To: <20191217160122.psxwdd6accn7soed@gilmour.lan>
References: <20191217140703.23867-1-heiko@sntech.de>
 <1823876.MjdJyG0ANN@diego> <20191217160122.psxwdd6accn7soed@gilmour.lan>
MIME-Version: 1.0
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Am Dienstag, 17. Dezember 2019, 17:01:22 CET schrieb Maxime Ripard:
> On Tue, Dec 17, 2019 at 04:08:49PM +0100, Heiko St=FCbner wrote:
> > Am Dienstag, 17. Dezember 2019, 15:24:46 CET schrieb Maxime Ripard:
> > > Hi,
> > >
> > > On Tue, Dec 17, 2019 at 03:07:02PM +0100, Heiko Stuebner wrote:
> > > > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > > >
> > > > The XPP055C272 is a 5.5" 720x1280 DSI display.
> > > >
> > > > changes in v2:
> > > > - add size info into binding title (Sam)
> > > > - add more required properties (Sam)
> > > >
> > > > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > > ---
> > > >  .../display/panel/xinpeng,xpp055c272.yaml     | 48 +++++++++++++++=
++++
> > > >  1 file changed, 48 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/panel=
/xinpeng,xpp055c272.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/xinpen=
g,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng=
,xpp055c272.yaml
> > > > new file mode 100644
> > > > index 000000000000..2d0fc97d735c
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp05=
5c272.yaml
> > > > @@ -0,0 +1,48 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.ya=
ml#
> > >
> > > The ID doesn't match the file name.
> > >
> > > Did you run dt_bindings_check?
> >
> > Thanks for that pointer ... I did run dtbs_check on the binding and was
> > sooo happy to not find any panel errors in the pages of other dt errors
> > but till now didn't realize that there's also a dtbinding_check.
> =

> dt_bindings_check is a sanity check on the bindings
> themselves. dtbs_check is using those bindings to check the device
> trees.
> =

> dtbs_check used to have a dependency on dt_bindings_check, but it got
> removed recently.
> =

> Maxime
> =

> >
> > Will keep that in mind for future bindings  - and of course fix things
> > in the next version.
> >
> >
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Xinpeng XPP055C272 5.5in 720x1280 DSI panel
> > > > +
> > > > +maintainers:
> > > > +  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > > > +
> > > > +allOf:
> > > > +  - $ref: panel-common.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: xinpeng,xpp055c272
> > > > +  reg: true
> > > > +  backlight: true
> > > > +  port: true
> > >
> > > What is the port supposed to be doing?
> >
> > Hooking the display up to the dsi controller. But you're right,
> > works without port as well with these single-dsi displays.
> >
> > I just remember needing one for the Gru-Scarlet display that needed
> > to connect to two dsi controllers.
> >
> > So I'll drop the port node here and from my board devicetree.
> =

> It's not really what I meant though :)
> =

> If it's needed then we should definitely have it, but we should
> document our expectations here: is it the input port ? output? in
> which case do we want to use it since it's optional, etc.

The port was actually unnecessary. As far as I understand dsi stuff,
the common case is the panel as subnode of the dsi controller and
the controller then finding the display itself automatically.

If you look at
	"drm/bridge/synopsys: dsi: use mipi_dsi_device to find panel or bridge" [0]
I just sent, you'll see that the dw-mipi-dsi used drm_of_find_panel_or_brid=
ge
to find its panel/bridge thus requiring port connections in all cases where
it had the dsi-device available already, so wouldn't need to use ports for =
it.

Or I'm completely wrong and port usage is better, we'll see :-D


Heiko


[0] https://patchwork.freedesktop.org/patch/345666/


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
