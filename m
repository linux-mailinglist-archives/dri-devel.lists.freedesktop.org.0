Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB994611C0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 11:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21056E3D6;
	Mon, 29 Nov 2021 10:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBB46E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 10:07:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C8A123200F3F;
 Mon, 29 Nov 2021 05:07:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 29 Nov 2021 05:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3KOTXV3qv9GxQw/rfxwbzVYwHTV
 tHs2q8B/dVNvxcmA=; b=H3eSDgZfUAvtwARBsZzJXwlE9DRAYSSIRcOX0NUL0+9
 uqJQ1KEmHuoUIw9iYBkNRKHEXxmpI2u6ZPxFvbCxzVVVeoL0wTzOVZvnhrLKWOLi
 wqzQAWonUT3xGDmIOKYRcnRrZUJbtDQCXk/OJyZuZrissuZu2cHtnwaYN2SQ04rv
 aeK9ATMNlfkwIjiX0r4DEbfKOXIYUrYVZB4D9miaZY9hJOvO4/UX1DyvkWwl6sDN
 crrnNQc4oVeFglAbRsY3hIBZNsgbfUkDg3/fG7gG2Ovt5+yna+gOasaR2BgGgOW3
 CUIzzamyMesdLqnCCqvB9pVZ7mwc1lIjDWH9eHaTAhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3KOTXV
 3qv9GxQw/rfxwbzVYwHTVtHs2q8B/dVNvxcmA=; b=fKAI5FE5BhHFJsQDAg9t8m
 WAfNKWBPeBDdEIeNLS5WDA4jVnwzB4hO3lckZQ3xZMGkyvzVrJjp1CR9S3AlPisA
 EpeustqI6ZFkwV+VAjzzAU0KbYoJIFGiTQXx7TSNAA3RU+T+PNJbvt+mua+uUh0N
 xQR2NnS9oXzS/gP+c/XdzeiNw5csiKF3VWOwuBo3l8BhjPUb3UghaKmY5lPc+JI2
 nJ+jqyh+Rh/Qlz6vPBXU7TVIkEE4PpuLm2MnIuMZheozgN4WWuyeiQ2cn30OLak3
 fkjvqyze2aYMJiHH1J25IKdx7YbTsnM5QyI3fvkvHIKKrXfQqLCSQdKuggEBf8dA
 ==
X-ME-Sender: <xms:b6akYfgRGYUYfO_7WmCSF7-BYMqLPP6Yi6Izc5IxM-eO3seE5yPgqw>
 <xme:b6akYcCSZxp9oREt4tztPKMfr5wEQYKP_SmCPqg7LbthH_roOexaPrcwc1eWxLKaJ
 KogJiUSfy2Ym-_XkW8>
X-ME-Received: <xmr:b6akYfFTUgztPrCFn-C2b6fKpHQLvSppMl5pNxKU9LkSi_wZoPpiEMuH_fOHy9d4Li_C3odB43DlYxgZFXsIGTaoQPACs4ilq1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:b6akYcSvh9vMJasQg4slYrfenfzY3vFv7Ii35TkhzLRbWmSPMBSxdQ>
 <xmx:b6akYcyyo50Lz_Vog7uWaHw_dPXKY4lzDUnRU5hujbdGek_KodnSQw>
 <xmx:b6akYS4FTW6LWL2PrWNnVHOtmWZTnqFtlRGjB3_Y2Ajkpft55kgU9w>
 <xmx:b6akYbkacmZfzmPJVmEK_FGEialo7ASCEMiAql0G5-bJA4pjcoBqMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 05:07:42 -0500 (EST)
Date: Mon, 29 Nov 2021 11:07:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 00/13] drm: Add generic helpers for HDMI scrambling
Message-ID: <20211129100741.pqxyvu5wcti7ntck@houat>
References: <20211118103814.524670-1-maxime@cerno.tech>
 <YZfKSmWs3n8zRUd0@phenom.ffwll.local>
 <20211126154349.aksr4kjhvj3xueir@houat>
 <YaEVirocULCwNNnZ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="76fknv6s5i2d7plg"
Content-Disposition: inline
In-Reply-To: <YaEVirocULCwNNnZ@phenom.ffwll.local>
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


--76fknv6s5i2d7plg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2021 at 06:12:42PM +0100, Daniel Vetter wrote:
> On Fri, Nov 26, 2021 at 04:43:49PM +0100, Maxime Ripard wrote:
> > Hi Daniel,
> >=20
> > On Fri, Nov 19, 2021 at 05:01:14PM +0100, Daniel Vetter wrote:
> > > On Thu, Nov 18, 2021 at 11:38:01AM +0100, Maxime Ripard wrote:
> > > > This is a follow-up of the work to support the interactions between=
 the hotplug
> > > > and the scrambling support for vc4:
> > > >=20
> > > > https://lore.kernel.org/dri-devel/20210507150515.257424-11-maxime@c=
erno.tech/
> > > > https://lore.kernel.org/dri-devel/20211025152903.1088803-10-maxime@=
cerno.tech/
> > > >=20
> > > > Ville feedback was that the same discussion happened some time ago =
for i915,
> > > > and resulted in a function to do an full disable/enable cycle on re=
connection
> > > > to avoid breaking the HDMI 2.0 spec.
> > > >=20
> > > > This series improves the current scrambling support by adding gener=
ic helpers
> > > > for usual scrambling-related operations, and builds upon them to pr=
ovide a
> > > > generic alternative to intel_hdmi_reset_link.
> > >=20
> > > Out of curiosity, can we rebuild intel_hdmi_reset_link on top of thes=
e?
> > > Always better to have two drivers to actually show the helpers help, =
than
> > > just one.
> >=20
> > Unfortunately, I don't have any Intel system I can test it on, and it
> > looks like the changes wouldn't be trivial.
> >=20
> > Maybe we can use dw-hdmi instead?
>=20
> Hm I guess so, maybe Ville can be motivated. Just figured since this seems
> at least inspired by i915 code.

It's not really the conversion to the new helper that I suspect would be
hard to do, but rather the usage of the connector state that we do, and
the scrambling computation, and how it's all tied together in i915.

It seems to be fairly different from drivers that just rely on the
atomic helpers, and I'm not really confident about changing that. But
yeah, I guess I can give it a try and rely on the CI.

Maxime

--76fknv6s5i2d7plg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaSmbQAKCRDj7w1vZxhR
xbqiAQD+4uAF5/+s0h2kPZ+rEkyJGeSnGuj7IedWDsIYU6sa/AD/fTvXttIkAzPk
63q0gtVopD+C0ZmpY70wHK58QifedQI=
=ayaN
-----END PGP SIGNATURE-----

--76fknv6s5i2d7plg--
