Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493D83BD9D7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 17:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DA66E4E6;
	Tue,  6 Jul 2021 15:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761346E4E6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 15:13:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0776E5C0371;
 Tue,  6 Jul 2021 11:13:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Jul 2021 11:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=6hK8VK66dGRzKZvXBxvJ82q/V44
 YZUaq40mOAaWvdCw=; b=wUVRAm9Ee3+jRzNfSXOTUCgyCRh8ehGC2AuRqxcFEnA
 GAERPMFRvTfPoS7unXrDB56rDwTUfvXP61In8O7w04tKLjB1Mb7wh9IaQmCkjzlp
 ucVle3c7Rr0p1232YRyvZdnYvEWBXwQs3MZS4DWjWcWRTy02Gv/d1bn+A5pev7P+
 XFSkmsh9P/uU4uDM6VxsgvYnLPSc7iXXxdKYtSqbpThl2Hz5wW8ZSWpzK8BAqeur
 VTQxkvpCJdjtvweXgafQlE8AaFKGG+uVai+6QwN+PssS9j3vA8/4aSCJ3kAKS2Wq
 t5xnKyKnT7o9NtaWa9pM75BSsQYSV01ADVKykHRsQMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6hK8VK
 66dGRzKZvXBxvJ82q/V44YZUaq40mOAaWvdCw=; b=ptlxDbFpD4s9Nhe36PzpXf
 iRyzMZ8Vd3XIctbGrI7YjR/GFpxzZaWTIn5Lp4aEX2gXICFIZi67Pec0cxEHRCmX
 eC5PmY1IwQ17nZtBYOp8JDLTotpEYW+mcGM6VoQ3Gq7XxcYTKhbLQqnA3jVYnKzl
 KkqoymDw6dm+TQA1PqrtJZ+0QBTV+0iRiA70PxHSiBTtAQtEOpGTenzPFiPjgfWn
 1rCToURDnSRnr9ENnbLiKN92d4oasUuD+BeJdHr0vqYGWMz6rRcAeKNfLmShpoU7
 gH8EPERQybimuLk6THgF27iriwdV2UeZb3vR74u0GPC5WTp56jyzWM+/Df4xiZLg
 ==
X-ME-Sender: <xms:E3PkYBPCymf5Wa-_QAdVnDMm8omRcbLgOQJd_zRrN0xf8lvbtuhZng>
 <xme:E3PkYD_QKwcQj7r3iv7j1w5hqchYj8kO2fmHbTcaGMvnxCMipK6kvhWGC6XvqqrNb
 TJ0KcoLW_uBvmSxwHU>
X-ME-Received: <xmr:E3PkYASdNP5uap3O0E-k1LtBGeaam0U_pilKKO_kmoExMsMYwC3K8nAjOwjfjobhTAYBNHsZG9pFA7EIEkNZJPwDlB7OEmtagsYD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddtgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:E3PkYNveC_7C_iR5uCwTxhO0y3IaS3pWqQzvTEEU_PhfQkp1mJjvCg>
 <xmx:E3PkYJdpbm0ZvnyXB_VUIG7Y2S8TErvm4NuG4YA_mcHfusLnhHEFjA>
 <xmx:E3PkYJ07-5RaxYo16DhD4vCFI7R9TqfYp4Fu4r8U5qZZ0HQtqjpq0Q>
 <xmx:FXPkYN6XwkRorJ5VMPRCdrKjxrZ1Ni8rf3lAVrLj8SfQJqasAJPOvg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 11:13:23 -0400 (EDT)
Date: Tue, 6 Jul 2021 17:13:20 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: Questions over DSI within DRM.
Message-ID: <20210706151320.kwn4dwu6buvy4isa@gilmour>
References: <CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com>
 <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
 <CAPY8ntDRKcq0V_q04q25_EemsBiT4xHKNv1260Fr8kKGtZDpxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="feemxdzczzvis6ep"
Content-Disposition: inline
In-Reply-To: <CAPY8ntDRKcq0V_q04q25_EemsBiT4xHKNv1260Fr8kKGtZDpxw@mail.gmail.com>
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


