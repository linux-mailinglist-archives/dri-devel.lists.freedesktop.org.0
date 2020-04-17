Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A01AE443
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 20:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762AA6E409;
	Fri, 17 Apr 2020 18:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57896E3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 18:08:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99AF997D;
 Fri, 17 Apr 2020 20:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587146911;
 bh=ASCFaq4pCdIrf/Z9JD2dXcmN0chmxScgYusVvp/MvUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FUOUHmj2A6Wka2I40yjAK3OH6vFqnQfO//6m/DRmrs77J7nNDG5gQVwLZ3+U2wx62
 8mFXPxU/JVFLTKAADh8cI7PXJPKGSmDHBnnkinnF5T5MZGihhrF0Z27A1QIq5wmcTw
 wy3mffT1Loo1wcU9WLEFIbSUA6kM9BRMlk27Yrvk=
Date: Fri, 17 Apr 2020 21:08:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios
 to the bindings
Message-ID: <20200417180819.GE5861@pendragon.ideasonboard.com>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
 <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com>
 <20200415203256.GP4758@pendragon.ideasonboard.com>
 <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
 <20200416005409.GR4758@pendragon.ideasonboard.com>
 <CAD=FV=WWZ1txHYOQZuCASbspLUP-Ds6OtrzetbJLHySpUyW6YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WWZ1txHYOQZuCASbspLUP-Ds6OtrzetbJLHySpUyW6YQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Thu, Apr 16, 2020 at 02:53:18PM -0700, Doug Anderson wrote:
> On Wed, Apr 15, 2020 at 5:54 PM Laurent Pinchart wrote:
> > On Wed, Apr 15, 2020 at 04:49:00PM -0700, Doug Anderson wrote:
> > > On Wed, Apr 15, 2020 at 1:33 PM Laurent Pinchart wrote:
> > > > On Wed, Apr 15, 2020 at 12:53:02PM -0700, Stephen Boyd wrote:
> > > > > Quoting Douglas Anderson (2020-04-15 08:48:40)
> > > > > > Allow people to specify to use a GPIO for hot-plug-detect.  Add an
> > > > > > example.
> > > > > >
> > > > > > NOTE: The current patch adding support for hpd-gpios to the Linux
> > > > > > driver for hpd-gpios only adds enough support to the driver so that
> > > > > > the bridge can use one of its own GPIOs.  The bindings, however, are
> > > > > > written generically.
> > > > > >
> > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > ---
> > > > > >
> > > > > >  .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
> > > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > > > > index 8cacc6db33a9..554bfd003000 100644
> > > > > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > > > > @@ -60,6 +60,10 @@ properties:
> > > > > >      const: 1
> > > > > >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> > > > > >
> > > > > > +  hpd-gpios:
> > > > > > +    maxItems: 1
> > > > > > +    description: If present use the given GPIO for hot-plug-detect.
> > > > >
> > > > > Shouldn't this go in the panel node? And the panel driver should get the
> > > > > gpio and poll it after powering up the panel? Presumably that's why we
> > > > > have the no-hpd property in the simple panel binding vs. putting it here
> > > > > in the bridge.
> > > >
> > > > Same question really, I think this belongs to the panel (or connector)
> > > > node indeed.
> > >
> > > Hrm.
> > >
> > > To me "no-hpd" feels OK in the panel because the lack of a connection
> > > is somewhat symmetric.  Thus it's OK to say either "HPD isn't hooked
> > > up to the panel in this system" or "HPD isn't hooked up to the bridge
> > > in this system" and both express the same thing (AKA that there is no
> > > HPD connection between the bridge and the panel).  In the case of
> > > "no-hpd" it's more convenient to express it on the panel side because
> > > the panel driver is the one whose behavior has to change if HPD isn't
> > > hooked up.  The panel datasheet is the one that says how long of a
> > > delay we need if HPD isn't hooked up.
> > >
> > > ...but when you're talking about where the bridge driver should look
> > > to find the HPD signal that it needs, that really feels like it should
> > > be described as part of the bridge.  Specifically imagine we were
> > > using our bridge for DP, not for eDP.  In that case simple-panel
> > > wouldn't be involved because we could get any type of display plugged
> > > in.  Thus it couldn't go in the panel node.  Here it feels clearer
> > > that hpd-gpio needs to be a property of the bridge driver.
> >
> > If you were using it for DP, you would need a DT node for the DP
> > connector (with bindings to be added to
> > Documentation/devicetree/bindings/display/connector/, similar to the
> > ones we already have for other connectors). That DT node should
> > reference the HPD pin GPIO. The bridge driver for the connector
> > (drivers/gpu/drm/bridge/display-connector.c) would then handle HPD. The
> > good news is that it already does :-)

