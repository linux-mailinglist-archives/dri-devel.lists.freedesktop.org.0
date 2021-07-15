Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFF13C9C23
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 11:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F087089A83;
	Thu, 15 Jul 2021 09:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD7A89A83
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 09:50:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 918563200952;
 Thu, 15 Jul 2021 05:50:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 15 Jul 2021 05:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=YXGFB/y4986b9zrnJJbuoa9Q9vP
 oHSqEmc/uf6zd8Xg=; b=q8dhFPIQX84NyjJ0EKZjtUxqDtJEqydTk4ibbVFncca
 CXlUnv0ypSycre6b3HRK+VSAPah9TtV8oaRHkE02mjw0wNS3fJblciCdxMmlMFBN
 pwmoVyi52Bv1MWuyOFvYEcqZiLFNLhRpZkz6LUJU94TNfWDAdInBJoynOZh5QHjv
 XWHZbapmpEJEctHfwF9Mrh3N3cp5VSqeHtxlIJBY/hZSK0ZccHNn+r7BZaGrdYVl
 VvqMqQ0b3RGofugLcD0bxM547UQlQn6iCdiQ9ETjm4uvNo2u4ou0HdvtoeRnozCX
 oE0hGvIeecPJdvL8OIRxgwccvPZewCeWcbXF/C+4rWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YXGFB/
 y4986b9zrnJJbuoa9Q9vPoHSqEmc/uf6zd8Xg=; b=noibdgNNCSu8L2E3ChchCY
 ahvv4U4vlmb0B+4By2OGkkPORDdKIob1S64aRDgFqhv8O+HZZ3uYlLEKRq3tVHmL
 OBp1RDZp6A7CNP1nCpAHzlQwjRE0mlElislVbRWtrIDLcXo6zahZxY5dh8kdMQd1
 YDXa+QtdhBuT1Cp+kKcx+dfPgiQceIvnUuz3AUvOpvyLi2BjBdiigdcIe7Htau0g
 KeQ5rN7Esej+Cnez7Zr6gCx/xdli3c1ev/dkVtPSLKqPlYW3nfzQ2t6V8XxPGqfn
 VhyqDyMM9qEwEOkj1yW3Ol+vIDKAYhsSLYCHsgLPqi2r6h7DjL0i9oa6p8965jeQ
 ==
X-ME-Sender: <xms:4ATwYKhEFS3dmb-GcyVCkyFon2gAluNdZIopcH4dnCcWZcA9nCeUFA>
 <xme:4ATwYLBHk5Cdx4zcvco1vi3LqGXliUZsiaLUbEvxXRdgIjcKeMAVAcw7BqrzzEo43
 SpwvmaJqjBUiK591Gc>
X-ME-Received: <xmr:4ATwYCH-vY4DfXUWOb3FbQoTofoL5TcpjNquoytzVHG5jLtxdrSkPbJ0TEMzPs3-zLjvxRtFjv89gfcJup9I1fS4usCKHxYM54mC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeehteejgfefueegteevtdekteelvdeujeeigeffueefveejleffvdehhfejhfei
 geenucffohhmrghinhepshgvmhhitghonhdqshhtohhrrghgvgdrtghomhenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghh
X-ME-Proxy: <xmx:4ATwYDRGhqKtl6RMxR8ZWGafv89lFgi-3n9bFE8uwnBIU0mFb3WukQ>
 <xmx:4ATwYHxgcuJCXjoKYiGmIi3wMx_QXCv6TRlB9V1tfbJXpFwSmrciwQ>
 <xmx:4ATwYB4ZmShRQ7FyfLnjGLm-9WHJVvQfZ-kiXMbWltmnChK90P_0oA>
 <xmx:4QTwYH9EVHtW4XgUSD6lF7zHAirvUhYa8uLjJ7WCbMBS43qm_BXpMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jul 2021 05:50:24 -0400 (EDT)
Date: Thu, 15 Jul 2021 11:50:22 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: Questions over DSI within DRM.
Message-ID: <20210715095022.5plcocz6plxnb3xr@gilmour>
References: <CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com>
 <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
 <CAPY8ntDRKcq0V_q04q25_EemsBiT4xHKNv1260Fr8kKGtZDpxw@mail.gmail.com>
 <20210706151320.kwn4dwu6buvy4isa@gilmour>
 <CAPY8ntDPQg76JTgZ5iJG=m3sWjKMwi-vXUHyAPqS_HGFbGGkkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fouajuiw7nltbl6q"
