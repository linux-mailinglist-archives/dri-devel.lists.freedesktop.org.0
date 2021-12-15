Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E604759F6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 14:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ACF10E8F3;
	Wed, 15 Dec 2021 13:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C225A10E8F3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 13:51:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3D2A13200F72;
 Wed, 15 Dec 2021 08:51:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 15 Dec 2021 08:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=VLD2o6KRwPKN67qRiahEZCtrgaE
 6DQ7hVe4yp76s5GU=; b=H0YVo3y9vsj81tUWTsqq6ynEb2fBX5CxVmrLxJBaQ17
 n5aj4lcybAAVhKgI/a8/ivafCvBHeTZiPc0hKEyJTrisv4w1BR9S2GPA8MWjIacJ
 kWeuDH1ci5TignC62HiLkx0Fkzx7kKt0UWdJ8BQ/bEkB6e1iZY4TVYeZvuDCpZby
 PDDHtHL4BtGXeC6dQ4RcHf6gf2cGb4nP6gH3MSGA+qJgZQ2HOYO+NJjBtzbxEU6s
 ZcGJRhJWKyOHrw/V9hSnoTkfseefetkLou2MQMarM4cLEQ0vcz+drZAK45Nw5XVd
 +bzMmoYS2HQCiIzQHd1wd4ORZQrqzFC+9Fuvy7qiAMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VLD2o6
 KRwPKN67qRiahEZCtrgaE6DQ7hVe4yp76s5GU=; b=ENMt960x05taVfBP35FjRO
 dHORxcaVchuSvwGdAYGDW2CLXt+NCMh57pgYMmgil7WqkRrO4s7ldI8Ht2NU6r4U
 JMRwtgM0Beml0OOVBabk5MD3zxeNgujpsTltenjk6GROGyXbcs3n1hBJjwSR75Po
 n7F+bmsU2GWbq3aKJkGlmRcxBZUg+04GuHYnFjHXwTMKAIsZA6no6xvlOTs/ExvX
 CbERq5zYy5ucrTnZWGZ7ebhy/wtl0m/GvCrUoWwuzRNeNDi69Q7yGcGx7zvaB33V
 y1etYxvXGx60/R05d+KK7ZqsDBhOuD0xcN8+cqMwYSL3aRwTYS+RHRBFZJU2ox2Q
 ==
X-ME-Sender: <xms:2fK5YVYr-bBTdT6rPNdu5Y9CRhEK6QR3LmBCyNIkK8JGda-9xGtaEA>
 <xme:2fK5YcbTRAZHp9-wOhKJzC1swqZlUOV3tNlVtNXdeYTkrVeXD_8IdlFVhbae7ado_
 qPX4yudF-eNK_Vr6vU>
X-ME-Received: <xmr:2fK5YX9nemfxxBQ3AH4s7G34YK1e8l7iZYSibPzX7vKTziqPEeCeBttTLNMsmLDUAQeS5J0HrmvJcvs48q5XhhlPoVT66Az85xGogxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2fK5YTqXEdiXhcAYbAPNZ3ePdnlY1-Oru1vm9qNZxSKnvY4opla0jg>
 <xmx:2fK5YQpEF788-20totYFsgJerfxC2lg1htdNIxuI7BUpqSyYULKJ7A>
 <xmx:2fK5YZSQJyrMktl_KQPiDA-zg_roVbOuqYI5MJre1F8Lp465zdtqtQ>
 <xmx:2fK5YcctHvgRv-LWzIejBaCqUN6Eoc4dA-na8YO6-iJB6s8h6Yfyqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 08:51:20 -0500 (EST)
Date: Wed, 15 Dec 2021 14:51:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 00/13] drm: Add generic helpers for HDMI scrambling
Message-ID: <20211215135118.skc7xew25s6voean@houat>
References: <20211118103814.524670-1-maxime@cerno.tech>
 <YZfKSmWs3n8zRUd0@phenom.ffwll.local>
 <20211126154349.aksr4kjhvj3xueir@houat>
 <YaEVirocULCwNNnZ@phenom.ffwll.local>
 <20211129100741.pqxyvu5wcti7ntck@houat>
 <YaXg1ZsoS+aH3nB/@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ncbmmgmki6dhxtyv"