--feemxdzczzvis6ep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Mon, Jul 05, 2021 at 04:36:25PM +0100, Dave Stevenson wrote:
> Hi Laurent.
>=20
> Thanks to you, Jani, and Jagan for your replies.
> I'm replying to Laurent's email as it has the greatest number of
> discussion points.
>=20
> Noted that NWL DSI and Exynos DSI have undergone the conversion to
> bridges - hopefully I can take those as vague examples.
>=20
> On Fri, 2 Jul 2021 at 17:42, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Dave,
> >
> > (Expanding the CC list a bit)
> >
> > On Fri, Jul 02, 2021 at 12:03:31PM +0100, Dave Stevenson wrote:
> > > Hi All
> > >
> > > I'm trying to get DSI devices working reliably on the Raspberry Pi,
> > > but I'm hitting a number of places where it isn't clear as to the
> > > expected behaviour within DRM.
> >
> > Not a surprise. I dread reading the rest of this e-mail though :-)
> >
> > > Power on state. Many devices want the DSI clock and/or data lanes in
> > > LP-11 state when they are powered up.
> >
> > When they are powered up, or when they are enabled ?
>=20
> Generally powered on, so it wants to be in before pre_enable.
>=20
> Taking SN65DSI83 as an example, the datasheet section 7.4.2
> Initialization Sequence says
> "After power is applied and stable, the DSI CLK lanes MUST be in HS
> state and the DSI data lanes MUST be driven to LP11 state"
>=20
> It was discussed when Marek's was developing the merged driver that it
> seems to be happy to violate this initialisation sequence by starting
> video on the data lanes before configuring the DSI83, but is that more
> luck than anything else?
>=20
> Reading the functional spec for Toshiba TC358762 (DSI to DPI bridge
> used on the Pi 7" DSI panel), it says:
> "1.HW:  Put  D-PHY  data  lane  0 to  ULPS  state
>   a)  D-PHY  clock  lane  must  continue  to  supply  clock  for
> minimum  20  clocks  before put  the  clock  lane  to  idle
> 2. HW:  Enable  Clock  Lane  and  Data  Lane  0 D-PHYs
> 3. HW:  Disable  Data  Lane  1 D-PHY
> 4. HW:  Transition  to  Operation  mode  when  Data  Lane  0 D-PHY  is
>  not  in  ULPS  state.
>   a) D-PHY clock lane must supply before Data Lane 0 D-PHY changes to LP =
state
>   b) Host must wait minimum 5200 HSBCLK clock for CORE2 Power to be
> stable before transfer any DSI packets."
>=20
> So there we have a timing constraint from pushing the clock lane into
> HS before we can do anything else. Quick calcs do appear to say this
> is around 0.5msecs, so possibly it can be ignored.
>=20
> > > With the normal calling sequence of:
> > > - panel/bridge pre_enable calls from connector towards the encoder.
> > > - encoder enable which also enables video.
> > > - panel/bridge enable calls from encoder to connector.
> > > there is no point at which the DSI tx is initialised but not
> > > transmitting video. What DSI states are expected to be adopted at each
> > > point?
> >
> > That's undefined I'm afraid, and it should be documented. The upside is
> > that you can propose the behaviour that you need :-)
>=20
> Can we reduce it to one behaviour that is valid for all devices? I
> suspect we need at least some set of options :-/

One thing to consider as well is that we might not be able to even
implement the proper behavior due to lack of documentation (or just that
the hardware cannot implement it).

If we multiply the callbacks to accommodate for any panel and downstream
bridges power sequence, in order to properly support any combination
then all drivers will need to implement all the hooks properly (and I'm
guessing we would have some sequence variation too). Chances are we will
end up with a combinatorial explosion of sequences, and this will be a
nightmare to test. And that's again assuming that we can implement them
in the first place.

> > > On a similar theme, some devices want the clock lane in HS mode early
> > > so they can use it in place of an external oscillator, but the data
> > > lanes still in LP-11. There appears to be no way for the
> > > display/bridge to signal this requirement or it be achieved.
> >
> > You're right. A loooong time ago, the omapdrm driver had an internal
> > infrastructure that didn't use drm_bridge or drm_panel and instead
> > required omapdrm-specific drivers for those components. It used to model
> > the display pipeline in a different way than drm_bridge, with the sync
> > explicitly setting the source state. A DSI sink could thus control its
> > enable sequence, interleaving programming of the sink with control of
> > the source.
> >
> > Migrating omapdrm to the drm_bridge model took a really large effort,
> > which makes me believe that transitioning the whole subsystem to
> > sink-controlled sources would be close to impossible. We could add
> > DSI-specific operations, or add another enable bridge operation
> > (post_pre_enable ? :-D). Neither would scale, but it may be enough.
>=20
> I haven't thought it through for all generic cases, but I suspect it's
> more a pre_pre_enable that is needed to initialise the PHY etc,
> probably from source to sink.
> If the panel/bridge can set a flag that can be checked at this point
> for whether an early clock is required or not, I think that allows us
> to comply with the requirements for a large number of panels/bridges
> (LP-11 vs HS config for clock and or data lanes before pre_enable is
> called).
>=20
> pre_enable retains the current behaviour (initialise the chain from
> sink to source).
> enable then actually starts sending video and enabling outputs.

Flags indeed seem like a more contained option. Another one could be to
have a mipi_dsi_host to (for example) power up the clock lane that would
be called by default before the bridge's enable, or at the downstream
bridge driver discretion before that.