Content-Disposition: inline
In-Reply-To: <CAPY8ntDPQg76JTgZ5iJG=m3sWjKMwi-vXUHyAPqS_HGFbGGkkA@mail.gmail.com>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fouajuiw7nltbl6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Jul 06, 2021 at 05:44:58PM +0100, Dave Stevenson wrote:
> On Tue, 6 Jul 2021 at 16:13, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On a similar theme, some devices want the clock lane in HS mode e=
arly
> > > > > so they can use it in place of an external oscillator, but the da=
ta
> > > > > lanes still in LP-11. There appears to be no way for the
> > > > > display/bridge to signal this requirement or it be achieved.
> > > >
> > > > You're right. A loooong time ago, the omapdrm driver had an internal
> > > > infrastructure that didn't use drm_bridge or drm_panel and instead
> > > > required omapdrm-specific drivers for those components. It used to =
model
> > > > the display pipeline in a different way than drm_bridge, with the s=
ync
> > > > explicitly setting the source state. A DSI sink could thus control =
its
> > > > enable sequence, interleaving programming of the sink with control =
of
> > > > the source.
> > > >
> > > > Migrating omapdrm to the drm_bridge model took a really large effor=
t,
> > > > which makes me believe that transitioning the whole subsystem to
> > > > sink-controlled sources would be close to impossible. We could add
> > > > DSI-specific operations, or add another enable bridge operation
> > > > (post_pre_enable ? :-D). Neither would scale, but it may be enough.
> > >
> > > I haven't thought it through for all generic cases, but I suspect it's
> > > more a pre_pre_enable that is needed to initialise the PHY etc,
> > > probably from source to sink.
> > > If the panel/bridge can set a flag that can be checked at this point
> > > for whether an early clock is required or not, I think that allows us
> > > to comply with the requirements for a large number of panels/bridges
> > > (LP-11 vs HS config for clock and or data lanes before pre_enable is
> > > called).
> > >
> > > pre_enable retains the current behaviour (initialise the chain from
> > > sink to source).
> > > enable then actually starts sending video and enabling outputs.
> >
> > Flags indeed seem like a more contained option. Another one could be to
> > have a mipi_dsi_host to (for example) power up the clock lane that would
> > be called by default before the bridge's enable, or at the downstream
> > bridge driver discretion before that.
>=20
> Which driver will that call?

The parent DSI Host

> An extreme example perhaps, but Toshiba make the TC358860 eDP to DSI
> bridge chip[1]. So the encoder will be eDP, but the DSI config needs
> to go to that bridge. Does that happen automatically within the
> framework? I guess so as the bridge will have called
> mipi_dsi_host_register for the DSI sink to attach to.

In that case, whatever sink would be connected to the bridge would call
the bridge clock enable hook if it needs it in its pre_enable, or it
would be called automatically before enable if it doesn't

Would that help?

> Perhaps a new mipi_dsi_host function to configure the PHY is the
> easier solution. If it can allow the sink to request whatever
> combination of states from clock and data lanes that it fancies, then
> it can be as explicit as required for the initialisation sequence, and
> the host driver does its best to comply with the requests.

I don't know, I'm not really fond in general of solutions that try to
cover any single case if we don't need it and / or have today an issue
with this. I'd rather have something that works for the particular
bridge we were discussing, see if it applies to other bridges and modify
it if it doesn't until it works for all our cases. Trying to reason in
all possible cases tend to lead to solutions that are difficult to
maintain and usually over-engineered.

> I'd have a slight query over when and how the host would drop to ULPS
> or power off. It probably shouldn't be in post_disable as the sink
> hasn't had a chance to finalise everything in its post_disable.
>
> Perhaps pm_runtime with autosuspend is the right call there?

pm_runtime semantics mean that once the device is suspended, its power
domains, regulators, clocks, etc. are all shut down, so it doesn't
really fit the low power state expected by DSI