That's a long e-mail. Taking a deep breath :-)

> I'm having a really hard time following, but maybe it's because my
> knowledge of the DRM terminology is feeble at best?
> 
> Looking at it from a DRM driver perspective and thus looking in
> 'drm/bridge/ti-sn65dsi86.c' I see that the driver for this bridge chip
> effectively is both the bridge and the connector.  The struct
> encapsulating the driver data has both:
> 
>   struct drm_bridge bridge;
>   struct drm_connector connector;
> 
> ...in ti_sn_bridge_attach() the code calls drm_connector_init() for
> the connector.

That is correct, and that's the old mode. With the new model (based on
the DRM_BRIDGE_ATTACH_NO_CONNECTOR flags and the drm_bridge_funcs
.get_modes(), .get_edid(), .detect(), .hpd_enable() and .hpd_disabled()
operations), the ti-sn65dsi86 will not create a drm_connector anymore.
The two modes of operation will be temporarily supported to all display
controller drivers to be migrated one by one to the new model. Once the
conversion of all display controller drivers that use the ti-sn65dsi86
will be complete, creation of a drm_connector will be removed completely
from the ti-sn65dsi86 driver.

> Looking at it from a device tree point of view, there is no separate
> node representing an eDP connector for one mainline user of
> 'ti,sn65dsi86' (sdm845-cheza).  The device tree node has one input
> port (from "dsi0_out") and one output port (to "panel_in_edp").  There
> is no separate connector node as I can see with "hdmi-connector".
> ...and, as far as I can tell, sdm845-cheza is using the bindings as
> documented.  The bindings say that the 'ti,sn65dsi86' node needs two
> ports:
> - Video port 0 for DSI input
> - Video port 1 for eDP output

You are right here. The confusing part is the word "connector".
Historically, a DRM connector models a physical connector (VGA, HDMI,
...). The concept was extended over time with more connector types,
including connectors for display panels (LVDS, DSI, eDP, ...) that are
integrated in the system and can't be hotplugged, unlike the user-facing
VGA or HDMI connectors. A DRM connector thus represents the sink at the
output of a display pipeline.

When dealing with external monitors, they can't be represented in the
device tree (or any other firmware) as they're hot-pluggable. Panels,
however, are different, as they're part of the system, and are thus
described in the firmware (DT in this case). Technically speaking,
there's a physical connector for the panel, but it's irrelevant for the
user, and the end of the display pipeline in the system isn't the
connector, but the panel. For this reason, when dealing with panel,
there's no DT node to represent the connector.

The drm_connector object abstracts either a physical user-facing
connector or a panel, and contains properties that are applicable to
either the panel or the external monitor (such as the format of the
data, the connection type, the physical size of the display, ...). It is
part of the API exposed to userspace.

Inside the kernel, when the need for panel-specific code arose, the
drm_panel object was created. It represents a panel, has properties and
methods specific to panels, and is not exposed to userspace.

> So, though I'm probably terribly confused, I would tentatively say that:
> 
> - I'd guess that the 'ti,sn65dsi86' bindings were written / approved
> back before people were encouraged to model the connector as a
> separate node.

Not exactly. The physical connector should only be modelled as a
separate node when the connector is the output of the display pipeline
for the system. As explained above, when the output of the display
pipeline is a panel, there's no need for a connector DT node.

> - In the case of 'ti,sn65dsi86' the current dts node is both the node
> for the bridge and the connector.

This one is a bit tricky :-) The DT node for the ti,sn65dsi86 represents
the bridge only (it is linked in DT to a separate node for the panel).
The corresponding driver instantiates a drm_bridge and a drm_connector,
and delegates the drm_connector operations to the drm_panel object that
handles the connected panel. This is the model that we're replacing, as
the ti-sn65dsi86 driver should focus on the SN65DSI86 chip only, and
shouldn't handle the connected panel. For all we know, it could be
connected to an eDP to HDMI bridge, itself connected to an HDMI
connector. We now want bridge drivers to focus only on the device they
correspond to.

