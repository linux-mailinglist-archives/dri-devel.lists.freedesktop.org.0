Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A95AC462F24
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 10:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583616EB0E;
	Tue, 30 Nov 2021 09:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDED6EB0E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:01:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C0AE5C0185;
 Tue, 30 Nov 2021 04:01:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 30 Nov 2021 04:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=yUUc8uVe56R/g2ZP/fuIA0ZROzN
 whFLIr4CmHfDDzdg=; b=hc1A5T1Ad/gnbyWIkQH1vrq0wjQjUaYf2LIePEAYd8j
 BIgaLc1dpUDMbx2qOq04PXVt/EhEhPIkiqFubZCoRVbAneDmrBYBkHZG9nMzD2P2
 NEQNnZTxLSBmM0VA0WBPZ+beb+pdc5NALVawiWfTqPugCies0+45VeT4R1A3HGEZ
 7Qtd8mKRGG5+Tr0VkXZDmwchyoLIqBX8KN95VY2QO9BUFDoyeTFmZEdqn7o5SXUj
 iQ6CuAr5tpZeTUr9ifIm51y13IVf5BPkt04Lnv0iCl8wEnqxOSteCPz1Jypt6E2A
 JRaeuB0k+wtl4O7YMCkQr2eDgTYXvjteCADFCcASC7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yUUc8u
 Ve56R/g2ZP/fuIA0ZROzNwhFLIr4CmHfDDzdg=; b=W1tXog39feAXAIinRoPz2t
 ZHjF+T0CbupmeM5kkueHCY2lxbmCtOFj1ueXp86/9AlWh3BZl2+4WixRmS/sAvmq
 RtOAOYv4ddPunhEv3WCJ9K5JhzeamJ1TxHOXu9+bpJPxbfFQdmUT7R2H7N8pXPQ2
 7Op7+XQRlTIgOG6rUdUcoCU0aDdQzyJ6C074yLes1pS0MpIs/n6TTi7v8w3sT2XH
 VYy4w46QMfU2VyBQMuCSssFhO+Q3L6GGTsKyhDDnoo7RlcS89OdAVmGXvuHJ2PQx
 yGdyNhpQ4dPxeFUD3ihaakERflZFsNekeF0rLDL3keIAgkyEUT+qRxz0ElHMSvrw
 ==
X-ME-Sender: <xms:S-ilYed0HdiaONfnw1jKcqgUy_wQI_qixyrboaXe_7LjHLHsA6_njw>
 <xme:S-ilYYNsfNr2fN5nW6Ic5JLc2WSQ4GF5Lq5BthYBFxcZxEoJ4cAzm_q7sSY5IrmAk
 -18zmr3UFuozM4PXy4>
X-ME-Received: <xmr:S-ilYfg9nGqZs4yoBXh8Kq0CVgz7ZtY0EO5PoBt2fEmqI2RguBduKc16k3Um3y8rmXrS4bqjdqcJBNFo9CCV19asbQ5DoZjoI5o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddriedtgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:S-ilYb-etjkCntTBpPhyCKJ9VXYL21Cxc60FQnx05u2BswNJzrDDsw>
 <xmx:S-ilYav1uNv72vhEsZFI4AYiAjj9tokY_BuVSqJOlgLz-LkH765v0Q>
 <xmx:S-ilYSHYAv_qusYCKIPHldFC0hW3x1-WJ5E70WKC-ZdkdFZIP1qgvA>
 <xmx:TOilYYCUNpY1af5SqTgsAz6LOoCGbdmyTRRKTodFtLqU5wJ1n-LsOg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Nov 2021 04:00:59 -0500 (EST)
Date: Tue, 30 Nov 2021 10:00:58 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 00/13] drm: Add generic helpers for HDMI scrambling
Message-ID: <20211130090058.im2nef6brtjyzkpp@houat>
References: <20211118103814.524670-1-maxime@cerno.tech>
 <YZfKSmWs3n8zRUd0@phenom.ffwll.local>
 <20211126154349.aksr4kjhvj3xueir@houat>
 <YaEVirocULCwNNnZ@phenom.ffwll.local>
 <20211129100741.pqxyvu5wcti7ntck@houat>
 <YaXg1ZsoS+aH3nB/@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wb7wfiobmixvcrus"
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


--wb7wfiobmixvcrus
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

Maybe I'm just panicking without any particular reason, I'll give it a
try and will let you know

Maxime

--wb7wfiobmixvcrus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaXoSgAKCRDj7w1vZxhR
xQPrAQCLkzPzLoMPd4hGarmps/uPSO2OvMea/ObR4smDB1VcfgEAvGwv++iNDcI3
/miy8Ks7FVnP6ZA/bgAJFYgts8p73Qg=
=1Wvl
-----END PGP SIGNATURE-----

--wb7wfiobmixvcrus--