> [1] https://toshiba.semicon-storage.com/ap-en/semiconductor/product/inter=
face-bridge-ics-for-mobile-peripheral-devices/display-interface-bridge-ics/=
detail.TC358860XBG.html
>=20
> > > When I discussed this briefly with Maxime there was a suggestion of
> > > using pm_runtime to be able to power up the pipeline as a whole. If
> > > the bridge driver can use pm_runtime to power up the PHY when
> > > required, then that may solve the issue, however I know too little of
> > > the details to say whether that is actually practical.
> >
> > I'm not sure it was about this topic in particular. If I remember well
> > our discussion, this was about the vc4 driver that tries to circumvent
> > the framework and call the pre_enable and enable hooks itself because it
> > wasn't properly powered before and thus any DCS-related call by the
> > downstream bridge or panel would end up creating a CPU stall.
> >
> > I suggested to use runtime_pm in the DCS related calls to make sure the
> > device is powered because there's no relation between the state of the
> > downstream bridge or panel and whether it can send DCS commands or not.
> > For all we know, it could do it at probe time.
>=20
> pm_runtime is all a bit of a magic black box to me.
>=20
> We had discussed shifting to using pm_runtime from DCS (and enable)
> calls to power up the PHY on demand, and that's what I implemented.
> However Laurent flagged up that using
> dsi->encoder->crtc->state->adjusted_mode to get the HS clock info
> required to send a HS DCS command from that call is deprecated, so how
> do we specify the clock rate to use at that point?

I guess the most sensible would be to have a custom bridge state, and
add a pointer to the current bridge state in struct drm_bridge. Then, as
long as you have a bridge pointer you have a way to get the current
state associated to it, and since we already have atomic_duplicate_state
/ atomic_destroy_state we can create our own structure around it storing
whatever we want.