> When I discussed this briefly with Maxime there was a suggestion of
> using pm_runtime to be able to power up the pipeline as a whole. If
> the bridge driver can use pm_runtime to power up the PHY when
> required, then that may solve the issue, however I know too little of
> the details to say whether that is actually practical.

I'm not sure it was about this topic in particular. If I remember well
our discussion, this was about the vc4 driver that tries to circumvent
the framework and call the pre_enable and enable hooks itself because it
wasn't properly powered before and thus any DCS-related call by the
downstream bridge or panel would end up creating a CPU stall.

I suggested to use runtime_pm in the DCS related calls to make sure the
device is powered because there's no relation between the state of the
downstream bridge or panel and whether it can send DCS commands or not.
For all we know, it could do it at probe time.

> > > host_transfer calls can supposedly be made at any time, however unless
> > > MIPI_DSI_MSG_USE_LPM is set in the message then we're meant to send it
> > > in high speed mode. If this is before a mode has been set, what
> > > defines the link frequency parameters at this point? Adopting a random
> > > default sounds like a good way to get undefined behaviour.
> > >
> > > DSI burst mode needs to set the DSI link frequency independently of
> > > the display mode. How is that meant to be configured? I would have
> > > expected it to come from DT due to link frequency often being chosen
> > > based on EMC restrictions, but I don't see such a thing in any
> > > binding.
> >
> > Undefined too. DSI support was added to DRM without any design effort,
> > it's more a hack than a real solution. The issue with devices that can
> > be controlled over both DSI and I2C is completely unhandled. So far
> > nobody has really cared about implementing DSI right as far as I can
> > tell.
>=20
> :-(
>=20
> Thinking aloud, does having the option to set a burst link frequency
> from DT (or ACPI) have any issue for other platforms?
> Looking at the handling of MIPI_DSI_MODE_VIDEO_BURST in the various
> drivers, all except stm/dw_mipi_dsi-stm.c appear to take it as a "use
> all the defined timings, but drop to LP during blanking" option. The
> link frequency has therefore remained a property of the
> display/bridge.
> dw_mipi_dsi-stm.c cranks the PLL up by 20%, but I haven't followed
> through the full detail of the parameters it computes from there.

I don't see anything wrong with using link-frequency from the DT to
setup the burst frequency. It's what v4l2 has been using for a while
without any known (to me) drawback, and we're using the same of-graph
bindings, so it shouldn't be too controversial there.

> DSI and I2C controlled devices is yet another issue that I haven't
> even looked at.
> I think it's more that vc4 wants to ignore DSI should the DSI host
> node be enabled in DT, but there's no panel bound to it. One could say
> that is a DT error and tough luck, but from a user's perspective that
> is a bit harsh.

I guess the larger "issue" is that the tree in the DT is done following
the "control" bus, and Linux likes to tie the life cycle of a given
device to its parent bus. Both these decisions make sense, but they
interact in a weird way in some occurrences (like this one, or Allwinner
has an Ethernet PHY controlled through MMIO which end up in the same
case).

I wonder if using device links here could help though.

> > > As a follow on, bridge devices can support burst mode (eg TI's
> > > SN65DSI83 that's just been merged), so it needs to know the desired
> > > panel timings for the output side of the bridge, but the DSI link
> > > timings to set up the bridge's PLL. What's the correct way for
> > > signalling that? drm_crtc_state->adjusted_mode vs
> > > drm_crtc_state->mode? Except mode is userspace's request, not what has
> > > been validated/updated by the panel/bridge.
> >
> > adjusted_mode is also a bit of a hack, it solves very specific issues,
> > and its design assumes a single encoder in the chain with no extra
> > bridges. We should instead add modes to the bridge state, and negotiate
> > modes along the pipeline the same way we negotiate formats.
>=20
> So as I understand it we already have format negotiation between
> bridges via atomic_get_output_bus_fmts and atomic_get_input_bus_fmts,
> so is it possible to extend that to modes?
> Are you thinking bridge state that is owned by the framework, or by
> the individual bridge drivers?

atomic_check is made for that. I guess we could improve its call
sequence to each time a mode is modified along the bridge list we
restart the sequence until all components agree (or reject it entirely
if they can't), but I don't really see why we would need yet another
hook.

Maxime

--feemxdzczzvis6ep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYORzEAAKCRDj7w1vZxhR
xWCyAQDxE9OS6c3rTnGjBooGH0wd/6diO9puYf7Hggug9VLcSAD/aTDxFYpV1NV4
h+BD4Gluo21SGrcD2bhSWVDzHV0K3wQ=
=6e0f
-----END PGP SIGNATURE-----

--feemxdzczzvis6ep--
