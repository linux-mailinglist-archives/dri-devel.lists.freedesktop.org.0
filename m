Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FEC4E2306
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 10:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2350310E2C2;
	Mon, 21 Mar 2022 09:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413F210E2E9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 09:12:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D37CF5C0127;
 Mon, 21 Mar 2022 05:12:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 21 Mar 2022 05:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=yk+nKpl1q7kSZQ0Ga4s6cX3UW3mqfycxEk/hbr
 UrqjA=; b=tmBZLNYeUIr+1OS4X+l580Np02SDwdmZAkLq7BaZTqKx4CYSflht2Y
 2vY9O0hLhund1WtFWicyL9AlUouCJpEzF0our6MgPUHGfbEfzN8Sw+Jvp4Llqv8J
 hrLdnY/Zl3qsZ9ZNJpeDhXPjGHuZ5kN8xYrR669a8Qz6taSdx2LpNlCqpLP5h+h1
 3FXEb4nVL/KkNXO+0F2X5aA1OEsyTTOetLs9M5NGmB+crUMZVUljwzp1u+bd5Un4
 QSsTmthEOedQU0IuVjeX7u9IB198nUeLnjJ+c3CUKeyWl6i6di9voSRZ4QlNe95n
 /FgUwVZhj1sPg+zL81esajn3L4mxD/jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yk+nKpl1q7kSZQ0Ga
 4s6cX3UW3mqfycxEk/hbrUrqjA=; b=OHwE84h3b8iy5JgHvWJCL+WbZIVXUDo5p
 Anl4bP0H2v0DZFIRFCb4UjK8LI9OoMRaYsfiFQGIgi/nUk7QRP5jf5CCjLtzVZJ8
 9W3cKb85OuGyinPF1py1So0c+m3yK14VEj0JcrS8/jUA6RpQ6PjgBctGBQkbQ7Nv
 fwIUmtkeGeFIDrAIg7dp348ARfpzBOAAuSDcSsgC8yQIJifBj7Qw22kitxMikyb4
 K1k1For9j++/mX/3J218iyzqsKEstfRQAR4DCQ7rp4cP0BOzR77wo9E5bEEamJtE
 qc6G1Hf0pwfBrd4j6BZ2kShe857mjWNAfcPzI3kG36+iy1kMejl/g==
X-ME-Sender: <xms:iEE4YmDBLTBHDUhclVJviokp7ntaV0DOqxWy1XZxFH0Rk5fiQ2IWhQ>
 <xme:iEE4YgiyrWuDdnbZkrx4_38UQyXf5v9zatDbEEWfeLK3GoDYfz-GkAYnbnG8JDeVD
 sN0C4CSx_z8EdxhPjU>
X-ME-Received: <xmr:iEE4YplVqO1OJDLaRbBXMOMbcPYeBlg35gGv5cDDwx9eky3BgQbDhpDpfAr5YyvYdHXVjiDYakIeCs8lBB2Ma7ijKafuNHzwHzJChPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucdnkfhovfculdeitddmnecujfgurhepfffhvffukf
 hfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceo
 mhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepleekgeehhf
 dutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieehgedunecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
 hordhtvggthh
X-ME-Proxy: <xmx:iEE4YkxUg0lVNp7aLgkfPhqEG4DM1O0K6MYNOZ1Y87HkY_pbsV7DvQ>
 <xmx:iEE4YrTw-iSqQW1t4_VCiw-S6o6zmagB9aRq2XLBrk8bP4aoEIOeMA>
 <xmx:iEE4YvbQ8LHvZk0KpIhyuMOQJSwZBHlvUrwWWEE1_h4mAMw4mwnShDJuog>
 <xmx:iEE4YmHWawlOkLPlgyb0B27BR7bjfVAZG4U_L4151FITfp1BOIbbqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 05:12:39 -0400 (EDT)
Date: Mon, 21 Mar 2022 10:12:36 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <20220321091236.5rcottkhtztvijpl@houat>
References: <20220318160249.126431-1-paul.kocialkowski@bootlin.com>
 <20220318161847.ezi6yat4on7rvfdf@houat>
 <YjSx1rNLTh/L3MQQ@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5mrpx3bhcyhfcg74"
Content-Disposition: inline
In-Reply-To: <YjSx1rNLTh/L3MQQ@aptenodytes>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5mrpx3bhcyhfcg74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 05:22:46PM +0100, Paul Kocialkowski wrote:
> On Fri 18 Mar 22, 17:18, Maxime Ripard wrote:
> > On Fri, Mar 18, 2022 at 05:02:49PM +0100, Paul Kocialkowski wrote:
> > > While bridge/panel detection was initially relying on the usual
> > > port/ports-based of graph detection, it was recently changed to
> > > perform the lookup on any child node that is not port/ports
> > > instead when such a node is available, with no fallback on the
> > > usual way.
> > >=20
> > > This results in breaking detection when a child node is present
> > > but does not contain any panel or bridge node, even when the
> > > usual port/ports-based of graph is there.
> > >=20
> > > In order to support both situations properly, this commit reworks
> > > the logic to try both options and not just one of the two: it will
> > > only return -EPROBE_DEFER when both have failed.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > Fixes: 80253168dbfd ("drm: of: Lookup if child node has panel or brid=
ge")
> > > ---
> > >=20
> > > Changes since v1:
> > > - Renamed remote to node;
> > > - Renamed helper to find_panel_or_bridge;
> > > - Cleared bridge pointer early;
> > > - Returned early to make the code more concise;
> > >=20
> > > ---
> > >  drivers/gpu/drm/drm_of.c | 98 ++++++++++++++++++++------------------=
--
> > >  1 file changed, 49 insertions(+), 49 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > > index 9d90cd75c457..63137c833b7a 100644
> > > --- a/drivers/gpu/drm/drm_of.c
> > > +++ b/drivers/gpu/drm/drm_of.c
> > > @@ -219,6 +219,28 @@ int drm_of_encoder_active_endpoint(struct device=
_node *node,
> > >  }
> > >  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
> > > =20
> > > +static int find_panel_or_bridge(struct device_node *node,
> > > +				struct drm_panel **panel,
> > > +				struct drm_bridge **bridge)
> > > +{
> > > +	if (panel) {
> > > +		*panel =3D of_drm_find_panel(node);
> > > +		if (!IS_ERR(*panel))
> > > +			return 0;
> > > +		else
> > > +			*panel =3D NULL;
> >=20
> > You don't need the else branch here, we already cleared panel in
> > drm_of_find_panel_or_bridge
>=20
> I think we do, because of_drm_find_panel doesn't return NULL when an error
> happens but PTR_ERR(), so we need to clear it to keep up with previous
> expectations.

Ah, right. We should remove the else then, checkpatch complains about it.

Maxime

--5mrpx3bhcyhfcg74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjhBhAAKCRDj7w1vZxhR
xY30AP48CB5lqRqbdnOS6zvsuJf8aSBYpBIhroE2fAQCOUmvtwD+LPaP2ISCRzgk
ZZKzRmLYAorwUG84gEHQLYeajML57AI=
=J2Z3
-----END PGP SIGNATURE-----

--5mrpx3bhcyhfcg74--