> > > > > host_transfer calls can supposedly be made at any time, however u=
nless
> > > > > MIPI_DSI_MSG_USE_LPM is set in the message then we're meant to se=
nd it
> > > > > in high speed mode. If this is before a mode has been set, what
> > > > > defines the link frequency parameters at this point? Adopting a r=
andom
> > > > > default sounds like a good way to get undefined behaviour.
> > > > >
> > > > > DSI burst mode needs to set the DSI link frequency independently =
of
> > > > > the display mode. How is that meant to be configured? I would have
> > > > > expected it to come from DT due to link frequency often being cho=
sen
> > > > > based on EMC restrictions, but I don't see such a thing in any
> > > > > binding.
> > > >
> > > > Undefined too. DSI support was added to DRM without any design effo=
rt,
> > > > it's more a hack than a real solution. The issue with devices that =
can
> > > > be controlled over both DSI and I2C is completely unhandled. So far
> > > > nobody has really cared about implementing DSI right as far as I can
> > > > tell.
> > >
> > > :-(
> > >
> > > Thinking aloud, does having the option to set a burst link frequency
> > > from DT (or ACPI) have any issue for other platforms?
> > > Looking at the handling of MIPI_DSI_MODE_VIDEO_BURST in the various
> > > drivers, all except stm/dw_mipi_dsi-stm.c appear to take it as a "use
> > > all the defined timings, but drop to LP during blanking" option. The
> > > link frequency has therefore remained a property of the
> > > display/bridge.
> > > dw_mipi_dsi-stm.c cranks the PLL up by 20%, but I haven't followed
> > > through the full detail of the parameters it computes from there.
> >
> > I don't see anything wrong with using link-frequency from the DT to
> > setup the burst frequency. It's what v4l2 has been using for a while
> > without any known (to me) drawback, and we're using the same of-graph
> > bindings, so it shouldn't be too controversial there.
>=20
> OK, that sounds like a vague plan.
>=20
> > > DSI and I2C controlled devices is yet another issue that I haven't
> > > even looked at.
> > > I think it's more that vc4 wants to ignore DSI should the DSI host
> > > node be enabled in DT, but there's no panel bound to it. One could say
> > > that is a DT error and tough luck, but from a user's perspective that
> > > is a bit harsh.
> >
> > I guess the larger "issue" is that the tree in the DT is done following
> > the "control" bus, and Linux likes to tie the life cycle of a given
> > device to its parent bus. Both these decisions make sense, but they
> > interact in a weird way in some occurrences (like this one, or Allwinner
> > has an Ethernet PHY controlled through MMIO which end up in the same
> > case).
> >
> > I wonder if using device links here could help though.
>=20
> I really don't know about that one.

It's a piece of infrastructure that was created at first (I think?) to
model the power dependency between devices that don't have a parent /
child relationship. For example, if you use DMA, you probably want to
keep the IOMMU powered as long as you are, but it is in a completely
separate branch of the "device tree" (not one from the DTB, the one that
linux DM creates).

It was later expanded to also cover probe order and make sure a supplier
would probe before its consumer, effectively making EPROBE_DEFER
obsolete.

The second part is still fairly new, but I think we can solve this by
adding a device link between the DSI host and whatever is at the end of
the OF-Graph endpoint.

> > > > > As a follow on, bridge devices can support burst mode (eg TI's
> > > > > SN65DSI83 that's just been merged), so it needs to know the desir=
ed
> > > > > panel timings for the output side of the bridge, but the DSI link
> > > > > timings to set up the bridge's PLL. What's the correct way for
> > > > > signalling that? drm_crtc_state->adjusted_mode vs
> > > > > drm_crtc_state->mode? Except mode is userspace's request, not wha=
t has
> > > > > been validated/updated by the panel/bridge.
> > > >
> > > > adjusted_mode is also a bit of a hack, it solves very specific issu=
es,
> > > > and its design assumes a single encoder in the chain with no extra
> > > > bridges. We should instead add modes to the bridge state, and negot=
iate
> > > > modes along the pipeline the same way we negotiate formats.
> > >
> > > So as I understand it we already have format negotiation between
> > > bridges via atomic_get_output_bus_fmts and atomic_get_input_bus_fmts,
> > > so is it possible to extend that to modes?
> > > Are you thinking bridge state that is owned by the framework, or by
> > > the individual bridge drivers?
> >
> > atomic_check is made for that. I guess we could improve its call
> > sequence to each time a mode is modified along the bridge list we
> > restart the sequence until all components agree (or reject it entirely
> > if they can't), but I don't really see why we would need yet another
> > hook.
>=20
> Why do all nodes in the bridge list need to agree? Adjacent nodes need
> to agree, but they then also need to retain that agreed timing
> somewhere.

We might have mutually exclusive requirements though? Let's use the
example of the VC4 HDMI driver that can't have odd horizontal timings,
and assume it's a constraint of our DSI driver instead.

Then, we have a DSI->LVDS bridge, a LVDS->RGB bridge and a panel (which
is a bit ridiculous, but whatever). If the LVDS->RGB bridge can't have
even horizontal timings, then you just can't display it, even though
they are not adjacent (unless the bridge in the middle can modify the
timings between the input and output, but that's not always possible).

Similarly, if for the RGB panel we need to increase a bit some timings
to accommodate for a larger pixel clock and end up above what the DSI
host can provide, we're also done.

> Taking SN65DSI8[3|4|5] as an example, it supports burst mode, and the
> DSI frequency and timings are permitted to be different from that
> which it uses on the LVDS side. The LVDS panel and LVDS side of DSI83
> need to agree over the format, and the DSI host and DSI side of DSI83
> need to agree, but they may be two different timings.
> Register 0x0B (DSI_CLK_DIVIDER & REFCLK_MULTIPLIER) allows you to
> configure the LVDS rate compared to the DSI rate (the driver currently
> goes for 1:1), and registers 0x20 to 0x34 allow you to set the number
> of active pixel and blanking on the LVDS side (again currently just
> copied across).
>
> The way I'm seeing burst mode as having been interpreted at present is
> that it's largely just a flag to say "drop to LP mode between lines".
> The timing that needs to be passed to the crtc is therefore going to
> be based on the DSI link rate (converted to pixels) with increased
> blanking periods.
>=20
> I guess there are similarities with Media Controller and V4L2 here. A
> typical chain there could be:
>  sensor -> scaler -> crop -> CSI-2 receiver.
> The format on each of those links may be different, but the chain as a
> whole needs to be valid. Media Controller largely relies on userspace
> to configure all links, but with a DRM chain that isn't really an
> option as it's expected that the display chain configures itself.

Also, the userspace has no concept of media sub-devices in DRM, so it
just sets the mode on the whole DRM/KMS device, unlike what v4l2 does.
In v4l2, afaik, if you ended up with the above scenarios it would just
be rejected when you set the format on the link, letting the userspace
figure it out. We can't really do that here

Maxime

--fouajuiw7nltbl6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYPAE3gAKCRDj7w1vZxhR
xXwwAQCLzFWsk0QoCBCoXwyAR8NSp+50Ax8CMS4xUHrDrmqc1AEAtfnU5kuwcgOm
/z7ZQCoe6SgZzvR5FwcccRnyndva0Ag=
=mpbl
-----END PGP SIGNATURE-----

--fouajuiw7nltbl6q--