> - If we want to try to deprecate the way that 'ti,sn65dsi86' works it
> feels like a big-ish effort.  This would include adding a new "eDP"
> connector class and trying to figure out how to deal with backward
> compatibility for old dts files (assuming folks care).

As I explained above (hopefully in a not too confusing way), no change
is required in DT. On the kernel side, the ti-sn65dsi86 should stop
creating a connector. The next component in the pipeline, in your case a
panel, should be handled by a driver of its own, and in this case this
is already possible with the help of drm_panel_bridge_add() (and related
functions) that will wrap the drm_panel in a drm_bridge. This currently
needs to be done by the ti-sn65dsi86 driver, but once all users of
panels will use drm_panel_bridge_add(), I plan to make this handled by
the DRM panel core, transparently for bridge drivers.

For the case where a physical DP connector is present at the end of the
pipeline, connected to an external DP monitor, there shall be a DT node
for the DP connector (we have DT bindings for several connector types,
creating bindings for DP connectors should be straightforward). The
bridge/display-connector.c driver shall be extended to support the new
compatible string, and I expect it won't take much more than

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 4d278573cdb9..27185f324b2d 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -63,10 +63,11 @@ display_connector_detect(struct drm_bridge *bridge)

 	case DRM_MODE_CONNECTOR_Composite:
 	case DRM_MODE_CONNECTOR_SVIDEO:
+	case DRM_MODE_CONNECTOR_DisplayPort:
 	case DRM_MODE_CONNECTOR_VGA:
 	default:
 		/*
-		 * Composite and S-Video connectors have no other detection
+		 * Composite, S-Video and DP connectors have no other detection
 		 * mean than the HPD GPIO. For VGA connectors, even if we have
 		 * an I2C bus, we can't assume that the cable is disconnected
 		 * if drm_probe_ddc fails, as some cables don't wire the DDC
@@ -172,11 +173,12 @@ static int display_connector_probe(struct platform_device *pdev)
 	of_property_read_string(pdev->dev.of_node, "label", &label);

 	/*
-	 * Get the HPD GPIO for DVI and HDMI connectors. If the GPIO can provide
-	 * edge interrupts, register an interrupt handler.
+	 * Get the HPD GPIO for DVI, HDMI and DP connectors. If the GPIO can
+	 * provide edge interrupts, register an interrupt handler.
 	 */
 	if (type == DRM_MODE_CONNECTOR_DVII ||
-	    type == DRM_MODE_CONNECTOR_HDMIA) {
+	    type == DRM_MODE_CONNECTOR_HDMIA ||
+	    type == DRM_MODE_CONNECTOR_DisplayPort) {
 		conn->hpd_gpio = devm_gpiod_get_optional(&pdev->dev, "hpd",
 							 GPIOD_IN);
 		if (IS_ERR(conn->hpd_gpio)) {
@@ -263,6 +265,9 @@ static const struct of_device_id display_connector_match[] = {
 	{
 		.compatible = "composite-video-connector",
 		.data = (void *)DRM_MODE_CONNECTOR_Composite,
+	}, {
+		.compatible = "dp-connector",
+		.data = (void *)DRM_MODE_CONNECTOR_DisplayPort,
 	}, {
 		.compatible = "dvi-connector",
 		.data = (void *)DRM_MODE_CONNECTOR_DVII,

With this, the display-connector driver will create a drm_bridge
instance for the DP connector. The ti-sn65dsi86 will thus always be
followed by a bridge, either a bridge wrapping a drm_panel, or a bridge
for the connector.

Once all pipelines are fully made of bridges until the last component,
the drm_connector shall be created by the display controller driver,
which shall pass the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to the bridges
to prevent them from creating a drm_connector themselves. The
drm_connector created by the display controller driver will need to
implement operations such as .get_modes(), which will be delegated to
the appropriate bridge in the chain. The drm_bridge_connector_init()
helper automates this, making it straightforward for the display
controller driver to create such a drm_connector. As explained in the
helper's documentation,

 * To use the helper, display controller drivers create a bridge connector with
 * a call to drm_bridge_connector_init(). This associates the newly created
 * connector with the chain of bridges passed to the function and registers it
 * with the DRM device. At that point the connector becomes fully usable, no
 * further operation is needed.

> Did I get that right?  If so, maybe my "hpd-gpios" is already part of
> the "connector" node?

You got it mostly right :-)

As for the hpd-gpios, it should be specified in the DT node of the
component that provides the HPD signal, and contain a GPIO specifier
describing what the signal is connected to. When dealing with a physical
DP connector and external monitor, the HPD signal is provided by the DP
connector, the hpd-gpios property shall then be specified in the DP
connector DT node. The display-connector driver already handles that
property. When dealing with an eDP panel, the HPD signal is provided by
the panel, the hpd-gpios property shall be specified in the panel DT
node.

> > > Looking at other usages of "hpd-gpio" in the kernel, it seems like the
> > > usage I'm proposing is also common.  Grepping for "hpd-gpios" shows
> > > numerous examples of "hpd-gpios" being defined at the display
> > > controller level and (effectively) I believe the bridge is at the
> > > equivalent level.
> >
> > Bridge drivers should only implement support for features available from
> > the corresponding hardware. If an HPD signal is connected to a dedicated
> > pin of the bridge, and the bridge can generate an interrupt and expose
> > the HPD status through I2C, then it should implement HPD-related
> > operations. If the HPD pin from the connector is hooked up to a GPIO of
> > the SoC, it should be handled by the connector bridge driver.
> 
> So the case I'm trying to deal with is a little odd.  I tried to spell
> it all out in patch #3 [1] but to talk about it here too:
> 
> 1. The 'ti,sn65dsi86' does have a hardware HPD pin.  That pin can
> generate an interrupt.

As the SN65DSI86 has native HPD detect capability with a dedicated HPD
input (note that this doesn't make the SN65DSI86 a providder of the HPD
signal in the sense described above), the bridge driver, in the new
model, shall implement the HPD-related operations and the .detect()
operation. The drm_bridge_connector_init() helper will then delegate HPD
and detection to the ti-sn65dsi86 driver.

This assumes that the HPD signal is routed to the SN65DSI86. That's not
always the case, see below for an explanation of how to handle that.

> 2. For reasons described in patch #3 (and the other commit it
> references, c2bfc223882d), the hardware HPD pin on 'ti,sn65dsi86' is
> nearly useless for eDP.  Specifically, eDP panels are usually
> (always?) not removable and thus HPD isn't a signal that needs
> debouncing.  ...yet the signal is debounced in hardware on
> 'ti,sn65dsi86' and that means a delay of 100 - 200ms before you can
> see the true value of HPD.  That's an extra 100 - 200ms before the
> panel can turn on.
> 
> 3. Even if eDP panels aren't actually hot plugged, HPD is still a
> useful concept for eDP.  It can be used to avoid hardcoded delays
> since panels use it to signal when they're ready.  ...but if HPD is
> debounced that doesn't work so well.
> 
> 4. 'ti,sn65dsi86' has some pins that can be used as GPIOs.  These are
> ideal places to route HPD since they are not debounced and pretty much
> a perfect fit for this signal (don't waste SoC GPIOs, routing signals
> on your board is easier, pins are powered exactly when you need them).

The new drm_bridge model has support for this use case. It makes a
difference between the intrinsic capability of a device to provide a
feature (for instance the SN65DSI86 has the intrinsic capability to
provide the HPD feature), and the fact that the feature is actually
provided by that device on a particular system (in the case you describe
here, the SN65DSI86 intrinsic HPD capability isn't used, as the HPD
signal isn't connect to the SN65DSI86 HPD input). The former is reported
by implementing the corresponding drm_bridge_funcs operations, the
latter is reported by setting DRM_BRIGE_OP_* flags in drm_bridge.ops.
This mechanism allows bridge drivers to unconditionally set function
pointers in their drm_bridge_funcs structure (allowing the structure to
make stored in read-only memory), while exposing, for each device
instance, whether the feature is actually provided or not.

The drm_bridge_connector_init() helper, to delegate drm_connector
operations to bridges, will look for the first bridge in the chain,
starting at the output of the pipeline (connector or panel), that
supports the corresponding feature. If your DP connector DT node, or
your eDP connector DT node, specifies that the HPD signal is routed to a
GPIO (through the hpd-gpios property), then the corresponding bridge
driver shall reprot the DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_HPD
capabilities. The display-connector driver already supports this, the
panel bridge driver doesn't and needs to be extended. The
drm_bridge_connector_init() helper will then detect that the drm_bridge
for the DP connector or eDP panel supports HPD, and will delegate the
related drm_connector operations to that bridge. If the HPD signal is
routed to the HPD pin of the SN65DSI86, the DP connector or eDP panel DT
node should not contain an hpd-gpios property, the corresponding
drm_bridge will not set DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_HPD, and
the drm_bridge_connector_init() will look at the next component in the
next bridge in the chain, which will be the ti-sn65dsi86. That bridge
will report support for the HPD-related operations, and will be used.

To be fully correct the ti-sn65dsi86 shouldn't set the
DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_HPD flags when the HPD signal
isn't routed to its HPD input pin. As it should not peek into the DT
node of the DP connector or eDP panel for its output, it should have an
additional no-hpd DT property in this case. In practice that's may not
always be required, as if an hpd-gpios property is specified in the DP
connector or eDP panel DT node, the drm_bridge_connector_init() will not
look further, but for the case where the HPD signal isn't routed
anywhere, we need to make sure that the ti-sn65dsi86 driver will not
incorrectly advertise HPD support.

> 5. The GPIOs on 'ti,sn65dsi86' cannot generate IRQs and can only be
> polled.  ...but this is OK.  I'm specifically trying to support the
> case of a panel that is always connected and I just want HPD to be the
> signal that the panel is ready for me to talk to it.  Polling is fine.
> Specifically the bridge driver doesn't try to poll HPD to decide if we
> have something connected--it always returns
> 'connector_status_connected'.  ...and this is the correct behavior for
> eDP because you know the hardware is always there and HPD won't even
> be asserted until you start to power up the panel.

If you look at bridge/display-connector.c, you will see that it reports
DRM_BRIDGE_OP_DETECT if there's an hpd-gpios property, and additionally
reports DRM_BRIDGE_OP_HPD if that GPIO has interrupt capability. If a
bridge in the pipeline reports DRM_BRIDGE_OP_DETECT but no bridge
reports DRM_BRIDGE_OP_HPD, drm_bridge_connector_init() creates a
connector that uses polling. This is another reason why a no-hpd
property is needed for the ti,sn65dsi86, as otherwise the helper would
incorrectly consider that the SN65DSI86 will report HPD through an
interrupt.

> 6. My current implementation in patch #3 actually doesn't fully
> implement a Linux GPIO provider in the bridge driver.  See that patch
> for justification.  While I could do the work to do this and I'll do
> it if folks insist, I think the current simpler code is nice.  If
> there was a separate "edp-connector" driver then presumably I'd have
> to add the complexity of implementing the GPIO provider API.

This is the only reason why I don't like asking you to change your
implementation, due to the additional complexity required to expose a
GPIO provider. However, I think that the new bridge usage model is much
cleaner than the current one, and this justifies in my opinion
additional complexity in a small number of places, even if it's
unfortunate. That being said, if we can put the DT properties where they
belong for the new model with isolated bridge drivers to only handle the
features of the hardware they correspond to, I wouldn't be opposed to a
localized hack (without any derogatory meaning implied) on the driver
side to ease the implementation. I'm willing to look at you at how this
could be done, once we complete this discussion about the new model,
with the hard rule that DT bindings should be designed based on the new
model.

> I guess to summarize my understanding of all the above:
> 
> - I think designing and adding a separate 'edp-connector' driver and
> device tree node and migrating existing users over would be a big
> chunk of work and is out of scope for me.
> 
> - I'm hoping that the current approach is still OK.
> 
> - If people really like the edp-connector concept and want to try to
> adapt old code later there's nothing here that prevents it--it's just
> a bunch of extra code.
> 
> 
> [1] https://lore.kernel.org/r/20200415084758.3.Ia50267a5549392af8b37e67092ca653a59c95886@changeid

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
