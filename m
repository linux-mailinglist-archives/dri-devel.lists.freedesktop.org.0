Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 485CE1FC751
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085826EAB4;
	Wed, 17 Jun 2020 07:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1576E8BE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 15:05:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 31B065C00AB;
 Tue, 16 Jun 2020 11:05:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 16 Jun 2020 11:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+/Free3np84k0kBJDWVF1jSVMhN
 u9FRY1V3ChXa3w8c=; b=dsvQ4DphF2djb9iaYRtH9j4VQm7shqQLUk5XgA0Vt93
 2oVR+dcRcLKX9tAQzm/51Zr/WsRetYV4zAKdDIkGvuF5/92+l0hDyc4R5T3j3S5s
 0f/43NQqAiBMsI4JnDB9kuMSx5ECdOiaBR2sz9e3pOFOR8zVWUneOWT9Gkynk5rn
 6jK+jgYzW0WNEQXZUfKIJFEfEfvDDsSuyig18T18qtLNoxiEaAnbWv3V6K0dKAHg
 8SWSTsOl8Ivbp58Br2yjTLxc9eMyL3PYlkJtPfz8LzBF9Xa2JhAaMUAq3KmHqM5H
 rRarKnzBKK/Lc8N//p2eqN4RGVtr5OGtR+BE+mrnyJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+/Free
 3np84k0kBJDWVF1jSVMhNu9FRY1V3ChXa3w8c=; b=YfteQO+m0GL348X5GIWnSy
 9fs8PdyRFCR/bZqYXpD+IBG6ROAjSUPBs6XyhS85y5QtEOruOlWF8AgrL3IJnpA/
 GXsHBR44HS6367JtwebmBDHyzjBZzGRBUdaPEbRFAubNQQ4BjpFZuFdu69sKdk9Q
 GOdQB/1J1J+p1cHytU5yfHkk+qYqHoxI2qQJBIfkQNEPVDh9nv2iMf1iHgBYIFK0
 69S2qqQBZiGD0MiyzmTBqg6MfxE8s1K/DF2M2/659wZymeJQLBMa9GNBEO06zPX7
 F/FY/Zaz+UAoxmLs5ftIQJ8CCkPV44/TipaKpFccsTpRq8HnTFu4BJllgqE40B4w
 ==
X-ME-Sender: <xms:k9_oXo3iNZdgVrB0xb65jqVksRCtvsSQX_BIBRwkVGY3umwQ7b_A6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejtddgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:k9_oXjFAbjMjEA3tPARwNGHNQWQ34yMoLuy18PXLCKrUDU-qwi_B7Q>
 <xmx:k9_oXg6zKZb2uVVaeKcANbxOebLSfFsEJbgrKytYuYaoikiuFXy3eA>
 <xmx:k9_oXh09a-A9ZWJBme-hAE_5PDIIhj-QsUq5PcEH1ReT8jBfeMTbDQ>
 <xmx:nt_oXuPj6PyWLNQr86spA3S1nr2DsRPH56txu_vj7VrnOrfLpio4zg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92996328005A;
 Tue, 16 Jun 2020 11:04:51 -0400 (EDT)
Date: Tue, 16 Jun 2020 17:04:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 033/105] drm/vc4: crtc: Assign output to channel
 automatically
Message-ID: <20200616150449.xkgyxd6bwcp3cfkb@gilmour.lan>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <5186409a2b5d290b78f6b518a2eb8e407bf1e83e.1590594512.git-series.maxime@cerno.tech>
 <CADaigPXQ4fLyba3X1mtSnRZb-Z2HgJck_acbpLXGnaL0RqEXQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADaigPXQ4fLyba3X1mtSnRZb-Z2HgJck_acbpLXGnaL0RqEXQQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1662565227=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1662565227==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zmtci7znkd6b2wdu"
Content-Disposition: inline


--zmtci7znkd6b2wdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Wed, May 27, 2020 at 10:23:23AM -0700, Eric Anholt wrote:
> On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >  static int
> >  vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *stat=
e)
> >  {
> > -       int ret;
> > +       unsigned long unassigned_channels =3D GENMASK(NUM_CHANNELS - 1,=
 0);
> > +       struct drm_crtc_state *crtc_state;
> > +       struct drm_crtc *crtc;
> > +       int i, ret;
> > +
> > +       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> > +               struct vc4_crtc_state *vc4_crtc_state =3D
> > +                       to_vc4_crtc_state(crtc_state);
> > +               struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
> > +               bool is_assigned =3D false;
> > +               unsigned int channel;
> > +
> > +               if (!crtc_state->active)
> > +                       continue;
> > +
> > +               /*
> > +                * The problem we have to solve here is that we have
> > +                * up to 7 encoders, connected to up to 6 CRTCs.
> > +                *
> > +                * Those CRTCs, depending on the instance, can be
> > +                * routed to 1, 2 or 3 HVS FIFOs, and we need to set
> > +                * the change the muxing between FIFOs and outputs in
> > +                * the HVS accordingly.
> > +                *
> > +                * It would be pretty hard to come up with an
> > +                * algorithm that would generically solve
> > +                * this. However, the current routing trees we support
> > +                * allow us to simplify a bit the problem.
> > +                *
> > +                * Indeed, with the current supported layouts, if we
> > +                * try to assign in the ascending crtc index order the
> > +                * FIFOs, we can't fall into the situation where an
> > +                * earlier CRTC that had multiple routes is assigned
> > +                * one that was the only option for a later CRTC.
> > +                *
> > +                * If the layout changes and doesn't give us that in
> > +                * the future, we will need to have something smarter,
> > +                * but it works so far.
> > +                */
> > +               for_each_set_bit(channel, &unassigned_channels,
> > +                                sizeof(unassigned_channels)) {
> > +
> > +                       if (!(BIT(channel) & vc4_crtc->data->hvs_availa=
ble_channels))
> > +                               continue;
> > +
> > +                       vc4_crtc_state->assigned_channel =3D channel;
> > +                       unassigned_channels &=3D ~BIT(channel);
> > +                       is_assigned =3D true;
> > +                       break;
> > +               }
> > +
> > +               if (!is_assigned)
> > +                       return -EINVAL;
>=20
> I think this logic is just
>=20
> int matching_channels =3D unassigned_channels &
> vc4_crtc->data->hvs_available_channels;
> if (matching_channels) {
>   vc4_crtc_state->assigned_channel =3D ffs(matching_channels) - 1;
>   unassigned_channels &=3D ~BIT(channel);
> } else {
>   return -EINVAL;
> }

Thanks for that suggestion (and the others), it indeed works as expected.

> If you're changing the assignment of a channel, I think you're going
> to need to set state->mode_changed or something to trigger a full
> modeset, so we don't try to just rewrite the channel of an existing
> CRTC while scanning out.

Since we won't have any CRTC configuration done outside of atomic_enable
/ atomic_disable, can we really have a case where we would reallocate a
new channel to a CRTC without that CRTC being disabled / enabled?

Maxime

--zmtci7znkd6b2wdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXujfkQAKCRDj7w1vZxhR
xQm+AP9F9MIRdIiijjgN1Mb4ApZjJiIV3vUc+zN2siB+w5+gXAD+NrbAe75hbs1Y
t37PcJ+IJstdGHrCFC+4QRRYyhPxBgY=
=qtWX
-----END PGP SIGNATURE-----

--zmtci7znkd6b2wdu--

--===============1662565227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1662565227==--