Content-Disposition: inline
In-Reply-To: <YaXg1ZsoS+aH3nB/@phenom.ffwll.local>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ncbmmgmki6dhxtyv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 09:29:09AM +0100, Daniel Vetter wrote:
> On Mon, Nov 29, 2021 at 11:07:41AM +0100, Maxime Ripard wrote:
> > On Fri, Nov 26, 2021 at 06:12:42PM +0100, Daniel Vetter wrote:
> > > On Fri, Nov 26, 2021 at 04:43:49PM +0100, Maxime Ripard wrote:
> > > > Hi Daniel,
> > > >=20
> > > > On Fri, Nov 19, 2021 at 05:01:14PM +0100, Daniel Vetter wrote:
> > > > > On Thu, Nov 18, 2021 at 11:38:01AM +0100, Maxime Ripard wrote:
> > > > > > This is a follow-up of the work to support the interactions bet=
ween the hotplug
> > > > > > and the scrambling support for vc4:
> > > > > >=20
> > > > > > https://lore.kernel.org/dri-devel/20210507150515.257424-11-maxi=
me@cerno.tech/
> > > > > > https://lore.kernel.org/dri-devel/20211025152903.1088803-10-max=
ime@cerno.tech/
> > > > > >=20
> > > > > > Ville feedback was that the same discussion happened some time =
ago for i915,
> > > > > > and resulted in a function to do an full disable/enable cycle o=
n reconnection
> > > > > > to avoid breaking the HDMI 2.0 spec.
> > > > > >=20
> > > > > > This series improves the current scrambling support by adding g=
eneric helpers
> > > > > > for usual scrambling-related operations, and builds upon them t=
o provide a
> > > > > > generic alternative to intel_hdmi_reset_link.
> > > > >=20
> > > > > Out of curiosity, can we rebuild intel_hdmi_reset_link on top of =
these?
> > > > > Always better to have two drivers to actually show the helpers he=
lp, than
> > > > > just one.
> > > >=20
> > > > Unfortunately, I don't have any Intel system I can test it on, and =
it
> > > > looks like the changes wouldn't be trivial.
> > > >=20
> > > > Maybe we can use dw-hdmi instead?
> > >=20
> > > Hm I guess so, maybe Ville can be motivated. Just figured since this =
seems
> > > at least inspired by i915 code.
> >=20
> > It's not really the conversion to the new helper that I suspect would be
> > hard to do, but rather the usage of the connector state that we do, and
> > the scrambling computation, and how it's all tied together in i915.
> >=20
> > It seems to be fairly different from drivers that just rely on the
> > atomic helpers, and I'm not really confident about changing that. But
> > yeah, I guess I can give it a try and rely on the CI.
>=20
> Hm yeah if wiring through connector state to the right places is real work
> then skip the conversion. But I thought i915 modeset code has also gone
> through some of the state rollout that you've done for atomic helpers.

I kind of fell into a rabbit hole with this.

I looked at other drivers and which one I could convert too. Tegra was
easy enough, but dw-hdmi was more interesting.

dw-hdmi also has YUV output, and the output format also impacts the TMDS
rate and thus whether the scrambler needs to be enabled or not.

In parallel, I also worked on the vc4 HDMI YUV output, trying to mimic
what i915 is doing.

However, the requirements around which YUV output and bpc we support are
a bit non-trivial, and I think it should be part of some helpers to
avoid as much as possible someone getting it wrong.

For reference, i915 is starting with the highest bpc count it can, and
tries either RGB or YUV420 for that bpc count. If any succeeds, we stop
there, otherwise we repeat with a lower bit count.

The iteration over the available bpc and formats should be easy enough,
we would just need to have a bit field with supported bpc values and
formats and be done with it.

The part that would tell if the sink supports the formats and bpc can be
generic as well since it's part of the EDID and we parse it already.

However, one of the limitation we have to take into account is also the
maximum TMDS rate the controller can achieve, and thus if we could
output the TMDS clock for a bpc, format and mode triplet.

So, if we were to sum up, we'd need:

  - One bitfield for the formats supported by the connector (redundant
    with ycbcr420_allowed?)
  - One bitfield for the bpc supported by the connector
  - One field to store the maximum TMDS clock the connector can achieve

Then, in drm_connector_state, we'd have in addition to what we have so
far the format to output for a given commit.

Or maybe it's not worth the trouble and I should just stop trying to
make this a helper?

Maxime

--ncbmmgmki6dhxtyv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbny1gAKCRDj7w1vZxhR
xVblAQDpDCQLj8SLs3s6zQ3GD9tH2HoqT9jOBrcsZGz8uSHGfgEAwvkEsc4iBhfb
txHNYwE2hpla1xPaoKwqGFWrf9Z9jgg=
=h3Er
-----END PGP SIGNATURE-----

--ncbmmgmki6dhxtyv--
